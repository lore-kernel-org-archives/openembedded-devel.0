Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 16A71786CB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 09:17:09 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id r78so388235wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 01:17:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=C1fxt+zoaNGSakA9cHAcp6QUz0O1KFqf/fplsBhPz6Q=;
	b=srb6ngUQ4Yfzely2llneAIOILEdc3BQdcPCbdsa3Kb+zG/Conb/PkxnJ5vOpAS9mOB
	QKFjmBe29xsMf6P+Znlv840my2JcOnukOHSw9+E9wZYWCUcKH/KtDEKpErCjYaj/4sUo
	aBLGF8VTXCMojhMPv1zBamdP1OKHhsSX+0bmWYNsocZY3ERRZDPK8YTbxCHG+q+ATZ3a
	W546y9EnpxbQXMDgjrhoDHq2A954bHwdXZQ7iqoY/7X7G35U3Ly65BKSihOlZ5LdigTK
	2uQNKcAzlzeGcoIblhyQYnhYloklp+uow14n045wOQhw20LdhE4Ewg8RAxMYfr5Ptp4J
	fb4g==
X-Gm-Message-State: AKwxyteM+mE6u51kYVlXogdECybZW9sZPJrCQiC3GPkHed3oynXI1V96
	Yo6LSUtrv5M9gAbK6ZdSvPI9mnS8
X-Google-Smtp-Source: ACJfBot2P5AP3x8onWfCPad9WiB5TsW8HBHSo7PhMwRmKgCxCq/OA0CpMTuKBwfncDtVQiVeDUAYlg==
X-Received: by 10.80.133.33 with SMTP id 30mr9194060edr.24.1516007830306;
	Mon, 15 Jan 2018 01:17:10 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 15sm780937eds.54.2018.01.15.01.17.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Jan 2018 01:17:09 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Jan 2018 09:17:04 +0000
Message-Id: <20180115091707.1539-3-git@andred.net>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180115091707.1539-1-git@andred.net>
References: <20180115091707.1539-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-python][PATCH 3/6] python-pycryptodome: add initial recipe for version 3.4.7
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
X-List-Received-Date: Mon, 15 Jan 2018 09:17:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta-python/recipes-devtools/python/python-pycryptodome.inc | 13 +++++++++++++
 .../recipes-devtools/python/python-pycryptodome_3.4.7.bb    |  2 ++
 .../recipes-devtools/python/python3-pycryptodome_3.4.7.bb   |  2 ++
 3 files changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pycryptodome.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pycryptodome_3.4.7.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pycryptodome_3.4.7.bb

diff --git a/meta-python/recipes-devtools/python/python-pycryptodome.inc b/meta-python/recipes-devtools/python/python-pycryptodome.inc
new file mode 100644
index 000000000..ecfcc9d80
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pycryptodome.inc
@@ -0,0 +1,13 @@
+SUMMARY = "Cryptographic library for Python"
+DESCRIPTION = "PyCryptodome is a self-contained Python package of low-level\
+ cryptographic primitives."
+HOMEPAGE = "http://www.pycryptodome.org"
+LICENSE = "PD & BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=690cd8c71f0367a558f24fe53d943a2e"
+
+SRC_URI[md5sum] = "8744863c7d5980ae3f81c2e288701a61"
+SRC_URI[sha256sum] = "18d8dfe31bf0cb53d58694903e526be68f3cf48e6e3c6dfbbc1e7042b1693af7"
+
+inherit pypi
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-pycryptodome_3.4.7.bb b/meta-python/recipes-devtools/python/python-pycryptodome_3.4.7.bb
new file mode 100644
index 000000000..c7701eb9f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pycryptodome_3.4.7.bb
@@ -0,0 +1,2 @@
+require python-pycryptodome.inc
+inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python3-pycryptodome_3.4.7.bb b/meta-python/recipes-devtools/python/python3-pycryptodome_3.4.7.bb
new file mode 100644
index 000000000..0c062dddf
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pycryptodome_3.4.7.bb
@@ -0,0 +1,2 @@
+require python-pycryptodome.inc
+inherit setuptools3
-- 
2.15.1


