Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id C986576639
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Feb 2016 13:52:23 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id g62so1362844wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Feb 2016 05:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=IyWEzK/nYy2Z7QWdNSy2NgWBHc73+Fq8ZmesupvWNRU=;
	b=i8nLSms07dwseC2/zgDmyflzy0pAzX0h5Nqi6ZfBkQX7C5Z0NktUZyyIU9I5wO307u
	bUv6klkhI6SNNjd3IGrTjUAXPXM1Ezt9k4nFIHW6pnYMgOSA6Pudim6znofwa1qqQ8bm
	4WqhRlZvtXFdiFvceFIi5uy0PVm3bPC87apj2n2x+w+5/UuAPhG1SofYCzI7WwI4ztFK
	KAiZkzN2aSGXclS9WqQQ6rvVzQPSWGVkzMuf5vRYfR2hTZn4qT60WfRPwTSCudjMqhbB
	oF++dGQ68ExjEHMD/3IotGKzLVbKqlz6xAE/LN7YikTWs3DjRs6T5yeZSFimE8Q5WekV
	OLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=IyWEzK/nYy2Z7QWdNSy2NgWBHc73+Fq8ZmesupvWNRU=;
	b=hojE3mZsPv+EaGN7ENGx772zLoyw3a6bmINjAj7TNei5DLX/Ys0FiqbxgG14R7X+G5
	vV03aoI7BsBVdyTy/Lny+7RuYC2/oUIDTBWRdfq6qH0AsTmRZ7LKR/UsGHgMBMINq1wq
	mbd6wWPfnXxbdEd3QmLCm01w8Gc694kva6qKHHJ3DbJpOZ3kl02UkVKvxlVZadUl7pcR
	LEbRveZNsV2fbVpzAkN+046ya3S1y19fDfF5nN3dj6wDKltJVhh4fuZ5ohF7YJGnaPH0
	IzuhgH4p7XJa9dl+9wmMCjzaF2RTDlJrjvW1zR5H50ka09CM8u79M2mNSzo8ZMfKzlBY
	bzbQ==
X-Gm-Message-State: AG10YOR8t/FqLg21d8b28GY/UzPQ+ds+65HRNV1XrwNoyGDnvAkUnnePGpbU5F9S7yvq2Q==
X-Received: by 10.194.103.198 with SMTP id fy6mr8177636wjb.48.1455371544121;
	Sat, 13 Feb 2016 05:52:24 -0800 (PST)
Received: from localhost.localdomain (p4FDF11DE.dip0.t-ipconnect.de.
	[79.223.17.222]) by smtp.googlemail.com with ESMTPSA id
	jo6sm16553106wjb.48.2016.02.13.05.52.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 13 Feb 2016 05:52:23 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Feb 2016 14:52:05 +0100
Message-Id: <1455371527-11604-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1455371527-11604-1-git-send-email-schnitzeltony@googlemail.com>
References: <1455371527-11604-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] source-han-sans-jp-fonts: initial add 1.004
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

Based on [1].

[1] https://projects.archlinux.org/svntogit/community.git/tree/trunk?h=packages/adobe-source-han-sans-fonts

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../44-source-han-sans-jp.conf                     | 19 ++++++++++++
 .../ttf-fonts/source-han-sans-jp-fonts_1.004.bb    | 34 ++++++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts/44-source-han-sans-jp.conf
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_1.004.bb

diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts/44-source-han-sans-jp.conf b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts/44-source-han-sans-jp.conf
new file mode 100644
index 0000000..a7a93fe
--- /dev/null
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts/44-source-han-sans-jp.conf
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
+            <string>Source Han Sans JP Medium</string>
+        </test>
+        <edit name="weight" mode="assign">
+            <const>demibold</const>
+        </edit>
+    </match>
+</fontconfig>
+
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_1.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_1.004.bb
new file mode 100644
index 0000000..4a26a2f
--- /dev/null
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_1.004.bb
@@ -0,0 +1,34 @@
+require ttf.inc
+
+SUMMARY = "Adobe OpenType Pan-CJK font family for Japanese"
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
+    https://github.com/adobe-fonts/source-han-sans/raw/release/SubsetOTF/SourceHanSansJP.zip \
+    file://44-source-han-sans-jp.conf \
+"
+SRC_URI[md5sum] = "908fbf97f3df04a6838708c093f1e900"
+SRC_URI[sha256sum] = "dc6dbae3fba35f220bac88ba7130b826c7efe1282f472788fae3628b79be3f54"
+
+S = "${WORKDIR}/SourceHanSansJP"
+
+do_install() {
+    install -d ${D}${sysconfdir}/fonts/conf.d/
+    install -m 0644 ${WORKDIR}/44-source-han-sans-jp.conf ${D}${sysconfdir}/fonts/conf.d/
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


