Received: from [66.249.92.169] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J4Dq3-0002c0-LN
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Dec 2007 12:08:47 +0100
Received: by ug-out-1314.google.com with SMTP id i24so1685032ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Dec 2007 03:03:59 -0800 (PST)
Received: by 10.67.92.20 with SMTP id u20mr3538019ugl.71.1197889434190;
	Mon, 17 Dec 2007 03:03:54 -0800 (PST)
Received: from ?192.168.20.166? ( [194.79.8.34])
	by mx.google.com with ESMTPS id a37sm17308283fkc.2007.12.17.03.03.51
	(version=SSLv3 cipher=OTHER); Mon, 17 Dec 2007 03:03:52 -0800 (PST)
Date: Mon, 17 Dec 2007 13:09:11 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <4710722265.20071217130911@gmail.com>
To: Andy Wilcox <andy@protium.com>
In-Reply-To: <4765E992.2040805@protium.com>
References: <4765E992.2040805@protium.com>
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
X-List-Received-Date: Mon, 17 Dec 2007 11:08:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Andy,

Monday, December 17, 2007, 5:14:26 AM, you wrote:

> On Sat, 15 Dec 2007 14:14 "Leon Woestenberg" 
> <leon.woestenberg@gmail.com> wrote:
>> On Dec 14, 2007 9:16 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>>> > Andy Wilcox schreef:
>>>     
>>>> > > Since uboot-utils builds a native binary (mkImage) it should really be
>>>> > > called uboot-utils-native.
>>>>       
>>> >
>>> > That part makes sense. FWIW, we already have a uboot-mkimage-native
>>> > recipe in OE.
>>> >
>>>     
>> Also, consider u-boot-utils instead of uboot-utils. The project is
>> called u-boot and I thought I saw both namespaces appear in the u-boot
>> dir?
>> (If I'm too late, probably forget this).
>>
>> Also +1 from me.
>>
>>   
>>>> > > My motivation is (a) I'd really like to build a few tools from uboot
>>>> > > which are cross-compiled
>>>>       
>>> >
>>> > And now you're talking about uboot-utils-cross, not uboot-utils-native
>>> >
>>>     
>> Not necessarely.
>>
>> Anything *-cross is a tool that is built for, and runs on one platform
>> and generates output for another.
>>
>> Andy said a few tools which *are* cross-compiled, so he I think he
>> wants to cross-compile tools, which are deployed on the target and as
>> such do not generate output for another target.

> Leon is exactly right.  I meant I'd use the newly-freed u-boot-utils
> to build a few programs for the target - in my case, I'm interested
> in fw-setenv, which allows one command-line manipulation of the
> u-boot environment area in flash.

> Sorry for any confusion.

  Yeah, all this discussion became rather confusing. To understand
what's it all about, a careful look at the commit was required, and
that uncovered few botched things:

--- packages/uboot/u-boot-utils_1.2.0.bb        64396fa43c9fcef1ed1cd3ae82a49d140febbbd0
+++ packages/uboot/u-boot-utils_1.2.0.bb        64396fa43c9fcef1ed1cd3ae82a49d140febbbd0

+DEPENDS_openprotium = "mtd-utils"

   Think again - does u-boot-utils require mtd-utils headers or tools
during compile-time? Moreover, is it required for openprotium only?

+SRC_URI_append_openprotium = " \
+        file://fw_env.c.patch;patch=1 \
+        file://tools-Makefile.patch;patch=1 \
+        file://env-Makefile.patch;patch=1 \
+        file://fw_env.config"

   What so special of these patches that they apply only to
openprotium?

+EXTRA_OEMAKE_openprotium = "CROSS_COMPILE=${TARGET_PREFIX}"

   Overrides above are worth privilege of doubt, but this one doesn't
need it: doing things like this in the OE mainline is rather incorrect
behavior to all other projects/users.

--- packages/tasks/task-base.bb 784db9539c99a3dfc0ce43cc4b61f9cd5eba3b27
+++ packages/tasks/task-base.bb 7a9b59f5510daa79b732e48d67445e1d5ebc4c81
 RDEPENDS_task-base-uboot = "\
-    uboot-utils"
+    u-boot-utils-native"

     More attention could have been spent here too - non-native
package *cannot* RDEPENDS on native, this is one of abort conditions
in insane.bbclass. Someone who added the original line thought that
uboot-utils is actually what its name suggests. When you'll be fixing
it, don't forget about this:

--- conf/distro/include/angstrom-2007-preferred-versions.inc    f3d89d1d37708d933d79f1a37dbef5925a80cf82
+++ conf/distro/include/angstrom-2007-preferred-versions.inc    2ee34e9004f488e328231f5a1f139e5225d0e2cf
-PREFERRED_VERSION_uboot-utils ?= "1.2.0"
+PREFERRED_VERSION_u-boot-utils-native ?= "1.2.0"



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



