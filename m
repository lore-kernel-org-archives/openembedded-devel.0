Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5BA3179AE7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 04:15:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7G4FUIQ022164
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 21:15:31 -0700 (PDT)
Received: from [172.25.44.5] (172.25.44.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 15 Aug 2019 21:15:30 -0700
To: "Slater, Joseph" <joe.slater@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <20190815212652.207154-1-joe.slater@windriver.com>
	<966ec52b-04f0-877e-dbad-6a0ff5627a05@windriver.com>
	<007BD92917A2324FA403BCF9A464CF84FA881765@ALA-MBD.corp.ad.wrs.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <80c5768f-1796-d15d-5098-c98b7f1d0bae@windriver.com>
Date: Fri, 16 Aug 2019 00:15:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84FA881765@ALA-MBD.corp.ad.wrs.com>
X-Originating-IP: [172.25.44.5]
Subject: Re: [meta-oe][V2][PATCH 1/1] php: zlib and zip support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Aug 2019 04:15:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 8/15/19 9:26 PM, Slater, Joseph wrote:
> I think the current config does not enable either zlib or zip.  It defines --with-libzip, but does not enable it with --enable-zip.  It also does not define --with-zlib, so we lose that.
> 
> The original concern was that phoronix-test-suite would put out a message at runtime that it needed php zip.  I think this message is wrong and all it needs is zlib.  So, I decided to bring both back but not enable zip because it needs an extra package.  The "old" way of supporting php zip used a bundled library.  That way has been deprecated, so if we want zip, we need libzip.
> 
> This patch is aimed at helping phoronix-test-suite and easing php zip support should someone desire to add that via PACKAGECONFIG.  I would be happy to put zip into the default config, but who really needs it?
> 

The context is good to know.

I read your v2 patch too quickly so now that you have explained
what's going on and I see that:
   zlib !- libzip
I withdraw my request for additional long log. Sorry for the noise.

../Randy

> Joe
> 
> -----Original Message-----
> From: MacLeod, Randy <Randy.MacLeod@windriver.com>
> Sent: Thursday, August 15, 2019 4:01 PM
> To: Slater, Joseph <joe.slater@windriver.com>; openembedded-devel@lists.openembedded.org
> Subject: Re: [meta-oe][V2][PATCH 1/1] php: zlib and zip support
> 
> On 8/15/19 5:26 PM, Joe Slater wrote:
>> Add back zlib support.  Define zip support but do not enable it.
> 
> Can you explain what that achieves.
>   From the change it looks like you have duplicated the default config and added a PACKAGECONFIG. Why do you need both?
> 
> ../Randy
>>
>> Signed-off-by: Joe Slater <joe.slater@windriver.com>
>> ---
>>    meta-oe/recipes-devtools/php/php.inc | 4 +++-
>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-devtools/php/php.inc
>> b/meta-oe/recipes-devtools/php/php.inc
>> index 33bcf12..b63ed4c 100644
>> --- a/meta-oe/recipes-devtools/php/php.inc
>> +++ b/meta-oe/recipes-devtools/php/php.inc
>> @@ -59,7 +59,7 @@ EXTRA_OECONF = "--enable-mbstring \
>>                    --enable-fpm \
>>                    --with-libdir=${baselib} \
>>                    --with-gettext=${STAGING_LIBDIR}/.. \
>> -                --with-libzip=${STAGING_LIBDIR}/.. \
>> +                --with-zlib=${STAGING_LIBDIR}/.. \
>>                    --with-iconv=${STAGING_LIBDIR}/.. \
>>                    --with-bz2=${STAGING_DIR_TARGET}${exec_prefix} \
>>                    
>> --with-config-file-path=${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION} \ @@ -81,6 +81,8 @@ PACKAGECONFIG ??= "mysql sqlite3 imap opcache openssl \
>>    "
>>    PACKAGECONFIG_class-native = ""
>>    
>> +PACKAGECONFIG[zip] = "--enable-zip --with-libzip=${STAGING_EXECPREFIXDIR},,libzip"
>> +
>>    PACKAGECONFIG[mysql] = "--with-mysql=${STAGING_DIR_TARGET}${prefix} \
>>                            --with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config \
>>                            
>> --with-pdo-mysql=${STAGING_BINDIR_CROSS}/mysql_config \
>>
> 
> 
> --
> # Randy MacLeod
> # Wind River Linux
> 


-- 
# Randy MacLeod
# Wind River Linux

