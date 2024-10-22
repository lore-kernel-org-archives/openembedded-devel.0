Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A19ECDD0FA
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:31 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.21789.1729612094633616527
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IHTIbnTL;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e2e340218daso526424276.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612094; x=1730216894; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pmT6E8B3NsYmFOqZPAUBszHZndWcEh1N/r6oJnMxgDw=;
        b=IHTIbnTLdwPs2E86qjP4jSPudlh/3kvjmxYKzR47jPflHiPC1K0rU0T/dPMAo6HbLI
         KHlc5xSTNaL0Bqkgkf4iVmI+ZqJChWZJ2piYeqfKsthPvQbH4ohFLfJCtx/inML0CI8D
         BtPHpn6aGSRbnm6ArlXO4/yyonFGXG43cf1kZz497HCJqIz5DoR1i/5AA9JoUTFzHND2
         Jli7gXwMwjawu1e12uAWqeYt7QmrXIZMYimdRDYWgKUjAvcOSS43LTW5zqgbEw086MfD
         WVn5DnU8EmuJ/Pl4uJos0UXjMRTfduvmR76RN4ifxt8+Gf0zIukBma5sD+bKLjLLcX/z
         NcJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612094; x=1730216894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pmT6E8B3NsYmFOqZPAUBszHZndWcEh1N/r6oJnMxgDw=;
        b=oDdVrHbYn1usS6JeacmQ7b8fPm0YacjYp09KaQDqleJUwj4CY/IVWvjF6KSlKXJPsg
         TIN4mGa73owQWph1YhLqO8vFfz6xC5sIkzedWYMMPTSQt01swzhrE3nJs2nPPR0qDxyk
         hd3hmpth4oEE2Y9p3UaLUcUXuMm7MOkC2WZLbpKo7zgiMDPXxMDWIWVDh8sNn7mYGyXM
         2snZpGiYs2YA1jHqOcKmISGye6hyQ4YwIgp1c2cSWMlApLU9RQXAq5F3EG7QTtNQA3v2
         ycBhWdeOXVIc56WLOEx+WSN0+g7/JJRfZDFJG+l8vJuKfjrDe4NCE6ZYtPKqONb9rngg
         /NGw==
X-Gm-Message-State: AOJu0YwEqNkfwgB7sXNVsP4NiqFw/NKHOPJkdTnvqrQL0Eb63CWkM4YT
	13TRCcK4Ht0Y8178iFA7uSJ2s44zFDrb0NaU0WRjDFb28zfhEbwN3eTyZQ==
X-Google-Smtp-Source: AGHT+IEuD6ozIQaelJ9AeJbH3JPfZmj/cGV4nUwhfj5OLkZ8EBzdB88InVM1URDzik74uC5L2M8R3w==
X-Received: by 2002:a05:690c:688b:b0:6db:d217:895e with SMTP id 00721157ae682-6e7d82c3582mr29846047b3.36.1729612093266;
        Tue, 22 Oct 2024 08:48:13 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:13 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 29/46] libnet-libidn-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:47 -0400
Message-ID: <20241022154729.20331-30-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113120

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb b/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
index 4c4faab4d..a22b63809 100644
--- a/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
@@ -13,7 +13,6 @@ DEPENDS += "libidn"
 RDEPENDS:${PN}:append:libc-glibc = " glibc-gconvs"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TH/THOR/Net-LibIDN-${PV}.tar.gz"
-SRC_URI[md5sum] = "c3e4de2065009d67bcb1df0afb473e12"
 SRC_URI[sha256sum] = "2f8acc9442b3866ec7dc63cd449fc693ae3e930d5d3e5e9430fbb6f393bdbb17"
 
 SRC_URI += "file://libidn-wr-cross-compile.patch"
-- 
2.43.0


