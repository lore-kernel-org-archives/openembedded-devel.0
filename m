Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ADBD975967
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jun 2015 02:55:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5F2tmEs013527
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Jun 2015 19:55:48 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Sun, 14 Jun 2015 19:55:48 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Jun 2015 10:48:43 +0800
Message-ID: <1434336523-13505-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH][meta-multimedia] gst-plugins-bad: fix CVE-2015-0797
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
X-List-Received-Date: Mon, 15 Jun 2015 02:55:50 -0000
Content-Type: text/plain

Backport patch from debian to fix CVE-2015-0797.

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=784220
https://sources.debian.net/data/main/g/gst-plugins-bad0.10/0.10.23-7.1+deb7u2/debian/patches/buffer-overflow-mp4.patch

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../gst-plugins-bad/buffer-overflow-mp4.patch      | 36 ++++++++++++++++++++++
 .../gstreamer-0.10/gst-plugins-bad_0.10.23.bb      |  2 ++
 2 files changed, 38 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-bad/buffer-overflow-mp4.patch

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-bad/buffer-overflow-mp4.patch b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-bad/buffer-overflow-mp4.patch
new file mode 100644
index 0000000..235acda
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-bad/buffer-overflow-mp4.patch
@@ -0,0 +1,36 @@
+Description: Fix buffer overflow in mp4 parsing
+Author: Ralph Giles <giles@mozilla.com>
+---
+Backport patch from debian to fix CVE-2015-0797.
+https://sources.debian.net/data/main/g/gst-plugins-bad0.10/0.10.23-7.1+deb7u2/debian/patches/buffer-overflow-mp4.patch
+
+Upstream-Status: Backport
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+--- gst-plugins-bad0.10-0.10.23.orig/gst/videoparsers/gsth264parse.c
++++ gst-plugins-bad0.10-0.10.23/gst/videoparsers/gsth264parse.c
+@@ -384,6 +384,11 @@ gst_h264_parse_wrap_nal (GstH264Parse *
+ 
+   GST_DEBUG_OBJECT (h264parse, "nal length %d", size);
+ 
++  if (size > G_MAXUINT32 - nl) {
++    GST_ELEMENT_ERROR (h264parse, STREAM, FAILED, (NULL),
++        ("overflow in nal size"));
++    return NULL;
++  }
+   buf = gst_buffer_new_and_alloc (size + nl + 4);
+   if (format == GST_H264_PARSE_FORMAT_AVC) {
+     GST_WRITE_UINT32_BE (GST_BUFFER_DATA (buf), size << (32 - 8 * nl));
+@@ -452,6 +457,11 @@ gst_h264_parse_process_nal (GstH264Parse
+     GST_DEBUG_OBJECT (h264parse, "not processing nal size %u", nalu->size);
+     return;
+   }
++  if (G_UNLIKELY (nalu->size > 20 * 1024 * 1024)) {
++    GST_DEBUG_OBJECT (h264parse, "not processing nal size %u (too big)",
++        nalu->size);
++    return;
++  }
+ 
+   /* we have a peek as well */
+   nal_type = nalu->type;
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-bad_0.10.23.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-bad_0.10.23.bb
index 0f64871..4d94483 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-bad_0.10.23.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-bad_0.10.23.bb
@@ -10,6 +10,8 @@ DEPENDS += "gst-plugins-base"
 
 PR = "r4"
 
+SRC_URI += "file://buffer-overflow-mp4.patch"
+
 inherit gettext gsettings
 
 EXTRA_OECONF += "--disable-experimental \
-- 
1.9.1


