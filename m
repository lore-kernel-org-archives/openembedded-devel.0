Return-Path: <nick83ola@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id D42D961B3B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2020 07:04:33 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id x3so2452995wmj.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2020 00:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7FMOq4VpqVb1Cp7y5s+oJEtE00OqJ4FjOzVLTcdUifs=;
	b=q5YNT/FfNuZfLdlmmam8jpZ0kEP8jxq21+Ah0JyqAaN11qYR4s0eqe2THDcwz5ixde
	tvZQkjdmgvnG4B5haOdX3jzivKc48YF7/yIvJ5liezfFjTDdRxFr9RqgEgBuBYleCHBV
	ES3VAcHDP+eKh7DQ0lIFbKhXsLgYvDy0ltCd3HaUII/5gbjIPUVSCwhvtLTjpC6yE0lX
	/+donXLDtDSqPkzbjZasOXFlEKonoy1Dll2WVBKxT+LrXyV5f0n4MyHuQtSll55ux6pe
	dvA8EqPqxkblr005X2B6I48WD9VYRyK1tfJUhV8XPIlggwfd8RvP9tOKa1LQ0FiZHzXf
	4ruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7FMOq4VpqVb1Cp7y5s+oJEtE00OqJ4FjOzVLTcdUifs=;
	b=d4UXp8umhMUG/ceGWe++TKE3iNXTJSjx28eOXNLrdhRl/6RfMg3eLVskEYc+0UVw//
	zy2xbAjJtPnvfVJ21viaoobI79ITSv6vFtGYYYlYjm8zJMLBOHSgmSo8ZigE0ZjeZwca
	khzQybR89jYad7hl4tsnUW5cicPnvxrc0QVNlUpfHsjdtA7T+cOCzyu75DAHNYwGwbpE
	8CGD0CMF5QWbc77LnlA+ZLxKkeQhh1oQUxTX1lvP1RMfHRZXCnLIZAIaebsjF5kUWfSF
	Jo/Cp+GjgEhy17rA3nxfLZPtB80YlvKmA32UaW5a9gqa00RDF79F9OanxEMiOE7n00od
	b+GQ==
X-Gm-Message-State: ANhLgQ2FgXFt5PsX+KHKoLadOFmHgc+lATFq2hqpRmpbdJloF7V/q+t0
	v4J0lEl+W27rinrhR12p/WrAKP84/5BJMw==
X-Google-Smtp-Source: ADFU+vsU5bT5Iv69qSUzLNphhx23UzIsMTBRH8R3bWAYvXgRqC3EdZ8X+GFiDkwE51mMsi2+F3TBSg==
X-Received: by 2002:a1c:9c96:: with SMTP id f144mr2046703wme.98.1583910274145; 
	Wed, 11 Mar 2020 00:04:34 -0700 (PDT)
Received: from localhost.localdomain ([79.97.95.10])
	by smtp.gmail.com with ESMTPSA id f2sm9567312wrv.48.2020.03.11.00.04.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 00:04:32 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Mar 2020 07:03:58 +0000
Message-Id: <20200311070359.18480-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Parthiban Nallathambi <parthitce@gmail.com>
Subject: [meta-python][PATCH 1/3] python3-cycler: add recipe for 0.10.0
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
X-List-Received-Date: Wed, 11 Mar 2020 07:04:34 -0000
Content-Transfer-Encoding: 8bit

This is a dependency for python3-matplotlib

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 .../python/python3-cycler_0.10.0.bb              | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cycler_0.10.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-cycler_0.10.0.bb b/meta-python/recipes-devtools/python/python3-cycler_0.10.0.bb
new file mode 100644
index 000000000..cd21be8ac
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cycler_0.10.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Composable style cycles"
+HOMEPAGE = "http://github.com/matplotlib/cycler"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7713fe42cd766b15c710e19392bfa811"
+
+SRC_URI[md5sum] = "4cb42917ac5007d1cdff6cccfe2d016b"
+SRC_URI[sha256sum] = "cd7b2d1018258d7247a71425e9f26463dfb444d411c39569972f4ce586b0c9d8"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "\
+    python3-core \
+    python3-six \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


