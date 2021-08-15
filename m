Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.11335.1629036411279701071
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Aug 2021 07:06:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KWZuWVrs;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id a5so17862451plh.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Aug 2021 07:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pCnaHacChEXzsf4eDZmnJfubtfTKjytvF//qLc9Y3BM=;
        b=KWZuWVrshKaFg/pY/FepPIkJcfGlaSzBe7t1Su36tjEP59PLUDomG/kH4dGdKZ1N1T
         gwVIBkvJt+rYf4eYiRNqWzuJ7yiKGqMkzq1vJSWotMXxfIR3gMD7ZHmwGyuRlNnAM4vp
         S6ExqmtjiaZvwPUvLKq5NQ2+0NI6yOs8VZU7GxCQnsQ/13dEanO7OLw2VVFwAVXrPceS
         QUUEYw7qa5EmoXZnF9TvxPvJWv/l1ajMDRiRIBTEzI0J2pDYeXz6jKKts+rKXhGc6Nh/
         +h6cxzH7UbmaW1dUoIQJxiFCe3jqGts6joBNAt7qMJdKPP7xj2wwolRaEViZ5cBzTihx
         lzVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pCnaHacChEXzsf4eDZmnJfubtfTKjytvF//qLc9Y3BM=;
        b=rVvMjaJBnDPRcaA50wyvlXKCh9dR7GXYKy+M+H7fbWVfG9yiuVoSiYRs/ODTRpuBVi
         IFHbBVqsJoOJR2MJbKIBm4kM6fmP9nSvCCzoMJAaS03xrB3a/zvrxFrCbkxb5RjcPmy5
         vmGqscjD//GUj++/GXgZBUUEmP/RefLoWBL1dk8RFlG1QWQQVopYuVd7wrJpmuGD3UWm
         J75ScDSd44hi63Rf9L+7CrBWcRBTXRc8iUPMWKg/kQeBYkiG2+FXXeQnIyLxf8EMIuZS
         OlDBsktMzMfcgE5WpDVs3g4pM2LWcBfznfxIdFU/KNinNTRTGBY5JwMZ3LudqtUOlJGf
         U7yQ==
X-Gm-Message-State: AOAM532Nod0M0I4grmGI3ssXhoVfxEolZxDYZOJEKwfSwNOCuhmz04Gk
	dKIr/Xkq7nlZtGaeNIwZMOzzzYd30q4NmQ==
X-Google-Smtp-Source: ABdhPJz15z5YZRzFGpJoYj8AG96fhWEqvdWs7+wFSvhxq2YwCMNl+mpnAnqFpse3EzuqQaiIrOrUrQ==
X-Received: by 2002:a63:4d15:: with SMTP id a21mr11268319pgb.245.1629036410786;
        Sun, 15 Aug 2021 07:06:50 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:162c:344d:280d:4a4c])
        by smtp.gmail.com with ESMTPSA id y67sm8332901pfg.218.2021.08.15.07.06.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 07:06:50 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 12/18] mariadb: Update SRC_URI
Date: Sun, 15 Aug 2021 07:06:24 -0700
Message-Id: <dc423467a0e70d63bb39fb2f50fcf8435ebff1c6.1629036279.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629036279.git.akuster808@gmail.com>
References: <cover.1629036279.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mingli Yu <mingli.yu@windriver.com>

The previous SRC_URI only stores the latest source tarball and we
will meet do_fetch issue if not upgrade timely.

Update the SRC_URI which stores all versions to fix some warning
like below:
WARNING: mariadb-10.5.9-r0 do_fetch: Failed to fetch URL https://downloads.mariadb.org/interstitial/mariadb-10.5.9/source/mariadb-10.5.9.tar.gz, attempting MIRRORS if available

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit da798f15ffd93759e1ba3f21bd1ba80c73e962af)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 7cf08f4719..63ab940928 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b1becf0cfa3366e0f4d854d1d264f311"
 
-SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz \
+SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://my.cnf \
            file://mysqld.service \
            file://install_db.service \
-- 
2.25.1

