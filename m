Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7AAD077D16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 18:31:09 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id w10so5562121qtb.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 10:31:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wp/CYmCJTGk2VrrBTI2vW6AihK+7TYpBpwP3eOBL5cg=;
	b=IVN/ysXtaL2k9am/S1QQL/bnrbuG4CqgqLo72Zoi4zjVjqH+thBcukGF97Mu2UE9P8
	6nZ9TumV/8/VhxE/ma/Ecl6QEGS1GNgHn+WAIpU3ldOUtT0XcczffID+igVepZBd4ikE
	YmjyGhsCbOSRL8jlldo3hJK8QSzc8BiuouJ/xDEueVpY7eN9A8CWAp+xNd6BKwk7T8jC
	sh4ItBLvpFLgjeX1D/fg7eKV7ucvqd0ViIlVsjIBdQ5wheEr5nlosxFs9N/YJf7dNgoD
	nK+r5afNXLyIsUvEv7OOLPeRbJycpQP2A7VIUd2hR1lUQURo5EAy3J8amuMWP9j7S6xo
	HfQw==
X-Gm-Message-State: AJaThX6319kEDOfZrnXvt6cBzqjcykL1QuCLTlJ/GqzjuVuKk5ybIvD1
	ELg5c1cZv0qF9/n5kfpQAHKJnRYW
X-Google-Smtp-Source: AGs4zMaRg5vS8g3Y4N8i/kNOYHDJbiK1tbxaI0+DR82TRUTjAA/A+T8KBIg/ktYmUEQS7kDoUXbsxQ==
X-Received: by 10.200.48.68 with SMTP id g4mr5880367qte.313.1511980270189;
	Wed, 29 Nov 2017 10:31:10 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	n94sm1723663qkh.50.2017.11.29.10.31.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Nov 2017 10:31:09 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Nov 2017 13:31:04 -0500
Message-Id: <1511980264-21640-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python3-langtable: update RDEPENDS to work on minimal python install
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
X-List-Received-Date: Wed, 29 Nov 2017 18:31:09 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python3-langtable_0.0.37.bb        | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-langtable_0.0.37.bb b/meta-python/recipes-devtools/python/python3-langtable_0.0.37.bb
index 362ca1a..4a3b2a9 100644
--- a/meta-python/recipes-devtools/python/python3-langtable_0.0.37.bb
+++ b/meta-python/recipes-devtools/python/python3-langtable_0.0.37.bb
@@ -20,3 +20,13 @@ DISTUTILS_INSTALL_ARGS = "--prefix=${D}/${prefix} \
     --install-data=${D}/${datadir}/langtable"
 
 FILES_${PN} += "${datadir}/*"
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-argparse \
+    ${PYTHON_PN}-compression \
+    ${PYTHON_PN}-doctest \
+    ${PYTHON_PN}-enum \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-signal \
+    ${PYTHON_PN}-xml \
+"
-- 
2.7.4


