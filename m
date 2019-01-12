Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id DA3BC7C056
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jan 2019 21:31:33 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id e11so8354778plt.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jan 2019 13:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=b1E/wJ4G/p9934pso+K0aXRSzD8FncXQpmRVE2YO1GA=;
	b=N5l3M+I6krQYrt0q7PFu+K0rkwN5C35dfDvgVstzDkRemlzsYvzGL/HewBvw2soxnq
	n+m5HtaseRSYAFBH7UvdZY6unMCuT9Xe2Oc+d+fCXaHJdcB72pYKBJAPCZzqL2Q1+cKn
	WV7auBpuY6KN8aEPtRx21eynp0/pwGGMW6DoS89HCi1uugO/Y9JQBeJX9dRV9U6tD0il
	ysVyvK+d46M8vJKzUAJIJfqBcTx9cE2e/rzweKYOijujIL+rVB+sty9bQTy2An8ZJc8+
	6IaDt8S/nI/AaWSsfT0gp5U+VoxAcWq94LRhn7S4B4Pc2nhvaFnEDuqO02d9J9NSsRf1
	cCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=b1E/wJ4G/p9934pso+K0aXRSzD8FncXQpmRVE2YO1GA=;
	b=UrvAgybtDOaCiAEGTSbJUvHqKbWXb5SU+lVDeQrCZy1xXOzNnwFviG+weJl+Rd4TBO
	KgnzLW0qfMygpnRFc7oLROm/3KVAeQgZisDH8sdBnxdYw09gIoYNr7BsMEPUYGhgPjC1
	j0UqcyO62CzPwq8Q8jpa4CnJ1oWzBV4HwL5pXwQS3U6N28WG5AjeJFnMtjCsw3XiFY/s
	SyQgh6qn8SiEYHq5jZArXTzxsVZ2D7zXpLAeMHVhjueTcmFffn4ec9LTP5c+SvlRImZg
	q9cOBMMnhNfomSXHuOBaWLGnPr3IdU1ykUUbgXYz+m1dSbaakTH5L90rP5clWMV9GmXA
	by7A==
X-Gm-Message-State: AJcUukekQRcQMTWZDgQZ2yYFiRsbPoyv62ZzQqq0rEriw7N4NSkI73Hh
	uYP8nyr/0ppct/hZiE/woMw=
X-Google-Smtp-Source: ALg8bN5R1uxyp8H/wBw9cenvczULuNurV80RgWSsbigPK6hvZa9N3DkkLnqSTFfV/ivpUsU8RcK7jw==
X-Received: by 2002:a17:902:a83:: with SMTP id
	3mr18720960plp.276.1547328694829; 
	Sat, 12 Jan 2019 13:31:34 -0800 (PST)
Received: from pahoa2.kama-aina.net (c-67-181-203-136.hsd1.ca.comcast.net.
	[67.181.203.136]) by smtp.gmail.com with ESMTPSA id
	4sm134935166pfq.10.2019.01.12.13.31.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 12 Jan 2019 13:31:34 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat, 12 Jan 2019 13:31:25 -0800
Message-Id: <20190112213132.2501-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190112213132.2501-1-akuster808@gmail.com>
References: <20190112213132.2501-1-akuster808@gmail.com>
Subject: [PATCH 2/9] mete-perl: add pkg groups and image for testing
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
X-List-Received-Date: Sat, 12 Jan 2019 21:31:33 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-perl/images/meta-perl-base.bb     |  7 +++
 .../recipes-perl/images/meta-perl-image.bb    |  5 ++
 .../images/meta-perl-ptest-image.bb           |  5 ++
 .../packagegroups/packagegroup-meta-perl.bb   | 52 +++++++++++++++++++
 4 files changed, 69 insertions(+)
 create mode 100644 meta-perl/recipes-perl/images/meta-perl-base.bb
 create mode 100644 meta-perl/recipes-perl/images/meta-perl-image.bb
 create mode 100644 meta-perl/recipes-perl/images/meta-perl-ptest-image.bb
 create mode 100644 meta-perl/recipes-perl/packagegroups/packagegroup-meta-perl.bb

