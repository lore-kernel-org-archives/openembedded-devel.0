Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1UT702-00061U-J5
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Apr 2013 10:49:09 +0200
Message-ID: <517100D7.8070501@communistcode.co.uk>
Date: Fri, 19 Apr 2013 09:31:19 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130403 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1366209695-4195-1-git-send-email-ml@communistcode.co.uk>
	<1366209695-4195-2-git-send-email-ml@communistcode.co.uk>
	<20130418191023.GB2489@jama>
In-Reply-To: <20130418191023.GB2489@jama>
Subject: Re: [meta-oe][PATCHv2] php: add sqlite3 and mysql PACKAGECONFIG options
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
X-List-Received-Date: Fri, 19 Apr 2013 08:49:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 18/04/13 20:10, Martin Jansa wrote:
> On Wed, Apr 17, 2013 at 03:41:35PM +0100, Jack Mitchell wrote:
>> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>>
>> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>> ---
>>   meta-oe/recipes-devtools/php/php.inc | 28 +++++++++++++++++++---------
>>   1 file changed, 19 insertions(+), 9 deletions(-)
>>
>> diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
>> index 225c3d7..639aa01 100644
>> --- a/meta-oe/recipes-devtools/php/php.inc
>> +++ b/meta-oe/recipes-devtools/php/php.inc
>> @@ -3,11 +3,11 @@ HOMEPAGE = "http://www.php.net"
>>   SECTION = "console/network"
>>   LICENSE = "PHP-3.0"
>>   BBCLASSEXTEND = "native"
>> -DEPENDS = "zlib libxml2 virtual/libiconv php-native lemon-native mysql5 \
>> -           libc-client openssl sqlite3"
>> +DEPENDS = "zlib libxml2 virtual/libiconv php-native lemon-native \
>> +           libc-client openssl"
>>   DEPENDS_virtclass-native = "zlib-native libxml2-native"
>>   
>> -INC_PR = "r4"
>> +INC_PR = "r5"
>>   
>>   SRC_URI = "http://www.php.net/distributions/php-${PV}.tar.bz2"
>>   
>> @@ -27,12 +27,7 @@ EXTRA_OECONF = "--enable-mbstring --enable-discard-path --enable-wddx \
>>                   --with-zlib --with-zlib-dir=${STAGING_LIBDIR}/.. \
>>                   --with-iconv=${STAGING_LIBDIR}/.. \
>>                   --with-libxml-dir=${STAGING_BINDIR_CROSS} \
>> -                --disable-embedded-mysqli \
>> -                --with-mysql="${STAGING_DIR_TARGET}${prefix}" \
>> -                --with-mysqli="${STAGING_BINDIR_CROSS}/mysql_config" \
>> -        --with-sqlite3=${STAGING_LIBDIR}/.. --enable-sqlite-utf8 \
>> -                --with-pdo-mysql="${STAGING_BINDIR_CROSS}/mysql_config" \
>> -                --with-pdo-sqlite=${STAGING_LIBDIR}/.. ${COMMON_EXTRA_OECONF} \
>> +                ${COMMON_EXTRA_OECONF} \
>>   "
>>   EXTRA_OECONF_virtclass-native = "--with-cgi --without-libpng --without-libjpeg \
>>                   --with-zlib --with-zlib-dir=${STAGING_LIBDIR_NATIVE}/.. \
>> @@ -40,6 +35,21 @@ EXTRA_OECONF_virtclass-native = "--with-cgi --without-libpng --without-libjpeg \
>>                   ${COMMON_EXTRA_OECONF} \
>>   "
>>   
>> +PACKAGECONFIG ??= "mysql sqlite3"
>> +
>> +PACKAGECONFIG[mysql] = "--with-mysql=\"${STAGING_DIR_TARGET}${prefix}\" \
>> +                        --with-mysqli=\"${STAGING_BINDIR_CROSS}/mysql_config\" \
>> +                        --with-pdo-mysql=\"${STAGING_BINDIR_CROSS}/mysql_config\" \
>> +                        --disable-embedded-mysqli \
>> +                        , \
>> +                        ,mysql5"
>> +
>> +PACKAGECONFIG[sqlite3] = "--with-sqlite3=${STAGING_LIBDIR}/.. \
>> +                        --enable-sqlite-utf8 \
>> +                        --with-pdo-sqlite=${STAGING_LIBDIR}/.. \
>> +                        , \
>> +                        ,sqlite3"
>> +
>>   LIBS_virtclass-native = " -lxml2 "
>>   LIBS_pn-php =" -lpthread "
>>   export LIBS
> php-native fails on jenkins with:
> | configure:59644: result: no
> | configure:60451: checking for MSSQL support via FreeTDS
> | configure:60487: result: no
> | configure:61111: checking for MySQL support
> | configure:61147: result: yes
> | configure:61156: checking for specified location of the MySQL UNIX socket
> | configure:61171: result: no
> | configure:61221: error: Cannot find MySQL header files under "/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr".
> | Note that the MySQL client library is not bundled anymore!
>
> I guess you should force both disabled for native.

I'm no make/configure guru here, so I may need a little bit of input but 
as PHP has no explicit --disable-mysql support, is there a way to force 
a configure variable? This is the snippet that deals with mysql:

php_with_mysql=no

{ $as_echo "$as_me:$LINENO: checking for MySQL support" >&5
$as_echo_n "checking for MySQL support... " >&6; }

# Check whether --with-mysql was given.
if test "${with_mysql+set}" = set; then
   withval=$with_mysql; PHP_MYSQL=$withval
else

   PHP_MYSQL=no
   test "$PHP_ENABLE_ALL" && PHP_MYSQL=$PHP_ENABLE_ALL

fi

Is there a way to force with_mysql to not set?

Alternatively is there a way to stop PACKAGECONFIG appending to -native?

Cheers,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



