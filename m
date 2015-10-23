Return-Path: <Wenzong.Fan@windriver.com>
X-Greylist: delayed 1772 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 23 Oct 2015 11:00:01 UTC
Received: from mail5.wrs.com (unknown [64.129.254.146])
	by mail.openembedded.org (Postfix) with ESMTP id 585687704E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2015 11:00:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id t9NAUTSW028642
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2015 03:30:29 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 23 Oct 2015 03:30:29 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Oct 2015 06:30:27 -0400
Message-ID: <1445596227-83194-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2][meta-multimedia] gst-plugins-good: fix depends to libgudev
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
X-List-Received-Date: Fri, 23 Oct 2015 11:00:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Wenzong Fan <wenzong.fan@windriver.com>

Depends on libgudev directly base on oe-core commit:

  commit e11801d031896351364e7723db3392012f58b603
  Author: Andreas Müller <schnitzeltony@googlemail.com>
  Date:   Fri Oct 2 22:27:21 2015 +0200

    udev: add PROVIDES = "libgudev"

    With the last update of systemd libgudev was splitted out of systemd. To make
    packages depending on libgudev happy, a recipe building libgudev was created in
    meta-oe and the dependencies were modified from udev to libgudev.

    This works fine for distros using systemd as init system, but distros not using
    build udev which provides libgudev.

    Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb
index af18281..eaf3b1f 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb
@@ -16,7 +16,7 @@ PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
 PACKAGECONFIG[jpeg] = "--enable-jpeg,--disable-jpeg,jpeg"
 PACKAGECONFIG[wavpack] = "--enable-wavpack,--disable-wavpack,wavpack"
 PACKAGECONFIG[gdkpixbuf] = "--enable-gdk_pixbuf,--disable-gdk_pixbuf,gdk-pixbuf"
-PACKAGECONFIG[v4l] = "--enable-gst_v4l2 --with-gudev,--disable-gst_v4l2 --without-gudev,udev"
+PACKAGECONFIG[v4l] = "--enable-gst_v4l2 --with-gudev,--disable-gst_v4l2 --without-gudev,libgudev"
 # sub-feature of v4l, but control separately since libv4l is not part of oe-core
 PACKAGECONFIG[libv4l] = "--with-libv4l2,--without-libv4l2,libv4l"
 PACKAGECONFIG[bzip2] = "--enable-bz2,--disable-bz2,bzip2"
-- 
1.9.1


