Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.9185.1601196219250801485
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2020 01:43:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 08R8hX9I023578
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Sun, 27 Sep 2020 01:43:33 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Sun, 27 Sep 2020 01:43:33 -0700
From: "kai" <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>, <ticotimo@gmail.com>
Subject: [meta-python][PATCH v2 1/2] python3-iniconfig: add recipe
Date: Sun, 27 Sep 2020 16:43:19 +0800
Message-ID: <20200927084320.17334-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200927084320.17334-1-kai.kang@windriver.com>
References: <20200927084320.17334-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

python3-iniconfig is required by pytest 6.1.0. And add it to
packagegroup-meta-python.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../packagegroups/packagegroup-meta-python.bb             | 1 +
 .../recipes-devtools/python/python3-iniconfig_1.0.1.bb    | 8 ++++++++
 2 files changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-iniconfig_1.0.1.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 582037be5..0f032e65e 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -302,6 +302,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-sdnotify \
     python3-pycodestyle \
     python3-pytest \
+    python3-iniconfig \
     python3-speaklater \
     python3-wtforms \
     python3-speedtest-cli \
diff --git a/meta-python/recipes-devtools/python/python3-iniconfig_1.0.1.bb b/meta-python/recipes-devtools/python/python3-iniconfig_1.0.1.bb
new file mode 100644
index 000000000..9ed0e033b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-iniconfig_1.0.1.bb
@@ -0,0 +1,8 @@
+SUMMARY = "A small and simple INI-file parser module"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
+
+SRC_URI[sha256sum] = "e5f92f89355a67de0595932a6c6c02ab4afddc6fcdc0bfc5becd0d60884d3f69"
+
+inherit pypi setuptools3
-- 
2.17.1

