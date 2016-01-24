Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f68.google.com (mail-qg0-f68.google.com
	[209.85.192.68])
	by mail.openembedded.org (Postfix) with ESMTP id 04510770CA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2016 13:18:02 +0000 (UTC)
Received: by mail-qg0-f68.google.com with SMTP id b35so8313244qge.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2016 05:18:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Kqxiza1MsWc9HrEoJoMngN0ZN6Z9pjCXJQqEvruke68=;
	b=fwgvAkB6Lk6uz8hz/tymmBqty1RyrjEr54rMfK6bEA3ISZ4gSheKt4p+fAJdhkiCoy
	pgShf3FlvRBLz+SueBIiP9ppSGwF/4DLc7tbGyER0Ar3IIPenNPUu3OrSG4sxWlgsgoe
	1LCHIdrtUFL165TcPkJ8PSiY973xM9ew4RZ+O9WchAmXoUljzWbNykCik7yBekckJk8y
	Gr59QVCHdfxhCcb2Awcnl/zDS0MFQtARr1jOzy6dQ0HBqZTBol8tgOCCxklP7RxwJw5s
	Xx0c+eTQZIRFZd/6ox9UejqG6QJC+2WQYk6IVoI0YYrnS29poAZOCTyCoJ6PcITufetx
	l5pA==
X-Gm-Message-State: AG10YOR+czag35LVzh8jWZZG1dc3AerQWAb03Q9upUAtpXlH0G5BLW0N0HeG8xzXh0LXgQ==
X-Received: by 10.140.22.210 with SMTP id 76mr15078717qgn.70.1453641483371;
	Sun, 24 Jan 2016 05:18:03 -0800 (PST)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	d188sm6865927qkb.9.2016.01.24.05.18.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Jan 2016 05:18:02 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jan 2016 08:17:39 -0500
Message-Id: <603b9c9d49db9fee00b9685bf6113c63df2d5dc2.1453589999.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
Subject: [meta-python][PATCH 06/13] python-lxml: update to 3.5.0
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
X-List-Received-Date: Sun, 24 Jan 2016 13:18:03 -0000

---
 meta-python/recipes-devtools/python/python-lxml.inc                 | 6 ++++--
 .../python/{python-lxml_3.4.4.bb => python-lxml_3.5.0.bb}           | 0
 .../python/{python3-lxml_3.4.4.bb => python3-lxml_3.5.0.bb}         | 0
 3 files changed, 4 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-lxml_3.4.4.bb => python-lxml_3.5.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-lxml_3.4.4.bb => python3-lxml_3.5.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
index 1d5d7f4..ac0f0bd 100644
--- a/meta-python/recipes-devtools/python/python-lxml.inc
+++ b/meta-python/recipes-devtools/python/python-lxml.inc
@@ -7,8 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=f9f1dc24f720c143c2240df41fe5073b"
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[md5sum] = "a9a65972afc173ec7a39c585f4eea69c"
-SRC_URI[sha256sum] = "b3d362bac471172747cda3513238f115cbd6c5f8b8e6319bf6a97a7892724099"
+PYPI_PACKAGE = "lxml" 
+
+SRC_URI[md5sum] = "9f0c5f1eb43ff44d5455dab4b4efbe73"
+SRC_URI[sha256sum] = "349f93e3a4b09cc59418854ab8013d027d246757c51744bf20069bc89016f578"
 
 DISTUTILS_BUILD_ARGS += " \
                      --with-xslt-config='pkg-config libxslt' \
diff --git a/meta-python/recipes-devtools/python/python-lxml_3.4.4.bb b/meta-python/recipes-devtools/python/python-lxml_3.5.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-lxml_3.4.4.bb
rename to meta-python/recipes-devtools/python/python-lxml_3.5.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-lxml_3.4.4.bb b/meta-python/recipes-devtools/python/python3-lxml_3.5.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-lxml_3.4.4.bb
rename to meta-python/recipes-devtools/python/python3-lxml_3.5.0.bb
-- 
1.9.1


