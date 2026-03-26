Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C851010A88D4
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 15:22:04 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50112.1774538519186538257
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 08:21:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iOcf62Ca;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so9257645e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 08:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774538517; x=1775143317; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ppC7MnyZcuVfYXis+oWrey3eSjDE8CtFi5SsI0O+BTM=;
        b=iOcf62CapoCy8DBXHVnlWHqnAl6RLe+UejGiDh67pzDP0BcetP8Xd5sQx+KA+gShzx
         XyXa4/wzofCGQ1bz5BSAyMcWtGKsyYlXKbyUQ5bDG8UkCGJKL39eNrONzDdzrZv7/ntn
         hqmNOVETN/DmyR+D0VG5PvumSzXNxilI/e1GonlUSieWrv9s7p8fTVSOoe6RWAlV7w0h
         RWmPCzFo9XM8k61cBvDDF70nTTaru0CNGJc2yWM1/W8jcubezLmY2YJomtbZPgfutIP9
         JzjB1VDzTr517IYo9otmAKZ+C1jDc4SFzCCgH1dCEhI9E16/2dHJOBUfKqr68tyuj0X+
         PqUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774538517; x=1775143317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ppC7MnyZcuVfYXis+oWrey3eSjDE8CtFi5SsI0O+BTM=;
        b=bW99tjFsHRg4HvXnnwBlJdcNGjSR62jN65DxEV+m8IyXApSULSyAoKnlsi2pdIIqgL
         bD2uv0kdS18H5917R/+co9kho5AvFVnx8/N1gfQhZVh4qBHo1purDcitBDplsIkpDd0g
         iBeeEusOHETELA+cmHU2RhHYoDaCMwVhcVzxrlosPwLehIIa5mM5pc7ouSnbyYswDWFg
         J9g76LOgf4269prY+g37+woa36CMmSi3NDj5crZHBHrjIV36eiGB/EGibNSpC1bQdHig
         SDBtEt+42N3VgtoD5MmD0tdpBh3HV6XULbgfGLDOU1m7/USW1jhkUoUSYwGtbPQU+z1o
         PJvA==
X-Gm-Message-State: AOJu0YyISD2Id9a3GlSxTGtt02KYlASjLd8zkdDXe4+lqLCfShbmogCq
	SqAFpDStMZnsv9CFImqm3Xro9hnDrIhFhKvqmwIDSuFg0MDosR+1OWHvAv1JJQ==
X-Gm-Gg: ATEYQzycEJzZSXA3eq4PNZhYPElaEo2iTiOEXc2JMYVl+rC4SnSFttB3hhlR2CIiRg5
	LrE079gWNyG9jrcZWKG15fWtHV0j2LTtYZzix8Wz+R1jkM4R2TkC9NNPJoy5RoIclQhdeHSvuSI
	AaNdIrLdwQbc67cnyjxYBwY2475LLZ6N8Ozxz9UuQXsu2TWyQlN6dOEuJRs3Sn4xwN8U80Nt7Ie
	iwbFX+1FzvQx1qjrvNYxZtdXBDFsXR84UJMXsgUtm2NHQRgUEN3wXglpRRPXL9NZPSF2OuUA5tW
	Jk69x0HZ3LiB71xZgQ1xdygW8yv23ead9ZbT5Ns7sGElxQVnzJHDdKlt1yVIXWjtbKPBBg8AE8F
	qlZ/TWJq5qkRwOYMjJ+rguVGu98pN4div+zwnHoUXiRPLgp/kuj2TYCzGtwH/O/gP6h8Kf0Cv6H
	b3nDacGppDtscNdw==
X-Received: by 2002:a05:600c:64c9:b0:485:3a03:cee1 with SMTP id 5b1f17b1804b1-487160b8be7mr116738135e9.33.1774538516749;
        Thu, 26 Mar 2026 08:21:56 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48720925591sm16478935e9.25.2026.03.26.08.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:21:55 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-networking][PATCH 03/13] openipmi: Stop using PYTHON_ABI
Date: Thu, 26 Mar 2026 16:14:28 +0100
Message-ID: <20260326152143.2224099-4-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326152143.2224099-1-zboszor@gmail.com>
References: <20260326152143.2224099-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 15:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125742

PYTHON_DIR now contains PYTHON_ABI, use that.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-networking/recipes-support/openipmi/openipmi_2.0.37.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.37.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.37.bb
index db74b91f7e..25073fbd3b 100644
--- a/meta-networking/recipes-support/openipmi/openipmi_2.0.37.bb
+++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.37.bb
@@ -44,7 +44,7 @@ CFLAGS += "-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
 EXTRA_OECONF = "--disable-static \
                 --with-perl='${STAGING_BINDIR_NATIVE}/perl-native/perl' \
                 --with-glibver=2.0 \
-                --with-pythoncflags='-I${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}' \
+                --with-pythoncflags='-I${STAGING_INCDIR}/${PYTHON_DIR}' \
                "
 
 PACKAGECONFIG ??= "gdbm"
-- 
2.53.0


