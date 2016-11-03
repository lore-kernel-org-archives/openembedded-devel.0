Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 429C171985
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Nov 2016 08:20:46 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id n85so4135909pfi.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2016 01:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fHiAmRFOQCWd9XQqBDo5d+8q2gdv7/eIn5obflB/2NI=;
	b=rZsdDEgWc/351p5HHZSkRDt8YFktE0h10lcyRu84m++2D4iU1OPA6pBsP3offLIrQL
	oO8Rpg4vpp9RIhAlC9Po6HaeWmEeOITuR9YwWzKZC9/fShYhRu4ezXQmut0ojI5cuT9H
	u7ttp2vfFKNZYpIYKXfMEe7kE85C8cOp9amm9mBsB2XMDmxA0pbMYKc+2vl+BzLzEVWc
	e/ko7ZRNPrWnZy7WJfh8uXTgEGiH/cfQFeV64kbnvWN5WfMhvB0CCiM7tcB6N9uVbaHP
	vAuf6nWW9WqH/3j5XD25/dbJiFNAn+QfBQH8GAxRJF5wzl75obE4t1Z+xkmocbKs5Rao
	eiEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fHiAmRFOQCWd9XQqBDo5d+8q2gdv7/eIn5obflB/2NI=;
	b=jFqDrhK6aIpW/J7eVLQZ+i/ghqtRgystF8uMzh4KUbAo8LBFQDsY978gW53CrwVrN9
	zeq9YZ2E5sMRzIdB1vBO4Y+CxxjpBEnNUND+noq1ZNZ7gntn39lEDMmsm9wTt19Tr7Mz
	wn5p9/NeqNZ/hZCgPqNM2qnsnOYvBY+fzaeVHSEIS+i7xP56nsrZ8NTnxeJaXn44ZQYu
	n9n08iJ0xBDFpciloTS+87Wjs2B1JRVMYXaXogllow9JKbNX3UvAJ94eLPe3ZHfaM/+p
	J+DThoPp5yA/yoGC8omyzny1EKx7qkLwVktpZpLep2zUnHk4foYM2E0J4DoQ3XotSVVR
	7rNg==
X-Gm-Message-State: ABUngvfH66FcWG7EZAxG+I6rl07RGYp0PgM6QsFNpmoHR6r2nKRnmHhChJYfH+/DEZ5YJg==
X-Received: by 10.99.125.77 with SMTP id m13mr12009582pgn.58.1478161248713;
	Thu, 03 Nov 2016 01:20:48 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	y2sm10386225pfk.54.2016.11.03.01.20.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Nov 2016 01:20:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Nov 2016 01:20:36 -0700
Message-Id: <20161103082038.6331-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161103082038.6331-1-raj.khem@gmail.com>
References: <20161103082038.6331-1-raj.khem@gmail.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-multimedia][PATCH 5/7] dcadec, libsquish: Add new recipes
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
X-List-Received-Date: Thu, 03 Nov 2016 08:20:47 -0000

Transport from meta-dominion, to support
new kodi mediacenter

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/dca/dcadec_0.2.0.bb            | 17 +++++++++++++++++
 .../recipes-multimedia/libsquish/libsquish_git.bb     | 19 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/dca/dcadec_0.2.0.bb
 create mode 100644 meta-multimedia/recipes-multimedia/libsquish/libsquish_git.bb

diff --git a/meta-multimedia/recipes-multimedia/dca/dcadec_0.2.0.bb b/meta-multimedia/recipes-multimedia/dca/dcadec_0.2.0.bb
new file mode 100644
index 0000000..45b53c1
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/dca/dcadec_0.2.0.bb
@@ -0,0 +1,17 @@
+SUMMARY = "DTS Coherent Acoustics decoder with support for HD extensions"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING.LGPLv2.1;md5=4fbd65380cdd255951079008b364516c"
+
+SRCREV = "b93deed1a231dd6dd7e39b9fe7d2abe05aa00158"
+SRC_URI = "git://github.com/foo86/dcadec.git;protocol=http"
+
+S = "${WORKDIR}/git"
+
+inherit lib_package
+
+EXTRA_OEMAKE = "CONFIG_SHARED=1"
+
+do_install() {
+	oe_runmake install DESTDIR="${D}" PREFIX="${prefix}"
+}
diff --git a/meta-multimedia/recipes-multimedia/libsquish/libsquish_git.bb b/meta-multimedia/recipes-multimedia/libsquish/libsquish_git.bb
new file mode 100644
index 0000000..f060f1e
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libsquish/libsquish_git.bb
@@ -0,0 +1,19 @@
+SUMMARY = "The squish library (abbreviated to libsquish) is an open source DXT compression library written in C++ "
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://alpha.cpp;beginline=3;endline=22;md5=6665e479f71feb92d590ea9ae9b9f6d5"
+
+PV = "1.10+git${SRCPV}"
+
+SRCREV = "52e7d93c5947f72380521116c05d97c528863ba8"
+SRC_URI = "git://github.com/OpenELEC/libsquish.git;protocol=https"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = "INSTALL_DIR=${D}${prefix}"
+
+do_install() {
+	install -d ${D}${includedir}
+	install -d ${D}${libdir}/pkgconfig
+	oe_runmake install 
+}
-- 
2.10.2


