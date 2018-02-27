Return-Path: <carlos.rodriguez@ridgerun.com>
Received: from mail-vk0-f51.google.com (mail-vk0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id 97F5D78844
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Feb 2018 23:42:28 +0000 (UTC)
Received: by mail-vk0-f51.google.com with SMTP id k187so374993vke.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Feb 2018 15:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ridgerun-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=QXjmCvCmiraWHIvwjaLNYTUOZ9+6X72L1exbR8Q6YLY=;
	b=u7tdTKi/4imk/YPbPMgRwo96MOCXAeR/AyeW/Lr+V7QfaDFtUk1DkZ+lG/5DWn3ZGK
	WYi+q61dPLe7iqzdLlsJxjGdbrDp1xg+PgZ5Af85jXjpvY0k38ICWkpSX/5kncgkg17g
	5Bj32HM5Aphbk9z/Ud0pTjyZKiG7dVbBFaEV9ArtbfmkQJ2PHVcABhKy7joXQaRKe8K0
	lxPWsvcOGjhHGdP9/rNX+cQljK9dqX/RejGHrraaMaJRviyUsvHT9bay7y3HmwVo2Fce
	uMUJzRkc/JMx5b/XnT9vKULdLFzN33ijMldpbRdBylRrAUWkY9Mu//89At2Hf3u2vtm+
	pprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QXjmCvCmiraWHIvwjaLNYTUOZ9+6X72L1exbR8Q6YLY=;
	b=NOtDd1dC1b9sad3R724iRpD78OkGw1QwSVUKqbey196qQFNpCJmnq+1s1PSzWWFr8z
	kOXZ0CrvXHJJloqPgtZMkKgkzHMqMhCVPMKuhi6QZL3eSSjiglHG0D/tyWWpGaDoCJst
	zeViRJtVaL19GpHu9NA4nkj1t0P1ZEGtS07fMchBMl7lasWVHoW9x4s3Cj37sQaElRbE
	zlTaoF0jMlxGkGupDFWun/FavBH4YmbgDC4vmUfFPYGnYXs5DX7p3gEd0aG8Ns8SMJ1E
	tt1ZpSlnXmQJhp3RQzzEchS6GNbx7/kYXT8M7/vFGmqBYDhVD0xISzvIHOl+5X41Lq2t
	RIkg==
X-Gm-Message-State: APf1xPDZEmqeT1/kdghNTMBlyKDaFuqgD5TsUS8rx6hB/gzxUNuuE5co
	Lx9VSJ1j4XYOY0YmiMqApOzzBbQK
X-Google-Smtp-Source: AG47ELtTN6V8B5x3/+ltmxo6Klazfqdw+QiDf7iIvwOR+Hdp3jsO2d2EvoNFb7lsjesRAAngX/9/jg==
X-Received: by 10.31.3.102 with SMTP id 99mr12012635vkd.124.1519774949335;
	Tue, 27 Feb 2018 15:42:29 -0800 (PST)
Received: from crodriguez.cr.ridgerun.com ([201.206.221.6])
	by smtp.gmail.com with ESMTPSA id y14sm308171vky.51.2018.02.27.15.42.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 27 Feb 2018 15:42:28 -0800 (PST)
From: Carlos Rodriguez <carlos.rodriguez@ridgerun.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Feb 2018 17:42:20 -0600
Message-Id: <1519774940-2279-1-git-send-email-carlos.rodriguez@ridgerun.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH v2] gst-shark: Add Gst-Shark recipe
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
X-List-Received-Date: Tue, 27 Feb 2018 23:42:28 -0000

GstShark is an open-source project from RidgeRun that provides
benchmarks and profiling tools for GStreamer 1.7.1 (and above).
It includes tracers for generating debug information plus some
tools to analyze the debug information. GstShark provides easy
to use and useful tracers, paired with analysis tools to enable
straightforward optimizations.

Signed-off-by: Carlos Rodriguez <carlos.rodriguez@ridgerun.com>
---
 .../gstreamer-1.0/gst-shark_0.2.1.bb               | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.2.1.bb

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.2.1.bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.2.1.bb
new file mode 100644
index 0000000..981bbe8
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
+	--disable-graphviz \
+	--enable-gtk-doc=no \
+"
+
+FILES_${PN} += "\
+	${libdir}/gstreamer-1.0/libgstsharktracers.so  \
+	${libdir}/gstreamer-1.0/libgstsharktracers.la \
+"
+
+inherit autotools gettext 
+
+do_configure() {
+${S}/autogen.sh --noconfigure
+oe_runconf
+}
-- 
1.9.1


