Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6072271B31
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 01:00:00 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id a5so12253980qkg.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Jan 2018 17:00:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hFCYC+Z27Z2YUbssmrhWifSkwcsgPfCXpZwVIW1iKRo=;
	b=cJqBOL08+61q3lKj2GPF/UxxTNCYhAwxf/b7ccJC8a1hp4HlRY7f/waenbdgXZfhC7
	rSWm95+ySKZgtryCvaNnmVZrnvyOqMliV34xIH3lMzczE8HogVDgCR00CRNPj7kfOcKQ
	5sTc3tdfUe8ta/tchU6ZmUPExT4R2HfEJQQiVtVoQaZuk2hDW4BC3bfRAB+ccHsEjHHh
	TLQz0c3zLYa0YVUMdIiksDQnhVR6h5jmtV4Zk1ndvn/RQhJ1+3QvAhiHcgbdiDO/V/H9
	gS3qgSZrt0/DHFi2aXjJ919OrbjuIzvCmHsNHE8RdoQ2OeAMAvaBa+EoqDUilDpvOMDp
	Topw==
X-Gm-Message-State: AKwxytdzRxdRAC1gPH0yR1SV5vtJvmIYSjRocFXTYlgsk/CH3RotHG2d
	5CXBYaGB8mYLGj043aDKarV0cga1
X-Google-Smtp-Source: ACJfBotdVvEDLzo1GwaEo5kxx3AXGI1Ot115NP668vczOEKVjTu6Q82ZLqTttSDgUGaaQjlAV3Lxvw==
X-Received: by 10.55.78.211 with SMTP id c202mr45820645qkb.59.1515978001870;
	Sun, 14 Jan 2018 17:00:01 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id k7sm1996331qkk.70.2018.01.14.17.00.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 14 Jan 2018 17:00:01 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Jan 2018 19:59:51 -0500
Message-Id: <1515977991-12984-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-decorator: update to version 4.2.1
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
X-List-Received-Date: Mon, 15 Jan 2018 01:00:01 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-decorator.inc              | 4 ++--
 .../python/{python-decorator_4.1.2.bb => python-decorator_4.2.1.bb}   | 0
 .../python/{python3-decorator_4.1.2.bb => python3-decorator_4.2.1.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-decorator_4.1.2.bb => python-decorator_4.2.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-decorator_4.1.2.bb => python3-decorator_4.2.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-decorator.inc b/meta-python/recipes-devtools/python/python-decorator.inc
index 859f972..eaab3b0 100644
--- a/meta-python/recipes-devtools/python/python-decorator.inc
+++ b/meta-python/recipes-devtools/python/python-decorator.inc
@@ -9,8 +9,8 @@ decorator, just because you can."
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=893f896413826096ce5270c700a498fd"
 
-SRC_URI[md5sum] = "a0f7f4fe00ae2dde93494d90c192cf8c"
-SRC_URI[sha256sum] = "7cb64d38cb8002971710c8899fbdfb859a23a364b7c99dab19d1f719c2ba16b5"
+SRC_URI[md5sum] = "e886337e9f70e70d45d67266b8e66044"
+SRC_URI[sha256sum] = "7d46dd9f3ea1cf5f06ee0e4e1277ae618cf48dfb10ada7c8427cd46c42702a0e"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-decorator_4.1.2.bb b/meta-python/recipes-devtools/python/python-decorator_4.2.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-decorator_4.1.2.bb
rename to meta-python/recipes-devtools/python/python-decorator_4.2.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-decorator_4.1.2.bb b/meta-python/recipes-devtools/python/python3-decorator_4.2.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-decorator_4.1.2.bb
rename to meta-python/recipes-devtools/python/python3-decorator_4.2.1.bb
-- 
2.7.4


