Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A62C7619A
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 00:38:23 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.90091.1679618300305508005
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Mar 2023 17:38:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xJ6E0XN7;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679618298; i=@fujitsu.com;
	bh=NmJCzQMTSdf/g8+4jIU9qcjDMyOwmsi0jCQKGoriPWs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=xJ6E0XN7ceDmNjoVgryBsNRpyU12cXosBoSOPaoN6DABGmRqKSRnLETOwDwK0karP
	 La6iYaefYb9+Q8ZNGlW6RGrC/PebI6X8LK63WPhtfWgq26uBqCWwkQ2cBG06Kr0N4f
	 hVerAQwMgxDv1SZqxYm3fGo32vK4ijGsxG5vlBHAxKh6mztuWdq2I3MtQXGomCaqmA
	 GQD+9KfJufg/JKkx/bVrephd4fEkLr/cRMu6+dwHc2DgBh2615TLHX7bdbf0iKC/Xx
	 K2IsJo971hwYwjcE4KJ9MLI/YBPRj/1aIUDho5VKjLcixjMYQeThL/fdwP2rKxiZ87
	 ZTgkheDf8VD1A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8MxSffnB5k
  Ug4efVS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ow/9xewF9zhqli6/SF7A+NNzi5GLg4hgSeM
  Ek0rFjNDONeZJK59/MQC4exhlFg9fR5TFyMnB5uAlMSN+//ZQGwRAX2JpbP3MIPYzAIqEi9+9
  7CD2MICjhJLrv4Cq2cRUJVYuew9I4jNK+AksXLuLbAaCQEFiSkP34P1cgo4S9x8+BEozgG0zE
  lixStJiHJBiZMzn7BAjJeQOPjiBTNEq6LE7MvNLBB2hUTj9ENMELaaxNVzm5gnMArOQtI+C0n
  7AkamVYxmxalFZalFuoYGeklFmekZJbmJmTl6iVW6iXqppbrlqcUlukZ6ieXFeqnFxXrFlbnJ
  OSl6eaklmxiBwZtSrMi6g/FS31+9Q4ySHExKorwSodIpQnxJ+SmVGYnFGfFFpTmpxYcYZTg4l
  CR4P7+RSRESLEpNT61Iy8wBRhJMWoKDR0mE99BZoDRvcUFibnFmOkTqFKOilDivKzD+hARAEh
  mleXBtsOi9xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY1+8d0BSezLwSuOmvgBYzAS12rgF
  bXJKIkJJqYJor5Z936Xz4tc79X+ZsPNusden9wx0r8taetuM5d5cpIdlsWuhta7XyH/ts+/aX
  rVnyuvdO1USHvi4PazGVPdXPTpyePFmq7t70LxP/7tx7z/f1Xs/aJw7mn0xqJm6Z3xsae4bh0
  EQv6cPxfEIFwac5y4NXBLnW3HvxfcWuxXNkD1UeWHVv8ayzolrdSZIXJsRNenLlYr+DI/fk9/
  aT7zC3Kn3JjtzC97ng+adjlpE7tOZOWP/j1Pl1L6aJ3VVY//JEika2RIfdaZNVM+/Z7b74Uku
  6luF4Yc6W91Wxv+b9eROkkv7/4W8zQ8YN3mf6zno9MDwio37oJb9rmYmrXmV3ot2Z4GXX/vcH
  nuRSbc2sU2Ipzkg01GIuKk4EALfgsDJZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-571.messagelabs.com!1679618297!847764!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20827 invoked from network); 24 Mar 2023 00:38:17 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-23.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Mar 2023 00:38:17 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 500971000FE
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:38:17 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 403DA1000EE
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:38:17 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 24 Mar 2023 00:38:15 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gvfs: upgrade 1.50.3 -> 1.50.4
Date: Fri, 24 Mar 2023 08:38:00 +0800
Message-ID: <1679618280-27430-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679618280-27430-1-git-send-email-wangmy@fujitsu.com>
References: <1679618280-27430-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:38:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101699

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* dav: Prevent usage of NULL for nonexistent source file
* client: Fix copy/move operation from/to Flatpak sandbox
* http: Report original sizes regardless of compression usage
* Fix string comparison on various places
* Translation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/gvfs/{gvfs_1.50.3.bb => gvfs_1.50.4.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.50.3.bb => gvfs_1.50.4.bb} (97%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.3.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.4.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.50.3.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.50.4.bb
index 073c05af2..22dcf0538 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.3.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.4.bb
@@ -20,7 +20,7 @@ RDEPENDS:${PN} += "gsettings-desktop-schemas"
 
 SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
 
-SRC_URI[archive.sha256sum] = "6897119e97bb16029d2778e1a5a54a6a6592631f8b2f3a2a1dea4ef2b01803fd"
+SRC_URI[archive.sha256sum] = "ab9059a676a537edbea21388c2aafe1a7e2c8f1ac2dfdc6d64550233075457fd"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.34.1


