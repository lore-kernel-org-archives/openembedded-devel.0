Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9802C780B4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 18:16:21 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id y128so11184645qka.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 11:16:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7YSaH/UZvMWmhoLKrbEPjoa5neTQGewJb2Jen52s86M=;
	b=ClKJMtXp4ks15AaW6r9Wcr2R0M5uRjYfVFUW7g6Q7a59BkB737hext0Vb3mG7VIgWA
	pSTpWeQpzJjqMcIO/96kciEpl0PfWXH2yTYZ2z+9qJ9ajlVQIlxyRzC7tr/EGCmRLsN2
	Sdj7n4cknS0p1Ssv+uVJN0phnxD4HuIm/hPj+B9Z3nvH5ufImgtYM1ahk/g7Psp0iOio
	Xpeeur3OsxfM+qdZnh40V3xMT3loUnYEfRfHUGgASm5O55As6BC/jHBIlbaMgeUN+7/g
	s+lNEefnQgJ7b1ngCCvWn1D6Tx0n9IPuNHJOZGmi4in+OA57RHpxwLdFtNN2QMFy19Jf
	eQfw==
X-Gm-Message-State: AODbwcCcSUyxvGwgh7uriRKWFYWP+pvXzMN0Joj6jj1Ha/8dLt6YhCAD
	LY+6Tx9nvRh7IQ==
X-Received: by 10.233.223.197 with SMTP id t188mr10783114qkf.203.1495217782881;
	Fri, 19 May 2017 11:16:22 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224])
	by smtp.gmail.com with ESMTPSA id 88sm6599254qkx.68.2017.05.19.11.16.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 May 2017 11:16:21 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 May 2017 14:16:15 -0400
Message-Id: <1495217775-9985-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-psutil: update to version 5.2.2
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
X-List-Received-Date: Fri, 19 May 2017 18:16:28 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-psutil.inc                 | 4 ++--
 .../python/{python-psutil_5.2.0.bb => python-psutil_5.2.2.bb}         | 0
 .../python/{python3-psutil_5.2.0.bb => python3-psutil_5.2.2.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-psutil_5.2.0.bb => python-psutil_5.2.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-psutil_5.2.0.bb => python3-psutil_5.2.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-psutil.inc b/meta-python/recipes-devtools/python/python-psutil.inc
index 6d3ebf8..cd6df26 100644
--- a/meta-python/recipes-devtools/python/python-psutil.inc
+++ b/meta-python/recipes-devtools/python/python-psutil.inc
@@ -2,8 +2,8 @@ SUMMARY = "A cross-platform process and system utilities module for Python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0f02e99f7f3c9a7fe8ecfc5d44c2be62"
 
-SRC_URI[md5sum] = "c9aa2599dcd9e5b59d71b6660d396062"
-SRC_URI[sha256sum] = "2fc91d068faa5613c093335f0e758673ef8c722ad4bfa4aded64c13ae69089eb"
+SRC_URI[md5sum] = "bb98d48796cd76d9ccee871aad720f9c"
+SRC_URI[sha256sum] = "44746540c0fab5b95401520d29eb9ffe84b3b4a235bd1d1971cbe36e1f38dd13"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-shell \
diff --git a/meta-python/recipes-devtools/python/python-psutil_5.2.0.bb b/meta-python/recipes-devtools/python/python-psutil_5.2.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-psutil_5.2.0.bb
rename to meta-python/recipes-devtools/python/python-psutil_5.2.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-psutil_5.2.0.bb b/meta-python/recipes-devtools/python/python3-psutil_5.2.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-psutil_5.2.0.bb
rename to meta-python/recipes-devtools/python/python3-psutil_5.2.2.bb
-- 
2.7.4


