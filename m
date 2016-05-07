Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f68.google.com (mail-qg0-f68.google.com
	[209.85.192.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5FE4E605BA
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 May 2016 15:13:12 +0000 (UTC)
Received: by mail-qg0-f68.google.com with SMTP id b14so8690139qge.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 May 2016 08:13:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4MNdSr2vwvgB5AIuVAz/+Vv4ZYvWw9CAFLtuc+PLNhQ=;
	b=Vsw1Bc06LEOenPzKnk6p4oZZq9fa3oIFBBabroSM9rYl/23Ejgsj4nILYYAQTTWsNO
	4wigva5KiTrAp3t9XSsbijsEgr/1NYj7amn4npxyPLNpqvOF84gHDIMvX5yOygU6DWhv
	zxAZtdcb0br1IcjH5Z6auN++dXVnfxVISCvCvB1THemfD+M75Znzly8Hd6EX314j0GHJ
	CNo0hJHij/XuH0BPqqjF+/z90DMwepanaAMTJFsxfJ2Ax4YcP9nZqkdCxjUNOJYx5CZi
	i8VelpjjST7/MdI/0UZVeGj0ppoKQB4Vf+Vw9e1NtAJQ/cSbZQPAOBC/bP4o7Dam2Duz
	ONvA==
X-Gm-Message-State: AOPr4FVEY77pb7k+RTUuK3HzpHbFBvTqDIi5m1mbFiRO9ggIsejvZVU6C0/5IGCIBATDKQ==
X-Received: by 10.140.94.234 with SMTP id g97mr19888113qge.35.1462633993348;
	Sat, 07 May 2016 08:13:13 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	a31sm7925350qga.34.2016.05.07.08.13.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 May 2016 08:13:12 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 May 2016 11:12:50 -0400
Message-Id: <1462633970-14004-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1462633970-14004-1-git-send-email-derek@asterius.io>
References: <1462633970-14004-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 2/2] python-dateutil: update to version 2.5.3
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
X-List-Received-Date: Sat, 07 May 2016 15:13:13 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-dateutil.inc              | 5 +++--
 .../python/{python-dateutil_2.5.2.bb => python-dateutil_2.5.3.bb}    | 0
 .../python/{python3-dateutil_2.5.2.bb => python3-dateutil_2.5.3.bb}  | 0
 3 files changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-dateutil_2.5.2.bb => python-dateutil_2.5.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-dateutil_2.5.2.bb => python3-dateutil_2.5.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-dateutil.inc b/meta-python/recipes-devtools/python/python-dateutil.inc
index a944ef2..797234b 100644
--- a/meta-python/recipes-devtools/python/python-dateutil.inc
+++ b/meta-python/recipes-devtools/python/python-dateutil.inc
@@ -5,10 +5,11 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=51430b33c900f45f999c459ee29ca493"
 PR = "r0"
 
-SRC_URI[md5sum] = "eafe168e8f404bf384514f5116eedbb6"
-SRC_URI[sha256sum] = "063907ef47f6e187b8fe0728952e4effb587a34f2dc356888646f9b71fbb2e4b"
+SRC_URI[md5sum] = "05ffc6d2cc85a7fd93bb245807f715ef"
+SRC_URI[sha256sum] = "1408fdb07c6a1fa9997567ce3fcee6a337b39a503d80699e0f213de4aa4b32ed"
 
 PYPI_PACKAGE = "python-dateutil"
+PYPI_PACKAGE_HASH = "3ef5aad82824b369332a676a90a8c0d1e608b17e740bbb6aeeebca726f17b902"
 inherit pypi 
 
 PACKAGES =+ "${PN}-zoneinfo"
diff --git a/meta-python/recipes-devtools/python/python-dateutil_2.5.2.bb b/meta-python/recipes-devtools/python/python-dateutil_2.5.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-dateutil_2.5.2.bb
rename to meta-python/recipes-devtools/python/python-dateutil_2.5.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-dateutil_2.5.2.bb b/meta-python/recipes-devtools/python/python3-dateutil_2.5.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-dateutil_2.5.2.bb
rename to meta-python/recipes-devtools/python/python3-dateutil_2.5.3.bb
-- 
1.9.1


