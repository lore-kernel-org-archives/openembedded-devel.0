Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RXsUq-0006yo-37
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 11:43:36 +0100
Received: by mail-ee0-f47.google.com with SMTP id v2so932295eea.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Dec 2011 02:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Gucr0p84klaqdlPJ8tpkBtC+bksNVzyGrvKSsC3Eizw=;
	b=RtxAC1wj7cp9LAoHb7mtuyeGZvbazCeNntKgTiOwYzIkX047fnwLMoQxKU0aqZx7Va
	gggo+wdNfXDgwF9AdN+g6bWVazt/VLlX1Rqe7PtdBktjvw7H3eM6PPnICj0xerVgNO7V
	Ww5iMqlDpyK8Wvxj+BV6OKTg0O5l4gvqkzezM=
Received: by 10.14.3.148 with SMTP id 20mr2230738eeh.220.1323167809005;
	Tue, 06 Dec 2011 02:36:49 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 49sm69665883eec.1.2011.12.06.02.36.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 02:36:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Dec 2011 11:36:09 +0100
Message-Id: <fe86b9e787a474dbe4a085ce88e0546cba740d3a.1323167378.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <78add3cb4853a6c50ac4f8b41f92b85d6c31a6b3.1323167378.git.Martin.Jansa@gmail.com>
References: <78add3cb4853a6c50ac4f8b41f92b85d6c31a6b3.1323167378.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1323167378.git.Martin.Jansa@gmail.com>
References: <cover.1323167378.git.Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 5/5] syslog-ng: enable systemd support
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
X-List-Received-Date: Tue, 06 Dec 2011 10:43:36 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |   12 +++++++++++-
 .../recipes-support/syslog-ng/syslog-ng_3.2.5.bb   |    2 +-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index c57c5ab..3bbebec 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -9,7 +9,7 @@ RDEPENDS_${PN} += " ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "",
 
 INC_PR = "r6"
 
-inherit autotools
+inherit autotools systemd
 
 SRC_URI = "http://www.balabit.com/downloads/files/syslog-ng/sources/${PV}/source/${PN}_${PV}.tar.gz"
 
@@ -25,6 +25,8 @@ EXTRA_OECONF = " \
   --disable-linux-caps \
   --disable-pcre \
   --disable-sql \
+  --enable-systemd \
+  --with-systemdsystemunitdir=${base_libdir}/systemd/system \
 "
 
 do_configure_prepend() {
@@ -42,6 +44,14 @@ do_install_append() {
         install -m 755 ${WORKDIR}/initscript ${D}/${sysconfdir}/init.d/syslog.${PN}
 }
 
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "${PN}.service"
+
+PACKAGES =+ "${PN}-systemd"
+
+FILES_${PN}-systemd += "${base_libdir}/systemd"
+RDEPENDS_${PN}-systemd += "${PN}"
+
 FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS} \
             ${sysconfdir} ${sharedstatedir} ${localstatedir} \
             ${base_bindir}/* ${base_sbindir}/* \
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.bb
index ff1e247..62faa83 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.bb
@@ -1,5 +1,5 @@
 require syslog-ng.inc
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI += " \
   file://syslog-ng.conf \
-- 
1.7.8



