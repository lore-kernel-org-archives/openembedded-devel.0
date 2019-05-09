Return-Path: <parthitce@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7B9946B8BC
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 May 2019 08:16:12 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id 198so2007373wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 May 2019 01:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JZyu97RpaGda7w+IU1ugth4TsQUPnbC6tMWtjDRfa0M=;
	b=ufAGCkck4fiU+6rIGPLMAG46TTdBkisyCPk+enc5AKEA1Zo6yn6byw5fhTGbG0Ns+v
	N9ci1g09wLsocDQ6w1i5secOtmCtHOhBNwadMcK40LGyk012Sv2fOUNz3ho0Pxa86drC
	+ykRLTTjmsbH+riMhlNS+teylPCihS+NhL5onsmfiSudB8nYiGut+DvHzY2pqEpdP4pJ
	unlm6sBbA947bgSZriQq5DHW4TajlfUls5cevuA9AUvPxQWlC75YlYOsZEpkaCkIQyi/
	rsdV/008+juQgDtlFqKr+gv3ATmbPKMSUcq1T5/r8xRagvZZ3ZfVyJ+bGohuUwNVZO2C
	s5Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JZyu97RpaGda7w+IU1ugth4TsQUPnbC6tMWtjDRfa0M=;
	b=tEazjIZuTzS6/AtBs+uku0M7DD2Etapz5ydx0V0Z+fS88OEoa2YvrUChxuRPtIGaSL
	6MSyJhBPFFzD1VgjXJw2Io4OPtzzJPnOkzWNq9s3/LtZeVhOJfGwgMcQXYrCs/zIFliQ
	EpDUO59grGetxz6g6r3sUn9uP7yT+dzQ8Oqc1ns2PORia3aGAQlTLWbCm5zqCuOshruN
	oB6BsKYtKdv7CzZ9iHfV5QENdk7vr2EywTgQ4IHyyHzqwISxC5Rui+LVmusKRXIamMSM
	ZwF9TTPoWUOjUss865LMPvBAJrtS+bXuld6aezMKMXrE1l/MV2bfElL0qzxGIPlue5ww
	/OUQ==
X-Gm-Message-State: APjAAAXz2aS6Sp9vc0rKvuI0frIU58z10B8uue6icdCdcQ6j6uJTP0Cs
	LZJuMJtRwsR1tHqKAGesGy0oOHB+ZA==
X-Google-Smtp-Source: APXvYqz9kUtYcAw6YqQ9NtjUEM6e2YtyQfn6lQJ//P8tInGO6LVKFP0mtxO3URscxKHA7agnnlPdtw==
X-Received: by 2002:a1c:f910:: with SMTP id x16mr1810502wmh.114.1557389772810; 
	Thu, 09 May 2019 01:16:12 -0700 (PDT)
Received: from xpert.denx.de ([62.91.23.180])
	by smtp.gmail.com with ESMTPSA id f8sm1051340wmb.32.2019.05.09.01.16.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 09 May 2019 01:16:12 -0700 (PDT)
From: Parthiban Nallathambi <parthitce@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 May 2019 10:15:57 +0200
Message-Id: <20190509081557.383974-1-parthitce@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Parthiban Nallathambi <parthitce@gmail.com>
Subject: [PATCH] python3-tinydb: add version 3.13.0
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
X-List-Received-Date: Thu, 09 May 2019 08:16:12 -0000
Content-Transfer-Encoding: 8bit

Note:
Installation expects _sysconfigdata.py in native python DIR,
but python3 doesn't have copy for it. Adding the copy in python3
recipe breaks other python packages.

Patched locally in _prepend specific to tinydb

Signed-off-by: Parthiban Nallathambi <parthitce@gmail.com>
---
 .../recipes-devtools/python/python-tinydb.inc | 20 +++++++++++++++++++
 .../python/python3-tinydb_3.13.0.bb           |  2 ++
 2 files changed, 22 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-tinydb.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-tinydb_3.13.0.bb

diff --git a/meta-python/recipes-devtools/python/python-tinydb.inc b/meta-python/recipes-devtools/python/python-tinydb.inc
new file mode 100644
index 000000000..f79daa0f2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-tinydb.inc
@@ -0,0 +1,20 @@
+SUMMARY = "TinyDB is a lightweight document oriented database"
+DESCRIPTION = "\
+TinyDB is a lightweight document oriented database optimized for \
+your happiness. It's written in pure Python and has no external \
+dependencies. The target are small apps that would be blown away \
+by a SQL-DB or an external database server."
+HOMEPAGE = "https://github.com/msiemens/tinydb"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c03ea0a450e50a3a05d5a746504cb2eb"
+
+SRC_URI[md5sum] = "2824877e9ecfd9db5b64fdf079819358"
+SRC_URI[sha256sum] = "a05c4c81e6e867c4f8a2e51c5236d0d897019aa5e9296f5947455b0bdd3c519d"
+
+PYPI_PACKAGE = "tinydb"
+inherit pypi python3-dir
+DEPENDS = "${PYTHON_PN}-pytest-runner-native"
+
+do_install_prepend() {
+	install -m 0644 ${WORKDIR}/recipe-sysroot-native/usr/lib/python-sysconfigdata/_sysconfigdata.py ${WORKDIR}/recipe-sysroot-native/usr/lib/${PYTHON_DIR}
+}
diff --git a/meta-python/recipes-devtools/python/python3-tinydb_3.13.0.bb b/meta-python/recipes-devtools/python/python3-tinydb_3.13.0.bb
new file mode 100644
index 000000000..8996b2d44
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tinydb_3.13.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-tinydb.inc
-- 
2.21.0


