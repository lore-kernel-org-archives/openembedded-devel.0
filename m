Return-Path: <alistair@alistair23.me>
X-Greylist: delayed 356 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 08 Feb 2020 05:01:14 UTC
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
	[64.147.123.21])
	by mail.openembedded.org (Postfix) with ESMTP id BE2C360974
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Feb 2020 05:01:14 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id D8A004EC;
	Fri,  7 Feb 2020 23:55:18 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute7.internal (MEProxy); Fri, 07 Feb 2020 23:55:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm3; bh=bXkXQhxCTszCuuGlkka9sLBZVO
	Pn6/DE/XPHhO5BaHA=; b=Cs6fnsA0b2qHo2fXPCflgS9VvNowjlneJvmQxM0KFx
	fUuguoGPfZ+8I7pez173apENcKPFtqW/h4dD60E7HlIdHupOavpakKiuZDGqdn5e
	nWVvvQ3KKbqqSTfTtPWoaR4qNWaXoteki35g8a2GLbuz3IdVOhPjs47frksWbuV/
	Ka89ySoDegTNw/wBJqGTwgkwQ092FC+eOE34Ez6i8CtMrbqnKd5ZLkKrfIO7wG1S
	lWjpwknXG9Y0UCCCeYTJzc7hQ22/Gqr0QHSEUVYDja16KuxByBcMzE5ILg4uicOw
	X1DZtNmWAz0MtT6WItsYLfbaN2+r0daWwVmACoB3Qr3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=bXkXQhxCTszCuuGlk
	ka9sLBZVOPn6/DE/XPHhO5BaHA=; b=SB2h02luPfbd8fvfiep3azlf6nCwVUjJ+
	2acKf+GT2wXkoseumwS/piTr+W+jY4rvwGhvNBEdj8IpqcURow6zK6fRvSYOP65F
	hzOfanbUzDcrhg4XPrqX5rl4M0l2/0gZX/QqShPhyCI6mZo8X5dAut/38gDcTdBM
	hddaDc5BiI9gmr55+6cKLr6w1ZRQv/Ec1jT2hCm+gYH7dancFX1bb3yV7zxlwJ2T
	HsaLrwDQ/3whgZEsETOEcbTQMlSP8/lSL1lLHlKqvh9YIN2Q7TtdzJsKEYHGkioc
	rMFh0vCUnPnzBnTqxWsB2XnNFyuLjQa1aZK6x0DeSc4X0QCMHAa7w==
X-ME-Sender: <xms:Nj8-XpNN8TtWQaI0OImWLJh6gJS2ExLtEFi2FQgxBSuaWDDR15c1sQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrheeigdejjecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
	dtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghirhes
	rghlihhsthgrihhrvdefrdhmvgeqnecuffhomhgrihhnpehgihhthhhusgdrtghomhenuc
	fkphepjeefrdelfedrkeegrddvtdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
	rghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgv
X-ME-Proxy: <xmx:Nj8-Xm0jx7xe7I3QnTU28q0Bm-scwyqmQEtcPOgMI1wDGZ4eweTFsQ>
	<xmx:Nj8-XgHESNwU5y5laoTmPI3I49rE8VSB02lEdjODc6vomRrGi538Iw>
	<xmx:Nj8-Xj5o6idyxKDu1BaEYKEc1lbMaozPKrH4BBOX9ByfIbg8gtYh7g>
	<xmx:Nj8-Xtlpf9aaWNmNBcKii44u0YlhFWfYlk2UMn2sEHwwzLSTWkcasg>
Received: from alistair-xps-14z.alistair23.me
	(c-73-93-84-208.hsd1.ca.comcast.net [73.93.84.208])
	by mail.messagingengine.com (Postfix) with ESMTPA id A83B13060272;
	Fri,  7 Feb 2020 23:55:17 -0500 (EST)
From: Alistair Francis <alistair@alistair23.me>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Feb 2020 20:55:14 -0800
Message-Id: <20200208045514.18797-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] libchamplain: Add support for building libchamplain
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 08 Feb 2020 05:01:14 -0000
Content-Transfer-Encoding: 8bit

libchamplain is a Gtk widget displaying zoomable and pannable maps that
can be loaded from various network sources.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 .../libchamplain/libchamplain_0.12.20.bb             | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.20.bb

diff --git a/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.20.bb b/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.20.bb
new file mode 100644
index 000000000..90e553301
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.20.bb
@@ -0,0 +1,12 @@
+SUMMARY = "libchamplain is a Gtk widget displaying zoomable and pannable maps"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
+DEPENDS = "glib-2.0 gtk+3 gdk-pixbuf clutter-1.0 clutter-gtk-1.0 libsoup-2.4"
+
+inherit meson gobject-introspection
+
+SRCREV = "145e417f32e507b63c21ad4e915b808a6174099e"
+SRC_URI = "git://github.com/gnome/libchamplain.git"
+
+S = "${WORKDIR}/git"
+
-- 
2.25.0


