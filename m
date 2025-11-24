Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC4A7CFD351
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 19:16:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25100.1764011782683996687
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Nov 2025 11:16:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Td05iTV3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3423dfbde2=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AOIvwf02473411
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Nov 2025 11:16:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=EiaLOXm08GVmXBM6NGiT
	mSv+FYs3YF7b7Y+OpdPz/GU=; b=Td05iTV3PZGjtnlcYVu0QVjofV+wLy5PbI9q
	ODoBwJto0RrefSZa6rdmYS09f895JG52PnFHGKcMML1C85nBnkZskff3XaRNuagR
	UkaygFPXv+ROQaEM+Y8O5yquoTLjksSe367bUF47DnTtX1YLRMz/lrgSsWHZ+IcW
	tqRc5CG4IBu8AqeESUh6pD5nSU6Dy04FLEXi5LjzXits7LO72lPOwYOzZ3K6depL
	slD+PBgHqgSCJXt4S5paqLfefXz8scLScAw/smCSSG4pX/I6hVuUFEx5ZYTP2ghc
	QKg3FNIqwfOCkM0PEcWZr6f6Y91iNpBTLkqebDMkS1CweZ9eIw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ak9b5a3g7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Nov 2025 11:16:20 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 24 Nov 2025 11:16:20 -0800
Received: from pop-os.wrs.com (10.11.232.110) by ala-exchng01.corp.ad.wrs.com
 (10.11.224.121) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Mon, 24 Nov 2025 11:16:19 -0800
From: <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] rsyslog: upgrade 8.2506.0 -> 8.2510.0
Date: Mon, 24 Nov 2025 14:16:19 -0500
Message-ID: <20251124191619.1736906-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=fozRpV4f c=1 sm=1 tr=0 ts=6924af04 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=mARdm0pwAAAA:20
 a=NEAV23lmAAAA:8 a=l1wGsfgFAAAA:8 a=t7CeM3EgAAAA:8 a=hcSbMtdYAAAA:8
 a=FWkxQITNuaCyVRJibPwA:9 a=CI21Z8RBj5jRF4K-G4xJ:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=Y2yNOTIXHH_QwTZgY79a:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDE2OCBTYWx0ZWRfX11aW2+QkFEG7
 OJgk+4lAVhkns2LvixT7noNtpN2mm4R3FTt+GB4Uu9E+p/jvJ5s8qeZiSuye54jU619jWtO1S3i
 c8emoiUdq0uGhpMqjjRNWQ6vgEB+zpUohGZDb2orsmle58BwF+qQldNFhtCK8CuD8eoEUHeidJV
 ittQczM+54MVT29GtEgw4yuuenOsUAnl9hYI5Qego/CklTO02t/tpfg1tRrW799z09o2RmJpbSk
 qNxHobaz6Pcae50fe/8umgTdte7UQ/BJPjTETkRVcCu6W4Y5pWqiTDcaa90burFOzRtjT28UMj4
 SdD5TL84RJ1Qk/l6zKxato6JpyzEG97GzfdSdNBaoK51HA/nxYwq25KkTv/i+9Z+i9wvEqHIU4R
 aBH8HQeed18saOII5y1JcMQVg5wclQ==
X-Proofpoint-GUID: XzEI5316wMoMGMlt86wfFekreV8vmDno
X-Proofpoint-ORIG-GUID: XzEI5316wMoMGMlt86wfFekreV8vmDno
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_07,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240168
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Nov 2025 19:16:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122019

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Full Changelog:
   https://github.com/rsyslog/rsyslog/blob/v8-stable/ChangeLog

Avoid buildpath error:
   QA Issue: File /usr/lib/rsyslog/ptest/tests/.deps/liboverride_getaddrinfo_la-override_getaddrinfo.Plo
These .deps directories are created at configure time and mainly used
in an interactive development environment. Remove test/.deps to eliminate
the error.

Drop: use-pkgconfig-to-check-libgcrypt.patch
since it's implemented upstream by:
   85e03c0e8 Replace libgcrypt-config with pkg-config
   8ba35bf6c Add missing libraries to pkg-config call
as per: https://github.com/rsyslog/rsyslog/pull/5406/commits

For musl, drop: 0001-Include-sys-time-h.patch
which oddly doesn't seem to be required to build any of: qemux86-64, qemuarm64,
and qemuarm.

Rebase other patches as needed.

ptest results for qemux86-64/kvm with extra FS space and 2 GB RAM:

   Version | Total | Passed | Failed | Skipped
   8.2506  |   485 |    479 |      0 |       6
   8.2510  |   497 |    491 |      0 |       6

