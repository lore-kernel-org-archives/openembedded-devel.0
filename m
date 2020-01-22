Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 93EDF7FC1B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 06:38:24 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id x184so2862490pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 22:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ATwYUpD90egiFz8b0dyk1CUy5iKoCCWme5Ael7bujIQ=;
	b=FTqbVYklLxWoCINvQsU1RohaJNva6ZDbwo5olJ9KzcbpKrpGFEnS5JHaChcAm7nY5m
	eL3oKSN46Y0bmL0WlP86PCyi2mbTPGFH7rhqeAsRcBoNqYHM25uL1psV2m5+T2qmDjZt
	d293PLG75qW+F61qN+gwpUvUen1MruhCdjN/3oyBaxnA1bgililSDVIwQyYAJtZNZwCS
	p+q6jf1Ybz1hYj04cgbFx3o4SLsbsoEKhfGMPK6EQXiDVaCcppNrnSPZ6mlEmyzTES8U
	HWKTerHmaRt7rz59q8XOg/Bq0aieeTmy8EPwyYYkMEnlcvWhcN611Lh7FsW3gCB0zxg8
	YC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ATwYUpD90egiFz8b0dyk1CUy5iKoCCWme5Ael7bujIQ=;
	b=puzRwnFHgUpHlWlaQywM/NSQK/ZwyBWsV0JMW1eVgHw4uDQy0gwyWN/hsGm9ifRSSZ
	sV1DwrrzrgczoO4eOQoqLeukw4ku4DLAhOvKhQv087z2zAXkElltsD69Qu4yODA9ATyK
	wceIvAFmlcp9xZ7ct4W1/Ha0bdgWZhcDAz3ynfoVj4Alal8tOSmWRRvvTGhhTNlWAMCC
	MIQz6Ry1Yz9qp8dmI7/8dGYb0CZBOZjHMnmwwKJTBydVumJ9iXXfaUZLs8kuQarJWf1o
	PWOgfagK2bdmZNnNfgqJMrlKnpgHyxrz+O2r8BiRF7e4B5ppCrdgIdbssEvds+OwrhHH
	17rg==
X-Gm-Message-State: APjAAAXog6Upa838EpCWmBhTuiprYgZDIAo8c5W+82oJlMH19CQwZHCr
	4quUHVHxonnUqg46JH6UMYDIuXS1jw8=
X-Google-Smtp-Source: APXvYqxlOOEb6RJvL3WDNy6bv2/XTjVXHaMF7h/aO6ItXX1ufGdW9s3+CO3IeSx1DsrIzW5GQzRSfQ==
X-Received: by 2002:aa7:9567:: with SMTP id x7mr1235991pfq.133.1579675104991; 
	Tue, 21 Jan 2020 22:38:24 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	100sm1600283pjo.17.2020.01.21.22.38.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 22:38:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Jan 2020 22:38:13 -0800
Message-Id: <20200122063823.242098-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122063823.242098-1-raj.khem@gmail.com>
References: <20200122063823.242098-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 02/12] crda: Fix build with python3
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
X-List-Received-Date: Wed, 22 Jan 2020 06:38:24 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../crda/crda/crda-4.14-python-3.patch        | 101 ++++++++++++++++++
 .../recipes-connectivity/crda/crda_3.18.bb    |   3 +-
 2 files changed, 103 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-connectivity/crda/crda/crda-4.14-python-3.patch

