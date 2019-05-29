Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id D8C7F7E225
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2019 08:48:12 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id a3so965119pgb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2019 01:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=e4S+BcoE/KvAKIeSG3XOJ8fBnXK1EtLokscGBfrx31s=;
	b=MgqiY6DMPkgs42GmqVT+h9qCl9rgzWqJSFzUtd0LiNxHHHE9PLAkkV3vFJLjx9+RNf
	+tNXyBN5Z3MOT7jaaARmoI5sQpK/yru/PAkXxC6Aqhb1D9CVXc21QiJbZOss+OFjSUJZ
	/GSXf7I0F0zjxVM9wGldZJmPYk4ZmWC00PkqsdAnoVOHUOcsPv32W8/WDQqY2NCeIOvr
	6YzcQv+kD7qJa1vrXtQYi/mJP0xaJnmEAc5Bz29INKfq+SvmpfNaBkkxWqCvWrBiEhry
	yYvBiaMhfcFUbnjxFueI1vEEwjOPak5iSyeuayl90hb2g+JT5aS1F4T7NSG57H9T3MLo
	qduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=e4S+BcoE/KvAKIeSG3XOJ8fBnXK1EtLokscGBfrx31s=;
	b=JOPsjiYzdVD45pWQe6JmSQ/tBbeLKE6VNEFcfpZbqxsru2yFg0h0Vn3kDNANF3xhSw
	+X/myJ3CX1sECgW3whDLHVxvUhkuSmbvi3XqrYe/XlC4A4Yl7ssAbcrjY4W3HT1MZrRV
	WNiY6vlzNQzH7yZxFphv11nyQ86s6sy+xI1BeSRgsjO7ato08U3N9PE0/UvI/X9PHVTV
	azz+4Ymm/DJV/lqFqlntpGjcsU52XF8qhY1d5voiMQGrkVnXsRMhp/CUNmmaqiYyFXEy
	w63DfgbsGjjDjpqIR2F0plC0GZaglBk8dRO0tCrQq4dS9sZbnaZNuvDor7wSargtmAWw
	qutQ==
X-Gm-Message-State: APjAAAX18TiF4QnA1kPBDbTOXpLrqTZBh89ztMfQMYQIGAK6Bl/zef7f
	pZ/LPSf4ruF8lFpmfERzjx+TXV0x+8Y=
X-Google-Smtp-Source: APXvYqxHM3HJozjlvSxNFX4wu4Jq0ZPabJGxAh2tb1Q4zyLtc79SW7PFbUyP/svygMCzWJQIApl2bQ==
X-Received: by 2002:a17:90a:658b:: with SMTP id
	k11mr10790097pjj.44.1559119693729; 
	Wed, 29 May 2019 01:48:13 -0700 (PDT)
Received: from navik-desk.iind.intel.com ([134.134.139.82])
	by smtp.gmail.com with ESMTPSA id r4sm4921046pjd.28.2019.05.29.01.48.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 May 2019 01:48:13 -0700 (PDT)
From: Ankit Navik <ankit.tarot@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 May 2019 14:18:06 +0530
Message-Id: <20190529084806.13342-1-ankit.tarot@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH v3] safec: Initial recipe for safe C library
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
X-List-Received-Date: Wed, 29 May 2019 08:48:12 -0000
Content-Transfer-Encoding: 8bit

Add generic recipe for safe C library.
This library implements the secure C11 Annex K functions on top of most libc
implementations, which are missing from them.

Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
---
 meta-oe/recipes-core/safec/safec_3.4.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-core/safec/safec_3.4.bb

diff --git a/meta-oe/recipes-core/safec/safec_3.4.bb b/meta-oe/recipes-core/safec/safec_3.4.bb
new file mode 100644
index 000000000..d55d081f3
--- /dev/null
+++ b/meta-oe/recipes-core/safec/safec_3.4.bb
@@ -0,0 +1,15 @@
+SUMMARY  = "Safe C Library"
+
+LICENSE  = "safec"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6d0eb7dfc57806a006fcbc4e389cf164"
+SECTION = "lib"
+
+inherit autotools pkgconfig
+
+S = "${WORKDIR}/git"
+SRCREV = "62e6b2df55084316d027165d286e46beb40513dc"
+SRC_URI = "git://github.com/rurban/safeclib.git"
+
+COMPATIBLE_HOST = '(x86_64|i.86|powerpc|powerpc64|arm|aarch64).*-linux'
+
+RDEPENDS_${PN} = "perl"
-- 
2.20.1


