Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 33097775EF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 22:33:57 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id c85so419445wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 14:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GeqkPAioM7VgVblalXaHV9uWLY2lEYJv5DkP4HTuIsM=;
	b=Q0F0wPtFA01p9044x8m2asleS41b49kZy9AUHqVFbSgo+ywx5e1oCtDn4xqoQNNIs1
	GOnUjrE34oGX8IGB6fpYMyniWLVarRytIaH0GwiCVgOQ4kFII4G6dDCXUhUFgVUAOUxL
	eWwRpHGNQgwy7eDIMvjXEB+4zYOxUt6P7ddRq54SIUIOczQsm/UmtrvwNkf5TVy7KhHH
	eE/GadpEBV8qjrl8dZbWsvPwR0I3aO6ztsj332EyAchoZeF+0ytk+s3Mlfyii7UGhDTa
	CkJqXtbaxMdyL/3UcGGyWa9/vslHaXQyX56s4NZrzz/NFThOwGdue3gzRsy0f3SvPoWV
	XKIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GeqkPAioM7VgVblalXaHV9uWLY2lEYJv5DkP4HTuIsM=;
	b=EU2ctN0+xVnds5eJBAfaGY3XtBk0wHvldUmKBkurgS1kfyiAXAhi/F5/ARabTLT8tA
	DEFMDNLHHC74h+qdrjrDy5AfpCVeEz0YOp8jWaDlTycNg7q8bni0m5lPlS+Y1urzP5dH
	Np/cdprCJc/ERNQY62z/hmjOsPJFepL5GhpKxHmynCaeDZdl9OPIb+MTDznld/te1uyK
	QfAMNdBgfYOLMWMgLY/dgGf3M8p4OqWIV+D3uvq1pH9r+MrW8F0iJI12ZYkMYw6DOPdm
	JS5tDjLh91QJRtJhE++5rDKK71e5O8gtQhfxADrBYRtMLkuvMJSRCp1gcKvGH6QMqwZ1
	v8DA==
X-Gm-Message-State: AIkVDXK7qvUvnc1bwK4hmS8lCIlROm1tQZbkh0u52FLTGMgALVAGduXN1y5nLWSoRZfj4Q==
X-Received: by 10.28.159.143 with SMTP id i137mr2836309wme.75.1482446038660;
	Thu, 22 Dec 2016 14:33:58 -0800 (PST)
Received: from localhost.localdomain (p579F7B0D.dip0.t-ipconnect.de.
	[87.159.123.13]) by smtp.googlemail.com with ESMTPSA id
	m145sm34179574wma.3.2016.12.22.14.33.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Dec 2016 14:33:58 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Dec 2016 23:33:32 +0100
Message-Id: <1482446018-17187-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH 1/7] poppler: update to 0.50.0
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
X-List-Received-Date: Thu, 22 Dec 2016 22:33:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../poppler/{poppler_0.49.0.bb => poppler_0.50.0.bb}                | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler_0.49.0.bb => poppler_0.50.0.bb} (91%)

diff --git a/meta-oe/recipes-support/poppler/poppler_0.49.0.bb b/meta-oe/recipes-support/poppler/poppler_0.50.0.bb
similarity index 91%
rename from meta-oe/recipes-support/poppler/poppler_0.49.0.bb
rename to meta-oe/recipes-support/poppler/poppler_0.50.0.bb
index ebb16d6..ec88e8d 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.49.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.50.0.bb
@@ -7,8 +7,8 @@ SRC_URI = " \
     file://0001-add-manadatory-options-to-find-qt4-qt5-moc.patch \
     file://0002-fix-gcc-6-math-ambiguous-errors.patch \
 "
-SRC_URI[md5sum] = "9e057ed8eee1f9979fa75d8f044783b8"
-SRC_URI[sha256sum] = "14485f0e1e43dcddf49cfc02c2ccb92910ba3e0e91e06f4bd2642ec00cb3a79f"
+SRC_URI[md5sum] = "1a4c0cd873bddd8f266b85ab8d799962"
+SRC_URI[sha256sum] = "c9c93318b789d3933f6e0bad3bc65110280c28eac3f0666284bb9c9a0ab4bc36"
 
 DEPENDS = "fontconfig zlib cairo lcms"
 
@@ -34,7 +34,7 @@ EXTRA_OECONF = "\
 "
 
 do_compile_prepend() {
-        export GIR_EXTRA_LIBS_PATH="${B}/poppler/.libs"
+    export GIR_EXTRA_LIBS_PATH="${B}/poppler/.libs"
 }
 
 # Adjust library names when building for QT4e
-- 
2.5.5


