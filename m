Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E64B9D116F1
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 02:38:00 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9148.1764643071680050492
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Dec 2025 18:37:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=asLMpbc2;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764643072; x=1796179072;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mO6QvrTmc+tqZKnDUdI3dhsw/5RPXZA7i5UcDnmGbXo=;
  b=asLMpbc2ygjiQlTHLAN4/yZZrEvr7yyMs/cGDftkfc8Svrnpx5USf8cO
   yJi9q0/IMm0k/Xmq0LipOLzsRcE0JrPeVb1Krvbx1BCEviGevGoIwFcpV
   faUT9YT1iRc3T7m2mmqlf1GLb08BJdCimvlY/J9FjN4GGUkNrvixcGOIo
   qF4VB9rHNAWM0u0Mjs8s5jT1QJ6vCeOCWSsp8U4PHOzQ9oLA+a840RzuQ
   1Omdc/u3qrqzFI4T4rQd2YRwRbXSr8/tNYFZnM/A1y0ZIyWg89hAoa7Bj
   FhTPXJXrkPr2owk/Uw1XpgUyRByiAGXziPZabdQVw8jctN66rxcyA3en5
   A==;
X-CSE-ConnectionGUID: fUsrJl0rQ1q3j95o0nIbGg==
X-CSE-MsgGUID: tJVBo66ASkiUYdQtvwLZyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="200080451"
X-IronPort-AV: E=Sophos;i="6.20,241,1758553200"; 
   d="scan'208";a="200080451"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 11:37:50 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id E77661002BB0
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 02:37:49 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id A070914003AE
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 02:37:49 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 60DE0829ED1
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 02:37:47 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] tmux: upgrade 3.5a -> 3.6
Date: Tue,  2 Dec 2025 10:37:42 +0800
Message-ID: <20251202023742.11842-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 02:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122227

Change log:
https://raw.githubusercontent.com/tmux/tmux/3.6/CHANGES

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta-oe/recipes-extended/tmux/{tmux_3.5a.bb => tmux_3.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/tmux/{tmux_3.5a.bb => tmux_3.6.bb} (90%)

diff --git a/meta-oe/recipes-extended/tmux/tmux_3.5a.bb b/meta-oe/recipes-extended/tmux/tmux_3.6.bb
similarity index 90%
rename from meta-oe/recipes-extended/tmux/tmux_3.5a.bb
rename to meta-oe/recipes-extended/tmux/tmux_3.6.bb
index 72c84f562e..5daa1b174a 100644
--- a/meta-oe/recipes-extended/tmux/tmux_3.5a.bb
+++ b/meta-oe/recipes-extended/tmux/tmux_3.6.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://tmux.c;beginline=3;endline=17;md5=f256b76d52e7b4d02bf
 DEPENDS = "ncurses libevent bison-native"
 
 SRC_URI = "https://github.com/tmux/tmux/releases/download/${PV}/tmux-${PV}.tar.gz"
-SRC_URI[sha256sum] = "16216bd0877170dfcc64157085ba9013610b12b082548c7c9542cc0103198951"
+SRC_URI[sha256sum] = "136db80cfbfba617a103401f52874e7c64927986b65b1b700350b6058ad69607"
 
 UPSTREAM_CHECK_URI = "https://github.com/tmux/tmux/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+[a-z]?)"
-- 
2.43.0


