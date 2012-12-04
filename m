Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TfrOk-0004jD-Ro
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 13:14:50 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1537087eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Dec 2012 04:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=fqqHo8EqTZg+PQ2a/KGY/V4ztYKr/ziH4XzOo30Fgs8=;
	b=BvfyFl8gm+OdC9kOjczID6eHcjFv7iARnmVCDi1zi4p2HKx+kGYnEjfhwuhhOJIefA
	f15/V5mwEdlYSSz9itq9/mgW5kOX/4VatjjrIMzh3jusBqUeOC8OTt/Cd1crShKBgAy5
	e8EY2S06vK7xQwOYPvz8W2pdN0ccSpi5LO5HXDQgY7fZ3nrOaDVo5XWjy379b4AKK8oK
	5uBKB22uQ3uDRdkAtPk/kJ0+VKIcptKvYpIbgVicymHukqnzvN/tKzwVPeJrz7OvZS2Y
	SJjYBWd1c/hdWMhie1HtUBvxSvK21Wc2FHNAcDaxtg8kV0ItDP86M6RKEaAa/RKhx2L+
	yYmQ==
Received: by 10.14.3.195 with SMTP id 43mr47777974eeh.36.1354622430656;
	Tue, 04 Dec 2012 04:00:30 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b2sm2205682eep.9.2012.12.04.04.00.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Dec 2012 04:00:30 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 12:59:55 +0100
Message-Id: <929db46548146c19c01d9a0f0ccc0e6252af22dd.1354622319.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354622319.git.Martin.Jansa@gmail.com>
References: <cover.1354622319.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354622319.git.Martin.Jansa@gmail.com>
References: <cover.1354622319.git.Martin.Jansa@gmail.com>
Subject: [PATCH 4/5] ntp: make servers configurable and default to none configured
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
X-List-Received-Date: Tue, 04 Dec 2012 12:14:51 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

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
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/ntp/files/ntp.conf |  2 +-
 meta-networking/recipes-support/ntp/files/ntpdate  | 11 +++++++---
 .../recipes-support/ntp/files/ntpdate.default      |  7 ++++++
 meta-networking/recipes-support/ntp/ntp.inc        | 25 ++++++++++++++--------
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
1.8.0



