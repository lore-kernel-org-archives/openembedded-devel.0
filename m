Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SyNg2-0007Po-CE
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Aug 2012 15:48:59 +0200
Received: by wgbdr1 with SMTP id dr1so2377815wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Aug 2012 06:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=kQZaPpNrdiywqb44cWkMAVUVAKo5Qb6Fh4qe27f7mvE=;
	b=EWooqZVIsRNYYIWwaqFki/kWjqmWbj4elrO1E5ACWYvjffmwMAQNS0cuERxgn59hXQ
	wrWDf8OCZjOYzWDfHb7uLJmVunhxzwSVOmHJpj9mcaSPxh+e3UyoXUnKSyfAOvqSHO6x
	5Qfw0pfMsjwM1F1NOLUwnrkZQtjZSPdSMtiBfN6eSo1HYGl/uSbkjb1A6Ne2E5E/DaPA
	s+cQM/OI7UaFvNSxM1PqGaNYul4M24skwZkucztQozRTxZ2n2WvlaCbD2+48WqrEvNMi
	biofb2OEDTslWiO9cRe7cxO7tz/jgCwX0EVLE2HRVmM6bhCsJ10T0pwCJ80tPn8bx2vi
	hiNw==
Received: by 10.180.84.164 with SMTP id a4mr18539007wiz.12.1344260233753;
	Mon, 06 Aug 2012 06:37:13 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id eu4sm15611577wib.2.2012.08.06.06.37.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Aug 2012 06:37:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Aug 2012 15:37:04 +0200
Message-Id: <5dd20f461ce240ffcaf43bd048e9b5e6ffd06bd0.1344259248.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1343859304.git.Martin.Jansa@gmail.com>
References: <cover.1343859304.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344259248.git.Martin.Jansa@gmail.com>
References: <cover.1344259248.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 09/12] systemd-compat-units: move list of disabled services to variable, fix hwclock.sh and output
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
X-List-Received-Date: Mon, 06 Aug 2012 13:48:59 -0000

* variable allows to add items in .bbappend without overwritting whole
  postinst
* hwclock.service should be used to blacklist SYSV hwclock.sh (not hwclock.sh.service)
* show only newly disabled SYSV scripts

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-core/systemd/systemd-compat-units.bb   |   19 ++++++++++++++-----
 1 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/meta-systemd/recipes-core/systemd/systemd-compat-units.bb b/meta-systemd/recipes-core/systemd/systemd-compat-units.bb
index c9a6b67..2973208 100644
--- a/meta-systemd/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta-systemd/recipes-core/systemd/systemd-compat-units.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Units to make systemd work better with existing sysvinit scripts"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r15"
+PR = "r16"
 
 inherit allarch
 
@@ -26,15 +26,24 @@ do_install() {
 	chmod 0755 ${D}${bindir}/runlevel
 }
 
+SYSTEMD_DISABLED_SYSV_SERVICES = " \
+  busybox-udhcpc \
+  dnsmasq \
+  hwclock \
+  networking \
+  syslog \
+  syslog.busybox \
+"
+
 pkg_postinst_${PN} () {
 cd $D${sysconfdir}/init.d
 
 echo -n "Disabling the following sysv scripts: "
 
-for i in busybox-udhcpc dnsmasq hwclock.sh networking syslog syslog.busybox ; do
-	if [ -e $i ] ; then
-		echo -n "$i " ; ln -s /dev/null $D${systemd_unitdir}/system/$i.service
-	fi
+for i in ${SYSTEMD_DISABLED_SYSV_SERVICES} ; do
+    if [ \( -e $i -o $i.sh \) -a ! -e $D${base_libdir}/systemd/system/$i.service ] ; then
+        echo -n "$i " ; ln -s /dev/null $D${base_libdir}/systemd/system/$i.service
+    fi
 done ; echo
 }
 
-- 
1.7.8.6



