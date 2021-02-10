Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web09.518.1612925554634774302
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Feb 2021 18:52:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Wwo2eI5u;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: rfried.dev@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id l12so852804wry.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Feb 2021 18:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QB5zlr5qEiWYYllHzb4KRDcrAdgGaFWR/KM64wonZ8c=;
        b=Wwo2eI5uFdtPx5T04xkIWdJbeDHuvsD7Pg1HpbSz5z/wPmdTUiKiqZIHJuJbLUBg8v
         7SvP9NUFQdU+kdDpQTRpelVhvCb8IXOwDtwlOig/r/nULOYxuUzHePBCOYu6oMj/ZKkk
         XacjB0Atz870uPCSgd2iF6/pyhiJt7MYyVIaJIjs4sF6VoG7K9C8w76NvSEPKAN9WVpD
         jVKFNRD8KWQt6HDT9PiIUNr4T1QGo8SzJDIV45MRqHGrOQEixnsFS3bp6RfPxsi7mcZQ
         dCwkZ1uJ/z/mfc0tCTj2kQDO9fgsmO9PRBWbo4THcdvM/0z2+xzcSMYI5x4Vca9cACN/
         aB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=QB5zlr5qEiWYYllHzb4KRDcrAdgGaFWR/KM64wonZ8c=;
        b=PNfvbFOcb0f+ZmcOZoe6+bF0KQ9PYYMEdi5HahgdyE/SUtfeb5Gm5DMZTo4tjAJ2mI
         cO9YulZlITvTxPbc24FeeBWsWtzUSn0StFG9c59mCgIQlISCVq4e5Rhon7NKzYuKLLEC
         LmUehLmxVVDcGy941b7qfNtgFgybe9ChtP2EKz7BZJ7KXLpcIwY3kEG0o5Ok0opT09UF
         fT3KQA1jM3tXRo2CH1UvwHsmJQCSagVYUl40HIJ+DNUN3/HKOukwhxYpq+ny2AVu/7ff
         EJXMhzgG5C5DTpSPrtLx+UGWFlP40yJDReRtRvw29QY18WcSjs2NP9lkYsB/B/xDwPf2
         kMzw==
X-Gm-Message-State: AOAM531WEJy71WSrsKqM3eJCykTeOmqPQ5gCQtsI3E8/uigcXhBvcQMf
	Ku1gd8CXOGpPUMEQ3CDpBVXOYq9+7ElzRA==
X-Google-Smtp-Source: ABdhPJxjzYWPyBErx+ukv3s1NvwtjUSx7AsUvssxmSTEFk27DRV7+Ip7CZc4aL4Ns71o8IK4y/BaTg==
X-Received: by 2002:a5d:6c6d:: with SMTP id r13mr1069319wrz.343.1612925552903;
        Tue, 09 Feb 2021 18:52:32 -0800 (PST)
Return-Path: <rfried.dev@gmail.com>
Received: from lotus.nr.ent (82.166.25.98.fix.netvision.net.il. [82.166.25.98])
        by smtp.gmail.com with ESMTPSA id 36sm913375wrj.97.2021.02.09.18.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 18:52:32 -0800 (PST)
