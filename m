Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 36DD2770B5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Oct 2015 15:29:44 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so39005807wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Oct 2015 08:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MjGBWLaUwbn67yrLpiHCwK6lU3QHcNTOCQrbADIMt4c=;
	b=obYg21ynTWvyzihrTkXWfFmQ6H1tz0X9B4BKG+eUqh1wa76RyB0nU4mvXufvTAds+0
	wGNkZ0nkN45ZXIkrUDklSOi5V4s4mnVyDDQf5TwnH9kVmz+b6CSvA6EN0AWC1Q15OILK
	jfc+ZLSHW6IIPfMRuaaieA3yKVNbZ2SkoR4x/3qcQTDUlNsNoqtbB5a77cX2QU6abkQr
	L2i/9+hC+rzFu29GDW6+EWSCGSzptP4WGJX/77HkGGlw93ovX0dbY8VOtFyLoL3jjiy2
	oKbxIP7fbeNjMmLxTTyMr4c9gBbDYsh4qPRhrgUBjvslFy33a3LIBJt4AsyL6wPpXJX7
	+dPw==
X-Received: by 10.180.35.199 with SMTP id k7mr4350931wij.13.1443713384795;
	Thu, 01 Oct 2015 08:29:44 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id jc9sm3737746wic.6.2015.10.01.08.29.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Oct 2015 08:29:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Oct 2015 17:30:27 +0200
Message-Id: <1443713428-8635-9-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1443713428-8635-1-git-send-email-Martin.Jansa@gmail.com>
References: <20150918115458.GA11095@jama>
	<1443713428-8635-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 09/10] gdal: blacklist, fails to build with gcc-5
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
X-List-Received-Date: Thu, 01 Oct 2015 15:29:48 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb b/meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb
index b181b3e..012806a 100644
--- a/meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb
+++ b/meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb
@@ -107,3 +107,8 @@ do_configure_prepend () {
 }
 
 FILES_${PN} += "${libdir}/gdalplugins"
+
+# | gdalserver.c:124:21: error: storage size of 'sHints' isn't known
+# |      struct addrinfo sHints;
+# |                      ^
+PNBLACKLIST[gdal] ?= "BROKEN: fails to build with gcc-5"
-- 
2.6.0


