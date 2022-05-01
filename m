Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 872D8C433F5
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 14:59:38 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web08.34682.1651417161544886013
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 May 2022 07:59:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DUn0MpMP;
 spf=pass (domain: gmail.com, ip: 209.85.210.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id g8so8171201pfh.5
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 May 2022 07:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=plLrVNbbcDePRufSpw68Bf7qdMrmR7U7Jj25jRPTUwc=;
        b=DUn0MpMPHJSJXwdkoY2nsa+jl6PqqYrC/ejzOTo65k6BGjj6v+3VwBk5S8VBdJGFEh
         AibjnkaydJuFDwsx7V7NTOyIix1eutOIuFXZ8jpApW9dW4YLCAtP7EoDvd/5+FSS8XJR
         bOaPhrl3I48wMjxaZ9FY/yTFyVNh877MTQpzchKgrzJRlkikY2Ndx5Ew3tAr4ydUlDvz
         srOn23R9cWYMymQc4hfhMeFtofbrZQy2Bp3gyolN7kf9xtyerCIRPN9MXMkwMWtSBUt5
         lh6Zx6r76xwrFwzXOBhdC9+5irgB2eMQVm4JpfK87u6NaeaqH4Ewxsh6X2a/IADaMTsW
         43bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=plLrVNbbcDePRufSpw68Bf7qdMrmR7U7Jj25jRPTUwc=;
        b=OqbiTAKMkdGDHnTvDFFRISLBFkldfiKXXJSPqv+wYV6G6GnTo5M+7OeAS1J9ozcUna
         BODRAqq/7q84tX1c6BpaT/GPcyxgbzMexn8mU36kI5NrH/ft+UuRqZKAFhDxCq7Nl0Ut
         +QX6C92cPVVJu1yVv/q/s9vZyATXrqnwCnSBT7Mv/xhF0Mw/4OyuZYHH9D6vFdYm8ec7
         /WOzEtgxN6u+091S7Kup89EaZVcmQwLOTZogS43vCnt7HvFjUF+oPHYvRK9Q+vueOa7y
         RoCiYOMMkKyPYWo97/6/ph43vFJ521EsXAmdTfmTlplFFOU0C8ek6260pbmtqHHqrN77
         YjRg==
X-Gm-Message-State: AOAM530CpMcFqnmCKLao5xL4i7CFbHzZ6rM2J8LGOPr/Q+BJjeR0bgTy
	1L6XNqFrM9EjuVe5WWKq1r0OI6eMIRURMA==
X-Google-Smtp-Source: 
 ABdhPJzgtImE4HKbXRgXBzbU+bkX2I1Y2B11HCD5ESY1vux5We1HskSAoNE5kHs5jm0ENiGbgJG6OQ==
X-Received: by 2002:aa7:970f:0:b0:50d:301e:e6ce with SMTP id
 a15-20020aa7970f000000b0050d301ee6cemr7143168pfg.61.1651417160756;
        Sun, 01 May 2022 07:59:20 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 x16-20020a170902b41000b0015e8d4eb253sm2973764plr.157.2022.05.01.07.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 07:59:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] makedumpfile: Use right TARGET for ppc32
Date: Sun,  1 May 2022 07:59:18 -0700
Message-Id: <20220501145918.2352072-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 May 2022 14:59:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96909

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.1.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.1.bb b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.1.bb
index c3f965b041..eb004c2ed5 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.1.bb
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.1.bb
@@ -36,9 +36,13 @@ SECTION = "base"
 # If we do not specify TARGET, makedumpfile will build for the host but use the
 # target gcc.
 #
+
+MAKEDUMPFILE_TARGET ?= "${TARGET_ARCH}"
+MAKEDUMPFILE_TARGET:powerpc = "ppc"
+
 EXTRA_OEMAKE = "\
     LINKTYPE=static \
-    TARGET=${TARGET_ARCH} \
+    TARGET=${MAKEDUMPFILE_TARGET} \
     ${PACKAGECONFIG_CONFARGS} \
 "
 
-- 
2.36.0


