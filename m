Received: from [59.124.115.149] (helo=aakash.openmoko.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nytowl@openmoko.org>) id 1LaFOY-00065B-El
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Feb 2009 21:21:19 +0100
Received: from s0106001c100a3234.cg.shawcable.net ([70.73.132.19]
	helo=[172.16.14.101]) by aakash.openmoko.org with esmtpsa (SSL
	3.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <nytowl@openmoko.org>) id 1LaFM4-0008T1-MO
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Feb 2009 04:18:57 +0800
From: Angus Ainslie <nytowl@openmoko.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Feb 2009 13:18:33 -0700
Message-Id: <1235074713.6859.210.camel@alap>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
X-SA-Exim-Connect-IP: 70.73.132.19
X-SA-Exim-Mail-From: nytowl@openmoko.org
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	aakash.openmoko.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00 
	autolearn=ham version=3.1.7-deb
X-SA-Exim-Version: 4.2.1 (built Tue, 09 Jan 2007 17:23:22 +0000)
X-SA-Exim-Scanned: Yes (on aakash.openmoko.org)
Subject: [PATCH] add autostart PACKAGE to paroli recipe
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
X-List-Received-Date: Thu, 19 Feb 2009 20:21:19 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

---
 packages/openmoko-projects/paroli_git.bb |   21 ++++++++++++++++++++-
 1 files changed, 20 insertions(+), 1 deletions(-)                    

diff --git a/packages/openmoko-projects/paroli_git.bb
b/packages/openmoko-projects/paroli_git.bb
index 783ffd5..12b59e1
100644                                                                   
---
a/packages/openmoko-projects/paroli_git.bb                                                  
+++
b/packages/openmoko-projects/paroli_git.bb                                                  
@@ -2,13 +2,15 @@ DESCRIPTION =
"Paroli"                                                        
 SECTION =
"x11"                                                                                
 LICENSE =
"GPL"                                                                                
 PV = "0.2.1+gitr
${SRCREV}"                                                                     
-PR = "r0"
+PR = "r1"

 SRC_URI = "git://git.paroli-project.org/paroli.git;protocol=http"
 S = "${WORKDIR}/git"

 inherit distutils

+PACKAGES += "${PN}-autostart"
+
 RDEPENDS = "\
   python-datetime \
   python-subprocess \
@@ -17,4 +19,21 @@ RDEPENDS = "\
   python-pygobject \
 "

+do_install_append() {
+       # install paroli theme
+       mkdir -p ${D}/home/root/.e/e/config/illume/
+       install ${S}/data/module.illume.cfg
${D}/home/root/.e/e/config/illume/
+       install ${S}/data/e.cfg ${D}/home/root/.e/e/config/illume/
+       mkdir -p ${D}/home/root/.e/e/themes
+       install ${S}/data/illume.edj ${D}/home/root/.e/e/themes
+
+       #install autostart
+       mkdir -p ${D}/etc/X11/Xsession.d/
+       echo "#!/bin/sh" > ${D}/etc/X11/Xsession.d/80paroli
+       echo "export DISPLAY=:0" >> ${D}/etc/X11/Xsession.d/80paroli
+       echo "exec /usr/bin/paroli-launcher" >>
${D}/etc/X11/Xsession.d/80paroli
+       chmod a+x ${D}/etc/X11/Xsession.d/80paroli
+}
+
 FILES_${PN} += "${sysconfdir}/dbus-1 ${sysconfdir}/paroli ${datadir}"
+FILES_${PN}-autostart += "/etc/X11/Xsession.d/80paroli /home/root/.e"
--
1.5.6.5





