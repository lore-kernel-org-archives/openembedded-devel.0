Received: from smtprelay-h22.telenor.se ([195.54.99.197])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf_samuelsson@telia.com>) id 1RHim0-0006ND-Ez
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Oct 2011 23:06:32 +0200
Received: from iph2.telenor.se (iph2.telenor.se [195.54.127.133])
	by smtprelay-h22.telenor.se (Postfix) with ESMTP id C606BEB7F3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Oct 2011 23:00:37 +0200 (CEST)
X-SENDER-IP: [83.227.59.253]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AocZAMAto05T4zv9PGdsb2JhbAAMN6koAQEBATeCIAEBAQECAQEBAUgBIgoRCxUMFg8JAwIBAgEVARsUEwYCAQGHfAimdAGMPIhABIJYjxaCG4hpiHQ
X-IronPort-AV: E=Sophos;i="4.69,391,1315173600"; 
	d="scan'208,217";a="499114185"
Received: from c-fd3be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.249]) ([83.227.59.253])
	by iph2.telenor.se with ESMTP; 22 Oct 2011 23:00:37 +0200
Message-ID: <4EA32EF5.5020703@telia.com>
Date: Sat, 22 Oct 2011 23:00:37 +0200
From: Ulf Samuelsson <ulf_samuelsson@telia.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1319286535-2935-1-git-send-email-ulf_samuelsson@telia.com>
	<1319289285.3496.40.camel@mattotaupa>
In-Reply-To: <1319289285.3496.40.camel@mattotaupa>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] freetype_2.4.3.bb; Change order of configuration.
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
X-List-Received-Date: Sat, 22 Oct 2011 21:06:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

2011-10-22 15:14, Paul Menzel skrev:
> Am Samstag, den 22.10.2011, 14:28 +0200 schrieb ulf_samuelsson@telia.com:
>> From: Ulf Samuelsson<ulf_samuelsson@telia.com>
>>
>> Build of freetype-native is broken on Ubuntu 11.10 x64 - possible others.
> It works for me without problem with Debian Squeeze (32-bit). So what is
> the error message in the first place?
>
DIdn't save the logfile, but the problem was that
"./builds/unix/x86_64-linux-libtool"  was not present when needed.

instead "./builds/unix/libtool" had been built.
If you run a 32 bit machine, then you obviously do not have a problem.

Would be good to have it tested on a 32 bit machine of course,
but I do not see why a 64 bit version should be built based
on the changes in the patch.


>> Problem fixed in openembedded-core 2.4.4 recipe
> It seems it was not present since the beginning, i. e. version 2.3.12.
>
>> Backporting the change will allow the build to complete.
>>
>> openembedded-core-contrib/meta/recipes-graphics/freetype
>>
>> Signed-Off-By: Ulf Samuelsson<ulf.samuelsson@telia.com>
>> ---
>>   recipes/freetype/freetype_2.4.3.bb |    6 +++---
>>   1 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/recipes/freetype/freetype_2.4.3.bb b/recipes/freetype/freetype_2.4.3.bb
>> index 66d2e51..dfc1b43 100644
>> --- a/recipes/freetype/freetype_2.4.3.bb
>> +++ b/recipes/freetype/freetype_2.4.3.bb
>> @@ -1,7 +1,7 @@
>>   DESCRIPTION = "Freetype font rendering library"
>>   SECTION = "libs"
>>   LICENSE = "freetype GPLv2"
>> -PR = "r1"
>> +PR = "r2"
>>   DEPENDS = "zlib"
>>
>>   SRC_URI = "\
>> @@ -23,9 +23,9 @@ LDFLAGS_append = " -Wl,-rpath-link -Wl,${STAGING_DIR_TARGET}${libdir}"
>>
>>   do_configure() {
>>   	cd builds/unix
>> -	gnu-configize --force
>> -	aclocal -I .
>>   	libtoolize --force --copy
>> +	aclocal -I .
>> +	gnu-configize --force
>>   	autoconf
>>   	cd ${S}
>>   	oe_runconf
>
> Thanks,
>
> Paul
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
Best Regards
Ulf Samuelsson


