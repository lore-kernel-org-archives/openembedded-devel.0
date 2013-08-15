Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 82EAF6B7E3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:05 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id c50so182116eek.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=x1mpbWfe9Ym821yGNrdxsoWuPjGftiHVY5rXO7Zc86M=;
	b=0qv8gRLmTyF1JStBObrPtC8f0ZyHlacGCd1LS+TzIF7IVPcfPOypuci0E199TSLpHN
	bP/uaRBC8VIMxgi7HdJ2EAnH+HzE9IHRklTPXaVCP+i/ZuBF5YomlhbNqyEeUpcWbpy6
	iBU9SDZI9Us25klvL1c0TDTDtBiSuBGDX6FjKwt84kML6GiCJUQKd20p46aFOrccorqx
	t+1Wg2BblKS1/OBsE2LehteMTOiG4r7oIk/6LUHVtWSFgiCEvrqxLljAi5OMwz75qR+G
	CTZXsNzCZRfRIeayTlVCeyRGFEVcQDyAjMsCD+pauZGDwwu6UoaRX3JXsoxyFcqhdYHj
	UHqg==
X-Received: by 10.14.246.11 with SMTP id p11mr20947827eer.9.1376551145829;
	Thu, 15 Aug 2013 00:19:05 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n48sm82046454eeg.17.2013.08.15.00.19.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:18:50 +0200
Message-Id: <e96e6e5da156cfb3ce8d96f31d10234b60d6eff1.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 10/60] libspatialite: add missing dependency on sqlite3
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
X-List-Received-Date: Thu, 15 Aug 2013 07:19:05 -0000

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
1.8.3.2


