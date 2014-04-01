Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id E58F16F92A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:14:44 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id cc10so5611251wib.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BLFLZoJyYDwWY0f27SOgRwkNUP/qqudwLWMrx7IDMBg=;
	b=OVzf5AdVIkl6whPmc1hePnH2bLi+9/yvsqdEmguwM8Et0g1XNuDjhK2zKXf+K+QeRq
	o0qjmGxiiuKA5sT2je05HrIYzzUJxMT6g9mmfH8ex0ZlYbWMX9S1ZesmrK2J7xDnF1JR
	RYwxD/z90aVlA0sb1CbS9qPx6bupV3RTtN3/ELux9bcZX3rf+nEcMOqrQOYBzbBKfw1v
	goB8YLzfGwVR0l0rKvhJv+/0yvJGODL1ksJUO0jsJdSpn0qUZLXG3RUdkxVcBpPhETRu
	9r0UO8vbvIUtUregSQD0lBVu7zUARrJEEfIU5qK/32tn14w41juOuMIjfqqLf7FCbPHm
	nldg==
X-Received: by 10.194.242.4 with SMTP id wm4mr5351673wjc.88.1396372485649;
	Tue, 01 Apr 2014 10:14:45 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	48sm41877642eee.2.2014.04.01.10.14.44 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:14:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:31 +0200
Message-Id: <1396372434-10710-23-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 23/46] libgdata: inherit only gnomebase
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
X-List-Received-Date: Tue, 01 Apr 2014 17:14:45 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb b/meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb
index 6cea7ae..8f6675d 100644
--- a/meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb
+++ b/meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24 \
 
 DEPENDS = "libxml2 glib-2.0 libsoup-2.4"
 
-inherit gnome pkgconfig autotools gettext
+inherit gnomebase pkgconfig autotools gettext
 
 SRC_URI[archive.md5sum] = "ec5262cbcb07b63b58d45aa3ac636096"
 SRC_URI[archive.sha256sum] = "fb244138276a5ce98510b0e2408bbf6f9ce0fd8cdcf86f07cd4be38afbb7c2bc"
-- 
1.9.1


