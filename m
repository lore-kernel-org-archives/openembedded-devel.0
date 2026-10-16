Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D4ECC6B2D
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 04:07:55 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14623.1792123666484137949
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 21:07:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Z+BSWzvs;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e98798cbddso1052545ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 21:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123666; x=1792728466; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IJNuJD+C9GaY6GrsU/QKR1XHI+lERkve30Ttga525jo=;
        b=Z+BSWzvswFImzK/PVNmeoxyrtUwKGDXMxkPgBmdZAMj/9j1La8h2tQaoksrdqkFb/i
         X9YvdX9YJcEHPsxdCd7jy9BkXULXH6um/426JNE86FYMhHphdTTf83qqOYoFrFSwOxSC
         vzkJI+VxkwO9+ezTSebqGO8bJZX/pFiTtXWcRK4hdRtmZJMwSLE/yRCW+v4eeyFWFcGb
         LK/EUUZ3XmiVAj44A/UBnS1q0LBQqPIrHs63/RS578DxVrcjbYSpCB8te5gp/j5ad0+V
         /4Dtuu5VZAJbsbIc4jasf/U2V/geFkSZcr7wHBHbGG0HlyQgp20JoLevfL7KF+IK3QFS
         zTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123666; x=1792728466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IJNuJD+C9GaY6GrsU/QKR1XHI+lERkve30Ttga525jo=;
        b=GJAja9iKPwNP+5fibzuRxM77nDLNBcbs6ePhkamh30fqoCUxCEphAovSwkuGQs0f4b
         aV6wqg1q+2EjzO53ml+oF2shXTmgWYN+u+BqpaTNUKxcOdoxJSk1ukja1pgfKo3CslL/
         Y4zYeR/17sTnbJdFZ6wgOgTqGAlniXNGBgBhAY0qlypqDQk13KV4/lYAMyzGZgZAei3q
         G6SYIXNxZxfI6VNfbx2CNg6BleiuCUmlWEjc8RKLfdeKFemHSxjjxktSolOp3j1D3p27
         IIfJSxotfcGDFXVAqMB7WGKRQfIsneFaexucE31MFmaftGd+SyV+T/FTIG+cJy/NFG3k
         g8Yg==
X-Gm-Message-State: AFq9FYLlSFdXu5bD6YwfEJucjGTJ7GB2pupycBysd195SnHdNSQHAEd3
	3H8jmVdEFF6snQiIDZ3g8TdkrBEziDpUJn9fnZZWro3746mi0zJydZRZkSPiDg==
X-Gm-Gg: AYBFou0WHZVkaNJ2+XdCkNw3/IuZTlCfv6KgLtJlB/F6YLUTRc1OoHH93pI7t8bXUy2
	ROmNz83qMYuH0rS+LLaXPMkS7lXuM4xAw6r3LPLplXqPmV6vaVLosZx3j0RAA6y/PqmtI/ebIRf
	yLUX6c115fkGq6A2jBW0v/qr35iD4zkzdCKx58bp1egqs989bKQ4dgpzmF1dwT/mpH/fpsLWAAj
	p87PAVkpj+uorECdlaeyscqZxgFka9NPCNSWJB2YRzSv9WjGgf8d19w1idyVzB4zRSlKCtRqRmO
	W1E1pPsNnw6COQ8LMgcKmqBuGgfwmZ8ZNckvrosIcUdgLrr3SzdGNxEBwhM8gbwy0wNwhBR8Wy2
	xxEpmqqZJt1hqtENDkCFgI//PpC/kqNF62ApNwOGMvtaENWWYqs10uSmAyVEHdc4UZAkW82e0bH
	SGgWx0HDehbmF7Y6DsFPVlRjWFmiVBJthO+K6Mdcw4y9OllGXE71350pRS8BIVrLkd5wt6NHKIH
	54YXdCokA+1ULivVOJTfEgLaAgXGeYJKt+WnUA=
X-Received: by 2002:a17:903:3503:b0:2e9:740c:36c with SMTP id d9443c01a7336-2e9740c0571mr24081365ad.41.1792123665672;
        Thu, 15 Oct 2026 21:07:45 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e83498csm3796335ad.35.2026.10.15.21.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:07:44 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 2/10] python3-astroid: upgrade 4.3.3 -> 4.3.4
Date: Fri, 16 Oct 2026 17:07:26 +1300
Message-ID: <20261016040734.1499287-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016040734.1499287-1-ankur.tyagi85@gmail.com>
References: <20261016040734.1499287-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 04:07:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131038

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/pylint-dev/astroid/releases/tag/v4.3.4

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-astroid_4.3.3.bb => python3-astroid_4.3.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_4.3.3.bb => python3-astroid_4.3.4.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_4.3.3.bb b/meta-python/recipes-devtools/python/python3-astroid_4.3.4.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_4.3.3.bb
rename to meta-python/recipes-devtools/python/python3-astroid_4.3.4.bb
index c9a209aba0..fd4c3e40e4 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_4.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_4.3.4.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "d03854b09d92c08e18d8e7d9185d393961186ed0747136d8fcb2d1c008a504ec"
+SRC_URI[sha256sum] = "d515a105722b72098bbe82d430d65e635f742b6cbac3bdfaf8b7c188b87c5e39"
 
 inherit pypi python_setuptools_build_meta
 

