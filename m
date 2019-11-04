Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 168977BEDF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2019 11:35:59 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id v9so16665646wrq.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Nov 2019 03:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HVrBgdK06WNazOqtuNBeVKlzzIIm6C41HBcENthSgGE=;
	b=UMBEfwCNRPwc6xM2LdPmnIqQC2NiJfoFCh7Gl13MQA7WV3TzyQhSHGJNCCiAQOV5pC
	opZbjncqeBbrmBLl9y2ODXBRAiMcHX6hY8WfrDnQHt1RLsjO/n2Ao/5fV4Vk/Ue7M4u4
	Wk910uR8FUKo90anw/GaB/pZ8IbJaABqOcK5xTmKd1hDs4o/SXAolSocLp8O5R+pf7MY
	9/UvmRNMtsvM1IXyDcTm4xmZt1XO37cDXCOHeAwxiksgTrrT/vdJMZxDP+b7qvJ7Hr1o
	oHvjRFUpUd1UedKKvx+P2HAHVWRTz92z6+UmWf/Pr7wqC25ZAJD489FDhb+jm/x3CraX
	v3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HVrBgdK06WNazOqtuNBeVKlzzIIm6C41HBcENthSgGE=;
	b=t0ifinsRo+7zv7wr3gikaEW3qjQzZTiZxo5aSc4xTpvSv4SAjJBH1dcbKyTOmsHI0I
	t4/ayHamYEBXb9cUVLZmRjaXS9QEMnY5LoQ7OZOkadDb5LdOj0RYllZabXZ32coQKy8K
	4rWNL/zK8Gi0I+RMnD5u9GTY8+Rm1FE3zBu8LkRPlBgkMpmKHXlL8dz4PZ4Bo2l01PZI
	s+FZTUucLEaNXgqietiv8+iElHDl+yb201b4xuwo2r3PHVniSnJu2ykeXW9y0UT8v6ju
	wLzEMoq2OKb1ijpgBvnqUIQQ0T7IPYJGMgBWyFZRFIJP1oRFqng9FCIEF20TK8Gzbj/e
	0HzA==
X-Gm-Message-State: APjAAAUdL0RS5m4Ht/9/wC0SoQQQ6ULJFqPOU7OvhbCWf2nL/ujYKIVh
	7mGPRwQ5P3nRVXQTthBNcAehjjG8
X-Google-Smtp-Source: APXvYqxaFpEwhlTvFSSv67ZVU8jqFad0Hm3xwqYrhkOAg47OpGNc7KL5Qu/JsDUGITMBo3TFxASmJg==
X-Received: by 2002:a5d:5284:: with SMTP id c4mr5179833wrv.376.1572867360260; 
	Mon, 04 Nov 2019 03:36:00 -0800 (PST)
Received: from amue-work.zera.local ([195.50.169.54])
	by smtp.gmail.com with ESMTPSA id p4sm8363636wrx.71.2019.11.04.03.35.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 04 Nov 2019 03:35:59 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Nov 2019 12:35:52 +0100
Message-Id: <20191104113552.17234-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] mm-common: upgrade 0.9.12 -> 1.0.0 / meson build / add SUMMARY
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
X-List-Received-Date: Mon, 04 Nov 2019 11:36:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-core/mm-common/mm-common_0.9.12.bb |  9 ---------
 meta-oe/recipes-core/mm-common/mm-common_1.0.0.bb  | 12 ++++++++++++
 2 files changed, 12 insertions(+), 9 deletions(-)
 delete mode 100644 meta-oe/recipes-core/mm-common/mm-common_0.9.12.bb
 create mode 100644 meta-oe/recipes-core/mm-common/mm-common_1.0.0.bb

diff --git a/meta-oe/recipes-core/mm-common/mm-common_0.9.12.bb b/meta-oe/recipes-core/mm-common/mm-common_0.9.12.bb
deleted file mode 100644
index 4f91f31e4..000000000
--- a/meta-oe/recipes-core/mm-common/mm-common_0.9.12.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-inherit gnomebase
-
-SRC_URI[archive.md5sum] = "be1c61587db989c7677375a729b94672"
-SRC_URI[archive.sha256sum] = "ceffdcce1e5b52742884c233ec604bf6fded12eea9da077ce7a62c02c87e7c0b"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-core/mm-common/mm-common_1.0.0.bb b/meta-oe/recipes-core/mm-common/mm-common_1.0.0.bb
new file mode 100644
index 000000000..0b9e58917
--- /dev/null
+++ b/meta-oe/recipes-core/mm-common/mm-common_1.0.0.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Common GNOME build files for C++ bindings"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+inherit gnomebase
+
+SRC_URI[archive.md5sum] = "9087b8612d75cbc1fad0c99e15c2a718"
+SRC_URI[archive.sha256sum] = "b97d9b041e5952486cab620b44ab09f6013a478f43b6699ae899b8a4da189cd4"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+BBCLASSEXTEND = "native"
-- 
2.21.0