diff --git a/meta-perl/recipes-perl/images/meta-perl-base.bb b/meta-perl/recipes-perl/images/meta-perl-base.bb
new file mode 100644
index 0000000000..ec671020d8
--- /dev/null
+++ b/meta-perl/recipes-perl/images/meta-perl-base.bb
@@ -0,0 +1,7 @@
+SUMMARY = "meta-per build test image"
+
+IMAGE_INSTALL = "packagegroup-core-boot"
+
+LICENSE = "MIT"
+
+inherit core-image
diff --git a/meta-perl/recipes-perl/images/meta-perl-image.bb b/meta-perl/recipes-perl/images/meta-perl-image.bb
new file mode 100644
index 0000000000..c10d20a647
--- /dev/null
+++ b/meta-perl/recipes-perl/images/meta-perl-image.bb
@@ -0,0 +1,5 @@
+require  meta-perl-base.bb
+
+SUMMARY = "meta-perl build test image"
+
+IMAGE_INSTALL += "packagegroup-meta-perl"
diff --git a/meta-perl/recipes-perl/images/meta-perl-ptest-image.bb b/meta-perl/recipes-perl/images/meta-perl-ptest-image.bb
new file mode 100644
index 0000000000..3b776f814c
--- /dev/null
+++ b/meta-perl/recipes-perl/images/meta-perl-ptest-image.bb
@@ -0,0 +1,5 @@
+require  meta-perl-base.bb
+
+SUMMARY = "meta-perl build ptest image"
+
+IMAGE_INSTALL += "packagegroup-meta-perl-ptest"
diff --git a/meta-perl/recipes-perl/packagegroups/packagegroup-meta-perl.bb b/meta-perl/recipes-perl/packagegroups/packagegroup-meta-perl.bb
new file mode 100644
index 0000000000..9d0e33baf4
--- /dev/null
+++ b/meta-perl/recipes-perl/packagegroups/packagegroup-meta-perl.bb
@@ -0,0 +1,52 @@
+SUMMARY = "Meta-perl packagegroup"
+
+inherit packagegroup
+
+PROVIDES = "${PACKAGES}"
+PACKAGES = ' \
+    packagegroup-meta-perl \
+    packagegroup-meta-perl-extended \
+'
+
+RDEPENDS_packagegroup-meta-perl = "\
+    libproc-waitstat-perl libmoo-perl libterm-readkey-perl \
+    libunicode-linebreak-perl libcurses-perl libmime-types-perl \
+    libmime-charset-perl libio-socket-ssl-perl libio-stringy-perl \
+    libtext-iconv-perl libtext-charwidth-perl libtext-diff-perl \
+    libtext-wrapi18n-perl liblocale-gettext-perl libdata-hexdump-perl \
+    libextutils-installpaths-perl libextutils-helpers-perl libextutils-parsexs-perl \
+    libextutils-config-perl libextutils-cppguess-perl libimport-into-perl \
+    libcrypt-openssl-rsa-perl libcrypt-openssl-guess libcrypt-openssl-random-perl \
+    libxml-sax-writer-perl libxml-libxml-perl libxml-filter-buffertext-perl \
+    adduser \
+    libauthen-sasl-perl libnet-ldap-perl libnet-dns-perl \
+    libnet-dns-sec-perl libnet-libidn-perl libnet-ssleay-perl \
+    libnet-telnet-perl libdevel-globaldestruction-perl libipc-signal-perl \
+    librole-tiny-perl libencode-perl libencode-locale-perl \
+    libfile-slurp-perl libcapture-tiny-perl \
+    po4a \
+    libstrictures-perl libtest-harness-perl libsub-exporter-progressive-perl \
+    libclass-method-modifiers-perl libhtml-parser-perl libhtml-tree-perl \
+    libmodule-pluggable-perl libmodule-build-perl libmodule-runtime-perl \
+    libmodule-build-tiny-perl libcgi-perl libalgorithm-diff-perl \
+    libdbd-sqlite-perl libdigest-sha1-perl libdigest-hmac-perl \
+    " 
+
+RDEPENDS_packagegroup-meta-perl-extended = "\
+    logcheck mime-construct \
+    "
+
+RDEPENDS_packagegroup-meta-perl-ptest = "\
+    libmime-types-perl-ptest \
+    libio-socket-ssl-perl-ptest \
+    libdata-hexdump-perl-ptest \
+    libauthen-sasl-perl-ptest \
+    libnet-dns-perl-ptest \
+    libnet-dns-sec-perl-ptest \
+    libnet-ssleay-perl-ptest \
+    libtest-harness-perl-ptest \
+    libdigest-sha1-perl-ptest \
+    libdigest-hmac-perl-ptest \
+    "
+
+EXCLUDE_FROM_WORLD = "1"
-- 
2.17.1


