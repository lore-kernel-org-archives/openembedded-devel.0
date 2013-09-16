Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9F5286C872
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2013 09:04:34 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id d17so1900224eek.28
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2013 02:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=fVNBEtrZdAkH7kvrYBaruhM8Gj1zs5aNgiI0MIY/uas=;
	b=fh9kP/yWE++K2Cq86Ns3iZMcRu0uvZ+XXO6jgwH1jDsaNLDlpfS8IpZ/vEJebY6Mcg
	UK9hln4Ze+vwil6aJpWmCoPn7cbQsx5UyOQmkbHFHn2rM9IW/Jva6HImGS6+gUR1SMgf
	t88peNQ6mjucv8kKuq20CvbBe7b83YGBW6/tGs49kkIFVhf/0JmQ0TpNJQphf7BpKXoJ
	0APlIytPWUyHbvJD7knWO6gzMUStObAdeNY6bYX9I2Iq07d3hI5EtHKhTztVKeMCzwK4
	NRy25r3Em06JQpzYXSdHBB2kXHcWN6Z+aIu4w7B8KpKr10ffqnsbGcayUFUVCjGrU7tY
	72/g==
X-Received: by 10.15.43.206 with SMTP id x54mr723479eev.79.1379322275808;
	Mon, 16 Sep 2013 02:04:35 -0700 (PDT)
Received: from localhost.localdomain (ip-178-200-247-59.unitymediagroup.de.
	[178.200.247.59])
	by mx.google.com with ESMTPSA id f49sm40119433eec.7.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 16 Sep 2013 02:04:35 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Sep 2013 11:04:13 +0200
Message-Id: <1379322259-3831-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1379322259-3831-1-git-send-email-schnitzeltony@googlemail.com>
References: <1379322259-3831-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-xfce 3/9] libcanberra: handle alsa and pulsaudio by PACKAGECONFIG - defaults based upon DISTRO_FEATURES
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
X-List-Received-Date: Mon, 16 Sep 2013 09:04:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../libcanberra/libcanberra_0.29.bb                |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb b/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb
index 6bb974c..da94c20 100644
--- a/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb
+++ b/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb
@@ -4,7 +4,7 @@ LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://src/canberra.h;beginline=7;endline=24;md5=c616c687cf8da540a14f917e0d23ab03"
 
-DEPENDS = "alsa-lib gstreamer gtk+ gtk+3 libtool libvorbis pulseaudio"
+DEPENDS = "gstreamer gtk+ gtk+3 libtool libvorbis"
 
 inherit autotools
 
@@ -14,9 +14,7 @@ SRC_URI[sha256sum] = "127a5ef07805856d63758e5180ebfb241d1f80094fd301c287591a15b8
 
 EXTRA_OECONF = "\
     --enable-null \
-    --enable-alsa \
     --enable-gstreamer \
-    --enable-pulse \
     --disable-oss \
     --enable-gtk \
     --enable-gtk3 \
@@ -24,6 +22,12 @@ EXTRA_OECONF = "\
     --disable-lynx \
 "
 
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES','alsa','alsa','',d)} \
+                   ${@base_contains('DISTRO_FEATURES','pulseaudio','pulseaudio','',d)} \
+"
+PACKAGECONFIG[alsa] = "--enable-alsa, --disable-alsa, alsa-lib"
+PACKAGECONFIG[pulseaudio] = "--enable-pulse, --disable-pulse, pulseaudio"
+
 python populate_packages_prepend() {
     plugindir = d.expand('${libdir}/${P}/')
     do_split_packages(d, plugindir, '^libcanberra-(.*)\.so$', 'libcanberra-%s', '%s support library', extra_depends='' )
-- 
1.7.6.5


