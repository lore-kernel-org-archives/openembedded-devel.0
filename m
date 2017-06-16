Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 15495784B8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 16:50:01 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id x58so11517494qtc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 09:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=O2bRJb+G9rfJ1t0W9PfvmV2YJJSRednDs6SiI+zkOGk=;
	b=YKxJjL3P/kg4m6vPUZC1lwHhPuc84trDuvIjlikNXnap32Wj5hPDDjIeqUM08RrHCB
	AHG7aatrqqm/8fm3NajaJoBKiUn43j+BOPjpaXBh4uY+9OzauGvS6Eb/vZAarhwsHusw
	xOX5YwV+N130rz3MucJGkKFd+9xS9o4AydOJwt0GyBzkTLQnjCtH999p1IbCnBYnLdk7
	zyj+hxBzAPaFmpzzhjv8yN+vAHi+2+oQAl0zuUa1S1wO4qeeiicouDz+bunDqiyT/oLz
	VAs1o1PkDAcYSWpbo1QyQMf3+IPh+E7LbnC2SaAEhwCG4+/fHGRfy//fGkF5kQhB9VcI
	KNzQ==
X-Gm-Message-State: AKS2vOyRG/E8itkvQn3Hmyg6D8Xh9DvUNG7LUvu33duMuUrLCkd6D8uC
	bmTPzFv8by9nhBxVrCQ=
X-Received: by 10.200.57.60 with SMTP id s57mr13391703qtb.141.1497631802872;
	Fri, 16 Jun 2017 09:50:02 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4]) by smtp.gmail.com with ESMTPSA id
	s130sm1732438qke.66.2017.06.16.09.50.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Jun 2017 09:50:02 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jun 2017 12:49:50 -0400
Message-Id: <1497631790-29213-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-lxml: update to version 3.8.0
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
X-List-Received-Date: Fri, 16 Jun 2017 16:50:02 -0000

Verified license terms remain the same and updated the checksum

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-lxml.inc                 | 6 +++---
 .../python/{python-lxml_3.7.3.bb => python-lxml_3.8.0.bb}           | 0
 .../python/{python3-lxml_3.7.3.bb => python3-lxml_3.8.0.bb}         | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-lxml_3.7.3.bb => python-lxml_3.8.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-lxml_3.7.3.bb => python3-lxml_3.8.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
index d5e6ae4..c6ff160 100644
--- a/meta-python/recipes-devtools/python/python-lxml.inc
+++ b/meta-python/recipes-devtools/python/python-lxml.inc
@@ -7,7 +7,7 @@ C14N and much more."
 HOMEPAGE = "http://codespeak.net/lxml"
 SECTION = "devel/python"
 LICENSE = "BSD & GPLv2 & MIT & PSF"
-LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=f9f1dc24f720c143c2240df41fe5073b \
+LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
                     file://doc/licenses/elementtree.txt;md5=eb34d036a6e3d56314ee49a6852ac891 \
                     file://doc/licenses/BSD.txt;md5=700a1fc17f4797d4f2d34970c8ee694b \
                     file://doc/licenses/GPL.txt;md5=94d55d512a9ba36caa9b7df079bae19f \
@@ -18,8 +18,8 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=f9f1dc24f720c143c2240df41fe5073b \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[md5sum] = "075692ce442e69bbd604d44e21c02753"
-SRC_URI[sha256sum] = "aa502d78a51ee7d127b4824ff96500f0181d3c7826e6ee7b800d068be79361c7"
+SRC_URI[md5sum] = "e54e2fae44d684d6b9c636fe189e93ff"
+SRC_URI[sha256sum] = "736f72be15caad8116891eb6aa4a078b590d231fdc63818c40c21624ac71db96"
 
 DISTUTILS_BUILD_ARGS += " \
                      --with-xslt-config='pkg-config libxslt' \
diff --git a/meta-python/recipes-devtools/python/python-lxml_3.7.3.bb b/meta-python/recipes-devtools/python/python-lxml_3.8.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-lxml_3.7.3.bb
rename to meta-python/recipes-devtools/python/python-lxml_3.8.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-lxml_3.7.3.bb b/meta-python/recipes-devtools/python/python3-lxml_3.8.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-lxml_3.7.3.bb
rename to meta-python/recipes-devtools/python/python3-lxml_3.8.0.bb
-- 
2.7.4


