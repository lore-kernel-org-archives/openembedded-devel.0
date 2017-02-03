Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2398A60765
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Feb 2017 18:35:11 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id 11so7014141qkl.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Feb 2017 10:35:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Myy1pa/BfnzdJqupnD2hpwpoWxaQOrDebkdkAVQmxR8=;
	b=cVfNwSLhEfj7pnzqXtmVqn2gXhNXtwz267zrj980hjkkY7J4pNwq08do5Ti5tzk7ja
	3QSuox0++q0EbtMBXN3/XFp6I7sZYZDsFr21QHNIFTmT5Jrlv54qAE+dJuKBL8Dbdcbc
	lAOFxlZQKebIZpD4V4vOCFT5zv9qhHqr632pJG0jGY1FQ5+P1qksYvPIIcjTtMtrBGhi
	4HJDxfVcVV1JduxBAOQBuQ0JaSr1V2Hg1GehTNUrshid5mSJ7/Tqdsj9U21TeSq43Y2J
	RQc3mo4UCRq/5ZpjckVC9SqNFlgYbxEsVc2Fl0Imdc5cIJBleZUhpum/Hiip24+VJUqJ
	sE/Q==
X-Gm-Message-State: AMke39m266M9b2WvIrgP8VXHS2gZbq3Mf4oqsMUKq0v9g7xy99EiWfBM7O1wzmQeLsZORw==
X-Received: by 10.55.77.216 with SMTP id a207mr16000001qkb.63.1486146911535;
	Fri, 03 Feb 2017 10:35:11 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	r10sm25105085qte.1.2017.02.03.10.35.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Feb 2017 10:35:11 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Feb 2017 13:35:01 -0500
Message-Id: <1486146901-3114-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pytest: update version to 3.0.6
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
X-List-Received-Date: Fri, 03 Feb 2017 18:35:12 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pytest.inc                 | 4 ++--
 .../python/{python-pytest_3.0.4.bb => python-pytest_3.0.6.bb}         | 0
 .../python/{python3-pytest_3.0.4.bb => python3-pytest_3.0.6.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytest_3.0.4.bb => python-pytest_3.0.6.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pytest_3.0.4.bb => python3-pytest_3.0.6.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pytest.inc b/meta-python/recipes-devtools/python/python-pytest.inc
index 27f6c27..c9c9bbf 100644
--- a/meta-python/recipes-devtools/python/python-pytest.inc
+++ b/meta-python/recipes-devtools/python/python-pytest.inc
@@ -2,8 +2,8 @@ SUMMARY = "Simple powerful teting with python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d8a5609608d9a5a180705b0fa298ae01"
 
-SRC_URI[md5sum] = "0fbf3cf9f127ae34300e2c8bb002b6a6"
-SRC_URI[sha256sum] = "879fee2c1fdbaacd1bf2c0047677c6dd4aee05b9c1e64330b34d130a584fa40d"
+SRC_URI[md5sum] = "6639592fa430567d024189f097fcdbd7"
+SRC_URI[sha256sum] = "643434a9f1a188271da35e20064cb8b6c5440976c5bb541dc7b5b0e3cf75d940"
 
 RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-argparse \
diff --git a/meta-python/recipes-devtools/python/python-pytest_3.0.4.bb b/meta-python/recipes-devtools/python/python-pytest_3.0.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pytest_3.0.4.bb
rename to meta-python/recipes-devtools/python/python-pytest_3.0.6.bb
diff --git a/meta-python/recipes-devtools/python/python3-pytest_3.0.4.bb b/meta-python/recipes-devtools/python/python3-pytest_3.0.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pytest_3.0.4.bb
rename to meta-python/recipes-devtools/python/python3-pytest_3.0.6.bb
-- 
2.7.4


