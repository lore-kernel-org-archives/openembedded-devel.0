Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 23F7F77FDE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jan 2018 18:46:12 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id z12so11429289qkf.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jan 2018 10:46:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TS/cS0WIxUt0C1ugLBzkJVLme+HgXf4CQCA1cwtYdio=;
	b=k2JPjAE0Z+djZKteQj4vPBrwroGR5Ke64Ljqv9mDPbt9/cDG6nIHn1nbLV4b/QkDWg
	I85mHjzghS8+ocisyAzjhJNfor94or1kKARdK+G4HOOVAWplRCUeJ+q4ilwDONgnnANF
	XDLZ8Av5Ynkyxc6aef8gqr/HCcEh4E8sH7Fv8oK1JIkHa+78rnQaW7FFlIUTP7LlFiu3
	evl9IwBVGvoXhTQGeWslrK0ynzns/IWtIo13ccUqDbFa8Xji2t+jTFM8yGBkwHPV/LKk
	onTVNTBo5jcNjgtQJRSfdRqCmdOymvU9gIMJVSZ6QoS5mhyl4SU5GML1X3/l10+eM1uV
	+jUQ==
X-Gm-Message-State: AKwxytctQmAicrEYVf8kUi2Azezj5dteMzrtbVA/kGqkv3OyuTJCfxj1
	tvXu3Va0leAd6hsMTQuM2qZNbXkg
X-Google-Smtp-Source: AH8x225nisjIm1441NrqwUYeyOXF02pKwXo4VjShjs9XV0CgNsw6QONQOg7Ow+BztYv+CK02gPr/kg==
X-Received: by 10.55.99.143 with SMTP id x137mr41823743qkb.90.1517337973565;
	Tue, 30 Jan 2018 10:46:13 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id 68sm9450594qke.80.2018.01.30.10.46.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 30 Jan 2018 10:46:13 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Jan 2018 13:45:59 -0500
Message-Id: <1517337959-11060-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pycryptodome: update to version 3.4.8
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
X-List-Received-Date: Tue, 30 Jan 2018 18:46:13 -0000

Update the license checksum for latest version and
verify the terms remain the same

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pycryptodome.inc         | 6 +++---
 .../{python-pycryptodome_3.4.7.bb => python-pycryptodome_3.4.8.bb}  | 0
 ...{python3-pycryptodome_3.4.7.bb => python3-pycryptodome_3.4.8.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pycryptodome_3.4.7.bb => python-pycryptodome_3.4.8.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pycryptodome_3.4.7.bb => python3-pycryptodome_3.4.8.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pycryptodome.inc b/meta-python/recipes-devtools/python/python-pycryptodome.inc
index ecfcc9d..1efe1eb 100644
--- a/meta-python/recipes-devtools/python/python-pycryptodome.inc
+++ b/meta-python/recipes-devtools/python/python-pycryptodome.inc
@@ -3,10 +3,10 @@ DESCRIPTION = "PyCryptodome is a self-contained Python package of low-level\
  cryptographic primitives."
 HOMEPAGE = "http://www.pycryptodome.org"
 LICENSE = "PD & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=690cd8c71f0367a558f24fe53d943a2e"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=775fe77831c03bf82f35abc0e230d4c1"
 
-SRC_URI[md5sum] = "8744863c7d5980ae3f81c2e288701a61"
-SRC_URI[sha256sum] = "18d8dfe31bf0cb53d58694903e526be68f3cf48e6e3c6dfbbc1e7042b1693af7"
+SRC_URI[md5sum] = "030c40da6377bbc82deef8e884fa22cd"
+SRC_URI[sha256sum] = "ede7f1f44b0895feb8ddbf882d1a7eb504deb3fa34fcc4860d6065c25cbdf175"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-pycryptodome_3.4.7.bb b/meta-python/recipes-devtools/python/python-pycryptodome_3.4.8.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pycryptodome_3.4.7.bb
rename to meta-python/recipes-devtools/python/python-pycryptodome_3.4.8.bb
diff --git a/meta-python/recipes-devtools/python/python3-pycryptodome_3.4.7.bb b/meta-python/recipes-devtools/python/python3-pycryptodome_3.4.8.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pycryptodome_3.4.7.bb
rename to meta-python/recipes-devtools/python/python3-pycryptodome_3.4.8.bb
-- 
2.7.4


