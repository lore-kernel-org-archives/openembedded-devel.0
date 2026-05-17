Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64C48CD4F4B
	for <webhook@archiver.kernel.org>; Sun, 17 May 2026 08:24:30 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20213.1779006261528301511
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2026 01:24:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=pHmCgUIu;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=kAIdLqNh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H3lmOO1090546
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5I2UQG9iyEd
	EREzBJc+ZUr2AeEADez3EN0MLrndvn40=; b=pHmCgUIuyp92qQSx7k6z6cSwHCf
	SV3LeOxabAsG7EJC2qSgJB/1f2+FvQreqi2cQIkDunWB9q2Y2sRmsbRobSznOaDm
	WBY9rWW0GK1/BDG1pzFGVZ0XUbWjdaBpQADFM5BxCGC2AJ2h/aPeD1GpjwA3Y1Rh
	nir0gy8EyrbYZ5h+hXaqSwRHhqzOn9j7wiT3w49UmFkUtnwHONcvlZocjyATDwBk
	yydpijd7kZzrwwAnIctlnRgxXFA0McztvlPtFrXR1r1Zwk/rGAVC38Q6KelbqHWa
	QRcUKrfxLDwRzG0ZXT6yh5jTzmQAz7XTWWul1viiNYSxa/NxAcKIDkyb/6g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gwmagu8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:20 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-365faf6006dso1078401a91.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 01:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779006259; x=1779611059; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5I2UQG9iyEdEREzBJc+ZUr2AeEADez3EN0MLrndvn40=;
        b=kAIdLqNhmzN4nWSPSb1zV/cW4A/MTOduFjsEGDgywbOSLB44qD5e6WgHDd06DO7GcX
         eLjDCqq0te0aUXw75zs1Gmrsl9fB/DDrN7/dpWB39hLlwFan1Z9xf405RQh2lInl65xO
         zV6ld7ORyI0aGLAHt2sL/qVhgCwqwO4MMwJbZPV2G+ejHnb7TasrhFoPovOLj1ZbBUDK
         mQoAkCBMED5zD6U6a0hWrhXO89a3EkLJ7xCu4m1iFQnsgIsNhB5pdy9mc1iuzZaVQ74m
         Wj1xEvWcy0sKwQ3nvoUSS2coC0wPPtEqVOdQvPXccd5uOvvFNUlC6Bh80fmEv2Pe+t36
         Rv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779006259; x=1779611059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5I2UQG9iyEdEREzBJc+ZUr2AeEADez3EN0MLrndvn40=;
        b=drARnatEFQ0rHZBEEJoJC8OkGPCg8PtTNPuWqFfGzsUb/vG7Rfqgh6/dpmLqPw3iNf
         Ev9hCEH5Xfk44kbc0ableu4YpYSbEnqRU2HFXCLEtpRaQQNqvf/2wK0+jdwPoECsjvYR
         acX+ul4N3YMiWPVu+iLmgz4sn+Iy1eatR/D7gpLsvhGeKyOWPK3Ec+NFgSpz3YDxWKzQ
         parCZAq4/83FbYb3Qy68hqz3Ov3XtSmeQr4Qo8aoNImI6Fq5ZYbomM7Qv/K/ftqrB54u
         K+PJjbJ6eyy93xSXkdLV6Yec86JzoNDjasSMW3ynvTetdYQRfEvQgMb/AKKfbxI9/Se5
         EVJA==
X-Gm-Message-State: AOJu0YwHJvX/5l+m3WSih1BRIdPBCyZhAztP3RH8d9ldZ2XCpcB3pdSv
	Vw5dQ9X3QjumcL6lBjtXdAUloL6G2uHV+Dayg0H6Z/J5Pq2AgdEYjFVOba8DpbYt4RHl/CypR9p
	EHBTPdJxrHgImyJH75BE4jBiF6j3bSXQVriCPJ6AAJX5B3YleorPNLHFzFxjFLbhNlCpodGtPcs
	x80AW32p7jvu1s6EQSSa8UWw==
X-Gm-Gg: Acq92OGoN9Cm31OUUZ83B4v6hw11A+fSP22WzIWIyyzbi+FQnFUdxtcGCWAUKUo2UC2
	7UcRWEJ4iATAdr9x1X6zp4N/kOn1mYFsjy7fR3DMuL4GnGfgmXLtJUargkl6XhuqGQ8EjL/1n1T
	NKL4xGHkkEyXf7fgr2kTAS7lNN9q4LfRDgk73G6g/xSrc9zuLKyi3XZIlRTJwW0CN7xC0/jQs0W
	9Th77ZYex2uB1TmGYKCVQ2SpkbuWAopj1TcCMbY1Kr2Wv8k1zsY8J3UkhKGNMAlHfXwCNBCLbFu
	mJ9xJAO55xL2UiR9GNKVUEFb2DoNzvigic0u/I3LwiSja55WaX38nG5FMUm6w9BQDL7eTblaysH
	NXUQKI0Qixx4ly+RB34CKC3UtN7GSMkpUfoLDLbJTdF6CZwwrdy8C
