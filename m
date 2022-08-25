Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C36D0C48BE4
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 00:03:25 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.18294.1661385799628637638
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Aug 2022 17:03:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oCffMFwn;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id
 m10-20020a17090a730a00b001fa986fd8eeso3264622pjk.0
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Aug 2022 17:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=JaIiFU6am3QGUM/qg8twtE4G4gplTP4FwJsohLPnAWQ=;
        b=oCffMFwnA1mWY+rSkebRPTO01kj4zpbnwbyJdOgHvsj4xD/CSEZDlznwviQQGMNF58
         iJmMU77j5W3L+c/8KVWEqij05lY2QaR5lidk0aLKiDYXweEzf4zYHDvqZjGTkiNDoES5
         WdJBx34CTPf9uEqRrp0xaJ3q7B+8n75KAdvtDfv5A9UM+Lp/BkeHXBSa3CqpvTLdwgNU
         ypQ9qhzxWbKRq6nU32Y+5SlZnoCpDmfWdWZsaPapSuCLu03eU/vJnKbKkT0SqFE7NKn1
         MwyiwxxlcRg9UYXOHFfwyxxvadt8X1d5+TWkoif0MzWNOh1GzrP8BnVUsZRpzj2PoxsR
         7xAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=JaIiFU6am3QGUM/qg8twtE4G4gplTP4FwJsohLPnAWQ=;
        b=WiPMEqpTMDJQ5cNTQNNM/Zww+l0lf6mirrfrOU5CeJGon4a/P3A1Gw+ZnPIbM/Q1Qy
         PlXbJp0aeFFboi3qU39SCLYimafOP5A5dt95E94g31dQtZjG6aIZEJogAoBpMQANoEXF
         fA0NtiH9i/FvgMs6SUla0RID/1hVZWpEw8r03IqDjeVS93Th4z8M3Lm5N8iLGYzltksI
         l6UcZX/ze8lIH9tgSTh00qJJyKEIfEAHk9BHi+ofPGQGXymOK/IVwMOUNWr7V56/qp6N
         g8aTLXQ6tnV7DLWd1LGMbn8BmK3oc0ZBbU3IFfdI/d2EGOxv8rG1pmu9mckX4vup/hm3
         PH4w==
X-Gm-Message-State: ACgBeo3QzDXs9IeiLgLMR/ickCHrUxono3npvGIMDTm8eZCWku3jD0pJ
	17eMB4Adywl+4Zx1DaU5Wq4j0BGpYtD+JA==
X-Google-Smtp-Source: 
 AA6agR6MeKln+Xy7/QRqzhcAxEmB5UcNsjj3u2eXs/wQ6FYPnNgzHC7lvBYnUKrrklqh14H+L8m0kA==
X-Received: by 2002:a17:903:41c4:b0:16d:cb15:290f with SMTP id
 u4-20020a17090341c400b0016dcb15290fmr1141252ple.47.1661385798585;
        Wed, 24 Aug 2022 17:03:18 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 l4-20020a170903244400b00172cdcdc183sm4236373pls.93.2022.08.24.17.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 17:03:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/4] libb64: Switch to github fork and upgrade to
 2.0.0.1+git
Date: Wed, 24 Aug 2022 17:03:13 -0700
Message-Id: <20220825000315.285545-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220825000315.285545-1-raj.khem@gmail.com>
References: <20220825000315.285545-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Aug 2022 00:03:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98426

Many of the patches floating around has been applied to github fork and
seems to be having recent releases.

