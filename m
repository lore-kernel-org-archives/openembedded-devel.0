Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 951D378458
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 16:36:23 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id w1so11389083qtg.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 09:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=04uNyOmATK/HwZx2FW/gR69vBcVBBbRAiF0XS6HEUcA=;
	b=Epj48ebRMxaYWiqOuX1E4esW4822sD0Hk+gU7HPPEJKkOCxtGcHYJ4YstQF1q/hGYz
	2xDR+25W9TraYhpeCqrHW0NozbnkWP+yGOskxX90cfgEJJ4eqwOHkttHjtBcBcY3DXMz
	bCFomBpxylgn6c0oBYqtyhdTpnohPXCkf17jG8Loxl+kWpYZQ3SgQxYHtsb6oeFNb65q
	MS1Su1FD2l9VEjr88gpL4wOnGljEyy4ydG4sqaKg7syad8qFnFnWdWEVnil3puo1ai6Q
	mubQTC8AL99Xo/MZ7t7tHJ/Lq5m4xD9rHEO69t/yriZ48R0cjSzsNh83RSKc/c3/c2Gm
	eN4A==
X-Gm-Message-State: AKS2vOxRBhPjiH3zzobtK6xarLTBDT01utA4QAX8dPd/oHWQbARksc66
	z1J7cIwVHIybdmlxotY=
X-Received: by 10.55.40.89 with SMTP id o86mr13884094qkh.116.1497630984852;
	Fri, 16 Jun 2017 09:36:24 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4])
	by smtp.gmail.com with ESMTPSA id k6sm1996051qtk.10.2017.06.16.09.36.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Jun 2017 09:36:24 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jun 2017 12:36:17 -0400
Message-Id: <1497630977-8930-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-chardet: update to version 3.0.4
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
X-List-Received-Date: Fri, 16 Jun 2017 16:36:32 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-chardet.inc                | 4 ++--
 .../python/{python-chardet_3.0.2.bb => python-chardet_3.0.4.bb}       | 0
 .../python/{python3-chardet_3.0.2.bb => python3-chardet_3.0.4.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-chardet_3.0.2.bb => python-chardet_3.0.4.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-chardet_3.0.2.bb => python3-chardet_3.0.4.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-chardet.inc b/meta-python/recipes-devtools/python/python-chardet.inc
index 42b64a2..c5da1e1 100644
--- a/meta-python/recipes-devtools/python/python-chardet.inc
+++ b/meta-python/recipes-devtools/python/python-chardet.inc
@@ -4,5 +4,5 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 inherit pypi
 
-SRC_URI[md5sum] = "96e364abdbde20b5f6dbbe2ad9d54d04"
-SRC_URI[sha256sum] = "4f7832e7c583348a9eddd927ee8514b3bf717c061f57b21dbe7697211454d9bb"
+SRC_URI[md5sum] = "7dd1ba7f9c77e32351b0a0cfacf4055c"
+SRC_URI[sha256sum] = "84ab92ed1c4d4f16916e05906b6b75a6c0fb5db821cc65e70cbd64a3e2a5eaae"
diff --git a/meta-python/recipes-devtools/python/python-chardet_3.0.2.bb b/meta-python/recipes-devtools/python/python-chardet_3.0.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-chardet_3.0.2.bb
rename to meta-python/recipes-devtools/python/python-chardet_3.0.4.bb
diff --git a/meta-python/recipes-devtools/python/python3-chardet_3.0.2.bb b/meta-python/recipes-devtools/python/python3-chardet_3.0.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-chardet_3.0.2.bb
rename to meta-python/recipes-devtools/python/python3-chardet_3.0.4.bb
-- 
2.7.4


