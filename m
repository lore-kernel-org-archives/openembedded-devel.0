Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id DB97774E86
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 19:19:39 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id a11-v6so5423757pff.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 12:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8yc/lwrq0hj8UcW32C03YGC+JMFpzFtqCtW+gR3A9qY=;
	b=ompj51KnHWw+C2cChOHCTLnlfJR1U/MVTCZlSkbyVEaYIHyoW9cgIxn/15vPJmtbWK
	lwAFsQkJ/JL2sScD510rxokPgFZ7Cjo9Wqr2+y9KBN984AgndlyowZm+dRFFP8OcAE+p
	tqlYygtAn78Oiz5SgdZBKDqvDlzDfe+0BfbnMKGeTUGHlg93RiCrwh7S4R8qJzJtv6FO
	feyc1UACTbtyvaAmWVBMyrBLzvgiLs0/4DyBC18NEutq30lXZUzSusWi2c04JNEHeGah
	ftHd84UtTT39lIB2pKvZ826iGDWISkg/xO4IH8t+AAGGQ+K1qyYTwpDLJ7tkgi6pGp7/
	Mj0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8yc/lwrq0hj8UcW32C03YGC+JMFpzFtqCtW+gR3A9qY=;
	b=MHAX0InSghWYT+g1aZWGNsjJbdz88reoI18c7E6GT/oLCe7hOnTt+1w4GWyLteNI1Q
	J8DQ0TlUHMazcINB9CWQQm+G6vWMJKh1dTDEg592IbvIfO+B1Atc4q1SSubFgb5cBCdI
	o07qlkc4sIfiKXQrk9fDxr3SiSx4O5DvY7D+S2okw4nh1u2Mesec/Ytal9w5FAPssWRP
	AaA6ZcoqDpYoT9baJOWj0ajlHt5OXm76yVN0ipFxy9nkhuzFjaheeCpLxePAZwE8+TKI
	2sn15Km9iOcgLTafrmGvXRHGTF8RE1W+dtajRK+RZgotU54mB7eL9fZIyxWhvrzldfIp
	yLTw==
X-Gm-Message-State: APt69E2x0s9Nk2e53nshYstZDsSQd3yx+wFlf9n5OYL18wdIcnprwukG
	jDHmw3vr0aYDDVG/77rBJSTymw==
X-Google-Smtp-Source: ADUXVKItcdXHJxPN+W3N3cFxPuAIxpYg0TFgvKGIsmrVDrnVoFLo1D3EjHRf1kGv9l8uN+Q24cIBGA==
X-Received: by 2002:a65:63cd:: with SMTP id
	n13-v6mr3549221pgv.185.1529867980767; 
	Sun, 24 Jun 2018 12:19:40 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	m11-v6sm36700461pfj.25.2018.06.24.12.19.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Jun 2018 12:19:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jun 2018 12:18:36 -0700
Message-Id: <20180624191845.31082-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624191845.31082-1-raj.khem@gmail.com>
References: <20180624191845.31082-1-raj.khem@gmail.com>
Cc: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Subject: [meta-python][PATCH 11/20] python-cryptography: 2.1.4 -> 2.2
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
X-List-Received-Date: Sun, 24 Jun 2018 19:19:40 -0000

From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>

Upgrade python-cryptography from 2.1.4 to 2.2.

here is the change in LICENSE file thats resulting in checksums changes

-from the same in CPython itself, and is licensed under the terms of the PSF
-License Agreement.
+from CPython, and is licensed under the terms of the PSF License Agreement.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python-cryptography.inc | 6 +++---
 ...hon-cryptography_2.1.4.bb => python-cryptography_2.2.bb} | 0
 ...n3-cryptography_2.1.4.bb => python3-cryptography_2.2.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cryptography_2.1.4.bb => python-cryptography_2.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cryptography_2.1.4.bb => python3-cryptography_2.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cryptography.inc b/meta-python/recipes-devtools/python/python-cryptography.inc
index 13d2ba800d..cdc8185c92 100644
--- a/meta-python/recipes-devtools/python/python-cryptography.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography.inc
@@ -1,7 +1,7 @@
 SUMMARY = "Provides cryptographic recipes and primitives to python developers"
 HOMEPAGE = "https://cryptography.io/"
 LICENSE = "Apache-2.0 | BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d5ede125ed08d4fd14ec44d334bdb388"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=097f805837700cfac572ac274cd38124"
 
 DEPENDS += " \
     ${PYTHON_PN}-cffi \
@@ -10,8 +10,8 @@ DEPENDS += " \
     ${PYTHON_PN}-six \
 "
 
-SRC_URI[md5sum] = "9f39d4d8f2b05f295fa0ff52475ec4f2"
-SRC_URI[sha256sum] = "e4d967371c5b6b2e67855066471d844c5d52d210c36c28d49a8507b96e2c5291"
+SRC_URI[md5sum] = "c49c1ee145a900313a216fa2c788208c"
+SRC_URI[sha256sum] = "f5a0279e362c37e2150a32fe35ec20226e9237b6c9927fce8d53ef8e49e64f48"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-cffi \
diff --git a/meta-python/recipes-devtools/python/python-cryptography_2.1.4.bb b/meta-python/recipes-devtools/python/python-cryptography_2.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cryptography_2.1.4.bb
rename to meta-python/recipes-devtools/python/python-cryptography_2.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-cryptography_2.1.4.bb b/meta-python/recipes-devtools/python/python3-cryptography_2.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cryptography_2.1.4.bb
rename to meta-python/recipes-devtools/python/python3-cryptography_2.2.bb
-- 
2.18.0


