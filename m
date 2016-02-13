Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8426074197
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Feb 2016 13:52:22 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id a4so1366032wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Feb 2016 05:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=h2Vi/k8E3DSFMVpVe8xCoaUK4luEE18zEf1hfX8Dd/w=;
	b=hPlK56ReIEsGaHG9dCGt5gm/4EZX8t+j/9+a29tq1uXCNGeQmyW3Lc2yqB2Zr+8sto
	ZMaj5BPkMWUSrMfsSOilY7F9RM0ms88zobBuP1tlBuSo19lRqa1OmgSswL3ji7DJ3PtA
	7M6DMG2yG4KwmOHFvhl/eklhUqFOxB8b/rGo/Jl+ZwQskx1FNW4zsjIbIqjNOMQYip53
	EW85TSDkFDQ8u9XHJhP/uXqQObSYi+MCpOGKj1GlX8xScJvUB7gf5Ej1NPPus7jDGshn
	GGvJS+XpWQR9j0dFEApS6tlvLuuTgUDAVlnZUacAvL5KG5UYB24tJOz4PJY1+jf2drFl
	lBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=h2Vi/k8E3DSFMVpVe8xCoaUK4luEE18zEf1hfX8Dd/w=;
	b=FPC+ZLPGKkwyODYWnyjY33tVhpskiuCkpTBQg0j/Igo6o49s063eJdfpqs6GnHk21F
	gqn9DLokawv0j4izxUdw8/3afkodcUYriZjXGHKMIJou92+Hbdw8sCuy9pebfpAlKEIk
	drmVkw12rQqZcYyz1oBTyWysJtRMXyKfbd3K8OXnV2PqpSZOX4ns86eNWl/gYE/kDnH+
	/5a4nVW/EedIKPNkZS1MeAk4+0FdE/JspMC8YR0NPZuthgiaFCMdjjmf+huJpyrTMLbk
	pmGjpP6h6Zn3XNa4epyRhljnMDnDGRKPGl3EySjFsJnJFWq32ViaZrrI30oImZfK/UZj
	OlpA==
X-Gm-Message-State: AG10YORNszgD+t93QfK04/Q5pup2zMnt5PeX2P3/juaH00dlqCrFoIG9BwSzet0Y3LrU4Q==
X-Received: by 10.194.187.240 with SMTP id fv16mr8175217wjc.53.1455371543167; 
	Sat, 13 Feb 2016 05:52:23 -0800 (PST)
Received: from localhost.localdomain (p4FDF11DE.dip0.t-ipconnect.de.
	[79.223.17.222]) by smtp.googlemail.com with ESMTPSA id
	jo6sm16553106wjb.48.2016.02.13.05.52.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 13 Feb 2016 05:52:22 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Feb 2016 14:52:04 +0100
Message-Id: <1455371527-11604-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1455371527-11604-1-git-send-email-schnitzeltony@googlemail.com>
References: <1455371527-11604-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] source-han-sans-cn-fonts: initial add 1.004
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
X-List-Received-Date: Sat, 13 Feb 2016 13:52:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Based on [1-2].

[1] https://projects.archlinux.org/svntogit/community.git/tree/trunk?h=packages/adobe-source-han-sans-fonts
[2] http://pkgs.fedoraproject.org/cgit/rpms/adobe-source-han-sans-cn-fonts.git/tree/adobe-source-han-sans-cn-fonts.spec

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../44-source-han-sans-cn.conf                     | 19 ++++++++++++
 .../ttf-fonts/source-han-sans-cn-fonts_1.004.bb    | 34 ++++++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts/44-source-han-sans-cn.conf
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_1.004.bb

diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts/44-source-han-sans-cn.conf b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts/44-source-han-sans-cn.conf
new file mode 100644
index 0000000..6855791
--- /dev/null
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts/44-source-han-sans-cn.conf
@@ -0,0 +1,19 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<!DOCTYPE fontconfig SYSTEM "../fonts.dtd">
+<fontconfig>
+	<!-- 
+	    - Medium variant is used instead of Regular on Qt apps:
+		https://bugs.launchpad.net/ubuntu-font-family/+bug/744812
+		- Medium and Bold looks the same in certain applications:
+		https://bugs.launchpad.net/ubuntu/+source/gnome-specimen/+bug/813373
+	-->
+	<match target="scan">
+		<test name="fullname" compare="eq">
+			<string>Source Han Sans CN Medium</string>
+		</test>
+		<edit name="weight" mode="assign">
+			<const>demibold</const>
+		</edit>
+	</match>
+</fontconfig>
+
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_1.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_1.004.bb
new file mode 100644
index 0000000..9fbfc8b
--- /dev/null
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_1.004.bb
@@ -0,0 +1,34 @@
+require ttf.inc
+
+SUMMARY = "Adobe OpenType Pan-CJK font family for Simplified Chinese"
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
+    https://github.com/adobe-fonts/source-han-sans/raw/release/SubsetOTF/SourceHanSansCN.zip \
+    file://44-source-han-sans-cn.conf \
+"
+SRC_URI[md5sum] = "d16abc21f6575bb08894efedbed484a2"
+SRC_URI[sha256sum] = "0a0e1d8e52833bc352d454d8242da03b82c0efc41323fb66f7435e5b39734a4f"
+
+S = "${WORKDIR}/SourceHanSansCN"
+
+do_install() {
+    install -d ${D}${sysconfdir}/fonts/conf.d/
+    install -m 0644 ${WORKDIR}/44-source-han-sans-cn.conf ${D}${sysconfdir}/fonts/conf.d/
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


