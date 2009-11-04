Received: from [131.111.8.136] (helo=ppsw-6.csi.cam.ac.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jic23@cam.ac.uk>) id 1N5kjv-0005m5-WD
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Nov 2009 19:37:55 +0100
X-Cam-AntiVirus: no malware found
X-Cam-SpamDetails: not scanned
X-Cam-ScannerInfo: http://www.cam.ac.uk/cs/email/scanner/
Received: from arcturus.eng.cam.ac.uk ([129.169.154.73]:56173)
	by ppsw-6.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.156]:25)
	with esmtpsa (PLAIN:jic23) (TLSv1:DHE-RSA-AES256-SHA:256)
	id 1N5kin-0004sk-LU (Exim 4.70) for
	openembedded-devel@lists.openembedded.org
	(return-path <jic23@cam.ac.uk>); Wed, 04 Nov 2009 18:36:41 +0000
Message-ID: <4AF1C9D3.2020604@cam.ac.uk>
Date: Wed, 04 Nov 2009 18:37:07 +0000
From: Jonathan Cameron <jic23@cam.ac.uk>
User-Agent: Thunderbird 2.0.0.23 (X11/20091029)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.96.0
X-SA-Exim-Connect-IP: 131.111.8.136
X-SA-Exim-Mail-From: jic23@cam.ac.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Chrony time synchronization (chronyc and chronyd)
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
X-List-Received-Date: Wed, 04 Nov 2009 18:37:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


Signed-off-by: Jonathan Cameron <jic23@cam.ac.uk>
---
Unfortunately this package uses a hand rolled set of build scripts.
The maintainers are happy to add fixes to any problems but are not
keen on moving over to autotools. I don't get the impression many
people cross compile this one! That is a shame because it is very
useful with wireless sensor nodes.

There are a few nasty tests in the configure script that may well
cause problems in cross compiles when the host is not also linux based.

I will work on getting these fixed at source, but it may take a while
hence submission of this recipe in the meantime.

The reason this is the git version is recent patches to ensure
that the LDPATH variable was not ignored in linking.

This recipe includes some convenient scripts and blank config
files needed to get it up and running easily.

 recipes/chrony/chrony.conf     |    7 +++++++
 recipes/chrony/chrony.keys     |    1 +
 recipes/chrony/chrony_git.bb   |   35 +++++++++++++++++++++++++++++++++++
 recipes/chrony/chrony_start.sh |   20 ++++++++++++++++++++
 recipes/chrony/chrony_stop.sh  |   20 ++++++++++++++++++++
 recipes/chrony/init            |    4 ++++
 6 files changed, 87 insertions(+), 0 deletions(-)

diff --git a/recipes/chrony/chrony.conf b/recipes/chrony/chrony.conf
new file mode 100644
index 0000000..995d5a2
--- /dev/null
+++ b/recipes/chrony/chrony.conf
@@ -0,0 +1,7 @@
+server timeserver offline minpoll 2 maxpoll 2
+keyfile /etc/chrony.keys
+commandkey 1
+initstepslew 0 timeserver
+driftfile /etc/chrony.drift
+dumpdir /var/log/chrony
+dumponexit
\ No newline at end of file
diff --git a/recipes/chrony/chrony.keys b/recipes/chrony/chrony.keys
new file mode 100644
index 0000000..00718ad
--- /dev/null
+++ b/recipes/chrony/chrony.keys
@@ -0,0 +1 @@
+1 opensesame
\ No newline at end of file
diff --git a/recipes/chrony/chrony_git.bb b/recipes/chrony/chrony_git.bb
new file mode 100644
index 0000000..bbba50c
--- /dev/null
+++ b/recipes/chrony/chrony_git.bb
@@ -0,0 +1,35 @@
+DESCRIPTION = "Chrony time synchronization"
+LICENSE = "GPL"
+CHRONY_REV="fe2cfe1faee10b3d972f79fe30b5c8ac09469409"
+DEPENDS += "readline"
+REDEPENDS += "readline"
+
+PV = "1.23+gitr${CHRONY_REV}"
+
+SRC_URI = "git://git.tuxfamily.org/gitroot/chrony/chrony.git;protocol=git;rev=${CHRONY_REV} \
+	file://chrony_start.sh \
+	file://chrony_stop.sh \
+	file://init \
+	file://chrony.conf \
+	file://chrony.keys \
+"
+S = "${WORKDIR}/git"
+
+do_configure() {
+	${S}/configure
+}
+
+do_compile() {
+	unset CPPFLAGS
+	oe_runmake
+}
+
+do_install_append() {
+    install -d ${D}${sysconfdir}/init.d
+    install -m 0644 ${WORKDIR}/chrony.conf ${D}${sysconfdir}/
+    install -m 0644 ${WORKDIR}/chrony.keys ${D}${sysconfdir}/
+    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/chronyd
+    install -d ${D}${bindir}
+    install -m 0755 ${WORKDIR}/chrony_start.sh ${D}${bindir}
+    install -m 0755 ${WORKDIR}/chrony_stop.sh ${D}${bindir}
+}
\ No newline at end of file
diff --git a/recipes/chrony/chrony_start.sh b/recipes/chrony/chrony_start.sh
new file mode 100644
index 0000000..e50a3a4
--- /dev/null
+++ b/recipes/chrony/chrony_start.sh
@@ -0,0 +1,20 @@
+#! /bin/bash
+
+PROC=`ps | grep chronyd | grep -v grep`;
+
+if [ -n "$PROC" ]; then
+
+   RESULT=`chronyc << ___EOF
+   password opensesame
+   online
+___EOF`
+
+   RESULT2=`echo $RESULT | grep OK`
+   if [ -n "$RESULT2" ]; then
+      echo 1
+   else
+      echo 0;
+   fi
+else
+    echo -1;
+fi
\ No newline at end of file
diff --git a/recipes/chrony/chrony_stop.sh b/recipes/chrony/chrony_stop.sh
new file mode 100644
index 0000000..65b8f1f
--- /dev/null
+++ b/recipes/chrony/chrony_stop.sh
@@ -0,0 +1,20 @@
+#! /bin/bash
+
+PROC=`ps | grep chronyd | grep -v grep`;
+
+if [ -n "$PROC" ]; then
+
+   RESULT=`chronyc << ___EOF
+   password opensesame
+   offline
+___EOF`
+
+   RESULT2=`echo $RESULT | grep OK`
+   if [ -n "$RESULT2" ]; then
+      echo 1
+   else
+      echo 0;
+   fi
+else
+    echo -1;
+fi
\ No newline at end of file
diff --git a/recipes/chrony/init b/recipes/chrony/init
new file mode 100644
index 0000000..b1c62a8
--- /dev/null
+++ b/recipes/chrony/init
@@ -0,0 +1,4 @@
+if [ -f /usr/bin/chronyd -a -f /etc/chrony.conf ]; then
+  /usr/bin/chronyd
+  echo "Started chronyd"
+fi
\ No newline at end of file
-- 
1.6.4.4



