Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 94E0175D4B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Feb 2016 13:52:25 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id c200so7629163wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Feb 2016 05:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=0l3Fz5osn8h9Ac1i3VE0JHuGgm3hJ53BruinK8NFdLY=;
	b=0U/CYzEjObFcA6lTq1kpDZu8TrcONVNeN1nJdXPcZ1pGzIjTu7mKevghGaTg09LhSh
	xNt9opRNCV+GkpadRTINzGOCUtNqZUWJFVSQmdoUkSeshmK9TNlCV5XDgPcjTGZ/2Pm7
	AaWDvtijFNWl4L1o8DDjqE594UqckdqsU66YwAjm/xLs4FkadVjTbavYNicAkB6PKUW7
	bBPkkbpbcnx1TcNIdfzUH9ok1ve8IIbFKjafi2cz1iUhrrJnVsjU9+BZvLwXLdzh4BzX
	vfS4bdyhgxW5yYSD4agW0zsDrOMmaP3HFlYVL3pdza9DB1K6Hw5pqvCvflvIVQAOCJ9i
	P2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=0l3Fz5osn8h9Ac1i3VE0JHuGgm3hJ53BruinK8NFdLY=;
	b=HTxiNqQIYMSdlImNIh2CW+i/56J+3T6sXQ2sMorZkfwkgmLZeHAXu29S6kxqa6dykS
	Urcir3tu5pkEK7Fowk6c+uZGyGgfpUCSwvhjWqf9KDpqbg9QMeQEbms5wbP4iFCbo156
	ImeRlsYiaLleX7rXG+Hxfh/qVY9V4xSYDjbG9OwlZ1JRU76GrLM4TO5hgU7P/kV9xbA7
	0WvY5g1hHzURMWR8U0QzEQIgDXqjwj95hdTKZLz28g/vFEsiI61sGA3lX+w9qgXbuyQK
	XA31VsLmwjOdRBUwJJ5dHfW1GvpyE+4G0SHlHwyuFz4Xpli9HaFSqEVX0aGZksIxqu6k
	T7Aw==
X-Gm-Message-State: AG10YOTyHsTMAmMfh503NuegP6Mj+K1vuvAJBFUdZBzloqmKtnmI8xlCh5bz8wg9WYXySQ==
X-Received: by 10.194.250.103 with SMTP id zb7mr7082643wjc.65.1455371545997;
	Sat, 13 Feb 2016 05:52:25 -0800 (PST)
Received: from localhost.localdomain (p4FDF11DE.dip0.t-ipconnect.de.
	[79.223.17.222]) by smtp.googlemail.com with ESMTPSA id
	jo6sm16553106wjb.48.2016.02.13.05.52.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 13 Feb 2016 05:52:25 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Feb 2016 14:52:07 +0100
Message-Id: <1455371527-11604-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1455371527-11604-1-git-send-email-schnitzeltony@googlemail.com>
References: <1455371527-11604-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] source-han-sans-tw-fonts: initial add 1.004
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
X-List-Received-Date: Sat, 13 Feb 2016 13:52:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Based on [1-2].

[1] https://projects.archlinux.org/svntogit/community.git/tree/trunk?h=packages/adobe-source-han-sans-fonts
[2] http://pkgs.fedoraproject.org/cgit/rpms/adobe-source-han-sans-tw-fonts.git/tree/adobe-source-han-sans-tw-fonts.spec

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../44-source-han-sans-tw.conf                     | 19 ++++++++++++
 .../ttf-fonts/source-han-sans-tw-fonts_1.004.bb    | 34 ++++++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts/44-source-han-sans-tw.conf
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_1.004.bb

diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts/44-source-han-sans-tw.conf b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts/44-source-han-sans-tw.conf
new file mode 100644
index 0000000..ae28940
--- /dev/null
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts/44-source-han-sans-tw.conf
@@ -0,0 +1,19 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<!DOCTYPE fontconfig SYSTEM "../fonts.dtd">
+<fontconfig>
+    <!-- 
+        - Medium variant is used instead of Regular on Qt apps:
+        https://bugs.launchpad.net/ubuntu-font-family/+bug/744812
+        - Medium and Bold looks the same in certain applications:
+        https://bugs.launchpad.net/ubuntu/+source/gnome-specimen/+bug/813373
+    -->
+    <match target="scan">
+        <test name="fullname" compare="eq">
+            <string>Source Han Sans TWHK Medium</string>
+        </test>
+        <edit name="weight" mode="assign">
+            <const>demibold</const>
+        </edit>
+    </match>
+</fontconfig>
+
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_1.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_1.004.bb
new file mode 100644
index 0000000..7282505
--- /dev/null
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_1.004.bb
@@ -0,0 +1,34 @@
+require ttf.inc
+
+SUMMARY = "Adobe OpenType Pan-CJK font family for Traditional Chinese"
+HOMEPAGE = "https://github.com/adobe-fonts/source-han-sans"
+LICENSE = "OFL-1.1"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=55719faa0112708e946b820b24b14097"
+
+inherit allarch fontcache
+
+# Download tends to break - so - or not?
+#EXCLUDE_FROM_WORLD = "1"
+
+SRC_URI = " \
+    https://github.com/adobe-fonts/source-han-sans/raw/release/SubsetOTF/SourceHanSansTW.zip \
+    file://44-source-han-sans-tw.conf \
+"
+SRC_URI[md5sum] = "6533b71b31c19e548768f0fc963202f3"
+SRC_URI[sha256sum] = "92ba161921c5cdec5a8f8d5711676f0865b50cee071c25eb4bd4125b5af59fd0"
+
+S = "${WORKDIR}/SourceHanSansTW"
+
+do_install() {
+    install -d ${D}${sysconfdir}/fonts/conf.d/
+    install -m 0644 ${WORKDIR}/44-source-han-sans-tw.conf ${D}${sysconfdir}/fonts/conf.d/
+
+    install -d ${D}${datadir}/fonts/truetype/
+    find ./ -name '*.otf' -exec install -m 0644 {} ${D}${datadir}/fonts/truetype/ \;
+}
+
+FILES_${PN} = " \
+    ${sysconfdir}/fonts \
+    ${datadir}/fonts \
+"
+
-- 
2.5.0


