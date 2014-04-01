Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id CAEEE6FA2D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:14:34 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id u56so6675553wes.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DletEmG0Mty+FW29LKlUZzHKGaS4IhtNTH70tRPBXYg=;
	b=Ldz38cUjBv43+h9KPGZAHy9vhTWYzm3eyo1K5hjOkCUIZjf8U67RfOI8pueUTnlf7i
	QG6XF82rdXqYAn+yoxgWADx1axvxmWuXLaEVZf2ghSniq4uZ1TbDdIxDWJ/mugS5NtMA
	vxZ+EyTD7fwiVZwXySGlXUigAxqREdr1aIJs8oXvIdP8wOGsL1H9JEc2z1F+W6rjDLXd
	jJiWfmKab0/ny+8Ef2U/31AcbEqX/wFPa2Dyx0jX9RP0Tqe7DEVyfSPHu7mh12H5ztwJ
	yURpca7emPrCrJQiraDtdAZRprtlxK1h1Lkc6/fHRnUO9jdpBaqtXN1Yzy1nNyxaU2b2
	rEWA==
X-Received: by 10.194.21.193 with SMTP id x1mr24121405wje.33.1396372475263;
	Tue, 01 Apr 2014 10:14:35 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	a42sm41867185ees.10.2014.04.01.10.14.34 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:14:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:26 +0200
Message-Id: <1396372434-10710-18-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 18/46] gnome-menus: inherit only gnomebase
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
X-List-Received-Date: Tue, 01 Apr 2014 17:14:35 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb
index 5d223d7..d9328b8 100644
--- a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb
+++ b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb
@@ -7,7 +7,7 @@ PR = "r1"
 
 DEPENDS = "python libxml2 gconf popt gtk+"
 
-inherit gnome pkgconfig python-dir pythonnative
+inherit gnomebase pkgconfig python-dir pythonnative
 
 SRC_URI[archive.md5sum] = "caa6772e63ed5870cf43dc3d354e0624"
 SRC_URI[archive.sha256sum] = "6dcc565006d6e8c2025ae83ab1f82edf6bd04d61c804c0dc9bf5ea50629c4caa"
-- 
1.9.1


