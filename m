Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web08.1209.1616604424392938607
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 09:47:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IHLbUgNF;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id u5so34013858ejn.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Mar 2021 09:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xH9oWc8U5KOfJWgWuES5wyye5DLFczLmjjAN47nsZE4=;
        b=IHLbUgNF6+LPuKLqybWv63U3zYL3AOJnMPp9HBO58r30I7Wtu6nBXWogGebTuXWBw9
         +GAvcUEP0WL0vjuKJSDOcc7pyR6p6sZcx9ypUvDplvdcucgPpuXj1puaoEqBjqFwwYJb
         JMuJUu47Pg1LsM54A0micn2GRtFksGnrUI/J/NcOPQf03B9d/4WLLYPhuzcNHVuIXd2Q
         NoQk3Mn5LzSqVIbZ/60R+cPmtXIjSJVlsLIxoRaq/Zl+4blOopztWsBs/zT4ginF/oRS
         Ko3X1K5Hs2RG9AA18+yCIe7PumoWLloq8soW7DQ7Di9RRDtt6W6OfO+ihW4P4DElxNZX
         N/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xH9oWc8U5KOfJWgWuES5wyye5DLFczLmjjAN47nsZE4=;
        b=eYTMT1Gn1NugB6BbXsGb1z8VxeokNenEh7bI9+8Y8KlLQmmNeoSTSqBdMeVwUGO9zv
         KnWA9aw64kzdX3CcyTdKiZu3huvZTmEfxwixFmkI0/xe1IBk7wFBI1OCEdmBOqY901iQ
         o6Kw5sr7Q3vCsLTjybgaqN7Iftzrzj8Rtq4Bu+aUjfc3By+AE7Ctjie55uKH62+KvyLT
         QYIwuIt6X8mJgl/ifdWE8I3iG1ii3CDdBhbVhQ7RlM6ewGHkMA0UzWd0rCQAYvTJ16sh
         F+8eqiUrblvQiCu/bbr0LQDWrESjJFuJ1HpME+rNNOnSYwDSzsiUyj7P7yVB1QfNyAV2
         atJw==
X-Gm-Message-State: AOAM532Ho1yCboZ5aPe8KxyaSfNgDKyFE1+8h1yGauKsRnr7jPRGV07A
	Ns79onb+X1Wy8wlAjRFcDf0tipjRen0=
X-Google-Smtp-Source: ABdhPJw3e+nb84HACzh2av5KJjlse9gR9loZlBmQjsLnL5/5c3f2yhLqD+y1EZ+dMiAXDEHnZ2rpAg==
X-Received: by 2002:a17:907:62a7:: with SMTP id nd39mr4704485ejc.510.1616604422715;
        Wed, 24 Mar 2021 09:47:02 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id s20sm1181536ejj.38.2021.03.24.09.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 09:47:02 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/4] packagegroup-meta-oe: include abseil-cpp for all architectures
Date: Wed, 24 Mar 2021 17:46:56 +0100
Message-Id: <20210324164659.390543-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* the restriction was removed in following commit, but packagegroup-meta-oe
  wasn't updated reflect that

  commit 7223513f400d63d1fb50d65b123d00ceb94f3695
  Author: Anatol Belski <anbelski@linux.microsoft.com>
  Date:   Fri Feb 19 12:58:45 2021 +0000

    abseil-cpp: Relax build requirements

    While better hardware acceleration is definitely advantageous, there is no
    hard requirement defined by the upstream. Removing this will allow
    builds targeting older hardware where DEFAULTTUNE can't be changed. If
    found useful, this can also be backported to lower branches.

    Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
    Signed-off-by: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index c717d45e5d..784c5d325c 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -304,8 +304,7 @@ RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc64 = "android-tools breakpa
 RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc64le = "android-tools breakpad lshw luajit ply uftrace"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_riscv64 = "breakpad concurrencykit heaptrack lshw ltrace luajit nodejs ply uftrace"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_riscv32 = "breakpad concurrencykit heaptrack lshw ltrace luajit nodejs ply uftrace"
-RDEPENDS_packagegroup-meta-oe-devtools_remove_aarch64 = "${@bb.utils.contains("TUNE_FEATURES", "crypto", "", "abseil-cpp", d)} concurrencykit"
-RDEPENDS_packagegroup-meta-oe-devtools_remove_x86-64 = "${@bb.utils.contains("TUNE_FEATURES", "corei7", "", "abseil-cpp", d)}"
+RDEPENDS_packagegroup-meta-oe-devtools_remove_aarch64 = "concurrencykit"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_x86 = "ply"
 
 RDEPENDS_packagegroup-meta-oe-extended ="\
-- 
2.30.2

