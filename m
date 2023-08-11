Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74572C0015E
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 17:13:14 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.48423.1691773988614802398
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Aug 2023 10:13:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ZGc+kIOL;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-686f090310dso2021669b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Aug 2023 10:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691773988; x=1692378788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4q1+OTpz45ChErbOj5hjZ7JFTSmaonAdnhOdAyN5BPQ=;
        b=ZGc+kIOLbpSLqKPb9cvPPxnFmXaUP7f8Tec8HyYsscRaLIhFQWTTXxuuhxI4LDnQ4i
         tFPSMlTPJhqy8Mj/aPGsB6ef+R9RvkLuXKPtwoyWZrWZzVrYsXIGiKlId+hjTCzsCD8S
         B+C1irJc+EUaaEvV8NAhURxJnx23+LRhan/AODuaDB0TsCGtqZSpAo7agSmq0AdF1hjI
         S4YxX0xGBPMV/bpeE1dUJ2MO65my4whaMOmuHvdxqDhcSEE8ObAf9+gDgjSTN6ArglxE
         q/FDK9ROa4RkSPuMaHHfTOmxEZRuigKrrRKmuu1ey/IdDaKHxfY2q/UF9sILT0gnzBYr
         sejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691773988; x=1692378788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4q1+OTpz45ChErbOj5hjZ7JFTSmaonAdnhOdAyN5BPQ=;
        b=WbBO2h5HPsnDYquCswnzikPSs/l0YRPsUOnp6eZEO+fP1oz+Yvp4/RWLVFCQkMYlDe
         rEFMWhcJT0qZ/ywteY8xdoRsW+mAMlhvHZX5quU5+FtdNcbloAakQqt0uI99eyCG+XyD
         hufCNVDqKAE5Hvnh7t3WDgMqP3xWCpunFXVG5R2K25ttTV8hgSv/PtbrWTZz/zefwhXr
         L6F/V4CaSkpQ33T22nbfsY0WAydElLCPggOzNE/IKzeim9Azh+ybWdUvQ1kB89dcset7
         RbeKVVMgfusuj0HYP4BFD/nGbzUbtVfQ0rYYrtIjuQnWNyRa1Ah1V+Q/ym4H73io8BCH
         tZig==
X-Gm-Message-State: AOJu0YwpB3a1TG9DaEsCzkKnTkkhbTJGH0xHkv1toipiXPGxksuKpJyA
	XaBiYstJqgO48MMXKVw3Wx4fzniBf0Cv9w==
X-Google-Smtp-Source: AGHT+IF9fdBE4oF1uvSC/boWXC6YZvTCljKt5VA8lFeq0vNdWqgMJzOEL+HhSgg/GlT8ub35ymIHJw==
X-Received: by 2002:a05:6a21:47c1:b0:137:293b:f9c0 with SMTP id as1-20020a056a2147c100b00137293bf9c0mr2671447pzc.33.1691773987599;
        Fri, 11 Aug 2023 10:13:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::ed55])
        by smtp.gmail.com with ESMTPSA id j18-20020aa783d2000000b00662610cf7a8sm3670572pfn.172.2023.08.11.10.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 10:13:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/3] gosu: Define SRCREV_FORMAT
Date: Fri, 11 Aug 2023 10:13:03 -0700
Message-ID: <20230811171305.1135317-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Aug 2023 17:13:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104342

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/minio/minio_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/minio/minio_git.bb b/meta-oe/recipes-extended/minio/minio_git.bb
index bfd313ddfe..049f35ca04 100644
--- a/meta-oe/recipes-extended/minio/minio_git.bb
+++ b/meta-oe/recipes-extended/minio/minio_git.bb
@@ -14,6 +14,8 @@ include src_uri.inc
 
 SRCREV_mc = "01b87ecc02ffad47dfe13c2154ac31db3e3115df"
 
+SRCREV_FORMAT .= "_mc"
+
 GO_IMPORT = "import"
 
 LICENSE = "AGPL-3.0-only"
-- 
2.41.0


