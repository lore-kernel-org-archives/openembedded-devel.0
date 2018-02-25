Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4EFF5601F1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 20:25:14 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id o25so11265734qkl.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 12:25:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iwY/UsPcETysY19IydUtxIwMcXKULtTBdx3rjmXSzbI=;
	b=gm0pARFjaflpobXLbxBpmgM+kXQ1uPDnPeJ1P+5khvWgkFJEIiibUFcHeqsp+XDKSH
	3D/sMD/joos/EHkXIWtaBa8YEwfp8pht5cnpwhgh0wpo6obNKIjUrBBkjCUZepQKhCCX
	4oCqlP6D0SzWLNr1NSzLAWMyC6xPYxPaN3muUvt+wLEetCvVf14yuyBF3EF9qutg3Ng2
	WYmRQ+KHOkvta2szNlQ1pHwMmASrvzOJ7Kwv87o89xHsy3nnr6qJYOZoxcOKMm0fxpE+
	ip49zqoJKLM7QfuFJ+ESlLu/akPVlOOHg1Ae6qMEBpblfLZ8J7RwpPixMNeFT2tDROBH
	lqlA==
X-Gm-Message-State: APf1xPAOIuNw+aKc3STSSY9lVr6fcr01hrG0TH5V/eVHpurS0l0CCIX0
	VFvxzdEGbFS+8TBACMIF54TqLu/x
X-Google-Smtp-Source: AG47ELuIKxrnB2E0uYOevq8lWIOIIESQr1bYdJcqBZexkf3GtFIhY1StmevSRdIIJ/DWveJWpnWNNw==
X-Received: by 10.55.200.15 with SMTP id c15mr13775585qkj.73.1519590316128;
	Sun, 25 Feb 2018 12:25:16 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	m187sm4119250qkd.6.2018.02.25.12.25.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 12:25:15 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 15:25:06 -0500
Message-Id: <1519590306-8966-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-webcolors: update to version 1.8.1
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
X-List-Received-Date: Sun, 25 Feb 2018 20:25:15 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-webcolors.inc              | 4 ++--
 .../python/{python-webcolors_1.8.bb => python-webcolors_1.8.1.bb}     | 0
 .../python/{python3-webcolors_1.8.bb => python3-webcolors_1.8.1.bb}   | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-webcolors_1.8.bb => python-webcolors_1.8.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-webcolors_1.8.bb => python3-webcolors_1.8.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-webcolors.inc b/meta-python/recipes-devtools/python/python-webcolors.inc
index a67b32f..a02bbbb 100644
--- a/meta-python/recipes-devtools/python/python-webcolors.inc
+++ b/meta-python/recipes-devtools/python/python-webcolors.inc
@@ -2,8 +2,8 @@ SUMMARY = "Simple Python module for working with HTML/CSS color definitions."
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=197add016087e6884a012b0f185d44ad"
 
-SRC_URI[md5sum] = "d7a17135f8b8374a75c2f1d08253c026"
-SRC_URI[sha256sum] = "da3cb551060f46f417341b041b36d329d699c125a13a4412dde5c2e310d63344"
+SRC_URI[md5sum] = "40890db38b2a856e526a568864025fe6"
+SRC_URI[sha256sum] = "030562f624467a9901f0b455fef05486a88cfb5daa1e356bd4aacea043850b59"
 
 RDEPENDS_${PN}_class-target = "\
     ${PYTHON_PN}-stringold \
diff --git a/meta-python/recipes-devtools/python/python-webcolors_1.8.bb b/meta-python/recipes-devtools/python/python-webcolors_1.8.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-webcolors_1.8.bb
rename to meta-python/recipes-devtools/python/python-webcolors_1.8.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-webcolors_1.8.bb b/meta-python/recipes-devtools/python/python3-webcolors_1.8.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-webcolors_1.8.bb
rename to meta-python/recipes-devtools/python/python3-webcolors_1.8.1.bb
-- 
2.7.4


