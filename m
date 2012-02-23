Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S0Xdx-0004lK-Am
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 13:19:29 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so506553eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 04:11:10 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.213.20.1 as permitted sender)
	client-ip=10.213.20.1; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.213.20.1 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.213.20.1])
	by 10.213.20.1 with SMTP id d1mr358159ebb.65.1329999070370 (num_hops =
	1); Thu, 23 Feb 2012 04:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=NWeQqZY+sR6h70DVaLbuuPdBmXuG2IWNv9I9W+GHo5s=;
	b=h402ib6H+/ON0EVascRcSWjtd3jfiOciR+dEBU32CGb3aRCRNRBr92IP9/lpkVPYCu
	g/SyqLnb8m8uWybg4XBRyQoor1ddiO48YEmw0H647kTBtIfpLsxDoLLIXZ9Y2MUFhyIk
	z93z6s3lPGeCVZaYsNvDJClH4RmW/nF+pZftw=
Received: by 10.213.20.1 with SMTP id d1mr283987ebb.65.1329999069734;
	Thu, 23 Feb 2012 04:11:09 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n52sm4739136eea.5.2012.02.23.04.11.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 04:11:09 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2012 13:10:53 +0100
Message-Id: <1329999054-23112-23-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe V3 22/23] busybox: remove unneeded systemd code / use ${systemd_unitdir}
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
X-List-Received-Date: Thu, 23 Feb 2012 12:19:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-core/busybox/busybox_1.19.3.bbappend   |   15 +++++----------
 1 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/meta-oe/recipes-core/busybox/busybox_1.19.3.bbappend b/meta-oe/recipes-core/busybox/busybox_1.19.3.bbappend
index 98b959f..2c73732 100644
--- a/meta-oe/recipes-core/busybox/busybox_1.19.3.bbappend
+++ b/meta-oe/recipes-core/busybox/busybox_1.19.3.bbappend
@@ -1,6 +1,6 @@
 inherit systemd
 
-PRINC := "${@int(PRINC) + 2}"
+PRINC := "${@int(PRINC) + 3}"
 
 # look for files in the layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
@@ -16,16 +16,11 @@ do_install_append() {
 	install -d ${D}${sysconfdir}/default
 	install -m 0644 ${WORKDIR}/busybox-syslog.default ${D}${sysconfdir}/default/busybox-syslog
 
-	install -d ${D}${base_libdir}/systemd/system
 	sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-syslog.service.in \
-	     > ${D}${base_libdir}/systemd/system/busybox-syslog.service
+	     > ${D}${systemd_unitdir}/system/busybox-syslog.service
 	sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-klogd.service.in \
-	     > ${D}${base_libdir}/systemd/system/busybox-klogd.service
+	     > ${D}${systemd_unitdir}/system/busybox-klogd.service
 
-	ln -sf /dev/null ${D}${base_libdir}/systemd/system/syslog.service
+	ln -sf /dev/null ${D}${systemd_unitdir}/system/syslog.service
 }
-
-PACKAGES += "${PN}-syslog-systemd"
-
-RDEPENDS_${PN}-syslog-systemd += "${PN}-syslog"
-FILES_${PN}-syslog-systemd = "${base_libdir}/systemd"
+FILES_${PN}-syslog-systemd = "${systemd_unitdir}/system/syslog.service"
-- 
1.7.6.4



