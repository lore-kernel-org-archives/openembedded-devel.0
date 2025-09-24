Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 652EFCAC59A
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 03:59:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by mx.groups.io with SMTP id smtpd.web10.4828.1758686369007389432
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 20:59:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=RLEZvq6A;
 spf=pass (domain: intel.com, ip: 192.198.163.13, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758686376; x=1790222376;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Lrprsmgr4iWlIVSZj5V8hVWMcEMJnK/CEiej9GVONaY=;
  b=RLEZvq6AKdf3lN9Chv9qovv9+LzNx9pqAbGm9+wNUm9JaFSU7uKsRwSR
   w40RBnqnGbLjPONG7MVnMsHUrsnv7k72ZkMxVO/xj9w1bX3kiRJR24Ge6
   id06G/rTsOiIR7JNDgpLZUt39SwYHvjcB7LpXaxPHBTkiOhG0h0kz26Rh
   QMP/H0fnD1VuqhFQOcKYnaz0c2UAp8bFYiLFr0I9/ELnKjTzHrhE2Vnju
   DA0j5alvp4QsYe1uvsi9R9i2ZJfMuFBu/zK34HYkO6R1l22hL+GUFl5GA
   VDyzZRW+nM2wi9bwN4eePG9BSrUTMYGThY/dMvtxghgkNQj2PkRfcCDa+
   A==;
X-CSE-ConnectionGUID: r1o3gLQfSp6fc/Jn/+NLVQ==
X-CSE-MsgGUID: T8tKX8RUQ5+k5vytDmMTOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="63602896"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="63602896"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 20:59:36 -0700
X-CSE-ConnectionGUID: IyxB5QQLQmuVhL8FrP5zPw==
X-CSE-MsgGUID: 0fpqKbCTTICces6bq9bB6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="176873682"
Received: from unknown (HELO anmitta2-mobl4.png.intel.com) ([10.107.11.67])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 20:59:35 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 8/8] procmail: Add -Wno-implicit-int to fix error of do_compile
Date: Wed, 24 Sep 2025 11:59:23 +0800
Message-ID: <20250924035923.35477-8-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924035923.35477-1-anuj.mittal@intel.com>
References: <20250924035923.35477-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 03:59:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119748

From: Wang Mingyu <wangmy@fujitsu.com>

Without the option -Wno-implicit-int , the following error will occur and the command  procmail will not be installed to target.
lmtp.c:54:8: error: type defaults to 'int' in declaration of 'ctopfd' [-Wimplicit-int]
   54 | static ctopfd;
      |        ^~~~~~
make[1]: [Makefile:239: lmtp.o] Error 1 (ignored)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d23de74dc8f80b8a4abb21801dcfbef611664e9a)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta-oe/recipes-support/procmail/procmail_3.22.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/procmail/procmail_3.22.bb b/meta-oe/recipes-support/procmail/procmail_3.22.bb
index 604dd285e8..5da6ce2603 100644
--- a/meta-oe/recipes-support/procmail/procmail_3.22.bb
+++ b/meta-oe/recipes-support/procmail/procmail_3.22.bb
@@ -38,7 +38,7 @@ do_configure() {
 }
 
 do_compile() {
-    oe_runmake -i CFLAGS="$TARGET_CFLAGS -Wno-comments -Wno-implicit-function-declaration -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS0="${LDFLAGS}"
+    oe_runmake -i CFLAGS="$TARGET_CFLAGS -Wno-comments -Wno-implicit-int -Wno-implicit-function-declaration -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS0="${LDFLAGS}"
 }
 
 do_install() {

