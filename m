Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id A8282601A4
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Jul 2016 13:18:11 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id n132so12699501qka.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jul 2016 06:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8prt/dERYpQEWmO0GQm/RJ7ABPVKwJy7uA5KePi4gl8=;
	b=kbOR91fHXHhyjVn7QPfv+j+S3skO15jRlnKi5zLMoGfimfS+jh9Cvqiha7nDJtSIp6
	WA/E9/uqEt80tFl+na8UBS7+YhbW19DbwqtIkUpnioD2dfLKaJshjqRmxABeLvvliimL
	PNNfHR+6ap18UBqQovUUEFC/phV77fXYE4xNCgOJDaTXMydu0paaWxyxT7yrDiwEZL5V
	/ZbHguKY6P/tw9T4RdymbfnVl3IkzU2Az8aBXLficqhRXr1+3FRwp4KTOTSL8uMRkAqO
	w6CJqIJeRwDMGCmkgU7w4V/mvG+egbJqznwjRwrRlTdmNRiygExPHocMEpWQIIQNWA+T
	JcHw==
X-Gm-Message-State: ALyK8tJufuemqCx8odqPpyE6EsbP6ik48cHlYKWweKwpHKzRyssGGr6DlJxezHzM/BBEzA==
X-Received: by 10.55.76.201 with SMTP id z192mr13957390qka.182.1468070292065; 
	Sat, 09 Jul 2016 06:18:12 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id z64sm347758qkb.3.2016.07.09.06.18.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 09 Jul 2016 06:18:11 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Jul 2016 09:17:59 -0400
Message-Id: <1468070280-31432-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH 1/2] python-xlrd: update to version 1.0.0
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
X-List-Received-Date: Sat, 09 Jul 2016 13:18:12 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-xlrd.inc                   | 4 ++--
 .../python/{python-xlrd_0.9.4.bb => python-xlrd_1.0.0.bb}             | 0
 .../python/{python3-xlrd_0.9.4.bb => python3-xlrd_1.0.0.bb}           | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-xlrd_0.9.4.bb => python-xlrd_1.0.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-xlrd_0.9.4.bb => python3-xlrd_1.0.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-xlrd.inc b/meta-python/recipes-devtools/python/python-xlrd.inc
index 3c0d26d..a0dfb40 100644
--- a/meta-python/recipes-devtools/python/python-xlrd.inc
+++ b/meta-python/recipes-devtools/python/python-xlrd.inc
@@ -6,5 +6,5 @@ HOMEPAGE = "http://www.python-excel.org/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://xlrd/licences.py;md5=b59dace5cc1db604c4219100b0422811"
 
-SRC_URI[md5sum] = "911839f534d29fe04525ef8cd88fe865"
-SRC_URI[sha256sum] = "8e8d3359f39541a6ff937f4030db54864836a06e42988c452db5b6b86d29ea72"
+SRC_URI[md5sum] = "9a91b688cd4945477ac28187a54f9a3b"
+SRC_URI[sha256sum] = "0ff87dd5d50425084f7219cb6f86bb3eb5aa29063f53d50bf270ed007e941069"
diff --git a/meta-python/recipes-devtools/python/python-xlrd_0.9.4.bb b/meta-python/recipes-devtools/python/python-xlrd_1.0.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-xlrd_0.9.4.bb
rename to meta-python/recipes-devtools/python/python-xlrd_1.0.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-xlrd_0.9.4.bb b/meta-python/recipes-devtools/python/python3-xlrd_1.0.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-xlrd_0.9.4.bb
rename to meta-python/recipes-devtools/python/python3-xlrd_1.0.0.bb
-- 
1.9.1


