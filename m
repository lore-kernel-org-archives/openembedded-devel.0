Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2E922719E5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:19 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 3so672995pgd.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fHiAmRFOQCWd9XQqBDo5d+8q2gdv7/eIn5obflB/2NI=;
	b=xaZ1n443FPAm49zj5/RAOTDf2V3rIInVLdfxAejWez4WaeKlZtu+m7CzZ49VA+TKJY
	vlQDu0dUeb49kYAuAhkVJhdezcYeJZo2uNBdTEIBZGdldsecccDpOdKZf9dVI+abePRM
	yxh+D9tQJcQqrJGVc86CjaxfMJE7rKra+ANbX0oN71ZSJmw5NQ7LLPTzbuQ3VSNIAvBh
	nd1zezNOVtmNKdZRqtIP8D1bKPz0jsnWegG0FSyGzD2KJHaeKTPlLhOYe2dfY6J+BkzS
	DYuBbPvPuOGU/eFmeUkezRJJiWkcgsNOHLnKeUGlpy8d7ld14vXHn8lpO5NaW8MaWElt
	kqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fHiAmRFOQCWd9XQqBDo5d+8q2gdv7/eIn5obflB/2NI=;
	b=CA2vkZ54vHvS7ZsJNh/7RRjVLhWX0OYwjVK9V/k38BM6AIU3Ab1u+nhLnMFqKwsoNC
	ucgOyfNQmMmHKZm9KOYsF6yZpSXwE3oKGQZb5QTnK78RjU2WCCRv4+CfKgJHHYPcBTbq
	x5A6NZhOJ6RJj0BN1oUgWJpIRvQrl+XDztVCYBSty5JvopfNmhAvfh8cMBPt8Bzg5Kia
	RpFkhOYzst2yF1hNs4lBJeQuSdieH7lqUOAvLaXu83UvrbG2rYocTUr/ruGGPh03Y4nF
	87b9CK2vI61wNVvAAwZO0fV/SusiAyEY+ehwHNIpCbrq7HP+7n3ey7jcrokqxK2TOTYR
	v9rg==
X-Gm-Message-State: AKaTC02CqoZYqWv/MjXyZJsz3392uAeNCi8wBXFW6QvqweylqprmYC5Acs05z3BzL+bmkw==
X-Received: by 10.98.196.199 with SMTP id h68mr1915138pfk.120.1479892941185;
	Wed, 23 Nov 2016 01:22:21 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:21:26 -0800
Message-Id: <20161123092209.23699-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-multimedia][PATCH 06/49] dcadec, libsquish: Add new recipes
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:20 -0000

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


