Received: from ns1.gatteins.it ([193.58.239.94])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <matteo.facchinetti@sirius-es.it>) id 1QUcix-0002K9-FR
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Jun 2011 12:44:27 +0200
X-Virus-Scanned: amavisd-new at gattei.com
Received: from [10.16.100.107] (78-134-105-170.dynamic.eolo.it
	[78.134.105.170])
	by ns1.gatteins.it (Postfix) with ESMTPA id 10538DEF28
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jun 2011 12:41:16 +0200 (MEST)
Message-ID: <4DF0A343.6040608@sirius-es.it>
Date: Thu, 09 Jun 2011 12:41:07 +0200
From: Matteo Facchinetti <matteo.facchinetti@sirius-es.it>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1307541389-2401-1-git-send-email-matteo.facchinetti@sirius-es.it>
	<1307551786.4193.25.camel@mattotaupa>
In-Reply-To: <1307551786.4193.25.camel@mattotaupa>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH v2] wxbase_2.8.9: fix includepath for SDL dependency
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
X-List-Received-Date: Thu, 09 Jun 2011 10:44:27 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/08/2011 06:49 PM, Paul Menzel wrote:
> Am Mittwoch, den 08.06.2011, 15:56 +0200 schrieb Matteo Facchinetti:
>> From: Matteo Facchinetti<engineering@sirius-es.it>
>>
>> Compile task fail with error:
>> | CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/SDL
>> | cc1plus: internal compiler error: in add_path, at c-incpath.c:425
>>
>> Fix it forcing right path in configuration.
> It builds fine for me without this patch using `minimal` for `MACHINE =
> "beagleboard"`. How can I reproduce your build error?
>

wx_base configure script checks the presence of sdl-config in your host 
system (and not in your cross-build system) Then use it to know SDL 
include PATH. (sdlconfig --cflags).
this path is wrong for your cross-compiling ( usually -I/usr/include/SDL ).

At first, to reproduce the problem you have to install SDL lib in your 
host system.
I don't know if you could reproduce exactly the same crash.
  (however I'm using a IA64 64bit host system and my target is powerpc 
32 (e300c3 core).)

If you doesn't have SDL lib in your host, problem disappear because 
wx_base configure doesn't use it.

After apply this patch, your cross_compile system start check and use 
the right sdl-config (for me located in 
"$BUILDDIR"/sysroots/x86_64-linux/usr/ppce300c3/bin/sdl-config ).

For compile wx_base with SDL you have to create an image with this 
dependency.
I don't know if the `minimal` one is sufficient. I'm using `console-image` .


>> Signed-off-by: Matteo Facchinetti<engineering@sirius-es.it>
>> ---
>>   recipes/wxwidgets/wxbase_2.8.9.bb |    3 ++-
>>   1 files changed, 2 insertions(+), 1 deletions(-)
>>
>> diff --git a/recipes/wxwidgets/wxbase_2.8.9.bb b/recipes/wxwidgets/wxbase_2.8.9.bb
>> index fb18710..b87da11 100644
>> --- a/recipes/wxwidgets/wxbase_2.8.9.bb
>> +++ b/recipes/wxwidgets/wxbase_2.8.9.bb
>> @@ -9,7 +9,8 @@ SRC_URI += "file://Makefile.in.patch"
>>   EXTRA_OECONF = " --disable-gui \
>>                    --enable-largefile \
>>                    --enable-gpe \
>> -                 --without-subdirs"
>> +                 --without-subdirs \
>> +                 --with-sdl-prefix=${STAGING_BINDIR_CROSS}/.."
> Maybe add `\` to the end and put the `"` to the new line so that future
> patches will be smaller.
ok

> -                 --without-subdirs"
> +                 --without-subdirs \
> +                 --with-sdl-prefix=${STAGING_BINDIR_CROSS}/.. \
> +                 "
>
>>   LEAD_SONAME = "libwx_base-2.8.so"
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


