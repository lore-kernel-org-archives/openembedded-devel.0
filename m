Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dasty82@gmail.com>) id 1Sf80P-0002u3-3Q
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jun 2012 13:14:29 +0200
Received: by wgbdr1 with SMTP id dr1so1498282wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jun 2012 04:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=Qr9EALjqEnM7gP3q6rzOYYEiKfslVmrWxBfwB/L7nCM=;
	b=VU1vCmRQXH9efc7Klve3LdbOHTmLvXTiG38lxiYlv7Ln9vpZo8xWIaiWuu1DBIRnp/
	IXbMUBgF/quG3XvQLdacVIYQsdHijL1fOdkSVnEG6S2jodkYOiD0yu8ROl4zcfmJpgg/
	3b7OaZQx7S+mvnxULPyN8xz8EFFrd+6duvLZeLjHSu4eHuycI7OiYMj/g2pGY8TqF198
	qR84M6dChHMn0gcev3DvQhVVZ9AiCkJ4XKvCN3SvYqkkeTzEju6uI7RcZtm7xckZtccb
	nydnRyqt3nglXqw+WBCCB3jhjkseV+cOtjey53UhR05lBlYeeoVErP/pjTQbiRex+Ujw
	6fKw==
Received: by 10.180.7.133 with SMTP id j5mr3479125wia.14.1339671827926;
	Thu, 14 Jun 2012 04:03:47 -0700 (PDT)
Received: from localhost.localdomain
	(83-64-248-68.inzersdorf.xdsl-line.inode.at. [83.64.248.68])
	by mx.google.com with ESMTPS id gv7sm18095801wib.4.2012.06.14.04.03.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 14 Jun 2012 04:03:46 -0700 (PDT)
Sender: Radek Dostal <dasty82@gmail.com>
From: Radek Dostal <rd@radekdostal.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Jun 2012 13:02:19 +0200
Message-Id: <1339671739-23022-1-git-send-email-rd@radekdostal.com>
X-Mailer: git-send-email 1.7.5.4
Cc: Radek Dostal <rd@radekdostal.com>
Subject: [meta-oe][PATCH] libopus: add libopus_0.9.14
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
X-List-Received-Date: Thu, 14 Jun 2012 11:14:37 -0000

Signed-off-by: Radek Dostal <rd@radekdostal.com>
---
 meta-oe/recipes-multimedia/libopus/libopus-fpu.inc |    6 ++++++
 .../recipes-multimedia/libopus/libopus_0.9.14.bb   |   20 ++++++++++++++++++++
 2 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/libopus/libopus-fpu.inc
 create mode 100644 meta-oe/recipes-multimedia/libopus/libopus_0.9.14.bb

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
diff --git a/meta-oe/recipes-multimedia/libopus/libopus_0.9.14.bb b/meta-oe/recipes-multimedia/libopus/libopus_0.9.14.bb
new file mode 100644
index 0000000..7eb9779
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libopus/libopus_0.9.14.bb
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
+SRC_URI[md5sum] = "c7161b247a8437ae6b0f11dd872e69e8"
+SRC_URI[sha256sum] = "b1cad6846a8f819a141009fe3f8f10c946e8eff7e9c2339cd517bb136cc59eae"
+
+S = "${WORKDIR}/opus-${PV}"
+
+inherit autotools pkgconfig
+
+require libopus-fpu.inc
+EXTRA_OECONF = "${@get_libopus_fpu_setting(bb, d)}"
-- 
1.7.5.4



