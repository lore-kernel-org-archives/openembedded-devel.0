Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C14C00140
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 06:49:39 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.13701.1660546170569277196
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Aug 2022 23:49:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fa0r1WJl;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660546168; i=@fujitsu.com;
	bh=1L3qcaEi1FsW3dREWjj28hsurweko0PvA1gwfbv+qOE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=fa0r1WJlufhlu9KbbzXWRuTnjA7VZTS067QXIMEU3MwD/u9dL20Jh50jZple2RZ1J
	 hV8a8L48FIPIgP9/AuGYIl0bVfLcsh3p6M7TWZCmHQ7CkmaQn95ziUDJPwIx2faYmn
	 Td35M/RQ7kjR7J5bvQz55We2bWjhvFKPtkdbLm+hq+f8436gBV5rZuNfliN7gassZG
	 AR73HNrcmtD9zsaN6ktDFvZzkyDbYNdvyy5krW9yVY48N6tsImLw/441z+sgqI4x3S
	 1xc3UM71H3mzZYhWk9MR5a1fhbS+QzyoPggUcJAcrRYWxtL4GLiD0bxPXmXQLX6mOC
	 95hDL3fLzPhPA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRWlGSWpSXmKPExsViZ8ORpFvx5me
  SwcKT3BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8ayEx9ZCg5yVpza08fcwHiWo4uRi0NI4CGj
  xN8FF1khnMtMEud+tjJBOHsYJb6vv83WxcjJwSagJjH91g1WEFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAk8SuY8fAbBYBVYmdR74ygdi8Ao4SvS1nwXolBBQkpjx8D9bLCVTfdfsemC0EVLOhcT
  cjRL2gxMmZT1gg5ktIHHzxghmiV1Fi9uVmFgi7QmLGjG1sELaaxNVzm5gnMArOQtI+C0n7Aka
  mVYw2SUWZ6RkluYmZObqGBga6hoamQNpQ19BUL7FKN1EvtVQ3L7+oJEPXUC+xvFgvtbhYr7gy
  NzknRS8vtWQTIzCUU4pT+Xcw3tj3S+8QoyQHk5Io77WLP5OE+JLyUyozEosz4otKc1KLDzHKc
  HAoSfCavgLKCRalpqdWpGXmAOMKJi3BwaMkwtv3AijNW1yQmFucmQ6ROsWoyzHza9sBZiGWvP
  y8VClxXtPXQEUCIEUZpXlwI2AxfolRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMG85yBSezLw
  SuE2vgI5gAjpC7+53kCNKEhFSUg1MRi2LD2RMX293cKaEpnyfdt/GlQkS7441LJvsuYzt6ryC
  HVtXbl9zL7q58mn72SkZZ7flRXzjFhe8knOr99i3eSvy2hO+Vv495bfsQsO3tx4m2aVP98xvW
  P1i8dLwN1OfLI66I15qcS3w9LfiS5Mkru3PK8j89+NT6OSWeVM77vWJGQj/1JNvfhXM8Lv2yW
  6RzTXnj+S80Z92rt0vskcjMv/7pZJZwefzZvLOP6+csLRB7XCANz9b+sGLD+v2r3+V1vuP987
  G8rzNeQ0uh/isFyu0eW6Vd9vFK1DW/jVwzZNLC5qOHd7B/Ofm4m+OdfVGSSEFK6for5ubVLqt
  yDY6Pan5r95fB8fGIg+OiXN3vFViKc5INNRiLipOBACHFlqfbAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-745.messagelabs.com!1660546167!445916!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3370 invoked from network); 15 Aug 2022 06:49:28 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-6.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Aug 2022 06:49:28 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 9BD771A3
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:49:27 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 90E817C
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:49:27 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 15 Aug 2022 07:49:26 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] tracker: upgrade 3.3.2 -> 3.3.3
Date: Mon, 15 Aug 2022 14:49:06 +0800
Message-ID: <1660546148-1668-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1660546148-1668-1-git-send-email-wangmy@fujitsu.com>
References: <1660546148-1668-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Aug 2022 06:49:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98256

Changelog:
 Prepare D-Bus endpoint for cursor streams

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tracker/{tracker_3.3.2.bb => tracker_3.3.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker_3.3.2.bb => tracker_3.3.3.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker_3.3.2.bb b/meta-gnome/recipes-gnome/tracker/tracker_3.3.3.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/tracker/tracker_3.3.2.bb
rename to meta-gnome/recipes-gnome/tracker/tracker_3.3.3.bb
index eaa0e065d1..91d90dde2a 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker_3.3.2.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker_3.3.3.bb
@@ -22,7 +22,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection vala gtk-doc manpages bash-completion features_check python3native
 
-SRC_URI[archive.sha256sum] = "0ed2b98918956d6f16429c607dd8a14c84f4da0a48970fd2eb8c93aba3cf9913"
+SRC_URI[archive.sha256sum] = "4094f704e338f2247fa6b94633279cfd07f7e952bb24627128fab78edb242464"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-- 
2.25.1


