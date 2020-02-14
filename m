Return-Path: <straka.derek@gmail.com>
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
	[209.85.210.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2506B61090
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 19:14:05 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id h9so10139767otj.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 11:14:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=F4l4WkXTMSm524j3dIMqnHs50IoFomWTIxruhCsumPE=;
	b=gQZ6EVrYHc7O2FsbeixTxtYtLNtpnpfb97lMi1ltQlt/4DcjsATVypdxZDi/RBxFTM
	QaNEbmFCxPVDa2JDiRXyOZn1174LF3Dz6n5+r/h2CJ2cWaWN9Q22NdOStFSzPkPvgC2L
	AJ/8+RkiFqvrk2qFrWgRpiD5OnBxwKW0rrGgvX6NqRW2JSnZcU6wv8SE3EPzpV9TnVjO
	IGpx6zvEO4BvagmrCG4Qu5gTUs2UWhw4+JsdQcR32k4UI9QefTC+TZ0TDjdlitP38tY4
	73YbZnnFwRUjF0ar4xk78aZLMaoKlpOLy3ZANnkAlcB56lRhnWiJ1l5CD0QadhEcouxa
	ddgQ==
X-Gm-Message-State: APjAAAUejxX+rIK5kT9Kn32k0lKZEqV0RTvLKKpsgQAdx1nDhzek2Vdi
	LONTCoFWcq8Fqm+afq9LbHlV5iyj8xI=
X-Google-Smtp-Source: APXvYqzCnQfuk0Y/A9QDR7K2DLtBnL+YQgZjs1uVEDV5TAaOjlWWeNDTI7GE7uSZdsenjUv4+vbpUw==
X-Received: by 2002:a05:6830:128e:: with SMTP id
	z14mr3446290otp.184.1581707645784; 
	Fri, 14 Feb 2020 11:14:05 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id
	d24sm2255971otf.66.2020.02.14.11.14.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 11:14:05 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Feb 2020 14:13:55 -0500
Message-Id: <20200214191355.31600-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python3-blinker: consolidate inc and bb files into a single bb file
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
X-List-Received-Date: Fri, 14 Feb 2020 19:14:05 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-blinker.inc    | 7 -------
 .../recipes-devtools/python/python3-blinker_1.4.bb        | 8 +++++++-
 2 files changed, 7 insertions(+), 8 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-blinker.inc

diff --git a/meta-python/recipes-devtools/python/python-blinker.inc b/meta-python/recipes-devtools/python/python-blinker.inc
deleted file mode 100644
index eaf3908370..0000000000
--- a/meta-python/recipes-devtools/python/python-blinker.inc
+++ /dev/null
@@ -1,7 +0,0 @@
-DESCRIPTION = "Fast, simple object-to-object and broadcast signaling."
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=946d7e89af6f7733aeaebed5635d2682"
-
-SRC_URI[md5sum] = "8b3722381f83c2813c52de3016b68d33"
-SRC_URI[sha256sum] = "471aee25f3992bd325afa3772f1063dbdbbca947a041b8b89466dc00d606f8b6"
-
diff --git a/meta-python/recipes-devtools/python/python3-blinker_1.4.bb b/meta-python/recipes-devtools/python/python3-blinker_1.4.bb
index 924b3cf51d..e2f76c33d8 100644
--- a/meta-python/recipes-devtools/python/python3-blinker_1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-blinker_1.4.bb
@@ -1,2 +1,8 @@
+DESCRIPTION = "Fast, simple object-to-object and broadcast signaling."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=946d7e89af6f7733aeaebed5635d2682"
+
+SRC_URI[md5sum] = "8b3722381f83c2813c52de3016b68d33"
+SRC_URI[sha256sum] = "471aee25f3992bd325afa3772f1063dbdbbca947a041b8b89466dc00d606f8b6"
+
 inherit pypi setuptools3
-require python-blinker.inc
-- 
2.17.1


