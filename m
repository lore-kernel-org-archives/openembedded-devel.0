Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 016636BDA0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:07 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id b45so339440eek.29
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=fYK2p80JBPsErUeW+fPvnxw9kLTCGGrBuR1hqiExeLU=;
	b=geNJk88LMCb7iiDcEKsauYmUfDys/RgQvuNItH9KsKdaTbJhDyeBlwnhkN7yvnqIEf
	mJB2fy5P/DOk34YmNekDyAfLdL++YMoIKg9Q2urvxkQoxwdmpJH3TmGqwHCgZkpV4F6G
	0/U0N0O01myB+Q3q59Z2D/CAfPfy1oDPSiUOzw3ovYsqAJ/TCQtA6pR/31P8kPRwXi5g
	p1159t83HvrnLp9PnLg98EDUCF38nCWg9tG6HaJ6TGGjl0YM3+mOAEwJXD1pLgpNxgxE
	6x5GplQB8DsVmmxHVywchrHoewZW0CAr1b3KbBi+LKqebTinIXGOaA9nwxkVaH53vrYq
	oiIA==
X-Received: by 10.14.182.9 with SMTP id n9mr4591069eem.66.1377791468459;
	Thu, 29 Aug 2013 08:51:08 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	z12sm47155013eev.6.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:08 +0200
Message-Id: <769c35262c3d64f9090f01bf62e2ab6ca71e08c2.1377791377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 15/66] metacity: Add dependency on libgtop
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
X-List-Received-Date: Thu, 29 Aug 2013 15:51:08 -0000

* gtop is autodetected from sysroot and configure doesn't allow to explicitly disable it

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb b/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
index e14394a..dbd31b8 100644
--- a/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
+++ b/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://src/include/main.h;endline=24;md5=c2242df552c880280315989bab626b90"
 
-DEPENDS = "gsettings-desktop-schemas startup-notification gtk+ gconf gdk-pixbuf-native libcanberra gnome-doc-utils"
+DEPENDS = "gsettings-desktop-schemas startup-notification gtk+ gconf gdk-pixbuf-native libcanberra gnome-doc-utils libgtop"
 PR = "r1"
 
 inherit gnome update-alternatives
-- 
1.8.3.2


