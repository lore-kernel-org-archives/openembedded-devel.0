Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dasty82@gmail.com>) id 1SUBuc-0003k9-Qm
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2012 09:11:14 +0200
Received: by wgbdr1 with SMTP id dr1so4850615wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2012 00:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=mUTyRmGBG/3sIpq5W1BhgcPhs0xEoW3keMDXO4K+zmw=;
	b=zf+H+VMzCLlK2u1M1WomnDKAh+zacs+EUkfHzk6Yp/ZcY2x43iOzRw4JcuHgcQ1sWU
	/JVG70vKGfpVj80WLjLm0vYeUSgV3ewTr+2Z8dErqv4oalxlwoR5t9hxxlNcuE/WMHMK
	nxpOU5tC5LyZWvh61U/fzGWeALIhjsvGUbmW2dZ1FKGh7i10ay0dzDUsJd+D3JHvHuMA
	xqvV1W5tc1vtY3qkIgj7ZjTdBh+wBlFeO3ioExUmHbXutrcTYvMqjA3NJ4X9Swk5BZei
	Trixzm2wS0biTXtz7rhS5tyl7AyyCuMNXP7Ed3XdqyrZqxK8TzPoVBygfVO5i9C2Fi5k
	CoDQ==
Received: by 10.180.84.4 with SMTP id u4mr5371591wiy.2.1337065275174;
	Tue, 15 May 2012 00:01:15 -0700 (PDT)
Received: from localhost.localdomain
	(83-64-248-68.inzersdorf.xdsl-line.inode.at. [83.64.248.68])
	by mx.google.com with ESMTPS id gd4sm63737936wib.6.2012.05.15.00.01.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 May 2012 00:01:14 -0700 (PDT)
Sender: Radek Dostal <dasty82@gmail.com>
From: Radek Dostal <rd@radekdostal.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 May 2012 09:00:11 +0200
Message-Id: <1337065211-7593-1-git-send-email-rd@radekdostal.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH] libopus: add libopus_0.9.10
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
X-List-Received-Date: Tue, 15 May 2012 07:11:14 -0000

Signed-off-by: Radek Dostal <rd@radekdostal.com>
---
 meta-oe/recipes-multimedia/libopus/libopus-fpu.inc |    6 ++++++
 .../recipes-multimedia/libopus/libopus_0.9.10.bb   |   20 ++++++++++++++++++++
 2 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/libopus/libopus-fpu.inc
 create mode 100644 meta-oe/recipes-multimedia/libopus/libopus_0.9.10.bb

diff --git a/meta-oe/recipes-multimedia/libopus/libopus-fpu.inc b/meta-oe/recipes-multimedia/libopus/libopus-fpu.inc
new file mode 100644
index 0000000..ed16602
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libopus/libopus-fpu.inc
@@ -0,0 +1,6 @@
+
+def get_libopus_fpu_setting(bb, d):
+	if d.getVar('TARGET_FPU', True) in [ 'soft' ]:
+		return "--enable-fixed-point"
+	return ""
+
diff --git a/meta-oe/recipes-multimedia/libopus/libopus_0.9.10.bb b/meta-oe/recipes-multimedia/libopus/libopus_0.9.10.bb
new file mode 100644
index 0000000..392836f
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libopus/libopus_0.9.10.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Opus Audio Codec"
+DESCRIPTION = "The Opus codec is designed for interactive \
+speech and audio transmission over the Internet. It is \
+designed by the IETF Codec Working Group and incorporates \
+technology from Skype's SILK codec and Xiph.Org's CELT codec."
+HOMEPAGE = "http://www.opus-codec.org/"
+SECTION = "libs/multimedia"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6d9f9b3714db6bbcfb6e42170d9c664d"
+
+SRC_URI = "http://downloads.xiph.org/releases/opus/opus-${PV}.tar.gz"
+SRC_URI[md5sum] = "afbda2fd20dc08e6075db0f60297a137"
+SRC_URI[sha256sum] = "4e379a98ba95bbbfe9087ef10fdd05c8ac9060b6d695f587ea82a7b43a0df4fe"
+
+S = "${WORKDIR}/opus-${PV}"
+
+inherit autotools pkgconfig
+
+require libopus-fpu.inc
+EXTRA_OECONF = "${@get_libopus_fpu_setting(bb, d)}"
-- 
1.7.5.4



