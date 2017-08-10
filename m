Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id B994677EAA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 01:45:38 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id u19so7507715qtc.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Aug 2017 18:45:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xAhxfz6XhhZC0+6tQkHdJuup2hgmPBd1rlHDL/xMZv8=;
	b=orwT4ANKTfBp2ykBWiRWnbMPTgV8m3bU/l8wSNPJ+/jpgzuEPSoKfIAlTqEfwXHg+7
	AXAeeuya7pkYROrRSK6VJNgD0HjxvlUX4kE3F3oKZ04hsOzK2o/URoZ+KW9eL5jZ86nM
	lxPwefk9Gr+rV6LDKe3U7DIC1S20LWCbLOaEY7qTwh/mdsc3crKc4bYhpiHNof9MKuWw
	F5AGFPdJEvum1PZR616uGqsc8iUHf2WXv4VWEw+c4ImWjSTpiVwim9Q9eczM8m13akgP
	4T2MlFRoz9HkO7nvnPPR8oQBm4X+iJIxS6Y2rBOKDbeoAVchJV8tFKYM/cx6rCerZaYq
	Zhag==
X-Gm-Message-State: AHYfb5joXFNYkCm+9261KqhJgUZhjEfbN9dIR6pQYbcOuk9DE+uN7EXU
	bJ/JiawHgLeSIQKrDvg=
X-Received: by 10.200.38.155 with SMTP id 27mr14162643qto.228.1502329539662;
	Wed, 09 Aug 2017 18:45:39 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	r23sm3109728qtc.50.2017.08.09.18.45.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Aug 2017 18:45:39 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Aug 2017 21:45:32 -0400
Message-Id: <1502329532-17957-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-prompt-toolkit: update to version 1.0.15
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
X-List-Received-Date: Thu, 10 Aug 2017 01:45:39 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-prompt-toolkit.inc         | 4 ++--
 ...ython-prompt-toolkit_1.0.14.bb => python-prompt-toolkit_1.0.15.bb} | 0
 ...hon3-prompt-toolkit_1.0.14.bb => python3-prompt-toolkit_1.0.15.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-prompt-toolkit_1.0.14.bb => python-prompt-toolkit_1.0.15.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_1.0.14.bb => python3-prompt-toolkit_1.0.15.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-prompt-toolkit.inc b/meta-python/recipes-devtools/python/python-prompt-toolkit.inc
index b5bb0c5..f5ed349 100644
--- a/meta-python/recipes-devtools/python/python-prompt-toolkit.inc
+++ b/meta-python/recipes-devtools/python/python-prompt-toolkit.inc
@@ -2,8 +2,8 @@ SUMMARY = "Library for building powerful interactive command lines in Python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
 
-SRC_URI[md5sum] = "f24061ae133ed32c6b764e92bd48c496"
-SRC_URI[sha256sum] = "cc66413b1b4b17021675d9f2d15d57e640b06ddfd99bb724c73484126d22622f"
+SRC_URI[md5sum] = "8fe70295006dbc8afedd43e5eba99032"
+SRC_URI[sha256sum] = "858588f1983ca497f1cf4ffde01d978a3ea02b01c8a26a8bbc5cd2e66d816917"
 
 PYPI_PACKAGE = "prompt_toolkit"
 
diff --git a/meta-python/recipes-devtools/python/python-prompt-toolkit_1.0.14.bb b/meta-python/recipes-devtools/python/python-prompt-toolkit_1.0.15.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-prompt-toolkit_1.0.14.bb
rename to meta-python/recipes-devtools/python/python-prompt-toolkit_1.0.15.bb
diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_1.0.14.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_1.0.15.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_1.0.14.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_1.0.15.bb
-- 
2.7.4


