Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A621C83F2D
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 06:41:34 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.15857.1752648084115974949
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jul 2025 23:41:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BGFsroW5;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1752648084; x=1784184084;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OKdCVx5mJqUj9hojREt/NjE67pODMXFIJIgB8KBDCiA=;
  b=BGFsroW5qsZp+hf7HFjvoCReMA7iqzz6YFb7S47+YhY37awp0IviLsm9
   GdhcPGeWL8yVODLvMnH05qRxuEw5nYzXnc5/jMqyyjicULYcdIioi8eSd
   wdjvDDh/OHWdsP/2a5VDKFs9NYOX8Z8qTao/qXps+6tuastdmOnCAGcjx
   xdG39OfpJRrL1PZM0aJp/tO/h7tfcp+EXbFx3daNUyO9Pl/NnxxhIhcNo
   jVEFlfgz0cUUOZawSkGAg5ZGzKMbeRMHMCj5JhFCigqYylmFueRY819uc
   w2eQoNdIz2Nm+peEN/8reFpW7OK8qx6Xc6P52YkzJwsIEUhh3nJikZog2
   Q==;
X-CSE-ConnectionGUID: grwu9YdgRBu4BfYaPcanGA==
X-CSE-MsgGUID: bF5TVdW9SE6TfiaE0W2Mqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="185419638"
X-IronPort-AV: E=Sophos;i="6.16,315,1744038000"; 
   d="scan'208";a="185419638"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 15:41:22 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 7C6891C00087
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:22 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id CA839C01EE3
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:21 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4C9A31A0071;
	Wed, 16 Jul 2025 14:41:18 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 14/14] uftrace: upgrade 0.17 -> 0.18
Date: Wed, 16 Jul 2025 14:41:02 +0800
Message-ID: <20250716064102.1813-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250716064102.1813-1-wangmy@fujitsu.com>
References: <20250716064102.1813-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118584

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- symbol: Fix uninitialized 'sec_iter' in the 'arch_load_dynsymtab_noplt'
- graph: -f total-avg,self-avg,total-max,total-min,self-max,self-min in tui,cmds
- test: exclude system_initialize_function in t295 and t296 using filter option
- record: Add shmem directory to exec permission
- misc: Support Rocky Linux 9 in install-deps parts
- tests: Fix s-thread.c and s-exp-mixed.c tests from clang

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../uftrace/{uftrace_0.17.bb => uftrace_0.18.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/uftrace/{uftrace_0.17.bb => uftrace_0.18.bb} (94%)

diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.17.bb b/meta-oe/recipes-devtools/uftrace/uftrace_0.18.bb
similarity index 94%
rename from meta-oe/recipes-devtools/uftrace/uftrace_0.17.bb
rename to meta-oe/recipes-devtools/uftrace/uftrace_0.18.bb
index 776bb014f4..f82dc17071 100644
--- a/meta-oe/recipes-devtools/uftrace/uftrace_0.17.bb
+++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.18.bb
@@ -10,8 +10,8 @@ DEPENDS:append:libc-musl = " argp-standalone"
 
 inherit autotools
 
-SRCREV = "b0d936107edcefb519abbc9c363ca40daaac23b3"
-SRC_URI = "git://github.com/namhyung/${BPN};branch=master;protocol=https \
+SRCREV = "8ccd4f627569b0af122c8d1df98dc6813ab97a40"
+SRC_URI = "git://github.com/namhyung/${BPN};branch=master;protocol=https;tag=v${PV} \
            file://0001-include-libgen.h-for-basename.patch"
 
 LDFLAGS:append:libc-musl = " -largp"
-- 
2.43.0


