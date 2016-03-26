Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f65.google.com (mail-qg0-f65.google.com
	[209.85.192.65])
	by mail.openembedded.org (Postfix) with ESMTP id 06B6B6FFD4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 13:05:13 +0000 (UTC)
Received: by mail-qg0-f65.google.com with SMTP id j35so4997483qge.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 06:05:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=v9VhBd6qESKwtomw8519f7RGDLArgEPbCnPx+vcg1rg=;
	b=T1EL0ns2BUPd2JOcYhQmiYtQbLrsnPvKb9XVudH0VNY7kcFWl0JcX4NfLUR/bIy6Xg
	fSjNibH0iR0itUFtNCJxGzmz9XnC4kR3Vupn2WtTz/37Peu0zFPJtBfFAobs3lSsRuuR
	8qNas6rjkp2a1zwRj6cuk/pi6CvCtjUGGOyMqDvD4wY2wDHzytbWWF/0aNBf4F4Tm0We
	hSvmw4xAO6KT9ZBPYX3ImuXVz5LhfILnd9WEGW7yeUigwxqKKowb7Eb6tyU+khx5XkKh
	ZVoSqPZ1DRWbjhFm87zZ6DG0t7Myfqze89fEi5Jt/s2wKls1Zcn63zZQ+OtK4Pi6iJIQ
	j1YA==
X-Gm-Message-State: AD7BkJJJ76JX6i8ZsUcdmdXVvPfT1xqCSfNyoiN5GHrUN4H0btEhTYJPZrqYCPFsm5RiFw==
X-Received: by 10.140.101.80 with SMTP id t74mr23341381qge.61.1458997513825;
	Sat, 26 Mar 2016 06:05:13 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id x6sm7678649qka.16.2016.03.26.06.05.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 26 Mar 2016 06:05:13 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Mar 2016 09:04:28 -0400
Message-Id: <52c4ef44ed4c57d721e4f60e1a7ff584618958f2.1458997082.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
Subject: [meta-python][PATCH 08/30] python-cffi: update to 1.5.2
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
X-List-Received-Date: Sat, 26 Mar 2016 13:05:13 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-cffi_1.3.1.bb => python-cffi_1.5.2.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cffi_1.3.1.bb => python-cffi_1.5.2.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python-cffi_1.3.1.bb b/meta-python/recipes-devtools/python/python-cffi_1.5.2.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python-cffi_1.3.1.bb
rename to meta-python/recipes-devtools/python/python-cffi_1.5.2.bb
index 867b292..8b25877 100644
--- a/meta-python/recipes-devtools/python/python-cffi_1.3.1.bb
+++ b/meta-python/recipes-devtools/python/python-cffi_1.5.2.bb
@@ -3,8 +3,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
 DEPENDS = "libffi python-pycparser"
 
-SRC_URI[md5sum] = "deeba7c1fd32a66f1db587988d760c11"
-SRC_URI[sha256sum] = "d45dd39a770b4afb591c82555f6a8bbc1ac7eb019eda9b621eee1a0a72201220"
+SRC_URI[md5sum] = "fa766133f7299464c8bf857e0c966a82"
+SRC_URI[sha256sum] = "da9bde99872e46f7bb5cff40a9b1cc08406765efafb583c704de108b6cb821dd"
 
 inherit pypi setuptools
 
-- 
1.9.1


