Return-Path: <Zhiquan.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 44D32763F2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 01:41:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9T1fsvr011623
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 28 Oct 2015 18:41:54 -0700 (PDT)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 28 Oct 2015 18:41:53 -0700
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
References: <1445594855-39110-1-git-send-email-zhiquan.li@windriver.com>
	<1445594855-39110-2-git-send-email-zhiquan.li@windriver.com>
	<20151026124914.2854e87e@adi-pc-linux>
	<689881552969744788D482C9A8FAED214EBAA9@ALA-MBB.corp.ad.wrs.com>
	<20151027124927.448d2c15@adi-pc-linux>
From: Zhiquan Li <zhiquan.li@windriver.com>
Message-ID: <56317960.6030108@windriver.com>
Date: Thu, 29 Oct 2015 09:41:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20151027124927.448d2c15@adi-pc-linux>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/1] snort: fix m4 causes out of memory during configure [ LIN8-299 ]
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Oct 2015 01:41:57 -0000
X-Groupsio-MsgNum: 58125
Content-Type: multipart/mixed; boundary="------------020105090307040106020804"

--------------020105090307040106020804
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 2015.10.27 18:49, Ioan-Adrian Ratiu wrote:
> On Tue, 27 Oct 2015 09:54:07 +0000
> "Li, Zhiquan" <Zhiquan.Li@windriver.com> wrote:
>
>> I need to evaluate the possibility to upgrade the snort recipe to >2.9.7, because upgrade to > 2.9.7, some patches will not work anymore and the daq recipe also need to be upgraded to 2.0.4 at least. The side-effect is uncertainty.
>>
> What exactly do you mean by "patches will not work anymore"?.
> Do you mean thy do not apply on >2.9.7? AFAIK two of those
> patches are not needed in 2.9.7.6 (fixed upstream), the others
> just need refreshing.
I've tried to upgrade snort from 2.9.6.0 to 2.9.7.5, as its dependency I 
also upgrade daq recipe from 2.0.2 to 2.0.6, and accordingly update the 
patches:
* add 2 new patches for snort to solve the cross compile issues.
* discard a snort patch since it is not needed.
* refresh the patch for daq new version.
Please see the attachment for the changes.

Unfortunately , it was failed when packaging debug files, the rpm 
debugedit complain: canonicalization unexpectedly shrank by one character.
At a glance it is a bug of debugedit, please see: 
http://sourceforge.net/p/snort/mailman/message/34130268/
Redhat hasn't resolved this bug: 
https://bugzilla.redhat.com/show_bug.cgi?id=304121

So, the options are:
* Fix rpm debugedit bug and update it to OE
* Take the workaround that skip the snort debug package
* Backport the fix from snort upstream

