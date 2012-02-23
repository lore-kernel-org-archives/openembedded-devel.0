Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0Y69-0007Zd-N7
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 13:48:37 +0100
Received: by eaal10 with SMTP id l10so519174eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 04:40:16 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.48.7 as permitted sender) client-ip=10.14.48.7; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.48.7 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.48.7])
	by 10.14.48.7 with SMTP id u7mr742063eeb.89.1330000816633 (num_hops =
	1); Thu, 23 Feb 2012 04:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=O33p99n64yaxGeHKo6o+L9R+lhVaGH98IP/qtaz1OhU=;
	b=Kn+ropRmGi9eO8geunYXzRI0yoqcJGnALhf0xIL2CXMjUuY7f5zWtgxfSEzeIvIhxf
	JENSXkC2sqKfciwp0kxUoMovE4mGk3kp+BAJJsCnuaqhvzadtiRzyW7WfoIXO5UhPR5f
	dmVW2EEKhVlKp0e3e0U5WkHPDTCNwPWWuFHas=
Received: by 10.14.48.7 with SMTP id u7mr588398eeb.89.1330000816419;
	Thu, 23 Feb 2012 04:40:16 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a58sm4964287eeb.8.2012.02.23.04.40.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 04:40:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2012 13:40:07 +0100
Message-Id: <1330000807-30379-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <CAP9ODKoFvg4s4Omew3pdtw3GVZyvpAF+cZCKKP6StJkjWhua9A@mail.gmail.com>
References: <CAP9ODKoFvg4s4Omew3pdtw3GVZyvpAF+cZCKKP6StJkjWhua9A@mail.gmail.com>
Subject: [meta-oe][PATCH] gateone, networkmanager, cloud9, ntp: use systemd_unitdir variable
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
X-List-Received-Date: Thu, 23 Feb 2012 12:48:37 -0000

* maybe we should move systemd_unitdir definition outside systemd.bbclass
  because it's used in few more recipes which doesn't inherit systemd

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-connectivity/gateone/gateone_git.bb    |    4 ++--
 .../networkmanager/networkmanager_0.9.2.0.bb       |    2 +-
 meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb    |    6 +++---
 meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb         |    8 ++++----
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta-oe/recipes-connectivity/gateone/gateone_git.bb b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
index 4f9684c..84da893 100644
--- a/meta-oe/recipes-connectivity/gateone/gateone_git.bb
+++ b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
@@ -20,8 +20,8 @@ export prefix = "${localstatedir}/lib"
 do_install_append() {
 	install -d ${D}${localstatedir}/log/${BPN}
 
-	install -m 0755 -d ${D}${base_libdir}/systemd/system
-	install -m 0644 ${WORKDIR}/gateone.service ${D}${base_libdir}/systemd/system/
+	install -m 0755 -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/gateone.service ${D}${systemd_unitdir}/system/
 
 	install -m 0755 -d ${D}${sysconfdir}/avahi/services/
 	install -m 0644 ${WORKDIR}/gateone-avahi.service ${D}${sysconfdir}/avahi/services/
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
index 1dcc3cf..df269e0 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
@@ -70,7 +70,7 @@ FILES_${PN} += " \
 		${datadir}/polkit-1 \
 		${datadir}/dbus-1 \
 		${base_libdir}/udev/* \
-        ${base_libdir}/systemd \
+        ${systemd_unitdir} \
 "
 
 RRECOMMENDS_${PN} += "iptables"
diff --git a/meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb b/meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb
index 4e95075..bef2f36 100644
--- a/meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb
+++ b/meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb
@@ -98,8 +98,8 @@ do_install () {
  install -m 0644 ${WORKDIR}/o3/modules/o3.js ${D}${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/o3-xml/o3.js
  install -m 0755 ${WORKDIR}/o3/o3.node ${D}${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/o3-xml/o3.node
 
- install -m 0755 -d ${D}${base_libdir}/systemd/system
- install -m 0644 ${WORKDIR}/cloud9.service ${D}${base_libdir}/systemd/system/
+ install -m 0755 -d ${D}${systemd_unitdir}/system
+ install -m 0644 ${WORKDIR}/cloud9.service ${D}${systemd_unitdir}/system/
 
   install -m 0755 -d ${D}${sysconfdir}/avahi/services/
   install -m 0644 ${WORKDIR}/cloud9-avahi.service ${D}${sysconfdir}/avahi/services/
@@ -109,7 +109,7 @@ FILES_${PN}-dbg += "${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/o
                     ${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/.debug \
                    "
 
-FILES_${PN} += "${base_libdir}/systemd/system"
+FILES_${PN} += "${systemd_unitdir}/system"
 RDEPENDS_${PN} = "nodejs gzip"
 
 inherit systemd
diff --git a/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb b/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb
index 063d82a..292a1f6 100644
--- a/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb
+++ b/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb
@@ -29,14 +29,14 @@ do_install_append() {
 	install -d ${D}/${sysconfdir}/network/if-up.d
 	install -m 755 ${WORKDIR}/ntpdate ${D}/${sysconfdir}/network/if-up.d
 
-	install -d ${D}${base_libdir}/systemd/system
-	install -m 0644 ${WORKDIR}/ntpdate.service ${D}${base_libdir}/systemd/system/
-	install -m 0644 ${WORKDIR}/ntpd.service ${D}${base_libdir}/systemd/system/
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/ntpdate.service ${D}${systemd_unitdir}/system/
+	install -m 0644 ${WORKDIR}/ntpd.service ${D}${systemd_unitdir}/system/
 }
 
 PACKAGES =+ "${PN}-systemd"
 
-FILES_${PN}-systemd = "${base_libdir}/systemd/system/"
+FILES_${PN}-systemd = "${systemd_unitdir}/system/"
 RDEPENDS_${PN}-systemd = "${PN}"
 
 FILES_${PN}-bin = "${bindir}/ntp-wait ${bindir}/ntpdc ${bindir}/ntpq ${bindir}/ntptime ${bindir}/ntptrace"
-- 
1.7.8.4



