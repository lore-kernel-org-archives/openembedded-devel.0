Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id B41B671AC0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 19:14:00 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id n6so20796875qtd.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 11:14:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fZ+0kcyin2RlmGOWvjVBFwXLXVj4VHbg1MfyBYQoyHA=;
	b=XLrvkTK90EGnDdXX0MzCcluvzUtnpPLvjYJsapVCvVBpCsSkG3xlgdoIOZtDSAzhMj
	bn49dsRtjTZf5hxLZaI4xqv+ibePTQW5M0+nMPSGSAcLy566/x3hevdWCAI52aogeHfD
	0PV/YbDam/LV/zxbEHePYrBA+1wSXWaBaRdmljhbW8MaYj5U0uNO1CwjCWffhZsbLI4i
	hHSuFUyOAx9aVwwVMQkPsSISnRNzuoaX46NkRu1R26/eGEVfnKknl8PXTrwbD6YCNizW
	ZNGvjHIjdNzFZXSgc0noVc+G6ncmCUy30zDvQiQzKm/lis7OWYl5xOnqBP3J1R3HoMQ4
	0pSQ==
X-Gm-Message-State: AKaTC00VW629kH715G94f4HmGmtYtCtDlW5HY3rFuy3KfLMyxUXRTeF+KkGg9wNlgC0J9Q==
X-Received: by 10.200.55.179 with SMTP id d48mr32696450qtc.181.1480533242286; 
	Wed, 30 Nov 2016 11:14:02 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	x127sm18157878qkd.37.2016.11.30.11.14.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Nov 2016 11:14:01 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2016 14:13:54 -0500
Message-Id: <1480533235-27786-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH 1/2] python-cryptography-vectors: update to version 1.6
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
X-List-Received-Date: Wed, 30 Nov 2016 19:14:02 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cryptography-vectors.inc   | 4 ++--
 ...cryptography-vectors_1.4.bb => python-cryptography-vectors_1.6.bb} | 0
 ...ryptography-vectors_1.4.bb => python3-cryptography-vectors_1.6.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cryptography-vectors_1.4.bb => python-cryptography-vectors_1.6.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_1.4.bb => python3-cryptography-vectors_1.6.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
index 62dfbfd..6af37ed 100644
--- a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
@@ -7,8 +7,8 @@ DEPENDS = " \
     ${PYTHON_PN}-cryptography \
 "
 
-SRC_URI[md5sum] = "b8555dfadafc4ecab4ee4650430d9cab"
-SRC_URI[sha256sum] = "0728815ef0c53d67fd437aa5220450a9752d41ecb28108f5df628a092ff466ea"
+SRC_URI[md5sum] = "d7d53f061366394267be444fa84cfe89"
+SRC_URI[sha256sum] = "01ccb07c95d128a70732f274bd16af479bcc344e43cac745d2b9ec4ab71ff675"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors_1.4.bb b/meta-python/recipes-devtools/python/python-cryptography-vectors_1.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cryptography-vectors_1.4.bb
rename to meta-python/recipes-devtools/python/python-cryptography-vectors_1.6.bb
diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_1.4.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_1.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_1.4.bb
rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_1.6.bb
-- 
2.7.4


