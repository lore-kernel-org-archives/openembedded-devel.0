Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id 834746C4E6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2019 05:29:20 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id y126so10881900pfb.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jan 2019 21:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=GBzTrBH4FF7rhL19QixonlpOXA9Olpozw4aeAX5xx88=;
	b=SQTrzgaVTLGHiI+DbBbfNxV3eIZsfQgpdtKoBH7NyykP8R1l/urE+mxHeZVcBRlciv
	UI7sobV4fn52iM332y/mSK90mPhgWpuXkXjQE41NarPSThqkz3GDUA30RkuZrtjDMsf7
	ggkiPeJ8JU8o7W6BR3JoUxUfYPJThSZPcuUhv++BobdIqveuvWeA9FhDDY9QQMGVnuDp
	X5t4LR4Y/xnmNqG7BtZgKVHCsUQwjcOXoQRStCv7hBC8eJwG8vo7z6bqnaegHT1jVAx9
	OTHZTl+tR+i47PRvr/nE0IJvuP9oPIefS6P5r5NxB7OM1GkjcMKsmXMSq28xEdnwyfqN
	+/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GBzTrBH4FF7rhL19QixonlpOXA9Olpozw4aeAX5xx88=;
	b=l1xUnqZRsgyimCI2Mx7RghrpMKz5og5/0rq6KZ+SLO6zb4CudmaQwdSir9Yi2XiZQW
	ziQFORvcPHi8GmQQi6G4GJ5E+wZRvcm6mC9/Ye0VNsv1ChBZezYiio2xFkaCM3pumo7W
	dsLj3pYZ4q3WTI70I0aPLa/rPwxo2OHCGgU9dXYvlyh6DTYXQ/IIm1UQDL5UTF/uSV16
	5vE/XWd6/rUwOY+x6dpItnErNeehvVZXYg4J/wif4w7UpQwHsUoBG9pu2eqttnZdpfXN
	HftUdW0eZbY0MNcWCBFiaNk0UaoNdhwRUXbZ+m8DeZgDBIJ4tWv6djV2UWQGtcZ8IMaZ
	A+kA==
X-Gm-Message-State: AJcUukdVrSQlxLy0dR7YNZ4Dk1hW+6fC3NCWBbwE3baJL991DjQe92Az
	lAOHMqKwuLJfjO2ASSkzll/0ycRBW9s=
X-Google-Smtp-Source: ALg8bN4pBXYV81P1JMhWLEJMKsUQP06kQHp51N602rBwM6o3Z2TJzccZ8BJYtbgXFWNgCFQb1F81xQ==
X-Received: by 2002:a63:d005:: with SMTP id z5mr26265589pgf.64.1548826161083; 
	Tue, 29 Jan 2019 21:29:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::26b6])
	by smtp.gmail.com with ESMTPSA id
	v190sm652633pfv.26.2019.01.29.21.29.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Jan 2019 21:29:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Jan 2019 21:29:05 -0800
Message-Id: <20190130052911.36336-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190130052911.36336-1-raj.khem@gmail.com>
References: <20190130052911.36336-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/8] mosh: Upgrade to 1.3.2
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
X-List-Received-Date: Wed, 30 Jan 2019 05:29:20 -0000
Content-Transfer-Encoding: 8bit

Fix building with clang/libc++ while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mosh/0001-Fix-building-with-libc.patch    | 24 +++++++++++++++++++
 .../mosh/{mosh_1.3.0.bb => mosh_1.3.2.bb}     |  8 ++++---
 2 files changed, 29 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/mosh/mosh/0001-Fix-building-with-libc.patch
 rename meta-oe/recipes-connectivity/mosh/{mosh_1.3.0.bb => mosh_1.3.2.bb} (87%)

diff --git a/meta-oe/recipes-connectivity/mosh/mosh/0001-Fix-building-with-libc.patch b/meta-oe/recipes-connectivity/mosh/mosh/0001-Fix-building-with-libc.patch
new file mode 100644
index 0000000000..100ede17bd
--- /dev/null
+++ b/meta-oe/recipes-connectivity/mosh/mosh/0001-Fix-building-with-libc.patch
@@ -0,0 +1,24 @@
+From efa9e49714b30d7d9128946a2504c93e10d109b5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 29 Jan 2019 12:20:03 -0800
+Subject: [PATCH] Fix building with libc++
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/network/network.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/network/network.cc b/src/network/network.cc
+index 26da603..e480853 100644
+--- a/src/network/network.cc
++++ b/src/network/network.cc
+@@ -335,7 +335,7 @@ bool Connection::try_bind( const char *addr, int port_low, int port_high )
+       }
+     }
+ 
+-    if ( bind( sock(), &local_addr.sa, local_addr_len ) == 0 ) {
++    if ( ::bind( sock(), &local_addr.sa, local_addr_len ) == 0 ) {
+       set_MTU( local_addr.sa.sa_family );
+       return true;
+     } else if ( i == search_high ) { /* last port to search */
diff --git a/meta-oe/recipes-connectivity/mosh/mosh_1.3.0.bb b/meta-oe/recipes-connectivity/mosh/mosh_1.3.2.bb
similarity index 87%
rename from meta-oe/recipes-connectivity/mosh/mosh_1.3.0.bb
rename to meta-oe/recipes-connectivity/mosh/mosh_1.3.2.bb
index 9fc8435ee6..9c439354d1 100644
--- a/meta-oe/recipes-connectivity/mosh/mosh_1.3.0.bb
+++ b/meta-oe/recipes-connectivity/mosh/mosh_1.3.2.bb
@@ -14,9 +14,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = "protobuf-native protobuf ncurses zlib libio-pty-perl openssl libutempter"
 
-SRC_URI = "http://mosh.mit.edu/mosh-${PV}.tar.gz"
-SRC_URI[md5sum] = "d961276995936953bf2d5a794068b076"
-SRC_URI[sha256sum] = "320e12f461e55d71566597976bd9440ba6c5265fa68fbf614c6f1c8401f93376"
+SRC_URI = "http://mosh.mit.edu/mosh-${PV}.tar.gz \
+           file://0001-Fix-building-with-libc.patch \
+           "
+SRC_URI[md5sum] = "5122f4d2b973ab7c38dcdac8c35cb61e"
+SRC_URI[sha256sum] = "da600573dfa827d88ce114e0fed30210689381bbdcff543c931e4d6a2e851216"
 
 inherit autotools pkgconfig
 
-- 
2.20.1


