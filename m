Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B649CCEB2FA
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 18:18:20 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13794.1763230694903370341
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Nov 2025 10:18:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cG9d1fk9;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47755de027eso22138195e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 10:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763230693; x=1763835493; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OjI7vNmfIBdwqxM0xbAYMtXyPBX+KTstm1OaAYnKrK4=;
        b=cG9d1fk9QvMVwnWdMOHnoVHlHWNA2X2cF1ctEE9atktuYla+LbLocarr3PTY9TsdEF
         sf/tRcq3MwffRlOWUzedU+T6rFUxZEBmmtIggTukrM+1JirbpVu3JSP1dvqUGHtzGrQn
         RvStFm8iMmcMFA1Z7WLhiDRgiQo8fU0UstVHtrGGkZWpmqnhcw+n8j2PqopnuO3og7kj
         PHiPrlamI7/B09BN2w0EAM0ASaXWxHdTOyKTE4W/0ygn2HLf26grCC4hBvUD+6FUz0oo
         8Urhtu5OHd6foIphS3qn0WBF0n3SnWbge9ZR45dK+oNu/OVcBV+GxNhd2IoGQrC3oZCl
         eqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763230693; x=1763835493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OjI7vNmfIBdwqxM0xbAYMtXyPBX+KTstm1OaAYnKrK4=;
        b=X3AfpL4LRr/cLHWgqHjrkM4eNk7vK3lKPFcKHGbOhFW7mcg520b8KWLtfmQFCi3Rau
         MI1ox5n2ULHllEsO0SmP4MhaQZOl3ptE7knmlZfpDi5PG+lVf4h2TRfY3ASaci7Xc6HP
         f1yvSAFzcLbLY6pa9eN2EJyE31x938K7rzwKKZSQ2pgUkH2Dqe96133NzGDsEm/SEZeb
         +4JnYoNGze0RYbqaFf/mq6RA4NRe5OG+UP5hRYMoZBgOruqO5pA6P3S/fKjhJTUGOkuQ
         BC556p+nqcAS8ebLvrgoK+PkVT+Eq8aD86idMY6P4oBH9E9z6n+E+CG2YRBblSrRQxst
         r9hQ==
X-Gm-Message-State: AOJu0YwdyKj5wmWLu1/FKDFdXtywXG78bUt2RbQrcE6Q+LMTCjJ7Vo3L
	h1Axycx6nHYwFz0jhabI5qfbtFK7Qt4pviYG2+c3dIQH5WygO4PL//91Qz2E9Mfn
X-Gm-Gg: ASbGncvMMcuI4RNlxbUfFtrV4DlDZJXJWoeUYNpQYTHLgz6WGayG5yQeMALFY6ytabt
	9FbVYFCYiP9b5XoW1+OQQIFeQW+7XytzibC2EYkd23DtsKUyw0sGFnnp7QK6CgTQemMBl8tlTCA
	DwXFjzuJZJffrA2fix7O07IDA/MUdE9PAidU/vNabUtCUQAZOCVzksnyxOz4BzPuwfCxVLrc1Da
	lb+fQCFwY4PHSUp86OUI5jQonO0QSp5cPBa7CPcP3FXgRjylcgCyM5ZOHXLSX5qkG0xjAESI+dp
	H3v1sNT2tjpxRsbMNM8AHjhYxt/bwm6xZcUxWh7iCmK+Fqo7UkKQmGKqpBr77R8lDmzzhcJSDQ6
	JAjJfx5ZdzqSX6wv8J6HDvpXfOo2TiutqZ5B9agPTixeH/V4AGf9JMGsD1tPbxI2XpMuJRio3HL
	wGc6z+t3KQ
X-Google-Smtp-Source: AGHT+IHCMxJhDSyx44DzLD292lXAmZkqUROS95waKB5htZEGSYZ9vp1Z463wYBGFByZ1oCYU0BTZIQ==
X-Received: by 2002:a05:600c:4f0d:b0:465:a51d:d4 with SMTP id 5b1f17b1804b1-4778fe41c75mr68981025e9.6.1763230693222;
        Sat, 15 Nov 2025 10:18:13 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7b12asm17344186f8f.10.2025.11.15.10.18.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 10:18:12 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 4/4] yasm: patch CVE-2021-33456
Date: Sat, 15 Nov 2025 19:18:10 +0100
Message-ID: <20251115181810.1262158-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115181810.1262158-1-skandigraun@gmail.com>
References: <20251115181810.1262158-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 18:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121741

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-33465

The patch was taken from Debian:
https://sources.debian.org/patches/yasm/1.3.0-8/1020-hash-null-CVE-2021-33456.patch/

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../yasm/yasm/CVE-2021-33456.patch            | 35 +++++++++++++++++++
 meta-oe/recipes-devtools/yasm/yasm_git.bb     |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33456.patch

diff --git a/meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33456.patch b/meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33456.patch
new file mode 100644
index 0000000000..2340d8ed75
--- /dev/null
+++ b/meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33456.patch
@@ -0,0 +1,35 @@
+From 1126140b8f5ece18c58640725f0e4c08e5ec97b0 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Sat, 15 Nov 2025 13:34:15 +0100
+Subject: [PATCH] A potential null pointer difference is that the return value
+ of the hash may be null. This fixes CVE-2021-33456.
+
+From: lixuebing <lixuebing@cqsoftware.com.cn>
+Date: Mon, 25 Aug 2025 13:51:28 +0800
+Subject: Fix null-pointer-dereference in hash
+Bug: https://github.com/yasm/yasm/issues/175
+Origin: https://github.com/yasm/yasm/pull/290
+
+CVE: CVE-2021-33456
+Upstream-Status: Submitted [https://github.com/yasm/yasm/pull/290]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ modules/preprocs/nasm/nasm-pp.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/modules/preprocs/nasm/nasm-pp.c b/modules/preprocs/nasm/nasm-pp.c
+index f9f92dd1..473d98c1 100644
+--- a/modules/preprocs/nasm/nasm-pp.c
++++ b/modules/preprocs/nasm/nasm-pp.c
+@@ -1102,6 +1102,10 @@ hash(char *s)
+ {
+     unsigned int h = 0;
+     unsigned int i = 0;
++    /* Check if the input string is NULL to avoid null pointer dereference */
++    if (s == NULL) {
++        return 0;
++    }
+     /*
+      * Powers of three, mod 31.
+      */
diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-devtools/yasm/yasm_git.bb
index 9bd81c1dfd..6ddd94621a 100644
--- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
+++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/yasm/yasm.git;branch=master;protocol=https \
            file://0001-bitvect-fix-build-with-gcc-15.patch \
            file://CVE-2023-29579.patch \
            file://CVE-2021-33464.patch \
+           file://CVE-2021-33456.patch \
            "
 
 

