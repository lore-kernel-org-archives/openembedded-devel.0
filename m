Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rumqs-0001JL-L9
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 16:21:02 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so2181054eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 07:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=nvwyVJ2tceBGf3ZcP8PMoZcp6aTiaSX20PvKyBMdK+A=;
	b=u16Cz8NtWeqP0RzKfPLv6V+Gjb2GlgWK/XxtNxq35BldUU56kfCgHcGk6rgBSViN4J
	HjPA8JDEn/bDVCk+IfvmoqX4E2TdUa9YFGrJlLz65q1esidvKEjUfgw5li2J/tz+cKdp
	Lo4xxLD2bSeRVVeWIST9hr7DTPx9v2AKOMHM8=
Received: by 10.14.48.66 with SMTP id u42mr7211521eeb.59.1328627582626;
	Tue, 07 Feb 2012 07:13:02 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n58sm1424741een.10.2012.02.07.07.13.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 07:13:02 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Feb 2012 16:12:36 +0100
Message-Id: <1328627573-5217-11-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][RFC 10/27] busybox: remove unneeded systemd code
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
X-List-Received-Date: Tue, 07 Feb 2012 15:21:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-core/busybox/busybox_1.19.3.bbappend   |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-core/busybox/busybox_1.19.3.bbappend b/meta-oe/recipes-core/busybox/busybox_1.19.3.bbappend
index 7e72a43..a64b5e1 100644
--- a/meta-oe/recipes-core/busybox/busybox_1.19.3.bbappend
+++ b/meta-oe/recipes-core/busybox/busybox_1.19.3.bbappend
@@ -15,7 +15,6 @@ SYSTEMD_SERVICE_${PN}-syslog-systemd = "busybox-syslog.service"
 do_install_append() {
 	install -m 0644 ${WORKDIR}/busybox-syslog.default ${D}${sysconfdir}/default/busybox-syslog
 
-	install -d ${D}${base_libdir}/systemd/system
 	sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-syslog.service.in \
 	     > ${D}${base_libdir}/systemd/system/busybox-syslog.service
 	sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-klogd.service.in \
@@ -23,8 +22,3 @@ do_install_append() {
 
 	ln -sf /dev/null ${D}${base_libdir}/systemd/system/syslog.service
 }
-
-PACKAGES += "${PN}-syslog-systemd"
-
-RDEPENDS_${PN}-syslog-systemd += "${PN}-syslog"
-FILES_${PN}-syslog-systemd = "${base_libdir}/systemd"
-- 
1.7.6.4



