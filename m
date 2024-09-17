Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF58C35FEA
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 06:04:36 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.14911.1726553076320402774
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Sep 2024 23:04:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KGTJ5jcR;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2053525bd90so35460575ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Sep 2024 23:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726553075; x=1727157875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgxopeQrNkPQ5/B8Jp8yI6ibq8OD9DhfPY4S+/qCaYc=;
        b=KGTJ5jcRDB9PJFbjQrUBV+hqUv/JYFEQsYypudjg8qzDHzra3tryJWrAjOKZMxf7Ay
         5CqkWHVYwEN2zhsKixZE8psLuXw1vTtCTl+t9MlNg/7PFgYBvyYx7QFsJKV7cczLSS3a
         wS6CnQlJwOu8xwqrDRj5CUNugfzph/x1ygT2gZt1lgM8zS5xeStvT4Ti43OLgaTW/RzT
         gfAr7RIEY/X7UeoZqtjv5HLf+USWDufafgeQqibi0O9u/x6Xy3oU97is2+8WE/TEdZ5P
         kiTGNl5EXQ+BJO5yNtr+YSC4QvssV942JHLfxEflZ3jPbJkg9QDPQTfI6q+1JcnYedCH
         u1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726553075; x=1727157875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HgxopeQrNkPQ5/B8Jp8yI6ibq8OD9DhfPY4S+/qCaYc=;
        b=j/HJ2N6gOiYU2K1yDJp9oeF1Nfo7zG6KdVt4PfZq75aphhEW+I/3HVo0A7SdFXqYBV
         JwBzqLMSmLbLqVB25EzlosI2eDX5sTLzaX6spWdkkGKGJ38mSogwnN7AifJpSR07g/iP
         +6AgtZzsmTeT98b7tZXhiozt0jZMCKTeywlRNKDCqvmLAi7dT3Bc6i+WDeQesI8CNAWp
         WFNbu9+8riW8cLkac6vMLVFWC0PFzG7BObvHjbusK95cUe6RQkcg6x5VF7N20TtUgw0V
         r8LXoQfMnukMb03P49D7hEaRjG/XYFRsb0rhffOfbolJxNuMbBzJDZevJqCNGqrWRGF6
         VoJw==
X-Gm-Message-State: AOJu0Yy+CJWmrdWM3FKBMHOUX2iPCUoPcjiqqjrgMavy/5QoyvtJfb6h
	vKFxV6xh5SNAMaZ2UhoCPh5BztwqIWupSwWl1xPpO3p0NI9DGi5W3txRB1tC
X-Google-Smtp-Source: AGHT+IHCV0d+zTTasUih8reiWpzet47/z8nxRnWeKQY21pnTQ4VQjbHBxfj8KLQe5jFUmzitcGUcJA==
X-Received: by 2002:a17:903:2291:b0:207:14a3:602c with SMTP id d9443c01a7336-20781d5f60bmr217151275ad.19.1726553075593;
        Mon, 16 Sep 2024 23:04:35 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7379])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2079475df17sm44294645ad.298.2024.09.16.23.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 23:04:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 09/12] ot-br-posix: Link with libatomic on rv32
Date: Mon, 16 Sep 2024 23:04:21 -0700
Message-ID: <20240917060424.1692067-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240917060424.1692067-1-raj.khem@gmail.com>
References: <20240917060424.1692067-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 06:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112335

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/openthread/ot-br-posix_git.bb          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
index e5f8db24d4..ec930de275 100644
--- a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
+++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
@@ -29,6 +29,8 @@ inherit pkgconfig cmake systemd
 #    for (uint8_t i = 0;; i++)
 CXXFLAGS:append:libc-musl:toolchain-clang = " -Wno-error=sign-compare -Wno-error=unused-but-set-variable"
 
+LDFLAGS:append:riscv32 = " -latomic"
+
 EXTRA_OECMAKE = "-DBUILD_TESTING=OFF \
                  -DOTBR_DBUS=ON \
                  -DOTBR_REST=ON \

