Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1UUZgF-0000Qi-Ek
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Apr 2013 11:38:31 +0200
Message-ID: <51765270.1090105@communistcode.co.uk>
Date: Tue, 23 Apr 2013 10:20:48 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130403 Thunderbird/17.0.5
MIME-Version: 1.0
To: Jack Mitchell <ml@communistcode.co.uk>
References: <20130422165350.GA3217@jama>
	<1366708708-24878-1-git-send-email-ml@communistcode.co.uk>
In-Reply-To: <1366708708-24878-1-git-send-email-ml@communistcode.co.uk>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v5] php: add sqlite3 and mysql PACKAGECONFIG options
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
X-List-Received-Date: Tue, 23 Apr 2013 09:38:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 23/04/13 10:18, Jack Mitchell wrote:
> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>
> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> ---
>   meta-oe/recipes-devtools/php/php.inc | 38 +++++++++++++++++++++++-------------
>   1 file changed, 24 insertions(+), 14 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
> index 225c3d7..749f51c 100644
> --- a/meta-oe/recipes-devtools/php/php.inc
> +++ b/meta-oe/recipes-devtools/php/php.inc
> @@ -3,11 +3,11 @@ HOMEPAGE = "http://www.php.net"
>   SECTION = "console/network"
>   LICENSE = "PHP-3.0"
>   BBCLASSEXTEND = "native"
> -DEPENDS = "zlib libxml2 virtual/libiconv php-native lemon-native mysql5 \
> -           libc-client openssl sqlite3"
> +DEPENDS = "zlib libxml2 virtual/libiconv php-native lemon-native \
> +           libc-client openssl"
>   DEPENDS_virtclass-native = "zlib-native libxml2-native"
>   
> -INC_PR = "r4"
> +INC_PR = "r5"
>   
>   SRC_URI = "http://www.php.net/distributions/php-${PV}.tar.bz2"
>   
> @@ -19,27 +19,37 @@ SSTATE_SCAN_FILES += "build-defs.h"
>   
>   # Common EXTRA_OECONF
>   COMMON_EXTRA_OECONF = "--enable-sockets --enable-pcntl --enable-shared"
> -EXTRA_OECONF = "--enable-mbstring --enable-discard-path --enable-wddx \
> -                --enable-magic-quotes --enable-fastcgi --enable-fpm \
> +EXTRA_OECONF = "--enable-mbstring \
> +                --enable-wddx \
> +                --enable-fpm \
>                   --with-imap=${STAGING_DIR_HOST} \
>                   --with-gettext=${STAGING_LIBDIR}/.. \
>                   --with-imap-ssl=${STAGING_DIR_HOST} \
> -                --with-zlib --with-zlib-dir=${STAGING_LIBDIR}/.. \
> +                --with-zlib=${STAGING_LIBDIR}/.. \
>                   --with-iconv=${STAGING_LIBDIR}/.. \
>                   --with-libxml-dir=${STAGING_BINDIR_CROSS} \
> -                --disable-embedded-mysqli \
> -                --with-mysql="${STAGING_DIR_TARGET}${prefix}" \
> -                --with-mysqli="${STAGING_BINDIR_CROSS}/mysql_config" \
> -        --with-sqlite3=${STAGING_LIBDIR}/.. --enable-sqlite-utf8 \
> -                --with-pdo-mysql="${STAGING_BINDIR_CROSS}/mysql_config" \
> -                --with-pdo-sqlite=${STAGING_LIBDIR}/.. ${COMMON_EXTRA_OECONF} \
> +                ${COMMON_EXTRA_OECONF} \
>   "
> -EXTRA_OECONF_virtclass-native = "--with-cgi --without-libpng --without-libjpeg \
> -                --with-zlib --with-zlib-dir=${STAGING_LIBDIR_NATIVE}/.. \
> +EXTRA_OECONF_virtclass-native = " \
> +                --with-zlib=${STAGING_LIBDIR_NATIVE}/.. \
>                   --with-libxml-dir=${STAGING_BINDIR_NATIVE} \
>                   ${COMMON_EXTRA_OECONF} \
>   "
>   
> +PACKAGECONFIG ??= "mysql sqlite3"
> +PACKAGECONFIG_class-native = ""
> +
> +PACKAGECONFIG[mysql] = "--with-mysql=${STAGING_DIR_TARGET}${prefix} \
> +                        --with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config \
> +                        --with-pdo-mysql=${STAGING_BINDIR_CROSS}/mysql_config \
> +                        , \
> +                        ,mysql5"
> +
> +PACKAGECONFIG[sqlite3] = "--with-sqlite3=${STAGING_LIBDIR}/.. \
> +                          --with-pdo-sqlite=${STAGING_LIBDIR}/.. \
> +                          , \
> +                          ,sqlite3"
> +
>   LIBS_virtclass-native = " -lxml2 "
>   LIBS_pn-php =" -lpthread "
>   export LIBS

The patch in my repo has somehow become munged, this is the exact 
changes I have which is building correctly as above. I don't know how 
they got joined, but they did. This negates the need for 2/2 of this 
patchset, it's all rolled in.

Sorry for the saga this is becoming!

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



