Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 533AC71A1A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Oct 2017 17:05:58 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id a12so3571229qka.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Oct 2017 10:05:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0jJtiUWbkn+b9h2tc6vJxivVl8OeY8omvZYqyQtiUFY=;
	b=I5cJL8KZbKPJ4ztOcuCgahPptOu9vG3UqGukOiDF/GplTnC2pwYEdS4dVMpgE61tPL
	nAD6xIVFIt8SI/IVyamk8fXgL7cEMlXfRe7/lYozH681V0xqz0WPs8exqQ4W2QKSVsKj
	2LhXnfYO7hxFleOxdwkAVr4LdRJSPtttS6ePLlIQaYlZeZ+2DdzshTHmyxkC9l9rt6xy
	yvol0hJADYat223uI1W88MF7GUQ5lk849xiXII23vnSd9WDZ2bQUv9d8ViIcKw3TQCX2
	85gVOpjHAMAOqttBUEZ51cdVMddEyoQiz4MpcC4/A75Zty6D7eSr2Aj8dIX3qAVx9zxO
	Q+ng==
X-Gm-Message-State: AMCzsaWaukfJQsQPEJZhvHl4M98OVJ+33DyonuBSccdQFeLrt5fXv+X6
	CTVyaXCPh4o5Wj3c18x8wAw78kNv
X-Google-Smtp-Source: AOwi7QDJ1AWxB/L8n52GKE9lxj2iE5ZJHrMBod8EIcYmVRdPGjagrFcfVqaejrAKopD57rDI7j4hKA==
X-Received: by 10.55.17.233 with SMTP id 102mr22123076qkr.56.1507050358756;
	Tue, 03 Oct 2017 10:05:58 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	u133sm8491686qka.92.2017.10.03.10.05.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Oct 2017 10:05:57 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Oct 2017 13:05:51 -0400
Message-Id: <1507050351-24774-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-twisted: update to version 17.9.0
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
X-List-Received-Date: Tue, 03 Oct 2017 17:05:58 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-twisted.inc                | 4 ++--
 .../python/{python-twisted_17.5.0.bb => python-twisted_17.9.0.bb}     | 0
 .../python/{python3-twisted_17.5.0.bb => python3-twisted_17.9.0.bb}   | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-twisted_17.5.0.bb => python-twisted_17.9.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-twisted_17.5.0.bb => python3-twisted_17.9.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-twisted.inc b/meta-python/recipes-devtools/python/python-twisted.inc
index bdb3c60..fed629c 100644
--- a/meta-python/recipes-devtools/python/python-twisted.inc
+++ b/meta-python/recipes-devtools/python/python-twisted.inc
@@ -7,8 +7,8 @@ HOMEPAGE = "http://www.twistedmatrix.com"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8a9c2fbfcba7d70504e3ba545e1820ed"
 
-SRC_URI[md5sum] = "cd5c287802dcbaf7be15cf937c922b71"
-SRC_URI[sha256sum] = "f198a494f0df2482f7c5f99d7f3eef33d22763ffc76641b36fec476b878002ea"
+SRC_URI[md5sum] = "6dbedb918f0c7288a4c670f59393ecf8"
+SRC_URI[sha256sum] = "0da1a7e35d5fcae37bc9c7978970b5feb3bc82822155b8654ec63925c05af75c"
 
 PYPI_PACKAGE = "Twisted"
 PYPI_PACKAGE_EXT = "tar.bz2"
diff --git a/meta-python/recipes-devtools/python/python-twisted_17.5.0.bb b/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-twisted_17.5.0.bb
rename to meta-python/recipes-devtools/python/python-twisted_17.9.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-twisted_17.5.0.bb b/meta-python/recipes-devtools/python/python3-twisted_17.9.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-twisted_17.5.0.bb
rename to meta-python/recipes-devtools/python/python3-twisted_17.9.0.bb
-- 
2.7.4


