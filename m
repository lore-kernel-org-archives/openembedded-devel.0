Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BC29CD4F4D
	for <webhook@archiver.kernel.org>; Sun, 17 May 2026 08:24:30 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20201.1779006265460298193
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2026 01:24:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=JzRSniNr;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=GRgi9P+K;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64GLGAKX1200503
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZND0or4qtga
	v3t/9PWXJ1bXGf0+c26tqn4pwwkZtYok=; b=JzRSniNrU/UvbxyLrQlp7qNkl/u
	LbRzWPVu+Ye8W1BTa7Jo7d9XEMivFlpiOzIU9fiwPuLTfBZ/UrVtfi8mDVW5AKLu
	nZdTYBmAbdFf4SWZOrEMhixDmuc0ueBdhaoVxL0Llms8uDQUNhDBWqrikluhpNmq
	dCjSwSmjJx9diQvRTgPSlg9Y0hamumm6E4gTUCVqHfILt+AVfpOxxtXIdu9JffwT
	NbkBfLmsroiMplRApit2ryaT+C5gdXZR99jgIKkR3BNzwEJedgYKszgkyPpj+p3v
	GhdGQo12oo90ZiMeHz2IqB1+96TKjVr+EClq1Z+X4paVLuBUYHLAI2GSQmA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0g2f0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36641bb3d97so666870a91.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 01:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779006264; x=1779611064; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZND0or4qtgav3t/9PWXJ1bXGf0+c26tqn4pwwkZtYok=;
        b=GRgi9P+KN+zV8KlFCDslaM4d2uKg6xNWX5/O/yfxUwUXlnBZAgmx+V8H44Joma0WjT
         E8R/3DAj066nX7Kc6BlNPEywNG29XrO0eSO37v1rBcN7qV6DvaRQ1Pqeygmps6iE8Ni5
         RFUpNdtlRd2ELy/U8xPS4OkBwxeDC1UXi8smdIknUBbkZg+yauFdpgikeCx1CxAxkvJu
         QGN2ZoeSs81amAdatfKj0DvV5egBGmWGw+OY9eCnK8Myj/f9ccUxwF6ulcSqf4tg5dgN
         +bt/K09FOSlkgeqm+jN9lV2Z6WgrNxyt4zQLmM4tfu5YwBwqLhieBODAQGUPdUgDUNuM
         Km5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779006264; x=1779611064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZND0or4qtgav3t/9PWXJ1bXGf0+c26tqn4pwwkZtYok=;
        b=QRt5xBmVdRnBkiHri1eIqiyAIWtQxNa8P1MkvC10kgXM0MdgpPa3Yvt3WaqXsKXaSK
         UQaD+ucstCYI++e3vJH7GSgXQMWrCRsDvmLJ+HkuBkU8m3Iuc9rJyDE1cOl66i/V+lAm
         RTb13JbRZ21s6GDzUlQSEMaW5np0NDn96Klgwc2hsTwfaaSIXlYpmL1lfiIopyc5cbJF
         eiof9ykSFnk6hWIjlWDfPyzMjLXq1xjEaSEGEmerwOYCBBtUm2BscTESQ8YFlC8yfEg3
         ggWHq4WaovPYNhJC9JAvICerW+29e3/1heZZLoPpdr2ui+16W+yHIhI4ZlwYnymK73wk
         Wb9g==
X-Gm-Message-State: AOJu0YzzsTf9lgxqBLCoi8/ABOrZX6vD+1TZ+sccD0WpZbxfcoeW+7gQ
	HvzGglGZrKqE19ezontte+FZYxnVotfXw/UjY+vNbSc+mabS5aoyp/rKhs2dlhTMVIJBbWIPaTR
	04EvpntCHgWyo0MeJglwpWTFuURiDumMBEVIgn595103HpSOG49CMxAcaVpCgv7HREffn8pKdhX
	unOD1n7QthmSPzgitWOwhazA==
