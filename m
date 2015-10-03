Return-Path: <mbc@koumoul.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6334B770D2
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Oct 2015 20:31:08 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so73067168wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Oct 2015 13:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id;
	bh=7W2n8gEP2Mo0AupMdG81KbuhHmZd4dU256G8YezguzI=;
	b=dzGn6c36NH+/8xf50dcP1+hMiLo21207g7ic7/eUGLi5CtzuX7mRwokIgVIPPSXaOp
	GAFvmpgbXVSGeLXhDoOuzM6/QM2jmaM9FQ9ge3GVL3hXc+yqc4u27ABydK8x6LPEJcZZ
	BJ34zafNO+vhWu0j8rAlycDViw+KRT2aLgLV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=7W2n8gEP2Mo0AupMdG81KbuhHmZd4dU256G8YezguzI=;
	b=Vh//CIHbJaFPwVWXsh9JS+Sur4FTdLv9Iv5lMHaQ8KpMEH1I57ETcDu7PhCkPE5Squ
	C7wcBGInj0VndTM/4cLIsHz51ujLfPGv+CJk61htHg9EH2PwYgPimCwsvqTHTtp3ouDW
	xMoyYhGL2Ehk5qSoN2H2fLmAaQJ8EHHcHpvl/uOuC8dV1JUrAQ0ilJtmmlglbPriBFQJ
	GYp2XvHNakiirWHJ4xg9EAG4epaqyzX9Bb3y8U6UVb5AVC8rKg1dyWewMkbypzSP66eq
	smdpy3Fja3JSvesqwfqciiq/0+0MdbIEJX6yEsuszT3hPnlNW8nh/byvEBH0m1C2dKE/
	G/Zw==
X-Gm-Message-State: ALoCoQmdKkTwzQFncS7pc8s3SfR8y/R72EahxPUjANB0JX39SlE4HcKPBS0rUbReEsAvGdVu0e3q
X-Received: by 10.194.179.103 with SMTP id df7mr25668612wjc.69.1443904268718; 
	Sat, 03 Oct 2015 13:31:08 -0700 (PDT)
Received: from localhost.localdomain
	(ARennes-655-1-187-70.w2-13.abo.wanadoo.fr. [2.13.130.70])
	by smtp.gmail.com with ESMTPSA id
	pb4sm18090325wjb.8.2015.10.03.13.31.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Oct 2015 13:31:08 -0700 (PDT)
Sender: "Manuel Bachmann [ IoT.bzh ]" <mbc@koumoul.net>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  3 Oct 2015 22:35:39 +0200
Message-Id: <1443904539-21781-1-git-send-email-manuel.bachmann@iot.bzh>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 2/3][meta-multimedia] gupnp-dlna: Update to 0.9.4, support gstreamer
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
X-List-Received-Date: Sat, 03 Oct 2015 20:31:09 -0000

Minor update.
As we now have GStreamer 1.0+, add a PACKAGECONFIG option
to build the additional "gupnp-dlna-gst" library if it is
present.
This is most notably needed by Rygel.

Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
---
 meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.2.bb   | 20 --------------------
 meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.4.bb   | 19 +++++++++++++++++++
 delete mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.2.bb
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.4.bb
 2 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.2.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.2.bb
deleted file mode 100644
index b7e71cf..0000000
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.2.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "Helpers for AV applications using DLNA"
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
-                    file://libgupnp-dlna/gupnp-dlna-profile.h;beginline=1;endline=22;md5=1b85459f65cb1e73a885ca137aab6274"
-
-DEPENDS = "libxml2 glib-2.0"
-
-SRC_URI = "http://download.gnome.org/sources/${BPN}/0.9/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "d972f9b03f0f3793cb895eb034ea314f"
-SRC_URI[sha256sum] = "c28d5650604c7da4f193e6b85049a4885f3a01f1996df768d55b5cb898a9fc53"
-
-inherit autotools pkgconfig
-
-require no-vala.inc
-
-# The GStreamer metadata backend requires GStreamer 1.0, so skip this until we
-# have that packaged.
-EXTRA_OECONF = "--disable-gstreamer-metadata-backend"
-
-FILES_${PN} += "${datadir}/gupnp-dlna-2.0/dlna-profiles"
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.4.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.4.bb
new file mode 100644
index 0000000..b7e71cf
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.4.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Helpers for AV applications using DLNA"
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
+                    file://libgupnp-dlna/gupnp-dlna-profile.h;beginline=1;endline=22;md5=1b85459f65cb1e73a885ca137aab6274"
+
+DEPENDS = "libxml2 glib-2.0"
+
+SRC_URI = "http://download.gnome.org/sources/${BPN}/0.9/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "f93665e535a512e4d515a86311435cb6"
+SRC_URI[sha256sum] = "69969713f36c0e815fbbbcfdfb3ad9bd447cfd10d0fd86227d82dfd8edb6c807"
+
+inherit autotools pkgconfig
+
+require no-vala.inc
+
+PACKAGECONFIG ?= "gstreamer"
+PACKAGECONFIG[gstreamer] = "--enable-gstreamer-metadata-backend,--disable-gstreamer-metadata-backend,gstreamer1.0 gstreamer1.0-plugins-base"
+
+FILES_${PN} += "${datadir}/gupnp-dlna-2.0/dlna-profiles"
-- 
1.8.3.1


