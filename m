Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA0D3C77B75
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 16:27:03 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.37611.1683649619880287627
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 09:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=aRV1fkB1;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1aad6f2be8eso57176485ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 09:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683649619; x=1686241619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5qHeYduxXpPdvBHJ13hUyYady/5wky+LZpWi4+zvB2c=;
        b=aRV1fkB1ouSnIB9QfHdqxMU8hW88kJ+J6F60HS5TOfqJpeI0pJtBwy2jPz112bZoJp
         TxkAuCe4IhanCcGz24QciqS1hhWiXzQE+NhZo+qEkWWDmL2VD7zb3o4kzPW/iSR0zGGl
         WhR0P7ZfRNzGF5dSNiIUNlNDhETEtoIMnVbxkiwIqMj4k0JtzIxy9tiXdqA2/28P/55R
         m6nUk0EbldHP7lDx6leOQbHTXkXLZnQgU2YFPEAMcHL/J5aCju6tcjwRT6AL3hmR9HKF
         qspsMFgeItpzCT92FgImpU48rjLxwWYnnr21KYKgXnuuTTaNw8JVcF9o1v4TdM5YHUQQ
         ovbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683649619; x=1686241619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5qHeYduxXpPdvBHJ13hUyYady/5wky+LZpWi4+zvB2c=;
        b=NhsYvgxq/0ItB4roYQH+PpM0UpsPkboX1vh759j3PpRnXjBg6KsUBAAM7MDkhwPhA6
         fRV6mW2xr10nS/pzNHtiI7q2L34k0ZpH0OdclTzKOxOATnLSuZfIxqIuopsCaLYTwU9Z
         R0Md+2iz7+x2JKR5emkMrKyzbGyWbpbAfV848rlWMA93dWrI0VMwYihghfx6yVFDKG52
         mUzqqOZjJA6mWdBka7bsfA7fEmJDlxMVKhPZJiFMMHtEQt/jdQiZYMtaaFWr5dyxTFHt
         mfhVIp0hlAyYbalAsKG+5Niez73NzmDIHr7Dl4BmQXV1Z/p07Lb6sct31x5PdSVZGF4O
         P0iw==
X-Gm-Message-State: AC+VfDzTIESka4ZSam2z77h/E6uSNrSFgwPC8HKrE4/uaGgVhLvGw47b
	AwT2XxQGxR41R7mEkNAn+jTm2+QPuQusfw==
X-Google-Smtp-Source: ACHHUZ5FHxs5xMoFiiy1vwS8iSQ3jhUuwfaM+oP/a1Ftpe/VJUIcTvqDtCT5uo+aRJy9xk46XS4npA==
X-Received: by 2002:a17:902:ecd0:b0:1ac:7ae7:3fe1 with SMTP id a16-20020a170902ecd000b001ac7ae73fe1mr8837056plh.20.1683649618891;
        Tue, 09 May 2023 09:26:58 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::298a])
        by smtp.gmail.com with ESMTPSA id jj18-20020a170903049200b001ac2f98e953sm1781603plb.216.2023.05.09.09.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 09:26:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libirecovery: Add missing build dependency on readline
Date: Tue,  9 May 2023 09:26:56 -0700
Message-Id: <20230509162656.3887196-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 16:27:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102513

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb b/meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb
index e3da1819b2..dcce524246 100644
--- a/meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb
+++ b/meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "\
 
 HOMEPAGE = "http://www.libimobiledevice.org/"
 
-DEPENDS = "libimobiledevice-glue libusb1"
+DEPENDS = "libimobiledevice-glue libusb1 readline"
 
 PV = "1.0.1+git${SRCPV}"
 
-- 
2.40.1


