Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.460.1615581483987825594
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Mar 2021 12:38:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=icGN/UUE;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id kr3-20020a17090b4903b02900c096fc01deso11626034pjb.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Mar 2021 12:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1EA9suSW+6CovCZDLRiKyym0A4eMG/rHH0jMnHkyrAs=;
        b=icGN/UUE/mapGqItTACKFC08QHG3MXSlj8h3+BnkLnUi7moSuXDlaMN9AzJpb/qO/Y
         ipW+Vnh5vUpxrQBFanc6WxJ22IeFuTu23xIne76LnFqN4GQbCY+3NiThwAYkYnpMMPLK
         FWmHaz29K/l25DLz1CF4LACXl/8olJ/o4unBd/a9ads+WLDvG964SGfU9pZ2k2y9OJdN
         rbSztJUrc2pfbg3/uapjEWMX82cCOHECXUbFa5uu/DjWaSEo+eZFAQJLZ9HXzFYb3X2t
         sDxyWvDXUIqJeGAz+Sb+ObrIsLgUIP5wZClkvwrUEhevdvGRW28zW1hlh/DOtk2un/7N
         ntCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1EA9suSW+6CovCZDLRiKyym0A4eMG/rHH0jMnHkyrAs=;
        b=W5lUEX87BFrAlQNKE4B2yLgPXzakoaZNRvWH35hb7iNOpGodveKn8jjjUzTiTk66xA
         Rya48YKEFvOSMKozOB+pKxFz6p5d7lPLFdJgpRIQzjyY18tj6uV/izuK2PJgZX0rWXfj
         MS7GZPBuI9WyJetvWDIM1GEXn2GtnGYzfvoj/ZC/51lOUJN1qaskEP8oV+TxxPQcw+G3
         LzAPHp/rfarJ2ctnSI4CT5hc9/GaK5NK8/tM/RhCIwpCs79eEFYPuAnOV94a4F8ZCPi4
         RVUpBkDf58L+ekKgdBWXMCio9oYNj5SCBL5Dps/Rih4AQ+F0F9OJrLC1hTIGhaFmlyM5
         LtOw==
X-Gm-Message-State: AOAM532VN+OAKY5UoySNJOzmC+O0TrHZPj7SmQLPlHKQARaszYaLVA7Z
	oVhu+psf+o/MHRQHwdZUrpeUFpI8c0y1Bg==
X-Google-Smtp-Source: ABdhPJy9kwskwIJr53zUgn39o06ssUvG6fWNYpiWCFW+l+8+A3JT/Zt2pTVz+CNLIO/vzQ1jHuIWmw==
X-Received: by 2002:a17:903:2301:b029:e4:700b:6d91 with SMTP id d1-20020a1709032301b02900e4700b6d91mr297966plh.19.1615581483305;
        Fri, 12 Mar 2021 12:38:03 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id a21sm6214354pfk.83.2021.03.12.12.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 12:38:02 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libhugetlbfs: Fix ARCH setting for ppc64 LE
Date: Fri, 12 Mar 2021 12:38:00 -0800
Message-Id: <20210312203800.323387-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index fa63316b02..aa9eb02b34 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -39,7 +39,7 @@ LIBARGS = "LIB32=${baselib} LIB64=${baselib}"
 LIBHUGETLBFS_ARCH = "${TARGET_ARCH}"
 LIBHUGETLBFS_ARCH_powerpc = "ppc"
 LIBHUGETLBFS_ARCH_powerpc64 = "ppc64"
-LIBHUGETLBFS_ARCH_powerpc64le = "ppc64"
+LIBHUGETLBFS_ARCH_powerpc64le = "ppc64le"
 EXTRA_OEMAKE = "'ARCH=${LIBHUGETLBFS_ARCH}' 'OPT=${CFLAGS}' 'CC=${CC}' ${LIBARGS} BUILDTYPE=NATIVEONLY V=2"
 PARALLEL_MAKE = ""
 CFLAGS += "-fexpensive-optimizations -frename-registers -fomit-frame-pointer -g0"
-- 
2.30.2

