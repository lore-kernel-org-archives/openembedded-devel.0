Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 71BAC78875
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jan 2018 18:39:21 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id z12so11400287qkf.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jan 2018 10:39:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=T3sr4rtNWW3FJZtvxbxvOIcDi4Ry0f4pW9Iyz+OCE/k=;
	b=WQYwVNBwiLy0kZAVizQxn83M5XorsJ8U8BrmvJYysvqZIaDa3KCG0vuCoqn1+kExpU
	QcYV/PDIGjZSgfbub7dnXNd/Cpnc79R0i19NkhmAs6Hn0rGdbZA9PnkEmYfiuXCC7K9D
	z+Nk0ZUi9LyWUJAt23+tHE9EmcR39KVrykkfIMlS7fPPtaPaef77bTT2NZS1Q80LA58p
	0BLBd3+mYBVBphAt3Cm5ayngmU7A8fKW5P4mL4v6l3C+kXGso/jWvyxtw2ISCjKsX5HX
	mQeUhv5tYYdvTHffZhr07m4rkOVy6ibS4M8JW27XxmHE/stOtTotmF41OUeL9UmsdYA6
	H9dA==
X-Gm-Message-State: AKwxytdl5P0szYWknb4h09jfViyH0mRMx+3GslyxhEi/E4DazTckdys2
	6xR7UJAviUjUzXS2iU/Y9mqG+jLp
X-Google-Smtp-Source: AH8x224cfIKViUxmVp2oDD3j1DmAeJsCzlFxFTYLKr/O99Q09kxqb5SWCpRkEdV7ec+00I1xgtgqDA==
X-Received: by 10.55.22.88 with SMTP id g85mr43000377qkh.117.1517337562198;
	Tue, 30 Jan 2018 10:39:22 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	o62sm9777606qke.20.2018.01.30.10.39.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 30 Jan 2018 10:39:21 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Jan 2018 13:39:09 -0500
Message-Id: <1517337549-2487-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pymisp: update to version 2.4.87
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
X-List-Received-Date: Tue, 30 Jan 2018 18:39:21 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pymisp.inc                 | 4 ++--
 .../python/{python-pymisp_2.4.85.1.bb => python-pymisp_2.4.87.bb}     | 0
 .../python/{python3-pymisp_2.4.85.1.bb => python3-pymisp_2.4.87.bb}   | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pymisp_2.4.85.1.bb => python-pymisp_2.4.87.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.85.1.bb => python3-pymisp_2.4.87.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pymisp.inc b/meta-python/recipes-devtools/python/python-pymisp.inc
index f9171f9..8fcb6f3 100644
--- a/meta-python/recipes-devtools/python/python-pymisp.inc
+++ b/meta-python/recipes-devtools/python/python-pymisp.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[md5sum] = "7d924d9a776c5e41f735412131571178"
-SRC_URI[sha256sum] = "71e8515bb2209bb8b96e8edaa66d5341553f99822f94b32545d9efb404b6ba67"
+SRC_URI[md5sum] = "1cb54be2bdd39225428fc4789c5a7a77"
+SRC_URI[sha256sum] = "e9d7a00e6f0ad7caa2823ae18e15770cde747a5322aa47d7744858f109af14d3"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-json \
diff --git a/meta-python/recipes-devtools/python/python-pymisp_2.4.85.1.bb b/meta-python/recipes-devtools/python/python-pymisp_2.4.87.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pymisp_2.4.85.1.bb
rename to meta-python/recipes-devtools/python/python-pymisp_2.4.87.bb
diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.85.1.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.87.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.85.1.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.87.bb
-- 
2.7.4


