Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rumr5-0001JN-JL
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 16:21:16 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so2181069eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 07:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=an0ZsD+2FrdILgEhqSLDy9BOQayBz7Egk80yITDp4vg=;
	b=BUYfCZggahuE20Gj+yPuWWBtkoVsGrI1MWzQzAg211xtgo46gzjPh/VRe1tylEuAf2
	fWZUXeaemzRiqTsSHwWgxdOTtefAdzT/1YEvH6Wcl5+cI38hUipPJmkm5PsFExrAjL2u
	ZTdYj3txKsbKZFRd+PStdsWLLl1uKKH2RRVXo=
Received: by 10.14.149.20 with SMTP id w20mr6373077eej.64.1328627595574;
	Tue, 07 Feb 2012 07:13:15 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n58sm1424741een.10.2012.02.07.07.13.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 07:13:15 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Feb 2012 16:12:47 +0100
Message-Id: <1328627573-5217-22-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][RFC 21/27] lighthttpd: inherit systemd / added systemd native support / remove unneeded systemd code
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
X-List-Received-Date: Tue, 07 Feb 2012 15:21:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../lighttpd/lighttpd_1.4.30.bbappend              |   14 ++++++--------
 1 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend b/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend
index b914405..562fe7c 100644
--- a/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend
+++ b/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend
@@ -1,16 +1,14 @@
 FILESEXTRAPATHS := "${THISDIR}/${PN}"
- 
-PRINC = "1"
+PRINC = "2"
 
 SRC_URI += "file://lighttpd.service"
 
-do_install_append() {
-	install -d ${D}${base_libdir}/systemd/systemd/
-	install -m 0644 ${WORKDIR}/lighttpd.service ${D}${base_libdir}/systemd/systemd/
+inherit systemd
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE_${PN}-systemd = "lighttpd.service"
 
+do_install_append() {
 	install -d ${D}${base_libdir}/systemd/systemd/multi-user.target.wants
 	ln -sf ../lighttpd.service ${D}${base_libdir}/systemd/systemd/multi-user.target.wants
 }
-
-FILES_${PN} += "${base_libdir}/systemd"
-
-- 
1.7.6.4



