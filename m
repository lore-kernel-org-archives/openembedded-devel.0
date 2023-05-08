Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77433C7EE26
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 09:59:38 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.103418.1683539975394995629
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 02:59:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JsLfYL33;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683539973; i=@fujitsu.com;
	bh=fDIzgZ++tyDVQYNWlgW4LTSwOgO1FjRCSLFPs1fLtR4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=JsLfYL33QvYEL5co4j0oJ0iWs7xp/s49uSCJQWfI3fsD7wcwrCgN4+5Heo4sgCWvA
	 d2aa9tSVrn38u0zH/bGstpcAMA8PHpS5CRd34pBZ7W4oI+LZHexQeu2GpHeAgNFOLE
	 y3AlAhDUJ38rDVneEBOWMmCwxmaqov+0wrWJkw7HjHImAQqZi+3bHHxNynPJIxeasI
	 t+sQKL0bWR8dj77MO6rhdmO/KxICx7xjjy9fxzrw9nC5kJsCF9dNJVCdB2h1Ti3/yx
	 YW1hdOlDL/o+zlg0eXvxZzpn7QP4KRnfddhwHIux29jLISNVrUpNGN9nhhYjBIezxy
	 62mhmDXOaOluA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrALMWRWlGSWpSXmKPExsViZ8ORpMt6IiL
  FYMZMMYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaN7aWzBDM6KL/NXsDYwruboYuTiEBLYyCjx
  Zu4Sxi5GTiBnGpPEoX5PEJtNQE1i+q0brCC2iICuxMcPc8FqmAVUJGZMPsIEYgsLOEuc2bGPH
  cRmEVCVeLTgIlicV8BJomHFMjYQW0JAQWLKw/fMIDYnUP2qy6fZIHY5SWz685EdokZN4uq5Tc
  wTGHkWMDKsYjQrTi0qSy3SNTTSSyrKTM8oyU3MzNFLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iu
  uzE3OSdHLSy3ZxAgMiJRixa4djAd2/dU7xCjJwaQkymt6MCxFiC8pP6UyI7E4I76oNCe1+BCj
  DAeHkgRv27aIFCHBotT01Iq0zBxgcMKkJTh4lER4ZY8ApXmLCxJzizPTIVKnGBWlxHlLjwMlB
  EASGaV5cG2wiLjEKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZi3GmQ8T2ZeCdz0V0CLmYAW+1
  8OB1lckoiQkmpgsjy6U1yscYr2qyURhzSv1bCv7jC/lvctdXv3Be4zSyfMVpeQbZ57MspVtia
  waOpcg78/VW9x8blrLLpUXJnMU3HuyIub4ltiFn6Om7w/g9ejZJ3GtG8Kk/4zbYrMd4uqrLcN
  SU9tLl5fcsPxSeTZtZwsacuq39+/9msdW9tj2Snuouu+JOxafIxfoOnNYvtzdZ1VYdPZePefF
  MqY8K/vVFtcz2rN3PYVzz3XpBsXb5j0/uHafJmpTTOq7k/KDFoU3RRoHKfHZqKx/J0y35J3jI
  5CUpfUDuepbZux+Hn+N/HXjacli387SXiHiLJ+K732XeA0l0Tl4dc9OjPcIq53bja22PtJjPW
  Q7OpSRdWFSizFGYmGWsxFxYkAcr9SuAMDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-571.messagelabs.com!1683539973!413411!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29214 invoked from network); 8 May 2023 09:59:33 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-20.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 09:59:33 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 1A3AF1D4;
	Mon,  8 May 2023 10:59:33 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 386AC1C2;
	Mon,  8 May 2023 10:59:31 +0100 (BST)
From: Wang Mingyu <wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] babl: upgrade 0.1.104 -> 0.1.106
Date: Mon,  8 May 2023 17:59:16 +0800
Message-Id: <1683539957-25094-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683539957-25094-1-git-send-email-wangmy@fujitsu.com>
References: <1683539957-25094-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 09:59:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102383

Changelog:
=========
Disable LUTs on big-endian, fix to 1bpp->4bpp LUTs, faster startup by caching
balanced RGB to XYZ matrices.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gimp/babl/{babl_0.1.104.bb => babl_0.1.106.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/babl/{babl_0.1.104.bb => babl_0.1.106.bb} (84%)

diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.104.bb b/meta-gnome/recipes-gimp/babl/babl_0.1.106.bb
similarity index 84%
rename from meta-gnome/recipes-gimp/babl/babl_0.1.104.bb
rename to meta-gnome/recipes-gimp/babl/babl_0.1.106.bb
index a79dd4d1df..5a5f4f5e7c 100644
--- a/meta-gnome/recipes-gimp/babl/babl_0.1.104.bb
+++ b/meta-gnome/recipes-gimp/babl/babl_0.1.106.bb
@@ -11,7 +11,7 @@ inherit setuptools3 gnomebase gobject-introspection vala
 DEPENDS += "lcms"
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/0.1/${BP}.tar.xz"
-SRC_URI[sha256sum] = "22e38e1d19c5391abc8ccf936033a9d035e8a8ec7523e5cd76a4c01137d7160c"
+SRC_URI[sha256sum] = "d325135d3304f088c134cc620013acf035de2e5d125a50a2d91054e7377c415f"
 
 FILES:${PN} += "${libdir}/${BPN}-${@gnome_verdir("${PV}")}"
 
-- 
2.34.1


