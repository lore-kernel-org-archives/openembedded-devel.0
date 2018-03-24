Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9AE4478744
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Mar 2018 14:18:25 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id j73so15838472qke.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Mar 2018 07:18:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=F6iuFUITzH1GAEYeFvgk2NP/bxrQF4/UmMTpornIRHY=;
	b=Dwngm8hmRaxOaxztjlvI5SjXotsVu42bN6z43iGafcgiUE0VmCoyrZrnbYJX8JrHro
	zB0GJjYTg7OsZnUVdDrrJWnKrUkdp/D7+/0nCgFJGkCD1MaixKqO3KOf3KMrFgWt7DFp
	TV/MClgjf2AU+eh5bRHdzwvvHlVWVbmMeaZt0xzgo6SlbZpOUELfnMgQdKPL7m/eQGiv
	LclZAIybz1haAuu4ASyx3JcNZb391anvm28zKZZfPsFEX6D28x8Ix8M675or6b4ICCMt
	nbtVx+Ld4acLu9wMapXAvp6xm21un9W5q5ywN5cGbyf1Po8NimFzSMMI3tCEMwXNBRe+
	mPGw==
X-Gm-Message-State: AElRT7Hqd91KDle/mDwXJ0XodxRyCJXTydOt570I4R3DhHNxh6UEgId9
	OPJ/FotCcr0uD/M8ETi5GNj4Kl/L
X-Google-Smtp-Source: AG47ELuWVP47waG/QIA7Ih+ONR6a9Qot11DX8kDPhopU8/pY8Hr5BWu7pmD7A3zKzk6f8mxOjTeM+w==
X-Received: by 10.55.52.7 with SMTP id b7mr43456616qka.332.1521901104878;
	Sat, 24 Mar 2018 07:18:24 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id 61sm8067155qtc.49.2018.03.24.07.18.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 24 Mar 2018 07:18:23 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 24 Mar 2018 10:18:12 -0400
Message-Id: <1521901093-23282-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH 1/2] python-cryptography-vectors: update to version 2.2.1
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
X-List-Received-Date: Sat, 24 Mar 2018 14:18:25 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cryptography-vectors.inc   | 4 ++--
 ...tography-vectors_2.1.4.bb => python-cryptography-vectors_2.2.1.bb} | 0
 ...ography-vectors_2.1.4.bb => python3-cryptography-vectors_2.2.1.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cryptography-vectors_2.1.4.bb => python-cryptography-vectors_2.2.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_2.1.4.bb => python3-cryptography-vectors_2.2.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
index 00bb87b..ef1c60b 100644
--- a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
@@ -8,8 +8,8 @@ DEPENDS += " \
     ${PYTHON_PN}-cryptography \
 "
 
-SRC_URI[md5sum] = "ef115b870cc8d8b9f0f4189b512bc170"
-SRC_URI[sha256sum] = "78c4b4f3f84853ea5d038e2f53d355229dd8119fe9cf949c3e497c85c760a5ca"
+SRC_URI[md5sum] = "b014b0ddfecddfa90eb2651120a31b70"
+SRC_URI[sha256sum] = "be7cf2e4de057f2a5307d9600177014daefd58a96de9cb9f437c26753fd462fe"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors_2.1.4.bb b/meta-python/recipes-devtools/python/python-cryptography-vectors_2.2.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cryptography-vectors_2.1.4.bb
rename to meta-python/recipes-devtools/python/python-cryptography-vectors_2.2.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.1.4.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.2.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_2.1.4.bb
rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_2.2.1.bb
-- 
2.7.4


