Received: from [209.85.128.184] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J4HU5-0007cJ-NP
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Dec 2007 16:02:21 +0100
Received: by fk-out-0910.google.com with SMTP id 18so1906029fks.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Dec 2007 06:57:32 -0800 (PST)
Received: by 10.82.140.20 with SMTP id n20mr5355258bud.27.1197903451492;
	Mon, 17 Dec 2007 06:57:31 -0800 (PST)
Received: from ?192.168.20.166? ( [194.79.8.34])
	by mx.google.com with ESMTPS id b17sm17682798fka.2007.12.17.06.57.30
	(version=SSLv3 cipher=OTHER); Mon, 17 Dec 2007 06:57:30 -0800 (PST)
Date: Mon, 17 Dec 2007 17:02:49 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <828321445.20071217170249@gmail.com>
To: Andy Wilcox <andy@protium.com>
In-Reply-To: <47668695.5010701@protium.com>
References: <4765E992.2040805@protium.com>
	<4710722265.20071217130911@gmail.com>
	<47668695.5010701@protium.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: RFC: Renaming uboot-utils
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Dec 2007 15:02:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Andy,

[cc'ed back to the list]

Monday, December 17, 2007, 4:24:21 PM, you wrote:

> Hi Paul, I appreciate the extra eyes.
>>
>>   Yeah, all this discussion became rather confusing. To understand
>> what's it all about, a careful look at the commit was required, and
>> that uncovered few botched things:
>>
>> --- packages/uboot/u-boot-utils_1.2.0.bb        64396fa43c9fcef1ed1cd3ae82a49d140febbbd0
>> +++ packages/uboot/u-boot-utils_1.2.0.bb        64396fa43c9fcef1ed1cd3ae82a49d140febbbd0
>>
>> +DEPENDS_openprotium = "mtd-utils"
>>
>>    Think again - does u-boot-utils require mtd-utils headers or tools
>> during compile-time? Moreover, is it required for openprotium only?
>>
>> +SRC_URI_append_openprotium = " \
>> +        file://fw_env.c.patch;patch=1 \
>> +        file://tools-Makefile.patch;patch=1 \
>> +        file://env-Makefile.patch;patch=1 \
>> +        file://fw_env.config"
>>
>>    What so special of these patches that they apply only to
>> openprotium?
>>
>>   
> Building fw_setenv does require mtd-utils at compile time to pick up 
> certain headers.

  Hm. Can't it be really built against just kernel headers? Pity, but
ok.

> OP is the only distro that currently needs u-boot-utils (for fw_setenv,
> a target
> utility).  I was trying to bend that out of the way: this package won't do
> anything if you aren't building OP.  But perhaps that was wrong - I should
> always built that utility, and you can use this package or not.  Is the
> latter
> way the right OE way?

  Yes, I'd say the right way for mainline OE is to use machine/distro
overrides very sparingly, in selected places only. OE provides
flexible overrides mechanism to address special needs a vendor may have
to build its product per its requirements, but such overrides better live
in vendor trees/overlays. For mainline OE, I'd say it's better to err
on generality, than create complex and non-maintainable overrides maze
(an example is OPIE which risked removal from OE due to this, and by
now has been almost completely cleared off from any
machine-specific hacks).

>> +EXTRA_OEMAKE_openprotium = "CROSS_COMPILE=${TARGET_PREFIX}"
>>
>>    Overrides above are worth privilege of doubt, but this one doesn't
>> need it: doing things like this in the OE mainline is rather incorrect
>> behavior to all other projects/users.
>>   
> Yeah, sorry - this is a remnant from the (broken) way the old package
> worked.  I should have caught that.
>> --- packages/tasks/task-base.bb 784db9539c99a3dfc0ce43cc4b61f9cd5eba3b27
>> +++ packages/tasks/task-base.bb 7a9b59f5510daa79b732e48d67445e1d5ebc4c81
>>  RDEPENDS_task-base-uboot = "\
>> -    uboot-utils"
>> +    u-boot-utils-native"
>>
>>      More attention could have been spent here too - non-native
>> package *cannot* RDEPENDS on native, this is one of abort conditions
>> in insane.bbclass. Someone who added the original line thought that
>> uboot-utils is actually what its name suggests. When you'll be fixing
>> it, don't forget about this:
>>   
> Perhaps the MACHINE|DISTRO_FEATURES uboot should just
> go away?  It was only needed to make the native mkimage program,
> which really should be a kernel DEPENDS anyway.  Sound
> reasonable?

  Let's hear Rod Whitby speak up, AFAIR, he added those features. But
as far as I understand, no, they should be there, and are the way to
add a particular bootloader support to *any* distro. Have a look at
apex and redboot support at the same place. So, if you say that your
machine has u-boot as bootloader, you'll get utils to manage it in the
image. Ditto for other bootloaders.

[]


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