From: "Ramon Fried" <rfried.dev@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ramon Fried <rfried.dev@gmail.com>
Subject: [meta-oe][PATCH 2/2] fluentbit: Fix SIGSEGV caused by using flb_free instead of mk_mem_free
Date: Wed, 10 Feb 2021 04:54:25 +0200
Message-Id: <20210210025425.43148-2-rfried.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210210025425.43148-1-rfried.dev@gmail.com>
References: <20210210025425.43148-1-rfried.dev@gmail.com>

Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
---
 ...caused-by-using-flb_free-instead-of-.patch | 43 ++++++++++
 ...GV-caused-by-using-flb_free-instead-.patch | 82 +++++++++++++++++++
 .../fluentbit/fluentbit_1.3.5.bb              |  4 +-
 3 files changed, 128 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0001-bin-fix-SIGSEGV-caused-by-using-flb_free-instead-of-.patch
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0002-parser-Fix-SIGSEGV-caused-by-using-flb_free-instead-.patch

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-bin-fix-SIGSEGV-caused-by-using-flb_free-instead-of-.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-bin-fix-SIGSEGV-caused-by-using-flb_free-instead-of-.patch
new file mode 100644
index 000000000..a6ff5991c
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-bin-fix-SIGSEGV-caused-by-using-flb_free-instead-of-.patch
@@ -0,0 +1,43 @@
+From 3d7390c89c2205d1eed0384be0bb65adb675e60d Mon Sep 17 00:00:00 2001
+From: Ramon Fried <ramon@neureality.ai>
+Date: Tue, 9 Feb 2021 18:59:59 +0200
+Subject: [PATCH] bin: fix SIGSEGV caused by using flb_free instead of
+ mk_mem_free
+
+Upstream-Status: Accepted
+Signed-off-by: Ramon Fried <ramon@neureality.ai>
+---
+ src/fluent-bit.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/fluent-bit.c b/src/fluent-bit.c
+index c0c73b4..989cfde 100644
+--- a/src/fluent-bit.c
++++ b/src/fluent-bit.c
+@@ -289,7 +289,7 @@ static int input_set_property(struct flb_input_instance *in, char *kv)
+                 in->p->name, key);
+     }
+ 
+-    flb_free(key);
++    mk_mem_free(key);
+     return ret;
+ }
+ 
+@@ -314,7 +314,7 @@ static int output_set_property(struct flb_output_instance *out, char *kv)
+     }
+ 
+     ret = flb_output_set_property(out, key, value);
+-    flb_free(key);
++    mk_mem_free(key);
+     return ret;
+ }
+ 
+@@ -340,7 +340,7 @@ static int filter_set_property(struct flb_filter_instance *filter, char *kv)
+     }
+ 
+     ret = flb_filter_set_property(filter, key, value);
+-    flb_free(key);
++    mk_mem_free(key);
+     return ret;
+ }
+ 
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-parser-Fix-SIGSEGV-caused-by-using-flb_free-instead-.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0002-parser-Fix-SIGSEGV-caused-by-using-flb_free-instead-.patch
new file mode 100644
index 000000000..91675dfc6
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0002-parser-Fix-SIGSEGV-caused-by-using-flb_free-instead-.patch
@@ -0,0 +1,82 @@
+From 7c3b1dfb174312594d3317c24ed71c60398f653f Mon Sep 17 00:00:00 2001
+From: Ramon Fried <ramon@neureality.ai>
+Date: Wed, 10 Feb 2021 04:23:36 +0200
+Subject: [PATCH] parser: Fix SIGSEGV caused by using flb_free instead of
+ mk_mem_free
+
+Upstream-Status: Backport (fix only for 1.3.5)
+Signed-off-by: Ramon Fried <ramon@neureality.ai>
+---
+ src/flb_parser.c | 28 ++++++++++++++--------------
+ 1 file changed, 14 insertions(+), 14 deletions(-)
+
+diff --git a/src/flb_parser.c b/src/flb_parser.c
+index d35c568..7c20e12 100644
+--- a/src/flb_parser.c
++++ b/src/flb_parser.c
+@@ -490,7 +490,7 @@ int flb_parser_conf_file(const char *file, struct flb_config *config)
+                                        MK_RCONF_STR);
+         if (str) {
+             time_keep = flb_utils_bool(str);
+-            flb_free(str);
++            mk_mem_free(str);
+         }
+         else {
+             time_keep = FLB_FALSE;
+@@ -522,23 +522,23 @@ int flb_parser_conf_file(const char *file, struct flb_config *config)
+ 
+         flb_debug("[parser] new parser registered: %s", name);
+ 
+-        flb_free(name);
+-        flb_free(format);
++        mk_mem_free(name);
++        mk_mem_free(format);
+ 
+         if (regex) {
+-            flb_free(regex);
++            mk_mem_free(regex);
+         }
+         if (time_fmt) {
+-            flb_free(time_fmt);
++            mk_mem_free(time_fmt);
+         }
+         if (time_key) {
+-            flb_free(time_key);
++            mk_mem_free(time_key);
+         }
+         if (time_offset) {
+-            flb_free(time_offset);
++            mk_mem_free(time_offset);
+         }
+         if (types_str) {
+-            flb_free(types_str);
++            mk_mem_free(types_str);
+         }
+ 
+         decoders = NULL;
+@@ -548,19 +548,19 @@ int flb_parser_conf_file(const char *file, struct flb_config *config)
+     return 0;
+ 
+  fconf_error:
+-    flb_free(name);
+-    flb_free(format);
++    mk_mem_free(name);
++    mk_mem_free(format);
+     if (regex) {
+-        flb_free(regex);
++        mk_mem_free(regex);
+     }
+     if (time_fmt) {
+-        flb_free(time_fmt);
++        mk_mem_free(time_fmt);
+     }
+     if (time_key) {
+-        flb_free(time_key);
++        mk_mem_free(time_key);
+     }
+     if (types_str) {
+-        flb_free(types_str);
++        mk_mem_free(types_str);
+     }
+     if (decoders) {
+         flb_parser_decoder_list_destroy(decoders);
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
index 47ed36a29..c38903bb4 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
@@ -16,7 +16,9 @@ SRC_URI = "http://fluentbit.io/releases/1.3/fluent-bit-${PV}.tar.gz \
            file://cross-build-init-system-detection.patch \
            file://builtin-nan.patch \
            file://0001-ppc-Fix-signature-for-co_create-API.patch \
-          "
+           file://0001-bin-fix-SIGSEGV-caused-by-using-flb_free-instead-of-.patch \
+           file://0002-parser-Fix-SIGSEGV-caused-by-using-flb_free-instead-.patch \
+           "
 SRC_URI[md5sum] = "6eae6dfd0a874e5dd270c36e9c68f747"
 SRC_URI[sha256sum] = "e037c76c89269c8dc4027a08e442fefd2751b0f1e0f9c38f9a4b12d781a9c789"
 
-- 
2.17.1

