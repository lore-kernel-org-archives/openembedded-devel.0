Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7CAAC70185
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 09:59:59 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id q58so2109394wes.30
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 03:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UNkkUJ4fj01wkNIPJlB4Tg6sIiBv+FeTJzbdnm4N/Dk=;
	b=qD8Ju2AcY7/HSRD3JCqAlApdn0W89g3PV49pViC1ocAR7IXKMb0w3gPjXBGtKnX2Cq
	TwvuH+DjgZ0a+3Kljo0EDjMngZcAJecbbnGqCqFm9EsKWa8CFWHKuIZ1uwz3RIi/1Y/y
	0GFtZrZpD2ZlKxj+jED4x2mjXLRwk9hmJaAp4WgQxd05A//86yBCdRH4FA3zY8Q69uiK
	n8ieuU/FFh7hJHGoUxlJkacVihq2Gk1yNGFKnnNUyzFRI9EG+iG03xscSHwDTtmaFKLF
	sxJP0v3aV3t4E0T0gDiMVBagrSHYRoDsCrEVQIFK0iFL8LrOmVTXKfYnKF2lY3n6o5oA
	W21g==
X-Received: by 10.180.14.166 with SMTP id q6mr5161733wic.40.1403172000744;
	Thu, 19 Jun 2014 03:00:00 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	nb8sm31874612wic.18.2014.06.19.03.00.00 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 03:00:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jun 2014 11:59:34 +0200
Message-Id: <1403171993-26208-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 06/25] tumbler: Blacklist because freetype2-config was removed
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
X-List-Received-Date: Thu, 19 Jun 2014 10:00:01 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-xfce/recipes-xfce/tumbler/tumbler_0.1.29.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.29.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.29.bb
index 3860716..ed986c2 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.29.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.29.bb
@@ -6,6 +6,8 @@ DEPENDS = "dbus-glib freetype gdk-pixbuf poppler curl xfce4-dev-tools-native"
 
 inherit xfce
 
+PNBLACKLIST[tumbler] = "BROKEN: needs to be updated to use freetype2 pkg-config instead of freetype2-config"
+
 SRC_URI[md5sum] = "f844215c5e3918eae58abdd85f146780"
 SRC_URI[sha256sum] = "c3bac4ee609e22be6c7f01a4fdf6086bc6b57940d82f99570a2d9d547a32fc93"
 
-- 
2.0.0


