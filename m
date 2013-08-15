Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2D0476B7C9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:45 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id h14so185453eak.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=lTQm8TOkq9Zud5XAnctRbZpFOpcrnnurK/Yb9wp5/OM=;
	b=iPOTkMMAXSy02HzxUY40a8Tl6CKPczqPpHYrpuFmaC55Q9mxyEsnZLVFBcyEDvHsVM
	a39kFaBDv/bUhZMRQp8qrnpyJpIXOGX9ZuJ7b7v1AN2Ktx9K53+sd8R45s0WwQLOokH/
	0ASuX7jRMeBKgjfmwZGY4uQkFPVLSST+nDvEr/DC35nX4uXU+JYZbe4sqKHpeSLACE2W
	wW6FUvDFoJ4DECTl9y4BWrVqc/fPcS9sQi3xsM9NTCgqTRNzmF4RPe7N0as8mASQmXlu
	r3Y4qNwaMqEWvP2za54gCIpNUn/hdZXQgGeVY71ZqnEomQIJio8vbxiGjHgNwkgCjnkb
	K3Ig==
X-Received: by 10.14.174.68 with SMTP id w44mr10754212eel.50.1376551185327;
	Thu, 15 Aug 2013 00:19:45 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	z12sm7573646eev.6.2013.08.15.00.19.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:19 +0200
Message-Id: <d5a2ea121a0c86d472fbb3d73dc4ad8c40d2031f.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 39/60] jasper: add PACKAGECONFIG for jpeg
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
X-List-Received-Date: Thu, 15 Aug 2013 07:19:45 -0000

* it's autodetected from sysroot
* add PACKAGECONFIG to make it deterministic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/jasper/jasper_1.900.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-graphics/jasper/jasper_1.900.1.bb b/meta-oe/recipes-graphics/jasper/jasper_1.900.1.bb
index ef9ca6f..a454501 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_1.900.1.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_1.900.1.bb
@@ -8,6 +8,9 @@ SRC_URI = "http://www.ece.uvic.ca/~mdadams/jasper/software/jasper-${PV}.zip"
 
 inherit autotools lib_package
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[jpeg] = "--enable-libjpeg,--disable-libjpeg,jpeg"
+
 EXTRA_OECONF = "--enable-shared"
 
 SRC_URI[md5sum] = "a342b2b4495b3e1394e161eb5d85d754"
-- 
1.8.3.2


