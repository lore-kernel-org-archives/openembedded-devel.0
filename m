Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7384D6FA88
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:15:08 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id x13so7939341wgg.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RsGqK4LM4rcZF4ysOEQM+oMkvRjnxiLqFp9cH5Q0XJI=;
	b=M8VsMCb/IRfpT8+WDMyoZpkEHibCQUQ5bSIOPoGt21Ccx5UZpz8q5ZfsGxiMWUUhZT
	I0vOehackIrRbDkBNexEzeh7PTWejiPcCEXMfdufVI5WQ1hNry67RzJM5URIr9kJSYZ6
	nE+v+AiyN1DRdpwZK/r79zpND+RKVbaWR5V1Q8mJ2ki5q+vMcRMCwWsjXk1va6vd0uiT
	1fyFIyO4m0nOU7CUnrPcGBETnUI0JSk/Sws+ZUUimTduGZJa2TSfXAwOXRcVyryXO3fQ
	1heL3FuBcUi8asalFnE2OFXUBLlAYdhYDtKE2mT5m3YPqodxzH4E+XwNFu0hhKm05iN1
	pimA==
X-Received: by 10.180.87.233 with SMTP id bb9mr19682307wib.10.1396372509059;
	Tue, 01 Apr 2014 10:15:09 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u46sm41881527eel.1.2014.04.01.10.15.02 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:15:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:40 +0200
Message-Id: <1396372434-10710-32-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 32/46] goffice: inherit only gnomebase
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
X-List-Received-Date: Tue, 01 Apr 2014 17:15:09 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-support/goffice/goffice_0.10.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb b/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb
index 098e275..24c4d0f 100644
--- a/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb
+++ b/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6dc33ff21e1ba1ac1a2a1069d361e29e"
 
 DEPENDS = "libxml-parser-perl-native glib-2.0 gtk+3 pango cairo libgsf libpcre libxml2 libart-lgpl librsvg"
 
-inherit gnome pkgconfig perlnative
+inherit gnomebase pkgconfig perlnative
 
 GNOME_COMPRESS_TYPE = "xz"
 
-- 
1.9.1


