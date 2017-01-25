Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4710D71CCB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 17:36:59 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id l7so32513556qtd.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 09:37:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9cb70Z5OAgpA3SEdNhknmJ2IoNGeu+xAFnFjpVywjd0=;
	b=IsONFKQ3HJIwxB2lFHILEuX0zB3Ti7eK9tL1TLpi1z7WLsRso7butplaURAbllIsdG
	2vPvsfC/itlR28oWEF+f4htNCQRyq//kgCFOrPRmATFF1Q1eHpD6t7Iz9Q5bKyYmTSF8
	DZkp5+7xjAzDk4EOWafPpbJZmwRA5hQwIM6m17jiKXBSF+uT5vGXk5bSW6pulGVz9xJ9
	VFc+Gp9vxYaH0Nbug6eLW4V/ci6bIUCCaqiU08dmwZVgJ93WR7VchozpjrK4UkVhh4Z0
	yaf8lX5rFER3MT18EfHKyR1/WPZYa4eH6NAjd3fS6MBuQvz75Mhaloa5a6X/WmpLW+LK
	lssA==
X-Gm-Message-State: AIkVDXLzYSbNLM/V8W5W1reKJWqyH3Z6iP8MYKFJw0v7muJV6UJVjwEnwEWW4SfJyJGhHg==
X-Received: by 10.55.189.130 with SMTP id n124mr8061331qkf.235.1485365820292; 
	Wed, 25 Jan 2017 09:37:00 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224])
	by smtp.gmail.com with ESMTPSA id t67sm855646qkd.41.2017.01.25.09.36.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Jan 2017 09:36:59 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jan 2017 12:36:52 -0500
Message-Id: <1485365812-6934-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-click: update to version 6.7
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
X-List-Received-Date: Wed, 25 Jan 2017 17:37:00 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-click.inc                  | 4 ++--
 .../python/{python-click_6.6.bb => python-click_6.7.bb}               | 0
 .../python/{python3-click_6.6.bb => python3-click_6.7.bb}             | 2 ++
 3 files changed, 4 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-click_6.6.bb => python-click_6.7.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-click_6.6.bb => python3-click_6.7.bb} (56%)

diff --git a/meta-python/recipes-devtools/python/python-click.inc b/meta-python/recipes-devtools/python/python-click.inc
index 90809af..163ea37 100644
--- a/meta-python/recipes-devtools/python/python-click.inc
+++ b/meta-python/recipes-devtools/python/python-click.inc
@@ -8,8 +8,8 @@ HOMEPAGE = "http://click.pocoo.org/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=09e8b7869f94ba9e9a7b260d53c65dab"
 
-SRC_URI[md5sum] = "d0b09582123605220ad6977175f3e51d"
-SRC_URI[sha256sum] = "cc6a19da8ebff6e7074f731447ef7e112bd23adf3de5c597cf9989f2fd8defe9"
+SRC_URI[md5sum] = "fc4cc00c4863833230d3af92af48abd4"
+SRC_URI[sha256sum] = "f15516df478d5a56180fbf80e68f206010e6d160fc39fa508b65e035fd75130b"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-io \
diff --git a/meta-python/recipes-devtools/python/python-click_6.6.bb b/meta-python/recipes-devtools/python/python-click_6.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-click_6.6.bb
rename to meta-python/recipes-devtools/python/python-click_6.7.bb
diff --git a/meta-python/recipes-devtools/python/python3-click_6.6.bb b/meta-python/recipes-devtools/python/python3-click_6.7.bb
similarity index 56%
rename from meta-python/recipes-devtools/python/python3-click_6.6.bb
rename to meta-python/recipes-devtools/python/python3-click_6.7.bb
index 1920644..ecd1514 100644
--- a/meta-python/recipes-devtools/python/python3-click_6.6.bb
+++ b/meta-python/recipes-devtools/python/python3-click_6.7.bb
@@ -1,2 +1,4 @@
 inherit pypi setuptools3
 require python-click.inc
+
+RDEPENDS_${PN} += "${PYTHON_PN}-enum"
-- 
2.7.4


