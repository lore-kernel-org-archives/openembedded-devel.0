Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1CA0878438
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 16:15:06 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id d4so24798695qtj.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 08:15:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7zX5mCiHtIVeh7PaqnZrQ9Vh2qm9arOuo80953FdO6c=;
	b=Sd9QY4gbpBM4rGPT9+NDKWeGerSEFxgGgoH0scMgDJA/Ek6yOVBMSpRTQoVae4yyxV
	edotoI5FPYcVZxHE7HYWvKOTj66vfAzrzduzOydXjJDVFVjUYzd9XKEBJ6KjYL23EhUH
	kWyoQb4ZceEnykI/f35aaWi7742n7vvmzbeZK6B/sZHoURgxvLQVukO0/O2NGLPRf3Gn
	phbRDanrUD+/aWwkiZvVVDXueicFno9BXXJZHCHlpkZahC82ftb0vOKiRDLPgDSoL3I9
	lSm/2iKooaBL8qsfhQTFUE6vXOrCAWLPtIuulyIH6M5gUDMRuRMlRPVrUOKSeb1FYN6C
	FGWQ==
X-Gm-Message-State: AKGB3mLc86WaCZHcl7H2WEQzE+xWFsJqrmJVgGZJry/fzkkyF06S0yIJ
	kozQ1EB7V6XhbqLGGZSPpsDlysbY
X-Google-Smtp-Source: ACJfBovtzP2k2IPOrUHFO3ihFy9kB79K0JfjusXWFFEaMX2TQ2XtTx11upJlGRj2IYt9kTSLxIj7HA==
X-Received: by 10.200.57.40 with SMTP id s37mr5998913qtb.41.1513700107639;
	Tue, 19 Dec 2017 08:15:07 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	b47sm10004058qtb.89.2017.12.19.08.15.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Dec 2017 08:15:07 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Dec 2017 11:14:59 -0500
Message-Id: <1513700100-1658-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH 1/2] python-cryptography: update to version 2.1.4
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
X-List-Received-Date: Tue, 19 Dec 2017 16:15:07 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cryptography.inc           | 4 ++--
 .../{python-cryptography_2.1.3.bb => python-cryptography_2.1.4.bb}    | 0
 .../{python3-cryptography_2.1.3.bb => python3-cryptography_2.1.4.bb}  | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cryptography_2.1.3.bb => python-cryptography_2.1.4.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cryptography_2.1.3.bb => python3-cryptography_2.1.4.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cryptography.inc b/meta-python/recipes-devtools/python/python-cryptography.inc
index dd71fe0..ac4da87 100644
--- a/meta-python/recipes-devtools/python/python-cryptography.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography.inc
@@ -10,8 +10,8 @@ DEPENDS += " \
     ${PYTHON_PN}-six \
 "
 
-SRC_URI[md5sum] = "65c0963048a88fcf725cfa265ed2fd5c"
-SRC_URI[sha256sum] = "68a26c353627163d74ee769d4749f2ee243866e9dac43c93bb33ebd8fbed1199"
+SRC_URI[md5sum] = "9f39d4d8f2b05f295fa0ff52475ec4f2"
+SRC_URI[sha256sum] = "e4d967371c5b6b2e67855066471d844c5d52d210c36c28d49a8507b96e2c5291"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-cffi \
diff --git a/meta-python/recipes-devtools/python/python-cryptography_2.1.3.bb b/meta-python/recipes-devtools/python/python-cryptography_2.1.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cryptography_2.1.3.bb
rename to meta-python/recipes-devtools/python/python-cryptography_2.1.4.bb
diff --git a/meta-python/recipes-devtools/python/python3-cryptography_2.1.3.bb b/meta-python/recipes-devtools/python/python3-cryptography_2.1.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cryptography_2.1.3.bb
rename to meta-python/recipes-devtools/python/python3-cryptography_2.1.4.bb
-- 
2.7.4


