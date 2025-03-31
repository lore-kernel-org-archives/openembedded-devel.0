Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 329F7C3601C
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 21:01:27 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.3831.1743454880838177759
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 14:01:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I2w4tLfF;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac345bd8e13so827679866b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 14:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743454879; x=1744059679; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FMdQ72PJbFmUCTRv4gLTaVZHIIj4x+a5tBtk6YWCMCo=;
        b=I2w4tLfF1M2Yw8sa9ISYzOkk9Bw5jz7vXxbnCeZQUxl5XOYkTNaQv1AqklDuAKA/vB
         ruuoGk6KLzL71pEnmWqDYDhWeEhEucEMXdwZTpg9XPy7/hpYyPn9cvZ4ErJ7RtFOKCGY
         l2J7F85yNK7/JxNjnZU66Z+tsKlT4cjqOBDZ1PBBfOnilcQ4kGx4RWPXqPD4KUJvfHxZ
         qAP0O5EhZkfYxhXPkDNqug0GenWWCTSB6TybkWUmBh35EvUAJEjoyg/5n8ekHPvhR1Dj
         XRGbEIYpUQU9K9YzQzzhgnFzmCr6Kk5M7RmOJpVKE5Z59bss0qZJ4R5bbth3oi5fPQpY
         q92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743454879; x=1744059679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FMdQ72PJbFmUCTRv4gLTaVZHIIj4x+a5tBtk6YWCMCo=;
        b=Kj2nktck3ABTT2pp9jRz0rMyqUeik6l80MOSW/L9k+kSSI5jZZV/bm8Z/S14N037Y0
         FH09wbI/pVBxN9c3vXfmWmN3kO7euZ0PQCXIzEJ5v5r6OPMlXDnNUL0AejKnSzQaSfEO
         YTDvuk1gIRtO0ruHyR9Nhiq/7BXbsZANjkFGZU6E4nqF/KKFaMgjjLsgG4hTuI+qEUFt
         BOb48ysQKUdNBC9AfyhnGFfy460XQMXza6ge6VeEfGqQAIKumiVoDcIPF/tAqDx8HxNh
         IABVjbPSlgy7ojrkhM74pLkIda3Ot0oXdd44pqlKYjgcNe6u56YHYKiT7yZufS1C7kS6
         CI7A==
X-Gm-Message-State: AOJu0Ywxm22lGrt+WbkU5TwbtquWBtn8kW7nsi2tKgC3/vIuuGCCdQLX
	SiYwH3AWjZX+Da4G4/UmTnyBk9eZjZN79PcnHNSspl5JhD2YT7CRHkVxRbYk
X-Gm-Gg: ASbGncukw1AM/ecmF1T+hk1nyDGI+Fw6386DbaRC3nGV4qVlno1bMek/dwQ1w3BjBxn
	mdqqlkrBck7EWmi+2ZJZEM/miR/TNlV4L8X2ypLwZ88nfj4XyhmR8iDuXJYs/0zDQjqd4qkKagB
	YROQrtV11n3mofFXCqO/1yOiyj0N3I/8ePiq6+EFL+dzxLL1Cnm0iK2//XVaxvAzDqdyVgR6wBd
	Yd02fcgX0IEFmWw0UZFEMBGmPYxuwambkJ/GCDwQEG3ZZBxgNC7zW0KO7dKA1IHe1fEO1bmI+Oc
	9GhSUnjDYtx5d16ryOS92KuVE4pab7PGd1B85VRLO9/tEeQ=
X-Google-Smtp-Source: AGHT+IEBQCDftqo0ASTlobjnaiOH9KvrmGyXCaamVGxBh90AGZ3hnI/Qb/OLJTfVkpEbQUXcRxuA6A==
X-Received: by 2002:a17:907:3da3:b0:ac4:751:5f16 with SMTP id a640c23a62f3a-ac738a4a56bmr913341166b.30.1743454878994;
        Mon, 31 Mar 2025 14:01:18 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac71961f9c4sm677902366b.99.2025.03.31.14.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 14:01:18 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	alperak <alperyasinak1@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 07/21] perfetto: Fix contains reference to TMPDIR [buildpaths] warning
Date: Mon, 31 Mar 2025 23:00:47 +0200
Message-ID: <20250331210101.3460858-7-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331210101.3460858-1-martin.jansa@gmail.com>
References: <20250331210101.3460858-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 21:01:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116443

From: alperak <alperyasinak1@gmail.com>

WARNING:perfetto-31.0-r0 do_package_qa: QA Issue: File /usr/bin/.debug/tracebox in package perfetto-dbg contains reference to TMPDIR [buildpaths]

Signed-off-by: alperak <alperyasinak1@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/perfetto/perfetto.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.bb b/meta-oe/recipes-devtools/perfetto/perfetto.bb
index 7e9408b0b2..884e0a024b 100644
--- a/meta-oe/recipes-devtools/perfetto/perfetto.bb
+++ b/meta-oe/recipes-devtools/perfetto/perfetto.bb
@@ -96,8 +96,8 @@ do_configure () {
 
     ARGS=$ARGS" target_os=\"linux\""
     ARGS=$ARGS" target_cpu=\"$arch\""
-    ARGS=$ARGS" target_cc=\"$CC_BIN ${TUNE_CCARGS}\""
-    ARGS=$ARGS" target_cxx=\"$CXX_BIN -std=c++11 ${TUNE_CCARGS}\""
+    ARGS=$ARGS" target_cc=\"$CC_BIN ${TUNE_CCARGS} ${DEBUG_PREFIX_MAP}\""
+    ARGS=$ARGS" target_cxx=\"$CXX_BIN -std=c++11 ${TUNE_CCARGS} ${DEBUG_PREFIX_MAP}\""
     ARGS=$ARGS" target_strip=\"$STRIP_BIN\"" #
     ARGS=$ARGS" target_sysroot=\"${RECIPE_SYSROOT}\""
     ARGS=$ARGS" target_linker=\"$CC_BIN ${TUNE_CCARGS} ${LDFLAGS}\""

