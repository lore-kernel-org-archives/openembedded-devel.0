Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 781BEC3601C
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 21:01:37 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.3838.1743454888389011308
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 14:01:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SEqzGBCK;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-abbb12bea54so995423266b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 14:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743454887; x=1744059687; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+jb8j1ppqfMsRKF0dbQ9kbqGEjyPmueVmhq7YiD/ys=;
        b=SEqzGBCK6WGrLpoLOMqlYOJYyN2cHP192dyqA1KzPrLxR0JeHCv3K1/FcJEYdJSvJH
         fyMcJc9NvdWdZ7uFGcOOA2E1toHnJA2Gl4rH7zUJURus5lo3kZf372fE3wQ8tInx0yy8
         zYWNFc+8PYvyETu3hTTSv59S3tySC4f2mJ9Wjp92t+pULW4ltjZiFkbyprCTPjXF9eta
         GNWcZsbNFQPmSr+1/B9JMSBIJ9ZBhUh/AWRlEObDcnrU2LpKnSuNg22xoBrJAp86grzr
         LtOOoCLsakP/cpC1jGC1qiMPWhI8txqu4J7A7MfxmDIm8tuQVRC38uHG30cu7ZXba5we
         hauQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743454887; x=1744059687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5+jb8j1ppqfMsRKF0dbQ9kbqGEjyPmueVmhq7YiD/ys=;
        b=vYhs37GzNJ+O1mevQb4nhQSiZhzvp/s99jyXfTa7xz7xIZJvp3XXihhGRYd96HDFcZ
         G0MHG9Zxqqo6J4Hvn7TCbcLr0etyK8qLL/O8npBp+tH/7/muKlCWdqPSkQKPMW35nlvt
         SuQ4iLmhWWiU5UEzhvJxk37v+nHPaRYfg8PGzo6u+ho7AAS2JrtSO4v6Z/p6JBMz57oW
         wqfufBwoWa26jr2hJZi2bLHiFAL+XzGdPNuS206BfeqR9EwT76vrnkNpBhJ7BYEwNIcN
         7LJIXstApoQml1swuccaOwqDo0pDskWHISqSrNAOnBAzRMwwGd9b0JLFVhVyUMBq1naP
         scrA==
X-Gm-Message-State: AOJu0YwhN4j7Xwz28bglRIDcRR8w2aeSrxEsIZhk/pjqyvLc/nEEhrkm
	pAR+gCoVWj3gmDZkTro8pByH2MlsSsB0hb93yoGj7cDqNGLk08VaECKmMIbc
X-Gm-Gg: ASbGnct/K2wmsfF8CmFNQ4h9ZZq/FTE2RdcQVs3+K/oA7dupOWjGvj5uDzvAuwUSMjm
	PvC7ri9D338XSsIXKlNL127F2jOI9z6WVH+WiANgfVhx+6Roau+/Kf9DMedOiPGiQcDRaEeZTTp
	2RiZch6UfWejWJO0mD5sym7LTDsc7FESBJFnyQfumnOnpOlzWvXdhrherZ+RAqlcIlCDPiogKee
	ZE24nS63aCBYiFgY9hS3cIPMKjojSp4poe7ySiS6Duck1AkqFUwM4leOnI3Q3rxtM1W5AjEqfeK
	SbcH7Hz6J5xtpgQWaUKJ1wTt5uOepOVhy4JX/mxdF++GFUs=
X-Google-Smtp-Source: AGHT+IFltc1HHclNaYhzaT8Os0MTesyr7qQa87ipuj3188fw58DAn9Lwwcn4x5y6FGmdWFkS/Cz1BQ==
X-Received: by 2002:a17:907:3f12:b0:ac6:b639:5a1a with SMTP id a640c23a62f3a-ac738b0ba28mr976306666b.28.1743454886549;
        Mon, 31 Mar 2025 14:01:26 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac719221034sm678054666b.32.2025.03.31.14.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 14:01:26 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 14/21] lprng: Specify target paths for needed utilities
Date: Mon, 31 Mar 2025 23:00:54 +0200
Message-ID: <20250331210101.3460858-14-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331210101.3460858-1-martin.jansa@gmail.com>
References: <20250331210101.3460858-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 21:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116450

From: Khem Raj <raj.khem@gmail.com>

pr,openssl,chown,chgrp are guessed during configure and they are
found on host, sometimes under native sysroot and some under HOSTTOOLS
which is not right, therefore point to target locations of these tools

Fixes all errors like below

File /usr/sbin/lprng_certs in package lprng contains reference to TMPDIR

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/lprng/lprng_3.8.C.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb b/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb
index 73e4eac3dd..cd9d9e8a36 100644
--- a/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb
+++ b/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb
@@ -11,7 +11,9 @@ SRC_URI[sha256sum] = "694a1747a96385b89e93f43343bf35cee5c8c73353a83814106911c99f
 
 inherit autotools gettext
 
-EXTRA_OECONF = "--disable-ssl --disable-kerberos --enable-force_localhost"
+EXTRA_OECONF = "--disable-ssl --disable-kerberos --enable-force_localhost \
+				CHOWN=${base_bindir}/chown CHGRP=${base_bindir}/chgrp \
+				OPENSSL=${bindir}/openssl PRUTIL=${bindir}/pr"
 FILES:${PN}-dbg += "${libdir}/lprng/filters/.debug"
 
 # configure: WARNING: Program 'clear' is not found. Set environment CLEAR=no if you do not want to use it

