Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E88C36018
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 21:01:17 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.3824.1743454874516597288
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 14:01:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ye3p3DDk;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e61375c108so6387497a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 14:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743454873; x=1744059673; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LRKXyodnbcazqINiicE69V6vfQsDkFhwxPRTZiS4rQ0=;
        b=Ye3p3DDkw0KrRYgXYCtZIu0p8I4j5IBW16hbjEbpyNM+dcKfYE/CKamE6qzhPsD/qh
         G24sqAbeNETSbwSupC0IrxNkSkfDSkmMwlnK9bPYPHBeRhi6BuIyzQdW+1FwDKf1U0WD
         Ix4Z5HxOJaz/6fqFpgK0Q6Bv3I2JYbJKKzswn+zGlEsbnoCxrtrw84lbGxE5XP0TrPW8
         5HHonvuDDe/wfz8K6BWNVGAPIP+MTsvT/z4dfps5wkfAr4Kx2evJTvrxeO8JImysgohG
         4Mxc6VeuSuG8xJ0rLTnnINGjHxPrlWHIPz4xwfPsB+RSGeGxoFTEXweQuNzOE2MOfP2C
         Fdbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743454873; x=1744059673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LRKXyodnbcazqINiicE69V6vfQsDkFhwxPRTZiS4rQ0=;
        b=p/cQtrFfELrJWS7jyqPztCWNsD7Ny3vvycsXlk+j/eZ7MXk4Q9myNElKiGsdg6Do52
         aY4H3bBXJaZEQz7WxiB0h/Rf+8Tqvn+UJ6B26xqHQYbxU0gSwjdfprqecsjJOz+oKft/
         jvQQ68adgPRnHXwtmnzzE2kkn0mLpzsJAH+5LCD4w9kFi0znlMxQv+OeWxxoOWXUSiDM
         GXBnWOAR8TnI60h+H26neoZkB9jSvQnVqA7tFef42PV07HBdyOsFoEL9XgvZzf+33OYg
         JOZeHP0tHwoEyPhEyivqScdZ2WOlWPYk8gcMCXbltTL/0JkCxyl9Qo1sEBa9LpyXh0xD
         m8ug==
X-Gm-Message-State: AOJu0YxUJZKKAkLci6AlH4bNuiSbEJm1BRWnF+WwFvrLcT2k4NBlQsU2
	3JV9aHeCRJoQMLI6ocOTb8imtH1nCzwRbYq552TfpNnXcN7dYxZoMd7ABTIx
X-Gm-Gg: ASbGnctER9FNDevrHfeR1Bv9/utbgSTv+IZYKkkXWz+UIXTyL7KDW16VM5L1JTyoeOX
	rV0WYRSL1L4MqApM0MIDPFgdcHRE2AaX+rfY7xTJ/tsNOaQk0TBZ/D/XxsVJI9rauIdovoNTo9t
	t5TeTvb/Uks04qIorx+tR13+dORN5TOjrVWHPAnhN0OJGrgJ+M/GrGnOOsGrqkgt13pzdOWibwz
	pNwXtrEvQqutto0iJJVPq4FVQbzTQe9m394EdeynYxifERLQAxZdVL3N0hkdHodU2Cmc46PCcJv
	W6GoWjIsBVgYy5DcHlp5/Pl1mQNzyGFSg72T0+9ebG678UM=
X-Google-Smtp-Source: AGHT+IEAvh2V5s8QdX+aeMhZeqjI/kZ6wRSXahFQML5tdrYXai9Il8HukypP3zyFPAQITDK2hL57jQ==
X-Received: by 2002:a17:907:9693:b0:ac6:ff34:d046 with SMTP id a640c23a62f3a-ac7389ea430mr1000574566b.2.1743454872672;
        Mon, 31 Mar 2025 14:01:12 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac719223e42sm670280066b.22.2025.03.31.14.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 14:01:12 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 01/21] wolfssl: Add packageconfig for reproducible build
Date: Mon, 31 Mar 2025 23:00:41 +0200
Message-ID: <20250331210101.3460858-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 21:01:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116437

From: Khem Raj <raj.khem@gmail.com>

Make this option turned on by default

Fixes
WARNING: wolfssl-5.7.2-r0 do_package_qa: QA Issue: File /usr/lib/libwolfssl.so.42.2.0 in package wolfssl contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb
index 8e86b62964..8f484d6098 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb
@@ -22,6 +22,9 @@ S = "${WORKDIR}/git"
 
 inherit autotools ptest
 
+PACKAGECONFIG ?= "reproducible-build"
+
+PACKAGECONFIG[reproducible-build] = "--enable-reproducible-build,--disable-reproducible-build,"
 BBCLASSEXTEND += "native nativesdk"
 
 RDEPENDS:${PN}-ptest += " bash"