>   ________________________________________
>> From: Ioan-Adrian Ratiu [adrian.ratiu@ni.com]
>> Sent: Monday, October 26, 2015 6:49 PM
>> To: Li, Zhiquan
>> Cc: openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] [PATCH 1/1] snort: fix m4 causes out of memory during configure [ LIN8-299 ]
>>
>> On Fri, 23 Oct 2015 18:07:35 +0800
>> Zhiquan Li <zhiquan.li@windriver.com> wrote:
>>
>>> Issue: LIN8-299
>>>
>>> There is an incorrect m4_define() in configure.in which will result in an
>>> infinite recursion, and it doesn't make sense, since snort 2.9.7 it has been
>>> commented out. We follow this solution to fix it.
>>>
>>> Upstream-Status: Backport
>>>
>>> (LOCAL REV: NOT UPSTREAM) -- Sent to oe-devel on 20151023
>>>
>>> Signed-off-by: Zhiquan Li <zhiquan.li@windriver.com>
>>> ---
>>>   .../snort/snort/m4-oom-during-configure.patch       | 21 +++++++++++++++++++++
>>>   .../recipes-connectivity/snort/snort_2.9.6.0.bb     | 16 +++-------------
>>>   2 files changed, 24 insertions(+), 13 deletions(-)
>>>   create mode 100644 meta-networking/recipes-connectivity/snort/snort/m4-oom-during-configure.patch
>>>
>>> diff --git a/meta-networking/recipes-connectivity/snort/snort/m4-oom-during-configure.patch b/meta-networking/recipes-connectivity/snort/snort/m4-oom-during-configure.patch
>>> new file mode 100644
>>> index 0000000..2250611
>>> --- /dev/null
>>> +++ b/meta-networking/recipes-connectivity/snort/snort/m4-oom-during-configure.patch
>>> @@ -0,0 +1,21 @@
>>> +Upstream-Status: Backport
>>> +
>>> +There is an incorrect m4_define() in configure.in which will result in an
>>> +infinite recursion, and it doesn't make sense, since snort 2.9.7 it has been
>>> +commented out. We follow this solution to fix it.
>>> +
>> Doesn't it make more sense to upgrade the snort recipe to >2.9.7 than
>> backporting this fix?
>>
>>> +Signed-off-by: Zhiquan Li <zhiquan.li@windriver.com>
>>> +
>>> +--- a/configure.in   2015-10-22 13:58:50.743367251 +0800
>>> ++++ b/configure.in   2015-10-22 13:59:13.855366117 +0800
>>> +@@ -1100,8 +1100,8 @@
>>> + # Define PKG_CHECK_MODULES if it doesnt already exist.
>>> + #file_ This prevents './configure' from erroring on machines that dont have
>>> + # 'pkgconfig' installed.
>>> +-m4_ifdef([PKG_CHECK_MODULES],[], [m4_define([PKG_CHECK_MODULES],
>>> +-     [echo "PKG_CHECK_MODULES not defined"])])
>>> ++#m4_ifdef([PKG_CHECK_MODULES],[], [m4_define([PKG_CHECK_MODULES],
>>> ++#     [echo "PKG_CHECK_MODULES not defined"])])
>>> +
>>> + if test "x$enable_rzb_saac" = "xyes"; then
>>> +     AC_CHECK_PROG(PKG_CONFIG,pkg-config,yes)
>>> diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
>>> index 66653c6..65dc524 100644
>>> --- a/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
>>> +++ b/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
>>> @@ -6,19 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=78fa8ef966b48fbf9095e13cc92377c5"
>>>
>>>   DEPENDS = "libpcap libpcre daq libdnet util-linux"
>>>
>>> -# Blacklist:
>>> -#
>>> -# http://errors.yoctoproject.org/Errors/Details/8936/
>>> -#
>>> -# snort failure is again very nasty, because it's m4 which eats all
>>> -# available memory and swap before it's killed by OOM killer.
>>> -#
>>> -# Luckily it always picked m4
>>> -#
>>> -# [Wed Feb 18 19:00:51 2015] Out of memory: Kill process 28522 (m4) score 961 or sacrifice child
>>> -# [Wed Feb 18 19:10:51 2015] Out of memory: Kill process 45228 (m4) score 958 or sacrifice child
>>> -# ...
>>> -PNBLACKLIST[snort] ?= "BROKEN: autotools processing causes OOM condition on configure"
>>>
>>>   SRC_URI = " ${GENTOO_MIRROR}/${BP}.tar.gz;name=tarball \
>>>               file://snort.init \
>>> @@ -26,6 +13,7 @@ SRC_URI = " ${GENTOO_MIRROR}/${BP}.tar.gz;name=tarball \
>>>               file://disable-dap-address-space-id.patch \
>>>               file://0001-libpcap-search-sysroot-for-headers.patch \
>>>               file://not-hardcoded-libdir.patch \
>>> +            file://m4-oom-during-configure.patch \
>>>   "
>>>
>>>   SRC_URI[tarball.md5sum] = "18111f6de3989ca89add36077a7c2659"
>>> @@ -45,6 +33,8 @@ EXTRA_OECONF = " \
>>>        --disable-static-daq \
>>>        --with-dnet-includes=${STAGING_INCDIR} \
>>>        --with-dnet-libraries=${STAGING_LIBDIR} \
>>> +     --with-libpcre-includes=${STAGING_INCDIR} \
>>> +     --with-libpcre-libraries=${STAGING_INCDIR} \
>>>        "
>>>
>>>   # if you want to disable it, you need to patch configure.in first
>


