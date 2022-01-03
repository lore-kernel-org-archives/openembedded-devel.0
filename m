Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37B31C433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 05:17:40 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.23566.1641187059084000111
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Jan 2022 21:17:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=S2MrLDCH;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641187056; i=@fujitsu.com;
	bh=w4qSpzvR7U7ygcQcxdcqFc8oPGCQSozY8msN0mZIuf0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=S2MrLDCHHib7ZGq2RlwTSChHKGn667bHjV4Csp4/SJ7uiMoUFL39clP3v6rZMSuD1
	 Xcetyg/7hHTLFeMrt0/K19DNw85RdeZDHfVkOerTLVva3axQDqxMkWBnvAmdlt0P/B
	 4jMUqY2BN3hkQ2HF1WIh0kofLHq6Wtk2JYljFe0+EkE0xOIrwH6F6sBGFEmRndtVS+
	 t4O1Kbx9Q0RNAij1TOIpG9qMcV/7VIT5nYrZjRRfFoTT09oi4ZFlZv3Tt462KlfYgM
	 +IFeaY/M4aTlwL77QbgUg2D/C+gz0oRyUVxg1KXP5nSMtJUCjN2+aE8urDbSuX1CLB
	 gbK1NILmCyUFw==
Received: from [100.115.64.186] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 78/05-07141-0F682D16; Mon, 03 Jan 2022 05:17:36 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRWlGSWpSXmKPExsViZ8MxRfdD26V
  EgysVFhcPL2V2YPQ4t3EFYwBjFGtmXlJ+RQJrxozuWewFf3QrOg4/YGtgfKjRxcjFISQwg0ni
  65MuJgjnOKNE25JFbF2MnBxsAmoS02/dYAWxRQT0JZbO3sMMYjMLqEi8+N3DDmILCzhLHDy9C
  qyGBSi+pu0GE4jNK+Ak8ez5NDBbQkBBYsrD90C9HBycQPVPVieBhIWASjo6GlggygUlTs58wg
  IxXkLi4IsXzBCtihKzLzezQNgVErNmtTFNYOSfhaRlFpKWBYxMqxjtkooy0zNKchMzc3QNDQx
  0DQ1Ndc0sdA1NjPUSq3QT9VJLdZNT80qKEoHSeonlxXqpxcV6xZW5yTkpenmpJZsYgYGZUuzS
  v4Pxft9PvUOMkhxMSqK8lUoXE4X4kvJTKjMSizPii0pzUosPMcpwcChJ8B5pupQoJFiUmp5ak
  ZaZA4wSmLQEB4+SCO+WVqA0b3FBYm5xZjpE6hSjLseVVUsWMQux5OXnpUqJ874FKRIAKcoozY
  MbAYvYS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeVtBpvBk5pXAbXoFdAQT0BG8WudBjih
  JREhJNTAtOtfm7p8UGGd2QEy1fsaGon3BEuXLT53e87zf0lUyde+V+9JnF5zYn9Ft29jjN8nf
  8ie76buP13W/Z0/4UHHVKY0j+UGWXe41L/dFu3j73iS7vU9YbnlO9t7hQ4uWCHL1nG1xd/te0
  iNzdLJaeNvvnLMOCvWzNiqLbHP5kb2shMXlZW6dxCq1WK+e6XdmCns+CrjE5cbWzHdy/X7tOU
  c0/ZIqhfl99j2Nzr1e2Fk7PWh9S29tav6uysUc5YrzJM68+NLM++ZBvmL8Hf3E+SEO38XONSw
  NrVotnuh3SvxJ1iG1PD5lk76PMbNnhN0qfPP7f2leWHDxn5VzVi/9M988333d1r2rJi+ece/0
  /g1KLMUZiYZazEXFiQD7c66pUwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-532.messagelabs.com!1641187055!467648!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1193 invoked from network); 3 Jan 2022 05:17:35 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-18.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 3 Jan 2022 05:17:35 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 2035HUko025039
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 3 Jan 2022 05:17:35 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 3 Jan 2022 05:17:33 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] pkcs11-helper: upgrade 1.27 -> 1.28
Date: Mon, 3 Jan 2022 13:17:16 +0800
Message-ID: <1641187036-41392-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1641187036-41392-1-git-send-email-wangmy@fujitsu.com>
References: <1641187036-41392-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Jan 2022 05:17:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94645

0001-build-openssl-remove-RSA_SSLV23_PADDING-constant-usa.patch
0001-nss-use-nss-pkcs11-h.patch
removed since they're included in 1.28.

Changelog:
=========
 * build: openssl: remove RSA_SSLV23_PADDING constant usage due to openssl-3
   compatibility.
 * build: nss: use nss pkcs11.h
 * build: windows: checksum in PE
 * build: windows: support openssl-1.1.1
 * mbed: require >=mbedtls-2, mbed dropped polarssl compatibility,
 * certificate: add methods accept full mechanism
 * core: load provider library as private.
 * core: add pkcs11h_getProperty, pkcs11h_setProperty to support adding
   properties without breaking API.
 * core: add pkcs11h_initializeProvider, pkcs11h_registerProvider,
   pkcs11h_setProviderProperty, pkcs11h_setProviderPropertyByName to
   support adding properties without breaking API
 * core: add initialization arguments property
 * core: add PKCS11H_PROVIDER_PROPERTY_PROVIDER_DESTRUCT_HOOK.
 * session: respect login required token flag.
 * certificate: respect always authenticate flag.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...move-RSA_SSLV23_PADDING-constant-usa.patch | 27 --------
 .../0001-nss-use-nss-pkcs11-h.patch           | 61 -------------------
 ...1-helper_1.27.bb => pkcs11-helper_1.28.bb} |  7 +--
 3 files changed, 2 insertions(+), 93 deletions(-)
 delete mode 100644 meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper/0001-build-openssl-remove-RSA_SSLV23_PADDING-constant-usa.patch
 delete mode 100644 meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper/0001-nss-use-nss-pkcs11-h.patch
 rename meta-oe/recipes-crypto/pkcs11-helper/{pkcs11-helper_1.27.bb => pkcs11-helper_1.28.bb} (83%)

