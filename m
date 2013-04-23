Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1UUZTm-0007My-Ch
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Apr 2013 11:25:44 +0200
Message-ID: <51764F6D.7040306@communistcode.co.uk>
Date: Tue, 23 Apr 2013 10:07:57 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130403 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1366366032-8581-1-git-send-email-ml@communistcode.co.uk>
	<1366366032-8581-2-git-send-email-ml@communistcode.co.uk>
	<20130422165350.GA3217@jama>
In-Reply-To: <20130422165350.GA3217@jama>
Subject: Re: [PATCH 1/2] php: add sqlite3 and mysql PACKAGECONFIG options
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
X-List-Received-Date: Tue, 23 Apr 2013 09:25:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 22/04/13 17:53, Martin Jansa wrote:
> On Fri, Apr 19, 2013 at 11:07:11AM +0100, Jack Mitchell wrote:
>> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>>
>> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>> ---
>>   meta-oe/recipes-devtools/php/php.inc | 29 ++++++++++++++++++++---------
>>   1 file changed, 20 insertions(+), 9 deletions(-)
>>
>> diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
>> index 225c3d7..892a0b5 100644
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
>> @@ -40,6 +35,22 @@ EXTRA_OECONF_virtclass-native = "--with-cgi --without-libpng --without-libjpeg \
>>                   ${COMMON_EXTRA_OECONF} \
>>   "
>>   
>> +PACKAGECONFIG ??= "mysql sqlite3"
>> +PACKAGECONFIG_class-native = ""
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
>> -- 
>> 1.8.2.1
> Now target php is failing with:
> | configure:61165: result: no
> | configure:61215: error: Cannot find MySQL header files under
> "/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr".
> | Note that the MySQL client library is not bundled anymore!
>
> full log here:
> qemuarm
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130422_080202.log/bitbake.world.log
>
> qemux86
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130422_125516.log/bitbake.world.log
>

I don't know what is going on here as I can't trigger it my end, 
possibly a race condition? I wouldn't think so though, as mysql5 is a 
direct depends of php.

[09:42:58 jack ccoR0005]$ bitbake -c cleansstate mysql5 php
Loading cache: 100% 
|#################################################################################| 
ETA:  00:00:00
Loaded 64 entries from dependency cache.
Parsing recipes: 100% 
|###############################################################################| 
Time: 00:00:15
Parsing of 852 .bb files complete (46 cached, 806 parsed). 1162 targets, 
110 skipped, 0 masked, 0 errors.
WARNING: No bb files matched BBFILE_PATTERN_dblinux 
'^/mnt/SSD/oe-r0005/meta-dblinux/'

Build Configuration:
BB_VERSION        = "1.19.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Unknown"
TARGET_SYS        = "arm-oecore-linux-gnueabi"
MACHINE           = "beaglebone"
DISTRO            = "dblinux"
DISTRO_VERSION    = "1.0-20130423"
TUNE_FEATURES     = "armv7a vfp neon"
TARGET_FPU        = "vfp-neon"
meta              = "master:548fdb44bed180f05255f0ec25d18e673dce19a7"
meta-webserver    = "master:c56a702d21510157c753c48bcac8e21bbcd90a2b"
meta-db           = "master:4b608673b2928f851d379b7b1bb2d3f18c46dbac"
meta-dblinux      = "master:0abe0ab71c58cddcee35d1068f3606dacc9a1d09"
common-bsp        = "master:6d12438278bbf575c43c19262d48458a90cfe2af"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing RunQueue Tasks
NOTE: Tasks Summary: Attempted 4 tasks of which 0 didn't need to be 
rerun and all succeeded.

Summary: There was 1 WARNING message shown.
[09:43:42 jack ccoR0005]$ bitbake php
Loading cache: 100% 
|#################################################################################| 
ETA:  00:00:00
Loaded 1158 entries from dependency cache.
Parsing recipes: 100% 
|###############################################################################| 
Time: 00:00:01
Parsing of 852 .bb files complete (847 cached, 5 parsed). 1162 targets, 
110 skipped, 0 masked, 0 errors.
WARNING: No bb files matched BBFILE_PATTERN_dblinux 
'^/mnt/SSD/oe-r0005/meta-dblinux/'

Build Configuration:
BB_VERSION        = "1.19.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Unknown"
TARGET_SYS        = "arm-oecore-linux-gnueabi"
MACHINE           = "beaglebone"
DISTRO            = "dblinux"
DISTRO_VERSION    = "1.0-20130423"
TUNE_FEATURES     = "armv7a vfp neon"
TARGET_FPU        = "vfp-neon"
meta              = "master:548fdb44bed180f05255f0ec25d18e673dce19a7"
meta-webserver    = "master:c56a702d21510157c753c48bcac8e21bbcd90a2b"
meta-db           = "master:4b608673b2928f851d379b7b1bb2d3f18c46dbac"
meta-dblinux      = "master:0abe0ab71c58cddcee35d1068f3606dacc9a1d09"
common-bsp        = "master:6d12438278bbf575c43c19262d48458a90cfe2af"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Tasks Summary: Attempted 1322 tasks of which 738 didn't need to be 
rerun and all succeeded.

Summary: There was 1 WARNING message shown.
[10:06:39 jack ccoR0005]$



-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



