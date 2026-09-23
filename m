Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD11EC982FA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 07:41:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1540.1790146673559809740
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Sep 2026 23:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jEA5+rBB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=372678bdcb=himaniramesh.barde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N5U6Om993280
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 06:57:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=LKuJoJeqb
	UiuH8U2avw+OSoLsxNcVk/lWdCZEJ6D84A=; b=jEA5+rBBTNvaz/zrDBrgyNXjt
	LHlTj/dJS0ZnTThOtWRca4B+LcYLzBNet3A2o7sIpBz7yPwSwaKO7CFbZdY9nBoa
	DKf/z4YVhOb1UMADf71vih3sDAhueSYP1fX9UovAIsyW8ELp8rP/cNrvyUvQHS0I
	xVDWgUM9f1AyzzleGz/MxaPpalGWTb4IcpWt7Gr/5hh2CVbGC6VdwyVadn/q6dl+
	UgjQboc6dscWrROoU3YV13WBL3ichNeBL/9Oa1m02OF1RSTNU6hTgxwivm+Xrckf
	jeRhrtHaiIAyMZ+nYqzglyzzfiCqU5xtj3uGnbB/jPirE1v469rzuLR80/tIQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gshc7p341-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 06:57:51 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 22 Sep 2026 23:57:50 -0700
Received: from oak-lpgbuild10.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 22 Sep 2026 23:57:50 -0700
From: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Randy.MacLeod@windriver.com>,
        Himani Ramesh Barde
	<HimaniRamesh.Barde@windriver.com>
Subject: [meta-oe][scarthgap][PATCH] postfix: fix build on hosts with Linux 7.x kernel
Date: Wed, 23 Sep 2026 06:57:46 +0000
Message-ID: <20260923065746.2542154-1-HimaniRamesh.Barde@windriver.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAyNyBTYWx0ZWRfX30EwGVASVjLa
 YRO0aZ8nG3jxwCWpHa9vOg57zIsBjiTouhNuq8h4N5tbbzsRTmMQ1WgYR+B243x6SWBi4+uLVRu
 WphV3J2LvRc4TO7EhI2Y+9SsJ4OW1DvcmzqC6KayjGon9qnVHM/kgN2raWD/zbEsdxKUn2saOo2
 PdmnV+ir6Snl8lcSC/FQ+DOVI+2OqwBiUWawezrhhLm+ZYGPUnwpfdq2eo7ibGjCnH+HJSy323p
 zT0lEB4OCGPf9a5ssM74W65hVUhrdi5F+QNl3KciF1c7jjrhdPq8cDOFAxpGdiwuw/Q4nOTEO+j
 KaRr4aZI4MeHFkkxUD8qOhb1KR3ndfHlppTDLEZEHdCPQUZ2pkhe7k7I+m1WbsyBP46/aLjKrPX
 ZEu4HFv+zxrJBVzJZZBxslpMWF+gpAUvbyhZzQYooY6M+viydayZRSijKECPbDENnPj2d/cpjrJ
 W4Gcwntz1ukcPyZDRlA==
X-Proofpoint-GUID: nhA9i7hr-S-G-e8em5qDdEli233ZZfOj
X-Proofpoint-ORIG-GUID: nhA9i7hr-S-G-e8em5qDdEli233ZZfOj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAyNyBTYWx0ZWRfX3whU/xIvZsfZ
 vHkQAZvp18H3tsIzut7oPnsnWCmXHN04hMm4sVsVGZOQckgjJd66TeEgdZ/A+REOkdxTNaNBe/w
 pO6UhyxzFv6+tElm9UA9chzkgyFuzxdA5UoDbpkAbtRddLOGZYaF
X-Authority-Analysis: v=2.4 cv=feM4WEQF c=1 sm=1 tr=0 ts=6ab3786f cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=VJYubktbAAAA:8 a=e1GkridNAAAA:8 a=t7CeM3EgAAAA:8
 a=uSz_AfzkImT7HWIo5TwA:9 a=OqWDEjY5HwswFcA5adJo:22 a=6ft9yNkZjdd813gQxDxM:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230027
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 07:41:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130187

makedefs only recognizes kernel majors 3-6. Hosts running a 7.x
kernel get "Unknown system type: Linux 7.0.0-..." and the native
build fails. Add 7 to the version match in makedefs and sys_defs.h.

Already fixed in postfix 3.11.

Upstream-Status: Backport [postfix 3.11]
Signed-off-by: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
---
 ...kedefs-Account-for-linux-7.x-version.patch | 47 +++++++++++++++++++
 .../recipes-daemons/postfix/postfix_3.8.19.bb |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/postfix/files/0001-makedefs-Account-for-linux-7.x-version.patch

diff --git a/meta-networking/recipes-daemons/postfix/files/0001-makedefs-Account-for-linux-7.x-version.patch b/meta-networking/recipes-daemons/postfix/files/0001-makedefs-Account-for-linux-7.x-version.patch
new file mode 100644
index 0000000000..4bc59ace7d
--- /dev/null
+++ b/meta-networking/recipes-daemons/postfix/files/0001-makedefs-Account-for-linux-7.x-version.patch
@@ -0,0 +1,47 @@
+From 5466d510dfbc2b7a81dcf766f83d2c89066c0446 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 11 May 2026 18:16:07 +0000
+Subject: [PATCH] makedefs: Account for linux 7.x version
+
+Major version has bumped to 7, update the scripts
+
+Upstream-Status: Backport [The latest stable version 3.11 already fixed]
+
+Refer:
+https://www.ftp.saix.net/MTA/postfix/index.html
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ makedefs            | 2 +-
+ src/util/sys_defs.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/makedefs b/makedefs
+index 74b103d..fe8c618 100644
+--- a/makedefs
++++ b/makedefs
+@@ -625,7 +625,7 @@ EOF
+ 		: ${SHLIB_ENV="LD_LIBRARY_PATH=`pwd`/lib"}
+ 		: ${PLUGIN_LD="${CC-gcc} -shared"}
+ 		;;
+-    Linux.[3456].*)
++    Linux.[34567].*)
+ 		SYSTYPE=LINUX$RELEASE_MAJOR
+ 		case "$CCARGS" in
+ 		 *-DNO_DB*) ;;
+diff --git a/src/util/sys_defs.h b/src/util/sys_defs.h
+index 70aab23..c5472eb 100644
+--- a/src/util/sys_defs.h
++++ b/src/util/sys_defs.h
+@@ -763,7 +763,7 @@ extern int initgroups(const char *, int);
+   * LINUX.
+   */
+ #if defined(LINUX2) || defined(LINUX3) || defined(LINUX4) || defined(LINUX5) \
+-	|| defined(LINUX6)
++	|| defined(LINUX6) || defined(LINUX7)
+ #define SUPPORTED
+ #define UINT32_TYPE	unsigned int
+ #define UINT16_TYPE	unsigned short
+-- 
+2.53.0
+
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.8.19.bb b/meta-networking/recipes-daemons/postfix/postfix_3.8.19.bb
index 018e8d89bb..ad770651d8 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.8.19.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.8.19.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch \
            file://0004-Fix-icu-config.patch \
            file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
+           file://0001-makedefs-Account-for-linux-7.x-version.patch \
            "
 
 SRC_URI[sha256sum] = "1ebaec340fea1b80a9c88d276f07bed0886cc4f000753cf310223affb427754b"
-- 
2.53.0


