Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDylm-0001l8-2x
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:27:22 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2999326bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=qTyOOcF92jYKFqTEVmyNRPbPPgtV97g+tzRXK2M0HgE=;
	b=vvx95fWX+quAmKwKe1imasIcQcayubC8umx+Jn7IHaOS8ekalnIL+OQYyvckhfcH85
	ThmYXqVLbAcGoMcc+3iclbFZBm8SG+2uIwf4D8pgiXo8c/lJL7rJpc8dvSvg1D36250l
	GGQOP4LDRugV3ZOQmFSqlLd6/IzLUlDRJ6RCjo3+Rb+uZaHkQfoCo/R+GAZ1kshu9kv6
	0VQkVC6NF/WoF1VSQ+TFY6kBZ5OXj/6ltw+SRhd2u5iqF0fk1mYfLFH1NpnVSXG9mwHY
	65jXNm+Vw6Pl3CvwiERkaCHDXS5De1Xdn1zTw0TyYVPzpJpqMxp+w4dDtW3GVTZTb4Sd
	fnTQ==
Received: by 10.204.10.92 with SMTP id o28mr4260bko.39.1347977684115;
	Tue, 18 Sep 2012 07:14:44 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.14.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:14:43 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:13:01 +0200
Message-Id: <1347977601-28665-21-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 20/40] tumbler: update to 0.1.25
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
X-List-Received-Date: Tue, 18 Sep 2012 14:32:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{tumbler_0.1.23.bb => tumbler_0.1.25.bb}       |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-xfce/recipes-xfce/tumbler/{tumbler_0.1.23.bb => tumbler_0.1.25.bb} (83%)

diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.23.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.25.bb
similarity index 83%
rename from meta-xfce/recipes-xfce/tumbler/tumbler_0.1.23.bb
rename to meta-xfce/recipes-xfce/tumbler/tumbler_0.1.25.bb
index cd95a03..3c2c2b3 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.23.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.25.bb
@@ -1,11 +1,14 @@
 DESCRIPTION="Thumbnail service implementing the thumbnail management D-Bus specification"
 SECTION = "x11/libs"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "dbus-glib freetype gdk-pixbuf poppler"
 
 inherit xfce
 
+SRC_URI[md5sum] = "d4edc15c172714c7a3eaf3c719b8faf6"
+SRC_URI[sha256sum] = "02d5de508d8c18692a25a832a9280c2043f6b7c90dd3fcbd87f5955337015546"
+
 INSANE_SKIP_${PN} = "dev-so"
 
 do_install_append() {
@@ -27,6 +30,3 @@ FILES_${PN}-dbg += "${libdir}/tumbler-1/.debug \
                     ${libdir}/tumbler-1/plugins/.debug \
                     ${libdir}/tumbler-1/plugins/cache/.debug \
 "
-
-SRC_URI[md5sum] = "c6cf6821f5d884cbf2c26f45f2fecc74"
-SRC_URI[sha256sum] = "b3066d17b7e1fee5135eb876a7c2c50a1221bd0d447c3dd7c36efe6d7f3874cb"
-- 
1.7.6.5



