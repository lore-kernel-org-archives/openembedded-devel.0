Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9BFFD75223
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 19:29:57 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id s47-v6so8835503qth.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 12:29:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=II4wY4u48RRx/IEXdhtZKUrTiR++iSNiRncm4WtSPOc=;
	b=f6Fblxrn/8nktimY3MCN1hVjKs62a38T+XoQ7R9dTVnmadj/8MRK97cHWeWJVkiVcU
	P90Mdwhdi1E+vz5f6EUX3QFqOjTQkReriyx971p1tAEZmRX2l7KJpATXy9Cn04tVWrU/
	w0j5IcV6eaB+F/roROdPOpHRkdmUDHHtkWxa9CmeMQOYN7xkEI1PYvyTQzL4Dyv0bT+H
	uknoIHNJ2WWNwzDgHG5AjQCAvHJFUS1TSM8zvjP4NyIKBClzCms2tMymDc8QKEgmXpp0
	euxBvOPqiC8Hu9nCDOxVZrMTBFACY5s6v0IJGtRS25I6Okc2UOeX6sljNOtsHUFEIY5P
	8YAg==
X-Gm-Message-State: APt69E1q+wXkwVPMBbwa0+H/Z01ZRa9FX/2sIij1XlFw4YgX/8MeEM6t
	nnxcVrPS3sf2kq77AntkT+PGBkO5
X-Google-Smtp-Source: AAOMgpdx46Xd6mokjcHVHl3MrcpiQ+vmixE9jm7baI0KBJ4mZ94vT4tNzr3Po/miPu8nX+KFBYluqg==
X-Received: by 2002:aed:3050:: with SMTP id
	74-v6mr14943163qte.124.1530300598396; 
	Fri, 29 Jun 2018 12:29:58 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-100-33-240-84.nycmny.fios.verizon.net. [100.33.240.84])
	by smtp.gmail.com with ESMTPSA id
	n21-v6sm8899551qkl.34.2018.06.29.12.29.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jun 2018 12:29:57 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Jun 2018 15:29:52 -0400
Message-Id: <1530300592-25245-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pybind11: update to version 2.2.3
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
X-List-Received-Date: Fri, 29 Jun 2018 19:29:58 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pybind11.inc               | 4 ++--
 .../python/{python-pybind11_2.2.2.bb => python-pybind11_2.2.3.bb}     | 0
 .../python/{python3-pybind11_2.2.2.bb => python3-pybind11_2.2.3.bb}   | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pybind11_2.2.2.bb => python-pybind11_2.2.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pybind11_2.2.2.bb => python3-pybind11_2.2.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pybind11.inc b/meta-python/recipes-devtools/python/python-pybind11.inc
index e441dc6..1722875 100644
--- a/meta-python/recipes-devtools/python/python-pybind11.inc
+++ b/meta-python/recipes-devtools/python/python-pybind11.inc
@@ -3,5 +3,5 @@ HOMEPAGE = "https://github.com/wjakob/pybind11"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=beb87117af69fd10fbf9fb14c22a2e62"
 
-SRC_URI[md5sum] = "2c651a75a20dabbaa18a8b023ffd54c0"
-SRC_URI[sha256sum] = "cbb036a8aad59a199ad672f98813f85c672642c6a67b4ff3868b1d6abc5fae3e"
+SRC_URI[md5sum] = "5b9611041e4ea66b2b919239e3bacd65"
+SRC_URI[sha256sum] = "87ff3ae777d9326349af5272974581270b2a0909b2392dc0cc57eb28ce23bcc3"
diff --git a/meta-python/recipes-devtools/python/python-pybind11_2.2.2.bb b/meta-python/recipes-devtools/python/python-pybind11_2.2.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pybind11_2.2.2.bb
rename to meta-python/recipes-devtools/python/python-pybind11_2.2.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.2.2.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.2.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pybind11_2.2.2.bb
rename to meta-python/recipes-devtools/python/python3-pybind11_2.2.3.bb
-- 
2.7.4


