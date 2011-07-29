Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QmwAT-0006ZP-Q8
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Jul 2011 01:08:33 +0200
Received: by yib18 with SMTP id 18so2965214yib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jul 2011 16:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=xi0VM5yvr88Tmbl49tgKYv2Du8tAmdAJTYZ47tNi7IM=;
	b=j1p1+N20rvTaGW80Vm2AezXiST28lxpxt4MtD+h/KZZLmLyXMRHHa5xIBIxJ7TJ/kr
	sMxXmRi0vF61UOuV1jd7Iy0u0EaJ7NC3cpXSrfeYAwXAGcMJ/OSQeX46C+tkyp9+xcpv
	7QqWpITX7YC3L7QRFAhYsuHtbhulUVBNFcCng=
Received: by 10.236.127.67 with SMTP id c43mr984548yhi.259.1311980656142;
	Fri, 29 Jul 2011 16:04:16 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id p50sm200626yhj.56.2011.07.29.16.04.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 29 Jul 2011 16:04:14 -0700 (PDT)
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Jul 2011 17:58:07 -0500
Message-Id: <1311980287-31536-1-git-send-email-agnel.joel@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: joelagnel@ti.com, beagleboard@googlegroups.com, jdk@ti.com, k-kooi@ti.com
Subject: [PATCH] gst-plugins-good: v4l2src: Make Leapoard Imaging VGA Camera work out of the box
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
X-List-Received-Date: Fri, 29 Jul 2011 23:08:34 -0000

Format enumeration in Gstreamer expects drivers to implement VIDIOC_ENUM_FMT and if not, it calls
VIDIOC_TRY_FMT on a set of "emulated formats" which could be unsupported resulting in failure of
the format negotiation stage [1]

We add UYVY to the set of formats making the mt9v113 sensor in this camera board and other sensors
that don't support the emulated formats work out-of-the box without needing a caps filter element

[1] http://lists.freedesktop.org/archives/gstreamer-devel/2011-July/032425.html

Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
---
 ...-UYVY-color-format-to-the-list-of-enumera.patch |   43 ++++++++++++++++++++
 recipes/gstreamer/gst-plugins-good_0.10.28.bb      |    4 +-
 2 files changed, 46 insertions(+), 1 deletions(-)
 create mode 100644 recipes/gstreamer/gst-plugins-good/0001-v4l2src-Add-UYVY-color-format-to-the-list-of-enumera.patch

diff --git a/recipes/gstreamer/gst-plugins-good/0001-v4l2src-Add-UYVY-color-format-to-the-list-of-enumera.patch b/recipes/gstreamer/gst-plugins-good/0001-v4l2src-Add-UYVY-color-format-to-the-list-of-enumera.patch
new file mode 100644
index 0000000..88a0125
--- /dev/null
+++ b/recipes/gstreamer/gst-plugins-good/0001-v4l2src-Add-UYVY-color-format-to-the-list-of-enumera.patch
@@ -0,0 +1,43 @@
+From d5a1f365bfd4420912735709bcb8004d3ad7226c Mon Sep 17 00:00:00 2001
+From: Joel A Fernandes <agnel.joel@gmail.com>
+Date: Fri, 29 Jul 2011 17:23:43 -0500
+Subject: [PATCH] v4l2src: Add UYVY color format to the list of enumerations
+
+OMAP3 ISP returns -EINVAL for VIDIOC_ENUM_FMT ioctl on video node. Due to this, format negotiation fails. This adds UYVY format to the list of enumerations.
+
+Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
+---
+ sys/v4l2/gstv4l2object.c |   17 +++++++++++++++++
+ 1 files changed, 17 insertions(+), 0 deletions(-)
+
+diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
+index 7e15489..e04c0fd 100644
+--- a/sys/v4l2/gstv4l2object.c
++++ b/sys/v4l2/gstv4l2object.c
+@@ -1025,6 +1025,23 @@ gst_v4l2_object_fill_format_list (GstV4l2Object * v4l2object)
+         (GCompareFunc) format_cmp_func);
+   }
+ 
++/* Add UYVY format to the list of enumerations */
++  format = g_new0 (struct v4l2_fmtdesc, 1);
++  format->type = (enum v4l2_buf_type)-1;
++  format->index = n;
++  format->flags = 0;
++  format->pixelformat = V4L2_PIX_FMT_UYVY;
++  v4l2object->formats = g_slist_insert_sorted (v4l2object->formats, format,
++      (GCompareFunc) format_cmp_func);
++
++  GST_INFO_OBJECT (v4l2object->element, "index:       %u", format->index);
++  GST_INFO_OBJECT (v4l2object->element, "type:        %d", format->type);
++  GST_INFO_OBJECT (v4l2object->element, "flags:       %08x", format->flags);
++  GST_INFO_OBJECT (v4l2object->element, "description: '%s'",
++      format->description);
++  GST_INFO_OBJECT (v4l2object->element, "pixelformat: %" GST_FOURCC_FORMAT,
++        GST_FOURCC_ARGS (format->pixelformat));
++
+ #ifndef GST_DISABLE_GST_DEBUG
+   {
+     GSList *l;
+-- 
+1.7.0.4
+
diff --git a/recipes/gstreamer/gst-plugins-good_0.10.28.bb b/recipes/gstreamer/gst-plugins-good_0.10.28.bb
index a398f4c..b93236b 100644
--- a/recipes/gstreamer/gst-plugins-good_0.10.28.bb
+++ b/recipes/gstreamer/gst-plugins-good_0.10.28.bb
@@ -1,6 +1,8 @@
 require gst-plugins.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
+
+SRC_URI += "file://0001-v4l2src-Add-UYVY-color-format-to-the-list-of-enumera.patch"
 
 SRC_URI[archive.md5sum] = "6ef1588921f59d85c44ee2e49a3c97a0"
 SRC_URI[archive.sha256sum] = "adfbce68b9fbadb7a7aeda2227af6afe1928ef025af4158726617b9d6834b028"
-- 
1.7.0.4