rsyslog works when built with musl but there are lots of ptest failures:

   Version | Total | Passed | Failed | Skipped
   8.2506  |   485 |    306 |    172 |       7
   8.2510  |   497 |    310 |    180 |       7

Note that with this update the results are similarily bad. If someone is
interested and has time, they can work on improving the musl ptest results.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../rsyslog/0001-Include-sys-time-h.patch     | 32 --------------
 ...-tests-disable-the-check-for-inotify.patch |  8 ++--
 ...-Pass-correct-parameter-type-to-send.patch | 18 ++++----
 .../use-pkgconfig-to-check-libgcrypt.patch    | 42 -------------------
 ...syslog_8.2506.0.bb => rsyslog_8.2510.0.bb} |  6 +--
 5 files changed, 16 insertions(+), 90 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/0001-Include-sys-time-h.patch
 delete mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/use-pkgconfig-to-check-libgcrypt.patch
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.2506.0.bb => rsyslog_8.2510.0.bb} (97%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Include-sys-time-h.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Include-sys-time-h.patch
deleted file mode 100644
index 6ce8b7a9c8..0000000000
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Include-sys-time-h.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 7baf35b88d742032a2dc456c396843e17e866f8e Mon Sep 17 00:00:00 2001
-From: Ming Liu <peter.x.liu@external.atlascopco.com>
-Date: Wed, 27 Jun 2018 14:04:57 +0800
-Subject: [PATCH] Include sys/time.h
-
-struct timeval is defined in sys/time.h with a musl libc.
-
-Upstream-Status: Inappropriate [musl libc specific]
-
-Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- tests/msleep.c | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/tests/msleep.c b/tests/msleep.c
-index 98dbece..96f6950 100644
---- a/tests/msleep.c
-+++ b/tests/msleep.c
-@@ -26,11 +26,7 @@
- #include "config.h"
- #include <stdio.h>
- #include <stdlib.h>
--#if defined(__FreeBSD__)
- #include <sys/time.h>
--#else
--#include <time.h>
--#endif
- #if defined(HAVE_SYS_SELECT_H)
- #include <sys/select.h>
- #endif
-2.7.4
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check-for-inotify.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check-for-inotify.patch
index a506b7a6dc..728cdace0c 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check-for-inotify.patch
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check-for-inotify.patch
@@ -23,19 +23,19 @@ diff --git a/tests/diag.sh b/tests/diag.sh
 index a9c2a75..0b017c5 100755
 --- a/tests/diag.sh
 +++ b/tests/diag.sh
-@@ -2979,7 +2979,7 @@ case $1 in
+@@ -3683,7 +3683,7 @@
  		fi
  		;;
- 	'check-inotify') # Check for inotify/fen support 
+ 	'check-inotify') # Check for inotify/fen support
 -		if [ -n "$(find /usr/include -name 'inotify.h' -print -quit)" ]; then
 +		if true; then
  			echo [inotify mode]
  		elif [ -n "$(find /usr/include/sys/ -name 'port.h' -print -quit)" ]; then
  			grep -qF "PORT_SOURCE_FILE" < /usr/include/sys/port.h
-@@ -2994,7 +2994,7 @@ case $1 in
+@@ -3698,7 +3698,7 @@
  		fi
  		;;
- 	'check-inotify-only') # Check for ONLY inotify support 
+ 	'check-inotify-only') # Check for ONLY inotify support
 -		if [ -n "$(find /usr/include -name 'inotify.h' -print -quit)" ]; then
 +		if true; then
  			echo [inotify mode]
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-tcpflood.c-Pass-correct-parameter-type-to-send.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-tcpflood.c-Pass-correct-parameter-type-to-send.patch
index 884086bfc3..76749877b6 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-tcpflood.c-Pass-correct-parameter-type-to-send.patch
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-tcpflood.c-Pass-correct-parameter-type-to-send.patch
@@ -21,12 +21,12 @@ diff --git a/tests/tcpflood.c b/tests/tcpflood.c
 index 5e6f13a..09cedbb 100644
 --- a/tests/tcpflood.c
 +++ b/tests/tcpflood.c
