Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web12.3560.1618693574343613844
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TyWKu8rY;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id e2so11430016plh.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=w7eV0ysKdnAdOC4P+IljvKwcBlxCcy5ISNo+L6I8dtI=;
        b=TyWKu8rYeyfY7RXlCN2DbzzuBg5kNO+f1hkiyWWLYFvP61q1gDl/PwIwRBcOcQSOwV
         RAr287Elu5HYHEtSIQgY+TJzr/vtsijDmtD/38Xp/nSYmKTWpto+5HxDCg2qbv9SD7TX
         LkSWjxixmoHLkzB2XJ7G0H/IWIMON84+t+MZXFkmNDZREdKhI5tdNZJGCvy91grlRAkb
         OIiPeqIx0FlEWOsiQsty/shK1I23po7p6Uai0q+tlaxponLP36BpcLjDKryp504nFRle
         RMTUNtn2WHpBlRV52f/y+KfwEYKrTii+sPSCYfz1RfkxfvYEyw2Q/Z0WiYzPJkr+JaPs
         k77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=w7eV0ysKdnAdOC4P+IljvKwcBlxCcy5ISNo+L6I8dtI=;
        b=jW9umNmhIIYDQ6VddLc/TtrFqqGLR2dVaHRs6FKtLY5iPABzGcA5AQ7Tg/e15WM8fh
         zateGxSorTadUIUfNkmBtlzvm76OucSJJ2l7PBGpeVkla5T5Hm2EAZpMHIz/yW0vRIsi
         Mg5wLFtUwzMusiEs2IX/zOHAcR34tKJ64NYVCOinBA32oRymRFTdNsXkza8M0cRTGVwq
         ROWfXoj+Pvgxovk9dDOtyQjuzQIzv36BFWh5GyebOpBk9zgdRj3D0MsG4WH2t7Gi97pP
         9no4AWyqF5XksqmNYTkXm+/Secgm17sX+Dwwdt2vJtKHtRzGQ4c2gjg943G+Yj1uAnT2
         vKvA==
X-Gm-Message-State: AOAM531lFcNR05YjBknYe3TYxVkISDLdKoaQWA0gjc1ngY319eEUjehk
	8KJwFxrYlBD2t8BEHLC7f9gaDPPj+H1Xzw==
X-Google-Smtp-Source: ABdhPJzMYpaJMvT2NQOynStI+3gN0c6BJKQdIwcq5CUR2WTtFKkfK31wNv4eTTpSJPZ/rqv6g0B4Kw==
X-Received: by 2002:a17:902:d2c8:b029:eb:424b:84c with SMTP id n8-20020a170902d2c8b02900eb424b084cmr15899499plc.71.1618693573791;
        Sat, 17 Apr 2021 14:06:13 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:13 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 05/50] python3-croniter: Upgrade 1.0.10 -> 1.0.11
Date: Sat, 17 Apr 2021 14:05:14 -0700
Message-Id: <26fb3297b49ccd2462abdd727cae4db599ccbf70.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 1.0.11:

- fix bug: bad case:0 6 30 3 *
- Add support for L in the day_of_week component. This enable
  expressions like * * * * L4, which means last Thursday of the
  month.
- Create CroniterUnsupportedSyntaxError exception for situations
  where CRON syntax may be valid but some combinations of features
  is not supported. Currently, this is used when the day_of_week
  component has a combination of literal values and nth/last
  syntax at the same time.
  For example, 0 0 * * 1,L6 or 0 0 * * 15,sat#1 will both raise
  this exception because of mixing literal days of the week with
  nth-weekday or last-weekday syntax. This may impact existing
  cron expressions in prior releases, because 0 0 * * 15,sat#1
  was previously allowed but incorrectly handled.
- Update croniter_range() to allow an alternate croniter class to
  be used. Helpful when using a custom class derived from croniter.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 159df278565891aad0e68f8628c6435c36638772)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-croniter_1.0.10.bb => python3-croniter_1.0.11.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_1.0.10.bb => python3-croniter_1.0.11.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_1.0.10.bb b/meta-python/recipes-devtools/python/python3-croniter_1.0.11.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-croniter_1.0.10.bb
rename to meta-python/recipes-devtools/python/python3-croniter_1.0.11.bb
index 6cd87fea9d0..ca9bf71a560 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_1.0.10.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_1.0.11.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
 PYPI_PACKAGE = "croniter"
 
-SRC_URI[sha256sum] = "364c48e393060295c3161588a6556d5c890b5c34299973c393adbe4488ca1ecb"
+SRC_URI[sha256sum] = "cd89bcbed4d79f56bbf2c9415c2bbbfd09fadc8a59dbae3898fbca5bab34103d"
 
 inherit pypi setuptools3
 
-- 
2.17.1

