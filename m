Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web10.14390.1586880858371171607
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2020 09:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=gGJLa4zn;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id AA4EE600BB;
	Tue, 14 Apr 2020 18:14:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1586880854;
	bh=7Y3QNuFKSkCrY/gZGyn3h+J3o16BuopP7C3PiurEoKs=;
	h=From:To:Cc:Subject:Date:From;
	b=gGJLa4znryBa6xnLJcKsLhR42JeP4JLkhIg+2/rs/nJlStjotb8CqCptoqXDKuI4N
	 FxqmhgWkvfMFtRoSd2fsjMlqQq/PiaJ6ZsU4lOaoD/JXjgVDLWm1OoBVW42+5gxTpS
	 ztoFCbzm824pOZmbsuXu3am/leb1MfyBTKo/2p7uv/3umF+euLkagJx7uy/bqtuuOb
	 i4PhB+cl2H0XCbgyBu+pjw3OM5BSynfdNO1GhV8TvP/eEHVNIgx6I2+84Ex8xPwc8Q
	 FWMjEl3eNQ3ofleWmzCeAt81afNABArL6GU3+2Hlv6Q+oaY+BowlBAgTawgmijZeIX
	 AdmEPxBldvljg==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH 1/2] pegtl: upgrade 2.8.1 -> 2.8.2
Date: Tue, 14 Apr 2020 18:14:11 +0200
Message-Id: <1586880852-19799-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

License-Update: copyright years updated

See full changelog https://github.com/taocpp/PEGTL/releases/tag/2.8.2

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-extended/pegtl/{pegtl_2.8.1.bb => pegtl_2.8.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/pegtl/{pegtl_2.8.1.bb => pegtl_2.8.2.bb} (68%)

diff --git a/meta-oe/recipes-extended/pegtl/pegtl_2.8.1.bb b/meta-oe/recipes-extended/pegtl/pegtl_2.8.2.bb
similarity index 68%
rename from meta-oe/recipes-extended/pegtl/pegtl_2.8.1.bb
rename to meta-oe/recipes-extended/pegtl/pegtl_2.8.2.bb
index 7333363..42aa655 100644
--- a/meta-oe/recipes-extended/pegtl/pegtl_2.8.1.bb
+++ b/meta-oe/recipes-extended/pegtl/pegtl_2.8.2.bb
@@ -1,9 +1,9 @@
 DESCRIPTION="header-only library for creating parsers according to Parsing Expression Grammar"
 HOMEPAGE="https://github.com/taocpp/PEGTL"
 LICENSE="MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ae77b0d903a788cb48f4f0926ffc468b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6a5195f720a8d436a4148e0cb8660400"
 
-SRCREV = "7aff80da2ca4fcb0b47f32ba684ff2e1cd48c579"
+SRCREV = "ede3ce17aef7da27648b195dc77814cb1d3c313d"
 SRC_URI = "git://github.com/taocpp/PEGTL.git;protocol=https;branch=2.x \
           "
 
-- 
2.7.4

