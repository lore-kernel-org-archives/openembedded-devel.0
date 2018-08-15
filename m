Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 63DEA79201
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Aug 2018 15:44:54 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id w26-v6so1652818qto.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Aug 2018 08:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KVuTEs2Be/CLlMEXBLaEzVcbPF7hVD924xDCEd8ghMs=;
	b=hq6n7W+TbK7NxzU8D4uoOwNFaas8z6AqxQg+gH+kkL6aiOgfSHsc6ALK7weCx16ght
	5L9HFoYDfiptemIuJoKPcY/xb45b8+zQK8FbZOQ1YzLIf0zJz5hnjyUw5lk6C8fgvgdA
	l/eX7AliCWiqZYWP7mDR4QyITYjFPP68SH3VKxpeeIm+l07gZuiWXSOe8T+wv9LVHPHA
	hM0TltbavVQjszeyvGI1pjRUi/MwNtCoGqpdx9dvsjhwcIbAsDIZXva6Gg3iQbB6Ivug
	HUDSnb6nTC1O6ovUGSVikvxMqPpgLUIwPAySogX8WL9adgTbShY49tU6qHgnz+PeO2hv
	tM1w==
X-Gm-Message-State: AOUpUlH88/CZk9QCecyfmhDb1Dp/81S+pu4SWdlbH1FT61r9/qQnHYEQ
	uqb9XWQRiDOzELEgi3x61TPtlu0EoQo=
X-Google-Smtp-Source: AA+uWPzU4LgCKD3B7wZHMm/Kz/mjY+AbPk97DQJjJ6cMimGYtI2dPtbrfQAj9Dk4E3ZHlufcYbpl+Q==
X-Received: by 2002:a0c:e9ce:: with SMTP id
	q14-v6mr23643842qvo.106.1534347894691; 
	Wed, 15 Aug 2018 08:44:54 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	g19-v6sm15202331qtk.80.2018.08.15.08.44.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Aug 2018 08:44:54 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Aug 2018 11:44:47 -0400
Message-Id: <1534347887-7105-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-prompt-toolkit: update to version 2.0.4
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
X-List-Received-Date: Wed, 15 Aug 2018 15:44:54 -0000

Update to the latest stable release.  This branch is
incompatible with the 1.x.y releases

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-prompt-toolkit.inc         | 4 ++--
 ...python-prompt-toolkit_1.0.15.bb => python-prompt-toolkit_2.0.4.bb} | 0
 ...thon3-prompt-toolkit_1.0.15.bb => python3-prompt-toolkit_2.0.4.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-prompt-toolkit_1.0.15.bb => python-prompt-toolkit_2.0.4.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_1.0.15.bb => python3-prompt-toolkit_2.0.4.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-prompt-toolkit.inc b/meta-python/recipes-devtools/python/python-prompt-toolkit.inc
index cc409a4..1a4bd35 100644
--- a/meta-python/recipes-devtools/python/python-prompt-toolkit.inc
+++ b/meta-python/recipes-devtools/python/python-prompt-toolkit.inc
@@ -2,8 +2,8 @@ SUMMARY = "Library for building powerful interactive command lines in Python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
 
-SRC_URI[md5sum] = "8fe70295006dbc8afedd43e5eba99032"
-SRC_URI[sha256sum] = "858588f1983ca497f1cf4ffde01d978a3ea02b01c8a26a8bbc5cd2e66d816917"
+SRC_URI[md5sum] = "8db8b8e40e91bc6dce133d8d5727a717"
+SRC_URI[sha256sum] = "ff58ce8bb82c11c43416dd3eec7701dcbe8c576e2d7649f1d2b9d21a2fd93808"
 
 PYPI_PACKAGE = "prompt_toolkit"
 
diff --git a/meta-python/recipes-devtools/python/python-prompt-toolkit_1.0.15.bb b/meta-python/recipes-devtools/python/python-prompt-toolkit_2.0.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-prompt-toolkit_1.0.15.bb
rename to meta-python/recipes-devtools/python/python-prompt-toolkit_2.0.4.bb
diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_1.0.15.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_2.0.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_1.0.15.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_2.0.4.bb
-- 
2.7.4


