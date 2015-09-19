Return-Path: <mbc@koumoul.net>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5798B73D17
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Sep 2015 08:24:23 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so57648404wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Sep 2015 01:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id;
	bh=loNbGxHo9rbbZoRW8owUq4FmaYCxleYoJ+gM72Ck0To=;
	b=QEcVdtvB//3UaJ09kdtMnn6vDpD5orYuHIsc8JY1Il7jAAv62TOsaBjda+VJ07tuO7
	Os/8lVZIQZux24USasmnJoBqIb/tjzmUfJTQdfVi2gDxag3ee+LGvX2xtgo5MChs/w47
	Rwj27LR5BLKxQ8hiny+JVm1XAcIkUkhCS9TQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=loNbGxHo9rbbZoRW8owUq4FmaYCxleYoJ+gM72Ck0To=;
	b=Myh7xjy23nfrOC4l5g5+VPT2QEhVIietJJZ9b2O9jDhtvKugDzOfpKcJSs7AjPBP86
	OO2zlxuF7bkbZLmHMfq7k/kWJUUS6grvX4y74l7mMxaDIFp31fvc6UeBmNxgIeVdxroZ
	klzPiYPOGxzlgiCK0GCf4kLke+JkDQarzGH7yATTGfViLIJt0Hlkwj9nUlckQpaCV4rI
	eZWuJi3VLuWd9mr9cj1DLCemwF8/Cfvsqd+RpIfzhTBhdKeCPYs2DpqojtJQjq7SRS7U
	XFMXjPXkRIy8y5J5k6rNr1meg71vsp+BEJWoxH4+MpaJmEimKjiqsEHaX2cvXXnCNB/l
	x28Q==
X-Gm-Message-State: ALoCoQnIDX3bBm5U8n7/KHTy/IkL05DAZppESntvxsDvdadpK0okira21Kmos8hxcL9yX0n75gRe
X-Received: by 10.180.104.68 with SMTP id gc4mr2642495wib.78.1442651063299;
	Sat, 19 Sep 2015 01:24:23 -0700 (PDT)
Received: from localhost.localdomain
	(ARennes-655-1-41-27.w109-218.abo.wanadoo.fr. [109.218.120.27])
	by smtp.gmail.com with ESMTPSA id
	cm6sm2123450wib.22.2015.09.19.01.24.22
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Sep 2015 01:24:22 -0700 (PDT)
Sender: "Manuel Bachmann [ IoT.bzh ]" <mbc@koumoul.net>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Sep 2015 10:28:35 +0200
Message-Id: <1442651315-18493-1-git-send-email-manuel.bachmann@iot.bzh>
X-Mailer: git-send-email 1.8.3.1
Subject: [meta-oe][PATCH] wayland-fits: Add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 19 Sep 2015 08:24:25 -0000

wayland-fits is a functional integration test suite
for Wayland and Weston.

Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
---
 .../recipes-graphics/wayland/wayland-fits_git.bb   | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/wayland/wayland-fits_git.bb

diff --git a/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb b/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb
new file mode 100644
index 0000000..550e171
--- /dev/null
+++ b/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb
@@ -0,0 +1,30 @@
+SUMMARY = "Wayland-fits, the Wayland Functional Integration Test Suite"
+DESCRIPTION = "Wayland-fits is a fully automated functional integration \
+test suite. Its main purpose is to test the functionality and integration of \
+client-side (i.e. toolkit) and server-side (compositor) implementations of \
+the Wayland protocol."
+HOMEPAGE = "https://github.com/01org/wayland-fits"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f8d34cadaf891753c0f00c6cd48f08f5 \
+                    file://src/extensions/weston/weston-wfits.cpp;endline=21;md5=848c81e55cf3a30a9f6ed75f0dba7a97"
+
+SRC_URI = "git://github.com/01org/wayland-fits.git"
+SRCREV = "f30dfa9fceb438d3687c5215093fffc21a7852fc"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+DEPENDS = "libcheck boost wayland weston"
+RDEPENDS_${PN} = "weston"
+
+EXTRA_OECONF = "--enable-shared --disable-static \
+                --disable-efl-tests --disable-gtk-tests \
+                --with-boost-libdir=${STAGING_LIBDIR}"
+
+do_install_append() {
+	rm -f ${D}/${libdir}/weston/*.la
+}
+
+FILES_${PN} = "${bindir}/wfits ${libdir}/weston/*.so"
+FILES_${PN}-dbg = "${bindir}/.debug ${libdir}/weston/.debug ${prefix}/src"
-- 
1.8.3.1


