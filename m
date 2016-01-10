Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 16ED2731F2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2016 01:09:36 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id yy13so23105417pab.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jan 2016 17:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=sGnW4cy6qh/AzPkOw7zEI0veurgVufDtWNJEFtETkQU=;
	b=kD0hoIG0M/e4I46gP2n58uJKnAEn9BTnm6QPlxm6H+8OCxuUg9QlyROO+1prElEoUD
	4h5nrYtkTCuL9BohV5XoRRW2xyYO55iNurYNUdTY8OkV4xceS2lvbz9YJPXDbG9V+7A2
	pjvm57VJ3xXN6EutaadeVB5DWO8oZst4uA+ND5qGtp3CRp1VaSh0lcopYYzjqSAvaHAS
	Ll8WM3E44QU+XkdFra7t9ZG7wvceKxrqEv6iD25obVDq2iti+x4XY5k+WlGJ+zYyjzCb
	v3I3yu3sNTTtburT2H97RbsUY1lm97BvK/OnnO+qrAQPf7GmKRAsfOpKdrP0h4xjJknt
	Du+w==
X-Received: by 10.66.102.73 with SMTP id fm9mr117290061pab.32.1452388177508;
	Sat, 09 Jan 2016 17:09:37 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	xi8sm176256895pab.9.2016.01.09.17.09.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jan 2016 17:09:36 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 70A7AFCC84D; Sat,  9 Jan 2016 16:59:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Jan 2016 16:59:43 -0800
Message-Id: <eb6ae296f1771c4d6c184d0f8ce0c4b0948f53da.1452386603.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
Subject: [PATCH 20/22] gnome-desktop: Fix QA issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 10 Jan 2016 01:09:37 -0000

WARNING: QA Issue: /usr/bin/gnome-about_gnome-desktop contained in package gnome-desktop requires /usr/bin/python, but no providers found in its RDEPENDS [file-rdeps]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
index 6256396..1dff745 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
@@ -27,4 +27,4 @@ FILES_${PN} += "${datadir}/gnome-about"
 
 # for gnome-about
 RRECOMMENDS_${PN} += "python-pygtk python-pycairo"
-
+RDEPENDS_${PN} += "python"
-- 
1.9.1


