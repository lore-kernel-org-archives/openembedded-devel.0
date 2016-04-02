Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9B16475E2D
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Apr 2016 14:45:43 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id n34so13778932qge.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Apr 2016 07:45:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xepTIVy4JBDK4o9b/sJcpJT197fRlONguN4IYAED198=;
	b=PQrTfDRJs+wtlfy78d38Xex7AL0kCyyQ/WIT/yb5zc+EBuQxQtvwEhE1A4qKZ7x9/v
	SWxRVbjo6lD3Aie2Iym+ImurI7FgA1LPtzpHHWT2q06GDijyqGYFlZjOOUiRjZRpopdf
	6qvCbumIMvjSQ6Gairy5rAS2nUMMIjibBr/7QcAMdlkjMd7E8evdUG/GR08Xazj88gzT
	zOBB6f5+vHW6YBo9U2BkgR7R+5fgAWgAw9nqlge7GSPrdrt6TwWjGujHl8etdYhZY1Xu
	zR6n6eEi4UTG3hJ7pYoVu8/WPWCnYxKLRPUUVFw/5CiiJelClHTVo90xDI4tu2VbVb9Y
	8wCg==
X-Gm-Message-State: AD7BkJJtJpW13/I8HxDqAh5fA9v+1rHVqnoZi1mSRt8I8kvXWUw5Zui1PMZ8FErMpxfHtg==
X-Received: by 10.140.152.78 with SMTP id 75mr3867235qhy.22.1459608343799;
	Sat, 02 Apr 2016 07:45:43 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	d188sm8450194qkb.9.2016.04.02.07.45.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 02 Apr 2016 07:45:43 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Apr 2016 10:45:27 -0400
Message-Id: <1459608329-26531-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-perl][PATCH 1/3] libxml-sax-writer-perl: update to 0.56
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
X-List-Received-Date: Sat, 02 Apr 2016 14:45:45 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...{libxml-sax-writer-perl_0.54.bb => libxml-sax-writer-perl_0.56.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libxml/{libxml-sax-writer-perl_0.54.bb => libxml-sax-writer-perl_0.56.bb} (86%)

diff --git a/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.54.bb b/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.56.bb
similarity index 86%
rename from meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.54.bb
rename to meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.56.bb
index 914c208..961ceda 100644
--- a/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.54.bb
+++ b/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.56.bb
@@ -13,8 +13,8 @@ DEPENDS += "libxml-filter-buffertext-perl-native"
 RDEPENDS_${PN} += "libxml-filter-buffertext-perl"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/P/PE/PERIGRIN/XML-SAX-Writer-${PV}.tar.gz"
-SRC_URI[md5sum] = "383139d76418a82b9800dc4f8b568891"
-SRC_URI[sha256sum] = "a1b4d959aed8f8337523c4cef4b431e56e619c795dc6f99a868548952101cf3d"
+SRC_URI[md5sum] = "e5fa5e2b2f6867b1aca9b5b43e1ce361"
+SRC_URI[sha256sum] = "d073f7a25072c8150317b86b99d07031316a15bffab99e63e5afe591c8217d03"
 
 LIC_FILES_CHKSUM = "file://README;beginline=45;endline=46;md5=d41d8cd98f00b204e9800998ecf8427e"
 
-- 
1.9.1