X-Received: by 2002:a17:90a:2cc1:b0:369:7421:7534 with SMTP id 98e67ed59e1d1-3697421c72fmr3286825a91.8.1779006259331;
        Sun, 17 May 2026 01:24:19 -0700 (PDT)
X-Received: by 2002:a17:90a:2cc1:b0:369:7421:7534 with SMTP id 98e67ed59e1d1-3697421c72fmr3286818a91.8.1779006258795;
        Sun, 17 May 2026 01:24:18 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36956f3723bsm2765033a91.1.2026.05.17.01.24.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:24:18 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-networking][PATCH 13/29] postfix: make it can compile with linux 7.x
Date: Sun, 17 May 2026 13:49:41 +0530
Message-ID: <5fa2647d4fb1d5a22b787eb3f53a359146e3a3ea.1779004358.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
References: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: PAB8WqUTrl6x1uBXdNUB42fLKljBjUXV
X-Proofpoint-GUID: PAB8WqUTrl6x1uBXdNUB42fLKljBjUXV
X-Authority-Analysis: v=2.4 cv=W/AIkxWk c=1 sm=1 tr=0 ts=6a097b34 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VJYubktbAAAA:8
 a=e1GkridNAAAA:8 a=t7CeM3EgAAAA:8 a=EUspDBNiAAAA:8 a=Lz4N70M2UvTVOGxqTxgA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=OqWDEjY5HwswFcA5adJo:22 a=6ft9yNkZjdd813gQxDxM:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDA4NyBTYWx0ZWRfX7Pp9wYkKx91h
 IG3SEPsHAbZfFyycDgRyJ4r6jUXxf4C/4O/cg1nTA7cTuUEUle3rNt01YeADEm1S3ig9ojh9rws
 VTz3ci/gXDsf7e3mikfAP5DZESx/lLLlQvGJBgb+7T/VuDn33Vs34+xIAbXQbLfUWlrKYcZO89o
 wUNdoPOBMDV99GkSaX2wVYIGWkcnl0fQCtltQE82omBLlee5xwfW/jegYhmotjj6Uj691f+p6Aa
 emgMmS+omgWZqBeVbrh2eCA8X5YYAy+cUx/wFxWQ0h8RA7pTwW+wbMcbCHSda59cu5dzlDhu9r3
 fGZCkWl4rlROfWZj16CWPE2o2fJhHRjfzL1p9ZZJCfmBZd27M7OkWZ2OAiwn5es2IpF4vkIEYCm
 D+xh3K6e3I3UXTuHCANcEU6baAKUU5gbdcQnZMkwFLy+LtTPd8SlduM6+y5H5xhuWc6Mr3voGfG
 fwbmjTIOgvHcBDu/XOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127026

From: Changqing Li <changqing.li@windriver.com>

Fix compile failure on host with linux 7.x

| DEBUG: Executing shell function do_compile
| NOTE: make -j 64 OPT= DEBUG= OPTS= makefiles
| make -f Makefile.in MAKELEVEL= Makefiles
| (echo "# Do not edit -- this file documents how Postfix was built for your machine."; /bin/sh makedefs) >makedefs.tmp
| ATTENTION:
| ATTENTION: Unknown system type: Linux 7.0.0-14-generic
| ATTENTION:
| make: *** [Makefile.in:33: Makefiles] Error 1
| make: *** [Makefile:22: makefiles] Error 2
| ERROR: oe_runmake failed

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit a1503aa0f27f66c731b73db9a8cb8c2547f3f32b)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 ...kedefs-Account-for-linux-7.x-version.patch | 47 +++++++++++++++++++
 .../recipes-daemons/postfix/postfix_3.10.8.bb |  1 +
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
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb b/meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb
index a66ecc0b5d..6b82c04fbe 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch \
            file://0004-Fix-icu-config.patch \
            file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
+           file://0001-makedefs-Account-for-linux-7.x-version.patch \
            "
 
 SRC_URI[sha256sum] = "31d4b3eb8093d823b5a151f571719ff7c0462571bc95e6440d87ca525bfb096c"
-- 
2.53.0


