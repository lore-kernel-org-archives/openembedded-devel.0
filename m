Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id C2BBB75279
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 19:23:18 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id l10-v6so8841565qtj.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 12:23:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rAjZIAGkFjNlGjQRfiK8xgFzz02QwF+o4NSfhWk16hc=;
	b=o25GXOg5ks5nOVAeAR90XpShXNAip/R7vd4EZSHY36kIyVE5E3gMEnV3f2zk2jHL9+
	GktCITAx7IdwCgfBP54Jz1zfaJpVbOzEMDZJfWNVsWEX8Fgst14utmWOjJdikn7CWU6U
	hFL/Lu+z9fXjwlVFKVzfJ2h1FRCBMQ7O96t1GeefF8FzXp/FHftKRlb/wze7C7SgMs3W
	xzWJ0qw1exaogVMiNZlq4GDyDuIX2ERzfzY8qDc5ApRXP9H2kO1g5ZxvKzWHSUaiIpzR
	I5hsZ8nkDRFCkwizTt8yUmDAAHnf//Lzr93RrCVKIezvG/pTeROpMZRip5cXY++dR5dl
	Oc0g==
X-Gm-Message-State: APt69E18lJUn05P2yKHUrgmGBVbqYDHoks3ElDR1iHHRyzls8bbzqNk5
	MnxtGvfE3Hn18iRvJ4DCzGOf7h8/
X-Google-Smtp-Source: AAOMgpc5XRlTBWTleuw5VBiGdSXUGAVviIVsE+iU1lPCWznyfqXW7rgLcg5AdnaQsDuOUuw/6DLTCA==
X-Received: by 2002:a0c:b665:: with SMTP id
	q37-v6mr14614838qvf.43.1530300199154; 
	Fri, 29 Jun 2018 12:23:19 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-100-33-240-84.nycmny.fios.verizon.net. [100.33.240.84])
	by smtp.gmail.com with ESMTPSA id
	m2-v6sm7887748qtc.77.2018.06.29.12.23.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jun 2018 12:23:18 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Jun 2018 15:23:11 -0400
Message-Id: <1530300191-22141-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-lxml: update to version 4.2.3
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
X-List-Received-Date: Fri, 29 Jun 2018 19:23:19 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-lxml.inc                   | 4 ++--
 .../python/{python-lxml_4.2.2.bb => python-lxml_4.2.3.bb}             | 0
 .../python/{python3-lxml_4.2.2.bb => python3-lxml_4.2.3.bb}           | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-lxml_4.2.2.bb => python-lxml_4.2.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-lxml_4.2.2.bb => python3-lxml_4.2.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
index 51a98f6..09061ed 100644
--- a/meta-python/recipes-devtools/python/python-lxml.inc
+++ b/meta-python/recipes-devtools/python/python-lxml.inc
@@ -18,8 +18,8 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[md5sum] = "0aa7db9dd54ed5b0c5611cef0ba490c5"
-SRC_URI[sha256sum] = "82f278cd24da1b8a98df89de38946d67381a00e39adef768fd302dc8f4e1c383"
+SRC_URI[md5sum] = "40331e46f6aa49fd0e7043d82e58a879"
+SRC_URI[sha256sum] = "622f7e40faef13d232fb52003661f2764ce6cdef3edb0a59af7c1559e4cc36d1"
 
 DISTUTILS_BUILD_ARGS += " \
                      --with-xslt-config='pkg-config libxslt' \
diff --git a/meta-python/recipes-devtools/python/python-lxml_4.2.2.bb b/meta-python/recipes-devtools/python/python-lxml_4.2.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-lxml_4.2.2.bb
rename to meta-python/recipes-devtools/python/python-lxml_4.2.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.2.2.bb b/meta-python/recipes-devtools/python/python3-lxml_4.2.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-lxml_4.2.2.bb
rename to meta-python/recipes-devtools/python/python3-lxml_4.2.3.bb
-- 
2.7.4


