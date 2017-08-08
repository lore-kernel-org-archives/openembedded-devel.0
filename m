Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id A67D871A36
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 17:49:04 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id p3so3762482qtg.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 10:49:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BFSTm3hUBcvJczc1LkrnaAatHKphhMVGA1vZg+Wly50=;
	b=JUY9asMxqfy9PJqZJVIcWdBvYP6fTgggAR0mltqTgAxgLqZHcP6IlXgLiB2qCVZbiG
	NEG5s8UzyHvtMTm3/bUkHAvItZoUl7oRH5NYx7fhNJXbl/xzj4Ae5NNSnGy8qvgp3OPp
	3mAxnbjvPi8BZRJ/3pRgHTIBL1f1bkocH7oTVavRQpCeFJTgIdiVSvsUBaRUAExci/Hw
	mi0+RTWdxXp0xk66TsIZLNDvWJuKPpKqjKqguxQqo26kr4+9z9qFoXGUDeNKESFeO5k1
	PS4TxnnmzkQ5xBc0RSHqv3Bm4J2uHKoWxWOFs2Pye5Wn3tZWzOs1s0TuyyHaZs0CigA2
	aWRA==
X-Gm-Message-State: AHYfb5gE8shxdu89KWyMlqNX92162LFrtDcrcV6d+p+4J5j77XCphKRn
	ML85fGVuBi2Gqz/zYeI=
X-Received: by 10.200.45.236 with SMTP id q41mr6802318qta.177.1502214545536;
	Tue, 08 Aug 2017 10:49:05 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id o1sm938520qtg.7.2017.08.08.10.49.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Aug 2017 10:49:05 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Aug 2017 13:48:57 -0400
Message-Id: <1502214537-14417-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-perl][PATCH] libxml-sax-writer-perl: update to version 0.57
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
X-List-Received-Date: Tue, 08 Aug 2017 17:49:04 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...{libxml-sax-writer-perl_0.56.bb => libxml-sax-writer-perl_0.57.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libxml/{libxml-sax-writer-perl_0.56.bb => libxml-sax-writer-perl_0.57.bb} (86%)

diff --git a/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.56.bb b/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
similarity index 86%
rename from meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.56.bb
rename to meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
index 961ceda..d1b0de0 100644
--- a/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.56.bb
+++ b/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
@@ -13,8 +13,8 @@ DEPENDS += "libxml-filter-buffertext-perl-native"
 RDEPENDS_${PN} += "libxml-filter-buffertext-perl"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/P/PE/PERIGRIN/XML-SAX-Writer-${PV}.tar.gz"
-SRC_URI[md5sum] = "e5fa5e2b2f6867b1aca9b5b43e1ce361"
-SRC_URI[sha256sum] = "d073f7a25072c8150317b86b99d07031316a15bffab99e63e5afe591c8217d03"
+SRC_URI[md5sum] = "3e3023c648e3003c04de2fb04435f8bd"
+SRC_URI[sha256sum] = "3d61d07ef43b0126f5b4de4f415a256fa859fa88dc4fdabaad70b7be7c682cf0"
 
 LIC_FILES_CHKSUM = "file://README;beginline=45;endline=46;md5=d41d8cd98f00b204e9800998ecf8427e"
 
-- 
2.7.4


