Return-Path: <mbc@koumoul.net>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2E10B77083
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Oct 2015 20:31:31 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so73164917wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Oct 2015 13:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id;
	bh=c5p3cWjMwLmJzNNFtc2TSotrdRz/o83VgBEhxMp8JeY=;
	b=jrPIopgSrJ34g1D+4MXezD68H1gJmVISnuGXzWzv2NZgMJFaUzdV/DjjK+us9UQjXe
	ZSa1Cle+jV7Zg8mzGICkry5H6NdpMY0ckwkXLcvY16z7AqpvIItnf1bdYKfa5/4WJZS5
	enopzl6psFsxDthGucltpfW/5hppwluNn9iXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=c5p3cWjMwLmJzNNFtc2TSotrdRz/o83VgBEhxMp8JeY=;
	b=Hh+EnEHdsj9BTJhbImIbI1F5CtwgJju2EyUNuTQtir3eORdeHFfTdPgmGpnpXB7wUH
	KKd15Tr11wS8X1LT3Ee58kUVZC9svhQSRRtIpjhrPPMBRdgC7j8QsUlOXMWnYGFvdy4t
	JgSmG1vbZZCAwlmiLYdBl1cvnxW4/BeEn4vBYSIiOO3fMb0/nX8m/DCL0NEF2HN8beIO
	qNW/u2lvzRbtRZyWx+TesifrB/oIECoIq9rUh89bFK8S/AvHQTlc2JRfQEi4PJlQw4Ju
	9IBJckKi1CQIVDj0FAM28PPM/mpR8J24cY9xt2XzK85J2N90P5QRWy1kKoiBGzWliQ8I
	wpBw==
X-Gm-Message-State: ALoCoQnqyNsPpoeH5sB/ZQ44pNJ83NYaX8ZK/bZ+QWkuhlPfXUp83Jzknj8VVUrFQiP1GvgH49Cg
X-Received: by 10.180.8.132 with SMTP id r4mr4198015wia.70.1443904292047;
	Sat, 03 Oct 2015 13:31:32 -0700 (PDT)
Received: from localhost.localdomain
	(ARennes-655-1-187-70.w2-13.abo.wanadoo.fr. [2.13.130.70])
	by smtp.gmail.com with ESMTPSA id
	gl4sm18074603wjb.29.2015.10.03.13.31.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Oct 2015 13:31:31 -0700 (PDT)
Sender: "Manuel Bachmann [ IoT.bzh ]" <mbc@koumoul.net>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  3 Oct 2015 22:36:02 +0200
Message-Id: <1443904562-21819-1-git-send-email-manuel.bachmann@iot.bzh>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 3/3][meta-multimedia] rygel: Add recipe
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
X-List-Received-Date: Sat, 03 Oct 2015 20:31:34 -0000

Rygel is a UPnP Audio-Video media server, that allows to
share media files to other devices. It can also become a
MediaRenderer controlled by UPnP or DLNA Controllers.

Rygel makes use of the GStreamer library to recognize and
index media files. UPnp clients will then be able to browse
through them with the aid of metadata (artist, date...).

(we do not propose to build without GStreamer support,
because then if cannot parse any actual media file, and
this is pointless)

Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
---
 meta-multimedia/recipes-connectivity/rygel/rygel_0.26.1.bb     | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-multimedia/recipes-connectivity/rygel/rygel_0.26.1.bb

diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.26.1.bb b/meta-multimedia/recipes-connectivity/rygel/rygel_0.26.1.bb
new file mode 100644
index 0000000..e118901
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.26.1.bb
@@ -0,0 +1,32 @@
+SUMMARY = "A UPnP AV media server and renderer"
+DESCRIPTION = "Rygel is a home media solution (UPnP AV MediaServer) that \
+allow you to easily share audio, video and pictures to other devices. \
+Additionally, media player software may use Rygel to become a MediaRenderer \
+that may be controlled remotely by a UPnP or DLNA Controller."
+
+LICENSE = "LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
+                    file://src/rygel/rygel-main.vala;endline=25;md5=a4cce4d389da1c1638fe68d07ae9d811"
+
+DEPENDS = "libxml2 glib-2.0 gssdp gupnp gupnp-av gupnp-dlna gstreamer1.0 gstreamer1.0-plugins-base ossp-uuid libgee libsoup-2.4 libmediaart-2.0"
+RDEPENDS_${PN} = "gstreamer1.0-plugins-base-playback"
+
+GNOME_COMPRESS_TYPE = "xz"
+SRC_URI[archive.md5sum] = "f182d54913a528bb5b4fb2f291aca0fc"
+SRC_URI[archive.sha256sum] = "390740609e34399b886ddb9a8f7eca25055ad72048dfdd869edf02999b1e1d8f"
+
+inherit gnomebase
+
+EXTRA_OECONF = "--disable-introspection --disable-tracker-plugin --with-media-engine=gstreamer"
+
+PACKAGECONFIG ?= "gtk+3"
+PACKAGECONFIG[gtk+3] = ",--without-ui,gtk+3"
+
+do_install_append() {
+       rm -f ${D}/${libdir}/rygel-2.6/engines/*.la
+       rm -f ${D}/${libdir}/rygel-2.6/plugins/*.la
+       rm -rf ${D}/${datadir}/vala
+}
+
+FILES_${PN} += "${libdir}/rygel-2.6 ${datadir}/dbus-1 ${datadir}/icons"
+FILES_${PN}-dbg += "${libdir}/rygel-2.6/engines/.debug ${libdir}/rygel-2.6/plugins/.debug"
-- 
1.8.3.1


