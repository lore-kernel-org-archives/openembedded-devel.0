Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0898EC47095
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:13 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.26436.1650871805517867383
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 00:30:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=LrrRhHG4;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650871803; i=@fujitsu.com;
	bh=ucZhee6p4uPeTZslRq8g5kStm6sv61V8h9W0PZt5f44=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=LrrRhHG4M5zG5HCY5CHRqmBsES1i0C1rGuQHMWHqq6QCfAEEGHYsKdzCX9m8AkyJ3
	 6GFZKkhAzjl6EISxMgbFVim8++5RtFJvQgS1aDrHldB5zfIzsKlkNm6M+ntkqFTPor
	 h1/zhLhAznKB8sbVY9ECbRXCR6S8FxYYccN5JWsI1Nzclw/QG/0siXQrejxEuugkox
	 eRZfQuUelT7dnxFbrlcBX36doLaPEl5+iKzpxI86ETeuwkeR59fwrijsB2jRSHBSp4
	 dsiOUn3sSqzeWhs4+Q8dqI9l+1Ib69Lc8XF32iB9/MEWgz2e/9k/RCp/Q5ixGF0nT+
	 s7wqHwCLJRglg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsViZ8MxSfe3b1q
  SwYk1IhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0b/e72CFsGK+ydXsTQwNvJ3MXJxCAk8YZTY
  86SLHcK5wCSx+3IHG4Szh1GiY+JRIIeTg01ATWL6rRusILaIgL7E0tl7mEFsZgEViRe/e9hBb
  GEBT4nJDXOYuhg5OFgEVCVmXc4HCfMKOEl8b1wLVi4hoCAx5eF7MJtTwFliQuMVFhBbCKjmx6
  wfbBD1ghInZz5hgRgvIXHwxQuoXkWJ2ZebWSDsColZs9qYIGw1iavnNjFPYBSchaR9FpL2BYx
  Mqxitkooy0zNKchMzc3QNDQx0DQ1NdU11jYxM9RKrdBP1Ukt1y1OLS3QN9RLLi/VSi4v1iitz
  k3NS9PJSSzYxAkM4pZj14Q7GxX0/9Q4xSnIwKYny3jNJSxLiS8pPqcxILM6ILyrNSS0+xCjDw
  aEkwcvlBZQTLEpNT61Iy8wBxhNMWoKDR0mEN90bKM1bXJCYW5yZDpE6xajL8ffT373MQix5+X
  mpUuK8hT5ARQIgRRmleXAjYLF9iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5IwbzrIFJ7MvBK
  4Ta+AjmACOuJTbSrIESWJCCmpBqaZktqiBQdbWef5r33y18vZ+XeXtrTO6roVXgt170kauEbt
  SuxwENosuz7jcu/7iT5+SaJf7uuZ/Z7CfDxQ3J4/70SIjnddUsbWkKd32S94LTX5eqzn7t+nD
  ++0mhXL1k+Y/zfE9n/3y+TYJnehnVfPrV6QdXDrma8z1saEbLxRIXkrMm7na/6/rsdXdZyvWv
  RSaF9y2q2NNREbLWQnGhqf/OCkoDmlwMStZs7Bw48cOS6Yvjq46NuHnklb1ndHx+512CXg/Vz
  owkaBNavOHJm24f+i7g+8VaY+HaLqU+Ye23xzmYLvxn6uyNKG9Nlt5btLP10OvHuq682VqwxH
  a56zF5fo3BG9u1D//wrB/KWXlViKMxINtZiLihMBWZYt+2gDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-591.messagelabs.com!1650871803!129462!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4347 invoked from network); 25 Apr 2022 07:30:03 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-17.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Apr 2022 07:30:03 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id C1A0F10046F
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:30:02 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 8F4E810045A
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:30:02 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 25 Apr 2022 08:29:56 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gtksourceview5: upgrade 5.4.0 -> 5.4.1
Date: Mon, 25 Apr 2022 15:29:36 +0800
Message-ID: <1650871776-31335-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650871776-31335-1-git-send-email-wangmy@fujitsu.com>
References: <1650871776-31335-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96763

News in 5.4.1, 2022-04-21
-------------------------

 * Improved styling for style scheme preview widgets
 * Improved styling and positioning of completion windows
 * Improved styling for various style schemes
 * Unit test fixes
 * Hover assistants will no longer be showed if no providers
   completed successfully to add widgets
 * GtkSourceVimIMContext tries to handle various corner cases
   better with regards to reuse and being removed from an
   event controller or widget
 * GtkSourceCompletionCell has improved fast-paths for resetting
   cells to empty state when already empty
 * Improved sizing and placement of assistants including hover
   popovers, interactive tooltips, and completion windows
 * The overview map has improved it's fallback styling
 * The overview map will now properly update when the sourceview's
   right-margin-position changes
 * Fixes to vala.lang for regex detection
 * Translation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gtksourceview5_5.4.0.bb => gtksourceview5_5.4.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview5_5.4.0.bb => gtksourceview5_5.4.1.bb} (90%)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.0.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.1.bb
similarity index 90%
rename from meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.0.bb
rename to meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.1.bb
index 51ff4c898a..3be392da81 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.0.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.1.bb
@@ -25,7 +25,7 @@ inherit gnomebase lib_package gettext features_check gtk-doc gtk-icon-cache gobj
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "https://download.gnome.org/sources/gtksourceview/5.4/${PNAME}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "003bc217e670a8ec8aa3aece994b70e70b7d6b8074938adda21718555d84e637"
+SRC_URI[sha256sum] = "eb3584099cfa0adc9a0b1ede08def6320bd099e79e74a2d0aefb4057cd93d68e"
 
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'
-- 
2.25.1


