Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 09A5C6FA1C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:15:41 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id x48so6473940wes.21
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=k5IfmM89y28t1e7C8sJegvgKDaLCons5JNnydDHSGVc=;
	b=aw3NsBsmuS4NGTwNY9atqN5hmgnLy0WUFA1U9gP1NEG9Mcc4sf12f3wgCXqQJFXKwg
	PJJO1wZHPViTDT/q4EDxYuXISh4469d/pqq7etmMJ+Xg1/Bpdk1v4m1Yusjslo5w5wdl
	VS7EKJIKwvHQ47q4tthpMA5v9/zEiFILcRoIXjMC+Of/7Qpumwb8F3JCEniy7TdSEHjM
	KcpINjCZHGHCG5Vzspi7wdLblKU5DgxoC4ffAzBa2lqVtpeB8HhxwS8KjjZnP1XahA/h
	ajRep9PgNAQJX/wklADuaN/ixT+GbYuHwT/xNegF12woTD0JbKIRpkQZmH7uc+b10eTv
	qrPA==
X-Received: by 10.194.203.170 with SMTP id kr10mr24335950wjc.19.1396372542365; 
	Tue, 01 Apr 2014 10:15:42 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	e42sm41844639eev.32.2014.04.01.10.15.41 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:15:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:54 +0200
Message-Id: <1396372434-10710-46-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 46/46] gnome-backgrounds: add glib-2.0 dependency
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
X-List-Received-Date: Tue, 01 Apr 2014 17:15:42 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb
index cf09eea..5049cce 100644
--- a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb
@@ -5,6 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SECTION = "x11/gnome"
 
+# glib-2.0 for glib-gettext.m4 which provides AM_GLIB_GNU_GETTEXT
+DEPENDS = "glib-2.0"
+
 inherit gnomebase
 
 SRC_URI[archive.md5sum] = "3df26626483b02e51adefc6ab5945a8d"
-- 
1.9.1


