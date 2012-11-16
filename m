Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1TZOtG-0003jh-7h
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Nov 2012 17:35:38 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id qAGGLbuL011518
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 16 Nov 2012 17:21:38 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1TZOfg-0004OD-7E; Fri, 16 Nov 2012 17:21:36 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Nov 2012 17:21:33 +0100
Message-Id: <1353082893-16665-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.11.7
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.5
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] systemd.bbclass: move disable operation into prerm() script
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
X-List-Received-Date: Fri, 16 Nov 2012 16:35:38 -0000

The 'systemctl disable' operation should not be done in postrm() because
the .service file does not exist anymore and the script will fail hence.

After moving this command into prerm(), postrm() becomes empty and can
be removed completely.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta-systemd/classes/systemd.bbclass | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta-systemd/classes/systemd.bbclass b/meta-systemd/classes/systemd.bbclass
index f26c6d1..e1916a0 100644
--- a/meta-systemd/classes/systemd.bbclass
+++ b/meta-systemd/classes/systemd.bbclass
@@ -22,9 +22,7 @@ systemd_prerm() {
 if [ -z "$D" ]; then
     systemctl stop ${SYSTEMD_SERVICE}
 fi
-}
 
-systemd_postrm() {
 systemctl disable ${SYSTEMD_SERVICE}
 }
 
@@ -116,12 +114,6 @@ python populate_packages_prepend () {
         prerm += localdata.getVar('systemd_prerm', 1)
         d.setVar('pkg_prerm_%s' % pkg, prerm)
 
-        postrm = localdata.getVar('pkg_postrm', 1)
-        if not postrm:
-            postrm = '#!/bin/sh\n'
-        postrm += localdata.getVar('systemd_postrm', 1)
-        d.setVar('pkg_postrm_%s' % pkg, postrm)
-
     # add files to FILES_*-systemd if existent and not already done
     def systemd_append_file(pkg_systemd, file_append):
         appended = False
-- 
1.7.11.7



