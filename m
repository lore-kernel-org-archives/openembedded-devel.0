Return-Path: <geoffrey.vl@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A031AC5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 13:57:40 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.34185.1749218255029728734
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Jun 2025 06:57:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IyG29i5O;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: geoffrey.vl@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-450cf0025c0so14874675e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Jun 2025 06:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749218253; x=1749823053; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oArnX+VVsKVGsuuQBR/eH2QAYJl9kgNPUzlMLAc/4v8=;
        b=IyG29i5Oo+Zoz4OZ8dp1ziokumjMsjlpTq6iH02IV+9ZAgRthviPjvMjM5QSWNZZVF
         1dxcAyRPe+VYr1aR8SRA7jZdTO1YG2GjMx36m144oJmKpeF4ENPtOljw04ET/btV93oB
         wlEd2+cHZZlJ8OJlDo81ZMVxfij6TOdgJAxuqMSN1QArzW3hh+umVBEpZJTekhZaJr3N
         UVhF06UtIVhwZrgIRHk4uIoostpZK8unwGHEUFgg0znrtH1NpJzfvbehZkOEJ8benxPi
         6B7Hcdt6rOZ78pNeidy09muQY190OQJILBfelhokOAAHmpboxPBjUB1kFyQlGk9qgq4T
         JGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749218253; x=1749823053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oArnX+VVsKVGsuuQBR/eH2QAYJl9kgNPUzlMLAc/4v8=;
        b=iywZT7Zp+/+SS6u9kADnXYCDsWzR8bCLS4nXeEZpsQ+kxfMTJQ2HTWjVrw7Cp6KLHs
         ciUkeutYLKtcjBLPqKGNnp1wkL2Tol/SujEDJ4rtu8z0+kDkrAVj8BUmAHjvtWuFFGNI
         CRk2waciiBB3n1qjIjuVF/TEnKYJ4BkcKby84KNMhsq/M86owHMstNFqjkD+ozuZzXWx
         vU1wHMJtjxMaG1ls/E5fZmJDj1egZcnw6NVZT6NVR2x+kwdCNVfS3MOiBHmCZ5tdiUZa
         GbHzayVeCA7mhMQlGSUKRD/iZcw8LkBdjMWb8CvtTqpDW9NAndP/bNo4l3XcnDiQIGRl
         XolQ==
X-Gm-Message-State: AOJu0Ywtky/keW5gaXFxuo29B5HH1wBuZELLyINayjiW+XEVZRbKsXtT
	wVMIjuUfgugDRw2MkizbSvx0cuJD4qbH52Fy9mTU77ZkDr9MzR7OQ+1ziU+E4A==
X-Gm-Gg: ASbGncvsFzJAIAcLH87YbkrUfZCxitVHT0AVRul4su/T/JuR8HiuGF7Dj0eipFVSiwh
	tAKNjQFcPublQlcmmFGVoC0BtoqFDkrzIWa1lzQ4PkePDibQ4eNPbTHuacjZQCIOEk0jjwURHrd
	dPswsl6VnlbSB0xSecoviFzAnm6gp3Sa+YGhA3pur3tiP24/4PaSD6sTS6QlDKEpaTuJyKNm3Ob
	nYD862Du5R9mzHoZ3riRP61Ezgo/s0Xj9r9gg9rTHTY9rG3jILVxG2lIpbI8HNEg4X1dmZboEpA
	bX20wST+4O69C/L9uAWV3fg4Wy7h/Bx8CHwdQVZM8576g2xMlrQLOmTgsOy2Z8WLQydzIBtgdMc
	N8TxLeixNxLUZdGiHYM+18e/eufuDqQCcQBtGRloyftvPtthrmwXM/mGQXvIyj8HSxIUa9dypKf
	5Hvw==
X-Google-Smtp-Source: AGHT+IGytPk4ifYY7R9ufHKG0fcHnS5Oo2lNNl+UqDcI7wRy2UKBtpGPM4iWWknRAUNVLb7ArPekBA==
X-Received: by 2002:a05:600c:3493:b0:441:ac58:eb31 with SMTP id 5b1f17b1804b1-4520140479amr33227105e9.20.1749218252607;
        Fri, 06 Jun 2025 06:57:32 -0700 (PDT)
Received: from localhost.localdomain (ptr-gh3gmpc0271gzzhsbcj.18120a2.ip6.access.telenet.be. [2a02:1812:2512:400:ee7a:a22e:484c:7573])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5324364f1sm2013860f8f.58.2025.06.06.06.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 06:57:32 -0700 (PDT)
From: Geoffrey Van Landeghem <geoffrey.vl@gmail.com>
X-Google-Original-From: Geoffrey Van Landeghem <geoffrey.vanlandeghem@niko.eu>
To: openembedded-devel@lists.openembedded.org
Cc: Geoffrey Van Landeghem <geoffrey.vanlandeghem@niko.eu>
Subject: [meta-oe][kirkstone][PATCH] monit: upgrade 5.32.0 -> 5.35.2
Date: Fri,  6 Jun 2025 15:57:00 +0200
Message-Id: <20250606135700.1689460-1-geoffrey.vanlandeghem@niko.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Jun 2025 13:57:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117762

Monit 5.32 seems to contain a bug where it runs its poll cycles much faster. This can be troublesome when setting up dependencies. See https://bitbucket.org/tildeslash/monit/issues/1131/service-with-many-dependencies-hits

Signed-off-by: Geoffrey Van Landeghem <geoffrey.vanlandeghem@niko.eu>
---
 .../monit/{monit_5.32.0.bb => monit_5.35.2.bb}            | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/monit/{monit_5.32.0.bb => monit_5.35.2.bb} (84%)

diff --git a/meta-oe/recipes-support/monit/monit_5.32.0.bb b/meta-oe/recipes-support/monit/monit_5.35.2.bb
similarity index 84%
rename from meta-oe/recipes-support/monit/monit_5.32.0.bb
rename to meta-oe/recipes-support/monit/monit_5.35.2.bb
index e4ec9d5262..6ff74cf0d8 100644
--- a/meta-oe/recipes-support/monit/monit_5.32.0.bb
+++ b/meta-oe/recipes-support/monit/monit_5.35.2.bb
@@ -6,8 +6,8 @@ causal actions in error situations."
 HOMEPAGE = "http://mmonit.com/monit/"
 
 LICENSE = "AGPL-3.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ea116a7defaf0e93b3bb73b2a34a3f51 \
-                    file://libmonit/COPYING;md5=2405f1c59ed1bf3714cebdb40162ce92"
+LIC_FILES_CHKSUM = "file://COPYING;md5=79ca9f26f1ecb1e377e90383109ede64 \
+                    file://libmonit/COPYING;md5=44aaa0a664332e9568add09f1ddb01cb"
 
 SRC_URI = " \
 	https://mmonit.com/monit/dist/monit-${PV}.tar.gz \
@@ -15,12 +15,14 @@ SRC_URI = " \
 	file://monitrc \
 "
 
-SRC_URI[sha256sum] = "1077052d4c4e848ac47d14f9b37754d46419aecbe8c9a07e1f869c914faf3216"
+SRC_URI[sha256sum] = "4dfef54329e63d9772a9e1c36ac99bc41173b79963dc0d8235f2c32f4b9e078f"
 
 DEPENDS = "zlib bison-native libnsl2 flex-native openssl virtual/crypt"
 
 inherit autotools-brokensep systemd update-rc.d
 
+EXTRA_AUTORECONF += "-I config"
+
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam"
 

