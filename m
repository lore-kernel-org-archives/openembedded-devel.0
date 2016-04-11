Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f68.google.com (mail-qg0-f68.google.com
	[209.85.192.68])
	by mail.openembedded.org (Postfix) with ESMTP id BB22160111
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2016 11:42:16 +0000 (UTC)
Received: by mail-qg0-f68.google.com with SMTP id f105so15946122qge.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2016 04:42:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=s2tpm8tb1EIIoXtKqq3Y+GCTjKL+jFdnjqb2LoUKFsE=;
	b=BPxKqlfnyCG+q4Su3JAykrzAxp/Oh+jDSWPS3FbTmpyAfFQKpJYZVw18JhCnVeHHBW
	w+l/imThybQBiwZfEjMG3wHegzxnqSmH6OCDn1agYZwdlPLxKHnSYAbvkPJ4+CtNNurz
	5nByMF8oINyAX9tr4kx+uQ8aZwh069oeYp7SQJ2E4Aa2F89yqXer+Ry23tBT9G0INfFj
	Z/LcEJMDowYxfghIjrG5kHexMIdWDZKvDP4EygqB1A9FvwzW/Cxm6WLwN4ab1l6e+tzG
	CSJFruf1tch+2XovOW1DH9HuLGwC/GQaTwbCeQSqivk3DsaAsqPh87YV5Owr0slCpOSy
	qqyA==
X-Gm-Message-State: AD7BkJLtyh9FrKMgzy0hJMFvyWBQQvjQw/G31v37eJvY/YBrBGO/Jk1LCxkTrm8zN7amDw==
X-Received: by 10.140.141.6 with SMTP id 6mr29397697qhn.82.1460374937166;
	Mon, 11 Apr 2016 04:42:17 -0700 (PDT)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id x63sm5902816qhe.5.2016.04.11.04.42.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Apr 2016 04:42:16 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Apr 2016 07:41:36 -0400
Message-Id: <1460374897-30992-3-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1460374897-30992-1-git-send-email-derek@asterius.io>
References: <1460374897-30992-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 3/4] python-decorator: update to 4.0.9
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
X-List-Received-Date: Mon, 11 Apr 2016 11:42:16 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-decorator.inc              | 4 ++--
 .../python/{python-decorator_4.0.2.bb => python-decorator_4.0.9.bb}   | 0
 .../python/{python3-decorator_4.0.2.bb => python3-decorator_4.0.9.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-decorator_4.0.2.bb => python-decorator_4.0.9.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-decorator_4.0.2.bb => python3-decorator_4.0.9.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-decorator.inc b/meta-python/recipes-devtools/python/python-decorator.inc
index a599fd8..5710012 100644
--- a/meta-python/recipes-devtools/python/python-decorator.inc
+++ b/meta-python/recipes-devtools/python/python-decorator.inc
@@ -9,7 +9,7 @@ decorator, just because you can."
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=41e24e0e235a97e60cdb5c4137fa2cd0"
 
-SRC_URI[md5sum] = "033c9563af492c4ce2680ee6ca481fa7"
-SRC_URI[sha256sum] = "1a089279d5de2471c47624d4463f2e5b3fc6a2cf65045c39bf714fc461a25206"
+SRC_URI[md5sum] = "f12c5651ccd707e12a0abaa4f76cd69a"
+SRC_URI[sha256sum] = "90022e83316363788a55352fe39cfbed357aa3a71d90e5f2803a35471de4bba8"
 
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-decorator_4.0.2.bb b/meta-python/recipes-devtools/python/python-decorator_4.0.9.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-decorator_4.0.2.bb
rename to meta-python/recipes-devtools/python/python-decorator_4.0.9.bb
diff --git a/meta-python/recipes-devtools/python/python3-decorator_4.0.2.bb b/meta-python/recipes-devtools/python/python3-decorator_4.0.9.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-decorator_4.0.2.bb
rename to meta-python/recipes-devtools/python/python3-decorator_4.0.9.bb
-- 
1.9.1


