Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id BBC7572FCC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 00:03:44 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id b16so2496151qte.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 16:03:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YdyMWeNK630/pofYHC+PSC0aDl9J9kiZlyJuiq2gp8U=;
	b=dK140yEKD+3QCXs73mRDA/A7QZeVy8JgB+3Pnw6L5nDb7KfwefvG3pUNgv8kuGOOOV
	CXJCaYziJXka+q0Ksm5vHtzyvh6tjRopTeq8TCTGRNY1nKRwFUcxHMeJxlqEvnU7gUrM
	9eJoGOrc7qTR0JJdoMb7NcpBZvNSBKQCZh97Z6Te+ZzYtHENlSC0wpcK2lEP8NwcdSXI
	eN0ZqnOB0sQl9p+20TphJk93kTxFk6v1LO5LPwbjQuMnAn6QFkENesPv0dsz7Q8aqu0w
	gL+Lo+2LQ40x424FXnrJMR73l0mdQvTTgjG2YygMdbP1Ax9LYmEurkyNzog7JVR5x61t
	VNmQ==
X-Gm-Message-State: AMke39ktl4UA5+sj8n7aEd1QQXYEyvoJf+x00+DeKmaxo4hdM32X7zcjFuY08Q7ozSvTcw==
X-Received: by 10.200.44.236 with SMTP id 41mr31860671qtx.267.1487808226272;
	Wed, 22 Feb 2017 16:03:46 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224])
	by smtp.gmail.com with ESMTPSA id h40sm1710485qtb.6.2017.02.22.16.03.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Feb 2017 16:03:45 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2017 19:03:37 -0500
Message-Id: <1487808217-25449-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-greenlet: update to version 0.4.12
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
X-List-Received-Date: Thu, 23 Feb 2017 00:03:46 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-greenlet_0.4.11.bb => python-greenlet_0.4.12.bb}  | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-greenlet_0.4.11.bb => python-greenlet_0.4.12.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python-greenlet_0.4.11.bb b/meta-python/recipes-devtools/python/python-greenlet_0.4.12.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python-greenlet_0.4.11.bb
rename to meta-python/recipes-devtools/python/python-greenlet_0.4.12.bb
index ca4786f..4fc2c1d 100644
--- a/meta-python/recipes-devtools/python/python-greenlet_0.4.11.bb
+++ b/meta-python/recipes-devtools/python/python-greenlet_0.4.12.bb
@@ -3,9 +3,8 @@ LICENSE = "MIT & PSF"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI[md5sum] = "774808f543e130621700863bc20a21fe"
-SRC_URI[sha256sum] = "e46510543912135b2663c2fc4e2867497579466d82184710b84fb718b31cc95d"
+SRC_URI[md5sum] = "e8637647d58a26c4a1f51ca393e53c00"
+SRC_URI[sha256sum] = "e4c99c6010a5d153d481fdaf63b8a0782825c0721506d880403a3b9b82ae347e"
 
-PYPI_PACKAGE_EXT = "zip"
 inherit pypi distutils
 
-- 
2.7.4


