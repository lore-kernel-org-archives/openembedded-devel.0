Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4620BCC6B04
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 06:57:06 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10214.1775113019083505651
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 23:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sfScv3EY;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775113018; x=1806649018;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=fQ3MuOzayYfqr4sCvDu66TlQzwMuMSd5Iq9GpfWQSqw=;
  b=sfScv3EY9wXeJ1+PaUSWE5xV/aDntTdX2EMta73J6wXqs1+3s2jNQSPT
   0mEQUp7tHPXAIoUG+z9Qm7a5J3BQ8gFYpQ10TwYaOZaiodjmXDOWSuyMG
   XCfNjcyi+oqLKurD+TrfnVyILHg5m9tak9t3r0MnNqJO7sV2jQ2qS24Aj
   otrH4NQCmVYYAalT8ZfKxi6/Kug6BUAIUWamy8mY1xfSmgccB/Nz2gFaY
   Ln2o2mCAYPLXxINdMRriS21xK3nVZ8rJset92BBIbmVKY6GgQ8Q52Jsga
   jkdupqiY6CQ5NSsMi6kdQMHbLA2W3OLKPLHHsMUC5QhVvVKaExvsk4ZtF
   g==;
X-CSE-ConnectionGUID: aJ3yosfIRnqRbiQnsTp6rg==
X-CSE-MsgGUID: d/Wv4ksLR7K8yDDK+26jyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="235531028"
X-IronPort-AV: E=Sophos;i="6.23,155,1770562800"; 
   d="scan'208";a="235531028"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 15:56:56 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 8C2A842A33F
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 06:56:57 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 38A001C4C198
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 06:56:57 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 04D681003756
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 06:56:54 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-perl][PATCH] libnet-ssleay-perl: upgrade 1.94 -> 1.96
Date: Thu,  2 Apr 2026 14:56:50 +0800
Message-ID: <20260402065652.14800-2-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402065652.14800-1-liuyd.fnst@fujitsu.com>
References: <20260402065652.14800-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 06:57:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125960

1.Changelog:
  https://metacpan.org/dist/Net-SSLeay/changes

