Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 838F0780C2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 16:53:03 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id a72so65659023qkj.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 09:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ucaarbkVcD2CKW7u7tTRi8VXSLd/559wXyu1KzU1spY=;
	b=pRmLt2gnJAThG8MuqjMJPuPlVsArJeBCZlmj+s8dd6MvVpi7WeBMHcQ3kXBazEpj7I
	QZN3j2HYtEC6yczWr+3myFUlccJY/WfZyI37FggkYxwgkU3lyUMZg66S4pIgaelItz7e
	h8XCUmlaBtViV5goHX2gi8n9PH3wV9T+nVOLkSIOwDRDdatJQu7f6QtLkwFjIIzjuYBo
	xfiiaXAwczGddNTTHi8Op1qpa59bHKtzI8lpO8QmqJZ98HFZ+ZimbLk0wfe/zOfEboOy
	o2NhYAy8maYU+F7ndODSnjC/3sTYsaziNZqxC5kdnqlTW7dxoMUZxk7rjB/LOKa3/dWc
	/Cwg==
X-Gm-Message-State: AODbwcCEa/cllZJzpSGw0eFtEl5+vn81Ckwq9G77HGhsklZcQ9wzTKm8
	aL+f3caHG+0TNg==
X-Received: by 10.55.141.67 with SMTP id p64mr10007630qkd.164.1495212784553;
	Fri, 19 May 2017 09:53:04 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	o128sm6232328qkd.6.2017.05.19.09.53.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 May 2017 09:53:03 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 May 2017 12:52:55 -0400
Message-Id: <1495212775-15285-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-werkzeug: update to version 0.12.2
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
X-List-Received-Date: Fri, 19 May 2017 16:53:03 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-werkzeug.inc               | 4 ++--
 .../python/{python-werkzeug_0.11.15.bb => python-werkzeug_0.12.2.bb}  | 0
 .../{python3-werkzeug_0.11.15.bb => python3-werkzeug_0.12.2.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-werkzeug_0.11.15.bb => python-werkzeug_0.12.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_0.11.15.bb => python3-werkzeug_0.12.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-werkzeug.inc b/meta-python/recipes-devtools/python/python-werkzeug.inc
index e55f56d..b2949a3 100644
--- a/meta-python/recipes-devtools/python/python-werkzeug.inc
+++ b/meta-python/recipes-devtools/python/python-werkzeug.inc
@@ -10,8 +10,8 @@ HOMEPAGE = "http://werkzeug.pocoo.org/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a68f5361a2b2ca9fdf26b38aaecb6faa"
 
-SRC_URI[md5sum] = "cb4010478dd33905f95920e4880204a2"
-SRC_URI[sha256sum] = "455d7798ac263266dbd38d4841f7534dd35ca9c3da4a8df303f8488f38f3bcc0"
+SRC_URI[md5sum] = "e385b2c5a7193cff24c689b31e1124dc"
+SRC_URI[sha256sum] = "903a7b87b74635244548b30d30db4c8947fe64c5198f58899ddcd3a13c23bb26"
 
 PYPI_PACKAGE = "Werkzeug"
 
diff --git a/meta-python/recipes-devtools/python/python-werkzeug_0.11.15.bb b/meta-python/recipes-devtools/python/python-werkzeug_0.12.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-werkzeug_0.11.15.bb
rename to meta-python/recipes-devtools/python/python-werkzeug_0.12.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_0.11.15.bb b/meta-python/recipes-devtools/python/python3-werkzeug_0.12.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-werkzeug_0.11.15.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_0.12.2.bb
-- 
2.7.4


