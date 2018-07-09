Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 80CA87489E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2018 16:42:15 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id u21-v6so10033705qku.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jul 2018 09:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OqBdU5hms1q2gWHI2NGNUbBjS1aPfyzQcCD8zCMF1a0=;
	b=FHky2E0O51ISbosPr+VpC4hPhQGhDSt4h0crL2Fl8onQvvijjQuuYeszo7Eqz+kfEH
	vB+oyyEudMdpn/Zz0x8UFsAVO6pFzxU5WLpYKuO1v/Dijgt+BSy8Xp6+Wt3kQ3xZZjyE
	Ar/qjfXmAcNXAPDfzuwhah5hH/u0V6KMcXJpN+DH7ncPS20WFbOaemQ/rXlPA1BPkXUU
	GSDMeyaRYz602nUDqmuYVmOgKPsnirYEj0cUqDh++WRt4JQ4kdVYE6ihhYGWvf+p0BCE
	1gyalzxzr30lMLn2QrpVMJUxk6Z0qdk9Vdpyz1qlS5FxFhoI395I/xBRSYMBWWsxqotx
	3H2g==
X-Gm-Message-State: APt69E2yAULlbgo0iaYZ+pSmC+a/woUroUcSm+71qB17AHGowJhxwkGQ
	Jp8oWPm3ag6o6TaGw7bnam8Qokpy
X-Google-Smtp-Source: AAOMgpcd0vvNPxiYX2EsrxhhXTqsIHeNjzKnPLK7plxDUIHDfKUtNzfghRwESVBEJsUAncINfXFXMg==
X-Received: by 2002:a37:16d1:: with SMTP id
	78-v6mr19119795qkw.271.1531154535977; 
	Mon, 09 Jul 2018 09:42:15 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	c93-v6sm15520130qkh.90.2018.07.09.09.42.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Jul 2018 09:42:14 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Jul 2018 12:42:00 -0400
Message-Id: <1531154520-8474-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-serpent: update to version 1.25
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
X-List-Received-Date: Mon, 09 Jul 2018 16:42:15 -0000

License-Update: PKG-INFO updated for the latest release and MIT remains the package license

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-serpent.inc              | 6 +++---
 .../python/{python-serpent_1.24.bb => python-serpent_1.25.bb}       | 0
 .../python/{python3-serpent_1.24.bb => python3-serpent_1.25.bb}     | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-serpent_1.24.bb => python-serpent_1.25.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-serpent_1.24.bb => python3-serpent_1.25.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-serpent.inc b/meta-python/recipes-devtools/python/python-serpent.inc
index 3f51bc2..2ba6570 100644
--- a/meta-python/recipes-devtools/python/python-serpent.inc
+++ b/meta-python/recipes-devtools/python/python-serpent.inc
@@ -1,9 +1,9 @@
 SUMMARY = "Serialization based on ast.literal_eval"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=acdea68f0e5a89eb6cbfdf54e38c356e"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=5a8193ba89f1083617f32d522f6485e9"
 
-SRC_URI[md5sum] = "d0c50f1943ff86d830eb3fe40f6dc1e3"
-SRC_URI[sha256sum] = "b6855483d95a03b6aee358363684cd38a3a670240da5bc6da4253079cb07b8df"
+SRC_URI[md5sum] = "0f9684622125a527fa4fbe2587738973"
+SRC_URI[sha256sum] = "264a028e059c1b557701ae7c567cdab330dbd228ff924489343efcb39bd828a0"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-serpent_1.24.bb b/meta-python/recipes-devtools/python/python-serpent_1.25.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-serpent_1.24.bb
rename to meta-python/recipes-devtools/python/python-serpent_1.25.bb
diff --git a/meta-python/recipes-devtools/python/python3-serpent_1.24.bb b/meta-python/recipes-devtools/python/python3-serpent_1.25.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-serpent_1.24.bb
rename to meta-python/recipes-devtools/python/python3-serpent_1.25.bb
-- 
2.7.4


