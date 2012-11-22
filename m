Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TbaCB-0007G3-B9
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2012 18:04:12 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 22 Nov 2012 08:49:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,301,1352102400"; d="scan'208";a="171453262"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.201])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Nov 2012 08:49:40 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Nov 2012 16:49:35 +0000
Message-Id: <7c3ea4dccee800720d34bbc4aa81e297e6c4ebab.1353602922.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1353602922.git.paul.eggleton@linux.intel.com>
References: <cover.1353602922.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1353602922.git.paul.eggleton@linux.intel.com>
References: <cover.1353602922.git.paul.eggleton@linux.intel.com>
Subject: [meta-networking][PATCH v2 2/2] ntp: make servers configurable and default to none configured
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
X-List-Received-Date: Thu, 22 Nov 2012 17:04:12 -0000

People can't blindly use pool.ntp.org, especially if they are building
for a product or something that could be used in a product, so at least
try to get people to do the right thing and not use pool.ntp.org by
default.

The previous network interface up script is now installed as
ntpdate-sync in ${bindir} (and symlinked as the network if-up script).
NTPSERVERS needs to be set in /etc/default/ntpdate.default at runtime,
or a different version of this file with a default value can be provided
in a bbappend. (If you intend to use ntpd you will also want to provide
an ntp.conf with the appropriate server(s) set there as well.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-networking/recipes-support/ntp/files/ntp.conf |    2 +-
 meta-networking/recipes-support/ntp/files/ntpdate  |   11 ++++++---
 .../recipes-support/ntp/files/ntpdate.default      |    7 ++++++
 meta-networking/recipes-support/ntp/ntp.inc        |   25 +++++++++++++-------
 4 files changed, 32 insertions(+), 13 deletions(-)
 create mode 100644 meta-networking/recipes-support/ntp/files/ntpdate.default

diff --git a/meta-networking/recipes-support/ntp/files/ntp.conf b/meta-networking/recipes-support/ntp/files/ntp.conf
index bf52440..a9cc838 100644
--- a/meta-networking/recipes-support/ntp/files/ntp.conf
+++ b/meta-networking/recipes-support/ntp/files/ntp.conf
@@ -5,7 +5,7 @@ driftfile /etc/ntp.drift
 # This obtains a random server which will be close
 # (in IP terms) to the machine.  Add other servers
 # as required, or change this.
-server pool.ntp.org
+server time.server.example.com
 # Using local hardware clock as fallback
 # Disable this when using ntpd -q -g -x as ntpdate or it will sync to itself
 server 127.127.1.0
diff --git a/meta-networking/recipes-support/ntp/files/ntpdate b/meta-networking/recipes-support/ntp/files/ntpdate
index 784b029..ab0551c 100755
--- a/meta-networking/recipes-support/ntp/files/ntpdate
+++ b/meta-networking/recipes-support/ntp/files/ntpdate
@@ -6,11 +6,16 @@ test -x /usr/bin/ntpdate || exit 0
 
 if test -f /etc/default/ntpdate ; then
 . /etc/default/ntpdate
-else
-NTPSERVERS="pool.ntp.org"
 fi
 
-test -n "$NTPSERVERS" || exit 0
+if [ "$NTPSERVERS" = "" ] ; then
+	if [ "$METHOD" = "" -a "$1" != "silent" ] ; then
+		echo "Please set NTPSERVERS in /etc/default/ntpdate"
+		exit 1
+	else
+		exit 0
+	fi
+fi
 
 # This is a heuristic:  The idea is that if a static interface is brought
 # up, that is a major event, and we can put in some extra effort to fix
diff --git a/meta-networking/recipes-support/ntp/files/ntpdate.default b/meta-networking/recipes-support/ntp/files/ntpdate.default
new file mode 100644
index 0000000..486b6e0
--- /dev/null
+++ b/meta-networking/recipes-support/ntp/files/ntpdate.default
@@ -0,0 +1,7 @@
+# Configuration script used by ntpdate-sync script
+
+NTPSERVERS=""
+
+# Set to "yes" to write time to hardware clock on success
+UPDATE_HWCLOCK="no"
+
diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networking/recipes-support/ntp/ntp.inc
index a614e3f..b3586dc 100644
--- a/meta-networking/recipes-support/ntp/ntp.inc
+++ b/meta-networking/recipes-support/ntp/ntp.inc
@@ -17,6 +17,7 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://ntpd \
            file://ntp.conf \
            file://ntpdate \
+           file://ntpdate.default \
            "
 
 inherit autotools update-rc.d
@@ -37,15 +38,20 @@ do_install_append() {
 	install -d ${D}${sysconfdir}/init.d
 	install -m 644 ${WORKDIR}/ntp.conf ${D}${sysconfdir}
 	install -m 755 ${WORKDIR}/ntpd ${D}${sysconfdir}/init.d
+	install -d ${D}${bindir}
+	install -m 755 ${WORKDIR}/ntpdate ${D}${bindir}/ntpdate-sync
 
 	# Fix hardcoded paths in scripts
-	sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/ntpd
-	sed -i 's!/usr/bin/!${bindir}/!g' ${D}${sysconfdir}/init.d/ntpd
-	sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/ntpd
-	sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/ntpd
-
-	install -d ${D}${sysconfdir}/network/if-up.d
-	install -m 755 ${WORKDIR}/ntpdate ${D}${sysconfdir}/network/if-up.d
+	sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/ntpd ${D}${bindir}/ntpdate-sync
+	sed -i 's!/usr/bin/!${bindir}/!g' ${D}${sysconfdir}/init.d/ntpd ${D}${bindir}/ntpdate-sync
+	sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/ntpd ${D}${bindir}/ntpdate-sync
+	sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/ntpd ${D}${bindir}/ntpdate-sync
+	sed -i 's!^PATH=.*!PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!' ${D}${bindir}/ntpdate-sync
+
+	install -d ${D}/${sysconfdir}/default
+	install -m 644 ${WORKDIR}/ntpdate.default ${D}${sysconfdir}/default/ntpdate
+	install -d ${D}/${sysconfdir}/network/if-up.d
+	ln -s ${bindir}/ntpdate-sync ${D}/${sysconfdir}/network/if-up.d
 }
 
 PACKAGES += "ntpdate ${PN}-tickadj ${PN}-utils"
@@ -64,9 +70,10 @@ RSUGGESTS_${PN} = "iana-etc"
 FILES_${PN} = "${bindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/init.d/ntpd ${sbindir} ${libdir}"
 FILES_${PN}-tickadj = "${bindir}/tickadj"
 FILES_${PN}-utils = "${bindir}"
-FILES_ntpdate = "${bindir}/ntpdate ${sysconfdir}/network/if-up.d/ntpdate"
+FILES_ntpdate = "${bindir}/ntpdate ${sysconfdir}/network/if-up.d/ntpdate-sync ${bindir}/ntpdate-sync ${sysconfdir}/default/ntpdate"
 
 CONFFILES_${PN} = "${sysconfdir}/ntp.conf"
+CONFFILES_ntpdate = "${sysconfdir}/default/ntpdate"
 
 INITSCRIPT_NAME = "ntpd"
 # No dependencies, so just go in at the standard level (20)
@@ -79,7 +86,7 @@ else
         if ! grep -q -s ntpdate /var/spool/cron/root; then
                 echo "adding crontab"
                 test -d /var/spool/cron || mkdir -p /var/spool/cron
-                echo "30 * * * *    /usr/bin/ntpdate -b -s -u pool.ntp.org" >> /var/spool/cron/root
+                echo "30 * * * *    ${bindir}/ntpdate-sync silent" >> /var/spool/cron/root
         fi
 fi
 }
-- 
1.7.9.5



