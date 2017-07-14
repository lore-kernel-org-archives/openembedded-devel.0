Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8D18B77BF4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 05:40:27 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id d193so9392012pgc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jul 2017 22:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qXa7mW9TLJca3Qqc07CVqpEaRigLZ1MIp5DKjC0zTNg=;
	b=Y4pOEZKsFzSBbNGydGlujWnd6SzjmQvfdFz4eHxfxNURmynM0oMuLB5JWHHH03Ow1v
	1WGLcbXowe6AX4i+MOFAoDUFIdcOtXbfLkyAJk8s5ZGxRlnTDLJZGImp3Vh6uOKKQdpt
	GGnJQjjW5ZA46DQEK1+uePiNrBkVP9GjnvevVkZxfEG8NlNHWz3MlG1/ekxx9RY9dfOp
	/+qe4bmpk0KtiuqP2Ctn6geqVdQmPbZcPCj62Xt94nSWAn0ItvJiz8c+RNwE0taBhJCd
	ZXh9QXFxWxpTVmcX+YxqjexuqEW+0Xql9rvCiu8c55ll/90NQbQU97Uyj90bPTFkqRr8
	+ZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qXa7mW9TLJca3Qqc07CVqpEaRigLZ1MIp5DKjC0zTNg=;
	b=tCba/bb47LwSzkecrkxhiZ8b3eVgqHoI/iSkBcKnhuOWViAu5FQ8ySVlaZKTnzBnya
	O3yR1mi2p2+GU+Fiu4LfMk5bAnosDLMXIYH7Y2aWmsuFT1sfkBPPTBr55ur6YCQ3MCeD
	fNPtKDy90DwsEPB4uwSbM7JCsaTJQ8rsEUD7unIyhVB3EhKkNY9+O5pPoBDhISIsU4y+
	9pL1tchIJROpTG4g1Z7Ntnm83MzCKBg3OQGiDucYS+qJjTqwDdXsLbk49HLQ+G+j/xCK
	K2IC9bVJwxmqCp1XJvExceo/8Vb0NuCHkDEnsOI81AeGNmoFVWk6pjPpOKcJUKjh5Tjf
	2KEw==
X-Gm-Message-State: AIVw111QlJkZcbUW7WB/weEY2rZoE/gh5XlbglAj6I+jgM4YYAIzOwN/
	dofziFwIMv1CJPHK
X-Received: by 10.84.216.92 with SMTP id f28mr14166067plj.199.1500010828482;
	Thu, 13 Jul 2017 22:40:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	z86sm17519420pfl.40.2017.07.13.22.40.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jul 2017 22:40:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jul 2017 22:39:58 -0700
Message-Id: <20170714054013.34458-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170714054013.34458-1-raj.khem@gmail.com>
References: <20170714054013.34458-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 03/18] sox: Fix build with musl
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
X-List-Received-Date: Fri, 14 Jul 2017 05:40:27 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...error-line-and-live-without-file-type-det.patch | 28 ++++++++++++++++++++++
 .../recipes-multimedia/sox/sox_14.4.0.bb           |  4 +++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/0001-remove-the-error-line-and-live-without-file-type-det.patch

diff --git a/meta-multimedia/recipes-multimedia/sox/sox/0001-remove-the-error-line-and-live-without-file-type-det.patch b/meta-multimedia/recipes-multimedia/sox/sox/0001-remove-the-error-line-and-live-without-file-type-det.patch
new file mode 100644
index 000000000..605863a22
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/sox/sox/0001-remove-the-error-line-and-live-without-file-type-det.patch
@@ -0,0 +1,28 @@
+From c2aed28e3e14329ad0a8c4371fdcce9934013f21 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 12 Jul 2017 16:36:06 -0700
+Subject: [PATCH] remove the #error line and live without file-type detection
+ with pipes
+
+this fallback is executed with musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/formats.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/formats.c b/src/formats.c
+index 7e231ca..b13f0d5 100644
+--- a/src/formats.c
++++ b/src/formats.c
+@@ -416,7 +416,6 @@ static void UNUSED rewind_pipe(FILE * fp)
+   /* To fix this #error, either simply remove the #error line and live without
+    * file-type detection with pipes, or add support for your compiler in the
+    * lines above.  Test with cat monkey.au | ./sox --info - */
+-  #error FIX NEEDED HERE
+   #define NO_REWIND_PIPE
+   (void)fp;
+ #endif
+-- 
+2.13.2
+
diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
index ada958b13..e115f1c18 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
@@ -27,7 +27,9 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/sox/sox-${PV}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/sox/sox-${PV}.tar.gz \
+           file://0001-remove-the-error-line-and-live-without-file-type-det.patch \
+           "
 SRC_URI[md5sum] = "b0c15cff7a4ba0ec17fdc74e6a1f9cf1"
 SRC_URI[sha256sum] = "3ee34b14dd267de378e8a117aae81ec4cae330772342e6a55bbf6520a0a88aa3"
 
-- 
2.13.2


