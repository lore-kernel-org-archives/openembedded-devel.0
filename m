Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 88599719A7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 22:06:09 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id n186so6197943qkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 14:06:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vPGchL3twbGG0b8MJOH1+ccIpi53HfLsRXZeu+DorR8=;
	b=fH2kW2GrZZBOwx4LMQt5kRwd5EOC+KZJBXKMb7otfz2lPRuz52Em73HQ+0T/HrohCh
	/nsTFIBEtfQQjCVkfy1Fqg1QUGwOPMv5UltOIUsEwqmYrRSJYruCLd/QRkPMZBTUJaqA
	B7Yq6CboGcyqM3KU/uFheJ6lrxQ6I3ShetnccFhaSmWeeoMlNThARk5KmVBtGHk8Nqxq
	ulPrgtzhp6bX+7hBNSJnBTQ1yCc/3KwkkjHYBK76qNhmtCMHu/4R/uJJFKE9GmcxMUt/
	kallbS8gZwOMBjYklFk9TiE0KNAQ+sIzOB3w2xbfgSu8rKB7qDiG++uQRHzkEqo7Qp+0
	4NHg==
X-Gm-Message-State: AMke39mMLa8TPA/bBLnO/+44EEngFBcEi3ftu6UxVbMfGOVLuUDDKiiT2PAj1e1chp+UNQ==
X-Received: by 10.200.49.232 with SMTP id i37mr5549672qte.241.1488319570301;
	Tue, 28 Feb 2017 14:06:10 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	b36sm1863335qte.21.2017.02.28.14.06.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Feb 2017 14:06:09 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Feb 2017 17:06:03 -0500
Message-Id: <1488319563-7935-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyasn1: update to version 2.2.3
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
X-List-Received-Date: Tue, 28 Feb 2017 22:06:09 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pyasn1.inc              | 7 +++++--
 .../python/{python-pyasn1_0.2.2.bb => python-pyasn1_0.2.3.bb}      | 0
 .../python/{python3-pyasn1_0.2.2.bb => python3-pyasn1_0.2.3.bb}    | 0
 3 files changed, 5 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyasn1_0.2.2.bb => python-pyasn1_0.2.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyasn1_0.2.2.bb => python3-pyasn1_0.2.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyasn1.inc b/meta-python/recipes-devtools/python/python-pyasn1.inc
index e740305..4eb2d9b 100644
--- a/meta-python/recipes-devtools/python/python-pyasn1.inc
+++ b/meta-python/recipes-devtools/python/python-pyasn1.inc
@@ -3,11 +3,14 @@ HOMEPAGE = "http://pyasn1.sourceforge.net/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=280606d9c18f200e03e0c247ac61475a"
 
-SRC_URI[md5sum] = "800d0114db2084f7256586dadf37d1aa"
-SRC_URI[sha256sum] = "6b42f96b942406712e0be5ea2bbbc57d8f30c7835a4904c9c195cc669736d435"
+SRC_URI[md5sum] = "79f98135071c8dd5c37b6c923c51be45"
+SRC_URI[sha256sum] = "738c4ebd88a718e700ee35c8d129acce2286542daa80a82823a7073644f706ad"
 
 RDEPENDS_${PN}_class-target += " \
+    ${PYTHON_PN}-codecs \
     ${PYTHON_PN}-lang \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-math \
     ${PYTHON_PN}-shell \
 "
 
diff --git a/meta-python/recipes-devtools/python/python-pyasn1_0.2.2.bb b/meta-python/recipes-devtools/python/python-pyasn1_0.2.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyasn1_0.2.2.bb
rename to meta-python/recipes-devtools/python/python-pyasn1_0.2.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyasn1_0.2.2.bb b/meta-python/recipes-devtools/python/python3-pyasn1_0.2.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyasn1_0.2.2.bb
rename to meta-python/recipes-devtools/python/python3-pyasn1_0.2.3.bb
-- 
2.7.4


