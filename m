Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C4BDC433FE
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 15:58:17 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.23274.1668873495541287135
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Nov 2022 07:58:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CZcj0lld;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: akuster808@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id s20so5431485qkg.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d6mKcPhR1Kr9+E+35Oulu3aK0q2n5vykz1ho7o+ZKc0=;
        b=CZcj0llduYPtpk5dCKTixc7h2CxhMR7w9GgHvCM/NAXGd4Ey4XVXIXizMr8b/D/ijK
         opyiMB493oKIFyKoUUTPpwzL2aftZxZXupNpVa+qAM53sLLB1t98ZFERl/C9zAba/I9C
         PYXwH3uBKgbx2uhWuYplUPbwV2FJJAbrBEtCQGOm+vx5W6lA55ZnAUKIkZ+C7bMgMT0R
         Gp2qq2vyANzDijnk8zbQU4GnhLkJabqooYp9wiZ4rFIh2EY1srGEWEzOjTnY0HTyj2SJ
         fvlze3xUO9ErRVuF+APx6tdnlVJlXpg5OjoI7mig1I5yYp3QbWWSelNvxMRWHLQE+4lq
         ow+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d6mKcPhR1Kr9+E+35Oulu3aK0q2n5vykz1ho7o+ZKc0=;
        b=S+gAYs3+YdM+DyvvsjLuQ9yg5wu3LSq2AiyAJzGpldCdFXQKe7in2RN+hUZaCoA7RI
         JDd17MuFMp/2brgZ6V221lAjb7ocHoWGdvFKy9QiZt3Mj5u8ZY8gqwVNYIMC16lj0TGq
         AxPjOKrfaERhwB1FRt+JGVnkMU7OZAksvXKF2Y/QOv16hsVL/++uJtDLky08ySLPGrvL
         yx5mUiW1vQhayaAZ9YE1yCIW97j15TaJtNpKTTXEPJHyQ0IDpYugPhaLnVr2wUrjji2r
         dnuPYhSJhovZNtWGRSxi+UogjvAZzKMyn853bNs7drrnYPa9gFZ6OIEnbA3kH3OjxTJw
         VLBQ==
X-Gm-Message-State: ANoB5ploKST/4mOReWNlP44ZzHa25ySFsnxCDrJj98v1BKJ7qgqolEG3
	tfjGRPgPRNkJ9XCITbpeqijAaxd0detfzA==
X-Google-Smtp-Source: AA0mqf4nli+kgb8jZKqdd8QE1dV7HX0QAqOkEgeyWpue0oilgpkPGup00rKoXDFcdMUvNlQJgi1lYw==
X-Received: by 2002:a37:b105:0:b0:6fb:db6f:d5f1 with SMTP id a5-20020a37b105000000b006fbdb6fd5f1mr5093176qkf.771.1668873494148;
        Sat, 19 Nov 2022 07:58:14 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8dbe:f48d:8b1a:1569])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm4821314qkp.74.2022.11.19.07.58.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 07:58:13 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 09/35] sanlock: upgrade 3.8.4 -> 3.8.5
Date: Sat, 19 Nov 2022 10:57:33 -0500
Message-Id: <3a11c4bd18a79d7fcb62bf78db5e589e38a68e4e.1668873377.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668873377.git.akuster808@gmail.com>
References: <cover.1668873377.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 15:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99648

From: Wang Mingyu <wangmy@fujitsu.com>

setuptools.patch
removed since it's included in 3.8.5.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit cc532b9d4e0394f442cc3e3b6c7f65858a551a3c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
index 3b4ae318c6..c2a17d06b9 100644
--- a/meta-oe/recipes-extended/sanlock/sanlock_3.8.4.bb
+++ b/meta-oe/recipes-extended/sanlock/sanlock_3.8.5.bb
@@ -15,10 +15,9 @@ PV .= "+git${SRCPV}"
 
 SRC_URI = "git://pagure.io/sanlock.git;protocol=http;branch=master \
            file://0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch \
-           file://setuptools.patch \
            file://0001-add-missing-system-header-string.h.patch \
           "
-SRCREV = "a181e951376d49a82eef17920c8ebedec80b4823"
+SRCREV = "b820c63093c4ae85d7da4f719cf3026d7fca5d09"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


