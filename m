Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 63E276B5D8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Jan 2014 17:54:22 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id m10so2901426eaj.26
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Jan 2014 09:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7acCktyOyLkwK3d14st2JHeCzZA/KyWEie1ru/2la20=;
	b=LcZSoI1/RqMuXm6fVDmv2vJD/O42BCiuCaNBBn8gHzjNlJqIgACt4Ms8Q6wVAxzvn2
	ZtPiSny7JkHsyuFnwcVhTmdPuMDJYvQa/WEkLDNV3IhqVislK78E7bcirpcfs1Xb1vRX
	aFNCJCc9Ey64ABT5e0zvJQjJstwwGCQD8xwmJKwO20dZoDZruGxeQsB3AlvyVvsR6G3P
	87zNG+b9S+U07WcqBbvT6pFqpQnSx4ngINz09tiSPqIH+X0BIjjhQa6XXWYLqGKHrZFO
	tC4IYMiPjIgMcPt52LBhBxO+fu8CZeoZV1kWjiVlFjrfGND+K/gw3HRwXw2AzFZ+336O
	uq3A==
X-Received: by 10.14.3.130 with SMTP id 2mr22552114eeh.36.1389549263056;
	Sun, 12 Jan 2014 09:54:23 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id m48sm14803632eef.6.2014.01.12.09.54.22
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 12 Jan 2014 09:54:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Jan 2014 18:54:34 +0100
Message-Id: <1389549275-4775-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.2
In-Reply-To: <1389549275-4775-1-git-send-email-Martin.Jansa@gmail.com>
References: <1389549275-4775-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-efl][WIP][PATCH 2/3] webkit-efl: Add recipe with snapshot from r159807
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 12 Jan 2014 17:54:24 -0000

* announcement:
  http://sourceforge.net/mailarchive/message.php?msg_id=31742684

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../webkit/webkit-efl_2.3.2+svnr159807.bb          | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl_2.3.2+svnr159807.bb

diff --git a/meta-efl/recipes-efl/webkit/webkit-efl_2.3.2+svnr159807.bb b/meta-efl/recipes-efl/webkit/webkit-efl_2.3.2+svnr159807.bb
new file mode 100644
index 0000000..1f9c2f5
--- /dev/null
+++ b/meta-efl/recipes-efl/webkit/webkit-efl_2.3.2+svnr159807.bb
@@ -0,0 +1,42 @@
+DESCRIPTION = "Webkit browser engine, EFL edition"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://Source/WebKit/LICENSE;md5=4646f90082c40bcf298c285f8bab0b12 \
+                    file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d84286dda758da57bd691 \
+                    file://Source/WebKit/efl/ewk/EWebKit.h;endline=20;md5=55ea170b1582797d2c69712de850f2fa \
+"
+
+# you need harfbuzz with icu enabled, you can add this to your config:
+# PACKAGECONFIG_append_pn-harfbuzz = " icu"
+DEPENDS = "icu libxslt sqlite3 gperf-native bison-native flex-native jpeg \
+           libpng libxt fontconfig cairo freetype glib-2.0 libsoup-2.4 \
+           libxml2 pango eina ecore evas edje edbus gstreamer gst-plugins-base harfbuzz"
+
+SRC_URI = "\
+    ${E_RELEASES}/libs/webkit-efl/webkit-efl-159807.tar.xz \
+"
+SRC_URI[md5sum] = "3e1377d976460dd14db0dd3cd39b8e48"
+SRC_URI[sha256sum] = "a99531299e41ba4671b32bbf46c3efc4d65960c9c87949a87f76e622c284f178"
+
+S = "${WORKDIR}/${BPN}"
+
+inherit cmake lib_package pkgconfig perlnative pythonnative
+
+ARM_INSTRUCTION_SET = "arm"
+
+EXTRA_OECMAKE = " \
+    -DPORT=Efl \
+    -DSHARED_CORE=On \
+    -DENABLE_DRAG_SUPPORT=On \
+    -DENABLE_WEB_AUDIO=Off \
+    -DENABLE_VIDEO=Off \
+    -DENABLE_VIDEO_TRACK=Off \
+    -DENABLE_ACCESSIBILITY=Off \
+    -DENABLE_BATTERY_STATUS=Off \
+"
+
+LEAD_SONAME = "libewebkit.so"
+PACKAGES =+ "${PN}launcher-dbg ${PN}launcher"
+
+FILES_${PN} += "${datadir}/webkit-1.0/theme/default.edj ${datadir}/ewebkit-0/themes/default.edj"
+FILES_${PN}launcher = "${bindir}/EWebLauncher"
+FILES_${PN}launcher-dbg = "${bindir}/.debug/EWebLauncher"
-- 
1.8.5.2


