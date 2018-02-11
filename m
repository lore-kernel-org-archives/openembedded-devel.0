Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 15F4371985
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Feb 2018 15:27:52 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id d14so16239324qtg.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Feb 2018 07:27:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hy6DRDMHEj8ghHmAt0u/Q3q2i/T5NQ3Xz1bwPxN3nbc=;
	b=Txf1O7m8YElk/M9MDpR6x0uNMAkH4ZEV/jXdQ88ebkiYTjzkyQbwwx9eL8/EVWS953
	JO+hFCBDssMyPDSihqoqbXHOeLy4u+YmimRb6E2J2/2hecZQuhvcIE1Foev+euCZHeZ2
	flAaMreLJMzr930dsbRf5ZENqMCW7OBceb6Nx50UoxGkcy+8wcc+Wjisxi6pDwVWmxZk
	2RlB2D0jiAffk4bn34YbClNmwuSJ0goz+uSnjxDfhBpLHA24p2/6aUF3cbXAj9wZgkGw
	XkWoXlM5KMK1jTkE4OARsjHfHceH+y75avkAqfLAykBk0qSUDeannR5zk473dpvRY5TX
	LH0Q==
X-Gm-Message-State: APf1xPCcZc3O4We3jeTeYunMA41HvhZI0Azwv2eYA5UrzpOLrMq2ImrE
	NWHZqnU4KvMHbFPQYVxvEUJnOfC8
X-Google-Smtp-Source: AH8x224Xi1g4JT3lIAzL6uTyi2TbhKTwPh8+jbjbDJbMRHIIPoQewNllt0WVRUTQhrqyr52CTbjVtA==
X-Received: by 10.200.61.146 with SMTP id v18mr14865279qtf.28.1518362873801;
	Sun, 11 Feb 2018 07:27:53 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	h45sm5028952qtc.34.2018.02.11.07.27.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Feb 2018 07:27:53 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Feb 2018 10:27:40 -0500
Message-Id: <1518362860-1820-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-greenlet: update to version 0.4.13
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
X-List-Received-Date: Sun, 11 Feb 2018 15:27:53 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-greenlet.inc               | 4 ++--
 .../python/{python-greenlet_0.4.12.bb => python-greenlet_0.4.13.bb}   | 0
 .../python/{python3-greenlet_0.4.12.bb => python3-greenlet_0.4.13.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-greenlet_0.4.12.bb => python-greenlet_0.4.13.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-greenlet_0.4.12.bb => python3-greenlet_0.4.13.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-greenlet.inc b/meta-python/recipes-devtools/python/python-greenlet.inc
index 35820db..7a42240 100644
--- a/meta-python/recipes-devtools/python/python-greenlet.inc
+++ b/meta-python/recipes-devtools/python/python-greenlet.inc
@@ -3,7 +3,7 @@ LICENSE = "MIT & PSF"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI[md5sum] = "e8637647d58a26c4a1f51ca393e53c00"
-SRC_URI[sha256sum] = "e4c99c6010a5d153d481fdaf63b8a0782825c0721506d880403a3b9b82ae347e"
+SRC_URI[md5sum] = "6e0b9dd5385f81d478451ec8ed1d62b3"
+SRC_URI[sha256sum] = "0fef83d43bf87a5196c91e73cb9772f945a4caaff91242766c5916d1dd1381e4"
 
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-greenlet_0.4.12.bb b/meta-python/recipes-devtools/python/python-greenlet_0.4.13.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-greenlet_0.4.12.bb
rename to meta-python/recipes-devtools/python/python-greenlet_0.4.13.bb
diff --git a/meta-python/recipes-devtools/python/python3-greenlet_0.4.12.bb b/meta-python/recipes-devtools/python/python3-greenlet_0.4.13.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-greenlet_0.4.12.bb
rename to meta-python/recipes-devtools/python/python3-greenlet_0.4.13.bb
-- 
2.7.4


