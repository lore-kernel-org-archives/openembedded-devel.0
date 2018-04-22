Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id B200B71A6B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Apr 2018 15:16:50 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id h2-v6so2897551qtp.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Apr 2018 08:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0Koh5yVzaQ3Jfwpbq5QnwOZ50Zaz59oD0Mvmusj4qbI=;
	b=ZeEiy3prQQUOrRZrVipsbByaltwci4lPrtED5xGTWc+mC94ZPuB4e6bA9oPcWXq3+6
	dg5fMIMLJOkJgPlcFnvbDtXVo4RlnQco92N8NoiuW7SdD13rzy8KJPZPAA/iMfJLeXub
	PZ1VYcS0BF28WDxijDl/+Hg40tYEK/NmqAM3G84sXneKqY1/EtZqapmhvZiYa66taX65
	EvW96LqXr9RyF7QYrJgNtip749XZTdTr9P3GqTNqdKGUaDn1PewWJlqW92WFXh6TLa/j
	XXD5/pxTJOuRE8J+6pEvnGL7Zx7k3XbDaJeYfzgr5pce5Wi5Xyj/lWuPZgVP2SJo45XW
	2zZA==
X-Gm-Message-State: ALQs6tBXxNkqt7sr8zXY107ytsBu3Yz87GwcHi+WUQnjzzXD3e1PLX1e
	mN7gqk8/MAx0gI1+foAMonMNqEJS
X-Google-Smtp-Source: AB8JxZrdm2LCwgId6XjP1g9UVB2KbPgoOI5SQtoeFB1qYuv1sTCDIvbkYUTCX4l0vdgJwX2zxV91gQ==
X-Received: by 2002:ac8:1e0d:: with SMTP id
	n13-v6mr18996999qtl.404.1524410210967; 
	Sun, 22 Apr 2018 08:16:50 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	m66sm8682559qkl.57.2018.04.22.08.16.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 22 Apr 2018 08:16:50 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Apr 2018 11:16:41 -0400
Message-Id: <1524410201-30531-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pexpect: update to version 4.5.0
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
X-List-Received-Date: Sun, 22 Apr 2018 15:16:50 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pexpect.inc                | 4 ++--
 .../python/{python-pexpect_4.4.0.bb => python-pexpect_4.5.0.bb}       | 0
 .../python/{python3-pexpect_4.4.0.bb => python3-pexpect_4.5.0.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pexpect_4.4.0.bb => python-pexpect_4.5.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pexpect_4.4.0.bb => python3-pexpect_4.5.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pexpect.inc b/meta-python/recipes-devtools/python/python-pexpect.inc
index d1fac54..fa8ad01 100644
--- a/meta-python/recipes-devtools/python/python-pexpect.inc
+++ b/meta-python/recipes-devtools/python/python-pexpect.inc
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1c7a725251880af8c6a148181665385b"
 
-SRC_URI[md5sum] = "e9b07f0765df8245ac72201d757baaef"
-SRC_URI[sha256sum] = "67b85a1565968e3d5b5e7c9283caddc90c3947a2625bed1905be27bd5a03e47d"
+SRC_URI[md5sum] = "913fc0a68a915cdf6ad4250493c94cf7"
+SRC_URI[sha256sum] = "9f8eb3277716a01faafaba553d629d3d60a1a624c7cf45daa600d2148c30020c"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/pexpect"
 
diff --git a/meta-python/recipes-devtools/python/python-pexpect_4.4.0.bb b/meta-python/recipes-devtools/python/python-pexpect_4.5.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pexpect_4.4.0.bb
rename to meta-python/recipes-devtools/python/python-pexpect_4.5.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-pexpect_4.4.0.bb b/meta-python/recipes-devtools/python/python3-pexpect_4.5.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pexpect_4.4.0.bb
rename to meta-python/recipes-devtools/python/python3-pexpect_4.5.0.bb
-- 
2.7.4


