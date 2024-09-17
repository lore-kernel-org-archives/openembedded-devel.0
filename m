Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA622C35FE4
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 06:04:36 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.14907.1726553072740381266
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Sep 2024 23:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k2k+Tk4w;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2068bee21d8so52221885ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Sep 2024 23:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726553072; x=1727157872; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vcXTRGmq2CrjN7b0Svgr1iN4/e9OkVidQqKuZH0zR2w=;
        b=k2k+Tk4wKkqXWA9qClmp1IzF/eCcX5MnfvtEW7ghmYZZUHTqYn9OCgqp5SW0ScK3Nt
         r8F0okZbGLQlUlUcJH7GFnw4hfYyelONj6DUoCSoFLT4psCRBwsPaJnIFqx4whEo87Gw
         IpKo3IHSmg++vbuwphm3C7O2g+2t3Gd27i4kJpYIue02ncQKavniu1Utb5h/YtgxI5cl
         RAAUTTJsGJs2DrDRx2KyMVUfsmvHodxVyBzHtzUj33sc57Z7XZKdbjA3IV04DRM25mNB
         updERpkDOq2uQ4wriwtlgfO/H5xOsWp9mS0mZkmE1R5f14tGSGVM6l0Mr+cnzBVJY00b
         uwrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726553072; x=1727157872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vcXTRGmq2CrjN7b0Svgr1iN4/e9OkVidQqKuZH0zR2w=;
        b=RjG6LvAKTrfXS15nPMmp5ymGDX+dU8/oZBwGaH75dQY0Swg+Ns2Fzo/FSCRcD5rYy7
         L6bE9Yrr4UIgXljJbO6+wKJSu6B0LdLhUdQk3SSYQJIsuuqKJH+uCzi2oX6kHx+bONCt
         +W/mAZ+9Jk1vdcIo9MHwfOYrlvhdL1RQJsZX0YwyMAskhQHUC22eA9eflE5sMFNCxPQg
         MU7sA5j+k/Vsx5ouQ16nrhrlwyuSpSUsSqY6EPxvSPa8ZXdDweo79O5r+SuCp6ivzdKI
         RHatHw8Yl2GWQdk/w18nu77oEZAsMGhu5+xqJLcGDGxmDrAd71tD/ETcWr8gnri4vZgY
         1P4A==
X-Gm-Message-State: AOJu0Yy8LeReeMGeHI7Ii1Ol4rtF5KWjpEuONCf+K2Mj93X3eB5PWNje
	diEBQGW4mPHFKp9jMElStYO3ak1L/rBS6FnVVzFVPqI49JhA72oz1rzhda9j
X-Google-Smtp-Source: AGHT+IEkCqrh2StlxXKuaxf6RV4H9hxgRUAKsgG9PAitOUlFjzAUqKcLo1olXGnKhsrc5xhcgOuZ4g==
X-Received: by 2002:a17:902:d2cc:b0:206:99a8:526c with SMTP id d9443c01a7336-2076e414a53mr241436425ad.41.1726553071850;
        Mon, 16 Sep 2024 23:04:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7379])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2079475df17sm44294645ad.298.2024.09.16.23.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 23:04:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 05/12] mosh: Use libatomic on rv32 for atomics
Date: Mon, 16 Sep 2024 23:04:17 -0700
Message-ID: <20240917060424.1692067-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240917060424.1692067-1-raj.khem@gmail.com>
References: <20240917060424.1692067-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 06:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112331

Fixes
riscv32-yoe-linux-ld.lld: error: undefined reference: __atomic_store_8

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb b/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb
index 693ec12d3c..bea22b18e2 100644
--- a/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb
+++ b/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb
@@ -48,3 +48,4 @@ RDEPENDS:${PN}-server += "openssh-sshd"
 ARM_INSTRUCTION_SET = "arm"
 
 CXXFLAGS:append = " -std=c++17"
+LDFLAGS:append:riscv32 = " -latomic"

