Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 083E76B019
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2013 01:24:04 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id a15so1161064eae.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jul 2013 18:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=0RFe+MxoDOsnPnDdKqCyhUXZERCgEQR+y7VlLJWaCZU=;
	b=nmg4iuxcSkSWjjDhJW+yCwQZs574hUTrfBkA4dKzipWDvC6MNZ+gANCjwsLUeuK/cJ
	Z5X0tbFXzyWf5AIa9Tyd8PL7n1rPnLk8R4Y5znsQP8Qz843+ns60AlITOobGrC6xIYqs
	StJUljRVBkyiTyBG0qwVS0bJ9KV5rdTFzSkoJFsy4EaOOMAfKJLxjoIvjGkzSc4cAU/2
	bmfEC27zIM1+cCIxKaJeByiQ3nAEAFc6S2Rmylz+4gYld+fzAEjZVdDKixWvTH+QgZpm
	nxL5ptG925cVKfqUO1MLI4PCvKBDBGji5UEsob4yhItDcmHT/LC4GEq/R1zHvyL/uIoD
	qlcQ==
X-Received: by 10.14.98.6 with SMTP id u6mr8719117eef.62.1372987445631;
	Thu, 04 Jul 2013 18:24:05 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b7sm9564189eef.16.2013.07.04.18.24.04 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Jul 2013 18:24:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Jul 2013 03:23:51 +0200
Message-Id: <827782ae23e5372714127be337bdeecf1d637db7.1372987207.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <47686756f036d39b24eb30d4522eb1f1b1a12702.1372987207.git.Martin.Jansa@gmail.com>
References: <47686756f036d39b24eb30d4522eb1f1b1a12702.1372987207.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1372987207.git.Martin.Jansa@gmail.com>
References: <cover.1372987207.git.Martin.Jansa@gmail.com>
Subject: [PATCH 07/10] libspatialite: add missing dependency on sqlite3
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
X-List-Received-Date: Fri, 05 Jul 2013 01:24:05 -0000

* do_configure fails without:
  | checking for sqlite3.h... no
  | configure: error: cannot find sqlite3.h, bailing out

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/libspatialite/libspatialite.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/libspatialite/libspatialite.inc b/meta-oe/recipes-navigation/libspatialite/libspatialite.inc
index f51b3a5..c8d7ec1 100644
--- a/meta-oe/recipes-navigation/libspatialite/libspatialite.inc
+++ b/meta-oe/recipes-navigation/libspatialite/libspatialite.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "Library extending the SQLite core to support fully fledged Spatial SQL capabilities"
 HOMEPAGE = "https://www.gaia-gis.it/fossil/libspatialite/"
 SECTION = "libs"
-DEPENDS = "proj geos"
+DEPENDS = "proj geos sqlite3"
 
 INC_PR = "r0"
 
-- 
1.8.2.1


