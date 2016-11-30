Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id C1F3071ABB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 19:14:54 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id n204so220391690qke.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 11:14:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Zv87rNBwmTfK1WuNYQayQW81nbx00e47pw28u8YXhZk=;
	b=E/sIWeZbe/kmAYLH+bv/qC7liL0z0kbL3BqFMBbzwacJ6Qf14ds2+RJPMUszXXfxyd
	sE2gk9Xa89TOcCp828b71qb8ACdx8jFtV30zMYol1BlfOFTwdjVhM4NT3MA7CV0EgeAb
	tH4F6wo+dPEJMp+SxZKspbeeVGF85jzIIumZdcokmft+qh3EuA+FDH+YMSpfP+aNuFz9
	rUt0R0aTqJRLHr3c+VgYg3W5l4cgyhSfz30GztYfLqBoHFn8CPXcOC27o/T4Wf60FSXh
	DAzYjBWA2RIXuBV1pNk4FFb2MIAKeStR69VwxufkjxKN2+ylMgKYEGdau6S4J3x3UCqh
	VH6Q==
X-Gm-Message-State: AKaTC03JZ0Era+faEFmUZecoMwzv6zUiUWWbj/rH0RZvb1EWC0azklko0M/cN//MJQnzmg==
X-Received: by 10.55.17.68 with SMTP id b65mr29566466qkh.60.1480533295792;
	Wed, 30 Nov 2016 11:14:55 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	h43sm34117089qth.29.2016.11.30.11.14.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Nov 2016 11:14:55 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2016 14:14:48 -0500
Message-Id: <1480533288-27932-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyopenssl: update to version 16.2.0
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
X-List-Received-Date: Wed, 30 Nov 2016 19:14:54 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pyopenssl.inc            | 6 +++---
 .../{python-pyopenssl_16.1.0.bb => python-pyopenssl_16.2.0.bb}      | 0
 .../{python3-pyopenssl_16.1.0.bb => python3-pyopenssl_16.2.0.bb}    | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyopenssl_16.1.0.bb => python-pyopenssl_16.2.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyopenssl_16.1.0.bb => python3-pyopenssl_16.2.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyopenssl.inc b/meta-python/recipes-devtools/python/python-pyopenssl.inc
index 0ddad12..5a2e8b8 100644
--- a/meta-python/recipes-devtools/python/python-pyopenssl.inc
+++ b/meta-python/recipes-devtools/python/python-pyopenssl.inc
@@ -4,15 +4,15 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS = "openssl ${PYTHON_PN}-cryptography"
 
-SRC_URI[md5sum] = "d8100b0c333f0eeadaf05914da8792a6"
-SRC_URI[sha256sum] = "88f7ada2a71daf2c78a4f139b19d57551b4c8be01f53a1cb5c86c2f3bf01355f"
+SRC_URI[md5sum] = "6635503758c65ea6f70d18d1b18e46d5"
+SRC_URI[sha256sum] = "7779a3bbb74e79db234af6a08775568c6769b5821faecf6e2f4143edb227516e"
 
 PYPI_PACKAGE = "pyOpenSSL"
 
 PACKAGES =+ "${PN}-tests"
 FILES_${PN}-tests = "${libdir}/${PYTHON_DIR}/site-packages/OpenSSL/test"
 
-RDEPENDS_${PN} = " \
+RDEPENDS_${PN}_class-target = " \
     ${PYTHON_PN}-cryptography \
     ${PYTHON_PN}-six \
     ${PYTHON_PN}-threading \
diff --git a/meta-python/recipes-devtools/python/python-pyopenssl_16.1.0.bb b/meta-python/recipes-devtools/python/python-pyopenssl_16.2.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyopenssl_16.1.0.bb
rename to meta-python/recipes-devtools/python/python-pyopenssl_16.2.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyopenssl_16.1.0.bb b/meta-python/recipes-devtools/python/python3-pyopenssl_16.2.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyopenssl_16.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pyopenssl_16.2.0.bb
-- 
2.7.4


