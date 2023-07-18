Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6AF4C001B0
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 00:21:54 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.718.1689639712473731432
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 17:21:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=r24wlPe9;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-c5ffb6cda23so5145187276.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Jul 2023 17:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689639711; x=1692231711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UsomGm3rVytEmO2P9+fKftS/4SDHI9rPHErg4aioIis=;
        b=r24wlPe9Aa71J4kyQFlqU88IHy8FXzG6+/nTGlTvBTdEENpJLALPnp9iPg7+imBMjd
         HhuNqNzeNJef3V9knza31Hd64UEJ0jKBGUyh5pyzbR07GF8+7pUl9B1nfEDu4tGrUGql
         DDITAyzFIeYhe+hwD5Zi74y0SKF/wk/qp1wPcEX3O8A/SgvF1m4dd96Izy9ZSH+doLwZ
         2yqTiie4ntBdCsQPDkBUL4Kuz2T5zh4N8QwcHYnp819zQgFR0SlD5FAuCam636+VXMuT
         y3aapmhKnom1BH8n94/L0vmDvoCkTt8vIh6QEIQ95/JHgpgD31yGH0hkfoLRBy11H78+
         E/IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689639711; x=1692231711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UsomGm3rVytEmO2P9+fKftS/4SDHI9rPHErg4aioIis=;
        b=lMfHKfPshctT257jRNRPyMR6AETkIkz/Mnm2nQlIXaXU2VEz4GfLdkfWIpfVnnJug1
         1tFSaRKRAu6AjSpExc1mZy/G89ecYKCsZi9xtErpFgiQmHPLTKYLH4/nQU8USACnsK4r
         sLsakdn4y9V3PctpALwgRPHPI4mqJFaRUFP4NUEVoKqpi+GZFyu4wcCiHanaRVx6BuMN
         Yo3OxFszJskQ+Zg0xyqGVUGRe3/mDcTvR0sPyoxEdZ/f7fAZermUqskRxqMbRfjkCg0F
         4huoxS6JEjJx82MadfXMhGLLHiL0m7munZkEBfgq1udIj7LMXXMghGVzyiOdCIQ8OR9r
         Te3w==
X-Gm-Message-State: ABy/qLYlXRAHvoq+PPrXxZWblKZbhpY5l67TKPkmoZohwburc1ptTX1y
	Y6SasGtT8XXtuolGjtNwFieEAFHwOsE=
X-Google-Smtp-Source: APBJJlEFWIG9ILdS9eGPCliPjEkDQbSfwzYdhjYAp85B6ubl81eqafsov3gIi4L6vHgXQGDO1FprgQ==
X-Received: by 2002:a05:6902:89:b0:bd0:8e5:d548 with SMTP id h9-20020a056902008900b00bd008e5d548mr11158944ybs.39.1689639711031;
        Mon, 17 Jul 2023 17:21:51 -0700 (PDT)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:6e92:5d66:981a:9de1])
        by smtp.gmail.com with ESMTPSA id h132-20020a25218a000000b00caec634aaeasm188868ybh.50.2023.07.17.17.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 17:21:50 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][dunfell][PATCH 1/2] libb64: Add recipe
Date: Mon, 17 Jul 2023 20:21:47 -0400
Message-Id: <20230718002148.407319-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 00:21:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103890

From: Khem Raj <raj.khem@gmail.com>

Add Base64 encode/decode library, some packages e.g. sysdig can benefit
from it

Disable parallel make as it races at times
make[1]: *** No rule to make target 'libb64.a', needed by 'c-example1'.  Stop.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6946f40707ed43426cd05ada1933e4867c7f6d4f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0001-example-Do-not-run-the-tests.patch   | 27 +++++++
 .../0002-use-BUFSIZ-as-buffer-size.patch      | 57 ++++++++++++++
 .../libb64/0003-fix-integer-overflows.patch   | 77 +++++++++++++++++++
 .../libb64/0004-Fix-off-by-one-error.patch    | 26 +++++++
 ...0005-make-overriding-CFLAGS-possible.patch | 40 ++++++++++
 ...t-export-the-CHARS_PER_LINE-variable.patch | 27 +++++++
 ...er-decoder-state-in-the-constructors.patch | 44 +++++++++++
 .../recipes-support/libb64/libb64_1.2.1.bb    | 39 ++++++++++
 8 files changed, 337 insertions(+)
 create mode 100644 meta-oe/recipes-support/libb64/libb64/0001-example-Do-not-run-the-tests.patch
 create mode 100644 meta-oe/recipes-support/libb64/libb64/0002-use-BUFSIZ-as-buffer-size.patch
 create mode 100644 meta-oe/recipes-support/libb64/libb64/0003-fix-integer-overflows.patch
 create mode 100644 meta-oe/recipes-support/libb64/libb64/0004-Fix-off-by-one-error.patch
 create mode 100644 meta-oe/recipes-support/libb64/libb64/0005-make-overriding-CFLAGS-possible.patch
 create mode 100644 meta-oe/recipes-support/libb64/libb64/0006-do-not-export-the-CHARS_PER_LINE-variable.patch
 create mode 100644 meta-oe/recipes-support/libb64/libb64/0007-initialize-encoder-decoder-state-in-the-constructors.patch
 create mode 100644 meta-oe/recipes-support/libb64/libb64_1.2.1.bb

