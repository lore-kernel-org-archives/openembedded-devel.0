Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6924272F24
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Mar 2017 14:17:20 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id n127so10878323qkf.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Mar 2017 06:17:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0PyP5mLcpJjpkKfXdNqmhRxHabV6wjNsQX8VCBw4VXo=;
	b=ZZj+rg3FmSbLRfZ3pGNfXgxH+tgXrKP+5XFr1kpfA1iGU0EYsnvJh58XBuZZqMZyXO
	Y8YmUQC9Puc09ThAd39Sl6ONILS53orOEvBUTFPGQVIy8cc1cQC+TkgKR5InSv7OgwMu
	lnHznTRLicmFhQzogjnkCpeIl4+wT9d0iJXvDOdn3pV2ZkQQkkFPEdv+5XLxkZwYDfg9
	KZh2yZZrvfYET4P2t7m3kaVG7odvbtm26j+C/UFKg4WHDCmVd2phSQLhkvgeVI/mqn9k
	ZVIjpJ6OrEU5ZYghzEgT+BrRchLlXHJcTeevWZ7/gVmAfMb8u8mkHDXhBkILWlC5ySMi
	h9kQ==
X-Gm-Message-State: AMke39nVxK333A6JY0SEJz1+hy1rE5GPuiIuV+dUwingk7B0vUI0EwwKAcPpbJmOq8nyTg==
X-Received: by 10.200.47.129 with SMTP id l1mr10292838qta.112.1488377842188;
	Wed, 01 Mar 2017 06:17:22 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	m136sm3203563qke.53.2017.03.01.06.17.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Mar 2017 06:17:21 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Mar 2017 09:17:13 -0500
Message-Id: <1488377833-782-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-idna: update to version 2.4
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
X-List-Received-Date: Wed, 01 Mar 2017 14:17:21 -0000

Verified the license remains the same and updated the checksum for the
new copyright year.

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-idna.inc            | 10 +++++++---
 .../python/{python-idna_2.2.bb => python-idna_2.4.bb}          |  0
 .../python/{python3-idna_2.2.bb => python3-idna_2.4.bb}        |  0
 3 files changed, 7 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-idna_2.2.bb => python-idna_2.4.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-idna_2.2.bb => python3-idna_2.4.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-idna.inc b/meta-python/recipes-devtools/python/python-idna.inc
index ba5e341..bfcd87c 100644
--- a/meta-python/recipes-devtools/python/python-idna.inc
+++ b/meta-python/recipes-devtools/python/python-idna.inc
@@ -1,9 +1,13 @@
 SUMMARY = "Internationalised Domain Names in Applications"
 HOMEPAGE = "https://github.com/kjd/idna"
 LICENSE = "BSD-3-Clause & Python-2.0 & Unicode"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=134bdad79491c37bdae32811572b4bc6"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=c9ba5acd829579492fd5eb306c7a0565"
 
-SRC_URI[md5sum] = "e2d3f8a45d3d048a653eb186896e9e3e"
-SRC_URI[sha256sum] = "0ac27740937d86850010e035c6a10a564158a5accddf1aa24df89b0309252426"
+SRC_URI[md5sum] = "b27328914784bf3e4f6fae16f4b75ba9"
+SRC_URI[sha256sum] = "2a07165f6288f4b920aa8ab4357c1e59073c5d62e048a400510982769e039bd9"
+
+RDEPENDS_${PN}_class-target = "\
+    ${PYTHON_PN}-codecs \
+"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-idna_2.2.bb b/meta-python/recipes-devtools/python/python-idna_2.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-idna_2.2.bb
rename to meta-python/recipes-devtools/python/python-idna_2.4.bb
diff --git a/meta-python/recipes-devtools/python/python3-idna_2.2.bb b/meta-python/recipes-devtools/python/python3-idna_2.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-idna_2.2.bb
rename to meta-python/recipes-devtools/python/python3-idna_2.4.bb
-- 
2.7.4


