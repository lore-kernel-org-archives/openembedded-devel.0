Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1855C71157
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 09:55:22 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.4609.1750499715242072955
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jun 2025 02:55:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dFrnI+yO;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32b4876dfecso36688991fa.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 02:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750499713; x=1751104513; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6R9SykJL7GBiWryESuNt2l61UuhBmxfCNS45nF9jPL0=;
        b=dFrnI+yOuVJPaK3VKYanmgLL/OxX/u8PyOAcnNF8AnV8D4IXW8jftdog2m1b4Id8eT
         xAp7/UFYeQY24+slMTrzpBwSwQwEr5lJ+p7nRfG/nbiHSB3Pui+7icF+P6HRMatUmKuw
         JT46lkitKGFZqYHQ1XM0P6tmh7CE2t+Qqr2ByBP14RoxlFfoHfBE/TGSR8k+abdFi7NK
         dakw/qzmKHKykmnOi3jKVzRMxw9Hqwo2PvyLKTWi5MEb5rBSxoYisV9qwFvsMG/DpyNB
         89C+xN79dUHaT12DvBYfE2w3jftnwFuyp9KdNWhSl0s01TulAHzMOB7Be0/rThPllFgp
         aeNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750499713; x=1751104513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6R9SykJL7GBiWryESuNt2l61UuhBmxfCNS45nF9jPL0=;
        b=sdK7CtnRrfyn7ZQc5ANWUUnn20Gbwt19xQ4CM9dXPxrd7wc6MXBvQeDA3S1SHt4XJm
         to8BjhJHcAvq5TQ+NAP1DGU+Awb1NkjtTvgSbI2HQ3P798vimo4s5F5ioTgF797+fhFW
         sghFaiJthqkD8T6HA/VgKN8M4vFP2aoPP85Smw6SSMnvOQCf3SPxr4DY5xtfhTxHsNPQ
         4s7sv94Rxj2eFdUZyg5D5p+dlZ26jqrJu85GgkaMCcG5tzf4yjGRyycOYhoR1BYkrvjz
         HV8TUPwM+/PZ44N6yOwR0gomMAtL4m42WSjxfYhrqrEdjXxJAalpBlwLkIeCRPnWQ7PL
         +ong==
X-Gm-Message-State: AOJu0Ywd82QpIidVg71HZuMEM0Ais3G3psgbcZHP3wbstlP94G0piC7/
	ZKhzulWIO1PvT3744w8msh2ROaTFcy/6KZEcwZ7FE+OI1n3RTbvuaAdsSKJYrSH2
X-Gm-Gg: ASbGncvfawagKhz0EsVZbpweZzKNRivh8U95qI4kv1wWz87XPkg8JT8pNqLjOjwDUMD
	lH4MFJug3JzGMMIcpe7iYTFFGsv361iP1y7hkwD3H7R7mKCwaTIZGXR7xH+7drA/6gUYtjdgzdV
	yp93iv8ouV/+g5gZngGVPj+XBvAnxgBT2oVCzOjFjU7Q3/ODrpDVYftwq7oyvdFiP76PDlO6or3
	HoOe+0B+/KFi70bYMAxBJ299VG8DgHSm2V2e5tGLa3llo93jERIqS4AtXKZpTnE2fmRH/W7JCvr
	h9GWZc1omG/b9RjHUGXqsQZP0cqesX/eJp7QRTxuc+8EiWNi+3Qwdh+1naDtVZRcsYDShoXYfU5
	venQ=
X-Google-Smtp-Source: AGHT+IHtamtSvDlG+T6ljYKmidmctXfgc/J6SqK2Zus/TI6h5F5Ik35yvRjvLC4HSkVbPCgD2FkfbA==
X-Received: by 2002:a05:6512:a8e:b0:552:21b9:8bae with SMTP id 2adb3069b0e04-553e4fe12c4mr1847335e87.7.1750499712700;
        Sat, 21 Jun 2025 02:55:12 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.153])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b980c1d4dsm5720071fa.80.2025.06.21.02.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 02:55:12 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] influxdb: Allow network access during do_compile
Date: Sat, 21 Jun 2025 12:55:06 +0300
Message-ID: <20250621095506.1484044-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 09:55:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117994

Allow network access during do_compile to let Go modules be fetched at build time and avoid network unreachable errors.

ERROR: influxdb-1.8.10-r0 do_compile: Execution of '/tmp/work/core2-64-poky-linux/influxdb/1.8.10/temp/run.do_compile.1473782' failed with exit code 1
Log data follows:
| DEBUG: Executing shell function do_compile
| go: cloud.google.com/go/bigtable@v1.2.0: Get "https://proxy.golang.org/cloud.google.com/go/bigtable/@v/v1.2.0.mod": dial tcp: lookup proxy.golang.org on 77.88.8.1:53: dial udp 77.88.8.1:53: connect: network is unreachable
| go: cloud.google.com/go/bigtable@v1.2.0: Get "https://proxy.golang.org/cloud.google.com/go/bigtable/@v/v1.2.0.mod": dial tcp: lookup proxy.golang.org on 77.88.8.1:53: dial udp 77.88.8.1:53: connect: network is unreachable
| WARNING: exit code 1 from a shell command.

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
index cc305f6e8d..e9164e0507 100644
--- a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
+++ b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
@@ -24,6 +24,8 @@ GO_INSTALL = "\
 
 inherit go-mod pkgconfig systemd update-rc.d useradd
 
+do_compile[network] = "1"
+
 INITSCRIPT_PACKAGES = "${PN}"
 INITSCRIPT_NAME = "influxdb"
 INITSCRIPT_PARAMS = "defaults"
-- 
2.43.0


