Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1LXZy4-0007Pa-Er
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Feb 2009 12:42:56 +0100
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id 571EB18934B; Thu, 12 Feb 2009 12:41:40 +0100 (CET)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Feb 2009 12:41:40 +0100
Message-Id: <1234438900-18678-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
Cc: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
Subject: [PATCH] python-coherence: added dependency on axiom
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
X-List-Received-Date: Thu, 12 Feb 2009 11:42:56 -0000

From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

---
 packages/python/python-coherence_svn.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/packages/python/python-coherence_svn.bb b/packages/python/python-coherence_svn.bb
index 083e2fa..0310676 100644
--- a/packages/python/python-coherence_svn.bb
+++ b/packages/python/python-coherence_svn.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 HOMEPAGE = "http://coherence.beebits.net/wiki"
 
-PR = "r0"
+PR = "r1"
 
 PV = "0.6.0+svnr${SRCREV}"
 
@@ -19,6 +19,7 @@ S = "${WORKDIR}/Coherence"
 FILES_${PN} += "${datadir}"
 RDEPENDS_${PN} += "python-twisted-pair python-divmodepsilon python-nevow python-gst python-dbus \
 	python-configobj python-twisted python-twisted-core python-twisted-protocols python-misc \
-	python-zopeinterface zope python-modules python-pygobject python-gdata python-inotify"
+	python-zopeinterface zope python-modules python-pygobject python-gdata python-inotify \
+	python-divmodaxiom"
 
 
-- 
1.5.6.5