2.Remove following patches as merged upstream
  0001-tests-Address-another-formatting-difference-in-OpenSSL-3.4.1.patch
  0001-test-32_x509_get_cert_info-allow-single-colon.patch

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...509_get_cert_info-allow-single-colon.patch | 29 -----------------
 ...rmatting-difference-in-OpenSSL-3.4.1.patch | 32 -------------------
 ...erl_1.94.bb => libnet-ssleay-perl_1.96.bb} |  4 +--
 3 files changed, 1 insertion(+), 64 deletions(-)
 delete mode 100644 meta-perl/recipes-perl/libnet/libnet-ssleay-perl/0001-test-32_x509_get_cert_info-allow-single-colon.patch
 delete mode 100644 meta-perl/recipes-perl/libnet/libnet-ssleay-perl/0001-tests-Address-another-formatting-difference-in-OpenSSL-3.4.1.patch
 rename meta-perl/recipes-perl/libnet/{libnet-ssleay-perl_1.94.bb => libnet-ssleay-perl_1.96.bb} (85%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/0001-test-32_x509_get_cert_info-allow-single-colon.patch b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/0001-test-32_x509_get_cert_info-allow-single-colon.patch
deleted file mode 100644
index 805a16d6c9..0000000000
--- a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/0001-test-32_x509_get_cert_info-allow-single-colon.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 4068d585875d3ba99da2cbe41f60d0dd4f4290d1 Mon Sep 17 00:00:00 2001
-From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
-Date: Wed, 16 Oct 2024 21:48:51 +0200
-Subject: [PATCH] test: 32_x509_get_cert_info allow single colon.
-
-Starting with 3.4.0 the double colon in emailAddress has been removed.
-Adapt the test to allow a single colon in 3.4.0 and later.
-
-Upstream-Status: Backport [https://github.com/radiator-software/p5-net-ssleay/commit/4068d585875d3ba99da2cbe41f60d0dd4f4290d1]
-Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
----
- t/local/32_x509_get_cert_info.t | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/t/local/32_x509_get_cert_info.t b/t/local/32_x509_get_cert_info.t
-index 0f7e2d5a..0fd1b689 100644
---- a/t/local/32_x509_get_cert_info.t
-+++ b/t/local/32_x509_get_cert_info.t
-@@ -188,6 +188,10 @@ for my $f (keys (%$dump)) {
-                   ) {
-                       $ext_data =~ s{(othername:) [^, ]+}{$1<unsupported>}g;
-                   }
-+                  # Starting with 3.4.0 the double colon in emailAddress has been removed.
-+                  if (Net::SSLeay::SSLeay >= 0x30400000) {
-+                      $ext_data =~ s{emailAddress::}{emailAddress:};
-+                  }
-               }
-               elsif ( $nid == 89 ) {
-                   # The output formatting for certificate policies has a
diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/0001-tests-Address-another-formatting-difference-in-OpenSSL-3.4.1.patch b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/0001-tests-Address-another-formatting-difference-in-OpenSSL-3.4.1.patch
deleted file mode 100644
index 17310908c1..0000000000
--- a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/0001-tests-Address-another-formatting-difference-in-OpenSSL-3.4.1.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From eac7ac502b02f44a84a67920e9f634cce71ff335 Mon Sep 17 00:00:00 2001
-From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
-Date: Tue, 18 Feb 2025 18:57:15 +0100
-Subject: [PATCH] tests: Address another formatting difference in OpenSSL 3.4.1
-
-Since OpenSSL 3.4.1, commit 8a28bca8ee08 ("x509: add a newline after
-printing Full Name") to be exact, there is another new line change.
-
-Adapt the testsuite.
-
-Fixes: #513
-
-Upstream-Status: Backport [https://github.com/radiator-software/p5-net-ssleay/commit/eac7ac502b02f44a84a67920e9f634cce71ff335]
-Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
----
- t/local/32_x509_get_cert_info.t | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/t/local/32_x509_get_cert_info.t b/t/local/32_x509_get_cert_info.t
-index 0fd1b68..08316bf 100644
---- a/t/local/32_x509_get_cert_info.t
-+++ b/t/local/32_x509_get_cert_info.t
-@@ -218,6 +218,9 @@ for my $f (keys (%$dump)) {
-                       # OpenSSL 1.0.0 to 1.1.1:
-                       $ext_data =~ s{(Full Name:\n  )}{\n$1}g;
-                       $ext_data .= "\n";
-+                  } elsif ( Net::SSLeay::SSLeay >  0x3040000f ) {
-+                      $ext_data =~ s{(\nFull Name:)}{\n$1}g;
-+                      $ext_data .= "\n";
-                   }
-               }
-               elsif ( $nid == 126 ) {
diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.94.bb b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.96.bb
similarity index 85%
rename from meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.94.bb
rename to meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.96.bb
index 532744456d..d2c3bee645 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.94.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.96.bb
@@ -24,10 +24,8 @@ RDEPENDS:${PN} += "\
 "
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/C/CH/CHRISN/Net-SSLeay-${PV}.tar.gz \
-           file://0001-tests-Address-another-formatting-difference-in-OpenSSL-3.4.1.patch \
-           file://0001-test-32_x509_get_cert_info-allow-single-colon.patch \
            file://run-ptest"
-SRC_URI[sha256sum] = "9d7be8a56d1bedda05c425306cc504ba134307e0c09bda4a788c98744ebcd95d"
+SRC_URI[sha256sum] = "ab213691685fb2a576c669cbc8d9266f8165a31563ad15b7c4030b94adfc0753"
 
 S = "${UNPACKDIR}/Net-SSLeay-${PV}"
 
-- 
2.43.0


