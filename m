Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 986AE60069
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 06:16:09 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id s186so217392qkb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2017 22:16:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=n1jIfB7JxLEfGQw30Y2qX3wVmhLnjXz1wfIDdw7IBcs=;
	b=GHWU9Vco8CPW+DcRtpHqa5WSEqD8RMNGEC5dfsjweruy+f2zNYKUM/wja30flEO1cO
	c20tV9mp4MhMGQvrBseoPmvfkaI6teyS+Gj7IzVH8CHBz1nu+T8aKr/HWbyMUJJvv8ls
	PDnVJekJWRVn3v1L9TgC0Tyviblcq3SpHDgiRJnLJ+CAS7lTJZlH4IbDJt++VMjhyYxI
	k90BiaW7xmR0yjWoQSMTSaYApG8Nu5m4XBhhm0smEu9mynZIMy4BQMskVGQ7qLseUapm
	RdDK/QDMLxUA4143GT9C7lv9pgtfioqeUk1yx8cxHxmO7o7PEE38VDf333bMWp+IPUGZ
	Chvw==
X-Gm-Message-State: AMke39mNnp5CzLJFIBMAuZspMubl5xyveEkZXlauDYwzQYZcLsff5a/fokewWn2c1h+vkA==
X-Received: by 10.55.17.21 with SMTP id b21mr26257941qkh.289.1487744170425;
	Tue, 21 Feb 2017 22:16:10 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224])
	by smtp.gmail.com with ESMTPSA id j4sm141875qkc.40.2017.02.21.22.16.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Feb 2017 22:16:09 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2017 01:16:01 -0500
Message-Id: <1487744161-9077-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-lxml: update to version 3.7.3
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
X-List-Received-Date: Wed, 22 Feb 2017 06:16:09 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-lxml.inc                   | 4 ++--
 .../python/{python-lxml_3.7.2.bb => python-lxml_3.7.3.bb}             | 0
 .../python/{python3-lxml_3.7.2.bb => python3-lxml_3.7.3.bb}           | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-lxml_3.7.2.bb => python-lxml_3.7.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-lxml_3.7.2.bb => python3-lxml_3.7.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
index 6299385..d5e6ae4 100644
--- a/meta-python/recipes-devtools/python/python-lxml.inc
+++ b/meta-python/recipes-devtools/python/python-lxml.inc
@@ -18,8 +18,8 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=f9f1dc24f720c143c2240df41fe5073b \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[md5sum] = "8dcf8d6c692b7aed9370f7462ff09935"
-SRC_URI[sha256sum] = "59d9176360dbc3919e9d4bfca85c1ca64ab4f4ee00e6f119d7150ba887e3410a"
+SRC_URI[md5sum] = "075692ce442e69bbd604d44e21c02753"
+SRC_URI[sha256sum] = "aa502d78a51ee7d127b4824ff96500f0181d3c7826e6ee7b800d068be79361c7"
 
 DISTUTILS_BUILD_ARGS += " \
                      --with-xslt-config='pkg-config libxslt' \
diff --git a/meta-python/recipes-devtools/python/python-lxml_3.7.2.bb b/meta-python/recipes-devtools/python/python-lxml_3.7.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-lxml_3.7.2.bb
rename to meta-python/recipes-devtools/python/python-lxml_3.7.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-lxml_3.7.2.bb b/meta-python/recipes-devtools/python/python3-lxml_3.7.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-lxml_3.7.2.bb
rename to meta-python/recipes-devtools/python/python3-lxml_3.7.3.bb
-- 
2.7.4


