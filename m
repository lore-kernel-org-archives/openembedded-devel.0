Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5BD3E6084B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:14:55 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id x12so7625607wgg.18
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=p1Jf9botcp79IlY5+l4BpCttORc7hXRWgwA0+Vw3Ldc=;
	b=ZyNbjg6raNV1NPI8VANtUk977GnGQZTTgH3uOQ7io0RvGbmAqvPIKn+QwI78Qgjasl
	McdTPJf6Q/E2QIg4eixUC09wohEUG7mKHvmaxFjpUk+5nvpXGCB/IsrMiYbm/YGvCvZm
	yzeswudyEde/EurpnadqGqQofb3bkwrKlOCiEISNyGup14IfOpUVkQSwQ2Cs0xMYnRkU
	8kYifXOmfClo+KU7YzJIGjS0U26mUO4v+wjdYBvirBjrbOKbQOSPTwHlPEJLxIXha/2E
	WvyQrQZj4DgyGYJMkY8qbjK63D8aFsLyk52LuJuxEAC8fsrfuygVeHlhje4Jfe/zbiIg
	UOXA==
X-Received: by 10.180.206.16 with SMTP id lk16mr203810wic.3.1396372496395;
	Tue, 01 Apr 2014 10:14:56 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m42sm41857230eex.21.2014.04.01.10.14.55 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:14:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:36 +0200
Message-Id: <1396372434-10710-28-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 28/46] gcr: inherit only gnomebase, gtk-icon-cache
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
X-List-Received-Date: Tue, 01 Apr 2014 17:14:56 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb b/meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb
index 71911af..c71f5a4 100644
--- a/meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb
+++ b/meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
 DEPENDS = "gtk+3 p11-kit glib-2.0"
 
-inherit autotools gnome gtk-doc
+inherit autotools gnomebase gtk-icon-cache gtk-doc
 
 GNOME_COMPRESS_TYPE="xz"
 
-- 
1.9.1


