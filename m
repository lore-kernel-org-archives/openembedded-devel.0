Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S9Mz8-00088l-Uz
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Mar 2012 21:45:50 +0100
Received: by wera1 with SMTP id a1so5400117wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2012 13:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=BO0FQewFgNO5/zVlOOl+ZyQJ6V7Cojir7ctq214okA4=;
	b=kgsRQzYTK6NFQVTT+zQX4vrveMVcoDo75XsuzitwJmWrZoxIUckPa1m1vqGedw3T1Q
	4FsC4+8ORITzQaW4YW/YIF2C1On7hQE9DPE6MItUwyn/BSm30p36pYDlfDkkPAdsFEGe
	lsLVNAoX4YuchI4ay6y2Wo27XR6HaTnqemJETds09kRkCrngnlH1BhJgLnRtVC4TJr2v
	mwXW/fiHV0bWyZ2tRg4jlBSpIdkwb0yrCkAAfYrlGfX2KbZgjtoVzo+1NZJ9gEC4aw1T
	RX5xCT8uzqueIDa9UufvwXxhW6zp82rvxdwgY9/5ojW595xjR3qGuek1NYv3sH2N9YBJ
	LKTg==
Received: by 10.216.133.72 with SMTP id p50mr5867013wei.78.1332103020751;
	Sun, 18 Mar 2012 13:37:00 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0D2E.dip.t-dialin.net.
	[79.223.13.46])
	by mx.google.com with ESMTPS id l5sm19761891wia.11.2012.03.18.13.36.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Mar 2012 13:37:00 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2012 21:40:53 +0100
Message-Id: <1332103254-3729-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1332103254-3729-1-git-send-email-schnitzeltony@googlemail.com>
References: <1332103254-3729-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe 5/6] xfce4-mixer: initial add 4.8.0
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
X-List-Received-Date: Sun, 18 Mar 2012 20:45:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-apps/xfce4-mixer/xfce4-mixer_4.8.0.bb  |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.8.0.bb

diff --git a/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.8.0.bb b/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.8.0.bb
new file mode 100644
index 0000000..23a8ba5
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.8.0.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "A volume control application based on GStreamer"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+inherit xfce-panel-plugin
+
+DEPENDS += "glib-2.0 gst-plugins-base gtk+ xfconf"
+
+SRC_URI = "http://archive.xfce.org/src/apps/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "3fa3a9973e18c04da26709a654e242ff"
+SRC_URI[sha256sum] = "9f9f48fdd0d3f6b1e46694b93a44d15b800db72a96d831b5111d9ac976970fab"
+
+RDEPENDS_${PN} = "gst-meta-audio"
-- 
1.7.4.4



