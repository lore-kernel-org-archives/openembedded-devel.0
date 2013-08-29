Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id A6A136BD61
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:50:53 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id m14so340411eaj.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=xE/VJw9vMOq5HeiQ9u5/GT3DljpcFfffSnSI1JeYVus=;
	b=t4hvgPPZGqPQ+ZJiGT+a9k2mKN9G7HabHPSWqeDBgp6D1KEZAQnUlAeSoGyldNXUwP
	S11+NxnNT2IDe/bHbMLYJZ52azxIE7VYc4V5o0aCW5HlX/JX8JX0Xp8/KEpxNQB1FDCW
	uHhaW3Wvwbo1EkJ8ys2uZgbQp0kPgJPiAtK/NELmD76JGYpTcq4v/krEDQCCb6sxxABm
	SlyNV2Ux0/396Tz6d3wEFkCb1eW1JfvYv3e5kmKseX9cv7pn9VmfEv4yuLTIrft4jtpq
	dxHgsuzVh6Xk7RrbHUt+djash6/WUN1dxENeERAd5IjR6MDCNSLKZHDj7CiC8EiHpbV8
	fNVA==
X-Received: by 10.15.54.72 with SMTP id s48mr5369506eew.58.1377791454034;
	Thu, 29 Aug 2013 08:50:54 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	d8sm47155181eeh.8.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:50:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:50:57 +0200
Message-Id: <2a433d0cab22fb092d92309e14b1c4e9517d934a.1377791377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 04/66] gnome-control-center: Add libxscrnsaver dependency
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Aug 2013 15:50:54 -0000

* configure doesn't allow to explicitly disable it

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
index 85b3386..e85314b 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "GNOME control center"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-DEPENDS = "desktop-file-utils-native gnome-menus libunique dbus-glib gnome-desktop libxml2 metacity gconf gnome-settings-daemon librsvg pango libgnomekbd libxklavier libcanberra libgtop"
+DEPENDS = "desktop-file-utils-native gnome-menus libunique dbus-glib gnome-desktop libxml2 metacity gconf gnome-settings-daemon librsvg pango libgnomekbd libxklavier libcanberra libgtop libxscrnsaver"
 
 PR = "r1"
 
-- 
1.8.3.2


