Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE280CAC58E
	for <webhook@archiver.kernel.org>; Sat, 13 Sep 2025 09:53:07 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.2150.1757757184549585509
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Sep 2025 02:53:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H4yvQa2W;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-afcb78ead12so345325366b.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Sep 2025 02:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757757183; x=1758361983; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wgf/VR9n6oc2Z1on9IhhHCP/lmYVeByuLztUKo64mNE=;
        b=H4yvQa2WRi45XWBcCP+X/if8CqFovgdfJzJc+EDj3/uea0WsKFZqPYgQm/gd29jhoq
         iPKkTwvwNkAm21h4vj3VZJHnfS/adjrgPvfCzM8eDAssSN9yQYaMO03F7tX9WQUQl/27
         YYLJb+ZnqeZ2gaSw0GYXg7/SIrKec/VzUaT0M1/wQKpEtCfxpAD6viYE6dfLDXpJUB7E
         atV7ppgiL0yx4YvxvRT5tMN34xanVumCgJkAOzW1i5YOlKme8/nT0Jk/Ldr32udJaFxI
         Z5YQAedL+1Hq3Md6t3Ze+71LpDGs16ix9Zetv9vMoceR3bYnd5X/2OBXbpqnE3VeLf4S
         3i4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757757183; x=1758361983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wgf/VR9n6oc2Z1on9IhhHCP/lmYVeByuLztUKo64mNE=;
        b=p8noluyYluL4xzL+2N58Xb5Hv+2rxlx+r31TILgyMJ8frazhL/hZ3mZLFbIyEG+Z1/
         CXRNwiTRURa3cGahEanercZcRmtt02PEiNN4QS2U4WDq1yukV5dbGgq70rSL11AGOJiZ
         I6QMsTvv+k7wbIBHz12JXSGYZYuWNuIEaCk0xccbbgrZicTjlbXuHgHZr6GYC+vnNwM+
         HbV9YmjsDzIUB8WumUOaZ2PWhKoh+hZgdrA1n93hvh6zz10BjxOtQzKsn63CGNzwbzwL
         qQcxQcjuxczxt6yLZ53fEhQ3z7hmaz/jyra4Lh7lEJm0dpSAWTUV/8nGjeXRnoZzdBNH
         fdjw==
X-Gm-Message-State: AOJu0YyE62nkhS8a181AG3b7dx5lejlcINXMfs1ZXPnSEHDT5oqRGe40
	Y8g9EO/0XRvv5JbY7ZYYz0u5piOUZ60FvXL19y+eqZEBAhmi1U+1siLXATjvvA==
X-Gm-Gg: ASbGnctgpBYg9sVe2xq/DDPx80iblPbMt2KeBA/DvQCVS65oethTMfyQ4HIIOybmFDf
	QtjHowgYAl6BG2e3jlSANFH5toMRGzihah8IgS1EylaRhdIxjyGJMzgFkPg4ExGmv7Ewl4CG93E
	/e4I8GA+TAYPPJRLbc9i95PpdOXB2bNZpwo6pKIYUx5KGD18re2FG9gDLyg7DZ7czGGnqCmeN0Z
	reM/gy8EN4pNqVPXvH72/UuT/ZOEmJ2NHhvqajUW0QkqbMPbI0e5ZjKY3dQL9BcF9CpW2LZQlU2
	poGQXE0Dk61EC1F5wED+CnuHINlHM0/4DTAGG2kssTQkWP3wYLtBZcLWfE0o+52ZoGSUYc26Gle
	UmerdINJaqV9acjEQkLdq
X-Google-Smtp-Source: AGHT+IF2iwdRTl7GZzjvTJJg98s5MMe88V9TldpF+rGvu0rlMfnq2DJ/iek3OSOdVMdZCzp+26PDbQ==
X-Received: by 2002:a17:907:3fa1:b0:b04:3dc7:7d80 with SMTP id a640c23a62f3a-b07c357befbmr570391366b.18.1757757182568;
        Sat, 13 Sep 2025 02:53:02 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32dd3e4sm535529666b.54.2025.09.13.02.53.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 02:53:02 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH] ledmon: fix building on 32-bit x86
Date: Sat, 13 Sep 2025 11:53:01 +0200
Message-ID: <20250913095301.2081096-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Sep 2025 09:53:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119382

Building the recipe on x86 platform fails with the following error:
| ../../git/src/utils.c: In function 'get_uint64':
| ../../git/src/utils.c:105:18: error: passing argument 1 of 'str_toul' from incompatible pointer type [-Wincompatible-pointer-types]
|   105 |         str_toul(&defval, p, NULL, 16);

Upstream has already changed this function to avoid overflow due to the
size difference in the pointer - this change backports that patch.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../ledmon/ledmon/Correct-get_uint64.patch    | 44 +++++++++++++++++++
 meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb     |  3 +-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-bsp/ledmon/ledmon/Correct-get_uint64.patch

diff --git a/meta-oe/recipes-bsp/ledmon/ledmon/Correct-get_uint64.patch b/meta-oe/recipes-bsp/ledmon/ledmon/Correct-get_uint64.patch
new file mode 100644
index 0000000000..c4d8ff80b8
--- /dev/null
+++ b/meta-oe/recipes-bsp/ledmon/ledmon/Correct-get_uint64.patch
@@ -0,0 +1,44 @@
+From ed747ac3540cb38797f56533f9f51f5627e6b994 Mon Sep 17 00:00:00 2001
+From: Tony Asleson <tasleson@redhat.com>
+Date: Wed, 21 Aug 2024 12:27:28 -0500
+Subject: [PATCH] Correct get_uint64
+
+For large integer values, the existing implementation will be
+incorrect.
+
+The current implementation of converting strings to integer values
+uses a signed integer for the intermediate conversion and performs
+a range check. Since any value in an unsigned 64-bit integer is valid,
+the range check seems unnecessary. To mimic the same code path, we would
+need a larger integer type.
+
+Signed-off-by: Tony Asleson <tasleson@redhat.com>
+
+Upstream-Status: Backport [https://github.com/intel/ledmon/commit/ed747ac3540cb38797f56533f9f51f5627e6b994]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/utils.c | 9 ++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/src/utils.c b/src/utils.c
+index 86b9593..b87d064 100644
+--- a/src/utils.c
++++ b/src/utils.c
+@@ -102,9 +102,14 @@ uint64_t get_uint64(const char *path, uint64_t defval, const char *name)
+ 	if (!p)
+ 		return defval;
+ 
+-	str_toul(&defval, p, NULL, 16);
++	errno = 0;
++	uint64_t t = strtoull(p, NULL, 16);
+ 	free(p);
+-	return defval;
++
++	if (errno)
++		return defval;
++
++	return t;
+ }
+ 
+ int get_int(const char *path, int defval, const char *name)
diff --git a/meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb b/meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb
index 88a6e5bb30..23a49a7d1b 100644
--- a/meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb
+++ b/meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb
@@ -16,7 +16,8 @@ SYSTEMD_SERVICE:${PN} = "ledmon.service"
 
 SRC_URI = "git://github.com/intel/ledmon;branch=master;protocol=https \
 	   file://0002-include-sys-select.h-and-sys-types.h.patch \
-	   file://0001-fix-build-with-clang.patch"
+	   file://0001-fix-build-with-clang.patch \
+	   file://Correct-get_uint64.patch"
 
 SRCREV = "b0edae14e8660b80ffe0384354038a9f62e2978d"
 

