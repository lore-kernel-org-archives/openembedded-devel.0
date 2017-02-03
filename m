Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 92F86605BE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Feb 2017 16:45:52 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id s186so3708971qkb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Feb 2017 08:45:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WU8CW5YPBo8+sLFsMghS4ss0hQwFvwXYn8l+ptsCPeY=;
	b=DtjmZQ7AyRImbt5we7ucHIXhjxg+JSM1vATP9wHvtoosEUJATrttd0m1dDXcGeX9ZR
	xAzzqkw3YqpzMgzDr8tJD/Q3/FeVByxocLWr1f2oz0Bo+MDXVibd4c6PjIi2Rb58jeQE
	oy491vpVAXwiID6m/eh50cXxukOdoyf9avz1G+C+Q3uVH+xHRCx/bsKrPiyHKKlSUHBc
	nFFtia0VcqS4DTrJPyIi8dhb75iK2OKrled6JW//39EMGk3fiorJLjya+N4f4ltf9Gw4
	eNSsjhDFzUXCMFFDwyp63uCqXWMrKatc34MQuqRF1a85a4RDV193WKnGBLqzXgGH0Rul
	6AKw==
X-Gm-Message-State: AIkVDXL2WRfcxnc6FFkzjGS5lRjNxo4MEIRvVIqSiu2sqdk4101wQ0AWr5kDSHFL7gYoYA==
X-Received: by 10.55.22.233 with SMTP id 102mr15939200qkw.102.1486140353115;
	Fri, 03 Feb 2017 08:45:53 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	c41sm24860035qtd.3.2017.02.03.08.45.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Feb 2017 08:45:52 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Feb 2017 11:45:39 -0500
Message-Id: <1486140339-19141-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-idna: update to version 2.2
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
X-List-Received-Date: Fri, 03 Feb 2017 16:45:54 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-idna.inc                   | 4 ++--
 .../python/{python-idna_2.1.bb => python-idna_2.2.bb}                 | 0
 .../python/{python3-idna_2.1.bb => python3-idna_2.2.bb}               | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-idna_2.1.bb => python-idna_2.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-idna_2.1.bb => python3-idna_2.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-idna.inc b/meta-python/recipes-devtools/python/python-idna.inc
index 8e1fcb4..ba5e341 100644
--- a/meta-python/recipes-devtools/python/python-idna.inc
+++ b/meta-python/recipes-devtools/python/python-idna.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kjd/idna"
 LICENSE = "BSD-3-Clause & Python-2.0 & Unicode"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=134bdad79491c37bdae32811572b4bc6"
 
-SRC_URI[md5sum] = "f6473caa9c5e0cc1ad3fd5d04c3c114b"
-SRC_URI[sha256sum] = "ed36f281aebf3cd0797f163bb165d84c31507cedd15928b095b1675e2d04c676"
+SRC_URI[md5sum] = "e2d3f8a45d3d048a653eb186896e9e3e"
+SRC_URI[sha256sum] = "0ac27740937d86850010e035c6a10a564158a5accddf1aa24df89b0309252426"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-idna_2.1.bb b/meta-python/recipes-devtools/python/python-idna_2.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-idna_2.1.bb
rename to meta-python/recipes-devtools/python/python-idna_2.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-idna_2.1.bb b/meta-python/recipes-devtools/python/python3-idna_2.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-idna_2.1.bb
rename to meta-python/recipes-devtools/python/python3-idna_2.2.bb
-- 
2.7.4


