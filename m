Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 40C20601F6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jul 2016 11:48:37 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id u25so1274884qtb.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jul 2016 04:48:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FKteJLHyP5JZ/Yt3pPUzN+OQiVQEE5eRbZXOrf2eAMw=;
	b=kK83CE16IISQWgejfjY24BIRNviY9lbbnuWIR1pGFiX8ridvBXflqh2Xi8rU7g/Ki9
	d/CSYCkw8NSCzXfYiVWT3y3KlujNP+Itcx4+BCBsuuD90cpQmHVw6Q87Zqjxn5qPA/+B
	gdThbfO9F88MKYdicO2Z05z2dm0FVACxx6cYIRpQOKe2rm55ENEsF2TNhl5fLwnMVH+/
	Rs+EgSWXCamQfAb0a9KWHi9q/UEJsTtCg5o5ATz5/1scn3kouk5U0K2v41ooxCTEpFSq
	XonVyKz4jZwG3i8KcsKxyIY2diQASJOcjcZ7URw9+L04OUcH4bzbYanCYNdFvSUMqNc2
	llCg==
X-Gm-Message-State: ALyK8tILF8w/bsI1Dn5+W1j8fXTAgYY13xJTK0it4SNF6T7MD+fC5CNzqTyLbiqOZc0cCA==
X-Received: by 10.237.59.161 with SMTP id r30mr2903376qte.22.1468151318593;
	Sun, 10 Jul 2016 04:48:38 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	g15sm4036784qta.33.2016.07.10.04.48.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 10 Jul 2016 04:48:37 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jul 2016 07:48:30 -0400
Message-Id: <1468151310-3871-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH] python-werkzeug: update to version 0.11.10
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
X-List-Received-Date: Sun, 10 Jul 2016 11:48:40 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-werkzeug.inc               | 4 ++--
 .../python/{python-werkzeug_0.11.5.bb => python-werkzeug_0.11.10.bb}  | 0
 .../{python3-werkzeug_0.11.5.bb => python3-werkzeug_0.11.10.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-werkzeug_0.11.5.bb => python-werkzeug_0.11.10.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_0.11.5.bb => python3-werkzeug_0.11.10.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-werkzeug.inc b/meta-python/recipes-devtools/python/python-werkzeug.inc
index 7b54469..f6f75d0 100644
--- a/meta-python/recipes-devtools/python/python-werkzeug.inc
+++ b/meta-python/recipes-devtools/python/python-werkzeug.inc
@@ -10,8 +10,8 @@ HOMEPAGE = "http://werkzeug.pocoo.org/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a68f5361a2b2ca9fdf26b38aaecb6faa"
 
-SRC_URI[md5sum] = "daf443a939459e12f14fd2e4658a26df"
-SRC_URI[sha256sum] = "afdb04f183eef3b20827eb4520dcb75c1cd1f0ba7a7de3f463ff7a462eee8164"
+SRC_URI[md5sum] = "780967186f9157e88f2bfbfa6f07a893"
+SRC_URI[sha256sum] = "cc64dafbacc716cdd42503cf6c44cb5a35576443d82f29f6829e5c49264aeeee"
 
 PYPI_PACKAGE = "Werkzeug"
 
diff --git a/meta-python/recipes-devtools/python/python-werkzeug_0.11.5.bb b/meta-python/recipes-devtools/python/python-werkzeug_0.11.10.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-werkzeug_0.11.5.bb
rename to meta-python/recipes-devtools/python/python-werkzeug_0.11.10.bb
diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_0.11.5.bb b/meta-python/recipes-devtools/python/python3-werkzeug_0.11.10.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-werkzeug_0.11.5.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_0.11.10.bb
-- 
1.9.1


