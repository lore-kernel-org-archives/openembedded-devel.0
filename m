Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A8EC369AB
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 23:48:40 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.28507.1745279314364764064
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Apr 2025 16:48:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QRdKtUb7;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-224100e9a5cso52102205ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 16:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745279313; x=1745884113; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RyX9KvUpiQs635ZcoFlJv2Z14shS1J+vOqKIopXyonw=;
        b=QRdKtUb70kXCSbj5clmPitZzAgDrNU6Gp6jDg9Tf8EnyAvQCV5tL+lP2pSILSejICj
         gXHO0zGThtAiOofhQM1XtllCys0bV/jX+B8HxiekbLisqEd0UXs7mfdvd8zEHAZE0azW
         K9eDDE3snFATECv+++1Jji4aOWwMW0gDCRESiHqpZYcSB3ex3G3dRmLA4hw00HIzTCr4
         fjsuueDsjl37j3yzWzIGbvaDSJJKmZEwAkwjWWrh8q0xLE2o5KxrML4rGYXrCLnBQgid
         eDV1LWdpNu60onLgu7G6Yy8KhPEHz0MYtUIkcXuwwTNVXYSEecFfjc3fNvPOnd4lf8Db
         /TTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745279313; x=1745884113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RyX9KvUpiQs635ZcoFlJv2Z14shS1J+vOqKIopXyonw=;
        b=d+bCgY5fz9xlNqcCh+utR+JoIwgf/bA3rSDc6UCyhjpC2kFM+XaCyyYQD/L9Snp9Ac
         M+TLRgUMG0S8yn4bZesP3CLu/pY7wbKQHXArLBGNYJCzU0bZ35EOuhy/pkivlDjUmRZi
         haaT42C0l0WRaiOOCJUdCO70VYp+PfZB9FLTblAcCimcK/G99ajlkX6Ww2eNLW/l0Hdu
         N0OctHqqC3+32vdFXjlHaPXukPlZQch99CQp1/wHcJNa7FQ+g/0KVxa/wVbImLv4r/rf
         qXlY/OHTD7UHVIt59h83aZoEtysR6p5lxJ3aUfNYHSxxbAT3VlIzm+C7OlGmz0LA16ZO
         Mrhw==
X-Gm-Message-State: AOJu0YyJLOmHsRbZhi2JVfDsAwQVAh/1Pgcqc44CDX4y+U47wJdrF0+x
	Cv1G4W093QeAwnPErCSZoaNDTbnuSb4mC28U0QwL+QuNbfONkSWN1ZY8AvOJ
X-Gm-Gg: ASbGncvi0OtG43CuqsIyjnh5G7WKG5hoTypniCdDPEVT3L3iBLCjsFVOZrCz3eXy/qN
	C1yDJpqfG/uUNAv1O4qyKL9gkFqbpMa5qupl2ZEAshb433khkPaUMPyTvB/Gjc3RVoxIsXYRaqE
	lfSNDCxMDAUGVtlKT3NcqMMY5nqsQ6twsBOQMh9H2XJoSXBgEktzriqY/v1g905vyqN02zGKVdX
	WRb4zjKfqSI/vfJ5vAwaQYj1FuUyYqqf6hrXQcizMYq/uZDW5odpk0+s67HfZw=
X-Google-Smtp-Source: AGHT+IGX4p4NhVcnZh50TtUv769wFz+sFqcdcjKuPecNa3/Lzs8Cc/9TiEMGPBFP56Q7b9D3ho9jMQ==
X-Received: by 2002:a17:902:f650:b0:224:26f2:97d7 with SMTP id d9443c01a7336-22c5337a016mr177004135ad.8.1745279313159;
        Mon, 21 Apr 2025 16:48:33 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a1f1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50fde986sm71683175ad.244.2025.04.21.16.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 16:48:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-webserver][PATCH 1/4] apache2: Scrub -ffile-prefix-map in build.nice file
Date: Mon, 21 Apr 2025 16:48:27 -0700
Message-ID: <20250421234830.1217875-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 23:48:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117011

Fixes
QA Issue: File /usr/libexec/apache2/build/config.nice in package apache2-dev contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.63.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.63.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.63.bb
index d4ae26d9c7..9ef8c13b79 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.63.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.63.bb
@@ -138,7 +138,7 @@ do_install:append:class-target() {
     sed -i -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
            -e 's,${DEBUG_PREFIX_MAP},,g' \
            -e 's,${RECIPE_SYSROOT},,g' \
-           -e 's,-fdebug-prefix-map[^ ]*,,g; s,-fmacro-prefix-map[^ ]*,,g; s,-fmacro-prefix-map[^ ]*,,g' \
+           -e 's,-fdebug-prefix-map[^ ]*,,g; s,-fmacro-prefix-map[^ ]*,,g; s,-ffile-prefix-map[^ ]*,,g' \
            -e 's,APU_INCLUDEDIR = .*,APU_INCLUDEDIR = ,g' \
            -e 's,${WORKDIR}/recipe-sysroot/,,g' \
            -e 's,".*/configure","configure",g' ${D}${libexecdir}/${PN}/build/config.nice

