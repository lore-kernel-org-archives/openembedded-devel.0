Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id DF7D17017E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 10:00:14 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id w62so2126771wes.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 03:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PEGgQdYLQlXYFKY+8sL+BVz25/G+cJA2MsAnC1gLnhA=;
	b=Hzpu33jBBjAgXDLfKYiIVbvCHnJZuAW7xUOeBdnh7p/MREkQs6kS7z2P2YgHAcLWvw
	VB6DedsXkCxbSnxx92NP9Rkz8jxYXiuVK8DPPRO/YszRH9kYEWbjcjq16oRwIBRgWkFM
	WsgRfw5qPn6gFCkU7MJ13Sdbwe+sQNpQa3MLmeO9Qr5g5dXnjipFU8sqZOJDWJRRXfZ/
	OnK4C1uDdzVWIreouBy9psziKGUOLu9CT3D8sNfEix1G21fEMxzV9SR9SduXUN4/wfiD
	gQMnNxT6f2/z9nE9PnkWDRyNJdlHz8aT4EyivQRTVjDjqVq+HSevFDVCrJbBzhzkHjI9
	XQ9Q==
X-Received: by 10.180.186.8 with SMTP id fg8mr4970033wic.39.1403172014849;
	Thu, 19 Jun 2014 03:00:14 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bq7sm31895532wib.7.2014.06.19.03.00.14 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 03:00:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jun 2014 11:59:45 +0200
Message-Id: <1403171993-26208-17-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 17/25] nautilus: Blacklist because of broken with B!=S
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
X-List-Received-Date: Thu, 19 Jun 2014 10:00:18 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
index 0714815..f7c7c1e 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7c0048536e43642a1f3a724c2909872b \
 
 PR = "r6"
 
+PNBLACKLIST[nautilus] = "BROKEN: doesn't build with B!=S"
+
 DEPENDS = "gdk-pixbuf gtk+ libunique gvfs librsvg libexif esound gnome-desktop orbit2-native"
 # optional: tracker
 
-- 
2.0.0