X-Gm-Gg: Acq92OGoGmfOwnzBp6QPPU9IlpJU3/tXUJjbHBsgKwJKuMxMUT4/imeKddIdpu8WiQ7
	pu2xEcWx16sS2pOST3HB0k9sA3J6qZbtW2ftMU/vGAOpVMsbfZEalBWKTqndqrEuQP2uoRLXNd0
	SYuyw4sD/I8tzx/+wXgu7aK0I5SsJ0dmNpDvlyfyu7F6kwQO2pkLAReXDF7nuZ1zK1v8f898h1M
	tXhb+417JalNKD7lC7wyMC2qdPqR8iifbbobyCyUBPslM5ccah5fxFvM20sFD1rH6Eh6aMe7qMF
	T0eZGzpbzo21MFWscHbPLFatcjwptrvFo15SOpRHBr1UCv78PTfrVdjUA2qmFQ4Rk92/Tb8gs3K
	8DG0YLYosMceTBKvnQnUoy+a3hjj/n394TFh3a4LbF96AaaZkmdZB
X-Received: by 2002:a17:90b:4f90:b0:366:4782:1376 with SMTP id 98e67ed59e1d1-36951ca2770mr10802967a91.21.1779006264354;
        Sun, 17 May 2026 01:24:24 -0700 (PDT)
X-Received: by 2002:a17:90b:4f90:b0:366:4782:1376 with SMTP id 98e67ed59e1d1-36951ca2770mr10802950a91.21.1779006263818;
        Sun, 17 May 2026 01:24:23 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36956f3723bsm2765033a91.1.2026.05.17.01.24.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:24:23 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-networking][PATCH 16/29] postfix: upgrade 3.10.8 -> 3.10.9
Date: Sun, 17 May 2026 13:49:44 +0530
Message-ID: <c8e1b7771dabd707f8218d2fb7842d00ffdb9c79.1779004358.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
References: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDA4NyBTYWx0ZWRfX4ZCdO9Jiw0UP
 4rUxJXLzss1Q4yNzjZTJJM48WLkwMNDQ3r/hMwNvlbzYLNjAQgycDkhYfQFYsaesMvz0B/nMa0o
 /+fHsYYKv9/dXKQKpDDpP4TkWeb1tYVydMuN1ySQTZPvI43aH6h8u284lJALOQzywd2YE5UaNZy
 qyjkMZeHbMsIpo/+oo2E4UkEjah/p1qKbNdUnMJqSip5zMVRdApNs184PTPJZm44/PnZEvJL2OX
 W53T/G4ndWBwzcdfOCdXfwMP7AvneZDS9J34p74ePoBLRFCbXH4d1rmHEDnt7dddmIgjTn8+clg
 iAZAsdTyTvU1cwtvhxsXGqrrTNdld1Es9YLLDVwvHTBlpqZtDfaLMMXYo8u6+QRoXxncrDMRmtO
 WoTA30bVNDbwJjYE3PwUAf01Lldvkr4gKEitWpekk2GS+6Z3zWhgVEKOhWpDgVG2Av3MZCdQsQ/
 6EYnP3Mlsh3OprzpP7w==
X-Authority-Analysis: v=2.4 cv=W7gIkxWk c=1 sm=1 tr=0 ts=6a097b39 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=e1GkridNAAAA:8
 a=gmDo1nssAAAA:8 a=t7CeM3EgAAAA:8 a=EUspDBNiAAAA:8 a=vMPsV_Qpw6bpd4AMeWoA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=6ft9yNkZjdd813gQxDxM:22 a=DmCNEmdWNTAeIjfGWauO:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Df_n9ax9RvxU96yX7D-Jsk1BMZzEGvuZ
X-Proofpoint-ORIG-GUID: Df_n9ax9RvxU96yX7D-Jsk1BMZzEGvuZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127029

From: Yi Zhao <yi.zhao@windriver.com>

Security fix: CVE-2026-43964

