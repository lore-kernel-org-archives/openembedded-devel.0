Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E4A2D2A549
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 19:35:29 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.32012.1729107319094953033
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Oct 2024 12:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C8QP2r78;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37d6a2aa748so82799f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 12:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729107317; x=1729712117; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TtMcmsLHaxOOJNDTG6L+VR93zOV+G9YwFwhr38aJJ2Y=;
        b=C8QP2r788GhHF9qAf0sbgD/iFFqTmcQsxYtWuYMCg4MJuys/TKEhanOK+3cJ+7hyyx
         ZFIgaE475LyVBaaZVcMWaOq+Bom6J+u+CJXF+9nONIDiPIu44YrPy98tCqT0Tyc/7Blq
         oB1hk95lL6vmGmRm0AdyoEuzg599Aw6p7MIxWUx7e8XhUr05wJwo2Ih/Y7VgB26IkdB7
         mulU9k1R749dzhQSa92WMwHeed5DMnOBHXsrgPDI4lxMUQBt2qpvG+irofUUMRzav6Z/
         iJI9N3m1J1LtBGGFFt/dx1HntUG4M02Aa2SRyGYXitY9HFOwFJVjgqSPjYqgIALt7xc5
         gGzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729107317; x=1729712117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TtMcmsLHaxOOJNDTG6L+VR93zOV+G9YwFwhr38aJJ2Y=;
        b=pkujR5wItA3Ak+3KkNoZ2MVghcnv68nrdtxZYtJEzSVBeW/fAvlJVd6eSJDij23s4U
         hBSLzBM1g3pbbH/CR47nAjbYsAuwy4BewYxnKTenDsF0G7ZtWTnfk9lFYs8P6npK46IN
         kmWu4McEYKmmn53mFuTwM5AkLQ+CXCRet2cms8wceVVZ43P7lgIOeL6brORA2ODjDg7M
         yY27fcgvu2HOndVgS2LJ6NfDcJ+m4mHWshQlPokI4e2kmAkpiOJv8PkHII0Xvf1wpG/m
         cegFAKe/cMaux7va0FnnVh0qGA64KcatoiHekXwdpkOOnhJg5+rgKoiFTLQhdZBLlmmR
         aYnA==
X-Gm-Message-State: AOJu0YzsvY/hSrKqmBgRnJ6W+NIlRh833PuVacQ/3CNz4t/9U0q0RxyL
	/p4TSQtBkRBndFyRwqssrKgYsQRPvpB0JC3AaM4lNidnaWM1UP7nGEU/+A==
X-Google-Smtp-Source: AGHT+IHABZV5Rvzk3qNFVkcYBl3i0tuzhTudneZaWMGGZr6dv+lTmJcNUpI64NXstw3vxvHvYDSqLw==
X-Received: by 2002:a05:6000:4013:b0:37d:4e80:516 with SMTP id ffacd0b85a97d-37d5ff79f2emr12025829f8f.34.1729107317325;
        Wed, 16 Oct 2024 12:35:17 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fbf838dsm5120724f8f.78.2024.10.16.12.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 12:35:17 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/13] libsigrokdecode: add py3.13 compatibility tweak
Date: Wed, 16 Oct 2024 21:35:01 +0200
Message-Id: <20241016193505.3459828-9-alex@linutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241016193505.3459828-1-alex@linutronix.de>
References: <20241016193505.3459828-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 19:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112950

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libsigrokdecode/0001-configure.ac-add-py-3.10-support.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/sigrok/libsigrokdecode/0001-configure.ac-add-py-3.10-support.patch b/meta-oe/recipes-extended/sigrok/libsigrokdecode/0001-configure.ac-add-py-3.10-support.patch
index 45556afa8..a051f90c4 100644
--- a/meta-oe/recipes-extended/sigrok/libsigrokdecode/0001-configure.ac-add-py-3.10-support.patch
+++ b/meta-oe/recipes-extended/sigrok/libsigrokdecode/0001-configure.ac-add-py-3.10-support.patch
@@ -18,7 +18,7 @@ index 4802f35..e0e468f 100644
  # https://docs.python.org/3/whatsnew/3.8.html#debug-build-uses-the-same-abi-as-release-build
  SR_PKG_CHECK([python3], [SRD_PKGLIBS],
 -	[python-3.9-embed], [python-3.8-embed], [python-3.8 >= 3.8], [python-3.7 >= 3.7], [python-3.6 >= 3.6], [python-3.5 >= 3.5], [python-3.4 >= 3.4], [python-3.3 >= 3.3], [python-3.2 >= 3.2], [python3 >= 3.2])
-+	[python-3.12-embed], [python-3.11-embed], [python-3.10-embed], [python-3.9-embed], [python-3.8-embed], [python-3.8 >= 3.8], [python-3.7 >= 3.7], [python-3.6 >= 3.6], [python-3.5 >= 3.5], [python-3.4 >= 3.4], [python-3.3 >= 3.3], [python-3.2 >= 3.2], [python3 >= 3.2])
++	[python-3.13-embed], [python-3.12-embed], [python-3.11-embed], [python-3.10-embed], [python-3.9-embed], [python-3.8-embed], [python-3.8 >= 3.8], [python-3.7 >= 3.7], [python-3.6 >= 3.6], [python-3.5 >= 3.5], [python-3.4 >= 3.4], [python-3.3 >= 3.3], [python-3.2 >= 3.2], [python3 >= 3.2])
  AS_IF([test "x$sr_have_python3" = xno],
  	[AC_MSG_ERROR([Cannot find Python 3 development headers.])])
  
-- 
2.39.5


