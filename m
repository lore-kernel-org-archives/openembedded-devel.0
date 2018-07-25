Return-Path: <freebendy@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9379C7307F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 13:33:04 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id a11-v6so612599pgw.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 06:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=64eFHZiH77jeAD3jgem70Q7t1+3ZCpQUCZrk4FelLB0=;
	b=Qcl+U8wpe6q0h/pEZ75sgjCiVZ4qJAhHPYxSJAX5NzroHAhOl943EC5ewkiHe13RML
	ysHHWGLfqm/rgsPSWv05vUkBqPmxdkHycrBC7A0M3LcD6vvkhTEbvS70C+BytRgnFfHi
	4IPP4YJ1jwCfGsDMVCfnVVWlP2e1euCUMAiYgeApC3frEPW6KzNZa55LRmtJyO2/IQ4c
	VdkwkNktAYWJLgTYkqt8acuLt2JNZ5igqKyupKkTmEZp0+lakqDh9dvVVZJqmidN42+t
	uexkAmB2DAxwsURzgaHuYBLVqWH8AjTLFvdA9BaZdmWJjbSFUpaHrnE95V0KHeQSMjWj
	7HPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=64eFHZiH77jeAD3jgem70Q7t1+3ZCpQUCZrk4FelLB0=;
	b=Aw0ipVDc/UzfTvXwsZCKdXhtDc4Q9EZ/63Wg8aYR3uA+HXBuP16IxEqLCbxpTz+6Oz
	OmPld7l4XDqNWuCnxvJNz+wI4V7gtmPOiJUNvPpG7qR0SJmXiXVmBsgGVG/Zd1j0Lp1f
	5HI4JNpfzB9rUGZlb+0cuZ6fcVyMPiWgjr3yTjYKzXp0a4DJ0Q1JbLikeZAej6vbNF+x
	NHHgFmVxA/PgL2aD6/ctKxTvSaANk1OtrkxgJOyP4U+ts6AC0hcjhEYsmVH3aHikqXLw
	sGg79+FyBb2rKwt8GP5BZkbSZBciJ7v6IHtcFzcQH/pp4EwwXUCgSfih2fYYUqskg8PM
	icOg==
X-Gm-Message-State: AOUpUlHO48fE9VihonRaXUmMWhNkGtZNlTAo9698Il3Nkj/4qa18+IHz
	Jy1WquAsltX+f9dhhyNzyHqHbCCwZw==
X-Google-Smtp-Source: AAOMgpfcKTqqzH+MYTxgjdBU1sJVZIuUk/bNTjH2rO5H10wOpNSAOxlvC8UTAprUqB7uJK6Iy7XRIg==
X-Received: by 2002:a62:6941:: with SMTP id
	e62-v6mr22355831pfc.217.1532525585266; 
	Wed, 25 Jul 2018 06:33:05 -0700 (PDT)
Received: from localhost.localdomain ([116.7.217.144])
	by smtp.gmail.com with ESMTPSA id
	s20-v6sm17960249pga.37.2018.07.25.06.33.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Jul 2018 06:33:04 -0700 (PDT)
From: Binghua Guan <freebendy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jul 2018 21:29:15 +0800
Message-Id: <20180725132915.2558-1-freebendy@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-python] [PATCH] meta-python: add python-crcmod recipe
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
X-List-Received-Date: Wed, 25 Jul 2018 13:33:04 -0000

Signed-off-by: Binghua Guan <freebendy@gmail.com>
---
 meta-python/recipes-devtools/python/python-crcmod.inc     | 14 ++++++++++++++
 meta-python/recipes-devtools/python/python-crcmod_1.7.bb  |  2 ++
 meta-python/recipes-devtools/python/python3-crcmod_1.7.bb |  2 ++
 3 files changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-crcmod.inc
 create mode 100644 meta-python/recipes-devtools/python/python-crcmod_1.7.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-crcmod_1.7.bb

diff --git a/meta-python/recipes-devtools/python/python-crcmod.inc b/meta-python/recipes-devtools/python/python-crcmod.inc
new file mode 100644
index 000000000..85da7cb3c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-crcmod.inc
@@ -0,0 +1,14 @@
+SUMMARY = "A Python module for generating objects that compute the Cyclic Redundancy Check."
+HOMEPAGE = "https://pypi.org/project/crcmod"
+LICENSE = "MIT"
+SECTION = "devel/python"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a19291627cad2d1dfbfcf3c9fb85c2"
+
+SRC_URI[md5sum] = "2d5b92117d958dcead94f9e17f54cd32"
+SRC_URI[sha256sum] = "dc7051a0db5f2bd48665a990d3ec1cc305a466a77358ca4492826f41f283601e"
+
+inherit pypi
+
+RDEPENDS_${PN} += "${PYTHON_PN}-unittest"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-crcmod_1.7.bb b/meta-python/recipes-devtools/python/python-crcmod_1.7.bb
new file mode 100644
index 000000000..45b9a2ce6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-crcmod_1.7.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-crcmod.inc
diff --git a/meta-python/recipes-devtools/python/python3-crcmod_1.7.bb b/meta-python/recipes-devtools/python/python3-crcmod_1.7.bb
new file mode 100644
index 000000000..6996b13d0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-crcmod_1.7.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-crcmod.inc
-- 
2.11.0


