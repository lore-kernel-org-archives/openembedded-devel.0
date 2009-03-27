Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LnKw2-0001YD-W3
	for openembedded-devel@openembedded.org; Fri, 27 Mar 2009 23:53:59 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LnKuH-000560-LT
	for openembedded-devel@openembedded.org; Fri, 27 Mar 2009 22:52:09 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 27 Mar 2009 22:52:09 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 27 Mar 2009 22:52:09 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 27 Mar 2009 23:51:53 +0100
Message-ID: <gqjla9$k9u$1@ger.gmane.org>
References: <49CD3BFF.2030902@irobot.com>
	<b6ebd0a50903271402r632461b0q962666a6b2ccd50c@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090322 Shredder/3.0b3pre
In-Reply-To: <b6ebd0a50903271402r632461b0q962666a6b2ccd50c@mail.gmail.com>
Sender: news <news@ger.gmane.org>
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
X-List-Received-Date: Fri, 27 Mar 2009 22:53:59 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27-03-09 22:02, Chris Larson wrote:
> Be very careful with this.  Specifically, be sure to thoroughly test
> installing bash onto a system that currently has busybox, and the
> upgrade paths for both busybox and bash.  You never want to get into a
> state, due to pre/post rm/install script execution order, where
> /bin/sh doesn't exist.  If that happens, you won't be able to execute
> the next script to fix it :)

And we actually have busyboxisms in some scripts, you can't launch e-wm 
due to the OE wrapper script (which isn't needed anymore, btw) breaking 
with bash.

regards,

Koen


>
> On Fri, Mar 27, 2009 at 1:50 PM, Tim Harvey<tharvey@irobot.com>  wrote:
>> Add alternative configuration for /bin/sh ->  /bin/bash so that for example
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
>>        grep -q "bin/bash" $D${sysconfdir}/shells || echo /bin/bash>>
>> $D${sysconfdir}/shells
>>        grep -q "bin/sh" $D${sysconfdir}/shells || echo /bin/sh>>
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
>>   file://bash-3.0-fixes.patch;patch=1 \
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
>>            file://builtins.patch;patch=1 \
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
>
>




