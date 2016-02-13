Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id E7AF77680B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Feb 2016 13:52:24 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id g62so53738907wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Feb 2016 05:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=G+46qHEROE9sKKH932mMO97jotAaW7D/zORTuS6vEjY=;
	b=Ug3bAFKj5EJVExRYAmYGLp8qw+um7InaOfIiCK4BeZaa5/6RVShHkz+H58cFp+0f0k
	mVO3er7hPl35hdTrMLtl3xYz1FzPHFVVqd7ZcT4+BogYdrrjoDw+fwHd701/aeYS2kmh
	PbwlorGzurvg9MNgztDZb7v3g7sf4FDbyn/nYsg5g1PvVjhvPNcVhV8xNMv+MdM8S3JT
	50cPAaxJYtJHhLHjx5LgXqMQQWCQS7hoXcZP38Aa2QoZWDk9rooUC5gLXERLua2+w/WU
	H8W8MWmbodHODUN6F47CNIhDOlmAFrMGCHUw1cYuu0jgT8a8+7gsHb73+IZsHFp7gT+c
	6WuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=G+46qHEROE9sKKH932mMO97jotAaW7D/zORTuS6vEjY=;
	b=IxpNIfCF/t2/5Iu5CHZOZNzpazzIaHAHaDAzdnJ5vyyum6zAg1/r18hzCmjHNr8KCD
	xSMe7nUaLyMeNTWuBdWZTnkLzeBt17EQ2kiqwSxNqQ4PvEkhnr407rs27Mso5CtGKwt6
	iuhLKaEofTnUetQfsUgyDWJFBzO407zcWRl1MgliT61xHUg+lUqO23Jxtc4RhGgdQmDg
	/4OWU7Es3k0d9CX2ZRy+hvOcmyWWpJlDxStoKpi034wLvEZ7eu8PzzL3qtnLv37MZquw
	yiLExb44+vnwzoi/jSqbId1OUA9c18nJNqP4cQy0GZt7j6LUv+775Hq6kgO/JUPfjPii
	6PxQ==
X-Gm-Message-State: AG10YOQs3KsReEFHlgrUU1FsF1qkn6vdHcG31nzG0T85hiumrXWmWmTJ4YYw5lQqo0qN4Q==
X-Received: by 10.28.12.80 with SMTP id 77mr3195960wmm.19.1455371545028;
	Sat, 13 Feb 2016 05:52:25 -0800 (PST)
Received: from localhost.localdomain (p4FDF11DE.dip0.t-ipconnect.de.
	[79.223.17.222]) by smtp.googlemail.com with ESMTPSA id
	jo6sm16553106wjb.48.2016.02.13.05.52.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 13 Feb 2016 05:52:24 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Feb 2016 14:52:06 +0100
Message-Id: <1455371527-11604-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1455371527-11604-1-git-send-email-schnitzeltony@googlemail.com>
References: <1455371527-11604-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] source-han-sans-kr-fonts: initial add 1.004
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
 .../44-source-han-sans-kr.conf                     | 19 ++++++++++++
 .../ttf-fonts/source-han-sans-kr-fonts_1.004.bb    | 34 ++++++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts/44-source-han-sans-kr.conf
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_1.004.bb

diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts/44-source-han-sans-kr.conf b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts/44-source-han-sans-kr.conf
new file mode 100644
index 0000000..dee73ae
--- /dev/null
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts/44-source-han-sans-kr.conf
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
+            <string>Source Han Sans KR Medium</string>
+        </test>
+        <edit name="weight" mode="assign">
+            <const>demibold</const>
+        </edit>
+    </match>
+</fontconfig>
+
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_1.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_1.004.bb
new file mode 100644
index 0000000..c91d167
--- /dev/null
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_1.004.bb
@@ -0,0 +1,34 @@
+require ttf.inc
+
+SUMMARY = "Adobe OpenType Pan-CJK font family for Korean"
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
+    https://github.com/adobe-fonts/source-han-sans/raw/release/SubsetOTF/SourceHanSansKR.zip \
+    file://44-source-han-sans-kr.conf \
+"
+SRC_URI[md5sum] = "f8d1bd6c87d8575afdb25e2f46bd81d4"
+SRC_URI[sha256sum] = "38fd15c80f9980492faaa1af39ff873d8a38e45027023fb17d5b10d4b4b0e6af"
+
+S = "${WORKDIR}/SourceHanSansKR"
+
+do_install() {
+    install -d ${D}${sysconfdir}/fonts/conf.d/
+    install -m 0644 ${WORKDIR}/44-source-han-sans-kr.conf ${D}${sysconfdir}/fonts/conf.d/
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


