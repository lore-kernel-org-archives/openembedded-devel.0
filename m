Received: from mail-ea0-f181.google.com ([209.85.215.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UR0nl-0007Wo-Aj
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 15:47:43 +0200
Received: by mail-ea0-f181.google.com with SMTP id z10so1626450ead.40
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 06:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=Lx1VVWadqdvZIqcCvAuDrIIf8oSVy0Esj1vpvm+Fx8g=;
	b=W+9Vx9CsHbJOyeq6+I6FvJNgxwDRgZCEcN3q4Bw+eEVYCXos/Fmu7jOqKpjoKvYz0W
	whNcqc5MfdMnf6On/NdX2JxekId+xTz547cxiFgL4cHgjgeJT+NDIARrMlnGrfw62JDc
	SETBteC9RivDjqQghyhPL9cjupDDoMpUUVUDS8zLpJnNgzLlP3eil9ee8M89R/N27Nl2
	5HM0t5z/5i86vCb6wOMSQzP1TPyK2skSg5n8QeKoJLGClMepc/ZkT+8MIo/wK8WLJu42
	YCeQEOPSN7BO5C2WFSDobwaGsSumWEZTxHC8NWUkEArUaXpJhit31yFE7+8qMpXw3pTr
	KkpQ==
X-Received: by 10.15.32.67 with SMTP id z43mr39512514eeu.24.1365859807688;
	Sat, 13 Apr 2013 06:30:07 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id bj2sm16515423eeb.1.2013.04.13.06.30.06
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 06:30:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 15:29:31 +0200
Message-Id: <1365859790-20947-14-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 14/33] dnsmasq: move systemd support from meta-systemd back to meta-oe
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
X-List-Received-Date: Sat, 13 Apr 2013 13:48:57 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/dnsmasq/dnsmasq.inc       | 14 ++++++++++++--
 .../dnsmasq/dnsmasq/dnsmasq.service                    |  0
 meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bb   |  2 ++
 .../recipes-connectivity/dnsmasq/dnsmasq_2.55.bbappend | 18 ------------------
 4 files changed, 14 insertions(+), 20 deletions(-)
 rename {meta-systemd/meta-oe => meta-oe}/recipes-connectivity/dnsmasq/dnsmasq/dnsmasq.service (100%)
 delete mode 100644 meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bbappend

diff --git a/meta-oe/recipes-connectivity/dnsmasq/dnsmasq.inc b/meta-oe/recipes-connectivity/dnsmasq/dnsmasq.inc
index d6f3a54..ef99f48 100644
--- a/meta-oe/recipes-connectivity/dnsmasq/dnsmasq.inc
+++ b/meta-oe/recipes-connectivity/dnsmasq/dnsmasq.inc
@@ -9,9 +9,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 #at least versions 2.15 and prior are moved to the archive folder on the server
 SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getVar('PV',1).split('.')[1]) > 15]}dnsmasq-${PV}.tar.gz;name=dnsmasq-${PV} \
            file://init \
-           file://dnsmasq.conf"
+           file://dnsmasq.conf \
+           file://dnsmasq.service \
+"
 
-inherit update-rc.d
+inherit update-rc.d systemd
 
 INITSCRIPT_NAME = "dnsmasq"
 INITSCRIPT_PARAMS = "defaults"
@@ -24,6 +26,14 @@ do_install () {
         install -d ${D}${sysconfdir}/ ${D}${sysconfdir}/init.d ${D}${sysconfdir}/dnsmasq.d
         install -m 644 ${WORKDIR}/dnsmasq.conf ${D}${sysconfdir}/
         install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/dnsmasq
+
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/dnsmasq.service ${D}${systemd_unitdir}/system
 }
 
 CONFFILES_${PN} = "${sysconfdir}/dnsmasq.conf"
+
+RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "dnsmasq.service"
diff --git a/meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq/dnsmasq.service b/meta-oe/recipes-connectivity/dnsmasq/dnsmasq/dnsmasq.service
similarity index 100%
rename from meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq/dnsmasq.service
rename to meta-oe/recipes-connectivity/dnsmasq/dnsmasq/dnsmasq.service
diff --git a/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bb b/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bb
index 5f87704..ae37db7 100644
--- a/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bb
+++ b/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bb
@@ -1,4 +1,6 @@
 require dnsmasq.inc
 
+PR = "r3"
+
 SRC_URI[dnsmasq-2.55.md5sum] = "b093d7c6bc7f97ae6fd35d048529232a"
 SRC_URI[dnsmasq-2.55.sha256sum] = "cf63ecf5977f00474cbda98376a9d8743500a82fd98e13f43d7037bce9f9f929"
diff --git a/meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bbappend b/meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bbappend
deleted file mode 100644
index 148586e..0000000
--- a/meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bbappend
+++ /dev/null
@@ -1,18 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-PRINC := "${@int(PRINC) + 2}"
-
-inherit systemd
-
-SRC_URI += "file://dnsmasq.service"
-
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "dnsmasq.service"
-
-do_install_append() {
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/dnsmasq.service ${D}${systemd_unitdir}/system
-}
-
-- 
1.8.1.5



