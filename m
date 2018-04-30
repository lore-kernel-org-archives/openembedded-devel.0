Return-Path: <carlos.rodriguez@ridgerun.com>
Received: from mail-vk0-f54.google.com (mail-vk0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7203A65D00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Apr 2018 21:33:14 +0000 (UTC)
Received: by mail-vk0-f54.google.com with SMTP id 10-v6so6004973vkh.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Apr 2018 14:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ridgerun-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=VTLyUVICSY693GmFkvFKHd05fVIXxg3D8J/Ot8liGi0=;
	b=nZ2aD/6PMuA2TopaHWuWIX0z5Warb1avA0LjESd/H0vpd/mF4rdplAacbPQ7hmCgSO
	yuKjZuJw6aKqhklnDNaTJuzgbeEbfRttEAf9QZmWLfC/AvwpOrfVKvKehggu7he8tYDp
	kuMgjOPsVeT0JAG4s0EnMU6NbCDAcdPM/xdOjegVTqG2Fsl0Gj3fs1ClS+zsQ0He1q+/
	SPDKD6PiB6t4F1At2mBpNneomDe/VaAbgC76MbqcwoD4bh5bG1rODq2+bezAJ7KHRPGp
	43tlF2zz8oURP4rZNk99lThyz8XA7a9Z8vvcig1OurdnntOlmqevOaK3b8D3DHkw2R1n
	U4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VTLyUVICSY693GmFkvFKHd05fVIXxg3D8J/Ot8liGi0=;
	b=nOrAlBY8SWtvBFKpe7S2jIkXzNZs5TOZX7sUbSR2TeAr3kjTBtJzsfqT1R+q0XXK8M
	LKvlYdFJPN+ZXosbdbXwVkaAUmYt3if6bNMJtghUgLMTG6tsvQcPDgZwLH1Wm5KMKU78
	mb8X1oecS9M72oFxVWtpDXrgTpAerjNahgJwRl2pshwuZyPWZijytSUHRAPpvzHM4ec2
	l/StSiu+SxFfGtmInNIllFcSqEW9KvP9nwvpJkPZRKx2+de6DCRszBYdktSZKVvuX2Ip
	5orwWRMD2azFa/WoiROWeu3Dv+smkYChxzChyLF9EAF/wp3zOWl8kH/oyzP1A34lCTEk
	V22Q==
X-Gm-Message-State: ALQs6tCl5Z43FbL/ieCJymD3uQwcxCBgJFkHKjiIUoZuFqawUv0uiA3x
	Yis+/eS/4Unfu/6TJgG1xVWFz1bX
X-Google-Smtp-Source: AB8JxZp7s+5OiRXnn+AIH5OhX+ydWnpcf31aDxjKHJpq88k+4XIelJazPkwVm18V8QByHxrZkpwMWA==
X-Received: by 2002:a1f:a80f:: with SMTP id
	r15-v6mr11094614vke.186.1525123995540; 
	Mon, 30 Apr 2018 14:33:15 -0700 (PDT)
Received: from crodriguez.cr.ridgerun.com ([201.206.221.6])
	by smtp.gmail.com with ESMTPSA id y15sm1327441ual.1.2018.04.30.14.33.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 30 Apr 2018 14:33:14 -0700 (PDT)
From: rrcarlosrodriguez <carlos.rodriguez@ridgerun.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Apr 2018 15:33:08 -0600
Message-Id: <1525123988-8184-1-git-send-email-carlos.rodriguez@ridgerun.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH v4] gst-shark: Add Gst-Shark recipe
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
X-List-Received-Date: Mon, 30 Apr 2018 21:33:15 -0000

GstShark is an open-source project from RidgeRun that provides
benchmarks and profiling tools for GStreamer 1.7.1 (and above).
It includes tracers for generating debug information plus some
tools to analyze the debug information. GstShark provides easy
to use and useful tracers, paired with analysis tools to enable
straightforward optimizations.

Signed-off-by: rrcarlosrodriguez <carlos.rodriguez@ridgerun.com>
---
 .../gstreamer-1.0/gst-shark_0.2.1.bb               | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.2.1.bb

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.2.1.bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.2.1.bb
new file mode 100644
index 0000000..5409f32
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.2.1.bb
@@ -0,0 +1,38 @@
+SUMMARY = "Gst-Shark Tracers"
+DESCRIPTION = "Benchmarks and profiling tools for GStreamer"
+HOMEPAGE = "https://developer.ridgerun.com/wiki/index.php?title=GstShark"
+SECTION = "multimedia"
+LICENSE = "GPLv2+"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=e1caa368743492879002ad032445fa97"
+
+DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad "
+
+SRCBRANCH ?= "master"
+
+SRCREV_base = "a60b3996fe3376d42334fc89014e9d6f6af62899"
+SRCREV_common = "b64f03f6090245624608beb5d2fff335e23a01c0"
+
+SRC_URI = " \
+    git://github.com/RidgeRun/gst-shark.git;protocol=https;branch=${SRCBRANCH};name=base \
+    git://anongit.freedesktop.org/git/gstreamer/common.git;protocol=https;destsuffix=git/common;name=common; \
+    "
+
+S = "${WORKDIR}/git"
+
+PACKAGECONFIG_CONFARGS = " \
+       --disable-graphviz \
+       --enable-gtk-doc=no \
+"
+
+FILES_${PN} += "\
+       ${libdir}/gstreamer-1.0/libgstsharktracers.so  \
+       ${libdir}/gstreamer-1.0/libgstsharktracers.la \
+"
+
+inherit autotools gettext
+
+do_configure() {
+        ${S}/autogen.sh --noconfigure
+        oe_runconf
+}
-- 
2.7.4