--------------020105090307040106020804
Content-Type: text/x-patch; name="0001-snort-2.9.6.0-2.9.7.5.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="0001-snort-2.9.6.0-2.9.7.5.patch"

From 1102e1b909f59ae0094d69b37cfdaa1d1ca4cee7 Mon Sep 17 00:00:00 2001
From: Zhiquan Li <zhiquan.li@windriver.com>
Date: Wed, 28 Oct 2015 11:06:17 +0800
Subject: [PATCH] snort: 2.9.6.0 -> 2.9.7.5

Issue: LIN8-299

Upgrade snort from 2.9.6.0 to 2.9.7.5. As dependency upgrade daq from
2.0.2 to 2.0.6.

* adapt daq patch
* add 2 patches for snort to solve configure error

Signed-off-by: Zhiquan Li <zhiquan.li@windriver.com>
---
 .../recipes-connectivity/daq/daq_2.0.2.bb          | 26 -------
 .../recipes-connectivity/daq/daq_2.0.6.bb          | 26 +++++++
 ...le-run-test-program-while-cross-compiling.patch | 18 +++--
 .../snort/snort/disable-daq-flow-id.patch          | 50 +++++++++++++
 .../snort/snort/disable-daq-verdict-retry.patch    | 51 +++++++++++++
 .../recipes-connectivity/snort/snort_2.9.6.0.bb    | 84 ---------------------
 .../recipes-connectivity/snort/snort_2.9.7.5.bb    | 86 ++++++++++++++++++++++
 7 files changed, 223 insertions(+), 118 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/daq/daq_2.0.2.bb
 create mode 100644 meta-networking/recipes-connectivity/daq/daq_2.0.6.bb
 create mode 100644 meta-networking/recipes-connectivity/snort/snort/disable-daq-flow-id.patch
 create mode 100644 meta-networking/recipes-connectivity/snort/snort/disable-daq-verdict-retry.patch
 delete mode 100644 meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
 create mode 100644 meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb

diff --git a/meta-networking/recipes-connectivity/daq/daq_2.0.2.bb b/meta-networking/recipes-connectivity/daq/daq_2.0.2.bb
deleted file mode 100644
index b8f8407..0000000
--- a/meta-networking/recipes-connectivity/daq/daq_2.0.2.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY = "The dump DAQ test the various inline mode features "
-HOMEPAGE = "http://www.snort.org"
-SECTION = "libs"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f9ce51a65dd738dc1ae631d8b21c40e0"
-
-PARALLEL_MAKE = ""
-
-DEPENDS = "libpcap libpcre libdnet"
-
-SRC_URI = "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
-            file://disable-run-test-program-while-cross-compiling.patch "
-
-# these 2 create undeclared dependency on libdnet and libnetfilter-queue from meta-networking
-# this error from test-dependencies script:
-# daq/daq/latest lost dependency on  libdnet libmnl libnetfilter-queue libnfnetlink
-#
-# never look to /usr/local lib while cross compiling
-
-EXTRA_OECONF = "--disable-nfq-module --disable-ipq-module --includedir=${includedir} \
-	--with-libpcap-includes=${STAGING_INCDIR} --with-dnet-includes=${STAGING_LIBDIR}"
-
-SRC_URI[md5sum] = "865bf9b750a2a2ca632591a3c70b0ea0"
-SRC_URI[sha256sum] = "d65d1e67c4994e02c3142c49a648642e780b7e3d942b4a51f605309beac269a8"
-
-inherit autotools
diff --git a/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb b/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb
new file mode 100644
index 0000000..2ef4e93
--- /dev/null
+++ b/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb
@@ -0,0 +1,26 @@
+SUMMARY = "The dump DAQ test the various inline mode features "
+HOMEPAGE = "http://www.snort.org"
+SECTION = "libs"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f9ce51a65dd738dc1ae631d8b21c40e0"
+
+PARALLEL_MAKE = ""
+
+DEPENDS = "libpcap libpcre libdnet"
+
+SRC_URI = "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
+           file://disable-run-test-program-while-cross-compiling.patch "
+
+# these 2 create undeclared dependency on libdnet and libnetfilter-queue from meta-networking
+# this error from test-dependencies script:
+# daq/daq/latest lost dependency on  libdnet libmnl libnetfilter-queue libnfnetlink
+#
+# never look to /usr/local lib while cross compiling
+
+EXTRA_OECONF = "--disable-nfq-module --disable-ipq-module --includedir=${includedir} \
+	--with-libpcap-includes=${STAGING_INCDIR} --with-dnet-includes=${STAGING_LIBDIR}"
+
+SRC_URI[md5sum] = "2cd6da422a72c129c685fc4bb848c24c"
+SRC_URI[sha256sum] = "b40e1d1273e08aaeaa86e69d4f28d535b7e53bdb3898adf539266b63137be7cb"
+
+inherit autotools
diff --git a/meta-networking/recipes-connectivity/daq/files/disable-run-test-program-while-cross-compiling.patch b/meta-networking/recipes-connectivity/daq/files/disable-run-test-program-while-cross-compiling.patch
index 12a6cba..a100b7c 100644
--- a/meta-networking/recipes-connectivity/daq/files/disable-run-test-program-while-cross-compiling.patch
+++ b/meta-networking/recipes-connectivity/daq/files/disable-run-test-program-while-cross-compiling.patch
@@ -5,12 +5,13 @@ configure: error: cannot run test program while cross compiling
 
 Signed-off-by: Chunrong Guo <B40290@freescale.com>
 
