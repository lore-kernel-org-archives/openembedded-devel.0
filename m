Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01866D715C9
	for <webhook@archiver.kernel.org>; Sat, 24 Jan 2026 05:32:22 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13754.1769232738302144430
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 21:32:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ln2hbBDD;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47ee974e230so25477975e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 21:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769232737; x=1769837537; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jKW/BFkPWekzg9e627VpdPZ7JeU5om0fxfeMZkQLrAA=;
        b=ln2hbBDDK/Vhl91MdEj5CO/nPO790q6R2ItUF9GqDc0j0nXS2ug914KhsDxl3NvV32
         wVQNh5khCJ/dLI5vpI+cNZBd9zGXqRoe2XIo3S4vO05o3+zOAh3qACNdK2of4aUYaCcg
         jxU0Kx6EHseKSW/Kx3Yoi8SpdloLaFjm+ofkorkOO09jFLiMUcbFztLQL1lJrMBTH9dq
         qFBIOl0GwSkKLqN/m4cmp4+AoDkGUPrWYRSlvSMIxhxww25qj1AjIDRGsZryty0YpYH5
         p39RsimM4a8y81AkIwO7gW+um4fS+2W4LOIg5+oDELKDfrDZyNlqgIMzdp2lu8vs7Yba
         HfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769232737; x=1769837537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jKW/BFkPWekzg9e627VpdPZ7JeU5om0fxfeMZkQLrAA=;
        b=m6AcNl0jLpJsdJ3FXtDDQjh9i3cWjJ8qpQxGeT+CiBbiToXWOyGZiFkye0iIsGwwPM
         8xwu25scmGl+Dfpz0UZzcz/vk0OE6BVzKC97x+4lJ5G7ucB1+7S9VpHaHeu/kfHKanNM
         /N/mMpiHBg42T+8obK1tUnStUk3weDYW61eoUTlGtzJ3fxla4ZnrO5TC5AZRQKgSJIzS
         tEYppM1/2CUzJeQGRnZR4d9lLMVswJ+Eg/QphKPvte4tqAgyZVbL3YAaRyI7Ap3trHgn
         B5T39Xboo34MbbpQWueJ/unoyv/y8gPKC6DDqTtZ7Yc5RUMCEerQ5mMBsFykdAMkAKSN
         TIkg==
X-Gm-Message-State: AOJu0YzQHlTo25Ik3J4g+AQbc+b8vbhbgUVCkOtT4QNjUESdZ1SsQxXp
	SNowzUReb3s/PYyEerJYTmMmT+4YsMc5kWcgH8OFzNF5Enx4KlN/8lyKJvahWA==
X-Gm-Gg: AZuq6aLtJIifs14Tf93xDsdeP8YhSaWW9Ge5EO9JlBT1WzTvLynV0n1RnXSmf0ARodf
	lD3iEbc0NnID5VXHwZzbLFPAiWmxAcgJs2X+Nv9hoW1xFd7rdMDqj+VwUQDVoAF7/i/GGkVzyMs
	SnuMz7zek4R2/nFXD6mdRAAAmwmnd+EytSDJYUi4n2nWk5Rx8ntLUaXZf131WuvYy2HXdJshEDL
	AtTEUqbF9snpbg9QZjF+IeU7KTFW0pOvvmFWbwvKL+MusaBIfOdyDZwLJwD2LWtjcPmQcnKlhBI
	YJkr+RxujMBfsaeBg7Tn8FAJbywyYXDRrT5+ymsrdEJa8h181i3xtRAnLEv2r4X3mCtacBJ4atR
	oV3UIgRH/u12JMmdwux41j9n4KtmPWHTKt4ur2oMdFhaW7NmWIY5DNIQZ4SbWzSL0u8SOI5qeK9
	h6VCzdZXXwrMjO/t3++l0=
X-Received: by 2002:a05:600d:8443:20b0:477:7925:f7fb with SMTP id 5b1f17b1804b1-48052fd65b1mr38304255e9.10.1769232736566;
        Fri, 23 Jan 2026 21:32:16 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804dbb6315sm40746155e9.4.2026.01.23.21.32.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 21:32:16 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 2/5] sanlock: upgrade 3.8.4 -> 3.8.5
Date: Sat, 24 Jan 2026 06:32:12 +0100
Message-ID: <20260124053215.4066209-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124053215.4066209-1-skandigraun@gmail.com>
References: <20260124053215.4066209-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 05:32:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123803

From: Wang Mingyu <wangmy@fujitsu.com>

setuptools.patch
removed since it's included in 3.8.5.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit cc532b9d4e0394f442cc3e3b6c7f65858a551a3c)

Shortlog:
python: Replace distutils with setuptools
sanlock: fix memory leak of lockspace renewal_history
sanlock: fix pthread_create error check
Revert "sanlock: Shrink thread pool when there is no work"
sanlock: fix pthread_create error paths
sanlock: acquire should ignore unused options str
sanlock: use helper to set max_sectors_kb

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../sanlock/sanlock/setuptools.patch           | 18 ------------------
 .../{sanlock_3.8.4.bb => sanlock_3.8.5.bb}     |  3 +--
 2 files changed, 1 insertion(+), 20 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/sanlock/sanlock/setuptools.patch
 rename meta-oe/recipes-extended/sanlock/{sanlock_3.8.4.bb => sanlock_3.8.5.bb} (95%)

diff --git a/meta-oe/recipes-extended/sanlock/sanlock/setuptools.patch b/meta-oe/recipes-extended/sanlock/sanlock/setuptools.patch
deleted file mode 100644
index c375e10f75..0000000000
--- a/meta-oe/recipes-extended/sanlock/sanlock/setuptools.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Switch to setuptools as distutils is deprecated.
-
-Upstream-Status: Backport [https://pagure.io/sanlock/c/75758fc10db2354dda397d3aba63c7b72a420982]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-diff --git a/python/setup.py b/python/setup.py
-index b3bfaf1..dfbaf21 100644
---- a/python/setup.py
-+++ b/python/setup.py
-@@ -4,7 +4,7 @@
- # modify, copy, or redistribute it subject to the terms and conditions
- # of the GNU General Public License v.2.
- 
--from distutils.core import setup, Extension
-+from setuptools import setup, Extension
- 
- sanlocklib = ['sanlock']
- sanlock = Extension(name='sanlock',
diff --git a/meta-oe/recipes-extended/sanlock/sanlock_3.8.4.bb b/meta-oe/recipes-extended/sanlock/sanlock_3.8.5.bb
similarity index 95%
rename from meta-oe/recipes-extended/sanlock/sanlock_3.8.4.bb
rename to meta-oe/recipes-extended/sanlock/sanlock_3.8.5.bb
index a59a5c41df..ce289a0d8e 100644
--- a/meta-oe/recipes-extended/sanlock/sanlock_3.8.4.bb
+++ b/meta-oe/recipes-extended/sanlock/sanlock_3.8.5.bb
@@ -15,9 +15,8 @@ PV .= "+git${SRCPV}"
 
 SRC_URI = "git://pagure.io/sanlock.git;protocol=http;branch=master \
            file://0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch \
-           file://setuptools.patch \
           "
-SRCREV = "a181e951376d49a82eef17920c8ebedec80b4823"
+SRCREV = "b820c63093c4ae85d7da4f719cf3026d7fca5d09"
 
 S = "${WORKDIR}/git"
 

