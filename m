Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.249.1617899791204286425
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KC2PW63i;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id n140so2773042oig.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=PpowhUubmwFfxDTFOz7gXweLBLCALPXxTiQv/cf44VQ=;
        b=KC2PW63idJzt54oEBVRvhJIhBOcfvDWU3Wp6Yc0SSCGuCshCuz6ouRxOqPaDhcd6X2
         9mH3kjaB/IXbxIfVao8MAf/2pVVZGQ6K2tBiU95ISBOVG6HBj7gIVInnvyQ6B4ezH+Xb
         MX+Rpa2MFiuEznL7o0H0UhHV2aG3hMq9afWPSnkgTH/YT6JQVJnfyVVl1EP6dOPImwXf
         mNy1gbdCfOqdwx4dOuFvsRWmvWcVC3BXpDnQm6uU8eMoXkVpVWwR/wo4e2HYruUeydUn
         WvNYCp4OJEPobGYlKs+01IP3Dnr0G6whp2RiQ8sKTc4fikoZrAeD8RQ4TLQtByvJAI+f
         hyNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=PpowhUubmwFfxDTFOz7gXweLBLCALPXxTiQv/cf44VQ=;
        b=awV8+6WNWyPBdTfEhTQ9LbBuVEZa3CU1qD970e+Oj5oTepD4FlMxDBZnGiwvKoMnoc
         k/21MUYY7umDZvzwDG4DyBkBnqUQOSMMlyPD622UaMoEZ29GcohQwqqqwnX7z3z/awvG
         zMgvRLJXZf2s0gpwWeGLCt1lNhzV+mZ34mjBkPT0m9fiZoVu9cywhI7kFse+RtK+dLrm
         nCOCA8xpAk6Pp6Qy5VuMpkFlz8IpFJKAA6l2TUjxDn8yqvkGRE8uu5TOuQTJjyxQg6tc
         ORPmcF8fkxm0fSOPpW8HGt3bSNyB4jjb1g/ITOG0M/I7APu7M7j/7i2ePeKXfyKl0FFa
         5iJQ==
X-Gm-Message-State: AOAM5322IhuVW4WItcFqv9HZsjZycXB3eN6cVTKZr/92FAn1SLwAYSRO
	FqvuAZj6C6XLBKoRiDqIP5TZtDc/fIE=
X-Google-Smtp-Source: ABdhPJwMGyEC9wIRPTPCzDt/x8N3u9XbO19VXXyNKtQK5yQh1Jn2rOHSFt14aYO9aDO/cqtVC9x5kg==
X-Received: by 2002:aca:da04:: with SMTP id r4mr6803189oig.123.1617899790468;
        Thu, 08 Apr 2021 09:36:30 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:30 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 19/64] python3-pyroute2: Upgrade 0.5.15 -> 0.5.16
Date: Thu,  8 Apr 2021 09:35:26 -0700
Message-Id: <e27614eab46d9bd7feea4809d1408e43e2b0e816.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 0.5.16:

- ndb: fix syntax for Python < 3.6

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 8f3ee91cfc0d6478ce9764d3415111a08b5c522f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-pyroute2_0.5.15.bb => python3-pyroute2_0.5.16.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyroute2_0.5.15.bb => python3-pyroute2_0.5.16.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.15.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.16.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pyroute2_0.5.15.bb
rename to meta-python/recipes-devtools/python/python3-pyroute2_0.5.16.bb
index ca168b13758..fed0fc38fe7 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.15.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.16.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2 & Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.Apache.v2;md5=34281e312165f843a2b7d1f114fe65ce"
 
-SRC_URI[sha256sum] = "d730eff091dd5b2b78282bc82ebe6888e7ee4d70b79468b1da58d99fc1a2a2fc"
+SRC_URI[sha256sum] = "fe681a2d008cac815b9f287250d69a333fbfc2b2d89c37d58798104057149989"
 
 inherit setuptools3 pypi ptest
 
-- 
2.17.1

