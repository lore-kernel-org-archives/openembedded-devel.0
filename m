Return-Path: <mbc@koumoul.net>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3F6BC766DD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Oct 2015 11:39:41 +0000 (UTC)
Received: by wieq12 with SMTP id q12so15971626wie.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Oct 2015 04:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id;
	bh=uhpHb2MooVc+Te0Mn5qWqxrQSLAzbpwQUCOrncojlCI=;
	b=lhIJs9RgnjFXnZpT/iDJYKSUj/NJLwJOkfz+QpAhXDFUYSDhW4DJr3DtY+bqSwSzou
	vwzRzVblIMS2KkO8pCnWsrS7hobKF1UAxkxlhtazIyQOMlGFIBX3BOYSZACr9S3mHRMF
	Iptfs1fg3iF49asn35hpSQLsoGSWu5UHJKwco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=uhpHb2MooVc+Te0Mn5qWqxrQSLAzbpwQUCOrncojlCI=;
	b=R0/ohACvbGGRmjoBxjnnI6I9D0lgOHp5AQrw+pAZuTv6ULxYPpRqSGKlihB0K1qOrA
	xEeMkgeogvfgoDDe4MWV86dIetq9LDzytNdOCkYETWI2p2sFTlBpAjNf+p9WW+S0fCxz
	tgMaKzF90Kd7k3myoi8dCdz6O/qkvBX6Mn4VbRigcFLTHiM9m9TMyshpBqMMwUs1AIB8
	UWDD/P2oyj8iFK24KZorNbQ6Fwk4z3P7W+w6xWLhMQ4gs8i/FKModFuCoXWlF+MikBti
	UMhLIElGdzpmDEdbzBnyI8x/0b+dE3cEQpmfObbxtlOEEmIf+TBBEftO3H+rIErFE70K
	3L0A==
X-Gm-Message-State: ALoCoQmm+fmdcSrUTzzpyIhOYPlJKGQAnfcKOID4X5HPcpoGe8l5rS2GplubR47yMiKD7RmkxHfp
X-Received: by 10.180.73.46 with SMTP id i14mr2526207wiv.49.1444649981584;
	Mon, 12 Oct 2015 04:39:41 -0700 (PDT)
Received: from centos7.vannes.iot ([46.18.96.42])
	by smtp.gmail.com with ESMTPSA id
	gd10sm19316158wjb.47.2015.10.12.04.39.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Oct 2015 04:39:41 -0700 (PDT)
Sender: "Manuel Bachmann [ IoT.bzh ]" <mbc@koumoul.net>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Oct 2015 13:39:10 +0200
Message-Id: <1444649950-14993-1-git-send-email-manuel.bachmann@iot.bzh>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH v2 2/4][meta-multimedia] gupnp-dlna: Update to 0.9.4, support gstreamer
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
X-List-Received-Date: Mon, 12 Oct 2015 11:39:42 -0000

Minor update.
As we now have GStreamer 1.0+, add a PACKAGECONFIG option
to build the additional "gupnp-dlna-gst" library if it is
present.
This is most notably needed by Rygel.

Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
---
 .../recipes-connectivity/gupnp/gupnp-dlna_0.9.2.bb   | 20 --------------------
 .../recipes-connectivity/gupnp/gupnp-dlna_0.9.4.bb   | 19 +++++++++++++++++++
 2 files changed, 19 insertions(+), 20 deletions(-)
 delete mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.2.bb
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.4.bb

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
index 0000000..17ec52f
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


