Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9176478093
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jan 2018 20:00:30 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id a8so488055qkb.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jan 2018 12:00:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OC/ZYn9ZNirJMvOXyfWdC+Mm0117lQtYBboPuMqFM1w=;
	b=HBQbXZPkJV6EyeEBkRXiACmz6wIFqDOwy9ytaD3ZXgWoqTuxosgx5DaxfsAd97Tta6
	EmED9AIzI0YFMtXgXTkHYgReqIhJTc1pGgAoRo7JM1f0y8Y7YIy9snz4L6xRPOT7HNkt
	hXNdw9yhYY3r/9HWC1/uFw7yfBNDMcC/04pLSQ/Up+4a9NB2LnnSO95pmxDdIhNR1p5o
	7/f3nihS379BKkZcES+hLfs+fAomjSxhsJHEHa1R7t+PcwTCFWqIHQinNrOHp5gpsO1c
	OvAypkWouLJxuuOzmqXkh42M1w378nWfQ6u7RhdjpPr/5EDdmj54IFLJ6vNTqkHqYQzn
	NvvA==
X-Gm-Message-State: AKwxytew9Y9k1/wiJYOCns5nhCbBVZJ6MARrAY52BxPb0U9uwR8AiC+F
	BKhGSxgoqnGDJBPJblviFBZEhDey
X-Google-Smtp-Source: ACJfBot6nWeKLyJKBcCQJrrgTrxt25v14kU1WG9NWPoct9kVElx26hCU7HULS/rFAlHWWhbvaEXYGQ==
X-Received: by 10.200.22.33 with SMTP id p30mr27680516qtj.284.1515614429941;
	Wed, 10 Jan 2018 12:00:29 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	t48sm11226142qtc.10.2018.01.10.12.00.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Jan 2018 12:00:29 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Jan 2018 15:00:19 -0500
Message-Id: <1515614419-10149-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-werkzeug: update to version 0.14.1
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
X-List-Received-Date: Wed, 10 Jan 2018 20:00:30 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-werkzeug.inc               | 4 ++--
 .../python/{python-werkzeug_0.14.bb => python-werkzeug_0.14.1.bb}     | 0
 .../python/{python3-werkzeug_0.14.bb => python3-werkzeug_0.14.1.bb}   | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-werkzeug_0.14.bb => python-werkzeug_0.14.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_0.14.bb => python3-werkzeug_0.14.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-werkzeug.inc b/meta-python/recipes-devtools/python/python-werkzeug.inc
index e1b3400..5e6003f 100644
--- a/meta-python/recipes-devtools/python/python-werkzeug.inc
+++ b/meta-python/recipes-devtools/python/python-werkzeug.inc
@@ -10,8 +10,8 @@ HOMEPAGE = "http://werkzeug.pocoo.org/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ed9a0b7c0254616d72dadb98b293ef1b"
 
-SRC_URI[md5sum] = "533da0a836a7923704f35918da3bdc1e"
-SRC_URI[sha256sum] = "4aea27a9513b056346e9c8b49107f4ee7927f7bcf0be63024ecee39d5b87e9ef"
+SRC_URI[md5sum] = "6d20b5be2d245be4ac7706cc390d130c"
+SRC_URI[sha256sum] = "c3fd7a7d41976d9f44db327260e263132466836cef6f91512889ed60ad26557c"
 
 PYPI_PACKAGE = "Werkzeug"
 
diff --git a/meta-python/recipes-devtools/python/python-werkzeug_0.14.bb b/meta-python/recipes-devtools/python/python-werkzeug_0.14.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-werkzeug_0.14.bb
rename to meta-python/recipes-devtools/python/python-werkzeug_0.14.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_0.14.bb b/meta-python/recipes-devtools/python/python3-werkzeug_0.14.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-werkzeug_0.14.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_0.14.1.bb
-- 
2.7.4


