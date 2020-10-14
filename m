Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.73])
 by mx.groups.io with SMTP id smtpd.web11.6098.1602659060568253391
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2020 00:04:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hU1CrdC0;
 spf=pass (domain: windriver.com, ip: 40.107.220.73, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IdX2PO4pVfn84h6NpcQp10Co71qwE1tE8JuwPb9Haz2ztP19ZW3xkvAcx587RmQnP0ddXSSMwYvIRTmm+0lXGEtlq3gFLZgGtM9OMVS8qRX1qRBmwsyzZK7c9T1uKZ4KgTZFc1k+xkBsJWrIgVdp+xdCdRwMWuwPzSzhSJD/X5GzbsUN0r39es5rSlklWxvKn7vUlEGBVpB0klitWrLpWrE7DaD1NJWBzUsyGZf6VTKnGrLzJFhvi9MgdzTa8uNApwO0OaR5L1YSElLfBnTnytqimBE/RvX34LxNJJ4GRrd3RDpeHezoKqyWKqc94im0zDoHe7OhDOh0A0yN6neVQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eSzmaphtfCv9SlzzhWtoRefGcPSObZ8rnEokSxqUs/o=;
 b=STZUQSn3/caLSZaM6TXyFLnfeHQ51xOSv38RMInpiPg604D0y5J1BrCumX5Q1HUBmoGGkcGcv0IKbnSzT0oE9oJm6rpODMHlSKnrxhor2i4pVQsnZiYD36eYecaMKGFD4/sDrivsddxxLMd0plZ4KSv/BX8bqEWfcQcgX4qYzO7TkGA6aXLz14jBq419XbsA1VHfHI2OlUE2mXH0OV3P/4bAW3ovAO3swz88yPLMl16pvpPUB+56I4rOW/gAgPImsexFAhrRdQjaZxid6w+bSvKeixvAW6utTz9Aob4cc+BSIrr8YiB0t9IG98N2XyDGaZQIu4Im8Aos6mnZsE7nmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eSzmaphtfCv9SlzzhWtoRefGcPSObZ8rnEokSxqUs/o=;
 b=hU1CrdC0YAKFPilrX3ZN+yiY0+MfLVH4lTUKSsejGGODAsEsrxEjAsbwLRH6/W8KB35tzl7X+L94wJJrMz7slO3EN63K5+6C6Ne+Z5nneg7XCKT0YwnuqZgXJEN+r/oYIr/lYG/MR/p961H1HMz0orGMEML+fwd+VRCWwnheJh0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.24; Wed, 14 Oct
 2020 07:04:19 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::d844:ac89:6b05:ed98]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::d844:ac89:6b05:ed98%6]) with mapi id 15.20.3455.030; Wed, 14 Oct 2020
 07:04:19 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/2] samba: upgrade 4.10.17 -> 4.10.18