Add a patch to fix build with musl.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 7c6ce9d10011094591a4449a977e5760d38711e8)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 .../files/0001-Fix-build-with-musl.patch      | 50 +++++++++++++++++++
 .../{postfix_3.10.8.bb => postfix_3.10.9.bb}  |  3 +-
 2 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-daemons/postfix/files/0001-Fix-build-with-musl.patch
 rename meta-networking/recipes-daemons/postfix/{postfix_3.10.8.bb => postfix_3.10.9.bb} (98%)

diff --git a/meta-networking/recipes-daemons/postfix/files/0001-Fix-build-with-musl.patch b/meta-networking/recipes-daemons/postfix/files/0001-Fix-build-with-musl.patch
new file mode 100644
index 0000000000..d09418eaac
--- /dev/null
+++ b/meta-networking/recipes-daemons/postfix/files/0001-Fix-build-with-musl.patch
@@ -0,0 +1,50 @@
+From cbe5ba0deeba6329eed63eade06bb8c062d0d445 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Fri, 8 May 2026 22:39:54 +0800
+Subject: [PATCH] Fix build with musl
+
+Guard glibc-specific version check with __GLIBC__ macro. When building
+with musl, __GLIBC__ is not defined, so the preprocessor previously fell
+through to the #else branch and defined NO_SNPRINTF, causing a build
+error:
+
+vbuf_print.c: In function 'vbuf_print':
+vbuf_print.c:208:46: error: macro 'VBUF_SNPRINTF' passed 5 arguments, but takes just 4
+  208 |                     VSTRING_ADDNUM(fmt, width);
+      |                                              ^
+vbuf_print.c:126:9: note: macro 'VBUF_SNPRINTF' defined here
+  126 | #define VBUF_SNPRINTF(bp, sz, fmt, arg) do { \
+      |         ^~~~~~~~~~~~~
+
+Wrap the entire block in #ifdef __GLIBC__ so that neither branch
+is entered on musl.
+
+Upstream-Status: Pending
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/util/sys_defs.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/util/sys_defs.h b/src/util/sys_defs.h
+index 74319f2..6d3c7d2 100644
+--- a/src/util/sys_defs.h
++++ b/src/util/sys_defs.h
+@@ -794,12 +794,14 @@ extern int initgroups(const char *, int);
+ #define NATIVE_NEWALIAS_PATH "/usr/bin/newaliases"
+ #define NATIVE_COMMAND_DIR "/usr/sbin"
+ #define NATIVE_DAEMON_DIR "/usr/libexec/postfix"
++#ifdef __GLIBC__
+ #if HAVE_GLIBC_API_VERSION_SUPPORT(2, 1)
+ #define SOCKADDR_SIZE	socklen_t
+ #define SOCKOPT_SIZE	socklen_t
+ #else
+ #define NO_SNPRINTF
+ #endif
++#endif
+ #ifndef NO_IPV6
+ #define HAS_IPV6
+ #if HAVE_GLIBC_API_VERSION_SUPPORT(2, 4)
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb b/meta-networking/recipes-daemons/postfix/postfix_3.10.9.bb
similarity index 98%
rename from meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.10.9.bb
index 6b82c04fbe..633e4a7a0d 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.10.9.bb
@@ -27,9 +27,10 @@ SRC_URI = "http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0004-Fix-icu-config.patch \
            file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
            file://0001-makedefs-Account-for-linux-7.x-version.patch \
+           file://0001-Fix-build-with-musl.patch \
            "
 
-SRC_URI[sha256sum] = "31d4b3eb8093d823b5a151f571719ff7c0462571bc95e6440d87ca525bfb096c"
+SRC_URI[sha256sum] = "d4b4daab0af2e0c16c0d2d5ac3c7680d5ebd2001ea054f7f2a601c759801bc13"
 
 UPSTREAM_CHECK_URI = "https://www.postfix.org/announcements.html"
 UPSTREAM_CHECK_REGEX = "postfix-(?P<pver>\d+(\.\d+)+)"
-- 
2.53.0