-@@ -836,7 +836,7 @@ int sendMessages(struct instdata *inst)
- 			}
- 			lenSend = sendPlainTCP(socknum, buf, lenBuf, &error_number);
- 		} else if(transport == TP_UDP) {
--			lenSend = sendto(udpsockout, buf, lenBuf, 0, &udpRcvr, sizeof(udpRcvr));
-+			lenSend = sendto(udpsockout, buf, lenBuf, 0, (const struct sockaddr *)&udpRcvr, sizeof(udpRcvr));
- 			error_number = errno;
- 		} else if(transport == TP_TLS) {
- 			if(sockArray[socknum] == -1) {
+@@ -865,7 +865,7 @@
+             }
+             lenSend = sendPlainTCP(socknum, buf, lenBuf, &error_number);
+         } else if (transport == TP_UDP) {
+-            lenSend = sendto(udpsockout, buf, lenBuf, 0, &udpRcvr, sizeof(udpRcvr));
++            lenSend = sendto(udpsockout, buf, lenBuf, 0, (const struct sockaddr *)&udpRcvr, sizeof(udpRcvr));
+             error_number = errno;
+         } else if (transport == TP_TLS) {
+             if (sockArray[socknum] == -1) {
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/use-pkgconfig-to-check-libgcrypt.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/use-pkgconfig-to-check-libgcrypt.patch
deleted file mode 100644
index f5ae65fb58..0000000000
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/use-pkgconfig-to-check-libgcrypt.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From d2dd13d930c91e45417c7361908f0af75e0e6c00 Mon Sep 17 00:00:00 2001
-From: Roy Li <rongqing.li@windriver.com>
-Date: Wed, 18 Jun 2014 13:46:52 +0800
-Subject: [PATCH] use pkgconfig to check libgcrypt
-
-Upstream-Status: Inappropriate [configuration]
-
-libgcrypt does no longer provide libgcrypt-config, and provide
-*.pc, so we should use pkgconfig to check
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
----
- configure.ac | 15 +--------------
- 1 file changed, 1 insertion(+), 14 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index f8c0ac8..794bfb3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1217,20 +1217,7 @@ AC_ARG_ENABLE(libgcrypt,
-         [enable_libgcrypt=yes]
- )
- if test "x$enable_libgcrypt" = "xyes"; then
--	AC_PATH_PROG([LIBGCRYPT_CONFIG],[libgcrypt-config],[no])
--        if test "x${LIBGCRYPT_CONFIG}" = "xno"; then
--           AC_MSG_FAILURE([libgcrypt-config not found in PATH])
--        fi
--        AC_CHECK_LIB(
--		[gcrypt],
--        	[gcry_cipher_open],
--        	[LIBGCRYPT_CFLAGS="`${LIBGCRYPT_CONFIG} --cflags`"
--        	LIBGCRYPT_LIBS="`${LIBGCRYPT_CONFIG} --libs`"
--        	],
--        	[AC_MSG_FAILURE([libgcrypt is missing])],
--        	[`${LIBGCRYPT_CONFIG} --libs --cflags`]
--        	)
--	AC_DEFINE([ENABLE_LIBGCRYPT], [1], [Indicator that LIBGCRYPT is present])
-+	PKG_CHECK_MODULES(LIBGCRYPT, libgcrypt)
- fi
- AM_CONDITIONAL(ENABLE_LIBGCRYPT, test x$enable_libgcrypt = xyes)
- AM_CONDITIONAL(ENABLE_RSCRYUTIL, test x$enable_libgcrypt = xyes || test x$enable_openssl_crypto_provider = xyes)
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2506.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2510.0.bb
similarity index 97%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.2506.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.2510.0.bb
index bcac76a231..c92c11d8f3 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2506.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2510.0.bb
@@ -22,17 +22,15 @@ SRC_URI = "https://www.rsyslog.com/files/download/rsyslog/${BPN}-${PV}.tar.gz \
            file://rsyslog.conf \
            file://rsyslog.logrotate \
            file://rsyslog.service \
-           file://use-pkgconfig-to-check-libgcrypt.patch \
            file://run-ptest \
            file://0001-tests-disable-the-check-for-inotify.patch \
            file://0001-tests-tcpflood.c-Pass-correct-parameter-type-to-send.patch \
 "
 
 SRC_URI:append:libc-musl = " \
-    file://0001-Include-sys-time-h.patch \
     file://disable-omfile-outchannel.patch \
 "
-SRC_URI[sha256sum] = "6d6fd0257c95e756765d4d585a833d54dd3a0e5eeb8308b862a81b368a74bb7b"
+SRC_URI[sha256sum] = "a70a9834186859539a6a4d1c7b3f68c23897e805829b764a45e92cb0cc95e66a"
 
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/tags"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
@@ -92,6 +90,8 @@ TESTDIR = "tests"
 do_compile_ptest() {
     echo 'buildtest-TESTS: $(check_PROGRAMS)' >> ${TESTDIR}/Makefile
     oe_runmake -C ${TESTDIR} buildtest-TESTS
+    # buildpaths: remove .deps/*, an unneeded compile dependency automake artifact.
+    rm -rf ${B}/${TESTDIR}/.deps
 }
 
 do_install_ptest() {
-- 
2.34.1


