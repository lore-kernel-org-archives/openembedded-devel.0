Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.5039.1614439375013051862
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Feb 2021 07:22:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dtHCfwmn;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id d2so7926456pjs.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 Feb 2021 07:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P0ndoWrtOHgb9BAsLJhgxbx2WrhXggagt5wynas8EDQ=;
        b=dtHCfwmnIgn9aSY8iA+032pcGWl5ed8XW0LyLppLPZLdjrLma/xI4d22Bsc41s7SDG
         so9EkuQ7R1bINwAfXwPcL6ineKripc0y4DYKwp1v3ctfwa1x7iEBKCdgk5kwZXpg9fJf
         AaEh5+lIM71Uz8bmNK5S3KtByXcS4YX9rJlSAlY38sYCk3YaHcIzJOwqcmIQqAO5PlWf
         1rSh7VASqsGe61PVjj1D08zVQ7k7SHKW0uAPNYXZadmDKTwbMXJiqNyFhbNoJoiaXy7p
         e+dm+XANwgy5wG6Bw7esH6EhkPH4ol0KeXMDBGx+ZMwvzxDBG7fUSvFObGGtCZIvM4Ne
         nY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P0ndoWrtOHgb9BAsLJhgxbx2WrhXggagt5wynas8EDQ=;
        b=HP2keYQylnwSuvh38cEnrmQ9Kg2gtBCHqXzo7fUaCB8ICrk3jt3VgUak8CjRlcykxA
         fGSIx7WA235rgOdbmPSOzjj9+Ov3OsYqHr2fhAeJT/v+sHRorcv5iZeQibkIGsVXj4qo
         C5C9GhDEw+58+fzf8ALbGza0ecpQkXeimU2zGmBz/nIdmVAST5CVrC8Uqrb+jdluYrW7
         g18nkutYZLfb7Zl1qZ4bXdl9UHnRLo45atBMLMnnFVq2KC/JDs0CZvaS/1X324kDFTDq
         ShlB1xBz+LcdO9dzl5IhZGQI2XKZTkIUGAo2jG5Cv7f8VxGSGwFj7sxfzVisbo+zz+nL
         cHTQ==
X-Gm-Message-State: AOAM531pbQk9unKQORucPcGcxSiy3biYbFRm5UamjN2iw5tvffKxSVkP
	OPswsuWgqVBJ8Oq1s4RRd/mjJ0E0WUTH6w==
X-Google-Smtp-Source: ABdhPJzO0yBEbM+As0ZK/1UFIxGR8gM196jtz2giWvxO15xyfdCTY4hxkr+Jsn7o5zhPNYdmp7XZKw==
X-Received: by 2002:a17:903:4091:b029:e4:3288:bc57 with SMTP id z17-20020a1709034091b02900e43288bc57mr7835668plc.80.1614439374032;
        Sat, 27 Feb 2021 07:22:54 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id u15sm12645393pfm.130.2021.02.27.07.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Feb 2021 07:22:53 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Miartus <adam.miartus@softhows.eu>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/4] libcereal: update to newer version
Date: Sat, 27 Feb 2021 07:22:47 -0800
Message-Id: <20210227152250.157722-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Adam Miartus <adam.miartus@softhows.eu>

fixes CVE-2020-11105
adds license information for components of cerial

Signed-off-by: Adam Miartus <adam.miartus@softhows.eu>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libcereal/libcereal_1.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libcereal/libcereal_1.3.0.bb b/meta-oe/recipes-support/libcereal/libcereal_1.3.0.bb
index 6fc5881c59..7ff5760cbd 100644
--- a/meta-oe/recipes-support/libcereal/libcereal_1.3.0.bb
+++ b/meta-oe/recipes-support/libcereal/libcereal_1.3.0.bb
@@ -6,7 +6,7 @@ SECTION = "libs"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e612690af2f575dfd02e2e91443cea23"
 
-SRCREV = "02eace19a99ce3cd564ca4e379753d69af08c2c8"
+SRCREV = "64f50dbd5cecdaba785217e2b0aeea3a4f1cdfab"
 SRC_URI = "git://github.com/USCiLab/cereal.git"
 
 S = "${WORKDIR}/git"
-- 
2.30.1

