Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8C2E56FFD7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2019 23:04:44 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id w26so5186654pfq.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2019 16:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=q9d2qTH3ZyMlwXkxBZBxlQc0VaKuGSsLHoiLU26gtYQ=;
	b=fkgMtFH998Jd2bqabjtLqlWxJDZLkMIFQM7q79E+ahxbNCh7lim33Uvo+VzUTDfe0s
	WC7McK3074WiYayH8bpfuIyGyOl1bxLxqvJIkLarhrT80dPNoqgRn+4uPdjm5gxmJ0tK
	uGmedpF3RJs4pxCrVEskBe2TT587pCYoNxqHLKZuZRSo64K1xJ6V1EFtwDVpxtkgK04D
	V7NNGl11ot9yKLsVIyCY1UqnkapJ2txcKmU85Rir4MzBsWTY4Y+dw22eZoZ6LlCTZulZ
	GwswI7SWm4VOS1UZAdP8Ibpu2tLHNYgLFCZSZleCWu12BTut6mmC3D+ZRJTBYbpm0NBQ
	F6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=q9d2qTH3ZyMlwXkxBZBxlQc0VaKuGSsLHoiLU26gtYQ=;
	b=gfsDxrXTz+CCO8lW3GRwhvaWc8XV6af0UmF4mxfxEmblfg9NTnF6zCrf7V+MG1wp8G
	ktc8qImAzEvQ1NWpnBpy85TqfPjZZV9X0jnZ12CAWLiCRL6G3tmj17H0nqvO5dS7dIpK
	+OQuog3CXIiAQV626O7agyi8bwsLRxBSRGW015Y7cKhw8jMkfW+622IaFsLAIh2bIPCh
	8+JkFps1ygjQI/8t3Qw4TUJk3W3FgW4fudleS88mjM7uMpEf4kBLa36d8KRd6imxYsWn
	UPcEwZrSMTxq03dNbhAzQXv5Arez3HzV+m0tFlqkJ4ynTFnMdiuOk5WB2RTIUPYBsJbl
	BQYw==
X-Gm-Message-State: APjAAAUVEKY03l4k5NG/0m7kYtx7qiXa7+VKsLB5T38h6A7ptMLVwoHp
	cdVkEeeiSfji35Aam2j9H07NNGdqlYI=
X-Google-Smtp-Source: APXvYqwBcA4KA4mF2jHgB4rM5vYue0YL22AaOYYZT0KWOpcHROo6BZLHo3pfJvGa2ThgMjhkgOWy6Q==
X-Received: by 2002:a62:5c01:: with SMTP id q1mr38081589pfb.53.1565651085138; 
	Mon, 12 Aug 2019 16:04:45 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:6bc6:ecf5:55f9:1f07:fceb?
	([2601:646:8500:6bc6:ecf5:55f9:1f07:fceb])
	by smtp.gmail.com with ESMTPSA id
	q63sm139187923pfb.81.2019.08.12.16.04.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Aug 2019 16:04:44 -0700 (PDT)
To: "Slater, Joseph" <joe.slater@windriver.com>,
	akuster808 <akuster808@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <20190812192220.238334-1-joe.slater@windriver.com>
	<d276d252-b4bd-8595-eeb8-4e1b649eca24@gmail.com>
	<007BD92917A2324FA403BCF9A464CF84FA87E73E@ALA-MBD.corp.ad.wrs.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <eed7009d-1865-684b-c8b8-edd9ca393f5a@gmail.com>
Date: Mon, 12 Aug 2019 16:04:43 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84FA87E73E@ALA-MBD.corp.ad.wrs.com>
Subject: Re: [meta-oe][PATCH 1/1] php: zlib and zip support
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
X-List-Received-Date: Mon, 12 Aug 2019 23:04:44 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/12/19 2:52 PM, Slater, Joseph wrote:
> Maybe the names are confusing.  It's really use_libzip_zip vs use_bundled_zip.   Joe
> 
> -----Original Message-----
> From: akuster808 <akuster808@gmail.com>
> Sent: Monday, August 12, 2019 12:34 PM
> To: Slater, Joseph <joe.slater@windriver.com>; openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH 1/1] php: zlib and zip support
> 
> 
> 
> On 8/12/19 12:22 PM, Joe Slater wrote:
>> Add back zlib support.  Define zip support but do not enable it.
>>
>> Signed-off-by: Joe Slater <joe.slater@windriver.com>
>> ---
>>   meta-oe/recipes-devtools/php/php.inc | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-devtools/php/php.inc
>> b/meta-oe/recipes-devtools/php/php.inc
>> index 33bcf12..08173ea 100644
>> --- a/meta-oe/recipes-devtools/php/php.inc
>> +++ b/meta-oe/recipes-devtools/php/php.inc
>> @@ -59,7 +59,7 @@ EXTRA_OECONF = "--enable-mbstring \
>>                   --enable-fpm \
>>                   --with-libdir=${baselib} \
>>                   --with-gettext=${STAGING_LIBDIR}/.. \
>> -                --with-libzip=${STAGING_LIBDIR}/.. \
>> +                --with-zlib=${STAGING_LIBDIR}/.. \
>>                   --with-iconv=${STAGING_LIBDIR}/.. \
>>                   --with-bz2=${STAGING_DIR_TARGET}${exec_prefix} \
>>                   
>> --with-config-file-path=${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSI
>> ON} \ @@ -81,6 +81,11 @@ PACKAGECONFIG ??= "mysql sqlite3 imap opcache openssl \  "
>>   PACKAGECONFIG_class-native = ""
>>   
>> +# For zip, select one or none.  oldzip uses a bundled library and is deprecated.
>> +#
> 
> How would I know which is old or new? is there a version ref we can mention? is it a gplv2 or gplv3 thing?
> 
> -armin
>> +PACKAGECONFIG[newzip] = "--enable-zip --with-libzip=${STAGING_EXECPREFIXDIR},,libzip"
>> +PACKAGECONFIG[oldzip] = "--enable-zip --without-libzip,"
>> +

maybe it should be called bundled-libzip and system-libzip maybe for 
clarity. What happens if someone enables both packageconfigs?

>>   PACKAGECONFIG[mysql] = "--with-mysql=${STAGING_DIR_TARGET}${prefix} \
>>                           --with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config \
>>                           
>> --with-pdo-mysql=${STAGING_BINDIR_CROSS}/mysql_config \
> 


