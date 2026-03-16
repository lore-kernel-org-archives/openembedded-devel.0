Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1416AFB5E88
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 23:06:23 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64175.1773702374982185557
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 16:06:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Y489UyZG;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20260316230611ac7fdf497a000207e8-r89vjh@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260316230611ac7fdf497a000207e8
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 17 Mar 2026 00:06:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Im1x1xF3uF4DoVJmxi/vgJ05zKcgE3mI1I3LuZy903k=;
 b=Y489UyZGu/sCfkY4B2YTi3Uyp26PsNYicelmbBQpBcgz2p9juyPtjerxz987U+FsAUUliW
 sGRfj0NJxEgRBTacVYOkx7UCJYKpnwc37ieXnCCXJ4rgZL5QG4f8ROfmBOIARb1Ve0MoQYtN
 VJuaSelqrdeagmayzbOK/uC2Mcz7v1kWh8wvTSXvJJxGrQ/zMT3eLB0ABYY2hQeTPh0xNECV
 naYXCK/2e7LugPhOBmWGyPF8wzclY2H2zf7RDvnlhuIzsviZejUPnOUxtkrQwfnvGJfVlG5O
 zBU8fLGbwpg2btkJWLl0iyRrHLXXe7EItbBAMeUc8KBuWDX6pvYtmBxg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][PATCH 1/2] squid: fix UPSTREAM_CHECK_REGEX
Date: Tue, 17 Mar 2026 00:06:07 +0100
Message-Id: <20260316230608.944064-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 23:06:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125298

From: Peter Marko <peter.marko@siemens.com>

Squid tags are in form SQUID_<MAJ>_<MIN>.
This can also be seen in SRC_URI download link.

This change will make "devtool latest-version squid" correctly show 7.5

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-networking/recipes-daemons/squid/squid_7.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/squid/squid_7.4.bb b/meta-networking/recipes-daemons/squid/squid_7.4.bb
index 6333d1e0f2..3ba1895c45 100644
--- a/meta-networking/recipes-daemons/squid/squid_7.4.bb
+++ b/meta-networking/recipes-daemons/squid/squid_7.4.bb
@@ -29,7 +29,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     "
 
 UPSTREAM_CHECK_URI = "https://github.com/squid-cache/${BPN}/releases/"
-UPSTREAM_CHECK_REGEX = "v?(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_REGEX = "SQUID_(?P<pver>\d+(_\d+)+)"
 
 DEPENDS = "libtool"
 

