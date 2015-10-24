Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1CDF975F3A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2015 17:57:45 +0000 (UTC)
Received: by pabrc13 with SMTP id rc13so146184824pab.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2015 10:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=z2cBd2ALIqyWOYCNRP/9efke8ITp6U1cnmah/V1VtsA=;
	b=fWWjmR6DN9Cszs7PtCGz9fEwiAvTAAihXpIQr1j1S0x22Yq9qCdytrbPG+4I+toQR8
	SJSa9fVZ51LHAQx6Vwy2AoRbpCnvDwlRzyQ+6dwmgWpXSyeRxHg5nZlp1gni/C6r7JOf
	9+pZqVp4pzY0t0HLoTH6i95fvHevhAN6NbDFunc4HSpwKDm4zlUuiMecKiZI0SXllWN4
	z0GsBlFZQ+MUyBImGhiV2vBo7sbH0gqsrKKmfWxOX2QQIBCxUg2bpo8fsQXOCagoPeHA
	yshEnK4NpoCyYqE9t9fIcPhAusLfuSy29Dcg9HRzZDI1Whrsi+XTzR6QvI64DuU5cZ2f
	QOVg==
X-Received: by 10.66.66.196 with SMTP id h4mr11874669pat.113.1445709466425;
	Sat, 24 Oct 2015 10:57:46 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	fb1sm25277672pab.9.2015.10.24.10.57.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 24 Oct 2015 10:57:45 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 0C2C6FC66DC; Sat, 24 Oct 2015 10:57:29 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Sat, 24 Oct 2015 10:57:22 -0700
Message-Id: <39ecc240ad6d2bc175023a3a3649306ea8b7bd9a.1445709055.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1445709055.git.akuster808@gmail.com>
References: <cover.1445709055.git.akuster808@gmail.com>
In-Reply-To: <cover.1445709055.git.akuster808@gmail.com>
References: <cover.1445709055.git.akuster808@gmail.com>
Subject: [PATCH 4/7] nautilus3: Fix build with B != S
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
X-List-Received-Date: Sat, 24 Oct 2015 17:57:46 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb b/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb
index 1acf8d3..c8ebf4f 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb
@@ -27,7 +27,7 @@ EXTRA_OECONF = " --disable-gtk-doc  --disable-update-mimedb --enable-nst-extensi
 export SYSROOT = "${STAGING_DIR_HOST}"
 
 do_configure() {
-    sed -i -e /docs/d Makefile.am
+    sed -i -e /docs/d ${S}/Makefile.am
     autotools_do_configure
 }
 
-- 
1.9.1


