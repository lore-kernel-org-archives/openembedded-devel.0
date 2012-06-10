Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sdq3g-0001fb-Kv
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jun 2012 23:52:28 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so2267906wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2012 14:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=zLn8U70sj9/YTAGgCFRsvL2mGGkW2p8r9bRwkAE7F9Y=;
	b=L0TFshA5PRyYzEd2gewoFu5j5cLpoQMf00K9vut5VRfylFF2mugoHqj9BYEoFogpg2
	foFckfoND1Ref40EJpEBmMZ6HCgUJpNiSdN8bzZ+thx/eJ1Q9EJC+ljvSqN7BqEkgDsW
	Ux07e8ayxL+WOdlp+ZwBOUNdBDsBEfy5QVUmlRFA+VV+N/KIBc1lnkgBKwqRwxntuiI2
	gptklMEzkBZ+6/IExjC83Mk0nysOhi1mfK9ukpDsb7wFYhWkrkUMJpFibv3UjWGGtX91
	gGvhVeu04XqoDTLCaFBzg+uz6377gLIGKqIR2Vzf2m/ldBqZ3V8GzE+hfD8Zc85zVLSg
	1eBA==
Received: by 10.180.7.133 with SMTP id j5mr15843938wia.14.1339364518181;
	Sun, 10 Jun 2012 14:41:58 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2104.dip.t-dialin.net. [91.10.33.4])
	by mx.google.com with ESMTPS id gc6sm19758306wib.0.2012.06.10.14.41.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 10 Jun 2012 14:41:57 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2012 23:46:51 +0200
Message-Id: <1339364820-2880-19-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
References: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [RFC, meta-oe 18/27] cherokee: move systemd support to meta-systemd
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
X-List-Received-Date: Sun, 10 Jun 2012 21:52:28 -0000
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
index 0000000..0b8dff1
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bbappend
@@ -0,0 +1,10 @@
+FILESEXTRAPATHS := "${THISDIR}/${PN}"
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
1.7.4.4



