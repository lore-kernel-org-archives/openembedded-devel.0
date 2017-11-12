Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id A671778594
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Nov 2017 18:02:38 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id l69so10682381qkl.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Nov 2017 10:02:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NMz2NFi2en5SvweoItnRXNmIKMbtGazWiqOD2PXCyjY=;
	b=fHwMgzyVT+TbJWUdM1ikJHUuOJVZe81muQeXnaZ+BXPLbmXe28WvojllBVUp6i0cc+
	gR/i72ud5xupjEPR/DeOJ+bWG9kquLUJnNY+rUynQXevKPjaLb9WST3jesIq0WtgQmnG
	mTitzX/ZVmGpJYl+MZVMKjegN+oMUEcrj7zzpJog3YWrZfnkcar5xiIDwPcd6UDfqJpL
	387dHX6cPpVZI5gfo37xI47EXWWRO7IZI9e8s6+nKqqAwhXpqu/C0rfE/xrzVfMtU67/
	FAKna1jwW94jfNXQvToppSdG/J5EYBGL/NS2NBIdOLD70cG37Ta+u1jXSDbLHfXLwWBr
	8zKA==
X-Gm-Message-State: AJaThX7wx09bqt81PgooMPIi+8ykMcxntDtho/okzgQytQ6TfAf8jcAw
	YoiI9VjMYPrVgwQiSM7bqa5j7uz7
X-Google-Smtp-Source: AGs4zMbPSBCJ/Tewlh9RF2KOhNfk0XE7HXDuYzWkRwTwz2vtHBvXAptgthKLF4g0O8q0XmXENeuh2w==
X-Received: by 10.55.116.197 with SMTP id p188mr10206977qkc.125.1510509759412; 
	Sun, 12 Nov 2017 10:02:39 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id 6sm9770019qtz.68.2017.11.12.10.02.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 12 Nov 2017 10:02:39 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Nov 2017 13:02:32 -0500
Message-Id: <1510509752-23427-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510509752-23427-1-git-send-email-derek@asterius.io>
References: <1510509752-23427-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 2/2] python-cryptography-vectors: update to version 2.1.3
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
X-List-Received-Date: Sun, 12 Nov 2017 18:02:38 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cryptography-vectors.inc   | 4 ++--
 ...tography-vectors_2.1.2.bb => python-cryptography-vectors_2.1.3.bb} | 0
 ...ography-vectors_2.1.2.bb => python3-cryptography-vectors_2.1.3.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cryptography-vectors_2.1.2.bb => python-cryptography-vectors_2.1.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_2.1.2.bb => python3-cryptography-vectors_2.1.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
index 66b689e..922ef5a 100644
--- a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
@@ -8,8 +8,8 @@ DEPENDS += " \
     ${PYTHON_PN}-cryptography \
 "
 
-SRC_URI[md5sum] = "54d482b0783fcda5fdd261dc0f1f84a4"
-SRC_URI[sha256sum] = "1d3829bdb7b7822cee85a829fe2e0d2455d69e242186705ef1a9d4d1ab6337df"
+SRC_URI[md5sum] = "32e8bd5d5f6a9329a6753dabc8db1e5b"
+SRC_URI[sha256sum] = "2de4957fdfd567d69e179d6e9ecf54a085387c953e20abf97a35a5c313aa3053"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors_2.1.2.bb b/meta-python/recipes-devtools/python/python-cryptography-vectors_2.1.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cryptography-vectors_2.1.2.bb
rename to meta-python/recipes-devtools/python/python-cryptography-vectors_2.1.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.1.2.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.1.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_2.1.2.bb
rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_2.1.3.bb
-- 
2.7.4