diff --git a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper/0001-build-openssl-remove-RSA_SSLV23_PADDING-constant-usa.patch b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper/0001-build-openssl-remove-RSA_SSLV23_PADDING-constant-usa.patch
deleted file mode 100644
index f2baae914..000000000
--- a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper/0001-build-openssl-remove-RSA_SSLV23_PADDING-constant-usa.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 5b9a8da964ee0b998955cd986000cfa27cfa698d Mon Sep 17 00:00:00 2001
-From: Alon Bar-Lev <alon.barlev@gmail.com>
-Date: Wed, 4 Aug 2021 19:02:34 +0300
-Subject: [PATCH] build: openssl: remove RSA_SSLV23_PADDING constant usage
-
-Due to openssl-3 compatibility, thanks to t0b3
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- lib/pkcs11h-openssl.c | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/lib/pkcs11h-openssl.c b/lib/pkcs11h-openssl.c
-index 9c9b2cd..85c8193 100644
---- a/lib/pkcs11h-openssl.c
-+++ b/lib/pkcs11h-openssl.c
-@@ -474,9 +474,6 @@ __pkcs11h_openssl_rsa_dec (
- 		case RSA_PKCS1_OAEP_PADDING:
- 			mech = CKM_RSA_PKCS_OAEP;
- 		break;
--		case RSA_SSLV23_PADDING:
--			rv = CKR_MECHANISM_INVALID;
--		break;
- 		case RSA_NO_PADDING:
- 			mech = CKM_RSA_X_509;
- 		break;
diff --git a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper/0001-nss-use-nss-pkcs11-h.patch b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper/0001-nss-use-nss-pkcs11-h.patch
deleted file mode 100644
index 3070fc41a..000000000
--- a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper/0001-nss-use-nss-pkcs11-h.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 083a3a62f2e631deec2fb2799d10660a41c50294 Mon Sep 17 00:00:00 2001
-From: Alon Bar-Lev <alon.barlev@gmail.com>
-Date: Fri, 30 Jul 2021 20:06:36 +0300
-Subject: [PATCH] nss: use nss pkcs11.h
-
-make nss happy with its own extensions and non-standard behavior.
-
-Taken from Archlinux [1]
-
-[1] https://github.com/archlinux/svntogit-packages/commit/238f5e90946f527b2d4a507e02c30e977db38a97
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/_pkcs11h-crypto-nss.c | 14 ++++++++++----
- lib/common.h              |  7 +++++++
- 2 files changed, 17 insertions(+), 4 deletions(-)
-
---- a/lib/_pkcs11h-crypto-nss.c
-+++ b/lib/_pkcs11h-crypto-nss.c
-@@ -48,15 +48,21 @@
-  * POSSIBILITY OF SUCH DAMAGE.
-  */
- 
--#include "common.h"
--
--#include "_pkcs11h-crypto.h"
-+#ifdef HAVE_CONFIG_H
-+#include <config.h>
-+#endif
- 
- #if defined(ENABLE_PKCS11H_ENGINE_NSS)
--#define _PKCS11T_H_ /* required so no conflict with ours */
- #include <nss.h>
- #include <cert.h>
- 
-+/* Use PKCS#11 of nss to avoid conflicts and make nss happy with its own extensions */
-+#define PKCS11_H 1
-+
-+#include "common.h"
-+
-+#include "_pkcs11h-crypto.h"
-+
- static
- int
- __pkcs11h_crypto_nss_initialize (
---- a/lib/common.h
-+++ b/lib/common.h
-@@ -72,5 +72,12 @@
- 
- #define _PKCS11H_ASSERT		assert
- 
-+#ifndef FALSE
-+#define FALSE 0
-+#endif
-+#ifndef TRUE
-+#define TRUE 1
-+#endif
-+
- #endif
- 
diff --git a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.27.bb b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.28.bb
similarity index 83%
rename from meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.27.bb
rename to meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.28.bb
index 389d1bc7b..afad03c9a 100644
--- a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.27.bb
+++ b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.28.bb
@@ -15,14 +15,11 @@ LIC_FILES_CHKSUM = " \
     file://COPYING.GPL;md5=8a71d0475d08eee76d8b6d0c6dbec543 \
     file://COPYING.BSD;md5=66b7a37c3c10483c1fd86007726104d7 \
 "
-SRC_URI = "git://github.com/OpenSC/${BPN}.git;branch=master;protocol=https \
-           file://0001-build-openssl-remove-RSA_SSLV23_PADDING-constant-usa.patch \
-           file://0001-nss-use-nss-pkcs11-h.patch \
-           "
+SRC_URI = "git://github.com/OpenSC/${BPN}.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
 # v1.27
-SRCREV = "564a582d600c7eec7b8e303a22b575fd52622174"
+SRCREV = "a4b46d545c33459610d4b4ae85a43a76e03a8c5e"
 
 UPSTREAM_CHECK_GITTAGREGEX = "pkcs11-helper-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.25.1


