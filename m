Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46234CD8CA8
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 08:18:45 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87537.1781338723668927703
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jun 2026 01:18:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=b1mtMT4q;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2bf125989f2so13436915ad.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 01:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781338723; x=1781943523; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wJDzWwgTfbi0Zm7DcZAlhFBUHV7QDzId8B0SfT6fmx4=;
        b=b1mtMT4qDdqW0GEyISgh3+MngasQ8c4sxlJ3bNI/ADNuKJyVQUDk5Yn9DPfodb2uLa
         6itzveVXC6pyuRslqQ/AUnysia/Uazb3aoe539FdMJNbz3sSpVjFMkfSgWOXTP6optbV
         4ztPMe9hYk/cOEgb1QIlhbi4buLgZHw1dCcxpM4je5IkYD+wnlb/c4TpOwXNb1LJak9Z
         n3hMuiaj86pZFmZ6W5H5+qmzqLWjjS9WR4LL3j0NP/Nl1avZKHyj5+ZguQLRuO6cu98t
         w2YQ5gU7ter7DvccfOQhL8YziU4uiaSGr48ScfZZp79fI9taINHFo9CUWxdp6zbApv9D
         WjuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781338723; x=1781943523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wJDzWwgTfbi0Zm7DcZAlhFBUHV7QDzId8B0SfT6fmx4=;
        b=JMH9HyeSJCsICZyo/PPOR+m4Ys/3KDSCOJjYxmCHtT/cFg287a5PDvM2MSFGUcGntq
         ZxPh+qUyftL/U8CO/jGmyH3j4XlJCbJmizCYoH5LS+i1duYEzXq2UCHhYu3BxofQy+kL
         jXnHZrVZvdC7qs3W3QI9jG9CZOyk++wxBxqDiUv+INdWzeQJlqicTzcfMV3e3U+U3P7F
         sl8F4i/QHKBZJoDka2DkrfgYnvosUcU7zvh2meH7ZcS0cc2a4fCkUQDvzIplmeHDLTlC
         YUXUAE+vQL63Qm0LTRqzj25KlcuRu4MpR2C9rOxGzK788pnWBVRjD2BKBpP84UIYsixU
         EGLw==
X-Gm-Message-State: AOJu0YzqzTy4mSjx4BfCALXuNjlBEIYHLYqdCoyouCGJIWW+EzrbfT4X
	z2pkRf/mPLQA13FCGlxXU+AEOV9uKM+jDM63YbEdAlfWbeYXL/fVVp5lGmC/OjWA
X-Gm-Gg: Acq92OH0Acgu7r4e06kGwyxtfDiTQWlGR6HwIMFDGEtkqTiffQqOjQ8uHrJc4l8FdCy
	e2mmk/zQ/RaOgmw5oYIXowaw8wHma4+eGx1tdijkWEjG81JVQZs1F94PUtPUnNChoYzaAKpdFEl
	M50Ext3jq3M5vCze0y2pDoZ2DDo2lYnFJuH+Q3Z88PaDr+sElrkTVg2UNSZIDgGoTVmOdREJGtg
	OFvZQ0Bj7lHwgSS3ICFrY9qS2mBzoBGipxSl0V6X7N8mIAlIuFzgyPs8au+QyFEFpgOWa/QbnGe
	+ZBqDU2rhRNoFNNGdhpMRqXAZCUhgUG52Grj0CQB0VFZqNZnsGeGKjvvBHjaPvUuHj52GX4+NFG
	McDbJBYbX0IyDX+nFMQJr30AMJElH0oLSFS8v332NOjZKGy6/KqTiluQ2FfMwVET9kN9b33kWRg
	XMCgBO929bHfNom5NR6kdZToCcrqTQaM4mVxly
X-Received: by 2002:a17:902:e783:b0:2c0:e2ea:6b0c with SMTP id d9443c01a7336-2c4134ec05dmr70043875ad.21.1781338723072;
        Sat, 13 Jun 2026 01:18:43 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42c43543asm43885095ad.0.2026.06.13.01.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 01:18:42 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Peter Kjellerstedt <pkj@axis.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 4/16] php: Correct the license to PHP-3.01
Date: Sat, 13 Jun 2026 20:18:12 +1200
Message-ID: <20260613081824.1223609-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613081824.1223609-1-ankur.tyagi85@gmail.com>
References: <20260613081824.1223609-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 08:18:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127556

From: Peter Kjellerstedt <pkj@axis.com>

The license used by PHP is actually PHP-3.01, not PHP-3.0.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 8aade001c144873283a54d74184617654b5c7a4f)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/php/php_8.5.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/php/php_8.5.6.bb b/meta-oe/recipes-devtools/php/php_8.5.6.bb
index db5bba9ccc..a78b6baafa 100644
--- a/meta-oe/recipes-devtools/php/php_8.5.6.bb
+++ b/meta-oe/recipes-devtools/php/php_8.5.6.bb
@@ -2,7 +2,7 @@ SUMMARY = "A server-side, HTML-embedded scripting language"
 HOMEPAGE = "https://www.php.net"
 SECTION = "console/network"
 
-LICENSE = "PHP-3.0"
+LICENSE = "PHP-3.01"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fd469cce1a919f0cc95bab7afb28d19d"
 
 BBCLASSEXTEND = "native"

