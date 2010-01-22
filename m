Received: from fg-out-1718.google.com ([72.14.220.156])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1NYRYj-0000YY-J6
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 23:00:56 +0100
Received: by fg-out-1718.google.com with SMTP id 19so641512fgg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2010 13:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=eJXHdxacgTm2Df209XMf57sBSrXYQYPzx+EH3ld7TxU=;
	b=LgSbg7E8mmuPNSZbiXXnHn6c7unB2pBKlkPN/cPjowf5sVgk5TMjpJ7iq/QVoge6EE
	vSGQEhJHTBiIX59sZ/lyPaH5j0dnTCFYi6WClM9cqJ7asa01PJKrqS9AfZTaCKsq6iaQ
	JNqGaRIBSs/AQgGDoz11V+3KLUHjh40vPZlf4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=FSzCTv5L898BWVvTl7/VEwib+yN5IMNRZ3l0ofdGc55TRVLjiL4bsB3e7it4zELyzX
	btwAtGi9nyB19CDbj6ZYbMSFnrwAzhAlMLiYehj26KRAaBcyysLauSX8DmI0+fDcsdb8
	QUoKU81FGLyPTvo7EvKN6rQXhNIpVDAlAzx8A=
Received: by 10.102.206.30 with SMTP id d30mr1830676mug.99.1264197517603;
	Fri, 22 Jan 2010 13:58:37 -0800 (PST)
Received: from localhost.localdomain ([188.45.31.245])
	by mx.google.com with ESMTPS id j10sm10781871muh.13.2010.01.22.13.58.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 22 Jan 2010 13:58:36 -0800 (PST)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Jan 2010 22:58:47 +0100
Message-Id: <1264197527-25414-1-git-send-email-michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.6.4.4
In-Reply-To: <n>
References: <n>
X-SA-Exim-Connect-IP: 72.14.220.156
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 1/2] gpsd: Prepare recipe and inc for version bump
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
X-List-Received-Date: Fri, 22 Jan 2010 22:00:56 -0000


Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
---
 recipes/gpsd/gpsd.inc     |    9 ++++++---
 recipes/gpsd/gpsd_2.38.bb |    4 +++-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/recipes/gpsd/gpsd.inc b/recipes/gpsd/gpsd.inc
index a917fbe..5efbe2a 100644
--- a/recipes/gpsd/gpsd.inc
+++ b/recipes/gpsd/gpsd.inc
@@ -5,12 +5,14 @@ LICENSE = "GPL"
 DEPENDS = "dbus-glib ncurses python"
 PROVIDES = "virtual/gpsd"
 
+INC_PR = "r0"
+
 EXTRA_OECONF = "--x-includes=${STAGING_INCDIR}/X11 \
                 --x-libraries=${STAGING_LIBDIR} \
                 --enable-dbus \
-                --enable-python"
+"
 
-SRC_URI = "http://download.berlios.de/gpsd/gpsd-${PV}.tar.gz \
+SRC_URI = "http://download.berlios.de/gpsd/gpsd-${PV}.tar.gz;name=gpsd \
            file://gpsd-default \
            file://gps-hardware \
            file://gpsd"
@@ -28,6 +30,8 @@ LDFLAGS += "-L${STAGING_LIBDIR} -lm"
 export STAGING_INCDIR
 export STAGING_LIBDIR
 
+TARGET_CC_ARCH += "${LDFLAGS}"
+
 do_compile_prepend() {
     export BUILD_SYS="${BUILD_SYS}"
     export HOST_SYS="${HOST_SYS}"
@@ -41,7 +45,6 @@ do_install_prepend() {
 
 do_install_append() {
         install -d ${D}/${sysconfdir}/init.d
-        install -d ${D}/dev
         install -m 0755 ${WORKDIR}/gpsd ${D}/${sysconfdir}/init.d/
         install -m 0755 ${WORKDIR}/gps-hardware ${D}/${sysconfdir}/init.d/gps-hardware.default
         install -d ${D}/${sysconfdir}/default
diff --git a/recipes/gpsd/gpsd_2.38.bb b/recipes/gpsd/gpsd_2.38.bb
index 06a5fe7..7c7a477 100644
--- a/recipes/gpsd/gpsd_2.38.bb
+++ b/recipes/gpsd/gpsd_2.38.bb
@@ -1,5 +1,7 @@
 require gpsd.inc
 
-PR = "r2"
+PR = "${INC_PR}.1"
 # make attempts to link gpspacket.so without waiting for all compiler tasks:
 PARALLEL_MAKE = ""
+
+EXTRA_OECONF += " --enable-python "
-- 
1.6.4.4