---- a/m4/sf.m4old	2013-08-30 04:08:18.768409680 -0500
-+++ b/m4/sf.m4	2013-08-30 04:09:24.591367890 -0500
-@@ -135,19 +135,6 @@
+--- a/m4/sf.m4old    2015-10-28 10:21:20.270557986 +0800
++++ a/m4/sf.m4       2015-10-28 10:23:22.726551974 +0800
+@@ -135,20 +135,7 @@
+         echo
          exit 1
      fi
-     AC_MSG_CHECKING([for libpcap version >= $1])
+-    AC_CACHE_CHECK([for libpcap version >= $1], [daq_cv_libpcap_version_1x], [
 -    AC_RUN_IFELSE(
 -    [AC_LANG_PROGRAM(
 -    [[
@@ -22,8 +23,9 @@ Signed-off-by: Chunrong Guo <B40290@freescale.com>
 -        if (strcmp(pcap_version, $1) < 0)
 -            return 1;
 -    ]])],
--    [libpcap_version_1x="yes"],
--    [libpcap_version_1x="no"])
-     if test "x$libpcap_version_1x" = "xno"; then
-         AC_MSG_RESULT(no)
+-    [daq_cv_libpcap_version_1x="yes"],
+-    [daq_cv_libpcap_version_1x="no"])])
++    AC_CACHE_CHECK([for libpcap version >= $1], [daq_cv_libpcap_version_1x])
+     if test "x$daq_cv_libpcap_version_1x" = "xno"; then
          echo
