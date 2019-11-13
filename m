Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 887B27D2AE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 00:23:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xAD0Nf4l005679
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2019 16:23:41 -0800 (PST)
Received: from yow-tgamblin-fedora1.wrs.com (128.224.56.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Tue, 12 Nov 2019 16:23:41 -0800
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 12 Nov 2019 19:23:38 -0500
Message-ID: <20191113002339.2625858-2-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191113002339.2625858-1-trevor.gamblin@windriver.com>
References: <20191113002339.2625858-1-trevor.gamblin@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 2/3] python3-flask: upgrade from 1.0.2 to 1.1.1
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
X-List-Received-Date: Wed, 13 Nov 2019 00:23:40 -0000
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta-python/recipes-devtools/python/python-flask.inc        | 6 +++---
 .../python/{python-flask_1.0.2.bb => python-flask_1.1.1.bb} | 0
 .../{python3-flask_1.0.2.bb => python3-flask_1.1.1.bb}      | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-flask_1.0.2.bb => python-flask_1.1.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-flask_1.0.2.bb => python3-flask_1.1.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-flask.inc b/meta-python/recipes-devtools/python/python-flask.inc
index 10dca43bb..1263383da 100644
--- a/meta-python/recipes-devtools/python/python-flask.inc
+++ b/meta-python/recipes-devtools/python/python-flask.inc
@@ -4,10 +4,10 @@ Flask is a microframework for Python based on Werkzeug, Jinja 2 and good \
 intentions. And before you ask: It’s BSD licensed!"
 HOMEPAGE = "https://github.com/mitsuhiko/flask/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c011883ac26229b8ba3084f55c7664c6"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[md5sum] = "824f0f20aae1f44c9c7dc4054adb7969"
-SRC_URI[sha256sum] = "2271c0070dbcb5275fad4a82e29f23ab92682dc45f9dfbc22c02ba9b9322ce48"
+SRC_URI[md5sum] = "0e3ed44ece1c489ed835d1b7047e349c"
+SRC_URI[sha256sum] = "13f9f196f330c7c2c5d7a5cf91af894110ca0215ac051b5844701f2bfd934d52"
 
 CLEANBROKEN = "1"
 
diff --git a/meta-python/recipes-devtools/python/python-flask_1.0.2.bb b/meta-python/recipes-devtools/python/python-flask_1.1.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-flask_1.0.2.bb
rename to meta-python/recipes-devtools/python/python-flask_1.1.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-flask_1.0.2.bb b/meta-python/recipes-devtools/python/python3-flask_1.1.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-flask_1.0.2.bb
rename to meta-python/recipes-devtools/python/python3-flask_1.1.1.bb
-- 
2.23.0


