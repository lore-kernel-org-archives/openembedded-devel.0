Received: from [206.83.81.187] (helo=smtp1.irobot.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tharvey@irobot.com>) id 1Lp3J0-0007S2-MK
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Apr 2009 18:29:03 +0200
Received: from fever2.wardrobe.irobot.com ([192.168.163.187]) by
	smtp1.irobot.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 1 Apr 2009 12:26:24 -0400
Received: from [192.168.69.73] ([192.168.69.73]) by fever2.wardrobe.irobot.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 1 Apr 2009 12:26:24 -0400
Message-ID: <49D395AF.1090706@irobot.com>
Date: Wed, 01 Apr 2009 09:26:23 -0700
From: Tim Harvey <tharvey@irobot.com>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <49CD3BFF.2030902@irobot.com>
	<b6ebd0a50903271402r632461b0q962666a6b2ccd50c@mail.gmail.com>
In-Reply-To: <b6ebd0a50903271402r632461b0q962666a6b2ccd50c@mail.gmail.com>
X-OriginalArrivalTime: 01 Apr 2009 16:26:25.0008 (UTC)
	FILETIME=[99D84700:01C9B2E6]
X-SA-Exim-Connect-IP: 206.83.81.187
X-SA-Exim-Mail-From: tharvey@irobot.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_40,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] bash: add alternative configuration for bin/sh -> /bin/bash
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Apr 2009 16:29:12 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Chris Larson wrote:
> Be very careful with this.  Specifically, be sure to thoroughly test
> installing bash onto a system that currently has busybox, and the
> upgrade paths for both busybox and bash.  You never want to get into a
> state, due to pre/post rm/install script execution order, where
> /bin/sh doesn't exist.  If that happens, you won't be able to execute
> the next script to fix it :)
>   
in my case, I have both bash and busybox installed and I want bash to 
take priority as the /bin/sh which it otherwise does not.

attempting to remove the package that contains your shell is something 
you need to be careful as anyway.

This seems to me to be a prime example of where alternatives should be used?

Tim
> On Fri, Mar 27, 2009 at 1:50 PM, Tim Harvey <tharvey@irobot.com> wrote:
>   
>> Add alternative configuration for /bin/sh -> /bin/bash so that for example
>> bash can exist (and override) as shell if busybox is also installed
>>
>> diff --git a/recipes/bash/bash.inc b/recipes/bash/bash.inc
>> index 4eba689..7c6122b 100644
>> --- a/recipes/bash/bash.inc
>> +++ b/recipes/bash/bash.inc
>> @@ -4,7 +4,7 @@ DEPENDS = "ncurses"
>> SECTION = "base/shell"
>> LICENSE = "GPL"
>>
>> -inherit autotools gettext
>> +inherit autotools gettext update-alternatives
>>
>> PARALLEL_MAKE = ""
>>
>> @@ -33,3 +33,8 @@ pkg_postinst () {
>>       grep -q "bin/bash" $D${sysconfdir}/shells || echo /bin/bash >>
>> $D${sysconfdir}/shells
>>       grep -q "bin/sh" $D${sysconfdir}/shells || echo /bin/sh >>
>> $D${sysconfdir}/shells
>> }
>> +
>> +ALTERNATIVE_NAME = "sh"
>> +ALTERNATIVE_LINK = "${base_bindir}/sh"
>> +ALTERNATIVE_PATH = "${base_bindir}/bash"
>> +ALTERNATIVE_PRIORITY = "90"
>> diff --git a/recipes/bash/bash_3.0.bb b/recipes/bash/bash_3.0.bb
>> index e23887a..8165d07 100644
>> --- a/recipes/bash/bash_3.0.bb
>> +++ b/recipes/bash/bash_3.0.bb
>> @@ -1,5 +1,5 @@
>> require bash.inc
>> -PR = "r11"
>> +PR = "r12"
>>
>> SRC_URI += "\
>>  file://bash-3.0-fixes.patch;patch=1 \
>> diff --git a/recipes/bash/bash_3.2.bb b/recipes/bash/bash_3.2.bb
>> index 6a48a4b..e175467 100644
>> --- a/recipes/bash/bash_3.2.bb
>> +++ b/recipes/bash/bash_3.2.bb
>> @@ -1,6 +1,6 @@
>> require bash.inc
>>
>> -PR = "r7"
>> +PR = "r8"
>>
>> SRC_URI += "\
>>           file://builtins.patch;patch=1 \
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>>     
>
>
>
>   



