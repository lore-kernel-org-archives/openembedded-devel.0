Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6C46C72FC3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 00:13:57 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id s186so2792522qkb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 16:13:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MV1AdXh8GSvbbpcMGzNH1DoChUw6s9vM8t8LKbL2Ung=;
	b=V/H6G5qEHG5qlo0aj4KK+kNPxooC8pjTyF1poAhOgbqWpWVNt8tiaDApzLoFxP11ub
	px2vTModIRlXz5hJ99d3jsVxevac9C15RZXXl44t/oqA08Dn4NM3ds0RhkgWwOuhwgik
	2N5YUpgEcHQzjwb2XNkCVlEVjJK2/8akfgDiFX02TD6M/FJjw2Icjzy/m0wXmI/sBjoz
	D/twGriSDQj0hIULYdeJvTkj9hsyA788XXTW5uUUV9ysD0pmYlzDIQ2hhxr8173QyiSV
	XCy8xF3JK68qJ1PnoKbzLsiSmKGwM2nLE0AYhn+yOy+CicCLaE7KzS9fVXFQ/X09ROq+
	5kUA==
X-Gm-Message-State: AMke39lNeqdcbAZ4LMx8FNQ+BPuYrT5Uc35mdKLrefpiaaP3nKEC3T/s1L8XGXuPAv1gfg==
X-Received: by 10.55.136.2 with SMTP id k2mr31758298qkd.310.1487808838898;
	Wed, 22 Feb 2017 16:13:58 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224])
	by smtp.gmail.com with ESMTPSA id 34sm1724840qtx.16.2017.02.22.16.13.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Feb 2017 16:13:58 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2017 19:13:50 -0500
Message-Id: <1487808830-25942-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCHv2] python-pyasn1: update to version 0.2.2
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
X-List-Received-Date: Thu, 23 Feb 2017 00:13:57 -0000

Verify the license terms remain intact and update the location
and checksum to match the latest copyright modifications

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pyasn1.inc               | 6 +++---
 .../python/{python-pyasn1_0.1.9.bb => python-pyasn1_0.2.2.bb}       | 0
 .../python/{python3-pyasn1_0.1.9.bb => python3-pyasn1_0.2.2.bb}     | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyasn1_0.1.9.bb => python-pyasn1_0.2.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyasn1_0.1.9.bb => python3-pyasn1_0.2.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyasn1.inc b/meta-python/recipes-devtools/python/python-pyasn1.inc
index 72cabc4..e740305 100644
--- a/meta-python/recipes-devtools/python/python-pyasn1.inc
+++ b/meta-python/recipes-devtools/python/python-pyasn1.inc
@@ -1,10 +1,10 @@
 SUMMARY = "Python library implementing ASN.1 types."
 HOMEPAGE = "http://pyasn1.sourceforge.net/"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=425e62320d430219736139b134db2fc4"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=280606d9c18f200e03e0c247ac61475a"
 
-SRC_URI[md5sum] = "f00a02a631d4016818659d1cc38d229a"
-SRC_URI[sha256sum] = "853cacd96d1f701ddd67aa03ecc05f51890135b7262e922710112f12a2ed2a7f"
+SRC_URI[md5sum] = "800d0114db2084f7256586dadf37d1aa"
+SRC_URI[sha256sum] = "6b42f96b942406712e0be5ea2bbbc57d8f30c7835a4904c9c195cc669736d435"
 
 RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-lang \
diff --git a/meta-python/recipes-devtools/python/python-pyasn1_0.1.9.bb b/meta-python/recipes-devtools/python/python-pyasn1_0.2.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyasn1_0.1.9.bb
rename to meta-python/recipes-devtools/python/python-pyasn1_0.2.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyasn1_0.1.9.bb b/meta-python/recipes-devtools/python/python3-pyasn1_0.2.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyasn1_0.1.9.bb
rename to meta-python/recipes-devtools/python/python3-pyasn1_0.2.2.bb
-- 
2.7.4


