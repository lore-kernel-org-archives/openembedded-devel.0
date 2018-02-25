Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7B95671B57
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 20:10:30 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id k13so16522541qtg.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 12:10:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JI61w12YlhjVn5PLAFxSyOGJwWOwGtgkkoqIkyVtfDY=;
	b=YHeJ/hWJQgUzkejJBw4yFyOnr6j/RBFnASYxgSxrVAkMyjOcQLys3rDum6Boqmbvn2
	xpDkAJSXlb09rNfdEbfifcnjymbt/+VVdriyoX6M93oQeVZVNRGCF5HNlS+16gmJV36n
	BHGvW82gMiKX58jjCYKZ8JGqvIh/SXnmve7GKvnsee9/p8yG2nqVjpxQdsXBTCPVbC7e
	sWYavpD+7WG8ja4dxYmoXPmEEUx8Bvon9Wf9cdumHVcnOC0OR5P10p9mH5Sxgj5spRcg
	5Kw0ZtnkGtKYbR13oRpy/nmr0CixBPLUZ5KA7TVyLib6KOnFZpX427yw+o5iSpqrOkwF
	xvgw==
X-Gm-Message-State: APf1xPBV77mW4m6tznp8AMqODkJNknQntCqjvWgAKJHyTYL7ww79grgQ
	8TNwVKszEIwuHad8dzaIUEd1a68K
X-Google-Smtp-Source: AG47ELtGmgmK+QePVhffFEWqiU2pfLx+ZFBf0F8kVviR6RhaR9DrnIO1Nba2ijDRczE7LKYwekLLaw==
X-Received: by 10.237.41.194 with SMTP id o60mr14487890qtd.128.1519589431244; 
	Sun, 25 Feb 2018 12:10:31 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id o2sm4246921qtg.12.2018.02.25.12.10.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 12:10:30 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 15:10:23 -0500
Message-Id: <1519589423-20792-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-can: update to version 2.1.0
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
X-List-Received-Date: Sun, 25 Feb 2018 20:10:30 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-can.inc                    | 4 ++--
 .../python/{python-can_2.0.0.bb => python-can_2.1.0.bb}               | 0
 .../python/{python3-can_2.0.0.bb => python3-can_2.1.0.bb}             | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-can_2.0.0.bb => python-can_2.1.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-can_2.0.0.bb => python3-can_2.1.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-can.inc b/meta-python/recipes-devtools/python/python-can.inc
index 70cde19..a71c47b 100644
--- a/meta-python/recipes-devtools/python/python-can.inc
+++ b/meta-python/recipes-devtools/python/python-can.inc
@@ -3,8 +3,8 @@ SECTION = "devel/python"
 LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=38138baa100d7259934590850bc0406e"
 
-SRC_URI[md5sum] = "d899550617614d542c0319773989920c"
-SRC_URI[sha256sum] = "da89e94fa234d4ebe7f43a26d4b06a5d14ea767fbd2c4767732e4d964473dfb0"
+SRC_URI[md5sum] = "3310f0aa2a8492d0ff614ecf636ec8a8"
+SRC_URI[sha256sum] = "4a5c01dd67feeda35f88e6c12ea14ac8cabd426b9be0cc5f9fd083fe90a9dbfc"
 
 PYPI_PACKAGE="python-can"
 
diff --git a/meta-python/recipes-devtools/python/python-can_2.0.0.bb b/meta-python/recipes-devtools/python/python-can_2.1.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-can_2.0.0.bb
rename to meta-python/recipes-devtools/python/python-can_2.1.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-can_2.0.0.bb b/meta-python/recipes-devtools/python/python3-can_2.1.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-can_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-can_2.1.0.bb
-- 
2.7.4


