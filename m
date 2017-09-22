Return-Path: <guy@guy-morand.ch>
Received: from smtp-sh2.infomaniak.ch (smtp-sh2.infomaniak.ch [128.65.195.6])
	by mail.openembedded.org (Postfix) with ESMTP id CE7ED7839A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Sep 2017 10:40:23 +0000 (UTC)
Received: from smtp5.infomaniak.ch (smtp5.infomaniak.ch [83.166.132.18])
	by smtp-sh.infomaniak.ch (8.14.5/8.14.5) with ESMTP id v8MAOvcv017334
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 22 Sep 2017 12:24:57 +0200
Received: from localhost.localdomain ([62.192.30.6]) (authenticated bits=0)
	by smtp5.infomaniak.ch (8.14.5/8.14.5) with ESMTP id v8MAOspZ039131
	(version=TLSv1/SSLv3 cipher=AES128-SHA256 bits=128 verify=NO);
	Fri, 22 Sep 2017 12:24:57 +0200
From: Guy Morand <guy@guy-morand.ch>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Sep 2017 12:24:50 +0200
Message-Id: <1506075891-4205-2-git-send-email-guy@guy-morand.ch>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1506075891-4205-1-git-send-email-guy@guy-morand.ch>
References: <1506075891-4205-1-git-send-email-guy@guy-morand.ch>
MIME-Version: 1.0
X-Antivirus: Dr.Web (R) for Unix mail servers drweb plugin ver.6.0.2.8
X-Antivirus-Code: 0x100000
Subject: [meta-python][PATCH 2/3] Add python3 cycler
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
X-List-Received-Date: Fri, 22 Sep 2017 10:40:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

---
 .../recipes-devtools/python/python-cycler/python-cycler.inc | 13 +++++++++++++
 .../python/python-cycler/python3-cycler_0.10.0.bb           |  6 ++++++
 2 files changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-cycler/python-cycler.inc
 create mode 100644 meta-python/recipes-devtools/python/python-cycler/python3-cycler_0.10.0.bb

diff --git a/meta-python/recipes-devtools/python/python-cycler/python-cycler.inc b/meta-python/recipes-devtools/python/python-cycler/python-cycler.inc
new file mode 100644
index 0000000..3351b27
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-cycler/python-cycler.inc
@@ -0,0 +1,13 @@
+SUMMARY  = "cycler consists of a class Cycler and a concatenation"
+DESCRIPTION = "The public API of cycler consists of a class Cycler, a \
+factory function cycler(), and a concatenation function concat(). The \
+factory function provides a simple interface for creating ‘base’ \
+Cycler objects while the class takes care of the composition and \
+iteration logic."
+HOMEPAGE = "http://matplotlib.org/cycler/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7713fe42cd766b15c710e19392bfa811"
+
+PYPI_PACKAGE = "cycler"
+
+inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-cycler/python3-cycler_0.10.0.bb b/meta-python/recipes-devtools/python/python-cycler/python3-cycler_0.10.0.bb
new file mode 100644
index 0000000..518adba
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-cycler/python3-cycler_0.10.0.bb
@@ -0,0 +1,6 @@
+inherit setuptools3
+require python-cycler.inc
+
+SRC_URI[md5sum] = "4cb42917ac5007d1cdff6cccfe2d016b"
+SRC_URI[sha256sum] = "cd7b2d1018258d7247a71425e9f26463dfb444d411c39569972f4ce586b0c9d8"
+
-- 
2.7.4


