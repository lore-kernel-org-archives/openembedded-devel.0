Return-Path: <okaya@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 30E2960C1C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 18:11:23 +0000 (UTC)
Received: from
	sinanubuntu1604.jnhiziqmwaketkadpjb23kppec.bx.internal.cloudapp.net
	(unknown [52.170.189.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 252842082F;
	Mon, 10 Feb 2020 18:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581358285;
	bh=3OdDLja9hCS0MmEgdCnaXgwtLtn0siS+9zOSvhcUzQ4=;
	h=From:To:Cc:Subject:Date:From;
	b=w1BZg2muWpb0Veb6XwHjhX//VlaLzuR781aNJHbZDkVlKsF+8RplRfF6tLD8jl6dg
	QrWuj2Eh0lJSrfDF3Oj1sZdlmvPA8pYJ0Uhd+ALdWPO22LFAiZzf5ncbgBhODSh9WJ
	eJnT6FX/Vq//+5osDBD1zNaqAwuoqvyGxrkuuONk=
From: Sinan Kaya <okaya@kernel.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Feb 2020 18:11:19 +0000
Message-Id: <20200210181119.56826-1-okaya@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Sinan Kaya <sinan.kaya@microsoft.com>
Subject: [meta-oe][PATCH] protobuf: upgrade to 3.11.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Feb 2020 18:11:24 -0000
Content-Transfer-Encoding: 8bit

From: Sinan Kaya <sinan.kaya@microsoft.com>

Signed-off-by: Sinan Kaya <sinan.kaya@microsoft.com>
---
 .../protobuf/{protobuf_3.10.1.bb => protobuf_3.11.3.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_3.10.1.bb => protobuf_3.11.3.bb} (96%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.10.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.11.3.bb
similarity index 96%
rename from meta-oe/recipes-devtools/protobuf/protobuf_3.10.1.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_3.11.3.bb
index 58526f1315..4fa576a1ad 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.10.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.11.3.bb
@@ -10,9 +10,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
 DEPENDS = "zlib"
 DEPENDS_append_class-target = " protobuf-native"
 
-SRCREV = "d09d649aea36f02c03f8396ba39a8d4db8a607e4"
+SRCREV = "498de9f761bef56a032815ee44b6e6dbe0892cc4"
 
-SRC_URI = "git://github.com/google/protobuf.git;branch=3.10.x \
+SRC_URI = "git://github.com/google/protobuf.git;branch=3.11.x \
            file://run-ptest \
            file://0001-protobuf-fix-configure-error.patch \
            file://0001-Makefile.am-include-descriptor.cc-when-building-libp.patch \
-- 
2.23.0


