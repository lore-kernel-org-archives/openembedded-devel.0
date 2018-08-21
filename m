Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id D7C1B79017
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 07:03:28 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id k8-v6so3974452pgq.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 00:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yPvoYWh7X/tX87wBjuRHgLYkjh+PImin+lISBtTNkUU=;
	b=UEZriGOpUtEBl24nd/0idHh+VLkTTZ/ZT6XNbbEIorscwkLogbD27d4NEUeetZ5Scj
	Mkla+hBwsgF3WYt28tL5dfcUHldhb7VCqNtxLALj4/Ne6KvXpO2uonN7elSDV8Vj04ph
	ZgReek7zT/QQvXmUZAfDl0Mj6G3QLJzUPs2TKv24SilonzEpOll3cC48Rl/FZEE1kMzN
	fuhqD7Kn/chi6E06+fwdHCNoWGLdKvv5qt5mPDnVduSHCZbvM9m79EliF5Xm0mLa3efD
	FAOThVi35+a5v4cjIQR34Dell5w4Q0BrPwfq7Yvi4a+PM5tj5X78P0YcY9cbZeHfUNRn
	jC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yPvoYWh7X/tX87wBjuRHgLYkjh+PImin+lISBtTNkUU=;
	b=H5gRGgE6XzAt4RGgpLpBnBpAIa5hz6RbfVr5wNdkjAYv28ug00jdqHQHpHY2Jeo8b/
	QNbtpBnXAzTRLeMZeTuUMRcG0UgyxGk1ZWmk3R2hqIHfkw4+KGRJ3X5pYHnRlqCfWr3U
	mntOQEKpID72yTyFtOsnE6P8ulH1oM2LiUTnwDL8KipkkyXJDsf2VuMpEPuoJMwfKt5W
	sTDIhl8telZ6WbSI2T6A8tRHMLUt+gztLI8N7Y4qhie3VC/ENft0fnMo+eBzJv7wDXz8
	pwGmokufDzr6WtruEcrPCERyZjhLRO6IQefDtIMu4Eu3cl7wNEMnjjzz7E3X7CCJPwSQ
	vaoQ==
X-Gm-Message-State: AOUpUlGFWTYTGHfEIVZDhuZ94vAILk8yOXDh79aMeu7VcKg+lcNDnh5n
	RMwSiVRDb0YVmBMhe1UgAXLbQ1TU
X-Google-Smtp-Source: AA+uWPyxcWpfyq2ibALELKUUvtOrISbJar8MgD7WGx/QcAEzf8qfdLK+3voneozdHt10k750jtCfhQ==
X-Received: by 2002:a63:ae02:: with SMTP id
	q2-v6mr46362496pgf.189.1534835009575; 
	Tue, 21 Aug 2018 00:03:29 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	l84-v6sm21214669pfg.3.2018.08.21.00.03.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Aug 2018 00:03:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Aug 2018 00:03:18 -0700
Message-Id: <20180821070319.36295-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180821070319.36295-1-raj.khem@gmail.com>
References: <20180821070319.36295-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/5] alsa-oss: Upgrade to 1.1.6
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
X-List-Received-Date: Tue, 21 Aug 2018 07:03:29 -0000

License-Update: FSF Address updated in COPYING file

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../alsa/alsa-oss_1.0.28.bb                   | 20 ---------
 .../recipes-multimedia/alsa/alsa-oss_1.1.6.bb | 43 +++++++++++++++++++
 2 files changed, 43 insertions(+), 20 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.28.bb
 create mode 100644 meta-oe/recipes-multimedia/alsa/alsa-oss_1.1.6.bb

diff --git a/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.28.bb b/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.28.bb
deleted file mode 100644
index 0c4a9f5456..0000000000
--- a/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.28.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "Alsa OSS Compatibility Package"
-SECTION = "libs/multimedia"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
-DEPENDS = "alsa-lib"
-
-SRC_URI = "ftp://ftp.alsa-project.org/pub/oss-lib/alsa-oss-${PV}.tar.bz2 \
-    file://libio.patch \
-"
-SRC_URI[md5sum] = "91f57e8cee1ad4cc956caa8b62ac5d43"
-SRC_URI[sha256sum] = "3ae62caa88a0bc7b30ed836dcb794dc6ef4d3650439e2260db54cace7d5c6ad5"
-
-inherit autotools
-
-LEAD_SONAME = "libaoss.so.0"
-
-do_configure_prepend () {
-    touch NEWS README AUTHORS ChangeLog
-    sed -i "s/libaoss.so/${LEAD_SONAME}/" ${S}/alsa/aoss.in
-}
diff --git a/meta-oe/recipes-multimedia/alsa/alsa-oss_1.1.6.bb b/meta-oe/recipes-multimedia/alsa/alsa-oss_1.1.6.bb
new file mode 100644
index 0000000000..efc56fe8c4
--- /dev/null
+++ b/meta-oe/recipes-multimedia/alsa/alsa-oss_1.1.6.bb
@@ -0,0 +1,43 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -2,7 +2,8 @@
+#  		       Version 2, June 1991
+#  
+#   Copyright (C) 1989, 1991 Free Software Foundation, Inc.
+# -                       59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+# + 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA
+# +
+#   Everyone is permitted to copy and distribute verbatim copies
+#   of this license document, but changing it is not allowed.
+#  
+# 
+#
+
+SUMMARY = "Alsa OSS Compatibility Package"
+SECTION = "libs/multimedia"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ed055b4eff93da784176a01582e6ec1a"
+DEPENDS = "alsa-lib"
+
+SRC_URI = "ftp://ftp.alsa-project.org/pub/oss-lib/alsa-oss-${PV}.tar.bz2 \
+    file://libio.patch \
+"
+SRC_URI[md5sum] = "fc845cafc4444193510ab1865c7350b8"
+SRC_URI[sha256sum] = "c3d3f743e61f05ff95c5cba3b06bc9c91ff86c37495f1d19dab844e6b90845ea"
+
+inherit autotools
+
+LEAD_SONAME = "libaoss.so.0"
+
+do_configure_prepend () {
+    touch NEWS README AUTHORS ChangeLog
+    sed -i "s/libaoss.so/${LEAD_SONAME}/" ${S}/alsa/aoss.in
+}
-- 
2.18.0


