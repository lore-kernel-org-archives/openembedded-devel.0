Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web08.6607.1603252859448564059
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2020 21:01:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@alistair23.me header.s=fm2 header.b=wBtP0iV5;
 spf=none, err=permanent DNS error (domain: alistair23.me, ip: 66.111.4.27, mailfrom: alistair@alistair23.me)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id B1A235C0092;
	Wed, 21 Oct 2020 00:00:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 21 Oct 2020 00:00:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm2; bh=mSilHLSvzNPw14Z2Ko9dmNmSaO
	SUSLTpIZWve8le96c=; b=wBtP0iV5Cv1SKnPmgYTHYmRiNlLPGzv0i7YZs20AZQ
	V7oCC0lol/MdIuyKODj6RMwWABcsxoq0+OSuXeu/1d8RogUWDMT6kkeiGFgs5Zrr
	W2KCXhoKdXxo9Vd1F34ESiS3pCfK/iWS6kMUMiVxw5lKzOBf53a4kI1h+/6NB0fc
	miQn8wz9uOLfuPzY8KpxODDsZhPIoXP/2ONEvxNe3/FfqjwL+sG8McEPxfJ3m8xQ
	OH3BLUPC2Hd/hqLAJ9nW/fpOqkqVpWXv2rSCFD3TtjwY81TpasgGJOlyGenqun28
	91VNGMFCEJ9uYyLchAF+kD+P4aw4jAQuQciNo3r/Bz+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=mSilHLSvzNPw14Z2K
	o9dmNmSaOSUSLTpIZWve8le96c=; b=dE3X0elSODTQGfnDD4PnHzQwh6kGsicHX
	7Tawb3dtJNUoP6Y05AbFPQsE0J9cbvXr1WNW/tNWT6+t1i1I1eXN0vFz018V5wl1
	6zAreR3MnW7GdGJcuHRJtQJAWXlAlAlWLIN8G/cYltBvc3rcB3DA1+VjifpEZ9NZ
	BhRVcYGpYkjqnIR/asM2+bkcuVY0md8yMyOkWwaXykLWblICtdO0Lm9o443SnM4V
	SfrwcMId0BnPDdUiX5ZvuelRf124c4azP1xo96+0ZpVhLPe9SYV8EqXPX+GK5kIP
	28QN8lVretaBT6bsrs6f1ZZtW+FQQfeXGwis27NUpG8M5pg75cvEA==
X-ME-Sender: <xms:erKPX0hnepuqN3XzQ93GmWtGIS9us8RiXQlEb6K-6H_Pcbs8Gko5qw>
    <xme:erKPX9DFPhoRaNw1fUvi1gl5EGZIGzX0KwA_4l6v-WfpbKGXQcrWs7vFwx77V4K65
    RWoNDDjlqv2TKjbiME>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrjeeggdejjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghirhes
    rghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepjeeliefhvdetgfdtte
    fhtdegffdtiefffeejiefffeevueeljeehjeevhfffueeknecukfhppeejfedrleefrdek
    gedrvddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:erKPX8Fxk0W3guV6YrCXm3XC7TY8htIv2K3FzSLO27CFQc_IGEu5HQ>
    <xmx:erKPX1RBypi7WMsaLUuEKMZb73XH_zG6vVuD2_AqKCLI-A4DuTi8OQ>
    <xmx:erKPXxwNgxI5NnO1X1ByIiuJ0CB0Xbv9anZcuq_A5PvBqr5qOX44-A>
    <xmx:erKPXw9zpUIhkkkX5CFr3B08LBWgTqpjbB-n5qtBSYh7tSDdgNy41w>
Received: from alistair-xps-14z.alistair23.me (c-73-93-84-208.hsd1.ca.comcast.net [73.93.84.208])
	by mail.messagingengine.com (Postfix) with ESMTPA id 142BE3064683;
	Wed, 21 Oct 2020 00:00:58 -0400 (EDT)
From: "Alistair" <alistair@alistair23.me>
To: openembedded-devel@lists.openembedded.org
Cc: Alistair Francis <alistair@alistair23.me>
Subject: [PATCH] wayland-init: Allow setting idle time to 0
Date: Tue, 20 Oct 2020 21:00:49 -0700
Message-Id: <20201021040049.933690-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a PACKAGECONFIG that can be used to set the idle-time to 0. This is
useful for always on machine (such as kiosks) and for debugging.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 meta/recipes-graphics/wayland/weston-init.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 07cec75fb3..b7a99be646 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -15,6 +15,10 @@ SRC_URI = "file://init \
 
 S = "${WORKDIR}"
 
+PACKAGECONFIG ??= ""
+
+PACKAGECONFIG[no-idle-timeout] = ",,"
+
 DEFAULTBACKEND ??= ""
 DEFAULTBACKEND_qemuall ?= "fbdev"
 DEFAULTBACKEND_qemuarm64 = "drm"
@@ -45,6 +49,10 @@ do_install() {
         if [ -n "${DEFAULTBACKEND}" ]; then
 		sed -i -e "/^\[core\]/a backend=${DEFAULTBACKEND}-backend.so" ${D}${sysconfdir}/xdg/weston/weston.ini
 	fi
+
+	if [ "${@bb.utils.contains('PACKAGECONFIG', 'no-idle-timeout', 'yes', 'no', d)}" = "yes" ]; then
+		echo "idle-time=0" >> ${D}${sysconfdir}/xdg/weston/weston.ini
+	fi
 }
 
 inherit update-rc.d features_check systemd
-- 
2.28.0

