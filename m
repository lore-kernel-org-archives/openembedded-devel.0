Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A46CAC4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 22:32:04 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.475.1713393119291298502
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Apr 2024 15:31:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c24kzpbx;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: beniaminsandu@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-343f1957ffcso161090f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 15:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713393118; x=1713997918; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lqbFmy8duVUaipKh56SJ48iFFEw0sjG+MgC7LwlGhSg=;
        b=c24kzpbxgi19//wT2g+gtMjX0UW+c/KeDsjAz4ekIRrL2qgo2CEsPZYlrfL5a70Bk3
         8FwQMm/mip7jjFIk5k0Q0X0BEHHsMpAy6+Pu1KgoaYdBkG5meFsYUmqDL6hNgkARzfCY
         2bvn7ne6ACveId5SQhi0gNKBik8mM2pU81wluoatAGnoIqKMfvsMqbORAsraq5IuDSpI
         UnKfp2SJZVqoeqoB85qIK+ULwbxO0fhIIiygsEN/qxuxor4ycUJNqRRWGMef6ePNK/51
         pw45mWAvXTBKHKqygmBC0FleVki5cwW8/hOB9sk8jfaXiYpNY2Hb+u3LXoAC1FEg9LV+
         eg4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713393118; x=1713997918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lqbFmy8duVUaipKh56SJ48iFFEw0sjG+MgC7LwlGhSg=;
        b=aqiR+T8NfmJlmTT1UpN22vFJF6/Ha27NjwXp8jS0e0r4zRy+t4K/ukDRq9fBJBrZ5/
         aSGBb08br2LOTplZ4M8c3m5muNEIhcJ/l+fZLskG1DS+1tWIn+4fSi3jGU0+Eiz0a6A0
         BM9UQPpOIVHVPHm8kjs6Bojr3r8knF2EYVLbc4uxS/ObRUPs+Ot8aLb7+hcvYiDWlxa6
         ki/drbr/o7SQNM5d9qnwiRIl1j7KxRlcTWkpQc/R0pZfeeV36VkTAk79szlv1wQEjyp/
         wDBcItl6AvzrP015FTYIqBWcP9SFayOQYOsHC8UdLRov/yP6Vk9Ulvm9u9lM/LG0t3p9
         82JA==
X-Gm-Message-State: AOJu0YzMZMcqNMznM8Uhpy/4R8QS+1QJHTQq/WC/FqSi/NtaIHKCtzQ7
	OVnPtaPACC8qrXvoAK86GEXSFgWtW1UAUP8mn0LhmljrKHFWuPctTIMaFQ==
X-Google-Smtp-Source: AGHT+IEGct2mjG0Gi//WPAO+yTQQFdK586rOaX/4cIKRkVoTG1JOPiMPcn+HM8LPP32xZ+SXIufcSA==
X-Received: by 2002:a5d:4ec4:0:b0:348:cd2c:d2fe with SMTP id s4-20020a5d4ec4000000b00348cd2cd2femr287876wrv.13.1713393117520;
        Wed, 17 Apr 2024 15:31:57 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4b00:8855:a800:57a8:4f82:7788:d99])
        by smtp.gmail.com with ESMTPSA id cp37-20020a056000402500b00341de3abb0esm235625wrb.20.2024.04.17.15.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 15:31:56 -0700 (PDT)
From: Beniamin Sandu <beniaminsandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-oe][PATCH] libtorrent: remove incorrect CVE mapping
Date: Wed, 17 Apr 2024 23:31:32 +0100
Message-Id: <20240417223132.893356-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 22:32:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110046

The CVE_PRODUCT variable is assigned automatically to BPN.
Unset it for this recipe so the CVEs can be checked
against the correct recipe.

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
---
 meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb b/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
index 38f5f63fc..6ddced57e 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
@@ -15,6 +15,8 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
 
+CVE_PRODUCT = ""
+
 PACKAGECONFIG ??= "instrumentation aligned"
 
 PACKAGECONFIG:remove:mipsarch = "instrumentation"
-- 
2.34.1


