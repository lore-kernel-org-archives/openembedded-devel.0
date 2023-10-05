Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 122B4E92FC8
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 21:36:45 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.28044.1696541795523662500
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Oct 2023 14:36:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=muJKjlTB;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1c60778a3bfso11905655ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Oct 2023 14:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696541795; x=1697146595; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+k/ZSIjEiYkNTVVg8aUTmKtakLNWGkTotwHV1CgRIwo=;
        b=muJKjlTBSs3djCo84dUJvwGCzZhdOoLr4BY9r9BvdIXzBTI8RiH1C7MCX3LiIkgfYl
         XK8/458yFnFLrt0FB5L3uGOBZ6SwMob/tXgEoNLN0kbRxCe7Dy7EhhZwGvUO8OlML4bb
         bZv5rpIf6AtcGOYzBQAVCqSWpA5RrFBb/IpxZEcLcq9lBfgRwOJNhmWnLHqKrwr+rxv1
         eEkhUaJDKr7oA2frxgOYqdLTP34Y8dip6wjZsWmDfBaawLIdOruCWixXD6YlJalH++Si
         K1VNOQJKnqGehpwqCW669Yr6Nqb1390pXIz2rtv1Nzfr23kABvWYr20b8JpNKLjp5IKw
         5liQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696541795; x=1697146595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+k/ZSIjEiYkNTVVg8aUTmKtakLNWGkTotwHV1CgRIwo=;
        b=KJ31U8z8ayUvUNwDpcBcOe3X5akMoZQzwnyz8yJG1VF374wFhWR2Lsxz1Xb/6N/lLW
         Sji8uQlOGX50CuXJOHMy0BUuMTeuIimIFmk64x6Q8mm75taEpDK11YvIDdsQ9lGUraN4
         tZLT1DYc4CZn6beDMUOYEQmXRm2yNN3uSb3Bl2fHgTtGuY0x4kGaolKzVim0KQj88Jfd
         qpVFKNVh1VW8OwYF/jfTRitwr2supgCKX3CY1GnNMoUiAneWhbNd9AANQAPHqz2vDHPm
         rk9tJdzSmXF02d/j5D6N/PuVTMuJyTMC2YVVnOW5I0HyBmlS+/5APl/D2pT4HJNHrztc
         qZjQ==
X-Gm-Message-State: AOJu0Yw8sOnYkGIk4ZNQS/FaKpMwAu2X41D2HRcoTYti9OU4hKLHSp8c
	97e2NUpOZ1AMCgIZfAsW41LoJzbFNDmKcw==
X-Google-Smtp-Source: AGHT+IFVlR8Bf90/TMXuo1AKlKECmLMPHrjpsrr/2y8a7qpJ1X2QewRry0XEef7wcEPyUmfNdWgMTQ==
X-Received: by 2002:a17:903:228f:b0:1c7:1fbc:b9e7 with SMTP id b15-20020a170903228f00b001c71fbcb9e7mr7269686plh.43.1696541794753;
        Thu, 05 Oct 2023 14:36:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::7f07])
        by smtp.gmail.com with ESMTPSA id jc20-20020a17090325d400b001c613b4aa33sm2233225plb.287.2023.10.05.14.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 14:36:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] ptest-packagelists-meta-oe: Add kernel-selftest to x86/x86-64 images
Date: Thu,  5 Oct 2023 14:36:31 -0700
Message-ID: <20231005213631.390714-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231005213631.390714-1-raj.khem@gmail.com>
References: <20231005213631.390714-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Oct 2023 21:36:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105363

Test run for 10+ minutes so they belong to slow testset

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/conf/include/ptest-packagelists-meta-oe.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 81094bf9a5..a2b2ce4bc9 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -50,10 +50,12 @@ PTESTS_SLOW_META_OE = "\
     rsyslog \
     mariadb \
 "
+PTESTS_SLOW_META_OE:append:x86 = " kernel-selftest"
+PTESTS_SLOW_META_OE:append:x86-64 = " kernel-selftest"
+PTESTS_SLOW_META_OE:remove:libc-musl = "kernel-selftest"
 
 PTESTS_PROBLEMS_META_OE ="\
     jemalloc \
-    kernel-selftest \
     keyutils \
     libdbi-perl \
     libgpiod \
-- 
2.42.0


