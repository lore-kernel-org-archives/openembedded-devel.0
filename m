Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.5240.1615534088212663736
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Mar 2021 23:28:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZBqx4NX+;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id a24so11505184plm.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Mar 2021 23:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+LxRvLTAYVpFsztkdWrOa4AEA0TBni6oaSksUXTkQAg=;
        b=ZBqx4NX+D9LsKe0Bba/YzCVjaT5pYpXLhjUOO8uSxObRivUlOKSuUEVsZu/32ThsBW
         qx3U/z9BzUYNBtPXOyoCMlXDnGp9ZUcXYF1Q//HYmAsgG4i6KR6VEK91/RSp1mLwRl63
         2Tv12cOm+7ROoyhyV2UtLsPHI50sLsSF01Gd4ktb+AsF7z2wU0M1anGXp+HWhXyWkGWb
         wiRqJKnJYoMKUuue28yVcxqGfkSViVO2GBTAf6FF+NCv1HdOYoDgV5f2LYJL6o6E8vmL
         btrLcGaCGu3D+ZOOb18qZP+hk9XINRBiZJDKW/me3p6a12P/drGteCYCB5vM/ASLNRBD
         vqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+LxRvLTAYVpFsztkdWrOa4AEA0TBni6oaSksUXTkQAg=;
        b=ChqL5Q3uNyAMYRng+RzRcraFFatSbAUiLfC7dco/TtPDZMaT7YJoaEY+wBxrnAo0NB
         2Szpi1eIpKQJrn3V0KNPRTljl0r4+WkQAvEYUQ/z+1YbXsXpmJD8RyPx8/qso8J8cWht
         IScGDyXv6tXTFdQLbq6eyeYGuDUJBmkHubuJspw+uF3ZbjANx8YJhNVXUiR1TkYVA35f
         VTSUVU86OmvQQtDjIAScRNtGo3otGPFLYP+hSs+y/k+ItrAbfYK9PUwCkykLKzlo96Dq
         jpRmNT0wgBALwBJCF63vR3H3irnNmaeWuivX6awjtj3mWXKQzBvzkCAx5K/P7TzIInIN
         LoPQ==
X-Gm-Message-State: AOAM533RdnvDItLiO7WYf7VgBx1iBLmD3RRrACjhVd0kkth0fCicy3do
	CmVvQkjNDMah0XA2cjp4GtY2AJrjpA6oZw==
X-Google-Smtp-Source: ABdhPJwpIh2E4ERPb6ZBjEoVW+VH3u4YLUgZXeeYGqHnEGg+YonYryHuiRRQw0kLGfR5Pu+2CrMiug==
X-Received: by 2002:a17:90b:608:: with SMTP id gb8mr12793204pjb.121.1615534087338;
        Thu, 11 Mar 2021 23:28:07 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id y68sm4988021pgy.5.2021.03.11.23.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 23:28:07 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-grpcio: Disable for ppc64le
Date: Thu, 11 Mar 2021 23:28:04 -0800
Message-Id: <20210312072804.1668163-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

abseil-cpp does not have support for ppc64le yet

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
index 3d875bf4ba..fa030b99e2 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
@@ -43,3 +43,7 @@ CLEANBROKEN = "1"
 BBCLASSEXTEND = "native nativesdk"
 
 CCACHE_DISABLE = "1"
+
+# abseil-cpp/absl/base/internal/unscaledcycleclock.cc:100:2: error: #error Must implement UnscaledCycleClock::Frequency()
+COMPATIBLE_HOST_powerpc64le = "null"
+
-- 
2.30.2

