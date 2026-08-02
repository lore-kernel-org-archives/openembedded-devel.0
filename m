Return-Path: <iwanicki92@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15731C55162
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 15:52:22 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25652.1785685933788686235
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Aug 2026 08:52:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UaJYGHnE;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: iwanicki92@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso5398565e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 08:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785685932; x=1786290732; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gpcIBZamzJyW4907ReoheAqEDnPsoHcRBOP62CiNQlQ=;
        b=UaJYGHnE0Cj4uAzXU74pzkBIDYOn4YD1KBUmY6Tf29EJOivN2CRj429eMP6c8yQRcZ
         8BlcmiNGkKXHED62Yy3pAuYn5mk/LYr0XZJjkBXoYHz0QnLS0v9faTqOreGyndiarotU
         zOFB5vOkLi06M2krlh9jDxb29Utir+yk/EMecgasHW8FfGK8EwnM8V+r8aW4BDdrkgAK
         pMyZAXmLxAxf064r5ukeugNLCqPqZ/GDo9v2zZJPRqZhhpPFqJr14V8KoxDVZufgL7Uv
         yP2UUJQL2zFBsRi5lGbRlDfAZoEl/YQxhYTOv4b8g3qABrZzMMLBZSOeVKYqmUivTULs
         vmng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785685932; x=1786290732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gpcIBZamzJyW4907ReoheAqEDnPsoHcRBOP62CiNQlQ=;
        b=Aq0U3kCe/N35TYbEhMHq78s4jMFvWsaTbEWOuaeqmc6By5ZYwLQd7QRT2IOsvuy2ay
         hyXxetohNktWv8QK0Dkz7uDs+xjErUBQ107neFI2Uww2HEouy49DYKSCgI0sFmbQBPry
         T8aoOHKg8Xd+hqk+k5f4ZVgWqynzPNckHlu/eIdsdEuXYe+52b4xXXIqtYRuEeHWKGvp
         h+6CNMBsutFDHjC8/zwEjNtkpasHKabBLPeu7EEJt1sUnwbSMUWSHoAfTl42UtPiCmAs
         +9hwHZtj+CPlpOBiPQ8SzsrWykts0I6SR23VLXY2Pc7URzMQf8tZoMjruiK5fdgdeZ6E
         eWfw==
X-Gm-Message-State: AOJu0Yz7rwASGtBQ16TOIySIQL6Iw+CUFpcV49RO42WQCrAqVaCp29pb
	HEW5np78NLW3KYpMsbdBaXnedXmVF0w5HZObX7r+0B16l9pAONwYP2NErF8gSH/n
X-Gm-Gg: AR+sD137VtKKq4WKmiIFPuZ4EH5VQxecKRGFbBPHISas9qUNAaJ7ePZnvmS6TTRVqL3
	/s1V9OoA80kP31fWeswN5bMXNhFdgskZXppiFtEoSjzZnahrHHQ+RYcMDpMhEiwYV+UbrkB840m
	Xx7hbH/j1++/QgOFMGYxBQ/6GCw6iznzCICmLAVjnQu1t+F/MtOnHmWQCLeVw6M6C15zSZ3poYd
	lw+7YApohljKZ9yRDlLAhPV+lCzIKA6KW6/99X0DcdQCVIBqPOpBX3Jx0Vy5sczZ9egGamn8ViC
	v5BiQQpE6LdGkNF6hHyk7A6UHYb/szmAbzxtDSU7eU/MzZL3ud1xkmggA636A9NQj0XcSh0kX5T
	cryVfiY+2hodxTUmTy4YVxKjgqYu/L2/VU54RuN7gMvuNE04HIdFlMhIel1rp3txRkoeNu2LzBg
	GWAYVMfH4N7bR+qED62WDAe+76Aa4JYR86A0o1jP3nesQiLTx/Loi7Cz7phzjFcDPXfOwCemkM5
	Lbbbndsxkiv5VGtf2CaHpl5yL6OJoI=
X-Received: by 2002:a05:600c:4e90:b0:495:7426:c392 with SMTP id 5b1f17b1804b1-4980eb4d5f9mr119803825e9.1.1785685931960;
        Sun, 02 Aug 2026 08:52:11 -0700 (PDT)
Received: from iwans-fedora.play.pl (89-73-147-156.dynamic.play.pl. [89.73.147.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b9441csm143350235e9.4.2026.08.02.08.52.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 08:52:11 -0700 (PDT)
From: iwanicki92 <iwanicki92@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/2] python3-typer: add missing runtime dependencies
Date: Sun,  2 Aug 2026 17:51:39 +0200
Message-ID: <20260802155139.4128822-3-iwanicki92@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260802155139.4128822-1-iwanicki92@gmail.com>
References: <20260802155139.4128822-1-iwanicki92@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 15:52:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128669

Move `rich` and `shellingham` from `ptest` to main package as `typer`
depends on them. Remove `click` since it was vendored in 0.26.0 and
`typing-extensions` since it isn't mentioned in pyproject.toml, and the
only use is in module that is loaded when running on Windows.

Add missing `annotated-doc` package rdependency, and missing python3
modules (went through the code to check the imports)

Signed-off-by: iwanicki92 <iwanicki92@gmail.com>
---
 .../recipes-devtools/python/python3-typer_0.27.0.bb | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-typer_0.27.0.bb b/meta-python/recipes-devtools/python/python3-typer_0.27.0.bb
index 42b5cdc07d03..11c8ff6fccaf 100644
--- a/meta-python/recipes-devtools/python/python3-typer_0.27.0.bb
+++ b/meta-python/recipes-devtools/python/python3-typer_0.27.0.bb
@@ -18,8 +18,15 @@ SRC_URI:append = " \
 PYPI_PACKAGE = "typer"
 
 RDEPENDS:${PN} += "\
-    python3-click \
-    python3-typing-extensions \
+    python3-annotated-doc \
+    python3-datetime \
+    python3-difflib \
+    python3-io \
+    python3-math \
+    python3-rich \
+    python3-shell \
+    python3-shellingham \
+    python3-threading \
 "
 # python3-misc for webbrowser module
 RDEPENDS:${PN}-ptest += "\
@@ -32,8 +39,6 @@ RDEPENDS:${PN}-ptest += "\
     python3-pytest-cov \
     python3-pytest-sugar \
     python3-pytest-xdist \
-    python3-rich \
-    python3-shellingham \
     python3-toml \
     python3-unittest-automake-output \
 "
-- 
2.55.0


