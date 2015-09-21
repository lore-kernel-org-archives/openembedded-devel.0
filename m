Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 26F75756C5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Sep 2015 09:25:26 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so136963246wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Sep 2015 02:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=UeOxzUCUS1ezkZhpgcLNQFdtORbAvWoIvJpIdRvTasU=;
	b=YTf2ylOVHzCGDyYYX/O3nezl7JwkdaB1yerFGRksQ+9BEd8whiqGrSx2Dw+SGzwlun
	riLa8QomZjwFJmns/UWCwrdYxdb4lvYkfxcMHDdklG9XtRy/bkVUgXsDKrvERQBG0Yf0
	wj0FOLgBLYOH5JcidiobL8GFisPsg9KRX0hADuHxCxiDccU/35wZoqJrzQt8GGZ1LBKj
	PBJnBO5GFXdgA8DWXcd7Rx+FBbpRSv/sapb7XaQnluC8t+RWuh3OTcQ+w/vKssIcSC8h
	IAV4HG0dAineBp6EIJjeLvU+eYTSA/4Kljb9Gl63taqiRvlC07HNClkQq6rjT3dzJxdO
	7F7w==
X-Received: by 10.194.171.3 with SMTP id aq3mr22106435wjc.54.1442827526047;
	Mon, 21 Sep 2015 02:25:26 -0700 (PDT)
Received: from chl500346.neratec.local (mail.neratec.com. [46.140.151.2])
	by smtp.gmail.com with ESMTPSA id
	c2sm12455009wiy.11.2015.09.21.02.25.25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Sep 2015 02:25:25 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Sep 2015 11:25:18 +0200
Message-Id: <1442827518-10891-1-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
Cc: fabio.berton@ossystems.com.br
Subject: [PATCH] pyroute2: update to 0.3.14, fix depends, fix license
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Sep 2015 09:25:27 -0000

---
 .../python/python-pyroute2_0.3.12.bb               | 14 -------------
 .../python/python-pyroute2_0.3.14.bb               | 24 ++++++++++++++++++++++
 2 files changed, 24 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pyroute2_0.3.12.bb
 create mode 100644 meta-python/recipes-devtools/python/python-pyroute2_0.3.14.bb

diff --git a/meta-python/recipes-devtools/python/python-pyroute2_0.3.12.bb b/meta-python/recipes-devtools/python/python-pyroute2_0.3.12.bb
deleted file mode 100644
index d809d97..0000000
--- a/meta-python/recipes-devtools/python/python-pyroute2_0.3.12.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "A pure Python netlink and Linux network configuration library"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=270323035ef766597dabd91747c36e3d"
-
-SRC_URI[md5sum] = "5d83ec82acb54ab88c98f0d25d13308b"
-SRC_URI[sha256sum] = "c0e1637a75e099104f14d9e03fd5a698dfcc923a22fbfac4a19bd7e94d1fcaa5"
-
-SRC_URI += "file://import-simplejson-as-json.patch"
-
-inherit pypi
-
-RDEPENDS_${PN} = "python-distutils \
-                  python-simplejson \
-                  "
diff --git a/meta-python/recipes-devtools/python/python-pyroute2_0.3.14.bb b/meta-python/recipes-devtools/python/python-pyroute2_0.3.14.bb
new file mode 100644
index 0000000..3fc5142
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyroute2_0.3.14.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "A pure Python netlink and Linux network configuration library"
+LICENSE = "GPLv2 & Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://LICENSE.Apache.v2;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI[md5sum] = "1e7e771702056e61cf522cccc39ea09e"
+SRC_URI[sha256sum] = "aed742a7dbe55eb7f02dbb26719f554b9e92198c4b3c7ac501ad03bbb6421962"
+
+SRC_URI += "file://import-simplejson-as-json.patch"
+
+inherit pypi
+
+RDEPENDS_${PN} += "\
+  python-distutils \
+  python-simplejson \
+  python-multiprocessing \
+  python-io python-pprint \
+  python-pickle \
+  python-logging \
+  python-threading \
+  python-textutils \
+  python-subprocess \
+  python-netclient \
+"
-- 
2.4.3


