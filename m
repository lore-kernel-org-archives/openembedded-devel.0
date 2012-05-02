Received: from sanddollar.geekisp.com ([216.168.135.167])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1SPdm1-000329-S0
	for openembedded-devel@openembedded.org; Wed, 02 May 2012 19:55:34 +0200
Received: (qmail 20085 invoked by uid 1003); 2 May 2012 17:45:48 -0000
Received: from unknown (HELO localhost.localdomain)
	(philip@balister.org@71.171.22.246)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	2 May 2012 17:45:48 -0000
From: Philip Balister <philip@balister.org>
To: openembedded-devel@openembedded.org
Date: Wed,  2 May 2012 13:45:45 -0400
Message-Id: <1335980745-29862-2-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1335980745-29862-1-git-send-email-philip@balister.org>
References: <1335980745-29862-1-git-send-email-philip@balister.org>
Subject: [meta-oe 1/1] lxc : Add recipe for building Linux Containers tools.
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
X-List-Received-Date: Wed, 02 May 2012 17:55:34 -0000

Linux containers are a lightweight virtualization system.

Compile tested on F15 and lightly run tested on a pandaboard.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-oe/recipes-extended/lxc/lxc_git.bb |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-extended/lxc/lxc_git.bb

diff --git a/meta-oe/recipes-extended/lxc/lxc_git.bb b/meta-oe/recipes-extended/lxc/lxc_git.bb
new file mode 100644
index 0000000..8f22e77
--- /dev/null
+++ b/meta-oe/recipes-extended/lxc/lxc_git.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Linux Containers tools"
+DESCRIPTION = "Linux containers are a light weight isolation system for Linux."
+HOMEPAGE = "http://lxc.sourceforge.net"
+LICENSE = "LGPLv2.1"
+
+PV = "0.8.0-rc2"
+
+RDEPENDS_${PN} = "perl perl-modules"
+
+SRC_URI = "git://lxc.git.sourceforge.net/gitroot/lxc/lxc"
+SRCREV = "ed55bf5203aca88809d979b289d6b2280a18e79c"
+
+inherit autotools
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OECONF = "--disable-doc --disable-rpath"
+
+FILES_${PN}-dbg += "${libexecdir}/lxc/.debug"
-- 
1.7.3.4