Drop patches which are either applied or fixed differently in this
version

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...efile-fix-parallel-build-of-examples.patch | 46 +++++++++++
 ...e-proper-function-prototype-for-main.patch | 27 +++++++
 .../0002-use-BUFSIZ-as-buffer-size.patch      | 57 --------------
 .../libb64/0003-fix-integer-overflows.patch   | 77 -------------------
 .../libb64/0004-Fix-off-by-one-error.patch    | 26 -------
 ...0005-make-overriding-CFLAGS-possible.patch | 40 ----------
 ...t-export-the-CHARS_PER_LINE-variable.patch | 27 -------
 ...er-decoder-state-in-the-constructors.patch | 44 -----------
 .../{libb64_1.2.1.bb => libb64_2.0.0.1.bb}    | 20 +++--
 9 files changed, 82 insertions(+), 282 deletions(-)
 create mode 100644 meta-oe/recipes-support/libb64/libb64/0001-Makefile-fix-parallel-build-of-examples.patch
 create mode 100644 meta-oe/recipes-support/libb64/libb64/0001-examples-Use-proper-function-prototype-for-main.patch
 delete mode 100644 meta-oe/recipes-support/libb64/libb64/0002-use-BUFSIZ-as-buffer-size.patch
 delete mode 100644 meta-oe/recipes-support/libb64/libb64/0003-fix-integer-overflows.patch
 delete mode 100644 meta-oe/recipes-support/libb64/libb64/0004-Fix-off-by-one-error.patch
 delete mode 100644 meta-oe/recipes-support/libb64/libb64/0005-make-overriding-CFLAGS-possible.patch
 delete mode 100644 meta-oe/recipes-support/libb64/libb64/0006-do-not-export-the-CHARS_PER_LINE-variable.patch
 delete mode 100644 meta-oe/recipes-support/libb64/libb64/0007-initialize-encoder-decoder-state-in-the-constructors.patch
 rename meta-oe/recipes-support/libb64/{libb64_1.2.1.bb => libb64_2.0.0.1.bb} (54%)

