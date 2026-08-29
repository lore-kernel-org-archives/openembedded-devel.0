Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E04C9C61DD9
	for <webhook@archiver.kernel.org>; Sat, 29 Aug 2026 00:11:33 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.257.1787962287188224389
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Aug 2026 17:11:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=orrRifhN;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38511175ad3so1737394a91.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Aug 2026 17:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787962286; x=1788567086; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xDOgWJld4tSFQq809wn6MnN7cKebuEXF7BzVtJURXP0=;
        b=orrRifhN0GwupfR24ikMjfksff/gQwSeOvLpuRn+x+xTEcUrPKNf75Jx9AalvMuVEW
         JbYewrtVKWFS+hHGEcU50Wm7cgql9a/L4c4ahVwySP8c6DRXXkFh9HOlgHow5t8ALFpT
         d8SW9+87NhhDujs4axmz/CUo9aetfy7QB3/QHr0AgVxQ4qk2bLaBgCbXxyOHrDwZR4bW
         MVAeQOleN49YnaRm1DKuX7gphVkLIbcSxYZ3xfU7DjTYv4AD8TnXeU540EXqKgk8wqih
         cwv3nU5JRgZm/+QNsAWzuXNw3PQXHXdGUyWnH9OtHyzrMft2rCs1lyCdL+Pm+IZNXAdI
         18lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787962286; x=1788567086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xDOgWJld4tSFQq809wn6MnN7cKebuEXF7BzVtJURXP0=;
        b=MbHs2Z/G8rjTxccBtDtW3ukix3JoLTc3t2/ouCxRJwIYHEvvJvbpi3woz7JmXtTiV4
         +tXMBEprK1ZUGnKTR8QmY1VGEwEBRVqMPabacFA3h8XX2s87k1U088KlU5sBr162SGhH
         BD5WCYtEsMfRKETF2RqUznx+4enOUihOSCtF3Da4V3WEHeXR+7oo+rS6EzHiIRmhAEr6
         uhpCh/+jaSLPZ3UK02ZZ2l723HsIIRD2XJ5yTpjRkOG/k8Bhx2oy9aUcbaMy02hkSMnD
         rjS1Aa2ByIiWnl/hg1k1RGBCS2PNdJfQSb+7smRU2YwzqGVVlBnwUQnwjaUjKAbqus/j
         QeCQ==
X-Gm-Message-State: AFuF++mhNHzZAW7CiAZPdI6lrq1spXBkhzNPyoBLEOkwrz/phaS4u/4V
	CU6ZCKFSdzNAb7Ls2t+vm+xzdDqKj+iDvmBQ1f6AiFqZ9+8ZjIcrqmXWVj1snA==
X-Gm-Gg: AYBFou2bcqJt/o5wPmAF8Stefgz1M8NUFJvw7EM5YvWbMVq5Nh2R8he57xiTTbW628X
	zfNd9a8TLtoQEADw52BEhpfMa70czM+9vPvK+WjDBk279fxj+qa3X4SN0t9X9+B9j1QDHxCUzsT
	lLSKC6rzDgkI556ElbV9QGJWG8OgSiq/vK1vStbOn9sHQ3/K08I15YXigOUX4Cei4cx6AV/oIz4
	x2WglCF5kIIndh3h33ySADUwrgm9e9nAW8Wkfvn8XR0MT/MJ/t5aKRJGosmYCwFhpKjZGLhrl+R
	Yn+X742FkrYOKokWOuqyedtq0mfief3c6kdnm69L+jXc/xMAfxudZ/misPKhlCHlTnnr71jdJd9
	O6qe+xBwsW3ipMu42HRjChSwGooBAvocnG4ccViLiN3AIivanZGc12VCerxQ9peLEtkpZvcBar/
	p5kkwnlCukE7NG81AFYKl4vjhSEH9ajroYMtxGcMvEEuj2bdsuR1zRxhu0lhrzERYY+eQCYHYS3
	toPNpJlKw5lMZYM4meWnWrOcx0H33fZNXzaPUBYp7KZSlOQ+7mPRCDjEeI0d0pHHOU0rQQGO8NM
	QKSzRaHbK+0NciU7HZa5H+kDMksrrO+myHcNrW9Oem6Zk63ssuCaWXhbxOCsVqTv0C0Pge39TNS
	Qg0QPFi0p4/R5+tXs6lwpKP4Iy33oI6pl5HdeTOg9wUgEcw==
X-Received: by 2002:a17:90b:6cd:b0:398:9bd4:d14 with SMTP id 98e67ed59e1d1-3989bd40db9mr5042565a91.19.1787962286586;
        Fri, 28 Aug 2026 17:11:26 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d38207sm9236668c88.5.2026.08.28.17.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 17:11:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 13/16] python3-wrapt: add python3-image for colorsys used by test_deferred_patching
Date: Fri, 28 Aug 2026 17:11:04 -0700
Message-ID: <20260829001108.559544-13-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829001108.559544-1-khem.raj@oss.qualcomm.com>
References: <20260829001108.559544-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2026 00:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129572

From: Khem Raj <raj.khem@gmail.com>

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-wrapt_2.3.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-wrapt_2.3.0.bb b/meta-python/recipes-devtools/python/python3-wrapt_2.3.0.bb
index 9bc9b5d7ee..b61717391a 100644
--- a/meta-python/recipes-devtools/python/python3-wrapt_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-wrapt_2.3.0.bb
@@ -10,8 +10,9 @@ DEPENDS += "python3-wheel-native"
 
 SRC_URI[sha256sum] = "681a2d0eefd721998f90642762b8e75c2159ec531b20ad5e437245ea7b06a107"
 
-# python3-misc for 'this' module
+# python3-misc for 'this' module, python3-image for colorsys (test_deferred_patching)
 RDEPENDS:${PN}-ptest += " \
+	python3-image \
 	python3-misc \
 "
 

