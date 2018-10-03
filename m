Return-Path: <31lq0WwMKAEEzdnjrrjoh.frp@flex--wak.bounces.google.com>
Received: from mail-qk1-f202.google.com (mail-qk1-f202.google.com
	[209.85.222.202])
	by mail.openembedded.org (Postfix) with ESMTP id 7B471745A6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Oct 2018 05:59:49 +0000 (UTC)
Received: by mail-qk1-f202.google.com with SMTP id z185-v6so2892809qkb.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Oct 2018 22:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=date:message-id:mime-version:subject:from:to:cc;
	bh=kdamJb6xXYN9Bpzv5arIM16JaqIMxfRGzAWQ4aUkpTk=;
	b=RtyCTttaFYkiM8qP1POBcw/RGZ5dYi0YP/ZWoaR2yGWxS9E1g5YX0+3PMKW+ctG0uZ
	toCGFF2CjfOXw6JNzJuNnw80c970Iiq6NjJn75xpn+tvGPjrFgkdU3kvOxHE0qwD08OZ
	xRegqX935xvgkZ67HYgm2mU3JNJjpIJ1ine/80xC4N7Bb/zI5cPgudJbC72ZGqxTRfTm
	7e7tE4sC2xxSI95CsNf5/O9tRlJbIlBR53LSYN9zrT3ByYqV8Rycy281qdf5ZrWGG+Cm
	9GoCOC/2LKIQ3z46J48ixDAndfYlxb42hHYuESMbK4bsxBPi0T9ZqTd9fnO7B0c/AeSR
	DHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
	bh=kdamJb6xXYN9Bpzv5arIM16JaqIMxfRGzAWQ4aUkpTk=;
	b=Uv/0/CmN5npNXjGOq5Pi2SL+fLMvwbE52aSvFQYICrQsBGOJgGbJC8m2u6+tPyYAUR
	9EZrul48xVhOM20AGOj2uLbQpK+7kSVYhEJLfeq3CgfV1hKhySbE/eGTSvxEXg+OAE+n
	w1w4/lYEyaKtnr4Jy3KOKH3+yBy6kzYOmHUKTyKp452W+hDRdJj3+sxUlAxCe6iv+Yby
	/aMdI1+oRbYjzC7MsaMpBuK1P54rVvgtfwmOGmUyh7r5/rfWXmHI2RZWg3NVqHwl/ZPS
	Sv/sDZvz4xbCPbh4IYfOslj1Wn4if2ZOCB2G37/oRHPBNbkrYbghe/3QRlVjxseJyQPQ
	j/Xg==
X-Gm-Message-State: ABuFfohs+338nOo0MVm8E3OF6GyXE4v6at+RHXfZfkiNwlFrSY+tWGME
	uDSCRCmpbk4hQUcOnI91F9RB96u7DgTeoCNqdOag0ifkkI+Z2WxLnbCgz+HVWmv2SC3i9g7rnKw
	MyYXQqCoRT/9oAPJDLOfBF23v5Pt4WvhTEVQDrd0hxOWGjL4WGY4MIcg8GYtNhUrv3KMZq5djwb
	Oa9XU=
X-Google-Smtp-Source: ACcGV607ySoDV8COuJiEWmSg83rxov4ymSHp8Y3Phgt5qUVEFZRA07ipGfwXwEMz5fnzbm6TECnRBQA=
X-Received: by 2002:ac8:396b:: with SMTP id
	t40-v6mr10322699qtb.16.1538546390438; 
	Tue, 02 Oct 2018 22:59:50 -0700 (PDT)
Date: Tue,  2 Oct 2018 22:59:41 -0700
Message-Id: <20181003055941.175426-1-wak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.19.0
From: "William A. Kennington III" <wak@google.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] cli11: Add recipe
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
X-List-Received-Date: Wed, 03 Oct 2018 05:59:49 -0000
Content-Type: text/plain; charset="UTF-8"

cli11 is a c++ command line parser library that provides a simple
user interface with modern c++ semantics.

Signed-off-by: William A. Kennington III <wak@google.com>
---
 meta-oe/recipes-support/cli11/cli11_1.6.1.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-support/cli11/cli11_1.6.1.bb

diff --git a/meta-oe/recipes-support/cli11/cli11_1.6.1.bb b/meta-oe/recipes-support/cli11/cli11_1.6.1.bb
new file mode 100644
index 000000000..2d231b98c
--- /dev/null
+++ b/meta-oe/recipes-support/cli11/cli11_1.6.1.bb
@@ -0,0 +1,19 @@
+SUMMARY = "C++11 command line parser"
+DESCRIPTION = "A command line parser for C++11 and beyond that provides a rich feature set with a simple and intuitive interface."
+HOMEPAGE = "https://github.com/CLIUtils/CLI11"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c271fee3ae28e11b24b97284d9f82887"
+SRCREV = "v${PV}"
+PV = "1.6.1"
+PR = "r1"
+
+SRC_URI += "git://github.com/CLIUtils/CLI11"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+EXTRA_OECMAKE_append += " \
+        -DCLI11_TESTING=OFF \
+        -DCLI11_EXAMPLES=OFF \
+        "
-- 
2.19.0


