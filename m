Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 24C3D60620
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Oct 2017 13:10:36 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id x82so12734245qkb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Oct 2017 06:10:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HtuuJ7/BqSPYesrr1NglsBn/CxkW78lgRirvQsY+cTo=;
	b=rP0wXQ4Jgom+H0P+biaz00UKPaeoMD2aiO3ppV8oe9xb+TwmNOQbvi9cwNyJFkAqtK
	bhQ4UlUyWZ1+XNQrlWhvvVqYYYc7XtYzWNeaKtdrEMlDPDdwAIiUG6ulfZcKYeA1E/QL
	C3f6fRRhOCHcZxKMGK/GZGod5Isaw1/fBtTB6NxPSwr/lsmdBb3u4kjugv/mkJHwtK5d
	WlYMRmfoFZWBwSmwmE8IkMlkRWhDe6AFDntrb0QN3n4tveWx8TcPaUQ8TVzkqqKGHO5Q
	edoL3rwbHrSvG3ofkFqdnN8JAgexOZoqCA4+DwUP2Btq8XvBfk5lRpWuw/REnkkOugw5
	mbzQ==
X-Gm-Message-State: AMCzsaUhimDFliGZbc7fjheCwCdel6DswfdrRYewsXCvQbx1QjPUuC92
	XpodH8DyRlZazzVen07QVuMcXZbI
X-Google-Smtp-Source: ABhQp+R1EdaS61bMP9XWg3KLbVLil9BM3UEteQdwA4Hx99X7QiYuAVNd6Od61zArUANF5+EXmlpfWw==
X-Received: by 10.55.159.74 with SMTP id i71mr13957754qke.46.1508159437742;
	Mon, 16 Oct 2017 06:10:37 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	k126sm4477065qkc.69.2017.10.16.06.10.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Oct 2017 06:10:36 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Oct 2017 09:10:30 -0400
Message-Id: <1508159430-17059-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-lxml: update to version 4.1.0
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
X-List-Received-Date: Mon, 16 Oct 2017 13:10:37 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-lxml.inc                   | 4 ++--
 .../python/{python-lxml_4.0.0.bb => python-lxml_4.1.0.bb}             | 0
 .../python/{python3-lxml_4.0.0.bb => python3-lxml_4.1.0.bb}           | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-lxml_4.0.0.bb => python-lxml_4.1.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-lxml_4.0.0.bb => python3-lxml_4.1.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
index 04abe46..7c0a7d7 100644
--- a/meta-python/recipes-devtools/python/python-lxml.inc
+++ b/meta-python/recipes-devtools/python/python-lxml.inc
@@ -18,8 +18,8 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[md5sum] = "c30d7e752cc909c1c0c40bd34153443a"
-SRC_URI[sha256sum] = "f7bc9f702500e205b1560d620f14015fec76dcd6f9e889a946a2ddcc3c344fd0"
+SRC_URI[md5sum] = "247580bd5d942872bd972ad0086e5cbf"
+SRC_URI[sha256sum] = "be3aaeb5f468a49f523f16736ccff7d82af2b4b303292ba3d052b5b28f3fbe47"
 
 DISTUTILS_BUILD_ARGS += " \
                      --with-xslt-config='pkg-config libxslt' \
diff --git a/meta-python/recipes-devtools/python/python-lxml_4.0.0.bb b/meta-python/recipes-devtools/python/python-lxml_4.1.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-lxml_4.0.0.bb
rename to meta-python/recipes-devtools/python/python-lxml_4.1.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.0.0.bb b/meta-python/recipes-devtools/python/python3-lxml_4.1.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-lxml_4.0.0.bb
rename to meta-python/recipes-devtools/python/python3-lxml_4.1.0.bb
-- 
2.7.4


