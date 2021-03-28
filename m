Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.4271.1616909937723169511
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Mar 2021 22:38:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LNNkDSQf;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id t18so4462807pjs.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 Mar 2021 22:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z+3/hO0G5oKN8fUtBtTKQ055JGIfkP5E6jUYUkwZ9pw=;
        b=LNNkDSQfaLrXtipR3l1GmvJb4bOq+hNEgrlcfsB3LlPPp1y/4b0wVa/y49a5wnFT6W
         yuzFAYU1z5ktZWmOn1QgnFtP7Y5a3Mon1pV2Ozgx85+ny0hJ5Den61wXzP/ktLc/3KxY
         9QVba/mLID0XISbh7kxx+I9JxK/MQOeAiEWtp5uivNJNJiCxDGpyl0JmKoRtkv22XxFu
         r3I6scIx9Mt5hmwQlaox+P6F9GQJGPJlg3JowBTE/cvpR7a47LdYydZ50WuynXoGUZRr
         xf7RJjITKAGgr+d8umgWUz931z3RKTDBPDUysRydiIUlPG+5tQmCprAR4xA2Px0i89mE
         miuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z+3/hO0G5oKN8fUtBtTKQ055JGIfkP5E6jUYUkwZ9pw=;
        b=M720HffHSAJEArml6qNwmyzY2QFXRh8NgrRL1BdlZm9yPtTciK2Q7JtGMm4Dv83NGv
         qNihgoHZfDREF/AJpv1M7qgs/waqaMosyRnZYBwvG5GOrMABiu5JmYlObrczXOdd5wHQ
         G8+gK6V/rPkyL3uFBRH2u0jDy7CqSmEeaD8FNwEEeX+syAebeWrk9uWfMriiEmC2QFQD
         qt+U5CkOtRNDAsnEGqapGcIM7YaCGs/CxXp9l7g88puJRHwAZAowY4HVPqlcFV5DtdAJ
         RWVVGPbKopoWihxJqwRgv7VTL/8I3GAbIUGCjJoGyV6axJgs3cKJ01iY3joIs6wnPyMH
         B4yg==
X-Gm-Message-State: AOAM53258tGiGTH+LRYfVndAuG2OF3qfOhESBzaRyB6QIoc76dMGKCJa
	P5qPlHY7C2naTwKfv2wzDni1ugrEM0lMeQ==
X-Google-Smtp-Source: ABdhPJzqjCbomph5w1+kbWNh8/87q2miBs1po1Nu12aVRZersr+UWxGkSJ/Gd74O0kpEmeIV37ALpg==
X-Received: by 2002:a17:90b:1490:: with SMTP id js16mr20385967pjb.131.1616909936670;
        Sat, 27 Mar 2021 22:38:56 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ae20])
        by smtp.gmail.com with ESMTPSA id s28sm13982212pfd.155.2021.03.27.22.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 22:38:56 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/4] libb64: Add recipe
Date: Sat, 27 Mar 2021 22:38:51 -0700
Message-Id: <20210328053853.1287969-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210328053853.1287969-1-raj.khem@gmail.com>
References: <20210328053853.1287969-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Base64 encode/decode library, some packages e.g. sysdig can benefit
from it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-example-Do-not-run-the-tests.patch   | 27 +++++++
 .../0002-use-BUFSIZ-as-buffer-size.patch      | 57 ++++++++++++++
 .../libb64/0003-fix-integer-overflows.patch   | 77 +++++++++++++++++++
 .../libb64/0004-Fix-off-by-one-error.patch    | 26 +++++++
 ...0005-make-overriding-CFLAGS-possible.patch | 40 ++++++++++
 ...t-export-the-CHARS_PER_LINE-variable.patch | 27 +++++++
 ...er-decoder-state-in-the-constructors.patch | 44 +++++++++++
 .../recipes-support/libb64/libb64_1.2.1.bb    | 37 +++++++++
 8 files changed, 335 insertions(+)
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
index 0000000000..a2d58d06ea
--- /dev/null
+++ b/meta-oe/recipes-support/libb64/libb64_1.2.1.bb
@@ -0,0 +1,37 @@
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
2.31.0

