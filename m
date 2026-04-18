Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20954F99C82
	for <webhook@archiver.kernel.org>; Sat, 18 Apr 2026 13:52:17 +0000 (UTC)
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.66812.1776520335420594580
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Apr 2026 06:52:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Sx73qR7X;
 spf=pass (domain: gmail.com, ip: 74.125.82.41, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1279eced0b9so2269497c88.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Apr 2026 06:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776520334; x=1777125134; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgfPwo81yg2eQOoutRxOZ1H9vtQrjjAiMh3ms79XIUQ=;
        b=Sx73qR7XrRxx+6qFDg2jQyUx2oZoSNlWpwcIPAL7/9CAXGlNPogPJAI5FjvePQMoZQ
         fLkZbsu2CSIMpWdXtsZtn2TiExFl7zAmv8QTEs4lV9Snn9Sq89VPwO3jOHMj/gUkYX7U
         6rv5xTZQrJ1R1c8vrDCAIV8sRhSDz7nfs6pdkMqM5yA73uBsG8QtPLS+aAltCT2EATTz
         s51s1kmrjQYxJIInlhiGKvCRMeZrS/bofArc38WKNEI4ajsPVb0/cdqQsT22570h5GKp
         4vjLwajTRFgRTDa/ZUkvCa331NKYt9kGKRjU3SNbHavV9OFD0woQXDy54Yc3+K5pnMzT
         jRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776520335; x=1777125135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sgfPwo81yg2eQOoutRxOZ1H9vtQrjjAiMh3ms79XIUQ=;
        b=Y1VYSCsM9DK5sHNikNN1h64CwQtT1zcvga7S9d2fvOU0mWE0nMMpBfMMziMq0zGqPQ
         7E3BaKHgL5dKorTYooxzY7KKcvEb2w6DLXbDbxdKeC/AsKhAWacpXsFbU8V9Zm2TDns9
         nGu/nv1OYMpvaubTmiYAkqT+8q9s0wKUduZFuPCcgnYHcaT4oDmCUtdZ8U8N3ZS4VzTS
         RnsUP82RdvEoiOPzGpKmplpDRwvB2Do58nKft1nGDJ/HZ9aLK3po1GhEMH4bWN1kZYPx
         WoXDyFxgxu2mmuPfSGrr8fRsSvS0dFj0AuY8+yyLfpza1Mi5lI/78UJBgFzjEZGoxuU0
         u2wA==
X-Gm-Message-State: AOJu0YwL780bOeDtq5qm1qv9VzCsYxppRkSjcX9TKTXih4PIMTB7+jGz
	Krncs3mK7RnEjw01zHF+f3PXwsGqANaLTqUIXxeqzgNTzeIZc7rgMyRP2xo8GxpI
X-Gm-Gg: AeBDieuvT/ex2qXbEGpadHpxIZMbnZG5G97mm1BFJft9Hp8LHXUtZfIFRxj6aCS5I7T
	os3YNkPKa98SUVLRFLL+wtnfUgnJdmZhvnkNL/XuY27orEFjIQ0vE8cQVKM/ZSx8zvpbkrlFaWP
	g/OconNdHtbZZC7bVcpKxX9CIEBqsvpmjaEaZrNK6Ic92oL8TWckmAmFkgQoiaJW+ZuEK5CEXQn
	hQ9WZx5bgwKzMn3VzVxBocCMCiycofYYjEf6g6VDTP3ukZmg8lIqJ5iEP6yAQM1vBwotwecIOh2
	hteJy7kPivYsNH7dhvq9f6c1MD/tVjIKGmaX9sGqU07oKzXvJGaGlsk8eeAE2iwEjQ/+Erf1OC+
	8tNDP1kMLo6uCNrIa23kdY7nyOyQ44QNGbgKc+YcqvIKSmBl98yzA2iZlYVRu7JwejLFTeP/R4m
	dM1YAN10FKcfeitkPlZq3s3/Oe1bInq8kVADubX5+/BLfMs9e0ZfG5yN/Z6VAM9WGnDpxLyBDL3
	iIWpit/yCT8qNGba5HJ8ieBFJ7TZ1SIyniUpvxFGmk0Bs3DzGqCsLt+tjLHakdxrkOG+YZb6O7Y
	c3MvbnlQ5Dg5rzbmrKFDTbmx4xGla4iqmRvjLFCU4H7ABCNF53U=
X-Received: by 2002:a05:7022:6098:b0:12c:2ed4:62fa with SMTP id a92af1059eb24-12c73fca846mr3626981c88.32.1776520334437;
        Sat, 18 Apr 2026 06:52:14 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a2ac32sm6642041c88.15.2026.04.18.06.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 06:52:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 3/4] libkcapi: disable C23 support to fix configure check
Date: Sat, 18 Apr 2026 06:52:08 -0700
Message-ID: <20260418135209.1635971-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260418135209.1635971-1-khem.raj@oss.qualcomm.com>
References: <20260418135209.1635971-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Apr 2026 13:52:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126454

Set ac_cv_prog_cc_c23=no to prevent autoconf from detecting C23
compiler support, avoiding potential build failures as the package
is not yet fully ported to support C23 standard.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb
index 7d27081964..532c9e29df 100644
--- a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb
+++ b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb
@@ -9,6 +9,8 @@ SRC_URI = "git://github.com/smuellerDD/libkcapi.git;branch=master;protocol=https

 inherit autotools

+CACHED_CONFIGUREVARS += "ac_cv_prog_cc_c23=no"
+
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[testapp] = "--enable-kcapi-test,,,bash"
 PACKAGECONFIG[apps] = "--enable-kcapi-speed --enable-kcapi-hasher --enable-kcapi-rngapp --enable-kcapi-encapp --enable-kcapi-dgstapp,,,"

