Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BEC7C77B75
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 16:33:23 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.69000.1683477194004226544
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 09:33:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=E9gawnhj;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-55a2691637bso55107197b3.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 09:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683477193; x=1686069193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ybFZoUcfS9BwyBPuF53LDuqbdxX/ohGPc+lDJVkKEP0=;
        b=E9gawnhjr27QdelK1mpYyH7l0rthAYidb7cIn8XpmPnMYS4rOc4eYtd2k8IEBeJX9Z
         FS2OORiFLcxxfWxoaKU3d3THgF+FA7F86sqArg9GffKUg0mdovogrRdIA0AibSa8/R7e
         xFtZvvMHsq8bIYqFmHKiWZpktEnumYcgaJCVPCr0EV8nhjz9F4FK58j27muUfH5/a2gg
         3IIKKVBw9+Ds8LR2hDx/w+S+wgzeGY2OFQCG7xQVmU5J9a471XNmSTWEdPpFbpiUOBEV
         3CQSD2CR27alt/b6ZwqUN+zbPWsauXpymtk7zE5sRIeQ6REE40dmlgLUf6EgZgLtAkdV
         nqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683477193; x=1686069193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ybFZoUcfS9BwyBPuF53LDuqbdxX/ohGPc+lDJVkKEP0=;
        b=KVFmVlgs7VyLxCeIqsJIUX9KolrcR8p1v/8VXS71RWCTZ6ApKe8SRlGNm5AckU64zk
         DjxyM/NDFfgAh6s9SAzv8rnC6z3WfpipOjbBA7dE/56v3RYp3NUXJdaEzV0Tvm44Biix
         NeWlrHTMdTwa/jp3YxlOOPvJkANKV9d2SO2K676pZAx+BXjA0ft9NO89XUE41Ll6abhT
         CYTyPmg71tJfWMeWb/iu3/PXE0Q5nvl9gIa/ocl5FH/tYpb+eHsmZsQb3oMF/GTfdbtp
         Vx9EZ4vpayKd2k0Jm+zMJ8bVLN60xmuq+UGOQ2P+EHqycGLmsZSHY1O0p3M61cRIWBxH
         9hjg==
X-Gm-Message-State: AC+VfDxHVcjDlwMrFKb7KKUuDR2OoON4KpJ73zE+a1Up2D964vcnpsHa
	w2YBlHLiUgDc39UJWw3FSK7vKHW7Yic=
X-Google-Smtp-Source: ACHHUZ5F/DBha20DQPAIg09u4VD89go5x5wyWe2C9zxYctaYUsi2F+WkYF6xjMJ1tBc3JEY1PSCzDw==
X-Received: by 2002:a0d:e209:0:b0:555:cbdc:c6 with SMTP id l9-20020a0de209000000b00555cbdc00c6mr8532864ywe.9.1683477192907;
        Sun, 07 May 2023 09:33:12 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b2f5:e641:5b7c:2972])
        by smtp.gmail.com with ESMTPSA id q82-20020a817555000000b0055dbeb68f7asm1113524ywc.69.2023.05.07.09.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 09:33:12 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 07/29] php: upgrade 8.2.4 -> 8.2.5
Date: Sun,  7 May 2023 12:32:43 -0400
Message-Id: <20230507163305.3261044-7-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230507163305.3261044-1-akuster808@gmail.com>
References: <20230507163305.3261044-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 16:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102337

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
    Added optional support for max_execution_time in ZTS/Linux builds
    Fixed use-after-free in recursive AST evaluation.
    Fixed bug GH-8646 (Memory leak PHP FPM 8.1).
    Re-add some CTE functions that were removed from being CTE by a mistake.
    Remove CTE flag from array_diff_ukey(), which was added by mistake.
    Fixed bug GH-10801 (Named arguments in CTE functions cause a segfault).
    Fixed bug GH-8789 (PHP 8.0.20 (ZTS) zend_signal_handler_defer crashes on apache).
    Fixed bug GH-10015 (zend_signal_handler_defer crashes on apache shutdown).
    Fixed bug GH-10810 (Fix NUL byte terminating Exception::__toString()).
    Fix potential memory corruption when mixing __callStatic() and FFI.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 486153255da95c1b4152a37168cc8f4528a1549e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.2.4.bb => php_8.2.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.2.4.bb => php_8.2.5.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.2.4.bb b/meta-oe/recipes-devtools/php/php_8.2.5.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.2.4.bb
rename to meta-oe/recipes-devtools/php/php_8.2.5.bb
index aec222b587..48a0d6b228 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.4.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.5.bb
@@ -33,7 +33,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "79186f94bd510db86e31e535dd448277a1eb92a87878303a1ead44602d8b1197"
+SRC_URI[sha256sum] = "e5a80663cca4f6044ad86a489798147c7af037eca96f6cd357ab36d28cb63757"
 
 CVE_CHECK_IGNORE += "\
     CVE-2007-2728 \
-- 
2.25.1