diff --git a/meta-oe/recipes-support/libb64/libb64/0001-example-Do-not-run-the-tests.patch b/meta-oe/recipes-support/libb64/libb64/0001-example-Do-not-run-the-tests.patch
new file mode 100644
index 0000000000..ea3ddfb64b
--- /dev/null
+++ b/meta-oe/recipes-support/libb64/libb64/0001-example-Do-not-run-the-tests.patch
@@ -0,0 +1,27 @@
+From 68f66d1583be670eb8d5f3f38dbd5dd1d63b733c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 27 Mar 2021 21:41:04 -0700
+Subject: [PATCH] example: Do not run the tests
+
+Upstream-Status: Inappropritate [Cross-compile specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ examples/Makefile | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/examples/Makefile b/examples/Makefile
+index d9667a5..554b346 100644
+--- a/examples/Makefile
++++ b/examples/Makefile
+@@ -33,11 +33,8 @@ depend: $(SOURCES)
+ 	makedepend -f- $(CFLAGS) $(SOURCES) 2> /dev/null 1> depend
+ 
+ test-c-example1: c-example1
+-	./c-example1
+ 
+ test-c-example2: c-example2
+-	./c-example2 loremgibson.txt encoded.txt decoded.txt
+-	diff -q loremgibson.txt decoded.txt
+ 
+ test: test-c-example1 test-c-example2
+ 
diff --git a/meta-oe/recipes-support/libb64/libb64/0002-use-BUFSIZ-as-buffer-size.patch b/meta-oe/recipes-support/libb64/libb64/0002-use-BUFSIZ-as-buffer-size.patch
new file mode 100644
index 0000000000..10ec8e14a8
--- /dev/null
+++ b/meta-oe/recipes-support/libb64/libb64/0002-use-BUFSIZ-as-buffer-size.patch
@@ -0,0 +1,57 @@
+From ee03e265804a07a0da5028b86960031bd7ab86b2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 27 Mar 2021 22:01:13 -0700
+Subject: [PATCH] use BUFSIZ as buffer size
+
+Author: Jakub Wilk <jwilk@debian.org>
+Bug: http://sourceforge.net/tracker/?func=detail&atid=785907&aid=3591336&group_id=152942
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/b64/decode.h | 3 ++-
+ include/b64/encode.h | 3 ++-
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/include/b64/decode.h b/include/b64/decode.h
+index 12b16ea..e9019f3 100644
+--- a/include/b64/decode.h
++++ b/include/b64/decode.h
+@@ -8,6 +8,7 @@ For details, see http://sourceforge.net/projects/libb64
+ #ifndef BASE64_DECODE_H
+ #define BASE64_DECODE_H
+ 
++#include <cstdio>
+ #include <iostream>
+ 
+ namespace base64
+@@ -22,7 +23,7 @@ namespace base64
+ 		base64_decodestate _state;
+ 		int _buffersize;
+ 
+-		decoder(int buffersize_in = BUFFERSIZE)
++		decoder(int buffersize_in = BUFSIZ)
+ 		: _buffersize(buffersize_in)
+ 		{}
+ 
+diff --git a/include/b64/encode.h b/include/b64/encode.h
+index 5d807d9..e7a7035 100644
+--- a/include/b64/encode.h
++++ b/include/b64/encode.h
+@@ -8,6 +8,7 @@ For details, see http://sourceforge.net/projects/libb64
+ #ifndef BASE64_ENCODE_H
+ #define BASE64_ENCODE_H
+ 
++#include <cstdio>
+ #include <iostream>
+ 
+ namespace base64
+@@ -22,7 +23,7 @@ namespace base64
+ 		base64_encodestate _state;
+ 		int _buffersize;
+ 
+-		encoder(int buffersize_in = BUFFERSIZE)
++		encoder(int buffersize_in = BUFSIZ)
+ 		: _buffersize(buffersize_in)
+ 		{}
+ 
diff --git a/meta-oe/recipes-support/libb64/libb64/0003-fix-integer-overflows.patch b/meta-oe/recipes-support/libb64/libb64/0003-fix-integer-overflows.patch
new file mode 100644
index 0000000000..8854bb6af4
--- /dev/null
+++ b/meta-oe/recipes-support/libb64/libb64/0003-fix-integer-overflows.patch
@@ -0,0 +1,77 @@
+From 7b30fbc3d47dfaf38d8ce8b8949a69d2984dac76 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 27 Mar 2021 22:06:03 -0700
+Subject: [PATCH] fix integer overflows
+
+Author: Jakub Wilk <jwilk@debian.org>
+Bug: http://sourceforge.net/tracker/?func=detail&aid=3591129&group_id=152942&atid=785907
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/cdecode.c | 15 ++++++++-------
+ 1 file changed, 8 insertions(+), 7 deletions(-)
+
+diff --git a/src/cdecode.c b/src/cdecode.c
+index a6c0a42..4e47e9f 100644
+--- a/src/cdecode.c
++++ b/src/cdecode.c
+@@ -9,10 +9,11 @@ For details, see http://sourceforge.net/projects/libb64
+ 
+ int base64_decode_value(char value_in)
+ {
+-	static const char decoding[] = {62,-1,-1,-1,63,52,53,54,55,56,57,58,59,60,61,-1,-1,-1,-2,-1,-1,-1,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,-1,-1,-1,-1,-1,-1,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51};
++	static const signed char decoding[] = {62,-1,-1,-1,63,52,53,54,55,56,57,58,59,60,61,-1,-1,-1,-2,-1,-1,-1,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,-1,-1,-1,-1,-1,-1,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51};
+ 	static const char decoding_size = sizeof(decoding);
++	if (value_in < 43) return -1;
+ 	value_in -= 43;
+-	if (value_in < 0 || value_in >= decoding_size) return -1;
++	if (value_in > decoding_size) return -1;
+ 	return decoding[(int)value_in];
+ }
+ 
+@@ -26,7 +27,7 @@ int base64_decode_block(const char* code_in, const int length_in, char* plaintex
+ {
+ 	const char* codechar = code_in;
+ 	char* plainchar = plaintext_out;
+-	char fragment;
++	int fragment;
+ 	
+ 	*plainchar = state_in->plainchar;
+ 	
+@@ -42,7 +43,7 @@ int base64_decode_block(const char* code_in, const int length_in, char* plaintex
+ 					state_in->plainchar = *plainchar;
+ 					return plainchar - plaintext_out;
+ 				}
+-				fragment = (char)base64_decode_value(*codechar++);
++				fragment = base64_decode_value(*codechar++);
+ 			} while (fragment < 0);
+ 			*plainchar    = (fragment & 0x03f) << 2;
+ 	case step_b:
+@@ -53,7 +54,7 @@ int base64_decode_block(const char* code_in, const int length_in, char* plaintex
+ 					state_in->plainchar = *plainchar;
+ 					return plainchar - plaintext_out;
+ 				}
+-				fragment = (char)base64_decode_value(*codechar++);
++				fragment = base64_decode_value(*codechar++);
+ 			} while (fragment < 0);
+ 			*plainchar++ |= (fragment & 0x030) >> 4;
+ 			*plainchar    = (fragment & 0x00f) << 4;
+@@ -65,7 +66,7 @@ int base64_decode_block(const char* code_in, const int length_in, char* plaintex
+ 					state_in->plainchar = *plainchar;
+ 					return plainchar - plaintext_out;
+ 				}
+-				fragment = (char)base64_decode_value(*codechar++);
++				fragment = base64_decode_value(*codechar++);
+ 			} while (fragment < 0);
+ 			*plainchar++ |= (fragment & 0x03c) >> 2;
+ 			*plainchar    = (fragment & 0x003) << 6;
+@@ -77,7 +78,7 @@ int base64_decode_block(const char* code_in, const int length_in, char* plaintex
+ 					state_in->plainchar = *plainchar;
+ 					return plainchar - plaintext_out;
+ 				}
+-				fragment = (char)base64_decode_value(*codechar++);
++				fragment = base64_decode_value(*codechar++);
+ 			} while (fragment < 0);
+ 			*plainchar++   |= (fragment & 0x03f);
+ 		}
diff --git a/meta-oe/recipes-support/libb64/libb64/0004-Fix-off-by-one-error.patch b/meta-oe/recipes-support/libb64/libb64/0004-Fix-off-by-one-error.patch
new file mode 100644
index 0000000000..e19dbad08d
--- /dev/null
+++ b/meta-oe/recipes-support/libb64/libb64/0004-Fix-off-by-one-error.patch
@@ -0,0 +1,26 @@
+From 8144fd9e02bd5ccd1e080297b19a1e9eb4d3ff96 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 27 Mar 2021 22:07:15 -0700
+Subject: [PATCH] Fix off by one error
+
+Launchpad bug #1501176 reported by William McCall on 2015-09-30
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/cdecode.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/cdecode.c b/src/cdecode.c
+index 4e47e9f..45da4e1 100644
+--- a/src/cdecode.c
++++ b/src/cdecode.c
+@@ -13,7 +13,7 @@ int base64_decode_value(char value_in)
+ 	static const char decoding_size = sizeof(decoding);
+ 	if (value_in < 43) return -1;
+ 	value_in -= 43;
+-	if (value_in > decoding_size) return -1;
++	if (value_in >= decoding_size) return -1;
+ 	return decoding[(int)value_in];
+ }
+ 
diff --git a/meta-oe/recipes-support/libb64/libb64/0005-make-overriding-CFLAGS-possible.patch b/meta-oe/recipes-support/libb64/libb64/0005-make-overriding-CFLAGS-possible.patch
new file mode 100644
index 0000000000..e93015ee48
--- /dev/null
+++ b/meta-oe/recipes-support/libb64/libb64/0005-make-overriding-CFLAGS-possible.patch
@@ -0,0 +1,40 @@
+From a7914d5ffee6ffdfb3f2b8ebcc22c8367d078301 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 27 Mar 2021 22:08:43 -0700
+Subject: [PATCH] make overriding CFLAGS possible
+
+Author: Jakub Wilk <jwilk@debian.org>
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ base64/Makefile | 2 +-
+ src/Makefile    | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/base64/Makefile b/base64/Makefile
+index 30a2c5c..783a248 100644
+--- a/base64/Makefile
++++ b/base64/Makefile
+@@ -3,7 +3,7 @@ BINARIES = base64
+ # Build flags (uncomment one)
+ #############################
+ # Release build flags
+-CFLAGS += -O3
++CFLAGS ?= -O3
+ #############################
+ # Debug build flags
+ #CFLAGS += -g
+diff --git a/src/Makefile b/src/Makefile
+index 28b2382..48801fc 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -3,7 +3,7 @@ LIBRARIES = libb64.a
+ # Build flags (uncomment one)
+ #############################
+ # Release build flags
+-CFLAGS += -O3
++CFLAGS ?= -O3
+ #############################
+ # Debug build flags
+ #CFLAGS += -g
diff --git a/meta-oe/recipes-support/libb64/libb64/0006-do-not-export-the-CHARS_PER_LINE-variable.patch b/meta-oe/recipes-support/libb64/libb64/0006-do-not-export-the-CHARS_PER_LINE-variable.patch
new file mode 100644
index 0000000000..9ba08c87ee
--- /dev/null
+++ b/meta-oe/recipes-support/libb64/libb64/0006-do-not-export-the-CHARS_PER_LINE-variable.patch
@@ -0,0 +1,27 @@
+From a1b9bb4af819ed389675f16e4a521efeda4cc3f3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 27 Mar 2021 22:10:48 -0700
+Subject: [PATCH] do not export the CHARS_PER_LINE variable
+
+The library exports a variable named "CHARS_PER_LINE". This is a generic name that could conflict with a name in user's code.
+Please either rename the variable or make it static.
+
+Upstream-Status: Submitted [http://sourceforge.net/tracker/?func=detail&aid=3591420&group_id=152942&atid=785907]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/cencode.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/cencode.c b/src/cencode.c
+index 03ba5b6..3df62a8 100644
+--- a/src/cencode.c
++++ b/src/cencode.c
+@@ -7,7 +7,7 @@ For details, see http://sourceforge.net/projects/libb64
+ 
+ #include <b64/cencode.h>
+ 
+-const int CHARS_PER_LINE = 72;
++static const int CHARS_PER_LINE = 72;
+ 
+ void base64_init_encodestate(base64_encodestate* state_in)
+ {
diff --git a/meta-oe/recipes-support/libb64/libb64/0007-initialize-encoder-decoder-state-in-the-constructors.patch b/meta-oe/recipes-support/libb64/libb64/0007-initialize-encoder-decoder-state-in-the-constructors.patch
new file mode 100644
index 0000000000..fdf8339bed
--- /dev/null
+++ b/meta-oe/recipes-support/libb64/libb64/0007-initialize-encoder-decoder-state-in-the-constructors.patch
@@ -0,0 +1,44 @@
+From c1ba44d83cc7d9d756cfb063717852eae9d03328 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 27 Mar 2021 22:12:41 -0700
+Subject: [PATCH] initialize encoder/decoder state in the constructors
+
+Author: Jakub Wilk <jwilk@debian.org>
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/b64/decode.h | 4 +++-
+ include/b64/encode.h | 4 +++-
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/include/b64/decode.h b/include/b64/decode.h
+index e9019f3..aefb7bc 100644
+--- a/include/b64/decode.h
++++ b/include/b64/decode.h
+@@ -25,7 +25,9 @@ namespace base64
+ 
+ 		decoder(int buffersize_in = BUFSIZ)
+ 		: _buffersize(buffersize_in)
+-		{}
++		{
++			base64_init_decodestate(&_state);
++		}
+ 
+ 		int decode(char value_in)
+ 		{
+diff --git a/include/b64/encode.h b/include/b64/encode.h
+index e7a7035..33848b3 100644
+--- a/include/b64/encode.h
++++ b/include/b64/encode.h
+@@ -25,7 +25,9 @@ namespace base64
+ 
+ 		encoder(int buffersize_in = BUFSIZ)
+ 		: _buffersize(buffersize_in)
+-		{}
++		{
++			base64_init_encodestate(&_state);
++		}
+ 
+ 		int encode(char value_in)
+ 		{
diff --git a/meta-oe/recipes-support/libb64/libb64_1.2.1.bb b/meta-oe/recipes-support/libb64/libb64_1.2.1.bb
new file mode 100644
index 0000000000..64a34fece7
--- /dev/null
+++ b/meta-oe/recipes-support/libb64/libb64_1.2.1.bb
@@ -0,0 +1,39 @@
+SUMMARY = "Base64 Encoding/Decoding Routines"
+DESCRIPTION = "base64 encoding/decoding library - runtime library \
+libb64 is a library of ANSI C routines for fast encoding/decoding data into \
+and from a base64-encoded format"
+HOMEPAGE = "http://libb64.sourceforge.net/"
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ce551aad762074c7ab618a0e07a8dca3"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}/${BP}.zip \
+           file://0001-example-Do-not-run-the-tests.patch \
+           file://0002-use-BUFSIZ-as-buffer-size.patch \
+           file://0003-fix-integer-overflows.patch \
+           file://0004-Fix-off-by-one-error.patch \
+           file://0005-make-overriding-CFLAGS-possible.patch \
+           file://0006-do-not-export-the-CHARS_PER_LINE-variable.patch \
+           file://0007-initialize-encoder-decoder-state-in-the-constructors.patch \
+           "
+SRC_URI[sha256sum] = "20106f0ba95cfd9c35a13c71206643e3fb3e46512df3e2efb2fdbf87116314b2"
+
+PARALLEL_MAKE = ""
+
+CFLAGS += "-fPIC"
+
+do_configure () {
+    :
+}
+
+do_compile () {
+    oe_runmake
+    ${CC} ${LDFLAGS} ${CFLAGS} -shared -Wl,-soname,${BPN}.so.0 src/*.o -o src/${BPN}.so.0
+}
+
+do_install () {
+    install -d ${D}${includedir}/b64
+    install -Dm 0644 ${B}/src/libb64.a ${D}${libdir}/libb64.a
+    install -Dm 0644 ${B}/src/libb64.so.0 ${D}${libdir}/libb64.so.0
+    ln -s libb64.so.0 ${D}${libdir}/libb64.so
+    install -Dm 0644 ${S}/include/b64/*.h ${D}${includedir}/b64/
+}
-- 
2.34.1


