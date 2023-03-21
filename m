Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7FCDC74A5B
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 15:54:07 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.17017.1679414040513173307
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Mar 2023 08:54:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y1/vmIW0;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id h12-20020a17090aea8c00b0023d1311fab3so16376555pjz.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Mar 2023 08:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679414039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x3wh2tc2f3ZSV4bzrebA88vMv+rnKIv5ZS4RDg4K2f8=;
        b=Y1/vmIW06J2+joUhe6GR5iSYJd+hNC/vkH3ITRZghw1F/OOgb/9epnOx73l5NMjdeu
         IkMXnL+epp+VhclKhak6Wg6DvtjfbDsJReTGAvinKPbMxl5gacYhczhrDaJp3ZfKjs1d
         gL1cvjwbbbyUyqK9e8dIDTTNobsUwHHZcu/Bl0Pg4A26jaKSx9gEUrhzwBrpDtdfjjzF
         Be5arG0qfuR6llvMBvqmfzbVH+FE6IVCm/SJWkwVi6xRACohDdQvsMQI5qqN2sgGZGn2
         FKK9v/6i/5SZKUFFvFqgC75gHPIFiMpjyVWcPce80PXtqAsnpPlYYFTGsvA1fDRGXt94
         SEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679414039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x3wh2tc2f3ZSV4bzrebA88vMv+rnKIv5ZS4RDg4K2f8=;
        b=wSZ3yFhREutcAVFxcIgn1K0JoLeIYiaCtlPHRcv7sYlDgm2LaSOEMOB77DSKAkXYjh
         jJFtMcyvBcvcXUR53nSAXMZiQy7v0jLmLxEoptZTNQFWqICQnzZ5EXDmiWPeEYIPN1Or
         hIefnf89YKFhrbCB1vpAL8TzBYxTcVm0GgAPeEZYX668MctEx4X8xIQe95tQ1h7RvGSL
         5CWs33TWq+ahBbrkxqlxzueARJPq0PY2wXD5LUuV2v69JsK5pl3xqlyt6W05OT1Gol11
         ge4tvv0MLD3+xwXwB0sKMdzwgb0Eq7CkA5Yaqf+Ilg98YYGd/2LXCUT7MbyY+ViFOMdV
         UZqw==
X-Gm-Message-State: AO0yUKVfoNE4x1pN/5ixW3HxRxpTR/2dfr5hrynLw7Gjc0ZkLcQDcLQi
	Qd3MKtnP84y3ZWWa/r5NU/nbHCsm0e1Fdg==
X-Google-Smtp-Source: AK7set+uCdaca1dKRQo2qoP0kDg8l9THDXgRGpqwgvi02y7y6J3QM+LVs8RM2CqRSq5B3DnfH6yd0w==
X-Received: by 2002:a17:902:e5d2:b0:1a0:57df:864f with SMTP id u18-20020a170902e5d200b001a057df864fmr4023763plf.16.1679414039105;
        Tue, 21 Mar 2023 08:53:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::86bb])
        by smtp.gmail.com with ESMTPSA id f21-20020a170902ab9500b001a076568da9sm8879210plr.216.2023.03.21.08.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 08:53:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/2] rp-pppoe: Define _GNU_SOURCE
Date: Tue, 21 Mar 2023 08:53:54 -0700
Message-Id: <20230321155355.834207-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Mar 2023 15:54:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101618

Ensures that it picks up definitions of strlcpy() from string.h

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb
index 4e5def297c..d990388abb 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb
@@ -25,6 +25,9 @@ inherit autotools-brokensep update-rc.d systemd
 
 CACHED_CONFIGUREVARS += "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', 'rpppoe_cv_pack_bitfields=normal', 'rpppoe_cv_pack_bitfields=rev', d)}"
 
+# Needed for strlcpy()
+CFLAGS += "-D_GNU_SOURCE"
+
 do_install:append() {
     install -d ${D}${systemd_unitdir}/system
     install -m 0644 ${WORKDIR}/pppoe-server.service ${D}${systemd_unitdir}/system
-- 
2.40.0


