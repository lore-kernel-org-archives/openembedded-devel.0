Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id F2F90787E4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jan 2018 19:39:39 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id b76so392322qkc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jan 2018 11:39:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8b0ZKzBuoxDn9UM3ssqiaF/D9BN2AQf3NkELi71Io9E=;
	b=M6PQ8O6BRjNGnaNbxsjEWXNY3T7u78gtWvI62/dfz38cFWAmMcWG2vwZE+4oxBPNiy
	QXC1tJoXaG5eVXzR3G+dR3Et3Kf3URgeSSPOOMwYMeWR5olS96/Ly4rhm8kKgN4k12Ei
	hlK/awEL1v2CBzGpujQ0vDjk+9TDOGdE/b1B6h0/f6AnOWudfV7FhVlLVW+PTuuqpRMP
	bvkN+dKNqxz3I0Xw+skHlCJxpsMqPOXowhpC+OLpAE1HMaSSlJWygGhKW4W5NQL4W0kZ
	mZOZRt/GJJyDltJmK85JbB5yzaEJPuxPhCoOTUAERzLFfZ7v7fR1+BPkAxrOfcYYvZ+M
	GEaw==
X-Gm-Message-State: AKwxytf4VVl7CUNsUoQhtXXi8rK8TT+p0Lxl9AotEcFvoXwooo5GNJFU
	nRo4kXWznwh4IySPe/MOyEkONhhE
X-Google-Smtp-Source: ACJfBouaq4sd4E/8Pv00CoFM4vELEv6QBhp16vO6Nbc/44sbiABTq/Aa0vAXbA3VR2W6cWfmPhhryA==
X-Received: by 10.55.123.69 with SMTP id w66mr25885087qkc.94.1515613180624;
	Wed, 10 Jan 2018 11:39:40 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	l52sm11079752qtc.43.2018.01.10.11.39.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Jan 2018 11:39:39 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Jan 2018 14:39:31 -0500
Message-Id: <1515613171-9368-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-unidiff: update to version 0.5.5
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
X-List-Received-Date: Wed, 10 Jan 2018 19:39:40 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-unidiff.inc           | 9 +++++++--
 .../python/{python-unidiff_0.5.4.bb => python-unidiff_0.5.5.bb}  | 0
 .../{python3-unidiff_0.5.4.bb => python3-unidiff_0.5.5.bb}       | 0
 3 files changed, 7 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-unidiff_0.5.4.bb => python-unidiff_0.5.5.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-unidiff_0.5.4.bb => python3-unidiff_0.5.5.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-unidiff.inc b/meta-python/recipes-devtools/python/python-unidiff.inc
index 0402550..fc12062 100644
--- a/meta-python/recipes-devtools/python/python-unidiff.inc
+++ b/meta-python/recipes-devtools/python/python-unidiff.inc
@@ -3,7 +3,12 @@ HOMEPAGE = "http://github.com/matiasb/python-unidiff"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4c434b08ef42fea235bb019b5e5a97b3"
 
-SRC_URI[md5sum] = "c8099edf89d2e3bac16123766625a38b"
-SRC_URI[sha256sum] = "a7baf71846a68c5305a7d6005dfb5eca8798f13861176355a285cbda3206824d"
+SRC_URI[md5sum] = "47f669d7273541fec45e4cc0fba8d8e9"
+SRC_URI[sha256sum] = "9c9ab5fb96b6988b4cd5def6b275492442c04a570900d33aa6373105780025bc"
 
 inherit pypi
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-codecs \
+    ${PYTHON_PN}-io \
+"
diff --git a/meta-python/recipes-devtools/python/python-unidiff_0.5.4.bb b/meta-python/recipes-devtools/python/python-unidiff_0.5.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-unidiff_0.5.4.bb
rename to meta-python/recipes-devtools/python/python-unidiff_0.5.5.bb
diff --git a/meta-python/recipes-devtools/python/python3-unidiff_0.5.4.bb b/meta-python/recipes-devtools/python/python3-unidiff_0.5.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-unidiff_0.5.4.bb
rename to meta-python/recipes-devtools/python/python3-unidiff_0.5.5.bb
-- 
2.7.4


