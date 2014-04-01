Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id C96BF6FAEE
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:15:35 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id bs8so5585626wib.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YiG3ifOKzAjLmSkv+B7kkA9e9q9Vw7YFC572l2r5d4Y=;
	b=TVEQlwCTz07EEbkUAXImuT5gym1C3GNXHgJ3HDUP2TGl/Cv4/jHlH+VqWL8KjKIkJ5
	a8Gy5KvwFo3K1WMp02JA3zUzsDR5NDycIYaBNO/Efjqkjz6v+XYIpVDCtqCa3gOwMWAX
	Yffekd+S6m5QJNhNtapSpazM0HdBiAKvyI9cmEmKyekJXiDV1XivCXUbq8FlDh4kIwxN
	wf4sTWQAn6Y3xiWqex3NrkuH+nR56cWt37ZkeNhZndEZJODXMChg5lEjFnrIYpBBFoex
	Yte/+5MfqFpVPxUvMEc5T5bLzFFO6tmTx7rqxtUWGft0ligwKSNk1U/RkuqU665n/zkA
	9yZA==
X-Received: by 10.194.1.242 with SMTP id 18mr24453476wjp.22.1396372536412;
	Tue, 01 Apr 2014 10:15:36 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x45sm41870495eef.15.2014.04.01.10.15.35 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:15:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:51 +0200
Message-Id: <1396372434-10710-43-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 43/46] libgnomeprint: inherit only gnomebase
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
X-List-Received-Date: Tue, 01 Apr 2014 17:15:36 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb b/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb
index 13550d7..c224d86 100644
--- a/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb
+++ b/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb
@@ -5,7 +5,7 @@ DEPENDS = "libxml2 libgnomecups glib-2.0 pango libart-lgpl fontconfig popt gnome
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-inherit pkgconfig gnome
+inherit pkgconfig gnomebase
 
 SRC_URI += "file://fix.includes.patch \
             file://freetype.patch \
-- 
1.9.1


