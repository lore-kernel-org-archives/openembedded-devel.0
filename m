Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5E8B97017B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 02:22:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7I2MOIu011334
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 17 Aug 2016 19:22:24 -0700 (PDT)
Received: from [128.224.162.178] (128.224.162.178) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Wed, 17 Aug 2016 19:22:23 -0700
To: Joe MacDonald <Joe_MacDonald@mentor.com>, <yue.tao@windriver.com>
References: <1470643473-17129-1-git-send-email-yi.zhao@windriver.com>
	<20160817135419.GA21469@mentor.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <14bdb9f6-d0f1-b114-548e-ca439ef35518@windriver.com>
Date: Thu, 18 Aug 2016 10:22:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20160817135419.GA21469@mentor.com>
X-Originating-IP: [128.224.162.178]
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] squid: fix configure host contamination
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
X-List-Received-Date: Thu, 18 Aug 2016 02:22:30 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



在 2016年08月17日 21:54, Joe MacDonald 写道:
> Hi Yi,
>
> Please include a signed-off-by and upstream-status line for patches you
> contribute.

Thanks, Joe. I will send a patch later.

Yi

>
> http://openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations
>
> This patch seems like it's probably suitable for submitting upstream,
> but I'd be content to call it inappropriate-embedded specific, if you
> don't want to send it upstream.
>
> -J.
>
> [[oe] [meta-networking][PATCH] squid: fix configure host contamination] On 16.08.08 (Mon 16:04) Yi Zhao wrote:
>
>> From: Yue Tao <yue.tao@windriver.com>
>>
>> When configuring squid with --enable-esi option,
>> the following error was observed:
>> [snip]
>> checking libxml/parser.h usability... no
>> checking libxml/parser.h presence... no
>> checking for libxml/parser.h... no
>> configure: Failed to find libxml2 header file libxml/parser.h
>> [snip]
>> ERROR: This autoconf log indicates errors, it looked at host include
>> and/or library paths while determining system capabilities.
>> [snip]
>>
>> It tried to search libxml header file in host path. Set the SYSROOT
>> to avoid this host contamination.
>>
>> Signed-off-by: Yue Tao <yue.tao@windriver.com>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>>   .../squid/files/set_sysroot_patch.patch            | 26 ++++++++++++++++++++++
>>   .../recipes-daemons/squid/squid_3.5.20.bb          |  6 +++++
>>   2 files changed, 32 insertions(+)
>>   create mode 100644 meta-networking/recipes-daemons/squid/files/set_sysroot_patch.patch
>>
>> diff --git a/meta-networking/recipes-daemons/squid/files/set_sysroot_patch.patch b/meta-networking/recipes-daemons/squid/files/set_sysroot_patch.patch
>> new file mode 100644
>> index 0000000..68733f9
>> --- /dev/null
>> +++ b/meta-networking/recipes-daemons/squid/files/set_sysroot_patch.patch
>> @@ -0,0 +1,26 @@
>> +diff --git a/configure.ac.old b/configure.ac
>> +index 54eda73..874f48e 100644
>> +--- a/configure.ac.old
>> ++++ b/configure.ac
>> +@@ -964,15 +964,15 @@ if test "x$squid_opt_use_esi" = "xyes" -a "x$with_libxml2" != "xno" ; then
>> +   dnl Find the main header and include path...
>> +   AC_CACHE_CHECK([location of libxml2 include files], [ac_cv_libxml2_include], [
>> +     AC_CHECK_HEADERS([libxml/parser.h], [], [
>> +-      AC_MSG_NOTICE([Testing in /usr/include/libxml2])
>> ++      AC_MSG_NOTICE([Testing in $SYSROOT/usr/include/libxml2])
>> +       SAVED_CPPFLAGS="$CPPFLAGS"
>> +-      CPPFLAGS="-I/usr/include/libxml2 $CPPFLAGS"
>> ++      CPPFLAGS="-I$SYSROOT/usr/include/libxml2 $CPPFLAGS"
>> +       unset ac_cv_header_libxml_parser_h
>> +-      AC_CHECK_HEADERS([libxml/parser.h], [ac_cv_libxml2_include="-I/usr/include/libxml2"], [
>> +-        AC_MSG_NOTICE([Testing in /usr/local/include/libxml2])
>> +-        CPPFLAGS="-I/usr/local/include/libxml2 $SAVED_CPPFLAGS"
>> ++      AC_CHECK_HEADERS([libxml/parser.h], [ac_cv_libxml2_include="-I$SYSROOT/usr/include/libxml2"], [
>> ++        AC_MSG_NOTICE([Testing in $SYSROOT/usr/local/include/libxml2])
>> ++        CPPFLAGS="-I$SYSROOT/usr/local/include/libxml2 $SAVED_CPPFLAGS"
>> +         unset ac_cv_header_libxml_parser_h
>> +-        AC_CHECK_HEADERS([libxml/parser.h], [ac_cv_libxml2_include="-I/usr/local/include/libxml2"], [
>> ++        AC_CHECK_HEADERS([libxml/parser.h], [ac_cv_libxml2_include="-I$SYSROOT/usr/local/include/libxml2"], [
>> +           AC_MSG_NOTICE([Failed to find libxml2 header file libxml/parser.h])
>> +         ])
>> +       ])
>> diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.20.bb b/meta-networking/recipes-daemons/squid/squid_3.5.20.bb
>> index f26aebe..3ce195a 100644
>> --- a/meta-networking/recipes-daemons/squid/squid_3.5.20.bb
>> +++ b/meta-networking/recipes-daemons/squid/squid_3.5.20.bb
>> @@ -19,6 +19,7 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${MIN_VER}/${BPN}-${P
>>              file://squid-use-serial-tests-config-needed-by-ptest.patch \
>>              file://run-ptest \
>>              file://volatiles.03_squid \
>> +           file://set_sysroot_patch.patch \
>>   "
>>   
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=c492e2d6d32ec5c1aad0e0609a141ce9 \
>> @@ -48,6 +49,11 @@ EXTRA_OECONF += "--with-default-user=squid --enable-auth-basic='${BASIC_AUTH}'"
>>   export BUILDCXXFLAGS="${BUILD_CXXFLAGS}"
>>   
>>   TESTDIR = "test-suite"
>> +
>> +do_configure_prepend() {
>> +    export SYSROOT=$PKG_CONFIG_SYSROOT_DIR
>> +}
>> +
>>   do_compile_ptest() {
>>       oe_runmake -C ${TESTDIR} buildtest-TESTS
>>   }
>> -- 
>> 2.7.4
>>


