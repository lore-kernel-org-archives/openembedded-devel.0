Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7938AD35E5D
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:06 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web11.27751.1730831920454360498
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m/o9sg9S;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e30eca40dedso4741717276.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831919; x=1731436719; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFWHGEBquHoq9BkGoGY3vMgRScbn5CwlgBKMYCH66Hc=;
        b=m/o9sg9SXeQ7dIKcz8KlCIkC4Py9We2AW7ABUvvbaUC9OLv34I9vmeM5JjtwqobCbl
         cwksKDGMWNAzKpyX4/VpczDmuQWp/MasQ88H4LvOU3j4LUaHTYqc+1a2mXqF+aH3oU7m
         1wCc2Fz+GfEz59fpiLalqVWvP6qjipXIymsVc7X+pTjBWmbibMYe0RNDuiyRE1B2PUuE
         eY2Wc5EKMuyG6ODCny2MhrCIqAeGJh+iRjyxjIKml3Z4T5Zlt5ZKBtegcF/+H470Tg5g
         xHcRQgf3txSB58j3s6M09iI6ckSxtN0CXBXLvFFTe0RTXi9atQ8mK58jyxtDXWPAJR6f
         D8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831919; x=1731436719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IFWHGEBquHoq9BkGoGY3vMgRScbn5CwlgBKMYCH66Hc=;
        b=N88RFVBAzLfOk54Oj+2Ct5RvTtx65p+68eyZYu+nV9bfJDkO22Cqmv9x7a799dMRJ8
         QoJ+7HZctCGVsOl3MIS5/2Ja1X+toTeDTa5qLDx4v8WxeUmaJ4K5tcGdyjvGmM2UwhdF
         cYZEIEQy6DhCdKiiR6y20F7mMmHrxMx46zf9IUq0KcxqkSM4L+bShLK32tjUKZTfkuD/
         3B7sJ0RfgrQKR9smazjjU/8rKygUaOUg9tJ4DFZ5TfxlxtmfmsLB5yS5XOs7g9WhHCew
         m7kFZ90+S5PSShpd/zL4dFFh2O7QD87v9nw650aaVVzF8AHGR3G4ElxqS/KVxorLGlAF
         vSug==
X-Gm-Message-State: AOJu0YwXH8jorPjeuP6CrWEdFLzwzPXxgJg1j88iMmS0T/n9ejoAvgT4
	4hmApoklQ2vEiST2/6geGGF/0gpNuFhbLlzFKOga6cnw0RfgIwrg1UTz0i3p
X-Google-Smtp-Source: AGHT+IGv2WJNy3cd4i11FitIYDfvt1h9p+59aNYHKJkohBY9VLPODNL0/SO+3xnb6PmN0UQwy8CZFg==
X-Received: by 2002:a05:690c:6f0c:b0:6e7:e3b1:8cc7 with SMTP id 00721157ae682-6ea64b3367dmr187890347b3.22.1730831919078;
        Tue, 05 Nov 2024 10:38:39 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:38 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 049/161] nicstat: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:25 -0500
Message-ID: <20241105183658.34982-51-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113564

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-extended/nicstat/nicstat_1.95.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb b/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb
index bf742fa06..d5629b06e 100644
--- a/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb
+++ b/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b4a94da2a1f918b217ef5156634fc9e0"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
            file://0001-nicstat.c-Do-not-define-uint64_t-and-uint32_t.patch \
            "
-SRC_URI[md5sum] = "9a0b87bbc670c1e738e5b40c7afd184d"
 SRC_URI[sha256sum] = "c4cc33f8838f4523f27c3d7584eedbe59f4c587f0821612f5ac2201adc18b367"
 
 do_compile() {
-- 
2.43.0


