Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C60C77B75
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 15:44:00 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.23228.1683128633133769107
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 May 2023 08:43:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Wm1xpPvb;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1aaea43def7so31491135ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 May 2023 08:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683128632; x=1685720632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PUuwUT8mdHfNm+kpErnUSGvJaheUkhxp/7qGaC0TAYY=;
        b=Wm1xpPvbj7ka7FfIq1A+E010WBlIO/XERfGAGdiPgKZBZlTlbYgugjkd4L3XBfcwrs
         PyG2ILSHs8uT1W18//lcODHSJlFvd6wH7XRuFI855DfWstxzHuLGKsH7MPuvoWhr47co
         HiHbd1Dbv1+5ZDDSg789h+SJCv7ilE42b2ch7RUUD7k2f5lhHGyUp96njL3DNZq5xTcC
         kzeCTbVUAuuQwjBWCWQAb+flqc2dfXBJhc4iYZLseNMosLr7DwzHWF9sFdSJjDK+hUOX
         KW9rzjAPoDmN6r+h12Y4UNtWxzPp2UL2upmtKdz/FOIGilhqHvVCNpegk0QK4VseXYKI
         8rNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683128632; x=1685720632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PUuwUT8mdHfNm+kpErnUSGvJaheUkhxp/7qGaC0TAYY=;
        b=JEh2ixwDKAnS3rVATQWr9C9wHchq5HuMWHvpJGh7HonsMRoVur7BAUA0cKAfiK3yQ7
         FTSi17Yq15P/43PC4FhZhgmdhRVb+NvuQoaO7oEN1aHZgZGOFtM8Q4/xbnWsbyMc4Rg4
         hyGqY8qeh6A99ZHVooSHNBElmpFIjsnQBMfxWQUtSaHWxIyhC69Gp1uCSW9dig7KKzl7
         AQ4IEgvKnV68iL3C6ZDqKYqGuOTcecCpmSbxy3r42dgroMYskX5m7jwUS2HCesLbB1kN
         zOGiGKkTAMcwffNdib59UFqxkDgF+U+OYF1k1urHimgTHkNeKq8VBYh9vOzl1FFYXhoB
         Dp1A==
X-Gm-Message-State: AC+VfDwTEHhu4Lv/45kXfjBHEJHSxPNaqWVDM/nG6244EWedk7extauY
	lmGV/LYrW91kkSymLu8a8oZXxMqYrTxjz7V1
X-Google-Smtp-Source: ACHHUZ7T+1jOD7jouaxGBVBPcAvuRg9Ep07k2+filcgY+YmRPXGclhzVCwklkBC6+tPC92bHb7Ng2g==
X-Received: by 2002:a17:902:ea10:b0:1aa:df9e:2d08 with SMTP id s16-20020a170902ea1000b001aadf9e2d08mr555021plg.37.1683128632123;
        Wed, 03 May 2023 08:43:52 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::ade2])
        by smtp.gmail.com with ESMTPSA id d4-20020a170903230400b001a072aedec7sm8063282plh.75.2023.05.03.08.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 08:43:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] gitpkgv: Fix python deprecation warning
Date: Wed,  3 May 2023 08:43:49 -0700
Message-Id: <20230503154349.93589-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 May 2023 15:44:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102289

Fixes
DeprecationWarning: 'pipes' is deprecated and slated for removal in Python 3.13

pipes is an alias for shlex therefore switch to using shlex

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/classes/gitpkgv.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/classes/gitpkgv.bbclass b/meta-oe/classes/gitpkgv.bbclass
index 180421ed35..cb2cea26be 100644
--- a/meta-oe/classes/gitpkgv.bbclass
+++ b/meta-oe/classes/gitpkgv.bbclass
@@ -56,7 +56,7 @@ def gitpkgv_drop_tag_prefix(d, version):
 def get_git_pkgv(d, use_tags):
     import os
     import bb
-    from pipes import quote
+    from shlex import quote
 
     src_uri = d.getVar('SRC_URI').split()
     fetcher = bb.fetch2.Fetch(src_uri, d)
-- 
2.40.1


