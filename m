Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id C986A76E2E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 23:30:51 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id b14so479670wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 15:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=8AjwUNmy8vbIl/adocQ7FCsLrJ+52RzDZ/YoSvSe4jE=;
	b=NhhNzbmvGOXM7kW66+hctUlPMvYZsdBeo+tALWfEYlzrNnxdsGovGCdRh2x8s9rBLb
	RvLwqA2toOjTAh8IOSjdwOFVVFLVithU+pwq5RnbXPjp1iVyFljMI44ntjZIUGKYln9Y
	M1yLtz2fz8VnFu7/jIQjp81OnZ9P/EM3Zw+J4R2BiqtitxGQKD1h6N3f3gZplDo81CU+
	8hkspJcO0Y2hAzkSQ9ioY6QaI4t6CQ2I0U0iwN5zhpnutvEYd2k7ZcETQYtHBx30QRX+
	31Yne7clIvz8hXxJnfwcgkdtWwtBU+yujAkgK9f4Gn+hVFh3vM25CjFBpAeToKeS4wF3
	D7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=8AjwUNmy8vbIl/adocQ7FCsLrJ+52RzDZ/YoSvSe4jE=;
	b=hwvzM2iFIJlo7M1KqmZyLV3GfIoJLjvx35hMDF1Eib6uEuv7lMBAxmDj7Q1mwAzAKU
	zT/V5hFYBF7qEoOQLS84jMzb9C0SnF6eXuyeEmv0rDvQnA9bv/sfNOWnwCdqEUzUdC1o
	+cmhaOXlf0lO7p1aGmv1boDlV1D1PWrRJvKs1RuEoJwBXeFEPtG5Ab4l8G1eJDc4IVDf
	8vGTss6kIr8xfd8TUmQ99YexDgEXdedxmxyX94zJ8Ytuzd/EQ2FXQj+0/8esCHynv7rC
	deWNhAxzwSXBjRU3j2yHjvCraRyE2zeDhpuTJ5qUzhuT7OJmbWC+nyz94cnCsr3MUlxf
	25Ow==
X-Gm-Message-State: AG10YOQYaQoBzJWF9+AkcEooZsfxD8uHG/uANt7WBSmS5rjoUPmr0LtFaR2aBlF60d609w==
X-Received: by 10.194.79.227 with SMTP id m3mr5453644wjx.5.1453505452460;
	Fri, 22 Jan 2016 15:30:52 -0800 (PST)
Received: from ubuntu.ebenfeld.local
	(ip-109-90-30-143.hsi11.unitymediagroup.de. [109.90.30.143])
	by smtp.gmail.com with ESMTPSA id
	ka4sm7882127wjc.47.2016.01.22.15.30.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jan 2016 15:30:51 -0800 (PST)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jan 2016 00:30:10 +0100
Message-Id: <0f4c90796d8d9b853232a7b215e67ee12dbc76c8.1453504827.git.sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [meta-python][PATCH 08/21] python(3)-passlib: add recipes
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
X-List-Received-Date: Fri, 22 Jan 2016 23:30:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 meta-python/recipes-devtools/python/python-passlib.inc     | 14 ++++++++++++++
 .../recipes-devtools/python/python-passlib_1.6.5.bb        |  2 ++
 .../recipes-devtools/python/python3-passlib_1.6.5.bb       |  2 ++
 3 files changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-passlib.inc
 create mode 100644 meta-python/recipes-devtools/python/python-passlib_1.6.5.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-passlib_1.6.5.bb

diff --git a/meta-python/recipes-devtools/python/python-passlib.inc b/meta-python/recipes-devtools/python/python-passlib.inc
new file mode 100644
index 0000000..843e8e0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-passlib.inc
@@ -0,0 +1,14 @@
+SUMMARY = "comprehensive password hashing framework supporting over 30 schemes"
+DESCRIPTION = "\
+Passlib is a password hashing library for Python 2 & 3, which provides cross-platform \
+implementations of over 30 password hashing algorithms, as well as a framework for \
+managing existing password hashes. It’s designed to be useful for a wide range of \
+tasks, from verifying a hash found in /etc/shadow, to providing full-strength password \
+hashing for multi-user applications."
+HOMEPAGE = "https://bitbucket.org/ecollins/passlib"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bae8faa3e2689ee0df3f2127fc4517f5"
+PR = "r0"
+
+SRC_URI[md5sum] = "d2edd6c42cde136a538b48d90a06ad67"
+SRC_URI[sha256sum] = "a83d34f53dc9b17aa42c9a35c3fbcc5120f3fcb07f7f8721ec45e6a27be347fc"
diff --git a/meta-python/recipes-devtools/python/python-passlib_1.6.5.bb b/meta-python/recipes-devtools/python/python-passlib_1.6.5.bb
new file mode 100644
index 0000000..73ace94
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-passlib_1.6.5.bb
@@ -0,0 +1,2 @@
+inherit pypi
+require python-passlib.inc
\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python3-passlib_1.6.5.bb b/meta-python/recipes-devtools/python/python3-passlib_1.6.5.bb
new file mode 100644
index 0000000..1271832
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-passlib_1.6.5.bb
@@ -0,0 +1,2 @@
+inherit pypi3
+require python-passlib.inc
\ No newline at end of file
-- 
1.9.1


