Return-Path: <bill.randle@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5EBB477E76
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Dec 2017 05:49:24 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id m25so6167986pgv.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Dec 2017 21:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ThV/zo/6epujHUYrHGh8S3rp+eKHDPnT653sq6UmZr0=;
	b=aRhwSkPgumFkkDCcIZojtLprH3VlYntdJlYKnV2IDLt7Iddp86+ZHojjTPHPjsWm1u
	44F60TdCj/zIi2ViHHMJSNhuH32YtqEflC/9b6xzwqv/7UVP/dOL852PYNfMqwf1BmXF
	4UySbQG1nTAQ4HPAJMtIGSi3C7XSZ7TRS+UmjQbBGOOqncgCfvHWppczOvm6doGpROEz
	nTXX2NkHUr2U4urNRHaISgFe2umC/eMxhbDOa26bapnkxyU5CgcX260+Vlrf3DAg1Itm
	g6R8yjK3K25vM/0c0HSnb2mdUJKOaCXmmRXgEbTKNfZma/PLWd5cvMuKacU9QfFqxp70
	dAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ThV/zo/6epujHUYrHGh8S3rp+eKHDPnT653sq6UmZr0=;
	b=B7RX2QC6fKuLdGjEWZPawxyc/lpG26dbkzJhDXFyR7Yv4fqoOtVI8TcMa1L0hPB04H
	tZCp7p6imzFu1r1ZA9PlD8qUf3S/rq/zAPihzcuDNMdc3keH9JnTMp/6cKizRws5vdMV
	NppCb4Ojs5rEmuPsEMo8HucYI3zmOQQJaMCM1Jonva10Tszrxox73Ew3i7mz/iQ0QzHc
	INfD6tZuLLtUdANBCgOgvAyvZiVma34OVysaoiS9rFMlCkAor6yZWvchbCphCEdveKVi
	qJJ2q4EvDYTpJlRU+FM6YJmZ5AIQfs52kr1zV3+H4bFt+60mzpLCLE0iHE18oVvDduOb
	m+SQ==
X-Gm-Message-State: AJaThX6R2eWIP/o/+L1Fx+Rf24YNxoWKfLp0A/a0OGQkbhYqwDAkWSoz
	OiDAfdtBghrihmLaN2os7gI+xw==
X-Google-Smtp-Source: AGs4zMYCrbB7YxAxaJ53aSumF1TXQBe95oAXM7WFi0dUbzArZQl5WEGMiGrsEc70w8M6GXsonBAvHg==
X-Received: by 10.84.229.79 with SMTP id d15mr28320474pln.397.1512712165177;
	Thu, 07 Dec 2017 21:49:25 -0800 (PST)
Received: from neosoft.neocat.org (67-5-135-101.ptld.qwest.net. [67.5.135.101])
	by smtp.gmail.com with ESMTPSA id
	y5sm12500814pfd.63.2017.12.07.21.49.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Dec 2017 21:49:24 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Dec 2017 21:48:59 -0800
Message-Id: <20171208054911.27014-2-bill.randle@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171208054911.27014-1-bill.randle@gmail.com>
References: <20171208054911.27014-1-bill.randle@gmail.com>
Subject: [meta-python][V2 PATCH 01/13] python[3]-editor: new recipes
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
X-List-Received-Date: Fri, 08 Dec 2017 05:49:24 -0000

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 meta-python/recipes-devtools/python/python-editor.inc       | 9 +++++++++
 meta-python/recipes-devtools/python/python-editor_1.0.3.bb  | 2 ++
 meta-python/recipes-devtools/python/python3-editor_1.0.3.bb | 2 ++
 3 files changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-editor.inc
 create mode 100644 meta-python/recipes-devtools/python/python-editor_1.0.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-editor_1.0.3.bb

diff --git a/meta-python/recipes-devtools/python/python-editor.inc b/meta-python/recipes-devtools/python/python-editor.inc
new file mode 100644
index 0000000..30650bd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-editor.inc
@@ -0,0 +1,9 @@
+DESCRIPTION = "Programmatically open and editor, capture the result"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
+
+SRC_URI[md5sum] = "0aca5f2ef176ce68e98a5b7e31372835"
+SRC_URI[sha256sum] = "a3c066acee22a1c94f63938341d4fb374e3fdd69366ed6603d7b24bed1efc565"
+
+PYPI_PACKAGE = "python-editor"
+
diff --git a/meta-python/recipes-devtools/python/python-editor_1.0.3.bb b/meta-python/recipes-devtools/python/python-editor_1.0.3.bb
new file mode 100644
index 0000000..f7a9a8c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-editor_1.0.3.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-editor.inc
diff --git a/meta-python/recipes-devtools/python/python3-editor_1.0.3.bb b/meta-python/recipes-devtools/python/python3-editor_1.0.3.bb
new file mode 100644
index 0000000..8ad2b86
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-editor_1.0.3.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-editor.inc
-- 
2.7.4


