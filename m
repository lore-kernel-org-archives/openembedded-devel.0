Received: from [194.100.97.46] (helo=mail.inoi.fi)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <petri.lehtinen+openembedded-devel@inoi.fi>)
	id 1MsX07-0005IT-Ka for openembedded-devel@lists.openembedded.org;
	Tue, 29 Sep 2009 09:19:58 +0200
Received: from mail.inoi.fi (localhost.localdomain [127.0.0.1])
	by mail.inoi.fi (Postfix) with ESMTP id 2C7E621375;
	Tue, 29 Sep 2009 10:16:27 +0300 (EEST)
Received: from localhost.localdomain (petri.int.inoi.fi [10.105.0.205])
	by mail.inoi.fi (Postfix) with ESMTP id 0BB0D21201;
	Tue, 29 Sep 2009 10:16:27 +0300 (EEST)
From: Petri Lehtinen <petri.lehtinen+openembedded-devel@inoi.fi>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Sep 2009 10:19:13 +0300
Message-Id: <1254208753-16504-1-git-send-email-petri.lehtinen+openembedded-devel@inoi.fi>
X-Mailer: git-send-email 1.6.4.4
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 194.100.97.46
X-SA-Exim-Mail-From: petri.lehtinen+openembedded-devel@inoi.fi
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Petri Lehtinen <petri.lehtinen@inoi.fi>
Subject: [PATCH] python-flup: Bump to version 1.0.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Sep 2009 07:19:58 -0000

From: Petri Lehtinen <petri.lehtinen@inoi.fi>


Signed-off-by: Petri Lehtinen <petri.lehtinen@inoi.fi>
---
 conf/checksums.ini                  |    4 ++++
 recipes/python/python-flup_1.0.1.bb |   11 -----------
 recipes/python/python-flup_1.0.2.bb |   11 +++++++++++
 3 files changed, 15 insertions(+), 11 deletions(-)
 delete mode 100644 recipes/python/python-flup_1.0.1.bb
 create mode 100644 recipes/python/python-flup_1.0.2.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 74bb1cb..fe9c761 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -6174,6 +6174,10 @@ sha256=a24640d8ca9c485d7611880193f18e5ae62af07e3b9464904f3602277f1d4097
 md5=414181781fb0923f884a38503e8e56da
 sha256=270e2e423a0b8e90091fd6f38422c488b67a23494d671764b9ed2e17ca802e16
 
+[http://pypi.python.org/packages/source/f/flup/flup-1.0.2.tar.gz]
+md5=24dad7edc5ada31dddd49456ee8d5254
+sha256=4bad317a5fc1ce3d4fe5e9b6d846ec38a8023e16876785d4f88102f2c8097dd9
+
 [http://pypi.python.org/packages/source/f/flup/flup-1.0.tar.gz]
 md5=530801fe835fd9a680457e443eb95578
 sha256=dd943b9746997bb6e49820187998dd26a58b2d0f886a45c166209e6d7d35aa32
diff --git a/recipes/python/python-flup_1.0.1.bb b/recipes/python/python-flup_1.0.1.bb
deleted file mode 100644
index d5f865d..0000000
--- a/recipes/python/python-flup_1.0.1.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-DESCRIPTION = "Random assortment of WSGI servers"
-SECTION = "devel/python"
-PRIORITY = "optional"
-LICENSE = "BSD"
-SRCNAME = "flup"
-PR = "ml0"
-
-SRC_URI = "http://pypi.python.org/packages/source/f/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
diff --git a/recipes/python/python-flup_1.0.2.bb b/recipes/python/python-flup_1.0.2.bb
new file mode 100644
index 0000000..d5f865d
--- /dev/null
+++ b/recipes/python/python-flup_1.0.2.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "Random assortment of WSGI servers"
+SECTION = "devel/python"
+PRIORITY = "optional"
+LICENSE = "BSD"
+SRCNAME = "flup"
+PR = "ml0"
+
+SRC_URI = "http://pypi.python.org/packages/source/f/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
-- 
1.6.4.4



