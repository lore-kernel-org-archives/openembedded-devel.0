Return-Path: <dominic.sacre@gmx.de>
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	by mail.openembedded.org (Postfix) with ESMTP id 291B276BEA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 15:28:29 +0000 (UTC)
Received: from dastp.fritz.box ([79.250.183.143]) by mail.gmx.com (mrgmx001)
	with ESMTPSA (Nemesis) id 0LsUDg-1YjrdN2VlQ-0120eK;
	Mon, 24 Aug 2015 17:28:29 +0200
From: =?UTF-8?q?Dominic=20Sacr=C3=A9?= <dominic.sacre@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Aug 2015 17:27:57 +0200
Message-Id: <1440430077-551-9-git-send-email-dominic.sacre@gmx.de>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1440430077-551-1-git-send-email-dominic.sacre@gmx.de>
References: <1440430077-551-1-git-send-email-dominic.sacre@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K0:gMhqNUEcCs0h69ofPfNZbGvn3eoWWbeLbbxdpFvWsWpNndTqDOc
	qkc1M/IRWfvmG+ufJyWduosxs+wpdu3HBO0c8JfmzScVfaN7EoEXMM/7Sef0fx+y++8E96i
	pTnfjuKaYdCJh2Uv/mgDLlY3V/W+lc62pUjiKEBCtfKWvxcmQ+WyzTbTRhhpAWvpCNj88cT
	h17YwV57fRxdplGnmkByQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:btddhcp0eE0=:LvwQpgbCBSYYZRF6nM50Bb
	Dt/lHo5+giLXjTFijBFqXAwNG1NICpWgLuwjdWfJwg20QTdsmkpElSFlN8qkjcAlu5UFPubhu
	7TjrC5L+5vGNU7JN9OE8xtVfevGBnm4rwCjljhd46i1rZB2rcUSiaFl9O7Z67IX0ggdG+V34W
	YFhrY47qzCxYgSU7kq9FTikeNBJucE1BPR7uDB93THnvafjdV1yAwRr2YaoblJWbDomSAChpX
	81aySCjmIFrV2KLgs61TnAQETTxKdSbf2q09iNBEb6evI2uYRFlzHm49vULq+GigwsyfVke9O
	g7q9wjUwEpbDay6vVgukgYdoC/Q6wnAncKPeGKbU/A6DRcOYRilsUveGdQ/GSxdyfMoWD3vwU
	DMrMmY6QQUzNjWiEm+pi8Sm0teyhvpPlYp8gBvodskmoZ7hbcHGE51FMW9FWtwP1apWytQK8b
	eh7hOEU7TKhI1QsJYvwKLkGcXyud6dDj2zdflys9GCuRYdf0IoABwaG8yB8GTIbj2ZZPc06Fd
	ZybtrgFn8tTqAzfKwWZZSUqkzoVBm5q2hOfHsTSGGPVz+55DuR27yIwZcw1gfqmNQ3rGa2wXZ
	C6wsaXtPdvB2tsLT5ge8aCsjLSdx4HZMklm/6ngqSp99mvz9OrNX5uHXtkieE6HWyyAuBSFR3
	owpIciS4KH5HFR6TdKZG4qW35hq2gIaKneaatUIo0Gp6KgnB4+Rlxp0n4Id/TajNK8OgVmOFc
	O1m4MQHnv9IfCA2y5NSjrxzjOaA9p0A1+eV2rw==
Subject: [meta-python][PATCH 8/8] python3-pyinotify: Add new recipe
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

Use a common .inc file for the python-pyinotify and python3-pyinotify
recipes.

Signed-off-by: Dominic Sacré <dominic.sacre@gmx.de>
---
 .../recipes-devtools/python/python-pyinotify.inc        | 15 +++++++++++++++
 .../recipes-devtools/python/python-pyinotify_0.9.6.bb   | 17 +----------------
 .../recipes-devtools/python/python3-pyinotify_0.9.6.bb  |  2 ++
 3 files changed, 18 insertions(+), 16 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-pyinotify.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-pyinotify_0.9.6.bb

diff --git a/meta-python/recipes-devtools/python/python-pyinotify.inc b/meta-python/recipes-devtools/python/python-pyinotify.inc
new file mode 100644
index 0000000..285fe33
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyinotify.inc
@@ -0,0 +1,15 @@
+DESCRIPTION = "Python pyinotify: Linux filesystem events monitoring"
+HOMEPAGE = "https://pypi.python.org/pypi/pyinotify"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ab173cade7965b411528464589a08382"
+
+RDEPENDS_${PN} += "python-threading python-io python-subprocess python-misc python-shell"
+
+SRCNAME = "pyinotify"
+SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "8e580fa1ff3971f94a6f81672b76c406"
+SRC_URI[sha256sum] = "9c998a5d7606ca835065cdabc013ae6c66eb9ea76a00a1e3bc6e0cfe2b4f71f4"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
diff --git a/meta-python/recipes-devtools/python/python-pyinotify_0.9.6.bb b/meta-python/recipes-devtools/python/python-pyinotify_0.9.6.bb
index 42956ce..d1f84c3 100644
--- a/meta-python/recipes-devtools/python/python-pyinotify_0.9.6.bb
+++ b/meta-python/recipes-devtools/python/python-pyinotify_0.9.6.bb
@@ -1,17 +1,2 @@
-DESCRIPTION = "Python pyinotify: Linux filesystem events monitoring"
-HOMEPAGE = "https://pypi.python.org/pypi/pyinotify"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ab173cade7965b411528464589a08382"
-
-RDEPENDS_${PN} += "python-threading python-io python-subprocess python-misc python-shell"
-
-SRCNAME = "pyinotify"
-SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "8e580fa1ff3971f94a6f81672b76c406"
-SRC_URI[sha256sum] = "9c998a5d7606ca835065cdabc013ae6c66eb9ea76a00a1e3bc6e0cfe2b4f71f4"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
 inherit setuptools
+require python-pyinotify.inc
diff --git a/meta-python/recipes-devtools/python/python3-pyinotify_0.9.6.bb b/meta-python/recipes-devtools/python/python3-pyinotify_0.9.6.bb
new file mode 100644
index 0000000..b3bab98
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyinotify_0.9.6.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-pyinotify.inc
-- 
2.5.0


