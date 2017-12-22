Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id CDA0B788C7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Dec 2017 15:25:54 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id f2so36667891qtj.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Dec 2017 07:25:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=v+TdHXpsxKdkNhcsSQe65SU4YcYW4P6RfK7ZIZKauQ0=;
	b=WlCoVff/AC5nHGGyR0FqYV6hnQmO2NxarCk5zxt/ioLiOukgsQEc17bbSfOGmZ0gM+
	a/XVPTe1LwnZuQ7FYSu8ybWCkcHjcQPWVmEK0XjwUG2d2QwMEVFwhLBAWbDqT8tMhtfP
	KKi6Go9QNtoBc0caU2922NzoGFfCuas4C30AryThk650HprUBHNuYdy3etEkzLXReMwy
	NVWje8QDVnN/iJH+/+OVzj4TrJkLMvWA6dgPEptqYKrE0lhLSJuaaLmG5XtDc8Wu+qmE
	IkQ9E97S+pQo50rWHSBNu5SY0jYAZ1cDB4PhohQyAyboF+nfqKTXBx1ChPKfN/ra8jH+
	6urA==
X-Gm-Message-State: AKGB3mLhAAxpCGpx5U6XQ+193eE42IObrKrJm/98lmehg7GdvRd1z7TG
	zxMDzAUWfNR+EdcBRiTD0HH4D+8W
X-Google-Smtp-Source: ACJfBotfEeBbnoe3hTOle2pNmIIRK7PewHB2zAUsrC5m4gEdZaG0IvG7eNtAjDahb9IHyGpUWTJLiA==
X-Received: by 10.237.35.207 with SMTP id k15mr21268989qtc.95.1513956355506;
	Fri, 22 Dec 2017 07:25:55 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	w56sm14403762qta.60.2017.12.22.07.25.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Dec 2017 07:25:55 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Dec 2017 10:25:49 -0500
Message-Id: <1513956349-8693-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-werkzeug: update to version 0.13
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
X-List-Received-Date: Fri, 22 Dec 2017 15:25:55 -0000

Verify license terms remain the same and update the checksum
Add required RDEPENDS for minimal python installs

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-werkzeug.inc            | 7 ++++---
 .../python/{python-werkzeug_0.12.2.bb => python-werkzeug_0.13.bb}  | 0
 .../{python3-werkzeug_0.12.2.bb => python3-werkzeug_0.13.bb}       | 0
 3 files changed, 4 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-werkzeug_0.12.2.bb => python-werkzeug_0.13.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_0.12.2.bb => python3-werkzeug_0.13.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-werkzeug.inc b/meta-python/recipes-devtools/python/python-werkzeug.inc
index e0b524c..0b99802 100644
--- a/meta-python/recipes-devtools/python/python-werkzeug.inc
+++ b/meta-python/recipes-devtools/python/python-werkzeug.inc
@@ -8,10 +8,10 @@ cookie handling, file uploads, a powerful URL routing system and a bunch \
 of community contributed addon modules."
 HOMEPAGE = "http://werkzeug.pocoo.org/"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a68f5361a2b2ca9fdf26b38aaecb6faa"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ed9a0b7c0254616d72dadb98b293ef1b"
 
-SRC_URI[md5sum] = "e385b2c5a7193cff24c689b31e1124dc"
-SRC_URI[sha256sum] = "903a7b87b74635244548b30d30db4c8947fe64c5198f58899ddcd3a13c23bb26"
+SRC_URI[md5sum] = "abdb978e30101809a0ad255f010b1d3d"
+SRC_URI[sha256sum] = "6246e5fc98a505824113fb6aca993d45ea284a2bcffdc2c65d0c538e53e4abd3"
 
 PYPI_PACKAGE = "Werkzeug"
 
@@ -32,6 +32,7 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-html \
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-json \
+    ${PYTHON_PN}-netclient \
     ${PYTHON_PN}-netserver \
     ${PYTHON_PN}-numbers \
     ${PYTHON_PN}-pkgutil \
diff --git a/meta-python/recipes-devtools/python/python-werkzeug_0.12.2.bb b/meta-python/recipes-devtools/python/python-werkzeug_0.13.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-werkzeug_0.12.2.bb
rename to meta-python/recipes-devtools/python/python-werkzeug_0.13.bb
diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_0.12.2.bb b/meta-python/recipes-devtools/python/python3-werkzeug_0.13.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-werkzeug_0.12.2.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_0.13.bb
-- 
2.7.4