diff --git a/meta-oe/recipes-support/libb64/libb64/0001-Makefile-fix-parallel-build-of-examples.patch b/meta-oe/recipes-support/libb64/libb64/0001-Makefile-fix-parallel-build-of-examples.patch
new file mode 100644
index 0000000000..84dee415ad
--- /dev/null
+++ b/meta-oe/recipes-support/libb64/libb64/0001-Makefile-fix-parallel-build-of-examples.patch
@@ -0,0 +1,46 @@
+From cbe8bd2948f522062c6170f581e1e265692a9a55 Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyich@gmail.com>
+Date: Sun, 24 Oct 2021 18:53:04 +0100
+Subject: [PATCH] Makefile: fix parallel build of examples
+
+Without the change examples fails to build as:
+
+    $ LANG=C make -j
+    make -C src
+    make -C examples
+    make[1]: Entering directory 'libb64/src'
+    cc -O3 -Werror -pedantic -I../include   -c -o cencode.o cencode.c
+    make[1]: Entering directory 'libb64/examples'
+    make[1]: *** No rule to make target 'libb64.a', needed by 'c-example1'.  Stop.
+    make[1]: Leaving directory 'libb64/examples'
+    make: *** [Makefile:8: all_examples] Error 2
+    make: *** Waiting for unfinished jobs....
+    cc -O3 -Werror -pedantic -I../include   -c -o cdecode.o cdecode.c
+    ar rv libb64.a cencode.o cdecode.o
+    ar: creating libb64.a
+    a - cencode.o
+    a - cdecode.o
+    make[1]: Leaving directory 'libb64/src'
+
+Upstream-Status: Submitted [https://github.com/libb64/libb64/pull/9]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index db40356..aa48c76 100644
+--- a/Makefile
++++ b/Makefile
+@@ -4,7 +4,7 @@ all_src:
+ 	$(MAKE) -C src
+ all_base64: all_src
+ 	$(MAKE) -C base64
+-all_examples:
++all_examples: all_src
+ 	$(MAKE) -C examples
+ 	
+ clean: clean_src clean_base64 clean_include clean_examples
+-- 
+2.37.2
+
diff --git a/meta-oe/recipes-support/libb64/libb64/0001-examples-Use-proper-function-prototype-for-main.patch b/meta-oe/recipes-support/libb64/libb64/0001-examples-Use-proper-function-prototype-for-main.patch
new file mode 100644
index 0000000000..42e889efc2
--- /dev/null
+++ b/meta-oe/recipes-support/libb64/libb64/0001-examples-Use-proper-function-prototype-for-main.patch
@@ -0,0 +1,27 @@
+From 98eaf510f40e384b32c01ad4bd5c3a697fdd8560 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 24 Aug 2022 14:34:38 -0700
+Subject: [PATCH] examples: Use proper function prototype for main
+
+Upstream-Status: Submitted [https://github.com/libb64/libb64/pull/10]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ examples/c-example1.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/examples/c-example1.c b/examples/c-example1.c
+index a0001df..34585dd 100644
+--- a/examples/c-example1.c
++++ b/examples/c-example1.c
+@@ -83,7 +83,7 @@ char* decode(const char* input)
+ }
+ 
+ 
+-int main()
++int main(int argc, char** argv)
+ {
+ 	const char* input = "hello world";
+ 	char* encoded;
+-- 
+2.37.2
+
diff --git a/meta-oe/recipes-support/libb64/libb64/0002-use-BUFSIZ-as-buffer-size.patch b/meta-oe/recipes-support/libb64/libb64/0002-use-BUFSIZ-as-buffer-size.patch
deleted file mode 100644
index 10ec8e14a8..0000000000
--- a/meta-oe/recipes-support/libb64/libb64/0002-use-BUFSIZ-as-buffer-size.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From ee03e265804a07a0da5028b86960031bd7ab86b2 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 27 Mar 2021 22:01:13 -0700
-Subject: [PATCH] use BUFSIZ as buffer size
-
-Author: Jakub Wilk <jwilk@debian.org>
-Bug: http://sourceforge.net/tracker/?func=detail&atid=785907&aid=3591336&group_id=152942
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/b64/decode.h | 3 ++-
- include/b64/encode.h | 3 ++-
- 2 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/include/b64/decode.h b/include/b64/decode.h
-index 12b16ea..e9019f3 100644
---- a/include/b64/decode.h
-+++ b/include/b64/decode.h
-@@ -8,6 +8,7 @@ For details, see http://sourceforge.net/projects/libb64
- #ifndef BASE64_DECODE_H
- #define BASE64_DECODE_H
- 
-+#include <cstdio>
- #include <iostream>
- 
- namespace base64
-@@ -22,7 +23,7 @@ namespace base64
- 		base64_decodestate _state;
- 		int _buffersize;
- 
--		decoder(int buffersize_in = BUFFERSIZE)
-+		decoder(int buffersize_in = BUFSIZ)
- 		: _buffersize(buffersize_in)
- 		{}
- 
-diff --git a/include/b64/encode.h b/include/b64/encode.h
-index 5d807d9..e7a7035 100644
---- a/include/b64/encode.h
-+++ b/include/b64/encode.h
-@@ -8,6 +8,7 @@ For details, see http://sourceforge.net/projects/libb64
- #ifndef BASE64_ENCODE_H
- #define BASE64_ENCODE_H
- 
-+#include <cstdio>
- #include <iostream>
- 
- namespace base64
-@@ -22,7 +23,7 @@ namespace base64
- 		base64_encodestate _state;
- 		int _buffersize;
- 
--		encoder(int buffersize_in = BUFFERSIZE)
-+		encoder(int buffersize_in = BUFSIZ)
- 		: _buffersize(buffersize_in)
- 		{}
- 
diff --git a/meta-oe/recipes-support/libb64/libb64/0003-fix-integer-overflows.patch b/meta-oe/recipes-support/libb64/libb64/0003-fix-integer-overflows.patch
deleted file mode 100644
index 8854bb6af4..0000000000
--- a/meta-oe/recipes-support/libb64/libb64/0003-fix-integer-overflows.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 7b30fbc3d47dfaf38d8ce8b8949a69d2984dac76 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 27 Mar 2021 22:06:03 -0700
-Subject: [PATCH] fix integer overflows
-
-Author: Jakub Wilk <jwilk@debian.org>
-Bug: http://sourceforge.net/tracker/?func=detail&aid=3591129&group_id=152942&atid=785907
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/cdecode.c | 15 ++++++++-------
- 1 file changed, 8 insertions(+), 7 deletions(-)
-
-diff --git a/src/cdecode.c b/src/cdecode.c
-index a6c0a42..4e47e9f 100644
---- a/src/cdecode.c
-+++ b/src/cdecode.c
-@@ -9,10 +9,11 @@ For details, see http://sourceforge.net/projects/libb64
- 
- int base64_decode_value(char value_in)
- {
--	static const char decoding[] = {62,-1,-1,-1,63,52,53,54,55,56,57,58,59,60,61,-1,-1,-1,-2,-1,-1,-1,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,-1,-1,-1,-1,-1,-1,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51};
-+	static const signed char decoding[] = {62,-1,-1,-1,63,52,53,54,55,56,57,58,59,60,61,-1,-1,-1,-2,-1,-1,-1,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,-1,-1,-1,-1,-1,-1,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51};
- 	static const char decoding_size = sizeof(decoding);
-+	if (value_in < 43) return -1;
- 	value_in -= 43;
--	if (value_in < 0 || value_in >= decoding_size) return -1;
-+	if (value_in > decoding_size) return -1;
- 	return decoding[(int)value_in];
- }
- 
-@@ -26,7 +27,7 @@ int base64_decode_block(const char* code_in, const int length_in, char* plaintex
- {
- 	const char* codechar = code_in;
- 	char* plainchar = plaintext_out;
--	char fragment;
-+	int fragment;
- 	
- 	*plainchar = state_in->plainchar;
- 	
-@@ -42,7 +43,7 @@ int base64_decode_block(const char* code_in, const int length_in, char* plaintex
- 					state_in->plainchar = *plainchar;
- 					return plainchar - plaintext_out;
- 				}
--				fragment = (char)base64_decode_value(*codechar++);
-+				fragment = base64_decode_value(*codechar++);
- 			} while (fragment < 0);
- 			*plainchar    = (fragment & 0x03f) << 2;
- 	case step_b:
-@@ -53,7 +54,7 @@ int base64_decode_block(const char* code_in, const int length_in, char* plaintex
- 					state_in->plainchar = *plainchar;
- 					return plainchar - plaintext_out;
- 				}
--				fragment = (char)base64_decode_value(*codechar++);
-+				fragment = base64_decode_value(*codechar++);
- 			} while (fragment < 0);
- 			*plainchar++ |= (fragment & 0x030) >> 4;
- 			*plainchar    = (fragment & 0x00f) << 4;
-@@ -65,7 +66,7 @@ int base64_decode_block(const char* code_in, const int length_in, char* plaintex
- 					state_in->plainchar = *plainchar;
- 					return plainchar - plaintext_out;
- 				}
--				fragment = (char)base64_decode_value(*codechar++);
-+				fragment = base64_decode_value(*codechar++);
- 			} while (fragment < 0);
- 			*plainchar++ |= (fragment & 0x03c) >> 2;
- 			*plainchar    = (fragment & 0x003) << 6;
-@@ -77,7 +78,7 @@ int base64_decode_block(const char* code_in, const int length_in, char* plaintex
- 					state_in->plainchar = *plainchar;
- 					return plainchar - plaintext_out;
- 				}
--				fragment = (char)base64_decode_value(*codechar++);
-+				fragment = base64_decode_value(*codechar++);
- 			} while (fragment < 0);
- 			*plainchar++   |= (fragment & 0x03f);
- 		}
diff --git a/meta-oe/recipes-support/libb64/libb64/0004-Fix-off-by-one-error.patch b/meta-oe/recipes-support/libb64/libb64/0004-Fix-off-by-one-error.patch
deleted file mode 100644
index e19dbad08d..0000000000
--- a/meta-oe/recipes-support/libb64/libb64/0004-Fix-off-by-one-error.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 8144fd9e02bd5ccd1e080297b19a1e9eb4d3ff96 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 27 Mar 2021 22:07:15 -0700
-Subject: [PATCH] Fix off by one error
-
-Launchpad bug #1501176 reported by William McCall on 2015-09-30
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/cdecode.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/cdecode.c b/src/cdecode.c
-index 4e47e9f..45da4e1 100644
---- a/src/cdecode.c
-+++ b/src/cdecode.c
-@@ -13,7 +13,7 @@ int base64_decode_value(char value_in)
- 	static const char decoding_size = sizeof(decoding);
- 	if (value_in < 43) return -1;
- 	value_in -= 43;
--	if (value_in > decoding_size) return -1;
-+	if (value_in >= decoding_size) return -1;
- 	return decoding[(int)value_in];
- }
- 
diff --git a/meta-oe/recipes-support/libb64/libb64/0005-make-overriding-CFLAGS-possible.patch b/meta-oe/recipes-support/libb64/libb64/0005-make-overriding-CFLAGS-possible.patch
deleted file mode 100644
index e93015ee48..0000000000
--- a/meta-oe/recipes-support/libb64/libb64/0005-make-overriding-CFLAGS-possible.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From a7914d5ffee6ffdfb3f2b8ebcc22c8367d078301 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 27 Mar 2021 22:08:43 -0700
-Subject: [PATCH] make overriding CFLAGS possible
-
-Author: Jakub Wilk <jwilk@debian.org>
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- base64/Makefile | 2 +-
- src/Makefile    | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/base64/Makefile b/base64/Makefile
-index 30a2c5c..783a248 100644
---- a/base64/Makefile
-+++ b/base64/Makefile
-@@ -3,7 +3,7 @@ BINARIES = base64
- # Build flags (uncomment one)
- #############################
- # Release build flags
--CFLAGS += -O3
-+CFLAGS ?= -O3
- #############################
- # Debug build flags
- #CFLAGS += -g
-diff --git a/src/Makefile b/src/Makefile
-index 28b2382..48801fc 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -3,7 +3,7 @@ LIBRARIES = libb64.a
- # Build flags (uncomment one)
- #############################
- # Release build flags
--CFLAGS += -O3
-+CFLAGS ?= -O3
- #############################
- # Debug build flags
- #CFLAGS += -g
diff --git a/meta-oe/recipes-support/libb64/libb64/0006-do-not-export-the-CHARS_PER_LINE-variable.patch b/meta-oe/recipes-support/libb64/libb64/0006-do-not-export-the-CHARS_PER_LINE-variable.patch
deleted file mode 100644
index 9ba08c87ee..0000000000
--- a/meta-oe/recipes-support/libb64/libb64/0006-do-not-export-the-CHARS_PER_LINE-variable.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From a1b9bb4af819ed389675f16e4a521efeda4cc3f3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 27 Mar 2021 22:10:48 -0700
-Subject: [PATCH] do not export the CHARS_PER_LINE variable
-
-The library exports a variable named "CHARS_PER_LINE". This is a generic name that could conflict with a name in user's code.
-Please either rename the variable or make it static.
-
-Upstream-Status: Submitted [http://sourceforge.net/tracker/?func=detail&aid=3591420&group_id=152942&atid=785907]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/cencode.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/cencode.c b/src/cencode.c
-index 03ba5b6..3df62a8 100644
---- a/src/cencode.c
-+++ b/src/cencode.c
-@@ -7,7 +7,7 @@ For details, see http://sourceforge.net/projects/libb64
- 
- #include <b64/cencode.h>
- 
--const int CHARS_PER_LINE = 72;
-+static const int CHARS_PER_LINE = 72;
- 
- void base64_init_encodestate(base64_encodestate* state_in)
- {
diff --git a/meta-oe/recipes-support/libb64/libb64/0007-initialize-encoder-decoder-state-in-the-constructors.patch b/meta-oe/recipes-support/libb64/libb64/0007-initialize-encoder-decoder-state-in-the-constructors.patch
deleted file mode 100644
index fdf8339bed..0000000000
--- a/meta-oe/recipes-support/libb64/libb64/0007-initialize-encoder-decoder-state-in-the-constructors.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From c1ba44d83cc7d9d756cfb063717852eae9d03328 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 27 Mar 2021 22:12:41 -0700
-Subject: [PATCH] initialize encoder/decoder state in the constructors
-
-Author: Jakub Wilk <jwilk@debian.org>
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/b64/decode.h | 4 +++-
- include/b64/encode.h | 4 +++-
- 2 files changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/include/b64/decode.h b/include/b64/decode.h
-index e9019f3..aefb7bc 100644
---- a/include/b64/decode.h
-+++ b/include/b64/decode.h
-@@ -25,7 +25,9 @@ namespace base64
- 
- 		decoder(int buffersize_in = BUFSIZ)
- 		: _buffersize(buffersize_in)
--		{}
-+		{
-+			base64_init_decodestate(&_state);
-+		}
- 
- 		int decode(char value_in)
- 		{
-diff --git a/include/b64/encode.h b/include/b64/encode.h
-index e7a7035..33848b3 100644
---- a/include/b64/encode.h
-+++ b/include/b64/encode.h
-@@ -25,7 +25,9 @@ namespace base64
- 
- 		encoder(int buffersize_in = BUFSIZ)
- 		: _buffersize(buffersize_in)
--		{}
-+		{
-+			base64_init_encodestate(&_state);
-+		}
- 
- 		int encode(char value_in)
- 		{
diff --git a/meta-oe/recipes-support/libb64/libb64_1.2.1.bb b/meta-oe/recipes-support/libb64/libb64_2.0.0.1.bb
similarity index 54%
rename from meta-oe/recipes-support/libb64/libb64_1.2.1.bb
rename to meta-oe/recipes-support/libb64/libb64_2.0.0.1.bb
index 64a34fece7..8122419c5e 100644
--- a/meta-oe/recipes-support/libb64/libb64_1.2.1.bb
+++ b/meta-oe/recipes-support/libb64/libb64_2.0.0.1.bb
@@ -2,22 +2,20 @@ SUMMARY = "Base64 Encoding/Decoding Routines"
 DESCRIPTION = "base64 encoding/decoding library - runtime library \
 libb64 is a library of ANSI C routines for fast encoding/decoding data into \
 and from a base64-encoded format"
-HOMEPAGE = "http://libb64.sourceforge.net/"
+HOMEPAGE = "https://github.com/libb64"
 LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ce551aad762074c7ab618a0e07a8dca3"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=81296a564fa0621472714aae7c763d96"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}/${BP}.zip \
+PV .= "+2.0.0.2+git${SRCPV}"
+SRCREV = "ce864b17ea0e24a91e77c7dd3eb2d1ac4175b3f0"
+
+SRC_URI = "git://github.com/libb64/libb64;protocol=https;branch=master \
            file://0001-example-Do-not-run-the-tests.patch \
-           file://0002-use-BUFSIZ-as-buffer-size.patch \
-           file://0003-fix-integer-overflows.patch \
-           file://0004-Fix-off-by-one-error.patch \
-           file://0005-make-overriding-CFLAGS-possible.patch \
-           file://0006-do-not-export-the-CHARS_PER_LINE-variable.patch \
-           file://0007-initialize-encoder-decoder-state-in-the-constructors.patch \
+           file://0001-Makefile-fix-parallel-build-of-examples.patch \
+           file://0001-examples-Use-proper-function-prototype-for-main.patch \
            "
-SRC_URI[sha256sum] = "20106f0ba95cfd9c35a13c71206643e3fb3e46512df3e2efb2fdbf87116314b2"
 
-PARALLEL_MAKE = ""
+S = "${WORKDIR}/git"
 
 CFLAGS += "-fPIC"
 
-- 
2.37.2


