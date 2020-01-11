Return-Path: <brgl@bgdev.pl>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 13B1A7FD05
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Jan 2020 18:19:29 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id f129so5286609wmf.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Jan 2020 10:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=a7WENy2SafKCLfFtcN7J5MWs920paruw+3iBrjb9u7k=;
	b=Mm7sgfjsEyDd7LhscTcjLBuuqsumdusWb8voAGwC+t0WWNc8DbWyqw4ZN2+QTYUiLJ
	FBE4y3X/uOvDX3Yby7efsXrRm29Qm42yjfYsFM9qlSmj6M3Un7SUseE38CR3LtMFFTAB
	+MIp7oL5BoYRTjOeWWIDf+4j1XigIYN3KqdPZrvrWWX3Jn0+ZU4vp44rArw7HaSQvYJ7
	lSg8RXGeukRP3yGprJipZ6h+1YZlr+krOj86wyDL3ENmvzwS9VnDajDoBOaTopDZ9fES
	RYEgk/f3bbp912oXih8N2pWf3Z5dFMjS2VKxYeqfkQKDkkEbV6fgXbCmK9XEuRHYTFaV
	9mYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=a7WENy2SafKCLfFtcN7J5MWs920paruw+3iBrjb9u7k=;
	b=eiBPSEhVxjGkfCUKHHEoc8L0WCzFzB2R7nHfsaBfatxvKaGoyvGirDsRmdMWUbiB+Z
	Fr476ld5luFwHyjVcilav17e9vwnMfQgHaTyiXdBJWWfTl5jCuu6cagdgHMNWXxCOABY
	fnATHvQN3FDSvjGUa+YyVW3fA1v70TW9JIzpEXfchsZhGa2GJ2oCd5AkIJmzVCbrHHF0
	d4PXCACMWD1xVPWVd+2ChFcZWF910A/gzOeF/+HEaWuYlLKaQK2tc9FEoCLt/l6lShY8
	YBJctv5ura3u9rkZynsNCXAkLyM4rw77ltBrRjWw1j5unstV5xsHGtqBqpR1CbzHkdal
	eqkw==
X-Gm-Message-State: APjAAAUup8IWaBPLsj7+pKbPjdG0RZzgnMkV7oYxxZI2UArSDwZUAKcm
	WGGzHNW13MSZOWOaRJ8BkWZdpg==
X-Google-Smtp-Source: APXvYqwvIqJizqD64h6RQiTtFn7I9WtQ7E79SOLSyqWLmV6vaZKuNFIdaQZSJhkZKxgEw5dpMVJFhg==
X-Received: by 2002:a1c:4144:: with SMTP id o65mr11358155wma.81.1578766770451; 
	Sat, 11 Jan 2020 10:19:30 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
	by smtp.gmail.com with ESMTPSA id
	d12sm7586761wrp.62.2020.01.11.10.19.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 11 Jan 2020 10:19:29 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>, Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Sat, 11 Jan 2020 19:19:22 +0100
Message-Id: <20200111181922.15956-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-oe][PATCH] cloc: new package
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
X-List-Received-Date: Sat, 11 Jan 2020 18:19:30 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This adds a recipe for cloc - a command-line tool for counting lines
of code.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 meta-oe/recipes-devtools/cloc/cloc_1.84.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/cloc/cloc_1.84.bb

diff --git a/meta-oe/recipes-devtools/cloc/cloc_1.84.bb b/meta-oe/recipes-devtools/cloc/cloc_1.84.bb
new file mode 100644
index 000000000..f9ecd0ee4
--- /dev/null
+++ b/meta-oe/recipes-devtools/cloc/cloc_1.84.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Count blank lines, comment lines, and physical lines of source code \
+in many programming languages."
+AUTHOR = "Al Danial"
+
+LICENSE="GPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2c1c00f9d3ed9e24fa69b932b7e7aff2"
+
+SRC_URI = "https://github.com/AlDanial/cloc/releases/download/${PV}/${BP}.tar.gz"
+SRC_URI[md5sum] = "a52f3843825377cfa4e4b3b30a567ab4"
+SRC_URI[sha256sum] = "c3f0a6bd2319110418ccb3e55a7a1b6d0edfd7528bfd2ae5d530938abe90f254"
+
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+
+do_install() {
+    install -D -m 0755 ${S}/cloc ${D}${bindir}/cloc
+}
+
+RDEPENDS_${PN} = "perl perl-modules"
-- 
2.23.0