+         echo "    ERROR!  Libpcap library version >= $1  not found."
diff --git a/meta-networking/recipes-connectivity/snort/snort/disable-daq-flow-id.patch b/meta-networking/recipes-connectivity/snort/snort/disable-daq-flow-id.patch
new file mode 100644
index 0000000..e6afcab
--- /dev/null
+++ b/meta-networking/recipes-connectivity/snort/snort/disable-daq-flow-id.patch
@@ -0,0 +1,50 @@
+Upstream-Status:Inappropriate [embedded specific]
+
+fix the below error:
+checking for daq flow ID... configure:
+configure: error: cannot run test program while cross compiling
+
+
+--- a/configure.in    2015-10-28 10:36:42.918512690 +0800
++++ b/configure.in    2015-10-28 10:37:36.738510048 +0800
+@@ -716,23 +716,23 @@
+ #        [DAQ version supports address space ID in header.])
+ #fi
+
+-AC_MSG_CHECKING([for daq flow ID])
+-AC_RUN_IFELSE(
+-[AC_LANG_PROGRAM(
+-[[
+-#include <daq.h>
+-]],
+-[[
+-   DAQ_PktHdr_t hdr;
+-   hdr.flow_id = 0;
+-]])],
+-[have_daq_flow_id="yes"],
+-[have_daq_flow_id="no"])
+-AC_MSG_RESULT($have_daq_flow_id)
+-if test "x$have_daq_flow_id" = "xyes"; then
+-    AC_DEFINE([HAVE_DAQ_FLOW_ID],[1],
+-        [DAQ version supports flow ID in header.])
+-fi
++#AC_MSG_CHECKING([for daq flow ID])
++#AC_RUN_IFELSE(
++#[AC_LANG_PROGRAM(
++#[[
++##include <daq.h>
++#]],
++#[[
++#   DAQ_PktHdr_t hdr;
++#   hdr.flow_id = 0;
++#]])],
++have_daq_flow_id="yes"
++#[have_daq_flow_id="no"])
++#AC_MSG_RESULT($have_daq_flow_id)
++#if test "x$have_daq_flow_id" = "xyes"; then
++#    AC_DEFINE([HAVE_DAQ_FLOW_ID],[1],
++#        [DAQ version supports flow ID in header.])
++#fi
+
+ AC_MSG_CHECKING([for DAQ_VERDICT_RETRY])
+ AC_RUN_IFELSE(
diff --git a/meta-networking/recipes-connectivity/snort/snort/disable-daq-verdict-retry.patch b/meta-networking/recipes-connectivity/snort/snort/disable-daq-verdict-retry.patch
new file mode 100644
index 0000000..1a13298
--- /dev/null
+++ b/meta-networking/recipes-connectivity/snort/snort/disable-daq-verdict-retry.patch
@@ -0,0 +1,51 @@
+Upstream-Status:Inappropriate [embedded specific]
+
+fix the below error:
+checking for DAQ_VERDICT_RETRY... configure:
+configure: error: cannot run test program while cross compiling
+
+
+--- a/configure.in    2015-10-28 10:45:18.174487395 +0800
++++ b/configure.in    2015-10-28 10:45:47.586485951 +0800
+@@ -734,23 +734,23 @@
+ #        [DAQ version supports flow ID in header.])
+ #fi
+
+-AC_MSG_CHECKING([for DAQ_VERDICT_RETRY])
+-AC_RUN_IFELSE(
+-[AC_LANG_PROGRAM(
+-[[
+-#include <daq.h>
+-]],
+-[[
+-   DAQ_Verdict verdict;
+-   verdict = DAQ_VERDICT_RETRY;
+-]])],
+-[have_daq_verdict_retry="yes"],
+-[have_daq_verdict_retry="no"])
+-AC_MSG_RESULT($have_daq_verdict_retry)
+-if test "x$have_daq_verdict_retry" = "xyes"; then
+-    AC_DEFINE([HAVE_DAQ_VERDICT_RETRY],[1],
+-        [DAQ version supports DAQ_VERDICT_RETRY in DAQ_Verdict.])
+-fi
++#AC_MSG_CHECKING([for DAQ_VERDICT_RETRY])
++#AC_RUN_IFELSE(
++#[AC_LANG_PROGRAM(
++#[[
++##include <daq.h>
++#]],
++#[[
++#   DAQ_Verdict verdict;
++#   verdict = DAQ_VERDICT_RETRY;
++#]])],
++have_daq_verdict_retry="yes"
++#[have_daq_verdict_retry="no"])
++#AC_MSG_RESULT($have_daq_verdict_retry)
++#if test "x$have_daq_verdict_retry" = "xyes"; then
++#    AC_DEFINE([HAVE_DAQ_VERDICT_RETRY],[1],
++#        [DAQ version supports DAQ_VERDICT_RETRY in DAQ_Verdict.])
++#fi
+
+ # any sparc platform has to have this one defined.
+ AC_MSG_CHECKING(for sparc)
+
diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
deleted file mode 100644
index 65dc524..0000000
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
+++ /dev/null
@@ -1,84 +0,0 @@
-DESCRIPTION = "snort - a free lightweight network intrusion detection system for UNIX and Windows."
-HOMEPAGE = "http://www.snort.org/"
-SECTION = "net"
-LICENSE = "GPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=78fa8ef966b48fbf9095e13cc92377c5"
-
-DEPENDS = "libpcap libpcre daq libdnet util-linux"
-
-
-SRC_URI = " ${GENTOO_MIRROR}/${BP}.tar.gz;name=tarball \
-            file://snort.init \
-            file://disable-inaddr-none.patch \
-            file://disable-dap-address-space-id.patch \
-            file://0001-libpcap-search-sysroot-for-headers.patch \
-            file://not-hardcoded-libdir.patch \
-            file://m4-oom-during-configure.patch \
-"
-
-SRC_URI[tarball.md5sum] = "18111f6de3989ca89add36077a7c2659"
-SRC_URI[tarball.sha256sum] = "3cc6c8a9b52f4c863a5736a73b4012aff340b50b5e002771b04d4877f47cd19e"
-
-inherit autotools gettext update-rc.d pkgconfig
-
-INITSCRIPT_NAME = "snort"
-INITSCRIPT_PARAMS = "defaults"
-
-EXTRA_OECONF = " \
-	--enable-gre \
-	--enable-linux-smp-stats \
-	--enable-reload \
-	--enable-reload-error-restart \
-	--enable-targetbased \
-	--disable-static-daq \
-	--with-dnet-includes=${STAGING_INCDIR} \
-	--with-dnet-libraries=${STAGING_LIBDIR} \
-	--with-libpcre-includes=${STAGING_INCDIR} \
-	--with-libpcre-libraries=${STAGING_INCDIR} \
-	"
-
-# if you want to disable it, you need to patch configure.in first
-# AC_CHECK_HEADERS([openssl/sha.h],, SHA_H="no")
-# is called even with --without-openssl-includes
-PACKAGECONFIG ?= "openssl"
-PACKAGECONFIG[openssl] = "--with-openssl-includes=${STAGING_INCDIR} --with-openssl-libraries=${STAGING_LIBDIR}, --without-openssl-includes --without-openssl-libraries, openssl,"
-
-do_install_append() {
-    install -d ${D}/${sysconfdir}/snort/rules
-    install -d ${D}/${sysconfdir}/snort/preproc_rules
-    install -d ${D}${sysconfdir}/init.d
-    for i in map config conf dtd; do
-        cp ${S}/etc/*.$i ${D}/${sysconfdir}/snort/
-    done
-    cp ${S}/preproc_rules/*.rules ${D}/${sysconfdir}/snort/preproc_rules/
-    install -m 755 ${WORKDIR}/snort.init ${D}/${sysconfdir}/init.d/snort
-    mkdir -p ${D}/${localstatedir}/log/snort
-    install -d ${D}/var/log/snort
-}
-
-FILES_${PN} += " \
-	${libdir}/snort_dynamicengine/*.so.* \
-	${libdir}/snort_dynamicpreprocessor/*.so.* \
-	${libdir}/snort_dynamicrules/*.so.* \
-	"
-FILES_${PN}-dbg += " \
-	${libdir}/snort_dynamicengine/.debug \
-	${libdir}/snort_dynamicpreprocessor/.debug \
-	${libdir}/snort_dynamicrules/.debug \
-	"
-FILES_${PN}-staticdev += " \
-	${libdir}/snort_dynamicengine/*.a \
-	${libdir}/snort_dynamicpreprocessor/*.a \
-	${libdir}/snort_dynamicrules/*.a \
-	${libdir}/snort/dynamic_preproc/*.a \
-	${libdir}/snort/dynamic_output/*.a \
-	"
-FILES_${PN}-dev += " \
-	${libdir}/snort_dynamicengine/*.la \
-	${libdir}/snort_dynamicpreprocessor/*.la \
-	${libdir}/snort_dynamicrules/*.la \
-	${libdir}/snort_dynamicengine/*.so \
-	${libdir}/snort_dynamicpreprocessor/*.so \
-	${libdir}/snort_dynamicrules/*.so \
-	${prefix}/src/snort_dynamicsrc \
-	"
diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb
new file mode 100644
index 0000000..9a34805
--- /dev/null
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb
@@ -0,0 +1,86 @@
+DESCRIPTION = "snort - a free lightweight network intrusion detection system for UNIX and Windows."
+HOMEPAGE = "http://www.snort.org/"
+SECTION = "net"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=78fa8ef966b48fbf9095e13cc92377c5"
+
+DEPENDS = "libpcap libpcre daq libdnet util-linux"
+
+
+SRC_URI = " ${GENTOO_MIRROR}/${BP}.tar.gz;name=tarball \
+            file://snort.init \
+            file://disable-inaddr-none.patch \
+            file://disable-dap-address-space-id.patch \
+            file://disable-daq-flow-id.patch \
+            file://disable-daq-verdict-retry.patch \
+            file://0001-libpcap-search-sysroot-for-headers.patch \
+"
+
+SRC_URI[tarball.md5sum] = "fd271788c0f8876be87a858a9142f202"
+SRC_URI[tarball.sha256sum] = "ad03f11b5301b16642199a86aa90388eaa53f5003f83b0c5595745a490047be1"
+
+inherit autotools gettext update-rc.d pkgconfig
+
+INITSCRIPT_NAME = "snort"
+INITSCRIPT_PARAMS = "defaults"
+
+EXTRA_OECONF = " \
+	--enable-gre \
+	--enable-linux-smp-stats \
+	--enable-reload \
+	--enable-reload-error-restart \
+	--enable-targetbased \
+	--disable-static-daq \
+	--with-dnet-includes=${STAGING_INCDIR} \
+	--with-dnet-libraries=${STAGING_LIBDIR} \
+	--with-libpcre-includes=${STAGING_INCDIR} \
+	--with-libpcre-libraries=${STAGING_INCDIR} \
+    --with-daq-includes=${STAGING_INCDIR} \
+    --with-daq-libraries=${STAGING_INCDIR} \
+	"
+
+# if you want to disable it, you need to patch configure.in first
+# AC_CHECK_HEADERS([openssl/sha.h],, SHA_H="no")
+# is called even with --without-openssl-includes
+PACKAGECONFIG ?= "openssl"
+PACKAGECONFIG[openssl] = "--with-openssl-includes=${STAGING_INCDIR} --with-openssl-libraries=${STAGING_LIBDIR}, --without-openssl-includes --without-openssl-libraries, openssl,"
+
+do_install_append() {
+    install -d ${D}/${sysconfdir}/snort/rules
+    install -d ${D}/${sysconfdir}/snort/preproc_rules
+    install -d ${D}${sysconfdir}/init.d
+    for i in map config conf dtd; do
+        cp ${S}/etc/*.$i ${D}/${sysconfdir}/snort/
+    done
+    cp ${S}/preproc_rules/*.rules ${D}/${sysconfdir}/snort/preproc_rules/
+    install -m 755 ${WORKDIR}/snort.init ${D}/${sysconfdir}/init.d/snort
+    mkdir -p ${D}/${localstatedir}/log/snort
+    install -d ${D}/var/log/snort
+}
+
+FILES_${PN} += " \
+	${libdir}/snort_dynamicengine/*.so.* \
+	${libdir}/snort_dynamicpreprocessor/*.so.* \
+	${libdir}/snort_dynamicrules/*.so.* \
+	"
+FILES_${PN}-dbg += " \
+	${libdir}/snort_dynamicengine/.debug \
+	${libdir}/snort_dynamicpreprocessor/.debug \
+	${libdir}/snort_dynamicrules/.debug \
+	"
+FILES_${PN}-staticdev += " \
+	${libdir}/snort_dynamicengine/*.a \
+	${libdir}/snort_dynamicpreprocessor/*.a \
+	${libdir}/snort_dynamicrules/*.a \
+	${libdir}/snort/dynamic_preproc/*.a \
+	${libdir}/snort/dynamic_output/*.a \
+	"
+FILES_${PN}-dev += " \
+	${libdir}/snort_dynamicengine/*.la \
+	${libdir}/snort_dynamicpreprocessor/*.la \
+	${libdir}/snort_dynamicrules/*.la \
+	${libdir}/snort_dynamicengine/*.so \
+	${libdir}/snort_dynamicpreprocessor/*.so \
+	${libdir}/snort_dynamicrules/*.so \
+	${prefix}/src/snort_dynamicsrc \
+	"
-- 
1.9.1


--------------020105090307040106020804--
