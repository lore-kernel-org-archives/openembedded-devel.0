Received: from ns1.gatteins.it ([193.58.239.94])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <matteo.facchinetti@sirius-es.it>) id 1QSSlR-0006FL-U3
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Jun 2011 13:42:05 +0200
X-Virus-Scanned: amavisd-new at gattei.com
Received: from [10.16.100.107] (78-134-95-148.dynamic.eolo.it [78.134.95.148])
	by ns1.gatteins.it (Postfix) with ESMTPA id 494C3DEFC4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jun 2011 13:39:05 +0200 (MEST)
Message-ID: <4DE8C7CD.3020803@sirius-es.it>
Date: Fri, 03 Jun 2011 13:38:53 +0200
From: Matteo Facchinetti <matteo.facchinetti@sirius-es.it>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1306934980-19272-1-git-send-email-matteo.facchinetti@sirius-es.it>
	<is5oca$sls$1@dough.gmane.org>
In-Reply-To: <is5oca$sls$1@dough.gmane.org>
Subject: Re: [PATCH] wxbase_2.8.9: fix includepath for SDL dependency
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
X-List-Received-Date: Fri, 03 Jun 2011 11:42:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/01/2011 06:11 PM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 01-06-11 15:29, Matteo Facchinetti wrote:
>> From: Matteo Facchinetti<engineering@sirius-es.it>
>>
>> Compile task fail with error:
>> | CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/SDL
>> | cc1plus: internal compiler error: in add_path, at c-incpath.c:425
>>
>> Fix it forcing right path in configuration.
>>
>>
>> Signed-off-by: Matteo Facchinetti<engineering@sirius-es.it>
>> ---
>>   recipes/wxwidgets/wxbase_2.8.9.bb |    3 ++-
>>   1 files changed, 2 insertions(+), 1 deletions(-)
>>
>> diff --git a/recipes/wxwidgets/wxbase_2.8.9.bb b/recipes/wxwidgets/wxbase_2.8.9.bb
>> index fb18710..7d593ad 100644
>> --- a/recipes/wxwidgets/wxbase_2.8.9.bb
>> +++ b/recipes/wxwidgets/wxbase_2.8.9.bb
>> @@ -9,7 +9,8 @@ SRC_URI += "file://Makefile.in.patch"
>>   EXTRA_OECONF = " --disable-gui \
>>                    --enable-largefile \
>>                    --enable-gpe \
>> -                 --without-subdirs"
>> +                 --without-subdirs \
>> +                 --with-sdl-prefix=${D}"
> Usually that means you end with with references to $WORKDIR in the
> target binaries, is this one safe?
>
mmmm...
While checking about it I have discovered a mistake:

In this case "--with-sdl-prefix" is used only for the basepath where 
sdl-config script is located.

Configure script set:
SDL_CONFIG=$sdl_prefix/bin/sdl-config

Then, if sdl-config is found (located in that position), it says to 
wxbase the right path where SDL library is located.
Binaries seems to be created exactly like the other libraries.

For this reason the only right way I've found is to use:
--with-sdl-prefix="${STAGING_BINDIR_CROSS}/.."

Is it goes well?

if yes I prepare v2 of this patch...




