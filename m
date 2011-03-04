Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PvUpk-000329-RV
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Mar 2011 14:14:16 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 300E2314E686
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Mar 2011 14:12:48 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id OmbU42I5rgKX
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Mar 2011 14:12:40 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id D2E16314E68B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Mar 2011 14:12:39 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Fri, 04 Mar 2011 13:12:39 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Mar 2011 13:12:39 +0000
Message-Id: <1299244359-5345-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <4D705C07.20508@freescale.com>
References: <4D705C07.20508@freescale.com>
Subject: [PATCH] mrouted-3.9.4: intitial recipe
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
X-List-Received-Date: Fri, 04 Mar 2011 13:14:16 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
This was only compile-tested. It would be nice to get some feedback.

 recipes/mrouted/mrouted_3.9.4.bb |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 recipes/mrouted/mrouted_3.9.4.bb

diff --git a/recipes/mrouted/mrouted_3.9.4.bb b/recipes/mrouted/mrouted_3.9.4.bb
new file mode 100644
index 0000000..4ba4111
--- /dev/null
+++ b/recipes/mrouted/mrouted_3.9.4.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "DVMRP multicast routing daemon"
+HOMEPAGE = "http://troglobit.com/mrouted.shtml"
+SECTION = "network"
+LICENSE = "BSD"
+
+SRC_URI = "ftp://ftp.vmlinux.org/pub/People/jocke/mrouted/mrouted-${PV}.tar.bz2"
+SRC_URI[md5sum] = "688b74fc42919d588f262e6b3c9c6d4c"
+SRC_URI[sha256sum] = "c697549b2e506a380575f7adb67e87288ef2295b97241b3a1aeb0e88b827a3e1"
+
+EXTRA_OEMAKE = " \
+        datadir=${datadir} \
+        mandir=${mandir} \
+        prefix=${prefix} \
+        sysconfdir=${sysconfdir} \
+        DESTDIR=${D} \
+"
+
+do_compile() {
+        oe_runmake
+}
+do_install() {
+        oe_runmake install
+}
-- 
1.7.2.3



