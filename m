Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD8BEFD231
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 09:38:41 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42055.1772012318895928097
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 01:38:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QxxTc7CO;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772012318; x=1803548318;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dVX9WFUnmbBotWZdPRiwXhLHAGUKGxfxvke/lC869fY=;
  b=QxxTc7COkYvQl+l1Y+9c6xUGvzqaLXx9QSb+wvgzzLXpPzpAX+ZeHZxg
   2BSj1JbVwdU5z+0r7/XPWMFLFoaA0USGao1mhoOGCiguwYS42Mb8gbC5n
   ro4+hn8myuQN9PsLGI6smHwx3gWf/AlO/AQHQCUAb4/sb28BBZhj1y9Le
   xLSjJjgvamqoyZF+7VcOiQxKo3NdS8yqcwJfiDhhbgR2qbPZ6t1HaSBOE
   layy3kRiEop+9UU5v9LEXg9+4ZFouvd2z0CTSxSZKQIOi5U3B3W1FOqdo
   hGIQV/vjv3PmKBuxOXhOoWPMY1PvkY6gNRiH3AfIRwYkpAsvSx+HxByyP
   w==;
X-CSE-ConnectionGUID: kbsejBnsS2m9qojeQRLvXA==
X-CSE-MsgGUID: ORmHVXQsRSOEAl+ILS8Fgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="209814750"
X-IronPort-AV: E=Sophos;i="6.21,310,1763391600"; 
   d="scan'208";a="209814750"
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.fujitsu.com (Postfix) with ESMTPS id 370D8CA71
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:37 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id DCF721C0094B
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 0B0EE101BB42;
	Wed, 25 Feb 2026 09:38:33 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 28/33] postfix: upgrade 3.10.6 -> 3.10.8
Date: Wed, 25 Feb 2026 17:37:22 +0800
Message-ID: <20260225093727.1284-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260225093727.1284-1-wangmy@fujitsu.com>
References: <20260225093727.1284-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124640

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../postfix/{postfix_3.10.6.bb => postfix_3.10.8.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.10.6.bb => postfix_3.10.8.bb} (99%)

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.10.6.bb b/meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb
similarity index 99%
rename from meta-networking/recipes-daemons/postfix/postfix_3.10.6.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb
index 647680bf25..2423e17169 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.10.6.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb
@@ -28,7 +28,7 @@ SRC_URI = "http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
            "
 
-SRC_URI[sha256sum] = "71b383f57d4cb363201be8a301bcbafe304aadbe7f38ebde41cd5b952248465b"
+SRC_URI[sha256sum] = "31d4b3eb8093d823b5a151f571719ff7c0462571bc95e6440d87ca525bfb096c"
 
 UPSTREAM_CHECK_URI = "https://www.postfix.org/announcements.html"
 UPSTREAM_CHECK_REGEX = "postfix-(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


