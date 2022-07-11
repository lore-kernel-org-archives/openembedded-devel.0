Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7427AC433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 08:49:19 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.26295.1657529354964778904
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jul 2022 01:49:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=C2VdU1CI;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657529353; i=@fujitsu.com;
	bh=g6gzFEWC+SHnEIp4BCImyXYciOTw1qQ3Kj7DTRzLqJI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=C2VdU1CIUr81lDD8Epr1f0L9Ww4p2v67MIZUNsKRpnowTFEvnNx195p46ZXDNNvJK
	 R+hXJYtbrTyMW1biZJrtyuz9Akur7+niImqu6/qRasPMKVRvxBIdjN8U1TmBg73FRR
	 yfHEZIau2QzZJQ8ZI9rAIRkOP2WdxtQs90PrOeAanRGb+aV8BVJpMyzn0FaTxeV/B6
	 ZVmWIzCybuHVBE7r5FtfI5ra/oIngXrzAhy3FcPbrEFgho5+lsfkOfvB2AXBcQd3Jl
	 /W9PsiLNrYFZn4iQLjw2n74vVSCx3ZgZ2O0mrXVYJ5y9c8SDiPdZVykB7F5AE/T5Xz
	 9mN8KU3xT2wIQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGIsWRWlGSWpSXmKPExsViZ8ORpMv55HS
  SwfUrzBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bRyauYCpqlKuY86GBvYOwR72Lk4hASeMgo
  cXzeDyYI5zKTxMHrm9kgnD2MEve7v7N0MXJysAmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSwQKHFz9nEwm0VAVeLc691gvbwCThLHdz8Aq5cQUJCY8vA9mM0p4Czxad8nsJlCQDUdb5
  6xQdQLSpyc+YQFYr6ExMEXL6B6FSVmX25mgbArJGbM2MYGYatJXD23iXkCo+AsJO2zkLQvYGR
  axWidVJSZnlGSm5iZo2toYKBraGiqa2wBpAz1Eqt0E/VSS3XLU4tLdI30EsuL9VKLi/WKK3OT
  c1L08lJLNjECAzmlWC1/B+PflT/1DjFKcjApifIKnzydJMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ
  0mC98sjoJxgUWp6akVaZg4wqmDSEhw8SiK8V08ApXmLCxJzizPTIVKnGL05Fl+9speZY+rsf/
  uZOZaDyZlf2w4wc2za1wUkT/+ZfoBZiCUvPy9VSpz3CMgGAZARGaV5cAtgyeESo6yUMC8jAwO
  DEE9BalFuZgmq/CtGcQ5GJWFe58dAU3gy80rg7ngFdCIT0IlxKSdATixJREhJNTBVGS3S+Pjr
  u/Dy4msSb3hkF8dMXnuoredYW8+sBPanO59rp5d9Xu50cepxntq5lYrqngJvZCbONfFTMfihc
  WP+vFn3rN+7XIlXdLq14sEFjpSDr+NrMx+vUi6rk/cO23l967OCfpZbSpO0j3yy/FGz/kuJfq
  95r470i8YVCok8v2WCWh+GxW1J2Kkqd9UpgCPg8b9jz9OMLrRa+3gfkby/Xc7f+457THH8zCc
  freVWvlr9UULifnDYxznzdhwMuyegwVXyxDna0fap0cTSb0FMpZwZ2g9ilb8ZHZ9qcFpiforq
  6x3/df/GZ6UtDdv20ILBp0EzMtypTsrspvbBz69fP3kQJ7b56eSq3Klbg12VWIozEg21mIuKE
  wFs6DUMiQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-571.messagelabs.com!1657529352!7777!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2042 invoked from network); 11 Jul 2022 08:49:13 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-18.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Jul 2022 08:49:13 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id BEC181AC
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jul 2022 09:49:12 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id B2FBA7C
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jul 2022 09:49:12 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 11 Jul 2022 09:49:10 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libcrypt-openssl-rsa-perl: upgrade 0.32 ->
 0.33
