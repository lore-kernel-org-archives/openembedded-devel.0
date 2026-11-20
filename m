Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1803.1795162106239824821
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Nov 2026 00:08:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=g6WgmSY+;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-38318d69173so1286894eec.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 00:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795162106; x=1795766906; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m7WTd5rtH7x93u2fLAH8P+rbQDiIkTN1dGGa2I9b5WA=;
        b=g6WgmSY+fmNsIap+mMgErr7+SqUe1t+UkYKYMBSkGS3sXHOZBy4tsRtLXXP8jdVATe
         LzeJxjzQyHthOIvqgtlTrRyH5Tlyg9aV8OyX9Eedk2b4Oh2BE396QYv+h8xFuFUGQTB5
         JvoxcNrXK717DfC/apXHCQ5pMqkrJ1W/bUYtX0zcfocCjLf+bKqYIkXH/mN3LFCvf0aV
         hqbuegAOpPILU62L6T3eSGpvpOxZel5Oi6XawsSzYSHLe2trrwb00QH/HjwNSK6cQ023
         tKsVRtBtm3oqoxhKt6jP308Ia3HSSZ5jNHMZIIzduF5+FpS88ebRYrRGfLeAIYkHnNOt
         mHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795162106; x=1795766906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m7WTd5rtH7x93u2fLAH8P+rbQDiIkTN1dGGa2I9b5WA=;
        b=x/MRybqNNCWHuIEHdFu4ra4+WXhzNQR2w/LllD63HhVlmsrU/NyUXv3efFm2ks9XA1
         t9c3m6Kvaj9ZIHeDENq8/YswMSXkBA/3cgnWn19tzHHE9zaDA30QBsBY4mbR+mmu+3z/
         WjWjpWBV1Peq05O2c/NOzg5mFtx5jV/DpkAI2LQE9yhgC/wc4qrWx12FISVZmXRNSHUe
         Suuj+q3+VPWgJMRVmt1OjZuDxoqSTv2r0rFn83+kLDd+1ztLqCt4sdwU7IxyluJXjFBl
         qhJL6x/QJifRiGWE16Xe9aXKKJZcw0HKWXNHUx5UJVkk5f+/NjMhcF1XaIfogPefa5YJ
         SFew==
X-Gm-Message-State: APuU4Z8QVsHj4bq+3yUIrOUYiOauKIGmdRbkBbpF9Z9gWELXqdzs39Ed
	95WNTTqwTVhj//qrONymb89FfiV0SaDRdC8AZkIO3Oih7MTnw8jurY2t1muQ6S33
X-Gm-Gg: AZFdTZfO0akYChRki4DYU+bIdwc8I0BbbCT0lUgpKEol/DrsWRGuSLxtmWXRHZdr2Qu
	TvemDI4GYZnb2ks+QQP0pNYgp9wKNzVISTEsJyj5K8MoaDmkdE4N29q4L02dhulRUM4MS4drCev
	USGXjsgnBJ0qrzwnZ14IEXM9T46G+uU+aSeEXopA5PWhKEgUSRICldbSHMELPl57hydr61i55OB
	HIt2jdZCEJ62TUO3PG6Fc0r6mgXRSDdTA3VYM7v2bOXb1cNsu64POhTsAbO6Hzo7cHTRmhy2NNl
	PhjwHnG9/JZtmtT8nOeirm+iflrt23YDGTx3tac3tspyypK2nEK0S/qo+m6XRGwykY06jaISyRd
	/9d/qomI89wnylAohcLPfsH8NExyTqA1xo3Avu0kW/XGVZvyHhVI3YAPuI+Xl9gKS4vgh40iWk+
	Xzt1p7FyUb+yOXUN3l18WY0cwMhjAq8gZhC0w38T3X18NNahbaFdIEj6snIEe3NT4IGfeS6tP15
	FZvIRIYVzSzkdW1buc8HfCteHwFwTaHKeUxbJBW7CfiKxzCOITvoWLqGi9ToCm3BpdKjL+Y3kIh
	YLrHDvGDFDt0XCA9vI3ZxTmAJHHsT8E9J62P9PgEDNl11X0D0ykLicxiKcAiLoZEC6bOoMQdiCy
	gkVi+wOUamDIhYd7U8mPduAomCfdmF/2TkrcLJ2/1gaCSTLYuRl/vsV+0b/sciA5Xlf1sLw/KEH
	Xc9cEfr7KUJKt4JOxnJFYcMoFLHHFkmS2uxIbL+H9tNQFWKbXs6TKoJDsbSC42ahxZ2hkpqp+zi
	rP+iXNO1iaX7TL0vkFPoR7v+OyOAcJ3VJrPdFiYHNCbWEXHrGYsu007qG6O1VWIsGzwMxZKk/83
	NWoySw==