Date: Wed, 14 Oct 2020 15:04:07 +0800
Message-Id: <20201014070408.21621-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: BYAPR01CA0045.prod.exchangelabs.com (2603:10b6:a03:94::22)
 To CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by BYAPR01CA0045.prod.exchangelabs.com (2603:10b6:a03:94::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend Transport; Wed, 14 Oct 2020 07:04:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51af66bb-32b7-4976-b111-08d8700f5ec5
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB16320D80BCD80ED163F77541F9050@MWHPR11MB1632.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iOGBBgez9mDo5PkdGN7yEVh7dakgPMriRA9sFpPWqKi63vAgs3U0OXU5pUt5lnjqwwlERSXZ/h/37XMAud0G9rSjcvzQbnnQ5Nnj28Hceic2nftsk9i0psl/qtmiugX/98KQ2bwL8Hq6WShktPYj/E4xrvxdt6Mq9oSKKYALoPCRXWV8HOx3ZlpAhMUdOaQ+9fM12TLRqNJHpdNguqCp67PJIPHe31IBdke6q8DKHfbhcMaSQAYkfibd6H2xWPQ/UiBeiROIz+lzHbHciYqJbapmfLmNvFuOx5F/23hVuFTdaK2Cds3jU0yKekPAaFa8z5fgyUDy6rbGt0v530wMLEQcG4wsjpt2SrQ0S1000LoQ5IHBJKNhZeDiNtVgI3oR0dox/HcdTlcNrshKY3g6FQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(39850400004)(136003)(346002)(6916009)(83380400001)(44832011)(2906002)(956004)(2616005)(83080400001)(16526019)(6666004)(52116002)(186003)(6512007)(26005)(6506007)(36756003)(66556008)(478600001)(8936002)(86362001)(8676002)(6486002)(966005)(1076003)(316002)(66946007)(66476007)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	0yvSkc4/84IZI+0JhrVV7eiRhts6sGSfPPvECk8FX1PQ0XAzm16y6bD27ZzsHoEJWEyZqIiv5ZqY5h+FpVfUZHiWUTaEfnjlgCM3O8tQ6BNcu6mUkw8/oHP7yago5s65WldJ17axwgLUfleJaHjX6T35DeV7qLyFCdv+dv1uj26iFdnfrDuFYSAjbhxPyuggBQ+s4ie+N6JJnsL8rbzDF5fo1X7LULKhgHHmjm6a2D2fw5X7D+40/65TeAgvo7m7wq3XG+pFKFnB0o2PLjhjaGFdcK+z4UN4T+l+W2EzK7nZxBbUJ4XJ5ZUkhMqM+nKTSWObFQzMswoJx54nypppbtht13WmAKdfAwr/iqTPge+ESn4q22V4bzyqwpZGcaFA0517rzUQ6JxT5vR2+80U0Mg6ADdKRUp7ywHu+ohlKtkmB66arnF3z37JQjZzGUx21ggkq128lKxCfWcbCuk7vQUfp/ZakWcI9GPTpcB7v4rLwA/20a9+RoxEBv9BpimMMQQ5fnBJhTEDxCfMPggZcRab9RN1DvsTx6V1YJPbTv4owc9hExE+1msAw3iAa8/7jdcqdLILYLSOz4NxWbjQaXtpYMLJC0reCDegjb5bLtRF8d81/Oqrdr3qSm/qVTP95k/ZfQs3iU/NtwX8vcEdRQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51af66bb-32b7-4976-b111-08d8700f5ec5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2020 07:04:19.2706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XnRUeGvJPK8LNhM+RbkwA/PHd+X5trlqjaFkreHNUF6bbrIgsqPBEoTCFGavny7nffNWQmecBGPbvhbXbo7clw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1632
Content-Type: text/plain

This is security release in order to address CVE-2020-1472
(Unauthenticated domain takeover via netlogon ("ZeroLogon")).

See: https://www.samba.org/samba/history/samba-4.10.18.html

Also remove 3 backported patches.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../0001-util-Simplify-input-validation.patch | 59 --------------
 ...n-FreeBSD-by-avoiding-NSS_BUFLEN_PAS.patch | 79 -------------------
 ...larger-buffer-if-getpwuid_r-returns-.patch | 50 ------------
 .../{samba_4.10.17.bb => samba_4.10.18.bb}    |  7 +-
 4 files changed, 2 insertions(+), 193 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-util-Simplify-input-validation.patch
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/0002-util-Fix-build-on-FreeBSD-by-avoiding-NSS_BUFLEN_PAS.patch
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/0003-util-Reallocate-larger-buffer-if-getpwuid_r-returns-.patch
 rename meta-networking/recipes-connectivity/samba/{samba_4.10.17.bb => samba_4.10.18.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/samba/samba/0001-util-Simplify-input-validation.patch b/meta-networking/recipes-connectivity/samba/samba/0001-util-Simplify-input-validation.patch
deleted file mode 100644
index e724c04bc..000000000
--- a/meta-networking/recipes-connectivity/samba/samba/0001-util-Simplify-input-validation.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From f9d9ba6cd06aca053c747c399ba700db80b1623c Mon Sep 17 00:00:00 2001
-From: Martin Schwenke <martin@meltin.net>
-Date: Tue, 9 Jun 2020 11:52:50 +1000
-Subject: [PATCH 1/3] util: Simplify input validation
-
-It appears that snprintf(3) is being used for input validation.
-However, this seems like overkill because it causes szPath to be
-copied an extra time.  The mostly likely protections being sought
-here, according to https://cwe.mitre.org/data/definitions/20.html,
-look to be DoS attacks involving CPU and memory usage.  A simpler
-check that uses strnlen(3) can mitigate against both of these and is
-simpler.
-
-Signed-off-by: Martin Schwenke <martin@meltin.net>
-Reviewed-by: Volker Lendecke <vl@samba.org>
-Reviewed-by: Bjoern Jacke <bjacke@samba.org>
-(cherry picked from commit 922bce2668994dd2a5988c17060f977e9bb0c229)
-
-Upstream-Status:Backport
-[https://gitlab.com/samba-team/samba/-/commit/f9d9ba6cd06aca053c747c399ba700db80b1623c]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- lib/util/util_paths.c | 9 ++++-----
- 1 file changed, 4 insertions(+), 5 deletions(-)
-
-diff --git a/lib/util/util_paths.c b/lib/util/util_paths.c
-index c0ee5c32c30..dec91772d9e 100644
---- a/lib/util/util_paths.c
-+++ b/lib/util/util_paths.c
-@@ -69,21 +69,20 @@ static char *get_user_home_dir(TALLOC_CTX *mem_ctx)
- 	struct passwd pwd = {0};
- 	struct passwd *pwdbuf = NULL;
- 	char buf[NSS_BUFLEN_PASSWD] = {0};
-+	size_t len;
- 	int rc;
- 
- 	rc = getpwuid_r(getuid(), &pwd, buf, NSS_BUFLEN_PASSWD, &pwdbuf);
- 	if (rc != 0 || pwdbuf == NULL ) {
--		int len_written;
- 		const char *szPath = getenv("HOME");
- 		if (szPath == NULL) {
- 			return NULL;
- 		}
--		len_written = snprintf(buf, sizeof(buf), "%s", szPath);
--		if (len_written >= sizeof(buf) || len_written < 0) {
--			/* Output was truncated or an error. */
-+		len = strnlen(szPath, PATH_MAX);
-+		if (len >= PATH_MAX) {
- 			return NULL;
- 		}
--		return talloc_strdup(mem_ctx, buf);
-+		return talloc_strdup(mem_ctx, szPath);
- 	}
- 
- 	return talloc_strdup(mem_ctx, pwd.pw_dir);
--- 
-2.17.1
-
diff --git a/meta-networking/recipes-connectivity/samba/samba/0002-util-Fix-build-on-FreeBSD-by-avoiding-NSS_BUFLEN_PAS.patch b/meta-networking/recipes-connectivity/samba/samba/0002-util-Fix-build-on-FreeBSD-by-avoiding-NSS_BUFLEN_PAS.patch
deleted file mode 100644
index dcd79044a..000000000
--- a/meta-networking/recipes-connectivity/samba/samba/0002-util-Fix-build-on-FreeBSD-by-avoiding-NSS_BUFLEN_PAS.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 57bd719af1f138f44f71b2078995452582da0da6 Mon Sep 17 00:00:00 2001
-From: Martin Schwenke <martin@meltin.net>
-Date: Fri, 5 Jun 2020 21:52:23 +1000
-Subject: [PATCH 2/3] util: Fix build on FreeBSD by avoiding NSS_BUFLEN_PASSWD
-
-NSS_BUFLEN_PASSWD is not defined on FreeBSD.  Use
-sysconf(_SC_GETPW_R_SIZE_MAX) instead, as per POSIX.
-
-Use a dynamically allocated buffer instead of trying to cram all of
-the logic into the declarations.  This will come in useful later
-anyway.
-
-Signed-off-by: Martin Schwenke <martin@meltin.net>
-Reviewed-by: Volker Lendecke <vl@samba.org>
-Reviewed-by: Bjoern Jacke <bjacke@samba.org>
-(cherry picked from commit 847208cd8ac68c4c7d1dae63767820db1c69292b)
-
-Upstream-Status:Backport
-[https://gitlab.com/samba-team/samba/-/commit/57bd719af1f138f44f71b2078995452582da0da6]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- lib/util/util_paths.c | 27 ++++++++++++++++++++++-----
- 1 file changed, 22 insertions(+), 5 deletions(-)
-
-diff --git a/lib/util/util_paths.c b/lib/util/util_paths.c
-index dec91772d9e..9bc6df37e5d 100644
---- a/lib/util/util_paths.c
-+++ b/lib/util/util_paths.c
-@@ -68,24 +68,41 @@ static char *get_user_home_dir(TALLOC_CTX *mem_ctx)
- {
- 	struct passwd pwd = {0};
- 	struct passwd *pwdbuf = NULL;
--	char buf[NSS_BUFLEN_PASSWD] = {0};
-+	char *buf = NULL;
-+	char *out = NULL;
-+	long int initlen;
- 	size_t len;
- 	int rc;
- 
--	rc = getpwuid_r(getuid(), &pwd, buf, NSS_BUFLEN_PASSWD, &pwdbuf);
-+	initlen = sysconf(_SC_GETPW_R_SIZE_MAX);
-+	if (initlen == -1) {
-+		len = 1024;
-+	} else {
-+		len = (size_t)initlen;
-+	}
-+	buf = talloc_size(mem_ctx, len);
-+	if (buf == NULL) {
-+		return NULL;
-+	}
-+
-+	rc = getpwuid_r(getuid(), &pwd, buf, len, &pwdbuf);
- 	if (rc != 0 || pwdbuf == NULL ) {
- 		const char *szPath = getenv("HOME");
- 		if (szPath == NULL) {
--			return NULL;
-+			goto done;
- 		}
- 		len = strnlen(szPath, PATH_MAX);
- 		if (len >= PATH_MAX) {
- 			return NULL;
- 		}
--		return talloc_strdup(mem_ctx, szPath);
-+		out = talloc_strdup(mem_ctx, szPath);
-+		goto done;
- 	}
- 
--	return talloc_strdup(mem_ctx, pwd.pw_dir);
-+	out = talloc_strdup(mem_ctx, pwd.pw_dir);
-+done:
-+	TALLOC_FREE(buf);
-+	return out;
- }
- 
- char *path_expand_tilde(TALLOC_CTX *mem_ctx, const char *d)
--- 
-2.17.1
-
diff --git a/meta-networking/recipes-connectivity/samba/samba/0003-util-Reallocate-larger-buffer-if-getpwuid_r-returns-.patch b/meta-networking/recipes-connectivity/samba/samba/0003-util-Reallocate-larger-buffer-if-getpwuid_r-returns-.patch
deleted file mode 100644
index 53a3f6781..000000000
--- a/meta-networking/recipes-connectivity/samba/samba/0003-util-Reallocate-larger-buffer-if-getpwuid_r-returns-.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 016e08ca07f86af9e0131a908a2df116bcb9a48e Mon Sep 17 00:00:00 2001
-From: Martin Schwenke <martin@meltin.net>
-Date: Fri, 5 Jun 2020 22:05:42 +1000
-Subject: [PATCH 3/3] util: Reallocate larger buffer if getpwuid_r() returns
- ERANGE
-
-Signed-off-by: Martin Schwenke <martin@meltin.net>
-Reviewed-by: Volker Lendecke <vl@samba.org>
-Reviewed-by: Bjoern Jacke <bjacke@samba.org>
-
-Autobuild-User(master): Martin Schwenke <martins@samba.org>
-Autobuild-Date(master): Tue Jun  9 21:07:24 UTC 2020 on sn-devel-184
-
-(cherry picked from commit ddac6b2eb4adaec8fc5e25ca07387d2b9417764c)
-
-Upstream-Status:Backport
-[https://gitlab.com/samba-team/samba/-/commit/016e08ca07f86af9e0131a908a2df116bcb9a48e]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- lib/util/util_paths.c | 13 +++++++++++++
- 1 file changed, 13 insertions(+)
-
-diff --git a/lib/util/util_paths.c b/lib/util/util_paths.c
-index 9bc6df37e5d..72cc0aab8de 100644
---- a/lib/util/util_paths.c
-+++ b/lib/util/util_paths.c
-@@ -86,6 +86,19 @@ static char *get_user_home_dir(TALLOC_CTX *mem_ctx)
- 	}
- 
- 	rc = getpwuid_r(getuid(), &pwd, buf, len, &pwdbuf);
-+	while (rc == ERANGE) {
-+		size_t newlen = 2 * len;
-+		if (newlen < len) {
-+			/* Overflow */
-+			goto done;
-+		}
-+		len = newlen;
-+		buf = talloc_realloc_size(mem_ctx, buf, len);
-+		if (buf == NULL) {
-+			goto done;
-+		}
-+		rc = getpwuid_r(getuid(), &pwd, buf, len, &pwdbuf);
-+	}
- 	if (rc != 0 || pwdbuf == NULL ) {
- 		const char *szPath = getenv("HOME");
- 		if (szPath == NULL) {
--- 
-2.17.1
-
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.10.17.bb b/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/samba/samba_4.10.17.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
index 3ae5afbe9..b5085c913 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.10.17.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
@@ -28,9 +28,6 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://0002-util_sec.c-Move-__thread-variable-to-global-scope.patch \
            file://0001-Add-options-to-configure-the-use-of-libbsd.patch \
            file://0001-nsswitch-nsstest.c-Avoid-nss-function-conflicts-with.patch \
-           file://0001-util-Simplify-input-validation.patch \
-           file://0002-util-Fix-build-on-FreeBSD-by-avoiding-NSS_BUFLEN_PAS.patch \
-           file://0003-util-Reallocate-larger-buffer-if-getpwuid_r-returns-.patch \
            "
 SRC_URI_append_libc-musl = " \
            file://samba-pam.patch \
@@ -39,8 +36,8 @@ SRC_URI_append_libc-musl = " \
            file://0001-samba-fix-musl-lib-without-innetgr.patch \
           "
 
-SRC_URI[md5sum] = "f69cac9ba5035ee60257520a209a0a83"
-SRC_URI[sha256sum] = "03dc9758e7bfa2faf7cdeb45b4d40997e2ee16a41e71996aa666bc069e70ba3e"
+SRC_URI[md5sum] = "f006a3d1876113e4a049015969d20fe6"
+SRC_URI[sha256sum] = "7dcfc2aaaac565b959068788e6a43fc79ce2a03e7d523f5843f7a9fddffc7c2c"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.10(\.\d+)+).tar.gz"
 
-- 
2.17.1

