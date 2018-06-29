Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 944C96006E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 21:11:35 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id c5-v6so9104914qth.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 14:11:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XotHSFVvxk6shZ6OCg0h5ddnhgAJfQ1zL/oEJXZz9+c=;
	b=YFKl/mkiFLodDFOLd61QC/WqKxJw7mTTujI4kFM1EE1zQuCpFCtCvGEX7nIZtb77pC
	fXXWVfekb+Z5kwqMJQ4TnmEVXpN+PoF2OV3QtB8wuEal43FS7d0VPWxHa/17oRW9MYbU
	uu+TWkAIMAtbx8mhH+DKWklVdMEw0r0H/19TSci3SpyEFiMQmH9DVxq4jF5OwKQm8Gxc
	dS/Nw2kOGXZTaAzl/rncPpxnVDusafyA/WBbndRW/eXY4JgIithn7TJtEWncdvLegGr4
	B/Y8DiDVUZEEp1pJaRwggp3/HNguQ/PScrnmCv5XVWjEocDEHVP2nYliI7VJNPECVi6T
	Hskw==
X-Gm-Message-State: APt69E1oNNi/HYwMp/g2EHhlIU/oTlgj5FIMC+DfvxoiUfbDOvV5pYIe
	WHHFQkcAu5uzIrNPHeH7e1sijhUB
X-Google-Smtp-Source: AAOMgpfZ6PaQnLWPUbHcA9uFjdoAgpFqMeRPcAcvSERlhGUHOOQKbsWyGcGlQJIzo5114+Peo7wmqw==
X-Received: by 2002:a0c:8cca:: with SMTP id
	q10-v6mr14979326qvb.33.1530306696120; 
	Fri, 29 Jun 2018 14:11:36 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-100-33-240-84.nycmny.fios.verizon.net. [100.33.240.84])
	by smtp.gmail.com with ESMTPSA id
	u11-v6sm9263537qki.41.2018.06.29.14.11.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jun 2018 14:11:35 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Jun 2018 17:11:25 -0400
Message-Id: <1530306685-28948-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pexpect: update to version 4.6.0
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
X-List-Received-Date: Fri, 29 Jun 2018 21:11:35 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pexpect.inc                | 4 ++--
 .../python/{python-pexpect_4.5.0.bb => python-pexpect_4.6.0.bb}       | 0
 .../python/{python3-pexpect_4.5.0.bb => python3-pexpect_4.6.0.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pexpect_4.5.0.bb => python-pexpect_4.6.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pexpect_4.5.0.bb => python3-pexpect_4.6.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pexpect.inc b/meta-python/recipes-devtools/python/python-pexpect.inc
index fa8ad01..efeab83 100644
--- a/meta-python/recipes-devtools/python/python-pexpect.inc
+++ b/meta-python/recipes-devtools/python/python-pexpect.inc
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1c7a725251880af8c6a148181665385b"
 
-SRC_URI[md5sum] = "913fc0a68a915cdf6ad4250493c94cf7"
-SRC_URI[sha256sum] = "9f8eb3277716a01faafaba553d629d3d60a1a624c7cf45daa600d2148c30020c"
+SRC_URI[md5sum] = "d4f3372965a996238d57d19b95d2e03a"
+SRC_URI[sha256sum] = "2a8e88259839571d1251d278476f3eec5db26deb73a70be5ed5dc5435e418aba"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/pexpect"
 
diff --git a/meta-python/recipes-devtools/python/python-pexpect_4.5.0.bb b/meta-python/recipes-devtools/python/python-pexpect_4.6.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pexpect_4.5.0.bb
rename to meta-python/recipes-devtools/python/python-pexpect_4.6.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-pexpect_4.5.0.bb b/meta-python/recipes-devtools/python/python3-pexpect_4.6.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pexpect_4.5.0.bb
rename to meta-python/recipes-devtools/python/python3-pexpect_4.6.0.bb
-- 
2.7.4


