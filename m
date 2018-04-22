Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1D9B871974
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Apr 2018 15:14:22 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id h4-v6so14946400qtn.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Apr 2018 08:14:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UnDwcvoh6h7leyHWPG4+2FVYJikjqqZhJnq1LyU5sDk=;
	b=IRfG5sIqM1HT3CQf5aNsldPg02jmgYEpIv8jgYU/TxASFL6Zge4C03UI+0kJpPVVdn
	FS4/YF5PyhY8YIeF440wxEUEXzrU2iDnERsVqD2nY92L7cgMj6YfH2FZqRKJizio+ysg
	LyGr3PSuxy0z0KyLb0df7d12BegPd8p1WaaV2tJmA4wCqAOS3O8ajrLVUZ+Y78bkdGZx
	3WxzBA8Za4S+TTbhDTTJMB0Y0KXniukwB3VSR2VIG8kAy/HdkLAyLaC9SUu+/LgTRiTf
	AAx/4ayjgrWI0qqArIEXgikZjYHxwGHFsE3C86pC5z4L9zgMYkfRkFoOV0DK/K3KwFkZ
	MehQ==
X-Gm-Message-State: ALQs6tAC5/436Gq+Y+CnzjVPMO6dpizLdQ1+ibql69bd11yMSXnBuZ7y
	865X8jyPoLgOw3giSyefXhxnI8i2
X-Google-Smtp-Source: AB8JxZoaiKnd9WhVKJN2dqGBHQOHpUt4bYXuZDQjdtbEXYDKhvMxHPge8pN3qV5vtasFrEOBO50tdQ==
X-Received: by 2002:ac8:41e:: with SMTP id
	v30-v6mr10303188qtg.270.1524410063258; 
	Sun, 22 Apr 2018 08:14:23 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	p8-v6sm9621055qtp.73.2018.04.22.08.14.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 22 Apr 2018 08:14:22 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Apr 2018 11:14:12 -0400
Message-Id: <1524410052-2489-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-decorator: update to version 4.3.0
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
X-List-Received-Date: Sun, 22 Apr 2018 15:14:23 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-decorator.inc              | 4 ++--
 .../python/{python-decorator_4.2.1.bb => python-decorator_4.3.0.bb}   | 0
 .../python/{python3-decorator_4.2.1.bb => python3-decorator_4.3.0.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-decorator_4.2.1.bb => python-decorator_4.3.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-decorator_4.2.1.bb => python3-decorator_4.3.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-decorator.inc b/meta-python/recipes-devtools/python/python-decorator.inc
index eaab3b0..44edb8a 100644
--- a/meta-python/recipes-devtools/python/python-decorator.inc
+++ b/meta-python/recipes-devtools/python/python-decorator.inc
@@ -9,8 +9,8 @@ decorator, just because you can."
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=893f896413826096ce5270c700a498fd"
 
-SRC_URI[md5sum] = "e886337e9f70e70d45d67266b8e66044"
-SRC_URI[sha256sum] = "7d46dd9f3ea1cf5f06ee0e4e1277ae618cf48dfb10ada7c8427cd46c42702a0e"
+SRC_URI[md5sum] = "249e7299b9b4bced0c382343f84eb1c0"
+SRC_URI[sha256sum] = "c39efa13fbdeb4506c476c9b3babf6a718da943dab7811c206005a4a956c080c"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-decorator_4.2.1.bb b/meta-python/recipes-devtools/python/python-decorator_4.3.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-decorator_4.2.1.bb
rename to meta-python/recipes-devtools/python/python-decorator_4.3.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-decorator_4.2.1.bb b/meta-python/recipes-devtools/python/python3-decorator_4.3.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-decorator_4.2.1.bb
rename to meta-python/recipes-devtools/python/python3-decorator_4.3.0.bb
-- 
2.7.4


