Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 123806E7C5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 11:51:26 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id a15so3431161eae.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 03:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=K15kmZwPyc5vAfZ7mRw3x8GAvl3XTNFzVNiVPK/J4ks=;
	b=GiG6s0jVtWzZfPP1JKEdB9BKlRQVC6T0JowNIyo4pErZTOADtAoEPZYuRBFX9m3qyn
	jt2ZP4TsOeUdEEVHXtScwM3gbqa9rgS+vqahvWsRe0dIj8gorA7OOqLMXU9nNqkUJMUd
	iGfwDwDO7oyfRe+4CObDzqxY22nsaC5omIAcf04yeDQ56wtzLaQkNuGd1S7ln+JpuZjy
	e3yZZntv1C8vJjgBN3gYkxJ3IduAP+kDTq5PkUCBeECQbm7juVT05Q8TTz2HHoslubaS
	h8wwyR5lxjO4xNkwLzj6/HzlYq3XdgDYIYF07C+ouHikRmuhfAOkbu08kzE1mIy0bvZP
	rPnA==
X-Received: by 10.14.37.131 with SMTP id y3mr1047070eea.1.1390391487513;
	Wed, 22 Jan 2014 03:51:27 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	z49sm26229145eeo.10.2014.01.22.03.51.26 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Jan 2014 03:51:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jan 2014 12:51:19 +0100
Message-Id: <1390391479-22665-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <1390391479-22665-1-git-send-email-Martin.Jansa@gmail.com>
References: <1390239757-27055-4-git-send-email-Martin.Jansa@gmail.com>
	<1390391479-22665-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCHv2 5/5] evas-generic-loaders: package generic pdf loaders as well
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
X-List-Received-Date: Wed, 22 Jan 2014 11:51:27 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/evas-generic-loaders.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders.inc b/meta-efl/recipes-efl/efl/evas-generic-loaders.inc
index ec49770..0d0ec33 100644
--- a/meta-efl/recipes-efl/efl/evas-generic-loaders.inc
+++ b/meta-efl/recipes-efl/efl/evas-generic-loaders.inc
@@ -23,9 +23,14 @@ python populate_packages_prepend () {
     output_pattern = "evas-generic-loader-%s",
     description = 'Evas generic loaders - module %s',
     allow_dirs=True, recursive=False, extra_depends="" )
+
+    do_split_packages(d, basedir, '^evas_generic_pdf_loader\.(.*)$',
+    output_pattern = "evas-generic-pdf-loader-%s",
+    description = 'Evas generic pdf loaders - module %s',
+    allow_dirs=True, recursive=False, extra_depends="" )
 }
 
 FILES_evas-generic-loader-xcf += "${libdir}/evas/utils/*.xcf.gz"
 FILES_${PN}-dbg += "${libdir}/evas/utils/.debug"
 
-PACKAGES_DYNAMIC += "^evas-generic-loader-.*"
+PACKAGES_DYNAMIC += "^evas-generic-loader-.* ^evas-generic-pdf-loader-.*"
-- 
1.8.5.3