diff --git a/meta-networking/recipes-connectivity/crda/crda/crda-4.14-python-3.patch b/meta-networking/recipes-connectivity/crda/crda/crda-4.14-python-3.patch
new file mode 100644
index 0000000000..9125d0ab97
--- /dev/null
+++ b/meta-networking/recipes-connectivity/crda/crda/crda-4.14-python-3.patch
@@ -0,0 +1,101 @@
+Imported from Gentoo
+https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=9c50acec16bc7c33d6dc122c007d713e7fbecf9c
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/utils/key2pub.py
++++ b/utils/key2pub.py
+@@ -1,22 +1,22 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ 
+ import sys
+ try:
+        from M2Crypto import RSA
+-except ImportError, e:
++except ImportError as e:
+        sys.stderr.write('ERROR: Failed to import the "M2Crypto" module: %s\n' % e.message)
+        sys.stderr.write('Please install the "M2Crypto" Python module.\n')
+        sys.stderr.write('On Debian GNU/Linux the package is called "python-m2crypto".\n')
+        sys.exit(1)
+ 
+ def print_ssl_64(output, name, val):
+-    while val[0] == '\0':
++    while val[0:1] == b'\0':
+         val = val[1:]
+     while len(val) % 8:
+-        val = '\0' + val
++        val = b'\0' + val
+     vnew = []
+     while len(val):
+-        vnew.append((val[0], val[1], val[2], val[3], val[4], val[5], val[6], val[7]))
++        vnew.append((val[0:1], val[1:2], val[2:3], val[3:4], val[4:5], val[5:6], val[6:7], val[7:8]))
+         val = val[8:]
+     vnew.reverse()
+     output.write('static BN_ULONG %s[%d] = {\n' % (name, len(vnew)))
+@@ -34,13 +34,13 @@ def print_ssl_64(output, name, val):
+     output.write('};\n\n')
+ 
+ def print_ssl_32(output, name, val):
+-    while val[0] == '\0':
++    while val[0:1] == b'\0':
+         val = val[1:]
+     while len(val) % 4:
+-        val = '\0' + val
++        val = b'\0' + val
+     vnew = []
+     while len(val):
+-        vnew.append((val[0], val[1], val[2], val[3], ))
++        vnew.append((val[0:1], val[1:2], val[2:3], val[3:4]))
+         val = val[4:]
+     vnew.reverse()
+     output.write('static BN_ULONG %s[%d] = {\n' % (name, len(vnew)))
+@@ -81,21 +81,21 @@ struct pubkey {
+ 
+ static struct pubkey keys[] __attribute__((unused))= {
+ ''')
+-    for n in xrange(n + 1):
++    for n in range(n + 1):
+         output.write('	KEYS(e_%d, n_%d),\n' % (n, n))
+     output.write('};\n')
+     pass
+ 
+ def print_gcrypt(output, name, val):
+     output.write('#include <stdint.h>\n')
+-    while val[0] == '\0':
++    while val[0:1] == b'\0':
+         val = val[1:]
+     output.write('static const uint8_t %s[%d] = {\n' % (name, len(val)))
+     idx = 0
+     for v in val:
+         if not idx:
+             output.write('\t')
+-        output.write('0x%.2x, ' % ord(v))
++        output.write('0x%.2x, ' % (v if sys.version_info[0] >=3 else ord(v)))
+         idx += 1
+         if idx == 8:
+             idx = 0
+@@ -118,7 +118,7 @@ struct key_params {
+ 
+ static const struct key_params keys[] __attribute__((unused))= {
+ ''')
+-    for n in xrange(n + 1):
++    for n in range(n + 1):
+         output.write('	KEYS(e_%d, n_%d),\n' % (n, n))
+     output.write('};\n')
+     
+@@ -136,7 +136,7 @@ except IndexError:
+     mode = None
+ 
+ if not mode in modes:
+-    print 'Usage: %s [%s] input-file... output-file' % (sys.argv[0], '|'.join(modes.keys()))
++    print('Usage: %s [%s] input-file... output-file' % (sys.argv[0], '|'.join(modes.keys())))
+     sys.exit(2)
+ 
+ output = open(outfile, 'w')
+@@ -154,3 +154,5 @@ for f in files:
+     idx += 1
+ 
+ modes[mode][1](output, idx - 1)
++
++output.close()
diff --git a/meta-networking/recipes-connectivity/crda/crda_3.18.bb b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
index d3c00424db..b380eaf94e 100644
--- a/meta-networking/recipes-connectivity/crda/crda_3.18.bb
+++ b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
@@ -4,7 +4,7 @@ SECTION = "net"
 LICENSE = "copyleft-next-0.3.0"
 LIC_FILES_CHKSUM = "file://copyleft-next-0.3.0;md5=8743a2c359037d4d329a31e79eabeffe"
 
-DEPENDS = "python-m2crypto-native python-typing-native python-native libnl libgcrypt"
+DEPENDS = "python3-m2crypto-native libnl libgcrypt"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz \
            file://do-not-run-ldconfig-if-destdir-is-set.patch \
@@ -14,6 +14,7 @@ SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz \
            file://make.patch \
            file://use-target-word-size-instead-of-host-s.patch \
            file://fix-issues-when-USE_OPENSSL-1.patch \
+           file://crda-4.14-python-3.patch \
 "
 SRC_URI[md5sum] = "0431fef3067bf503dfb464069f06163a"
 SRC_URI[sha256sum] = "43fcb9679f8b75ed87ad10944a506292def13e4afb194afa7aa921b01e8ecdbf"
-- 
2.25.0


