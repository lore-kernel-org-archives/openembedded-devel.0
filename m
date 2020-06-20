Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web12.4885.1592688035011403261
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Jun 2020 14:20:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FJzq4S4d;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id dr13so14076796ejc.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 20 Jun 2020 14:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=x23kHkn7+xp0/ekjKUgfbNrg+o9PyKoCPD2hblaECjQ=;
        b=FJzq4S4dwenDzyltorGCvaOA5vkW7yDU4ATEed51K5scZ/otuos1FTWTxVH7pjsRWw
         QobCK9RLi+mAqCgZJTEup2CxoHqwM3k3i9/Uzi5K3dotJ1v1RYeajhrl3njqnxWmbsjq
         CxYwFxkc0yvPG0B5y8tMykMi6NXH+VAH4vF2axwX8kbKSiXN92xfADqq5TL+MSNY7OZ0
         M6OUg5vvaWlClbS8/Q5nBYfIw1g6bVtyXtCGDJGzek/E8zhIhEbJVzNPVIXeLvb3KM+i
         htNoLu/Lt8mFq14FZfTyzd+Ane+PBoIj+rt0hOGvKmdOCtnx/WIOesOnwsUs16EKFWOS
         phog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x23kHkn7+xp0/ekjKUgfbNrg+o9PyKoCPD2hblaECjQ=;
        b=lanDOxJ3lsPue4NTCExnESSeZOmGwMV2wkp08hK6JpY/rAiC4MfPoa7Bf9SPHtOFHw
         ANCcAW2EPBu6navl857jKDqXoIRWYzgr0EyBXL2irtjUOpITzNbMQIgVthMDKNOhk1rR
         zKB6FyKdayduQvjwV1hV0r/AG9LPuLShMEdtm4JFilClEg6dqTl2eWdLZ7OQsDYoZwMU
         3quBbB+Uwlf5dIJ8vdLwNPQ/UhN6pmXhFbPWN6Q0Mjl0GondRCdnU0Y6IsHWI975WIla
         vAU9E13i6D0H7voAiy7U2q+q8d6ArMqJ7W/S89IuBEtvQYHkGi93xVbAxTNX2wqFI93e
         O/Bg==
X-Gm-Message-State: AOAM5328UTkipUi3csgoE2swzWY0L4p8VEtMZutuwnUkCgHTaYLK57fJ
	yDz0b6ZVNZld6Wb9T2dsKilCYdDNj0teFA==
X-Google-Smtp-Source: ABdhPJxKQgLjHvoUu/SAS5h41kdvKUdiM/0VzlEOLsc8tYGKpvCGmEIHW6ZWmRLmlQnC/bpx8QE6CA==
X-Received: by 2002:a17:906:4716:: with SMTP id y22mr9608504ejq.125.1592688033376;
        Sat, 20 Jun 2020 14:20:33 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f07a073c7ed84e0f8e2ef6e.dip0.t-ipconnect.de. [2003:f0:7f07:a073:c7ed:84e0:f8e2:ef6e])
        by smtp.gmail.com with ESMTPSA id f10sm2928010edx.5.2020.06.20.14.20.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 14:20:32 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/4] asio: upgrade 1.12.2 -> 1.16.1
Date: Sat, 20 Jun 2020 23:20:22 +0200
Message-Id: <20200620212022.82066-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200620212022.82066-1-schnitzeltony@gmail.com>
References: <20200620212022.82066-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

License checksum was changed by change of copyright year

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../asio/{asio_1.12.2.bb => asio_1.16.1.bb}                | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/asio/{asio_1.12.2.bb => asio_1.16.1.bb} (67%)

diff --git a/meta-oe/recipes-support/asio/asio_1.12.2.bb b/meta-oe/recipes-support/asio/asio_1.16.1.bb
similarity index 67%
rename from meta-oe/recipes-support/asio/asio_1.12.2.bb
rename to meta-oe/recipes-support/asio/asio_1.16.1.bb
index 35f875fdc..f381d12fb 100644
--- a/meta-oe/recipes-support/asio/asio_1.12.2.bb
+++ b/meta-oe/recipes-support/asio/asio_1.16.1.bb
@@ -1,3 +1,4 @@
+SUMMARY = "Asio is C++ library for network and low-level I/O programming"
 DESCRIPTION = "Asio is a cross-platform C++ library for network and low-level \
         I/O programming that provides developers with a consistent asynchronous \
         model using a modern C++ approach."
@@ -14,10 +15,10 @@ inherit autotools
 
 ALLOW_EMPTY_${PN} = "1"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=3e73f311a3af69e6df275e8c3b1c09b5"
+LIC_FILES_CHKSUM = "file://COPYING;md5=de86c8210a433f72bd3cc98e797a6084"
 
-SRC_URI[md5sum] = "312e53385e2daad10f08d57f91ad3431"
-SRC_URI[sha256sum] = "4e27dcb37456ba707570334b91f4798721111ed67b69915685eac141895779aa"
+SRC_URI[md5sum] = "569f4b082c652ae8a8ad94fb470016f9"
+SRC_URI[sha256sum] = "e271db76dbbcda9835ed1c9c94deb2ba3f4589c3ebcaa71d99ac694b8d62638c"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/asio/${BP}.tar.bz2"
 
-- 
2.26.2

