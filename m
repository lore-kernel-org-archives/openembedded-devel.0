Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54FBDC369D1
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 16:37:50 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.29509.1745771861347821983
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Apr 2025 09:37:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GsecEcA6;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6fece18b3c8so32300467b3.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 09:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745771860; x=1746376660; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S2XPyIZ8/j+6IZH6KBT2zPoGUERc7I3A1G4c1EjgcE8=;
        b=GsecEcA6ICiI733neiLFYteNgWlzdGtNM7YDRnUOVQhDLmB8FMI6nDfU0pdhYvt3nG
         JznIx30TUO3asxwLFbczrPn5Q8Ef2zIss5vquw2aLqgRYRku1JiqnZrSOcslKwvpbEBw
         r++f0l4fCWb1aY+fdQJfRLk3L759UZ3QMqCzGi6kHFVSyuI18G8edwf1mPOhKsR3wy7q
         VJ09iMh7IVLPkc2hdXxaNY2dBUqxeZEiJ68XMcBQKAsESDlJVSyxPdkXM3ZCKq96ouvq
         LWvAopdQyHG+xw1P2gx5NR1ARKLy5ou0wI4mQJhL/nDRUwY+cJIzszKQxkaMka3oA4ex
         NqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745771860; x=1746376660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S2XPyIZ8/j+6IZH6KBT2zPoGUERc7I3A1G4c1EjgcE8=;
        b=r6F34a+LJ/MUfrbja0ya0S2Ad8cK57VF6w8wGC9G0wn9nGphHpVWLVQnukkk9M8ODM
         hsyiUTFRtOijjQ0KBlf+9SxuMAO7AYg9acSQyS4BorNNOb1BpUvuoKCZ7oZxIhPvoQmF
         K0ua9cBy3QmB+0HarcdQx04ro4fZYZTnMyTjuOWLUSMk+yA2f2WBN1tFmP+Ru0q8O0n3
         EBu3fWxvLUQ4RgGSJuU7z4iyUAsXCih36iKSHpdkSeaDxFtYwi0x6fxVg7vf963kW04K
         rv4ERde6BoJcfToUV3wUVY2MoMps1ay0iua5vHW+hsY+hFdzaw3SRwubnk0aGtx3QXHv
         VUqg==
X-Gm-Message-State: AOJu0YxnN1R0dWuBoTU9M3sViWuhCRVZOuO2S8mg6wKd5y8X425UWppA
	rvoKd1UAgAjFonTZWlO7qQi2LAJNttOfZGPh8dxGP4hQybucKfmmoPxodxCn
X-Gm-Gg: ASbGncuR7asvOZkBCNrnXaEd7cnv2qQxOBkMS7qk3Uwnkx/SANd8kgNIPWSyH6h8M08
	I4aZdaOui/KEMQQ2tRP2S/RQOaQIScoaklB1Kbjm1dVUjM2ich6mJHpTx/VcIHS/PEgmhXkAd5z
	UE813/+EyeiqeXqZ61lltcSSDI+I2uyE5G9FSK26Dl2pZuxDnXkIBbl1wJCXV0yT2sq6H2TWpTQ
	pOTUIEhd4v/pcw1jWbpjFB3dK3oZ8MN/Id8UeSd5QFT2ME3ZWKauUIB//ESIQuEYw/Oll8ynNLq
	nLKx4KzP6pRDIpM1XaLHLn4Bhz5bafV1U9g34SMyVCGn9Q==
X-Google-Smtp-Source: AGHT+IEvkYvfESo15AmLad1/hUJ3Bw3MPkSgaywiTy33O8AFdGugHIZgvG8qwwNmemRDv1QZFFQc/g==
X-Received: by 2002:a05:690c:6707:b0:708:3a47:3d3e with SMTP id 00721157ae682-708540f85b0mr126808217b3.16.1745771859908;
        Sun, 27 Apr 2025 09:37:39 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70841acf838sm19956597b3.74.2025.04.27.09.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 09:37:39 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-networking][PATCH] pgpool2: upgrade 4.5.1 -> 4.5.2
Date: Sun, 27 Apr 2025 12:37:10 -0400
Message-ID: <20250427163710.14826-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 16:37:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117169

Fixes for memory leaks, uninitialized memory, segmentation faults and other fixes.

Changelog: https://www.pgpool.net/docs/latest/en/html/release-4-5-2.html

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../pgpool2/{pgpool2_4.5.1.bb => pgpool2_4.5.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/pgpool2/{pgpool2_4.5.1.bb => pgpool2_4.5.2.bb} (95%)

diff --git a/meta-networking/recipes-support/pgpool2/pgpool2_4.5.1.bb b/meta-networking/recipes-support/pgpool2/pgpool2_4.5.2.bb
similarity index 95%
rename from meta-networking/recipes-support/pgpool2/pgpool2_4.5.1.bb
rename to meta-networking/recipes-support/pgpool2/pgpool2_4.5.2.bb
index a2f7665df1..d3dadfc6d0 100644
--- a/meta-networking/recipes-support/pgpool2/pgpool2_4.5.1.bb
+++ b/meta-networking/recipes-support/pgpool2/pgpool2_4.5.2.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://www.pgpool.net/mediawiki/images/pgpool-II-${PV}.tar.gz \
 	   file://pgpool.sysconfig \
 	   file://pgpool.service \
            "
-SRC_URI[sha256sum] = "8e14b0558a15dae8767c8e1acee3f2f6c7c08ebfffda66a359367eaaa56c3936"
+SRC_URI[sha256sum] = "480ac23f01cd7d6c856b29386bf17a848712fb4b4057d4c8abd5c8bf819bdf06"
 
 S = "${WORKDIR}/pgpool-II-${PV}"
 
-- 
2.43.0


