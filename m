Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id CF7E978289
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 17:14:19 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id w10so25008837qtb.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 09:14:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iR45WpHLjl5Mr3nseTY/hEZbnb/qGOfEmoVVDYak7H0=;
	b=Sfs8SbjLJ6SciEMeg/CmwH54NEGuAITz17ZsS7I0gDTUW56tNv6g2juEvO17YBMk64
	ArPRrPIxB2g0z+GlUALixHKxyG7mg3s7+Jdd3j2qKOz4Q9uk1Zgm3VhqAwgPdQtVA89L
	k1GGB0ELZdJpiHVvbzUUTX1W7p0cme7U5IlIRAsEabNN6J1IR73KRcoiA2NXrQ0CZH2a
	Sxq2e4r4errF2aU2dh5MGQSjm7YHqDfoGb+gNxLgFD4XKpEji8LCordqbbFOENexRrOA
	yhJeJfdZBBuXk7e+osI2N+KITKEsGWMOM0VIAIFEUTGaCy06FhQOlBBakZn+Hd6VySBq
	MOsw==
X-Gm-Message-State: AKGB3mJhEaKz+c2xtMnq4hGor4ic7/+NbChCGUJrsrABz72XAAq09gmR
	TAG24BzBT7+vV75LO6wgdtkz0v4P
X-Google-Smtp-Source: ACJfBoshw6bOoohMwEb+2/08U2zBNKkdV6bH+cGXiNCrPTh4oGMLoNhV033nBHYSUFlOdYeEApUw0A==
X-Received: by 10.237.53.172 with SMTP id c41mr5591869qte.191.1513703660558;
	Tue, 19 Dec 2017 09:14:20 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	v81sm9536832qkb.73.2017.12.19.09.14.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Dec 2017 09:14:19 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Dec 2017 12:14:11 -0500
Message-Id: <1513703652-24021-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH 1/2] python-pluggy: add initial recipe for version 0.6.0
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
X-List-Received-Date: Tue, 19 Dec 2017 17:14:20 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pluggy.inc       | 9 +++++++++
 meta-python/recipes-devtools/python/python-pluggy_0.6.0.bb  | 2 ++
 meta-python/recipes-devtools/python/python3-pluggy_0.6.0.bb | 2 ++
 3 files changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pluggy.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pluggy_0.6.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pluggy_0.6.0.bb

diff --git a/meta-python/recipes-devtools/python/python-pluggy.inc b/meta-python/recipes-devtools/python/python-pluggy.inc
new file mode 100644
index 0000000..320359a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pluggy.inc
@@ -0,0 +1,9 @@
+SUMMARY = "Plugin and hook calling mechanisms for python"
+HOMEPAGE = "https://github.com/pytest-dev/pluggy"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=338dad807ed9337bfaeb9979c3bfe20f"
+
+SRC_URI[md5sum] = "ffdde7c3a5ba9a440404570366ffb6d5"
+SRC_URI[sha256sum] = "7f8ae7f5bdf75671a718d2daf0a64b7885f74510bcd98b1a0bb420eb9a9d0cff"
+
+inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-pluggy_0.6.0.bb b/meta-python/recipes-devtools/python/python-pluggy_0.6.0.bb
new file mode 100644
index 0000000..edcd4f5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pluggy_0.6.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-pluggy.inc
diff --git a/meta-python/recipes-devtools/python/python3-pluggy_0.6.0.bb b/meta-python/recipes-devtools/python/python3-pluggy_0.6.0.bb
new file mode 100644
index 0000000..941e8e3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pluggy_0.6.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-pluggy.inc
-- 
2.7.4


