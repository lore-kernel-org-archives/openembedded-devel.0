Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 59AFC6D3A2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 21:36:22 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id w73so5032684pfk.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 13:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=a+vSkvUHX+TcT9FUhxU7+SrGurpn2q6jT2RySMgy7BI=;
	b=CvH/nuECNDgeAjeica93X2GuJvB01pFtdf43Ql4mmPrbC5woxhcSENlgc3wUk0IxmY
	kHotD8CsXaGKpKcxNMbvpeW+ZicxhSk0LRDzLjnKN5Jjy+nweVzg0OkIymsyA2tMM+sQ
	v2eWH+rbdp3gr8NRAXHKZuG3A6yPlhXoIe8zrFffnGcja6b3bLEhsbA5fFcsV+PH+09j
	94g/goz53s6MS1/coF6jjJsjEelxLhPna+6eKbV1OTRYgPEw46ZvJEpnNYTi1OqIwHwx
	9y/UxIabVaCqFa48/jrJdh9R6k5+32Ku4Vk/W1HEN1KBqVAR3dQiPJ5mhEoBgmxdK1Uf
	YuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=a+vSkvUHX+TcT9FUhxU7+SrGurpn2q6jT2RySMgy7BI=;
	b=FKT2o9HBnI5MDSjVm34ukW/gNHn1npCvXmCmFB+pwAfr0XgjOUXvQrsTlSoKlk4O5Y
	+stgZrMfU5cSJVy3tJaaxoI8Sj2uUQgeyvix/DEiaqp7ErQ117YxlIcqvRZlUWFLOlJI
	RGYof5UAPdpKqUkscBCcFD3B6LeCB5QzFNodWQpYZpUa0klUk6Krf5X7aRPVraDfV9U1
	a7++Q7itKFHo+fsj6ydU7ELgk7vCEmr6+R4VZTLHI2f1JMNxTz0y7pey1Nob8MujXDNk
	fbFVEVLROlz+LEj2Cdr3qqBD32CKuJ9N8s1QHGpQgH9lMTqFyZEsnA3PFoXpaEvX2cL5
	I4Cg==
X-Gm-Message-State: AJcUukcIrIK9KzlT30yXwjT5OWx6BSHoSLgQu8Vsoskb5terhVOFuzvY
	JwC1XbTNX874YznC9C4R3h3QLOoAQZM=
X-Google-Smtp-Source: ALg8bN5Uv+p+/imWUTfkzxkIb532SJWFKnyzKFhSynMdO6VGcEFgtQDuzQiLZzuSSEOxVIp8tkTrNQ==
X-Received: by 2002:a63:c24c:: with SMTP id l12mr10351373pgg.146.1545600983093;
	Sun, 23 Dec 2018 13:36:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::19ec])
	by smtp.gmail.com with ESMTPSA id
	m9sm33340800pgd.32.2018.12.23.13.36.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Dec 2018 13:36:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2018 13:35:54 -0800
Message-Id: <20181223213557.7834-15-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181223213557.7834-1-raj.khem@gmail.com>
References: <20181223213557.7834-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 15/18] python-grpcio: Upgrade to 1.17.1
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
X-List-Received-Date: Sun, 23 Dec 2018 21:36:22 -0000
Content-Transfer-Encoding: 8bit

Patch to fix ppc build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Tim "moto-timo" Orling <TicoTimo@gmail.com>
Cc: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-grpcio.inc   | 10 ++++++----
 .../python-grpcio/ppc-boringssl-support.patch   | 17 +++++++++++++++++
 ...grpcio_1.14.1.bb => python-grpcio_1.17.1.bb} |  0
 ...rpcio_1.14.1.bb => python3-grpcio_1.17.1.bb} |  0
 4 files changed, 23 insertions(+), 4 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-grpcio/ppc-boringssl-support.patch
 rename meta-python/recipes-devtools/python/{python-grpcio_1.14.1.bb => python-grpcio_1.17.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.14.1.bb => python3-grpcio_1.17.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-grpcio.inc b/meta-python/recipes-devtools/python/python-grpcio.inc
index 23d25f7aa5..0cef0dda02 100644
--- a/meta-python/recipes-devtools/python/python-grpcio.inc
+++ b/meta-python/recipes-devtools/python/python-grpcio.inc
@@ -5,7 +5,10 @@ SECTION = "devel/python"
 DEPENDS_append = "${PYTHON_PN}-protobuf"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/python-grpcio:"
-SRC_URI_append_class-target = " file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch "
+
+SRC_URI_append_class-target = " file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
+                                file://ppc-boringssl-support.patch \
+"
 
 RDEPENDS_${PN} = "${PYTHON_PN}-protobuf \
                   ${PYTHON_PN}-setuptools \
@@ -16,9 +19,8 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
 
 inherit pypi
-
-SRC_URI[md5sum] = "0987ae2e47b5103de3cacc437874a3c5"
-SRC_URI[sha256sum] = "4bf23666e763ca7ff6010465864e9f088f4ac7ecc1e11abd6f85b250e66b2c05"
+SRC_URI[md5sum] = "dd46d7270dfce713c03f45fae999cae3"
+SRC_URI[sha256sum] = "fd6774bbb6c717f725b39394757445ead4f69c471118364933aadb81a4f16961"
 
 CLEANBROKEN = "1"
 
diff --git a/meta-python/recipes-devtools/python/python-grpcio/ppc-boringssl-support.patch b/meta-python/recipes-devtools/python/python-grpcio/ppc-boringssl-support.patch
new file mode 100644
index 0000000000..6435abbe6d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-grpcio/ppc-boringssl-support.patch
@@ -0,0 +1,17 @@
+Let boringSSL compile on ppc32 bit
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/third_party/boringssl/include/openssl/base.h
++++ b/third_party/boringssl/include/openssl/base.h
+@@ -95,6 +95,9 @@ extern "C" {
+ #elif (defined(__PPC64__) || defined(__powerpc64__)) && defined(_LITTLE_ENDIAN)
+ #define OPENSSL_64_BIT
+ #define OPENSSL_PPC64LE
++#elif (defined(__PPC__) || defined(__powerpc__))
++#define OPENSSL_32_BIT
++#define OPENSSL_PPC
+ #elif defined(__mips__) && !defined(__LP64__)
+ #define OPENSSL_32_BIT
+ #define OPENSSL_MIPS
diff --git a/meta-python/recipes-devtools/python/python-grpcio_1.14.1.bb b/meta-python/recipes-devtools/python/python-grpcio_1.17.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-grpcio_1.14.1.bb
rename to meta-python/recipes-devtools/python/python-grpcio_1.17.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.14.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.17.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.14.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.17.1.bb
-- 
2.20.1


