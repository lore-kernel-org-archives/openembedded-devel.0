Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81DD9CCD187
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 12:59:47 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.7965.1759409981220042028
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 05:59:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZrdJPBJi;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b3e234fcd4bso182562566b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 05:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759409980; x=1760014780; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vp+9qqnWEB5PfpadT5D9KaYOq6KmgwJCJ++P9X01yWs=;
        b=ZrdJPBJiTj0rqJf4rdZJfst0ubbO/aVShBmaJf2ZRofYqOHezE3PEYNgXhAUpQWdgQ
         uba82IFSDHMfeqiadwJugNVHjAdHUyYHPeW4nPtIHikESdNelMuKeXCQCL+k+EUbRaph
         /jThxnJdUBclmEYaukkNcdADtCWcZmm4UWD6lRD8m75Aia/G322M64BRycbkJ1K1qym2
         RoRW5gm/pkk2AwF8uAi1i0u8siDgA9dysf8WUJ9x9UOkCf5H2wK2i4oqntQW5S9ks19c
         yTdUrSfhYE6Db4xnaxYaw6aeIB5Anfiz9dRkdZRWWdfxpvC/H5Zv3ukqNDOBtPPNyS86
         jU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759409980; x=1760014780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vp+9qqnWEB5PfpadT5D9KaYOq6KmgwJCJ++P9X01yWs=;
        b=AQPjhimXXXHusa7r6jNgQXv0VcPww8d3z/srKMtpo1WVyBiiCjMkzC8iOHKYufEHp5
         2jGvvfVlneD4KqZKfeETp1meal0+NA5F6Cx/1bk0upbxNFajIbS0K4yGgK3luSgjMWYJ
         t3+P26W/bbOrtkH2snXn3y6U4AAPl7J+Hsuq1V7LbZhOHn4SjA9hocsqM41f8gznMHAS
         fSGIbwFQ4oAu//rIpRd4NKh17sz27oAkNGdote2nZwHU0uYrH2R93j2CAJVgCjgDK8oZ
         bALjwsfxgsZb9zNH0jzt5CI+XbD6mDI9oQAJwNHfmBV6bNc2WR2c+obPjvecj+7ZMnj/
         VOPQ==
X-Gm-Message-State: AOJu0Yw/3jnBZJvk5y4duKFve7hRWjXejZHz4jHcqdQn6KrrybhoQjQE
	hOqjdPcTUyD26muAM7N7sFGZxN4qT76WK0lpwEmwak5h1qL943xUGyoMVtEDBA==
X-Gm-Gg: ASbGncsGKfZxA+mHEfUfG+SW/sqBWQ6DzerIvVGLYU4OEaYQrLSYJ4hV6a5pod/6bM/
	sSZnFa7N28gpDAwBLeFwZwq9BuAXc7nEVrPitWLsXdFOxHvnJSDRvu5JDJWvFn7Etci1cx3o2g6
	qHHRE1kivO2X+WzPquxy4ZiOWLIaFHqR7mLbPHMZ3hRf7XEa653CbuQynsP2xAG/nqr4k2pGYnS
	WWzSNaA88xXmyjPNVKE6vYVUKyMmNfDCtZ4QKQiLu0AlJTyl3y1+PF68HfVZnuXU1qED9PHdMZZ
	Vbp9V3Vf9KgkY5crcwYexKTF89sQYNSBbbcP/Suuv6M7AvQDyFpS/U9+k5SMFQMxzV4yWJjkVN8
	ZqzTgGfoi08zDk1xuji0GyK/6OkvOlnRM1leKysaldjYIY82iR7B5qqY=
X-Google-Smtp-Source: AGHT+IHRGPqCsNKckKqGBpaNAj/8tihEEgw5WJSQJmNW6McDXW2PGNXpDvrqj48a9fRwJL/csn+zjA==
X-Received: by 2002:a17:906:c14f:b0:b07:957e:b64c with SMTP id a640c23a62f3a-b46e70ffedcmr862095266b.52.1759409979463;
        Thu, 02 Oct 2025 05:59:39 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b03sm194127166b.84.2025.10.02.05.59.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 05:59:39 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 16/26] span-lite: do not inherit ptest
Date: Thu,  2 Oct 2025 14:59:16 +0200
Message-ID: <20251002125926.2624522-17-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002125926.2624522-1-skandigraun@gmail.com>
References: <20251002125926.2624522-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 12:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120185

From: Tim Orling <ticotimo@gmail.com>

This recipe provides no run-ptest script.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0fc5f550d31f82aa348a4145573df3aea896f5ab)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/span-lite/span-lite_0.10.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/span-lite/span-lite_0.10.3.bb b/meta-oe/recipes-support/span-lite/span-lite_0.10.3.bb
index 0d9a8c93d2..15380f5d7f 100644
--- a/meta-oe/recipes-support/span-lite/span-lite_0.10.3.bb
+++ b/meta-oe/recipes-support/span-lite/span-lite_0.10.3.bb
@@ -9,4 +9,3 @@ SRCREV = "cbb9c3c5162a0d7018c7b3e053153a04d4fbbbb9"
 S = "${WORKDIR}/git"
 
 inherit cmake
-inherit ptest

