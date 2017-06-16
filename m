Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id A1C7278312
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 19:55:25 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id w1so12618757qtg.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jwO4kRCYGTYfb1LRjbCMhJ3tg7+UAtyV6Ks2PcHL+FM=;
	b=LaeMwAF/4s2aT9QayoO7wlNHlcrg98yekwuz7BkkYTi2gDcsmBJoWZtbgpU+J90axC
	LX6FAB9cD5poIl2ohSkaVDIl0s81geOfRRLnQ7YbP+gU/j+38kXXIJJx02xxxSJSczz+
	SIjNJCOilXRYS7xlWQP8tvQsWA8EHCyERRtNJ2wcx/Q46WYTqsrJ/WwsPBriICKoq1YA
	2ydZVmElBaM8PaQQbtp118r59ME6R//D1+jG28//lP6GgdyzHOXU6QvGYSkLx9Ea7VBZ
	p+vVcFCgJA74dWbpnodqWmzsYk/uQfwmgEyAp4QxJtZK+MGcw8QT2COxwUfMl+zqtG3N
	4DyQ==
X-Gm-Message-State: AKS2vOzNk/SELipeT2SLl/FWVuPUj353rnptqk97GEsDZLUm9UR5998W
	tiDbZLqFqHLWBU9NyP0=
X-Received: by 10.200.55.233 with SMTP id e38mr14589591qtc.198.1497642926508; 
	Fri, 16 Jun 2017 12:55:26 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4]) by smtp.gmail.com with ESMTPSA id
	l23sm2314079qtl.24.2017.06.16.12.55.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Jun 2017 12:55:25 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jun 2017 15:55:19 -0400
Message-Id: <1497642919-14210-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-prompt-toolkit: update to version 1.0.14
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
X-List-Received-Date: Fri, 16 Jun 2017 19:55:26 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-prompt-toolkit.inc         | 4 ++--
 ...ython-prompt-toolkit_1.0.13.bb => python-prompt-toolkit_1.0.14.bb} | 0
 ...hon3-prompt-toolkit_1.0.13.bb => python3-prompt-toolkit_1.0.14.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-prompt-toolkit_1.0.13.bb => python-prompt-toolkit_1.0.14.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_1.0.13.bb => python3-prompt-toolkit_1.0.14.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-prompt-toolkit.inc b/meta-python/recipes-devtools/python/python-prompt-toolkit.inc
index 30c2c81..b5bb0c5 100644
--- a/meta-python/recipes-devtools/python/python-prompt-toolkit.inc
+++ b/meta-python/recipes-devtools/python/python-prompt-toolkit.inc
@@ -2,8 +2,8 @@ SUMMARY = "Library for building powerful interactive command lines in Python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
 
-SRC_URI[md5sum] = "427b496d2c147bd3819bc3a7f6e0d493"
-SRC_URI[sha256sum] = "33d68ca09f76cd73287fde7df5748ffacf26a8238dd61ee81ac50860ea7c6776"
+SRC_URI[md5sum] = "f24061ae133ed32c6b764e92bd48c496"
+SRC_URI[sha256sum] = "cc66413b1b4b17021675d9f2d15d57e640b06ddfd99bb724c73484126d22622f"
 
 PYPI_PACKAGE = "prompt_toolkit"
 
diff --git a/meta-python/recipes-devtools/python/python-prompt-toolkit_1.0.13.bb b/meta-python/recipes-devtools/python/python-prompt-toolkit_1.0.14.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-prompt-toolkit_1.0.13.bb
rename to meta-python/recipes-devtools/python/python-prompt-toolkit_1.0.14.bb
diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_1.0.13.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_1.0.14.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_1.0.13.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_1.0.14.bb
-- 
2.7.4


