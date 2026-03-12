Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E62103E303
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 02:32:24 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13147.1773282734699843702
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Mar 2026 19:32:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jc31WgQj;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773282734; x=1804818734;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=/dT1809gbNvYu9uvjkLG7lvnLOSogx1kqmGuHhFzTP8=;
  b=jc31WgQjQvwTwn7FW0v4uBaJQn7PslLES6Gp7uC1d+bbkv/GIrBkRyRo
   lVDoUzbQHSEmFMTwiLPQDbHDzEk7aeKl6QvmBkLLBwqxUPsQdEB1vFVRy
   nfLKkkbjs/q4CjRZoklt9IqwAgkqVyLIPvgS3xD/9fwwSOmyE9L2A6Az8
   4cMuAqz9xwbMg7DTJwGYL2a3R9CBEHjn25Yhy1sNW2307zvoIjef55RTL
   XYT0UsaynX6kASIQOiyAUlJyTK5SDrKaSQqWjEkFiZgqX9bWYzSGahrfr
   6SVt8wpEjK+iQCG7JvWTPIavwlDlxvn+vEhZtBV9X9Df8fHyTUXn0+f7N
   A==;
X-CSE-ConnectionGUID: g55mBAECTcioV/ymeSmI8Q==
X-CSE-MsgGUID: +rnAJXTfSVuezJZoy8d9Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="211748866"
X-IronPort-AV: E=Sophos;i="6.23,115,1770562800"; 
   d="scan'208";a="211748866"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 11:32:12 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id F25051000A0B
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 02:32:12 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 9C1801C002AD
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 02:32:12 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.128.218])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 5242214000A6
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 02:32:10 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] tmux: upgrade 3.6 -> 3.6a
Date: Thu, 12 Mar 2026 10:32:06 +0800
Message-ID: <20260312023207.3042-2-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312023207.3042-1-liuyd.fnst@fujitsu.com>
References: <20260312023207.3042-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 02:32:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125097

1. Change log:
  https://raw.githubusercontent.com/tmux/tmux/3.6a/CHANGES

2. Change HOMEPAGE to github.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta-oe/recipes-extended/tmux/{tmux_3.6.bb => tmux_3.6a.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/tmux/{tmux_3.6.bb => tmux_3.6a.bb} (85%)

diff --git a/meta-oe/recipes-extended/tmux/tmux_3.6.bb b/meta-oe/recipes-extended/tmux/tmux_3.6a.bb
similarity index 85%
rename from meta-oe/recipes-extended/tmux/tmux_3.6.bb
rename to meta-oe/recipes-extended/tmux/tmux_3.6a.bb
index 199863d7e4..63011ce040 100644
--- a/meta-oe/recipes-extended/tmux/tmux_3.6.bb
+++ b/meta-oe/recipes-extended/tmux/tmux_3.6a.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Terminal multiplexer"
-HOMEPAGE = "http://tmux.sourceforge.net"
+HOMEPAGE = "https://github.com/tmux/tmux/wiki"
 SECTION = "console/utils"
 
 LICENSE = "ISC"
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://tmux.c;beginline=3;endline=17;md5=f256b76d52e7b4d02bf
 DEPENDS = "ncurses libevent bison-native"
 
 SRC_URI = "https://github.com/tmux/tmux/releases/download/${PV}/tmux-${PV}.tar.gz"
-SRC_URI[sha256sum] = "136db80cfbfba617a103401f52874e7c64927986b65b1b700350b6058ad69607"
+SRC_URI[sha256sum] = "b6d8d9c76585db8ef5fa00d4931902fa4b8cbe8166f528f44fc403961a3f3759"
 
 UPSTREAM_CHECK_URI = "https://github.com/tmux/tmux/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+[a-z]?)"
-- 
2.43.0


