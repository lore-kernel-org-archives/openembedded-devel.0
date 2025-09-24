Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 495E9CAC5B1
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 03:59:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by mx.groups.io with SMTP id smtpd.web10.4828.1758686369007389432
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 20:59:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=jhjljrsF;
 spf=pass (domain: intel.com, ip: 192.198.163.13, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758686371; x=1790222371;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=3BUR3MKf9ZZD9iC8tb8woE4TN3lnG2ngJvX8+BF1qDA=;
  b=jhjljrsFFTbTZ9g79Bg/4WpX7U55xmhmIwT/NPda304K2N8Tu57MSkkU
   UKyMIDdeivMvnWnItY2JIqM8pLls1xIF0+MXrnODVaPoUkepU/0fRUaWR
   iChZH7/+Gdb/7FvQFAkgXZ8EbNq36UqO/WNGVkr+S1OFmhItGfuxdSL+Q
   wNwhM87kgRGFt2GNN6nTzWE+727dO2sSV4/AAerqze0e9BABZcKO7Kx5r
   cyt/a9olqMZg7feXpLOs3gzMY8mo9v510qzKvfm5lDBy6KKZqnchBb1AP
   5y4gqq0sAHlfKqq0KKkbzOM22tgShnxmANfJpjSKvfOvY+swJG3w2H1rC
   A==;
X-CSE-ConnectionGUID: stiYC5kZQEqYyk5df2SWGQ==
X-CSE-MsgGUID: UvkGIMC9SOatKCCobEp7NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="63602892"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="63602892"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 20:59:31 -0700
X-CSE-ConnectionGUID: A9T4R+rGSPKfR+m8k+C65Q==
X-CSE-MsgGUID: JGzpZs/oSlG75lXQHsRMjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="176873676"
Received: from unknown (HELO anmitta2-mobl4.png.intel.com) ([10.107.11.67])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 20:59:31 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 4/8] procmail: fix build failure with gcc-14
Date: Wed, 24 Sep 2025 11:59:19 +0800
Message-ID: <20250924035923.35477-4-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924035923.35477-1-anuj.mittal@intel.com>
References: <20250924035923.35477-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 03:59:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119744

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a7d98292771c4248a8a6deb370d762dd96cad989)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta-oe/recipes-support/procmail/procmail_3.22.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/procmail/procmail_3.22.bb b/meta-oe/recipes-support/procmail/procmail_3.22.bb
index 16917666a4..abb87f9935 100644
--- a/meta-oe/recipes-support/procmail/procmail_3.22.bb
+++ b/meta-oe/recipes-support/procmail/procmail_3.22.bb
@@ -33,7 +33,7 @@ do_configure() {
 }
 
 do_compile() {
-    oe_runmake -i TARGET_CFLAGS="$TARGET_CFLAGS -Wno-comments -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS0="${LDFLAGS}"
+    oe_runmake -i CFLAGS="$TARGET_CFLAGS -Wno-comments -Wno-implicit-int -Wno-implicit-function-declaration -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS0="${LDFLAGS}"
 }
 
 do_install() {

