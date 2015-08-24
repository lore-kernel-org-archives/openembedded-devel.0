Return-Path: <dominic.sacre@gmx.de>
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	by mail.openembedded.org (Postfix) with ESMTP id 8F6FD76BF8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 15:28:29 +0000 (UTC)
Received: from dastp.fritz.box ([79.250.183.143]) by mail.gmx.com (mrgmx001)
	with ESMTPSA (Nemesis) id 0MOw4N-1ZPlKk0PVn-006Nrv;
	Mon, 24 Aug 2015 17:28:29 +0200
From: =?UTF-8?q?Dominic=20Sacr=C3=A9?= <dominic.sacre@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Aug 2015 17:27:55 +0200
Message-Id: <1440430077-551-7-git-send-email-dominic.sacre@gmx.de>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1440430077-551-1-git-send-email-dominic.sacre@gmx.de>
References: <1440430077-551-1-git-send-email-dominic.sacre@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K0:geKKBdVjYHLAh+kMIrCRFxx+4FVdPU+nbdiyreI9OoQ6hQCz0Rl
	fTixabKL82MmcUC3NOBas68V1rp5gMV8sBwi+Rgy8GOlRC5ROhH57844jfrWsnxlvslims7
	X6PqrZSUCOrx8o9jjJaGHLY9DPF7cre+zV2VImQ6u4U26NMunr7jYXdzgalGRsA+BjmEccH
	UZjCRJgutLVUy4aUUuDRQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:ka+oY4mNuXc=:iNoCtTsK2q/8mgd7ksqJpv
	yx8web6mYUn8qItN4VnIM9T/TP7ttoRS9K1Djw2s6Gr+Eb8LGywvGL0mUs8cR3hIOcpPvzEPL
	ZBy7Z+JXzzAsE9Qcb6HtEAivZCvCwiGzrGiHHD4zMIotyKfGjUt8rFb9wRBT3IsBG+3HRPdRK
	YLpZbAhxoAbsBFZhSkrukYYpUODi9G1r9n0IRq6iAmUTHGD5hdnzpnvYx0bMXnOH+iovYmkY7
	wulEx2ByDBlOWqij53NO2KsEeZEeKfmRafKk+NohVH/SDLQ8GBblfWU0zKU1YfDgoFvu82AwZ
	TBv2nhqF33z9W7bSYfTJaVDHfOQc9DWZSCCxIinBmDuHPneq/5gzO6sUAc+y9MCrW5CyD8b9r
	mHdREe24ZECieWWVcFn3M5FYY1/cLuLiEErAoZDJAbZV/AMqXsw0oKdBXFBUgylU/ykwcroK/
	8v4bSkRRGW0FopJh79w15IP2z2+WX7lqdwNpsbWfACKFJbI9knUz1cyPJUFzvykQA1QsgRoGC
	El8ELHm/JDQdj3cW+1jvphb5IlMNJnelYiq1qOdKi57reHt3lkY9YEwWdXcLL0pPxpH+5M0FB
	onkYYTFEWnZE9A/uI30rMukaBnxUfUb2NwCiap4Hb43by1Oif2aG2HFlNUMotWCJh3JKl8JTe
	fqHWCB4eGwBNp4GtHZXIEJt/5s1qDDlRDE3Wy2fM9asSg+HeC7pPndqEE2ebI0cNaZ09QdfNQ
	hWio0+Jy0HdnuDGB2jjWlTCEj9u141GNWQj5ug==
Subject: [meta-python][PATCH 6/8] python3-decorator: Add new recipe
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
X-List-Received-Date: Mon, 24 Aug 2015 15:28:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use a common .inc file for the python-decorator and python3-decorator
recipes.

Signed-off-by: Dominic Sacré <dominic.sacre@gmx.de>
---
 .../recipes-devtools/python/python-decorator.inc   | 20 ++++++++++++++++++++
 .../python/python-decorator_4.0.2.bb               | 22 +---------------------
 .../python/python3-decorator_4.0.2.bb              |  2 ++
 3 files changed, 23 insertions(+), 21 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-decorator.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-decorator_4.0.2.bb

diff --git a/meta-python/recipes-devtools/python/python-decorator.inc b/meta-python/recipes-devtools/python/python-decorator.inc
new file mode 100644
index 0000000..2c230ff
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-decorator.inc
@@ -0,0 +1,20 @@
+SUMMARY = "Python decorator utilities"
+HOMEPAGE = "http://pypi.python.org/pypi/decorator/"
+DESCRIPTION = "\
+The aim of the decorator module it to simplify the usage of decorators \
+for the average programmer, and to popularize decorators by showing \
+various non-trivial examples. Of course, as all techniques, decorators \
+can be abused and you should not try to solve every problem with a \
+decorator, just because you can."
+
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=41e24e0e235a97e60cdb5c4137fa2cd0"
+
+SRCNAME = "decorator"
+
+SRC_URI = "https://pypi.python.org/packages/source/d/decorator/decorator-${PV}.tar.gz"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+SRC_URI[md5sum] = "033c9563af492c4ce2680ee6ca481fa7"
+SRC_URI[sha256sum] = "1a089279d5de2471c47624d4463f2e5b3fc6a2cf65045c39bf714fc461a25206"
diff --git a/meta-python/recipes-devtools/python/python-decorator_4.0.2.bb b/meta-python/recipes-devtools/python/python-decorator_4.0.2.bb
index bda0d71..f262168 100644
--- a/meta-python/recipes-devtools/python/python-decorator_4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python-decorator_4.0.2.bb
@@ -1,22 +1,2 @@
-SUMMARY = "Python decorator utilities"
-HOMEPAGE = "http://pypi.python.org/pypi/decorator/"
-DESCRIPTION = "\
-The aim of the decorator module it to simplify the usage of decorators \
-for the average programmer, and to popularize decorators by showing \
-various non-trivial examples. Of course, as all techniques, decorators \
-can be abused and you should not try to solve every problem with a \
-decorator, just because you can."
-
-SECTION = "devel/python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=41e24e0e235a97e60cdb5c4137fa2cd0"
-
-SRCNAME = "decorator"
-
-SRC_URI = "https://pypi.python.org/packages/source/d/decorator/decorator-${PV}.tar.gz"
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
 inherit setuptools
-
-SRC_URI[md5sum] = "033c9563af492c4ce2680ee6ca481fa7"
-SRC_URI[sha256sum] = "1a089279d5de2471c47624d4463f2e5b3fc6a2cf65045c39bf714fc461a25206"
+require python-decorator.inc
diff --git a/meta-python/recipes-devtools/python/python3-decorator_4.0.2.bb b/meta-python/recipes-devtools/python/python3-decorator_4.0.2.bb
new file mode 100644
index 0000000..844cbdc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-decorator_4.0.2.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-decorator.inc
-- 
2.5.0


