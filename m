Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4D88A7F304
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 23:00:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7FN0YBh017745
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 16:00:34 -0700 (PDT)
Received: from [172.25.44.5] (172.25.44.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 15 Aug 2019 16:00:33 -0700
To: Joe Slater <joe.slater@windriver.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20190815212652.207154-1-joe.slater@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <966ec52b-04f0-877e-dbad-6a0ff5627a05@windriver.com>
Date: Thu, 15 Aug 2019 19:00:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190815212652.207154-1-joe.slater@windriver.com>
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
X-List-Received-Date: Thu, 15 Aug 2019 23:00:33 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 8/15/19 5:26 PM, Joe Slater wrote:
> Add back zlib support.  Define zip support but do not enable it.

Can you explain what that achieves.
 From the change it looks like you have duplicated the
default config and added a PACKAGECONFIG. Why do you need both?

../Randy
> 
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>   meta-oe/recipes-devtools/php/php.inc | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
> index 33bcf12..b63ed4c 100644
> --- a/meta-oe/recipes-devtools/php/php.inc
> +++ b/meta-oe/recipes-devtools/php/php.inc
> @@ -59,7 +59,7 @@ EXTRA_OECONF = "--enable-mbstring \
>                   --enable-fpm \
>                   --with-libdir=${baselib} \
>                   --with-gettext=${STAGING_LIBDIR}/.. \
> -                --with-libzip=${STAGING_LIBDIR}/.. \
> +                --with-zlib=${STAGING_LIBDIR}/.. \
>                   --with-iconv=${STAGING_LIBDIR}/.. \
>                   --with-bz2=${STAGING_DIR_TARGET}${exec_prefix} \
>                   --with-config-file-path=${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION} \
> @@ -81,6 +81,8 @@ PACKAGECONFIG ??= "mysql sqlite3 imap opcache openssl \
>   "
>   PACKAGECONFIG_class-native = ""
>   
> +PACKAGECONFIG[zip] = "--enable-zip --with-libzip=${STAGING_EXECPREFIXDIR},,libzip"
> +
>   PACKAGECONFIG[mysql] = "--with-mysql=${STAGING_DIR_TARGET}${prefix} \
>                           --with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config \
>                           --with-pdo-mysql=${STAGING_BINDIR_CROSS}/mysql_config \
> 


-- 
# Randy MacLeod
# Wind River Linux

