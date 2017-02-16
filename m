Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 944C9772E0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 22:52:11 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id u25so4437403qki.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 14:52:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pq/e1hLSKpf1su1RVv3s+QMFde+y46JMGH9DUC08CIw=;
	b=fLy42PS9U+BK6fM3Wav0PcG0ysmHpG2mllJhP7J0/2iNayVUIy5k8/sZxgVpodJl7L
	RWy+KNYNwmkz62btwa2/anc3WOlOGURNobhaXf16OLfvmlHkHT/3onVvM+qR7DrbSL5p
	NvtD4j3OOhiieHOZQqpMLGTgWnZT9GwPEAwDxrHVYFx5AMCambchyXnH1mA8lsXD17d6
	2IG0f/vWUmGkavPh3//J4hiJrcDArmZz+ha0LZXh8eYFrQgG7AkOqG2+zKqlfpge0Pga
	JPwREmoffonzSk4g7JRWg/2CZ+QwdeOtACvTvDKYE0kbDPM+Zo9cosRyB3+Ug2ZYlumO
	Pe7g==
X-Gm-Message-State: AMke39lC0Q6UIX433qbq8WEcbsbMNl10bR3CyR+7E+oWISOL4e476Si5zOd7t9ppzJCkiQ==
X-Received: by 10.55.15.129 with SMTP id 1mr4391811qkp.150.1487285531633;
	Thu, 16 Feb 2017 14:52:11 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	m67sm5278648qte.54.2017.02.16.14.52.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Feb 2017 14:52:11 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Feb 2017 17:52:03 -0500
Message-Id: <1487285523-25674-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-urllib3: update to version 1.2
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
X-List-Received-Date: Thu, 16 Feb 2017 22:52:12 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-urllib3.inc              | 6 +++---
 .../python/{python-urllib3_1.19.1.bb => python-urllib3_1.2.bb}      | 0
 .../python/{python3-urllib3_1.19.1.bb => python3-urllib3_1.2.bb}    | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-urllib3_1.19.1.bb => python-urllib3_1.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-urllib3_1.19.1.bb => python3-urllib3_1.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-urllib3.inc b/meta-python/recipes-devtools/python/python-urllib3.inc
index ef0b3ae..485f57f 100644
--- a/meta-python/recipes-devtools/python/python-urllib3.inc
+++ b/meta-python/recipes-devtools/python/python-urllib3.inc
@@ -1,10 +1,10 @@
 SUMMARY = "Python HTTP library with thread-safe connection pooling, file post support, sanity friendly, and more"
 HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ea114851ad9a8c311aac8728a681a067"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=06dfcbb88fb0787a2039e26af11276f5"
 
-SRC_URI[md5sum] = "7c4edfc86680c8467cfab204ed4ab2dc"
-SRC_URI[sha256sum] = "53bc34c8ee268c3bd83ecf5e9c80fa783f3148484579bd4e20f4a7c1bb2dd6a0"
+SRC_URI[md5sum] = "e62d42006807308fea9556c17af8e250"
+SRC_URI[sha256sum] = "cc49b66adcb45e19c6944cff35eedb60ee2228f0afba51f4da29c47e7a398f15"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-certifi \
diff --git a/meta-python/recipes-devtools/python/python-urllib3_1.19.1.bb b/meta-python/recipes-devtools/python/python-urllib3_1.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-urllib3_1.19.1.bb
rename to meta-python/recipes-devtools/python/python-urllib3_1.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.19.1.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-urllib3_1.19.1.bb
rename to meta-python/recipes-devtools/python/python3-urllib3_1.2.bb
-- 
2.7.4


