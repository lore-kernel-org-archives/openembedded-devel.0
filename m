Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id E7448784F8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 18:59:54 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id w1so12289108qtg.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 11:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eGSf43AtyE3AN4+BrYiYh485rg9dSwi2j9J1rQh13+E=;
	b=nsX3zDCQO9Vc1ibjX8DTdwy3GR5iJgfmcWdT9Ju9li1xaq2yoyri9+T9YlsYCVORfE
	XLwUAA3TgDXfF9ipVYQuQgmLN5Ir7gzjsHTeBljI87DMsCAL+WaqZFFEHym9wIcUXR1M
	pE5igXbasjZ1jxjsRz+qSjGTJ4ijyPL3rxztHSLFTznX1QWrRBg7xSZQGBNJsbS59USz
	FMaV189RoQvNgYEzdyCukkkd6uxkrHZyyIwBGhDBUMPSe+6mV/ZoO5a+NR/jZTLWpFTt
	QxK6s6u0fjCKpAXZosaHefIntWruQ4FSLo7jYf/57yi4GZNSAG2xlYm9+bKGAissytuI
	bbtQ==
X-Gm-Message-State: AKS2vOzshaWpFBlrgSZRzysbuQsxjBRHcOZi1ENgYhWW1yWs16KgCgml
	AAjSs/0IpLth8ShMToY=
X-Received: by 10.200.51.15 with SMTP id t15mr14230957qta.38.1497639595882;
	Fri, 16 Jun 2017 11:59:55 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4]) by smtp.gmail.com with ESMTPSA id
	j65sm1956484qkf.38.2017.06.16.11.59.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Jun 2017 11:59:55 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jun 2017 14:59:50 -0400
Message-Id: <1497639591-30034-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH 1/2] python-cryptography-vectors: update to version 1.9
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
X-List-Received-Date: Fri, 16 Jun 2017 18:59:55 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cryptography-vectors.inc   | 4 ++--
 ...yptography-vectors_1.8.1.bb => python-cryptography-vectors_1.9.bb} | 0
 ...ptography-vectors_1.8.1.bb => python3-cryptography-vectors_1.9.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cryptography-vectors_1.8.1.bb => python-cryptography-vectors_1.9.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_1.8.1.bb => python3-cryptography-vectors_1.9.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
index 4481c1d..1aa7dfa 100644
--- a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
@@ -7,8 +7,8 @@ DEPENDS += " \
     ${PYTHON_PN}-cryptography \
 "
 
-SRC_URI[md5sum] = "e6ee71f1cc9950e3df026bef69e5fdcb"
-SRC_URI[sha256sum] = "2fd61facea08800ca98ac923f6d02f48a7ae6648025b29cdeb51987c1532add6"
+SRC_URI[md5sum] = "85630ca5c06573ef21ec0e7d6f9ba142"
+SRC_URI[sha256sum] = "bbf767727ad1b9d4cb684fb2b36db4cc78bd420fa6999e7e6ca1aab8c30d78f3"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors_1.8.1.bb b/meta-python/recipes-devtools/python/python-cryptography-vectors_1.9.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cryptography-vectors_1.8.1.bb
rename to meta-python/recipes-devtools/python/python-cryptography-vectors_1.9.bb
diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_1.8.1.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_1.9.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_1.8.1.bb
rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_1.9.bb
-- 
2.7.4


