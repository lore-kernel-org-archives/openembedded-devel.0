Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 15E2171CF9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 20:29:57 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id e1so19502037qkh.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2017 12:29:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XmpQLniyBDZqNztkWymGov/t5tYtsv2epe+raPbF+1k=;
	b=ICMMeOlmnLsQ5Fdw5SGS/0JwHZ4sflqUq+Om2n6RZFjMoCN5l2HJpLwZCp5/WJWytm
	G5DgeAbrNtBulXl/srEac+btMBBogzRovvmcuRTKRqOUfnl8S3gZJ5ns7nPUf7Lo5fC3
	HR2g4iwvw9luJEwi7MUAqV4KCoekkytajIQ6ciJYJd4bGR1Aw20JJGtFTcqr3BvUeRwj
	s/PYszZW+U5J8zMmWDkeCEU+efqZgPoHa1RDKk5Rbhvbt1Z9r1KaTnZ2eufTfd9SURWe
	2iTkrBKo6cBfpnM2biFBoDs0zjzW3BBI7+I29qOAG0Y0mkWxKqD35Z8neAn9BhDBcmqG
	9CAQ==
X-Gm-Message-State: AMke39n8W16MPD0jS0f6opNEOwCShQ+O09Lqeujr7gw220qWy10m9QFdDoh4DjwGmv+AmA==
X-Received: by 10.55.43.158 with SMTP id r30mr25489410qkr.28.1486585798380;
	Wed, 08 Feb 2017 12:29:58 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	x22sm4020478qkb.12.2017.02.08.12.29.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Feb 2017 12:29:57 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Feb 2017 15:29:49 -0500
Message-Id: <1486585789-18746-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyalsaaudio: update to version 0.8.2
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
X-List-Received-Date: Wed, 08 Feb 2017 20:29:58 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-pyalsaaudio_0.4.bb     | 15 ---------------
 .../recipes-devtools/python/python-pyalsaaudio_0.8.2.bb   | 13 +++++++++++++
 2 files changed, 13 insertions(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pyalsaaudio_0.4.bb
 create mode 100644 meta-python/recipes-devtools/python/python-pyalsaaudio_0.8.2.bb

diff --git a/meta-python/recipes-devtools/python/python-pyalsaaudio_0.4.bb b/meta-python/recipes-devtools/python/python-pyalsaaudio_0.4.bb
deleted file mode 100644
index 0e660ad..0000000
--- a/meta-python/recipes-devtools/python/python-pyalsaaudio_0.4.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Support for the Linux 2.6.x ALSA Sound System"
-SECTION = "devel/python"
-DEPENDS = "alsa-lib"
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1a3b161aa0fcec32a0c8907a2219ad9d"
-SRCNAME = "pyalsaaudio"
-PR = "ml2"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/pyalsaaudio/${SRCNAME}-${PV}.tar.gz"
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit distutils
-
-SRC_URI[md5sum] = "b312c28efba7db0494836a79f0a49898"
-SRC_URI[sha256sum] = "07148ce16024724b17cc24c51d0f4fb78af214b09b7dc8dcb7b06e5647f4c582"
diff --git a/meta-python/recipes-devtools/python/python-pyalsaaudio_0.8.2.bb b/meta-python/recipes-devtools/python/python-pyalsaaudio_0.8.2.bb
new file mode 100644
index 0000000..5408702
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyalsaaudio_0.8.2.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Support for the Linux 2.6.x ALSA Sound System"
+SECTION = "devel/python"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1a3b161aa0fcec32a0c8907a2219ad9d"
+
+SRC_URI[md5sum] = "1f22415a3d8da4b303182ad81c2d062e"
+SRC_URI[sha256sum] = "b6df486f1c4035041a5f3800496b86c64e48e4a7d47f94dcbca11b0187aa3a15"
+
+DEPENDS += "alsa-lib"
+
+inherit pypi distutils
+
+RDEPENDS_${PN} += "alsa-lib"
-- 
2.7.4


