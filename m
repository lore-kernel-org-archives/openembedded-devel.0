Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D161AC3E8A8
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:48 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web12.2761.1649136980381521870
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 22:36:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PUWzqFtr;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649136978; i=@fujitsu.com;
	bh=RtqaLVWC5L7eXuYd5BEGGAlJpCP1/prcwh5NR2OL/yc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=PUWzqFtrJXlv1pNStvgp2JxBDqOHMGKrNsN93MVN5jTtanTaTIHUkeIMaVvQZK740
	 3RpXp1XTGg/PD8GviWhB1WDu34FzN+rBl9wGsDCiOQi9Tz5hpi4bi354PJtwzfgHDm
	 8cxcrPdQpwN7EsJHxtTXpONLXfzEIUg989I6+Y8CltAhYU4IcPAhqdvW28HSKBrbzY
	 M+wnpB47ii9J1W5N+52w04HQ+FjHETS3gYFQdFW1gIJuD2HPDn2qmFKvZA3hrQipAW
	 TDHdsCWaRG/x1U8zHGANXnD4RqcaLjzhA1G1HvI3r+GYmimX2WZ7dLyJv2D16obXj+
	 qZx3XnLtyLQCA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MxRTfwqne
  Swb2TFhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8burZ9YC9ZyVnw784itgXE7RxcjF4eQwCwm
  iedfH7NCOLsZJVqfNQM5nBxsAmoS02/dALNFBPQlls7ewwxiMwuoSLz43cMOYgsL2El82HoEL
  M4CFL/S+R+snlfASeLt7l1sILaEgILElIfvgWo4ODgFnCVOL6sDCQsBlTz9OpURolxQ4uTMJy
  wQ4yUkDr54wQzRqigx+3IzC4RdITFrVhvTBEb+WUhaZiFpWcDItIrRMqkoMz2jJDcxM0fX0MB
  A19DQVNdQ19RSL7FKN1EvtVS3PLW4RNdQL7G8WC+1uFivuDI3OSdFLy+1ZBMjMCBTihmtdzB2
  9P3UO8QoycGkJMp7xtU7SYgvKT+lMiOxOCO+qDQntfgQowwHh5IE78mzQDnBotT01Iq0zBxgd
  MCkJTh4lER4j1wESvMWFyTmFmemQ6ROMSpKifM+uAyUEABJZJTmwbXBIvISo6yUMC8jAwODEE
  9BalFuZgmq/CtGcQ5GJWHecyBTeDLzSuCmvwJazAS0+N0ZT5DFJYkIKakGprVtHX2/J/KcUFm
  6eS2f5A/vrd3rFjSvO7ktPZN/YbfvDoPw8v0Sq5IXeqkJXz8stu7Z9vMpOv0vN/a1Sy9KYX4r
  mHmyvuafCoOWkajG0scRNb02Okr765Z1lbaJuSTM3ZkdkyJ5+mr3v91F2xX0fn92594hLVJvw
  Xuu56P33Ue5YVK8Kin+vQcWPpOqKNz0vtzOO6/iylZO6TeMa3bMeG/86svRXv3mv8e3flg46+
  +T08ufGc+cdWgm4352pT6e72UPPX2dX5/j+XCPITY74NEVnbQ9kyczCUfPvuxQePPidxlZu/O
  SrB4BupFrZMtLtDdku6d9CjF+lJSyctUEK41HH1c+eCvhoXn22uQIOSWW4oxEQy3mouJEAOvi
  +KlDAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-587.messagelabs.com!1649136977!492886!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7769 invoked from network); 5 Apr 2022 05:36:17 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-11.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Apr 2022 05:36:17 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 2355aChC011600
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 5 Apr 2022 06:36:17 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 5 Apr 2022 06:36:13 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gedit: upgrade 41.0 -> 42.0
Date: Sat, 2 Apr 2022 20:32:44 +0800
Message-ID: <1648902767-19756-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648902767-19756-1-git-send-email-wangmy@fujitsu.com>
References: <1648902767-19756-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96398

Changelog:
=========
* Rename display name back to gedit
* Build fix
* Translation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gnome/gedit/{gedit_41.0.bb => gedit_42.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gedit/{gedit_41.0.bb => gedit_42.0.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gedit/gedit_41.0.bb b/meta-gnome/recipes-gnome/gedit/gedit_42.0.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gedit/gedit_41.0.bb
rename to meta-gnome/recipes-gnome/gedit/gedit_42.0.bb
index adba8ab2f9..5bb5525d53 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_41.0.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_42.0.bb
@@ -21,7 +21,7 @@ inherit gnomebase gsettings itstool gnome-help gobject-introspection gtk-doc val
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
-SRC_URI[archive.sha256sum] = "7a9b18b158808d1892989165f3706c4f1a282979079ab7458a79d3c24ad4deb5"
+SRC_URI[archive.sha256sum] = "a87991f42961eb4f6abcdbaabb784760c23aeaeefae6363d3e21a61e9c458437"
 
 # gobject-introspection is mandatory and cannot be configured
 # x11 is needed for tepl and gtksourceview4
-- 
2.25.1


