Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C26CCF9EE
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 09:01:26 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.4015.1761642083355077965
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 02:01:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tZIdjfpx;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761642084; x=1793178084;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9bHgO64c5bwDknN9Vqlll2dSoM9k0YffRELohI+jOSE=;
  b=tZIdjfpxd+khb0h+pica/cKLvoXgoP9mGwIZdk4ZYfOoe/gpDw3hGqgf
   L0RWArTQdLAH1ZMt27IAGH9dle7IXLfB60juMOkXDO4MhpH8jL7WMF2YE
   E9VCi0q0KLRM+hftgRRUoOpq9hDFmrUrXHO+bylO83PlWpsp8izFHkT5d
   aTWVBah2Z3wmVo1ND71ee7GdMkENC7Z3OECWWT1o0OQQhqf10GzSC+Ua4
   KYL/Z8mn+S6dh3BLpLNhmkm3ECfn64L9NNCXEHMLYb1S6jaBZHNxPxQcy
   nnYGtpzn0RQuSYSIIt3vIj6g67/+WZC3ttPv68MxbqipMOU3zcIXpYC2L
   A==;
X-CSE-ConnectionGUID: h6m2qf6dRoCoZQ7talKW8A==
X-CSE-MsgGUID: uiy+pM7uT5CLBIS7BJQiig==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="216722809"
X-IronPort-AV: E=Sophos;i="6.19,261,1754924400"; 
   d="scan'208";a="216722809"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 18:01:22 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id C6B2E407555
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 09:01:21 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 811BCC012BF
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 09:01:21 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id D82EE4041DC;
	Tue, 28 Oct 2025 09:01:18 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH 5/5] modify url of debian
Date: Tue, 28 Oct 2025 17:00:36 +0800
Message-ID: <20251028090037.143-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251028090037.143-1-wangmy@fujitsu.com>
References: <20251028090037.143-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 09:01:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121072

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 install-scripts/install-debian-common.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/install-scripts/install-debian-common.sh b/install-scripts/install-debian-common.sh
index bd98827..28665e1 100755
--- a/install-scripts/install-debian-common.sh
+++ b/install-scripts/install-debian-common.sh
@@ -7,8 +7,8 @@ set -e
 debian_version=${1:stretch}
 
 # netperf is in non-free
-echo deb http://deb.debian.org/debian $debian_version main non-free > /etc/apt/sources.list
-echo deb http://security.debian.org/debian-security $debian_version/updates main >> /etc/apt/sources.list
+echo deb http://archive.debian.org/debian $debian_version main non-free > /etc/apt/sources.list
+echo deb http://archive.debian.org/debian-security $debian_version/updates main >> /etc/apt/sources.list
 
 # Fuego python dependencies
 # - python-lxml: ftc, loggen
-- 
2.34.1


