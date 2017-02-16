Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id BFBCC731CD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 10:29:19 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id 203so94602240ith.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 02:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=w9Q5ybDju2lBYsiF5RE5IYxZPsN3TpHE4KqTRzu7iU4=;
	b=pjEgja29K5K4wLuN2voDdgQrZVpYKtQhehzj+gt1MMZuetIFdr8bYxl45UU0IzCmY5
	2mJpzEATf/LceBx/TwWgs31PjtyGALsujiHV9kLJ1VZXHE7BYybCl5tdShxLpnXHkvKH
	5W5AE+KIiD1igW62LxtJMK1Cp8s2XBckW62rukdiQcFg82qC0LdsWBObRYGOcynSdjZ3
	gFJrA87Ak38MP3tA3ra419yRvqvzkiREYx7ZlHajiYf99BS1O2WEz3TI5HUFusqdOdHw
	7nbVGC4Uznz7oMjs6opfcs9f0HXJ4/TARyT0Ru1f3ll8oEk5Wexmgy4ecki9+9AVK9Gk
	JReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=w9Q5ybDju2lBYsiF5RE5IYxZPsN3TpHE4KqTRzu7iU4=;
	b=odu4Gd7lBy8EklLJeOyl/U9odNJZo/PTJqjUOvFc6Hoox9IswRfOSVZuGQ/epNwl7N
	iIxvq3eawWnvabkuuLX2yziiMtgItfd9fWYV8hckN0O1nB6Kcsm/iYK20uX9d1qdmxCR
	xwfsMmRPjZdzbZTyKpglOF9QFHyK78/k26jxNf49PKEnM/ZXLDxQu9/4+qCpoI4BSvPf
	4u7fp/mijBg4NNXmeJMbbudIZ+f9ie5VMw+w/DeNux3a6MXvrbZZ5uD7cMSjxZZJ5IBG
	wh9ginU1QxldsAenZeKHNYvfuRxOauxN2ma1Kz5I6YEbz0jZIG4/0pG9E4hcgi4g0qfe
	cbqQ==
X-Gm-Message-State: AMke39n6a+dwcN87QqT5bN6Xfr03Rr6XMdHccRT2EyYIkxLTzvAb+T/hSKEODHa/QDi2WaGu
X-Received: by 10.36.61.136 with SMTP id n130mr1555280itn.107.1487240959966;
	Thu, 16 Feb 2017 02:29:19 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8C6B9.dip0.t-ipconnect.de.
	[93.232.198.185])
	by smtp.gmail.com with ESMTPSA id 96sm3059066ioh.27.2017.02.16.02.29.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Feb 2017 02:29:18 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Feb 2017 11:29:12 +0100
Message-Id: <b0a782f34afd1a1157936114a7288ef963521bd2.1487240872.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH] multipath-tools: fix ARM build failure
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
X-List-Received-Date: Thu, 16 Feb 2017 10:29:19 -0000

Updating to 0.6.4 introduced a build failure on ARM when thumb was
enabled because of the embedded valgrind.h macro calls. The easiest
solution and thus the one used here is to disable thumb for this
particular recipe.

The more elaborate solution would be to patch the macro calls out of
the code when compiling for ARM with thumb.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb |  9 +++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
index 6706bec..a3b33b6 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
@@ -27,6 +27,13 @@ PV = "0.6.4+git${@'${SRCPV}'.split('+')[-1]}"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
+# multipath-tools includes a copy of the valgrind.h header
+# file and uses the macros to suppress some false positives. However,
+# that only works on ARM when thumb is disabled. Otherwise one gets:
+#   Error: shifts in CMP/MOV instructions are only supported in unified syntax -- `mov r12,r12,ror#3'
+#   ../Makefile.inc:66: recipe for target 'debug.o' failed
+ARM_INSTRUCTION_SET = "arm"
+
 # The exact version of SYSTEMD does not matter but should be greater than 209.
 #
 EXTRA_OEMAKE = 'MULTIPATH_VERSION=${PV} DESTDIR=${D} syslibdir=${base_libdir} \
@@ -59,5 +66,3 @@ FILES_kpartx = "${base_sbindir}/kpartx \
                "
 
 RDEPENDS_${PN} += "kpartx"
-
-PNBLACKLIST[multipath-tools] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130529/"

base-commit: 044e5189549de11b2a94efd29a6009a76162b8f1
-- 
git-series 0.9.1

