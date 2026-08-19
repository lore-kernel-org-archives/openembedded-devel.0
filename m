Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21489C5DF85
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 05:37:11 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.912.1787117821301422576
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 22:37:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=V6L8wr+j;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cf50c6f235so6978865ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 22:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787117821; x=1787722621; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cnsU/dTvjd50bzX4oaTfW4Dx+zYHL2vWaJ81n7Xq250=;
        b=V6L8wr+jjwDvjZbkpHLdaY0jllCi3MgSFS6STykrlF1lZ/jMFd8rScxTY7wbOkfCJ6
         mngOfk9FD0JVWuA9e5VCSMK5L+2olO4m9lnqC9AGj/w3V+UN338dRUQq5jHugjZC8KRO
         tVwOqAwQRvFYjHBhPM0brKT/7atKHBeCM2cON21ZkNbrOvkjMG+VpNR0RNOl0asCTL+N
         ikOLTLwFiBeq/hNkrnjAvV3bth1CneIN8BuHT3fp1M/pMnzV+DMF2biL1NdD4vYtPQwf
         DDXcvQPEMmFHs6jyr5Z5vu5vNqRsKWkE3wjDUi8JgKWzKnEK26POh9GnqnGcVh5ix4JY
         nxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787117821; x=1787722621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cnsU/dTvjd50bzX4oaTfW4Dx+zYHL2vWaJ81n7Xq250=;
        b=eDKfOXpBRmej+mU926Ry/xaiR2nGOmswhqIEkhYCMKZ3WxcmpmQ6n5t4dro2PztHxW
         i2ektI5f1qks0sylyms5G+KigM7/PdOKwrjjoamhLqQSemoLaKscTMkvAf94CrfPe/Th
         QzjaSVz7cLYBiaMuvwMMR0G748C880UEqKfhcwpicYxfIbzzsQMuMhuFslzJkhn6eGlB
         VIY7imelP5ele2pen+VeJQvXtxRuysn4r+FwkiLjM53ozC1wE4882aVZU44TAUHpNwWn
         4j1pVlLx3LG9rxAcncYptoeHk8p7tFTVGmQ7LlQTJPoR8+KwylLH8fG/vzUppA7Z/+SD
         lugA==
X-Gm-Message-State: AOJu0YzwUQk3T+050hXiIzNRUONnlfyWPn1zt8BM2KvG5jibuoTjuxqz
	qRW9VUVhxYFCkwhldS1FebCMrw4e2raDZ5j/wEXKyeAfuttJLeZ152f6yM7e2nJ6
X-Gm-Gg: AR+sD11x9CI8fgURPCsUrxSAOnV6GaFpEmJnBRk9Ml2KsrSivvsV8eVBuwaPY4FzZoi
	njZTol6+WEYNxuf0xEKn1vU1PftKgiQrW80gjHUcA+mgr7Vom4Hh9BktcA7bVNsIUAcrw16aT2X
	b0+NHUJL1QToFMxA00Q27HqQ8Xv+k6kdn9ugOqAZbZyBw9oUsH+NzcxhHCT5Qc1CGnfOOz/9JeA
	dfri8maxIVesYwOL8BYb/HCRL/f2x7J4OEsHklZVlTFVDVVZ7qbyDCmT6WRhUM9IHT8JF0px3ST
	q62uhzvmbjro4Y3/ieINQv8a/IF1vkMCJqbpqf6cCaih7aLJzh0QvBeWo56r2k6p+RqHsBybInV
	HS60P8dPhp1QD3Tnps1Sr8+QwSsuMpCHZsDlLIpGUrL6uMkeAQ+uEqoeP5pTh1EMU5KpO7fKsZ1
	sJ61zyzOaijMqf+IC+N6dv5UWqk+bzeaxHG9MqpMN70yI6Pa4IXnibgUJGZqDMBC7tJWa/vHtMQ
	w==
X-Received: by 2002:a17:90b:5250:b0:38e:9eb2:9d43 with SMTP id 98e67ed59e1d1-395810f885amr4342193a91.16.1787117820557;
        Tue, 18 Aug 2026 22:37:00 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416aea2429sm2830814c88.15.2026.08.18.22.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 22:37:00 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 10/25] ramspeed: add UPSTREAM_CHECK_COMMITS
Date: Wed, 19 Aug 2026 17:36:14 +1200
Message-ID: <20260819053629.391864-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
References: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 05:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129254

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version ramspeed
...
INFO: Current version: git
INFO: Latest version:

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-benchmark/ramspeed/ramspeed_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-benchmark/ramspeed/ramspeed_git.bb b/meta-oe/recipes-benchmark/ramspeed/ramspeed_git.bb
index 71c2827c51..5e1b59b812 100644
--- a/meta-oe/recipes-benchmark/ramspeed/ramspeed_git.bb
+++ b/meta-oe/recipes-benchmark/ramspeed/ramspeed_git.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=92cffec6695a20eab8d0e4770f4e9353"
 SRC_URI = "git://github.com/cruvolo/ramspeed.git;protocol=https;branch=master"
 SRCREV = "f3a766dc4f89cee97b5283d5c6bdf8b8e3474813"
 
+UPSTREAM_CHECK_COMMITS = "1"
+
 do_compile() {
     ${CC} ${CFLAGS} ${LDFLAGS} \
         ramspeed.c intmem.c fltmem.c intmark.c fltmark.c \

