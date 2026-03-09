Return-Path: <andrej.kozemcak@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DFA3EFCD92
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 10:06:44 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10844.1773050801096394196
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 03:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=andrej.kozemcak@siemens.com header.s=fm1 header.b=eeV2Lt3K;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1334352-202603091006392975349f1900020763-kpg7ye@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202603091006392975349f1900020763
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 09 Mar 2026 11:06:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=andrej.kozemcak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=vUnxXYYhwFXFokzQOdqkU9svspnJvISnJBe8kp2N+vw=;
 b=eeV2Lt3K6Ku+b+SxwxLh1PY8BdhDqthIrBN5EGc5prSNJk3YIP1d3G18llHn5IRTVhhdBI
 svJTz91h79nJPeva0LTW00iO9OQB7Mjs4h+TepRlYEawytZBG/m9cE24S3pQrulm8auUEXCP
 MUn0/dMJDCtVIi9E3B1mGMfS/2BW8YIO2vZkCPCYtYJ+sWYsGolyXFJIB9PeIKFuLvLLxAGW
 mef3ZUkbqNPtzY1l38kW1VvPR7QGhv+HtUV5/vuxPtXLpjJa9LHafF3dg5L/z/zlTBHyAtKT
 1uM4c+9KAMs2qjImliV+b3uyocKJCGhoNdaKocSUcbjRjsRwwUUQP1Lw==;
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [meta-oe][PATCH 06/14] libnetfilter-conntrack: upgrade 1.1.0 -> 1.1.1
Date: Mon,  9 Mar 2026 11:06:22 +0100
Message-ID: <20260309100630.404637-6-andrej.kozemcak@siemens.com>
In-Reply-To: <20260309100630.404637-1-andrej.kozemcak@siemens.com>
References: <20260309100630.404637-1-andrej.kozemcak@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1334352:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 10:06:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124978

Changelog:
   https://git.netfilter.org/libnetfilter_conntrack/log/?h=libnetfilter_conntrack-1.1.1

Changes:
  - libnetfilter_conntrack: bump version to 1.1.1
  - src: add support for CTA_TIMESTAMP_EVENT

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 ...ilter-conntrack_1.1.0.bb => libnetfilter-conntrack_1.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/libnetfilter/{libnetfilter-conntrack_1.1.0.bb => libnetfilter-conntrack_1.1.1.bb} (87%)

diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.1.0.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.1.1.bb
similarity index 87%
rename from meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.1.0.bb
rename to meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.1.1.bb
index 08d3ab691c..e397034504 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.1.0.bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.1.1.bb
@@ -9,7 +9,7 @@ DEPENDS = "libnfnetlink libmnl"
 SRC_URI = "https://www.netfilter.org/projects/libnetfilter_conntrack/files/libnetfilter_conntrack-${PV}.tar.xz \
           "
 
-SRC_URI[sha256sum] = "67edcb4eb826c2f8dc98af08dabff68f3b3d0fe6fb7d9d0ac1ee7ecce0fe694e"
+SRC_URI[sha256sum] = "769d3eaf57fa4fbdb05dd12873b6cb9a5be7844d8937e222b647381d44284820"
 
 S = "${UNPACKDIR}/libnetfilter_conntrack-${PV}"
 
-- 
2.47.3


