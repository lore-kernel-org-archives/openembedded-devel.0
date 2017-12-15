Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DBC8978844
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Dec 2017 20:22:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vBFKMKif002639
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Dec 2017 12:22:20 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 15 Dec 2017 12:22:20 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Dec 2017 15:22:00 -0500
Message-ID: <1513369321-18274-8-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1513369321-18274-1-git-send-email-mark.asselstine@windriver.com>
References: <1513369321-18274-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][v2][rocko][PATCH 7/8] python-attrs: add an initial recipe for version 17.2.0
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
X-List-Received-Date: Fri, 15 Dec 2017 20:22:19 -0000
Content-Type: text/plain

From: Derek Straka <derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---

Cherry-pick from master
bd827cb9ff57b8e42768add8e8b206c95cd6aea2
                                                                                                                                                                                                                  meta-python/recipes-devtools/python/python-attrs.inc        | 9 +++++++++
 meta-python/recipes-devtools/python/python-attrs_17.2.0.bb  | 2 ++
 meta-python/recipes-devtools/python/python3-attrs_17.2.0.bb | 2 ++
 3 files changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-attrs.inc
 create mode 100644 meta-python/recipes-devtools/python/python-attrs_17.2.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-attrs_17.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python-attrs.inc b/meta-python/recipes-devtools/python/python-attrs.inc
new file mode 100644
index 0000000..85073e9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-attrs.inc
@@ -0,0 +1,9 @@
+DESCRIPTION = "Classes Without Boilerplate"
+HOMEPAGE = "http://www.attrs.org/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d4ab25949a73fe7d4fdee93bcbdbf8ff"
+
+SRC_URI[md5sum] = "3b7136a570f3ff8a4ff42e7360073f9f"
+SRC_URI[sha256sum] = "5d4d1b99f94d69338f485984127e4473b3ab9e20f43821b0e546cc3b2302fd11"
+
+inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-attrs_17.2.0.bb b/meta-python/recipes-devtools/python/python-attrs_17.2.0.bb
new file mode 100644
index 0000000..a6fdf15
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-attrs_17.2.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-attrs.inc
diff --git a/meta-python/recipes-devtools/python/python3-attrs_17.2.0.bb b/meta-python/recipes-devtools/python/python3-attrs_17.2.0.bb
new file mode 100644
index 0000000..c34693f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-attrs_17.2.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-attrs.inc
-- 
2.7.4


