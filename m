Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SpbSg-000812-9U
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 10:42:57 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2247550bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 01:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=UONhTOX8Rl9oTLwGHsubxf8TdO4U/WgBRWdLYzl9uNk=;
	b=nXYl9SZfddcU1wjoE0Ut7gp5iXWokVkcqxdPr8w8HYG3OkfOub5DIU4gAuT0O2f0tn
	js/PVKypD79cubKxLdiL45Zlx8tExKmLvf/iRWiixhbNBpojCo7X+9ty9ZAceSapd/af
	idKJaKBgcYhpPd5UDE5fHiFnGMEyj7AH7qKx2C8jUcUv5WOdU+lZ0kVDrXgtDvBpC+Pz
	p10u73cgSMoKpSFSOWPCz+lZ1ANlyiXFlQMEhjObO6escFHiQnjPUV2wXDGdf0g8oh7k
	dXqT1ecXOvYqvRh4Zf17txEqXabo7XM/3Pe0Eg1FfWsR0FErGy3T84DQ9GesNVixE8O2
	romg==
Received: by 10.205.133.11 with SMTP id hw11mr158531bkc.46.1342168302164;
	Fri, 13 Jul 2012 01:31:42 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id fu8sm4214355bkc.5.2012.07.13.01.31.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 01:31:40 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 10:30:31 +0200
Message-Id: <1342168240-7760-24-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
References: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe, V2 23/32] cherokee: move systemd support to meta-systemd
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
X-List-Received-Date: Fri, 13 Jul 2012 08:43:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../cherokee/cherokee_1.2.98.bb                    |   10 +++-------
 .../cherokee/cherokee/cherokee.service             |    0
 .../cherokee/cherokee_1.2.98.bbappend              |   10 ++++++++++
 3 files changed, 13 insertions(+), 7 deletions(-)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-connectivity/cherokee/cherokee/cherokee.service (100%)
 create mode 100644 meta-systemd/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bbappend

diff --git a/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb b/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb
index a4835e0..f481c42 100644
--- a/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb
+++ b/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb
@@ -5,17 +5,16 @@ SECTION = "network"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-PR = "r4"
+PR = "r5"
 
 DEPENDS = "libpcre openssl mysql5 ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SRC_URI = "http://www.cherokee-project.com/download/1.2/${PV}/cherokee-${PV}.tar.gz \
-           file://cherokee.init \
-           file://cherokee.service"
+           file://cherokee.init"
 SRC_URI[md5sum] = "21b01e7d45c0e82ecc0c4257a9c27feb"
 SRC_URI[sha256sum] = "042b5687b1a3db3ca818167548ce5d32c35e227c6640732dcb622a6f4a078b7d"
 
-inherit autotools pkgconfig binconfig update-rc.d systemd
+inherit autotools pkgconfig binconfig update-rc.d
 
 EXTRA_OECONF = "--disable-static \
                 --disable-nls \
@@ -45,6 +44,3 @@ CONFFILES_${PN} = " \
 
 INITSCRIPT_NAME = "cherokee"
 INITSCRIPT_PARAMS = "defaults 91 91"
-
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "cherokee.service"
diff --git a/meta-oe/recipes-connectivity/cherokee/cherokee/cherokee.service b/meta-systemd/meta-oe/recipes-connectivity/cherokee/cherokee/cherokee.service
similarity index 100%
rename from meta-oe/recipes-connectivity/cherokee/cherokee/cherokee.service
rename to meta-systemd/meta-oe/recipes-connectivity/cherokee/cherokee/cherokee.service
diff --git a/meta-systemd/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bbappend b/meta-systemd/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bbappend
new file mode 100644
index 0000000..7cc7dd8
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bbappend
@@ -0,0 +1,10 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+PRINC := "${@int(PRINC) + 1}"
+
+inherit systemd
+
+SRC_URI += "file://cherokee.service"
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "cherokee.service"
-- 
1.7.6.5



