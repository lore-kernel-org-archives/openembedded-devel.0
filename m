Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05698C77B7A
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 00:14:45 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.8040.1684455280035283413
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 May 2023 17:14:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=LJYE5Hyp;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1ae52ce3205so18236515ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 May 2023 17:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684455279; x=1687047279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ef4OFQYb3P6Zu7TH3ob7wNrOeQAs7rsWbX0P6UgRME=;
        b=LJYE5HypdlWRq7ni0rutige/MxQl3eAeMuFv7E5JF3THF1C9Jcwp8WqzfDjPDhcCx0
         jzZTTvbmhoQ9EbmyNW2PMzXsNQTQg1Aq89hjWvifZ5THMi29At90BXitx0IPwCGpPTgs
         KMrB/UvbJviqbCQncnlgxjuIXELRkgamR1KmAIPqu0QN7v7ECs7mc3OdC6sSFz2VzdTC
         M9BV6XsY7GoRNJeWpcjzLWl5xK8kEC/B//U2yNusZJ95zGxVlxoK/NOfkQhbb0I307Jo
         VK/HIRnaBHX6UmJ6it/OSHiyJhbQTZEnsrmKjz7TERdKwLAE6dCXO5CuWDXDe4nc70Yg
         flLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684455279; x=1687047279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ef4OFQYb3P6Zu7TH3ob7wNrOeQAs7rsWbX0P6UgRME=;
        b=Nb0KyH05Qn9khzIMvlu6TpdJtW6p/5jB0f+AuFE3b5rqRE01EYwYXRenUrruOM2dMS
         vqmaGZaUBheELaNpGzFDTY+LXCCnRDH/PWtALYOrKREXi0TymZd7/Ti+/QyfnCMKzKAH
         qLLtfspWtEphL17QosPvHOjf0ndXn/LSyXk8XjAcxfPyXIJ2kXI6xNiml7rZahHCdK4y
         qG296fibzC1fxGgE+tmWHVg/ISBqgET6iMY9aJqIC7bbEyUGuZKSPz7VuOTAwgN0ecvS
         Uei+8kn668LdulZK/dxnYTZgd33R0cOB+j81FYocDTi1MctVj5qvW7lJ+2LzA3sDeFDm
         C6iw==
X-Gm-Message-State: AC+VfDy+wEBkJls0oyYwF10VTazug8FUsa4ynHbfGPyw7GYbwwA2UQKb
	W2XOlisJwcudE91PerINE3bdW0V/LrQ=
X-Google-Smtp-Source: ACHHUZ5vWMFCILc2UJxT/kwePSN1hRZxwI3fZeiXiYbic972fFT+dsBiNp+E1EWVl8Idx4iyDUMOmA==
X-Received: by 2002:a17:902:dac3:b0:1ae:501:e233 with SMTP id q3-20020a170902dac300b001ae0501e233mr1102811plx.7.1684455279230;
        Thu, 18 May 2023 17:14:39 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id q12-20020a65684c000000b005286ea6190esm1662127pgt.20.2023.05.18.17.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 17:14:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] ptest-packagelists-meta-oe: Remove nodejs ptests for rv32/rv64
Date: Thu, 18 May 2023 17:14:36 -0700
Message-Id: <20230519001436.3196347-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 May 2023 00:14:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102668

Nodejs in OE not yet ported to RISCV

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/conf/include/ptest-packagelists-meta-oe.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 81e0779ffa..23d81296b2 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -38,6 +38,8 @@ PTESTS_FAST_META_OE = "\
     zeromq \
 "
 PTESTS_FAST_META_OE:remove:libc-musl = "minicoredumper"
+PTESTS_FAST_META_OE:remove:riscv64 = "nodejs"
+PTESTS_FAST_META_OE:remove:riscv32 = "nodejs"
 
 PTESTS_SLOW_META_OE = "\
     fftw \
-- 
2.40.1


