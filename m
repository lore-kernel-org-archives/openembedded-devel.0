Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5E79B76ABD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 05:41:07 +0000 (UTC)
Received: by widdq5 with SMTP id dq5so3967718wid.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 22:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=BZ5FWlhvCuQueo4mWnBBEuCTeMCNRuhgga+cw372Rno=;
	b=ww0AqLERbl7AODxYA67f2T25wvGuP0HayV48pl/q9KDj1ryySQAz6mbdAOF5nmhdrV
	cm0ym6Foqc8Fj+KPjf5UGWY6Np2oa/pRKNemtlRdVxZVGyL5l3mDTSSQyyFsEE+dJfRe
	mj3hPEOirztlet6OZWwhcHmh8KbTisDDjyW6X1d1MMl1SFbbz8ujRZeFYHtfxBJ/HcUa
	Lfe9sHn7AjKDLIzc2fql6lsSXr9b+GXtbs46QE/xJd7Fuc6AuIjoJqZOLlLuK731KoqT
	gIu8snKKemtRBdxmPeeAyL+75VGqm5KR6PflUXA3E2Xl0l3np9XPhgMBOXH0P6tsS5gQ
	cv7Q==
X-Received: by 10.180.38.34 with SMTP id d2mr1574142wik.48.1440481267490;
	Mon, 24 Aug 2015 22:41:07 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0EB5.dip0.t-ipconnect.de.
	[79.223.14.181]) by smtp.googlemail.com with ESMTPSA id
	y13sm26267680wjq.26.2015.08.24.22.41.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Aug 2015 22:41:07 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Aug 2015 07:40:51 +0200
Message-Id: <1440481251-22440-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1440481251-22440-1-git-send-email-schnitzeltony@googlemail.com>
References: <1440481251-22440-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] geany: update to 1.25
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
X-List-Received-Date: Tue, 25 Aug 2015 05:41:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-devtools/geany/{geany_1.24.1.bb => geany_1.25.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-devtools/geany/{geany_1.24.1.bb => geany_1.25.bb} (58%)

diff --git a/meta-oe/recipes-devtools/geany/geany_1.24.1.bb b/meta-oe/recipes-devtools/geany/geany_1.25.bb
similarity index 58%
rename from meta-oe/recipes-devtools/geany/geany_1.24.1.bb
rename to meta-oe/recipes-devtools/geany/geany_1.25.bb
index f765e2c..59c424c 100644
--- a/meta-oe/recipes-devtools/geany/geany_1.24.1.bb
+++ b/meta-oe/recipes-devtools/geany/geany_1.25.bb
@@ -2,15 +2,15 @@ SUMMARY = "A fast and lightweight IDE"
 HOMEPAGE = "http://www.geany.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bd7b2c994af21d318bd2cd3b3f80c2d5"
-DEPENDS = "gtk+"
+DEPENDS = "gtk+ python-docutils-native"
 
-inherit autotools pkgconfig perlnative
+inherit autotools pkgconfig perlnative pythonnative
 
 SRC_URI = " \
     http://download.geany.org/${BP}.tar.bz2 \
     file://0001-configure.ac-remove-additional-c-test.patch \
 "
-SRC_URI[md5sum] = "d225104cef3973164d70116d46239606"
-SRC_URI[sha256sum] = "7fb505d9b01fe6874890525f837644a6a38c23a372bb068c65ef3673108a8c33"
+SRC_URI[md5sum] = "888bd82d62759ac47a4a398fb27c8471"
+SRC_URI[sha256sum] = "8ee41da28cead8c94d433e616d7ababa81727c63e9196ca6758ade3af14a49ef"
 
 FILES_${PN} += "${datadir}/icons"
-- 
2.1.0


