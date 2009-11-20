Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NBQA7-0003uU-4o
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 10:52:22 +0100
Received: by bwz9 with SMTP id 9so3068979bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2009 01:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=kyrgwA6XYlLYfOTSwqUgu0/gDe3uP3RKLoGCTx3QBRY=;
	b=R6Xws3gWK7x3aVR5nJUvTeYjk+lYbacDXbH/ZS0g8MuTNe46q//RK5TFIMm6tR0Iuc
	7jzYYL7CDMYYdSnRALSV6bjUPUiwVu1aVXYl2HshgYQ6yZDPVTHMBLLiY8Gr/ZC2lh97
	d75hUdBYKkFEgsGCMm9QQzThGkb/UHi+Cz6oA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=W9BEyYDW5kCcYnZ4lLhcDs9o6MFjQx7kgtkyCV4/uzyEnmdLXTfo6prHy+u/nG1W7k
	jE28qOc+hHSML24kS65SpL1bdqjy5SO42xNBM0wkwoGzPt/2WDQrhW9q2U03rB4cnN+5
	XlsSV09onMcNZXW/zzOJCUupo28Mm1ar4Bs6Q=
Received: by 10.204.34.9 with SMTP id j9mr1212410bkd.10.1258710653787;
	Fri, 20 Nov 2009 01:50:53 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm481905fxm.12.2009.11.20.01.50.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 20 Nov 2009 01:50:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Nov 2009 10:50:45 +0100
Message-Id: <1258710645-6118-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.5.3
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] tzdata: add 2009s, fix typo in do_compile, install zone.tab and iso1366.tab for eglibc
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
X-List-Received-Date: Fri, 20 Nov 2009 09:52:22 -0000

* there was ${WORKDIR}}
* zone.tab, iso1366.tab is removed in eglibc/eglibc-package.bbclass
---
 recipes/tzdata/tzdata.inc      |   13 ++++++++++---
 recipes/tzdata/tzdata_2009s.bb |    3 +++
 2 files changed, 13 insertions(+), 3 deletions(-)
 create mode 100644 recipes/tzdata/tzdata_2009s.bb

diff --git a/recipes/tzdata/tzdata.inc b/recipes/tzdata/tzdata.inc
index 71de930..cfc5d2f 100644
--- a/recipes/tzdata/tzdata.inc
+++ b/recipes/tzdata/tzdata.inc
@@ -3,7 +3,7 @@ SECTION = "base"
 PRIORITY = "optional"
 DEPENDS = "tzcode-native"
 
-INC_PR = "r4"
+INC_PR = "r5"
 
 DEFAULT_TIMEZONE ?= "Europe/London"
 
@@ -28,9 +28,9 @@ do_compile () {
         for zone in ${TZONES}; do \
             ${STAGING_BINDIR_NATIVE}/zic -d ${WORKDIR}/build${datadir}/zoneinfo -L /dev/null \
                 -y ${S}/yearistype.sh ${S}/${zone} ; \
-            ${STAGING_BINDIR_NATIVE}/zic -d ${WORKDIR}}/build${datadir}/zoneinfo/posix -L /dev/null \
+            ${STAGING_BINDIR_NATIVE}/zic -d ${WORKDIR}/build${datadir}/zoneinfo/posix -L /dev/null \
                 -y ${S}/yearistype.sh ${S}/${zone} ; \
-            ${STAGING_BINDIR_NATIVE}/zic -d ${WORKDIR}}/build${datadir}/zoneinfo/right -L ${S}/leapseconds \
+            ${STAGING_BINDIR_NATIVE}/zic -d ${WORKDIR}/build${datadir}/zoneinfo/right -L ${S}/leapseconds \
                 -y ${S}/yearistype.sh ${S}/${zone} ; \
         done
 }
@@ -38,6 +38,11 @@ do_compile () {
 do_install () {
         install -d ${D}${prefix} ${D}${datadir}/zoneinfo
         cp -pPR ${WORKDIR}/build${prefix}/* ${D}${prefix}
+        # Only eglibc is removing zoneinfo files from package
+        if [ "${LIBC}"x == "eglibc"x ] ; then
+          cp -pP "${WORKDIR}/zone.tab" ${D}${datadir}/zoneinfo
+          cp -pP "${WORKDIR}/iso3166.tab" ${D}${datadir}/zoneinfo
+        fi
 
         # Install a sane default for timezones
         install -d ${D}${sysconfdir}
@@ -168,5 +173,7 @@ FILES_${PN} += "${datadir}/zoneinfo/Pacific/Honolulu     \
                 ${datadir}/zoneinfo/WET                  \
                 ${datadir}/zoneinfo/Zulu                 \
                 ${datadir}/zoneinfo/Etc/*                \
+                ${datadir}/zoneinfo/iso3166.tab          \
+                ${datadir}/zoneinfo/zone.tab             \
                 ${sysconfdir}/localtime                  \
                 ${sysconfdir}/timezone                   "
diff --git a/recipes/tzdata/tzdata_2009s.bb b/recipes/tzdata/tzdata_2009s.bb
new file mode 100644
index 0000000..17c2dd4
--- /dev/null
+++ b/recipes/tzdata/tzdata_2009s.bb
@@ -0,0 +1,3 @@
+require tzdata.inc
+SRC_URI = "ftp://elsie.nci.nih.gov/pub/tzdata${PV}.tar.gz"
+PR = "${INC_PR}.0"
-- 
1.6.5.3



