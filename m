Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id 20D3E770C6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2016 13:18:07 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id o11so8407610qge.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2016 05:18:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=njHvwblbOvK52uND8S1cihkqdhRaBE492pWuQHfgAII=;
	b=lGpT2HUwLlwdddBVNHuU8eOjcOa/ZFI7ukMxGIL8JH0mUzIdOl9zKPMPQg+/zBxBKm
	7yOBAvGRaVg55QP2/iiA752fKxUOKFKz9OqwFB/IIVr05ch2IyWwQXrmnZO45v4DA1BZ
	VmzoilW3Crbp/kjtDvHtCf9IwdtxA3txPHdlBj8A/S4/iG7pJ7+8P4kn8zijx0xI/tt0
	0Anvzu/tfNI+7LoDRNMcC0ndpQI+XVfZ4omc1cPv7YfxfkfYFd1WfafrUWccnCqAwgzS
	wfuL9WEjJJLNnLXuCLzaVirS1SbZisJZ7d6tKQW9tdAKo7XP3dhRfkCPKjRHi+L86d8N
	eBmw==
X-Gm-Message-State: AG10YOTCHdDoGnK0q+0dxs6Q0CZX5I/mfSaurXF98DJCAe+hMKfgntHp/IYecVTRrlPVUQ==
X-Received: by 10.140.104.146 with SMTP id a18mr14955345qgf.59.1453641487945; 
	Sun, 24 Jan 2016 05:18:07 -0800 (PST)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	d188sm6865927qkb.9.2016.01.24.05.18.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Jan 2016 05:18:07 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jan 2016 08:17:46 -0500
Message-Id: <347b26573030e61fd3ba63e0fe971be4c1ef08b6.1453589999.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
Subject: [meta-python][PATCH 13/13] python-flufl-enum: update to 4.1
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
X-List-Received-Date: Sun, 24 Jan 2016 13:18:07 -0000

---
 .../python/{python-flufl-enum_4.0.1.bb => python-flufl-enum_4.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-flufl-enum_4.0.1.bb => python-flufl-enum_4.1.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python-flufl-enum_4.0.1.bb b/meta-python/recipes-devtools/python/python-flufl-enum_4.1.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python-flufl-enum_4.0.1.bb
rename to meta-python/recipes-devtools/python/python-flufl-enum_4.1.bb
index 458d244..bafa1f7 100644
--- a/meta-python/recipes-devtools/python/python-flufl-enum_4.0.1.bb
+++ b/meta-python/recipes-devtools/python/python-flufl-enum_4.1.bb
@@ -4,12 +4,12 @@ specific, concise semantics in an easy to read and write syntax. flufl.enum has
 features needed to make enumerations useful, but without a lot of extra baggage to weigh them down. "
 
 LICENSE = "LGPLv3"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=1fa25baed15d3be23c902636379438e8"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=04363ba21b0f5ce3af8daa2e5aae431f"
 
 PYPI_PACKAGE = "flufl.enum"
 
-SRC_URI[md5sum] = "b3ad23761a78232bc78499ced7cb85d9"
-SRC_URI[sha256sum] = "4af7e7cf2dcc7517251570c7ef9ad194e30ee4b6f860eba500c03954ae95f9d8"
+SRC_URI[md5sum] = "461779384c07ed2b5f554a5d51a000c4"
+SRC_URI[sha256sum] = "94da1413ba085473652f81565847913ea1543d1739972ecbd6afe57d7b1b68b4"
 
 inherit pypi setuptools
 
-- 
1.9.1


