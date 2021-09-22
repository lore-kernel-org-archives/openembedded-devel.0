Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.959.1632338562673815467
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 12:22:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aUlHaQDX;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id r2so3764564pgl.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 12:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B6Fu0M233o+NEhbeZXY33442i3TWl70UrdKa6jZRV5Q=;
        b=aUlHaQDXJvwTII7vgDlgEMJbMjEg8bpv9acizvuyFCZVC4sFforqGRTS2eLQGCGAyA
         fhJG0CebuqaL13MbxqAFQXw+j2MewheNLIjaEQJyPX7qxp5IVsReYrrbGiODoIUi19Nb
         Geo/K7gPvPsp5v8Xnw+cNAuiwe5nTUEOPrAM9oa1qHrQS+0HBjgFoLmimHkfmbxHb8NH
         MGkxpzDdHPLod5QJbFz9wNLm12Im0jxBG9GDjh+Ep3tIMmrugY8khOm+Tg8NNdJJ1uj9
         VkdMHgggCxuJsab1I2+yIgXj6wVOiV+WJX+ZqzEuaNQaVokg1R7XWa5Dney8LC73mPHj
         5DTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B6Fu0M233o+NEhbeZXY33442i3TWl70UrdKa6jZRV5Q=;
        b=lASw2beNnES84u8s67WmluhB2tT3CsQYmv07iyqrp7exFxiIB85eZg5cpwixdbrF0k
         rZwo7DIpeAu7IkP1nxnpyIAWh9hdErepoVxc8Q2bUI6+hlWGCVjyWJfs4/OYr/gj7z5M
         Qli1yaKI4NmVUWAcLH15JtBpmARv3XfWTDhH7q/b7o6RRyusyilcLZXzp/4Hb042VjEH
         kMrgqHQKpiSSxlrad9Lh1yEOwVB+pPxHhF2ZkrYs/gPWXrV4fwPVIapQ8548RO706480
         cZ1pqU6hQ+Au0wuxLmtEMo1HvoGWOXCm5X6giVGf5mqbN2xixI0VVN5Qjhqjv+qvhUxE
         Jdzg==
X-Gm-Message-State: AOAM532NAYhV6gBk5A8FX7k168/4mCbVERUdC/z7nTQDTvlpqBDVF2kz
	ks79k56cvG/eCNDpsv1TNwAOymbj3Q9bjA==
X-Google-Smtp-Source: ABdhPJxIJMIQtdTOdTrGY+aCYN+CHz6AutQehDMEQ10Jl1F0e/E66W+BwNvUJAOaVRdOJG1fWOudKQ==
X-Received: by 2002:a05:6a00:26cc:b0:440:51c6:fa38 with SMTP id p12-20020a056a0026cc00b0044051c6fa38mr367448pfw.45.1632338562076;
        Wed, 22 Sep 2021 12:22:42 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id y13sm3083119pjc.50.2021.09.22.12.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:22:41 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 30/39] libuvc: Inherit pkgconfig
Date: Wed, 22 Sep 2021 12:22:04 -0700
Message-Id: <20210922192213.3062719-30-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922192213.3062719-1-raj.khem@gmail.com>
References: <20210922192213.3062719-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
  pkg-config tool not found

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/libuvc/libuvc.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/libuvc/libuvc.bb b/meta-multimedia/recipes-multimedia/libuvc/libuvc.bb
index 4d301fb2f6..b34479f381 100644
--- a/meta-multimedia/recipes-multimedia/libuvc/libuvc.bb
+++ b/meta-multimedia/recipes-multimedia/libuvc/libuvc.bb
@@ -11,4 +11,4 @@ PV = "v0.0.6+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-inherit cmake
+inherit cmake pkgconfig
-- 
2.33.0

