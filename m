Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web08.11513.1616958614062793545
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Mar 2021 12:10:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D5xMkYCH;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id x7-20020a17090a2b07b02900c0ea793940so6657408pjc.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Mar 2021 12:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c+JjXXdeKaR6Nf1O2M5aYBCgl+/wxOb3UV7VihQaDFE=;
        b=D5xMkYCH4GyFtXrUYPUWFZyYZbp1ysAu8Rw5j0C82KjnyiD1TCT5qVHznFv+zasEDx
         F7lwttkiw1J+vBDToFKNbNODY7UP9uN9AS7HFuVzzqC1TqlUgq1z9ldAhwIM/bz0MM1L
         wpejKqRkOLXvVMOyhwcBJnlqvIMEZpFHOkksZtmCxSC+BiBgTk9hk6vgdjgg9E/SMQQg
         MJ6Q7pNdXgltn5ZDCwPXw4tGHolwOyknHpQidDvITJK2aBTX45ZrEimgwPfEX7Tuea6h
         h5R9NGJGFNFSuS5itTHFmpECqTMyjQjFwpxU0Y4EDvRXcPk3MWXvZe4juwGqns82aUzj
         VWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c+JjXXdeKaR6Nf1O2M5aYBCgl+/wxOb3UV7VihQaDFE=;
        b=lBTxBvT08vK242AYnzUxg3V0Ah/KAZHS19GnqAJFEwjmATDcdQt+16FqNCG/IoVT3k
         fW37n9TAcnD5PPzYOCoi6lXwXoJw5OqzoFDROGVnsPBS77ZL9Yn7qnfVzRgm0DQ8+yd3
         qPps6jc/NsOFYKbzs7YvGZz81PO3Z9aJoPHyaBVb7x4FsBRXeNaX+QjvV6C13jtJ5GEI
         CysJ+L9r1+TjV77BiboKuAEMaAFrUMid/DR9f1uqYKKcIirJlQQLjs16dC9NdqEs0m+T
         KKjCEzGIv1iZwMJMvJQ/JGgoTrIbT6RziQYazrkpyFQCfMk6a8qMcUkbSnMsQLMxWI/H
         clLw==
X-Gm-Message-State: AOAM530TtXs4mbBoSgK9Xb+UMK1FQTW+FoAxleFkhEZ3/9V67PTafoQ0
	1i66GM5mE/B+eqsBu/gkj67WVJ39jzlvrQ==
X-Google-Smtp-Source: ABdhPJzZsHDsaoFZ1tXsh1MGWXKU7m6qarcY9ShcsBDsEErjVekDWG7joFl6HkkE0c7O26XOgAxO2A==
X-Received: by 2002:a17:90a:fa89:: with SMTP id cu9mr23992861pjb.204.1616958613431;
        Sun, 28 Mar 2021 12:10:13 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ae20])
        by smtp.gmail.com with ESMTPSA id y7sm15481385pfq.70.2021.03.28.12.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 12:10:13 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Persian Prince <persianpros@yahoo.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] tinymembench: Correct PV
Date: Sun, 28 Mar 2021 12:10:11 -0700
Message-Id: <20210328191011.29293-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Persian Prince <persianpros@yahoo.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb b/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
index 2ce10f9c44..0607da834b 100644
--- a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
+++ b/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/ssvb/tinymembench/wiki"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://main.c;endline=22;md5=879b9bbb60851454885b5fa47eb6b345"
 
-PV = "0.4.0+git${SRCPV}"
+PV = "0.4.9+git${SRCPV}"
 
 SRCREV = "a2cf6d7e382e3aea1eb39173174d9fa28cad15f3"
 SRC_URI = "git://github.com/ssvb/tinymembench.git \
-- 
2.31.1

