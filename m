Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 163767469B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 20:34:22 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id d22-v6so12307621qkc.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 13:34:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WXjdq6euUXeoeWkfWc7BIN7EqLrRMMU6NK5LlUhOlQA=;
	b=Bf57SJgD0/62bHExe57o20nSwkWifNfhc3mvqd9pte7NiRLH4tOjNTF99Z1tYrby5r
	rZ9N9fhaT+cCtkES9ngrTEvZ7+fecOHZn/WLuZ3JnBsMzb7wrfKEEdkjawBIkl5y/Pu9
	alB9Lrb32RGsiRERDoMk+RjwgBNLHecOFmre8NaStl7hWRK2+2joeWsOXtuleWLiFeqW
	WrC7YDORhCCDJLh/n9hERvtWxW/7JzU0IJJE4O0Sw517vy6mV4TyLyG+c7di3b2Jo3mJ
	tzmee2kPQ2LL62wW1mHFZ6sPlp2AWwQwfp4Zx4i+Xsp/t9U0M63oqLWpwnyTXq1SP/wt
	lCWg==
X-Gm-Message-State: APt69E3pGOSeZ994xxQwL0E3+SeiwmRDGN5zuK9glj1NE9sAxaC9hiQ5
	9ddmsbylO9bI5eXt0vDxK9qekQ/1
X-Google-Smtp-Source: AAOMgpc99Rc3sbV2C3aMBs1Fhxw6Q892FmKA41pljeF/jmXFYka/B4uUph/WaMmidYUebTzkp/Yyrw==
X-Received: by 2002:a37:7185:: with SMTP id
	m127-v6mr22727413qkc.10.1531254863705; 
	Tue, 10 Jul 2018 13:34:23 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	n25-v6sm12692702qtl.25.2018.07.10.13.34.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Jul 2018 13:34:23 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Jul 2018 16:34:13 -0400
Message-Id: <1531254853-2627-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-django: update to version 1.11.14
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
X-List-Received-Date: Tue, 10 Jul 2018 20:34:23 -0000

Update the upstream check regex to restrict to version 1.X.Y

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-django.inc               | 6 ++++--
 .../python/{python-django_1.11.10.bb => python-django_1.11.14.bb}   | 0
 .../python/{python3-django_1.11.10.bb => python3-django_1.11.14.bb} | 0
 3 files changed, 4 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-django_1.11.10.bb => python-django_1.11.14.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-django_1.11.10.bb => python3-django_1.11.14.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-django.inc b/meta-python/recipes-devtools/python/python-django.inc
index 4ef2d7f..ee3aee6 100644
--- a/meta-python/recipes-devtools/python/python-django.inc
+++ b/meta-python/recipes-devtools/python/python-django.inc
@@ -3,12 +3,14 @@ HOMEPAGE = "http://www.djangoproject.com/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
 
-SRC_URI[md5sum] = "f306015e16a8d5024dbac923ac34fffb"
-SRC_URI[sha256sum] = "22383567385a9c406d8a5ce080a2694c82c6b733e157922197e8b393bb3aacd9"
+SRC_URI[md5sum] = "38e82b59a1c27bbf98ccf0564ead7426"
+SRC_URI[sha256sum] = "eb9271f0874f53106a2719c0c35ce67631f6cc27cf81a60c6f8c9817b35a3f6e"
 
 PYPI_PACKAGE = "Django"
 inherit pypi
 
+UPSTREAM_CHECK_REGEX = "(?P<pver>1(\.\d+)+)"
+
 FILES_${PN} += "${datadir}/django"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-django_1.11.10.bb b/meta-python/recipes-devtools/python/python-django_1.11.14.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-django_1.11.10.bb
rename to meta-python/recipes-devtools/python/python-django_1.11.14.bb
diff --git a/meta-python/recipes-devtools/python/python3-django_1.11.10.bb b/meta-python/recipes-devtools/python/python3-django_1.11.14.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-django_1.11.10.bb
rename to meta-python/recipes-devtools/python/python3-django_1.11.14.bb
-- 
2.7.4