Date: Mon, 11 Jul 2022 16:45:16 +0800
Message-ID: <1657529116-24181-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657529116-24181-1-git-send-email-wangmy@fujitsu.com>
References: <1657529116-24181-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Jul 2022 08:49:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97809

0001-Fix-for-Issue-31.patch
removed since it's included in 0.33

Changelog:
=========
- Update for windows github CI
- Remove duplicit 'LICENSE' key
- Remove EUMM Remove version check
- #31 by removing reference to RSA_SSLV23_PADDING (removed from OpenSSL starting from v3.0.0)
- support passphase protected private key load
- fix 'unsupported encryption' error on old library versions
- Clarify croak message for missing passphrase on older cyphers
- More structs opaqued in LibreSSL 3.5
- Use a macro for dealing with older SSL lacking macros
- more CI fixups. Drop testing for 5.10 and 5.8. Something is broken upstream.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../files/0001-Fix-for-Issue-31.patch         | 37 -------------------
 ...2.bb => libcrypt-openssl-rsa-perl_0.33.bb} |  3 +-
 2 files changed, 1 insertion(+), 39 deletions(-)
 delete mode 100644 meta-perl/recipes-perl/libcrypt/files/0001-Fix-for-Issue-31.patch
 rename meta-perl/recipes-perl/libcrypt/{libcrypt-openssl-rsa-perl_0.32.bb => libcrypt-openssl-rsa-perl_0.33.bb} (86%)

diff --git a/meta-perl/recipes-perl/libcrypt/files/0001-Fix-for-Issue-31.patch b/meta-perl/recipes-perl/libcrypt/files/0001-Fix-for-Issue-31.patch
deleted file mode 100644
index a5ea43f88..000000000
--- a/meta-perl/recipes-perl/libcrypt/files/0001-Fix-for-Issue-31.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 5e8202458e41ba1f7801746c503fe7c60ae340d5 Mon Sep 17 00:00:00 2001
-From: kambe-mikb <77083885+kambe-mikb@users.noreply.github.com>
-Date: Tue, 28 Sep 2021 17:40:18 +1000
-Subject: [PATCH] Fix for Issue 31
-
-Fix Issue 31 by removing reference to RSA_SSLV23_PADDING (removed from OpenSSL starting from v3.0.0)
-
-Upstream-Status: Submitted [https://github.com/toddr/Crypt-OpenSSL-RSA/pull/32]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- RSA.xs | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/RSA.xs b/RSA.xs
-index 46cb199..4f65dfc 100644
---- a/RSA.xs
-+++ b/RSA.xs
-@@ -640,12 +640,16 @@ use_pkcs1_oaep_padding(p_rsa)
-   CODE:
-     p_rsa->padding = RSA_PKCS1_OAEP_PADDING;
- 
-+#if OPENSSL_VERSION_NUMBER < 0x30000000L
-+
- void
- use_sslv23_padding(p_rsa)
-     rsaData* p_rsa;
-   CODE:
-     p_rsa->padding = RSA_SSLV23_PADDING;
- 
-+#endif
-+
- # Sign text. Returns the signature.
- 
- SV*
--- 
-2.33.1
-
diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.32.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.33.bb
similarity index 86%
rename from meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.32.bb
rename to meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.33.bb
index fd92c8a8d..aa8d138f2 100644
--- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.32.bb
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.33.bb
@@ -4,10 +4,9 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a67ceecc5d9a91a5a0d003ba50c26346"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/Crypt/Crypt-OpenSSL-RSA-${PV}.tar.gz \
-           file://0001-Fix-for-Issue-31.patch \
 "
 
-SRC_URI[sha256sum] = "adc74f0ae125c77f65d5dd32abb9c3429300a79543bf263494f333f9c0b62a61"
+SRC_URI[sha256sum] = "bdbe630f6d6f540325746ad99977272ac8664ff81bd19f0adaba6d6f45efd864"
 
 DEPENDS += "libcrypt-openssl-guess-perl-native openssl"
 
-- 
2.25.1


