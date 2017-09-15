Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 88EB2785D5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 19:53:24 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id f24so2116630qte.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 12:53:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zkY8UXTyhRQ7PW6cZdSv/x0ngi7LCkKcv0yFq17TDS8=;
	b=LXIk5wume28QS5/+gLZDhEF9rlA8XsfjIPaOSdZWDw+1hJAK3XRo5zas8W3Zrpbumg
	tcs7nvTm1uikqig0hSmNnyA0DvYWvzb1FvzLcX1ORuENV9RyWdGaqjHHdIVCFHq9n4v4
	RQfDBTehFBxnkq9/YHYpt9VqwYQoxo/J5BbWFEM6KgDt9e2JNmhEX92ktWEPoO22rGLB
	6GNRI7CdCSn+cbVzquduRkFPwOpzfsMQ+pMuRk9qIXe2E0M4lUaz9GR0YYukm6zQUeZF
	gIcElrz5FqP3FFjnd+8mRI2uRr2QlxFghwpChm9W/lL0aBDPBKub4LvTHOlL3Oxeb6JH
	//ew==
X-Gm-Message-State: AHPjjUjOoo/Gke0DnVqRdcblTFGolfMhGQ7MU3JFN/Hak3g33yeems4U
	YiAlEbDBRXDQbZ/GinY=
X-Google-Smtp-Source: AOwi7QDcChJ9oQG3S+VtnKUxmSBGim5wD2/hpG2mZ07LhFjY2uCE8xtRkSMo1WG6GBiVfUz6X+1V6A==
X-Received: by 10.237.34.56 with SMTP id n53mr27393277qtc.140.1505505205106;
	Fri, 15 Sep 2017 12:53:25 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id r1sm1087949qtc.90.2017.09.15.12.53.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Sep 2017 12:53:24 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Sep 2017 15:53:16 -0400
Message-Id: <1505505196-7888-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pymisp: update to version 2.4.79
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
X-List-Received-Date: Fri, 15 Sep 2017 19:53:24 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pymisp.inc                 | 4 ++--
 .../python/{python-pymisp_2.4.77.bb => python-pymisp_2.4.79.bb}       | 0
 .../python/{python3-pymisp_2.4.77.bb => python3-pymisp_2.4.79.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pymisp_2.4.77.bb => python-pymisp_2.4.79.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.77.bb => python3-pymisp_2.4.79.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pymisp.inc b/meta-python/recipes-devtools/python/python-pymisp.inc
index 31bbaf9..75cd05b 100644
--- a/meta-python/recipes-devtools/python/python-pymisp.inc
+++ b/meta-python/recipes-devtools/python/python-pymisp.inc
@@ -1,9 +1,9 @@
 DESCRIPTION = "Python API for MISP"
 HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=235682336bb6202583199ef1a9f7a61a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
 SRC_URI[md5sum] = "7e3f33ba1726d49df590c0d0a56c5672"
-SRC_URI[sha256sum] = "e957f700be919a107d36279e8c75d1e1d56e0bb14daa896df05332a081430158"
+SRC_URI[md5sum] = "88a85d2e7633c4bc3f1a375ff2be3bfc"
 
 RDEPENDS_${PN} += " ${PYTHON_PN}-requests ${PYTHON_PN}-json ${PYTHON_PN}-jsonschema"
diff --git a/meta-python/recipes-devtools/python/python-pymisp_2.4.77.bb b/meta-python/recipes-devtools/python/python-pymisp_2.4.79.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pymisp_2.4.77.bb
rename to meta-python/recipes-devtools/python/python-pymisp_2.4.79.bb
diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.77.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.79.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.77.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.79.bb
-- 
2.7.4