X-Received: by 2002:a05:693c:414b:20b0:381:7ee:d351 with SMTP id 5a478bee46e88-3856eb4103amr2078765eec.15.1795162105527;
        Fri, 20 Nov 2026 00:08:25 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm5947954eec.14.2026.11.20.00.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:08:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 2/5] musl-nscd: Fix parallel build race on generated sources
Date: Fri, 20 Nov 2026 00:08:18 -0800
Message-ID: <20261120080821.1085842-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120080821.1085842-1-khem.raj@oss.qualcomm.com>
References: <20261120080821.1085842-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 08:08:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132766
Content-Type: text/plain; charset="utf-8"

lex/yacc output in obj/src has no order-only dependency on the object
directories, so with parallel make lex can run before obj/src exists:

  /bin/sh: 1: cannot create obj/src/nsswitch.yy.c: Directory nonexistent

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...object-directories-before-generating.patch | 34 +++++++++++++++++++
 .../recipes-devtools/musl/musl-nscd_git.bb    |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/musl/musl-nscd/0001-Makefile-Create-object-directories-before-generating.patch

diff --git a/meta-oe/recipes-devtools/musl/musl-nscd/0001-Makefile-Create-object-directories-before-generating.patch b/meta-oe/recipes-devtools/musl/musl-nscd/0001-Makefile-Create-object-directories-before-generating.patch
new file mode 100644
index 0000000000..57f121f917
--- /dev/null
+++ b/meta-oe/recipes-devtools/musl/musl-nscd/0001-Makefile-Create-object-directories-before-generating.patch
@@ -0,0 +1,34 @@
+From 140313750a1e5e36aefa50b0c6b8e63336435ef8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 19 Nov 2026 22:36:18 -0800
+Subject: [PATCH] Makefile: Create object directories before generating sources
+
+obj/src/nsswitch.yy.c and obj/src/nsswitch.tab.c are written by lex and
+yacc into obj/src, but only the objects, binaries, tests and generated
+headers have an order-only dependency on the object directories. A
+parallel build can therefore run lex before obj/src exists:
+
+  /bin/sh: 1: cannot create obj/src/nsswitch.yy.c: Directory nonexistent
+
+Add the generated sources to the order-only dependency on $(OBJ_DIRS).
+
+Upstream-Status: Submitted [https://github.com/pikhq/musl-nscd/pull/43]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 1c69255..9de221e 100644
+--- a/Makefile
++++ b/Makefile
+@@ -40,7 +40,7 @@ all: $(TOOLS)
+
+ OBJ_DIRS = $(sort $(patsubst %/,%,$(dir $(BINS) $(OBJS) $(TESTS) $(GENH))) obj/src obj/include)
+
+-$(TESTS) $(BINS) $(OBJS) $(GENH): | $(OBJ_DIRS)
++$(TESTS) $(BINS) $(OBJS) $(GENH) $(GEN_SRCS): | $(OBJ_DIRS)
+
+ $(OBJ_DIRS):
+ 	mkdir -p $@
diff --git a/meta-oe/recipes-devtools/musl/musl-nscd_git.bb b/meta-oe/recipes-devtools/musl/musl-nscd_git.bb
index ef2553760d..94a404bb7e 100644
--- a/meta-oe/recipes-devtools/musl/musl-nscd_git.bb
+++ b/meta-oe/recipes-devtools/musl/musl-nscd_git.bb
@@ -14,6 +14,7 @@ PV = "1.1.0"
 SRCREV = "cddd6be6c629ca96f2d2e74ee52daf12bbef1f83"
 SRC_URI = "git://github.com/pikhq/musl-nscd;branch=master;protocol=https \
            file://0001-nsswitch.y-Replace-empty-bison-extension.patch \
+           file://0001-Makefile-Create-object-directories-before-generating.patch \
           "

 UPSTREAM_CHECK_COMMITS = "1"
