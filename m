Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56395CCF9F1
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 00:15:32 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.24188.1761696923998102196
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 17:15:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JwQwEUHs;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761696924; x=1793232924;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WepYE0B3dNuTlKVaofhEtPT/SgL3plVY7TlFHxQGYEk=;
  b=JwQwEUHsw9CbydF3z91uTlSgWXoqecgWpJ6yyTfVASkY19m0g2OEjw4+
   Jiyh+N8T3hDHbiTG49DgHjTnTWEcIJYxo3Oi8/LtXXevhTgLAYkGRi30i
   MxoVehgO+cxn6g9Eo+Q0v6OmSDtitPxLyXXO301dPtZcP0GyVQvzKl/xT
   Fgm7Qvtuse8240pddmPy8ZhamcdS3sznRvI26LGwH3n7fqJEOfXCOKp6o
   QSyi1EU9htqRoAGHEzDzA9Hvpds2wVNZJg9C9tv++oWcL13jW8ZhAqIzE
   Crm2FQVDIHEKGIo0Co4Y/StnTDv4FG/EmDC0cqnhq+SIz1DCreidqRnKV
   Q==;
X-CSE-ConnectionGUID: 0uOjl8/YQymN5wCPAzgLLA==
X-CSE-MsgGUID: fcJZFwTrQLWP43iEr51fuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="217368335"
X-IronPort-AV: E=Sophos;i="6.19,262,1754924400"; 
   d="scan'208";a="217368335"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 09:15:22 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 184804071C0
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:22 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id C9897C012A6
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:21 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 2D885826FCD;
	Wed, 29 Oct 2025 00:15:18 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/32] graphviz: upgrade 14.0.1 -> 14.0.2
Date: Wed, 29 Oct 2025 08:14:37 +0800
Message-ID: <20251029001505.528-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251029001505.528-1-wangmy@fujitsu.com>
References: <20251029001505.528-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121110

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../graphviz/{graphviz_14.0.1.bb => graphviz_14.0.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/graphviz/{graphviz_14.0.1.bb => graphviz_14.0.2.bb} (97%)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_14.0.1.bb b/meta-oe/recipes-graphics/graphviz/graphviz_14.0.2.bb
similarity index 97%
rename from meta-oe/recipes-graphics/graphviz/graphviz_14.0.1.bb
rename to meta-oe/recipes-graphics/graphviz/graphviz_14.0.2.bb
index 7114473ad0..6cd285392f 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_14.0.1.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_14.0.2.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://gitlab.com/api/v4/projects/4207231/packages/generic/${BPN}-re
 SRC_URI:append:class-nativesdk = "\
            file://graphviz-setup.sh \
 "
-SRC_URI[sha256sum] = "2450df5d80c68f13f26362fafa797b2fbf887ebdc6733920cc5f7df5bec0cd23"
+SRC_URI[sha256sum] = "31af4728cd0d7db91013d29286227ae6b5264ff897647c2ebfeb85f47c08177e"
 
 UPSTREAM_CHECK_URI = "https://graphviz.org/download/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


