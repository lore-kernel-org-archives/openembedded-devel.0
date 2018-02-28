Return-Path: <carlos.rodriguez@ridgerun.com>
Received: from mail-ua0-f170.google.com (mail-ua0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2A25078417
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 14:59:46 +0000 (UTC)
Received: by mail-ua0-f170.google.com with SMTP id f5so1708583uam.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 06:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ridgerun-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=ZuiGwDi0zs4E9MiveYtzzVWfbNTcM//+o2ty4FIFEqE=;
	b=PVTSvYdxXpcWU6BPgdbbgxd+eIed6evUrNs47LRyOUecFEaJHpck7NFAKGJNO2UxA8
	x+kffgbbRC6/EjJGAS3TRre/qE/J09H9eqRw6bZM5RrFiagRA27UzxAzHX2QxaGxLzrv
	ZK0NuvQrgJLHz2XQ/8tywVizaovr7AGLqpGxNrKAGlQjoE/eaiGB2qQZJyNq9Rs3SmJK
	nnHC92znEkqwhmRCgrMdZv0DIiNH9rm3C7RlO+1QgRKBrR7rqpdXnaMVxTf6W9QTuHty
	L8/JZdn5tKNwygNnEPAsdRTnnybfwdwD1jGTDrAaQAUhH5t+GVxvsMurykSh0IY6Ot0S
	pQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZuiGwDi0zs4E9MiveYtzzVWfbNTcM//+o2ty4FIFEqE=;
	b=o9l4J1wEqRNLevuDysW2DacDvobRg3btyZ3FmsCYZNL0ABBFwNqTWAzA0LTJjEJb4i
	ahu11LP9k+tZMpmOC2aQ89Th95PNCB1AjqQV2RiCagoffAx4ad4N57KGcYVAmWYtSNzw
	UZm4D+2bjQ79SptGFA5Yid/HLklxWxYkxyJG44hrdn41ZqLkFk/gqQ4gYbrzjIsr44Mq
	0M4dbIczbMR9ikElhvJttdiPO4hGcyeDtvmNb+LBYExjVq2KC4nRyj+0Ar3NpVzvbejx
	M1B7nNkwWmg8G/Zc7mXHdRJMBKvkIOZlWbebOgojPiQz+hJRkuT4sZLhDe2LnYAd0GnA
	ELfg==
X-Gm-Message-State: APf1xPAH5NWt01n0xECchWvJds8EHXYdE9heBFAkehlkzPwtuv73PnLW
	wjmNiiZaTAGL/aRR3vimJsEzht3t
X-Google-Smtp-Source: AG47ELuMhF47GZDhWefKpii1hBgDvFEndt96kyWBi7lo+dTuzVZCnhTxefM/T2R3Yo7R/GuO2vKKiw==
X-Received: by 10.176.24.90 with SMTP id j26mr14584558uag.109.1519829987957;
	Wed, 28 Feb 2018 06:59:47 -0800 (PST)
Received: from crodriguez.cr.ridgerun.com ([201.206.221.6])
	by smtp.gmail.com with ESMTPSA id i7sm688034vka.18.2018.02.28.06.59.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 28 Feb 2018 06:59:47 -0800 (PST)
From: Carlos Rodriguez <carlos.rodriguez@ridgerun.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Feb 2018 08:59:36 -0600
Message-Id: <1519829976-17560-1-git-send-email-carlos.rodriguez@ridgerun.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH v3] gst-shark: Add Gst-Shark recipe
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
X-List-Received-Date: Wed, 28 Feb 2018 14:59:47 -0000

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
index 0000000..1a19238
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
+        ${S}/autogen.sh --noconfigure
+        oe_runconf
+}
-- 
1.9.1


