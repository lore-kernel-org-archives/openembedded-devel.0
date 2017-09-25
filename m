Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 47294782C4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Sep 2017 22:33:42 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id g128so5783534qke.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Sep 2017 15:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eE4rQ4ee709qttPjnAlPyNJq0qiJ1O8B414ZJ3B/adk=;
	b=PvnHBowj1yeA5tM2EP85RARG+ZxLQtffFCJGwgmtS509FIlFbjdvwCc7vBauV+EC6d
	XW0Lpoag17TCkVLtFAssSA9llctG0LHYoQ99QEXhFrkI7W3apQAUJtrK8/6cnSUGQ0eE
	TBSrMRTz7d9P+5BNpngvTkP1coyR0SU/QEOm1EuL1C/j/I1zmmXmWGEi4afeVzTdn/p3
	4u5nnfbnkUYVO63uUyqKUu+kR+66BwedMuSugfVkxDZnyvuA+s8G2RLTBFQddBGrA7pZ
	cArxc2hXM7nL9lEvMEyT4xUdlhhkLV3wZuA8QP6aBYMcwC6WHHs4ibWKk9JHcLBsLTcZ
	RAdg==
X-Gm-Message-State: AHPjjUjPgoR43wvnTR1KO+1WzM1gkVIdX6CRkUMgUa1mOuxa1R/ep8Iu
	V0R2vsWkeeVdfvsQjdplaj6NPwD2
X-Google-Smtp-Source: AOwi7QDBWNN/aueXKGGPT6lqf3VitXPTl31Sh7rWeeE9a/4vw28TTjQNH1OC0D5+n6GeP2nxwJ6/Ig==
X-Received: by 10.55.122.130 with SMTP id v124mr12793185qkc.209.1506378823095; 
	Mon, 25 Sep 2017 15:33:43 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	n20sm6014666qtc.72.2017.09.25.15.33.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Sep 2017 15:33:42 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Sep 2017 18:33:35 -0400
Message-Id: <1506378815-10418-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-babel: update to version 2.5.1
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
X-List-Received-Date: Mon, 25 Sep 2017 22:33:42 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-babel.inc                  | 4 ++--
 .../python/{python-babel_2.5.0.bb => python-babel_2.5.1.bb}           | 0
 .../python/{python3-babel_2.5.0.bb => python3-babel_2.5.1.bb}         | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-babel_2.5.0.bb => python-babel_2.5.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-babel_2.5.0.bb => python3-babel_2.5.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-babel.inc b/meta-python/recipes-devtools/python/python-babel.inc
index f671969..5e6ca3d 100644
--- a/meta-python/recipes-devtools/python/python-babel.inc
+++ b/meta-python/recipes-devtools/python/python-babel.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://babel.edgewall.org/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e6eeaabc92cfc2d03f53e789324d7292"
 
-SRC_URI[md5sum] = "03da8249c2684abcbd208a8d0f979939"
-SRC_URI[sha256sum] = "754177ee7481b6fac1bf84edeeb6338ab51640984e97e4083657d384b1c8830d"
+SRC_URI[md5sum] = "60228b3ce93a203357158b909afe8ae1"
+SRC_URI[sha256sum] = "6007daf714d0cd5524bbe436e2d42b3c20e68da66289559341e48d2cd6d25811"
 
 PYPI_PACKAGE = "Babel"
 
diff --git a/meta-python/recipes-devtools/python/python-babel_2.5.0.bb b/meta-python/recipes-devtools/python/python-babel_2.5.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-babel_2.5.0.bb
rename to meta-python/recipes-devtools/python/python-babel_2.5.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-babel_2.5.0.bb b/meta-python/recipes-devtools/python/python3-babel_2.5.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-babel_2.5.0.bb
rename to meta-python/recipes-devtools/python/python3-babel_2.5.1.bb
-- 
2.7.4


