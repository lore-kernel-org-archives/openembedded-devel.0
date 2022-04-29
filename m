Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4586C433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 13:54:28 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.10257.1651240467102417652
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Apr 2022 06:54:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nE3upQlq;
 spf=pass (domain: gmail.com, ip: 209.85.216.43,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 m14-20020a17090a34ce00b001d5fe250e23so7339744pjf.3
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Apr 2022 06:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i6e8AyZxjUi+uuCL5Wru2qQaH3gs2saXroCIutG/JQM=;
        b=nE3upQlqw2pbiqnSv7FCAU44RQz+Fvajr+VgaecXavuo/qUZPaFwLjVhiM3fIakisT
         B+6Qj2VfOQZ5zGudKdcyhYc6VYv8J+O9kqy37VCwH3g2iZfAClBS3Gk6yNvIxI4MA5Z/
         mWGliJoRK8UXL1hZkQ0Bw+V9gPJuM002pVxLsTZEKBBX4ppa6RFKG+olHn+WBrfHByZW
         fkpYf2J7ynH+Cu9A3zsGftykPp+Bcyhno7G1+RVcy1Iy2zZJPBkTemOaJI1/g8MPNbeQ
         qt50uKme0m6JwJdhpvbHIAAr/Yd2wA9aFdXy7v3oLIDRAoKsenNGGT1DqWKbPF5m5ZGc
         nLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i6e8AyZxjUi+uuCL5Wru2qQaH3gs2saXroCIutG/JQM=;
        b=vIfCyiLVpQBss66QuA9zFSbB9hk2WMiUOhy9alFI0Ma6zSHQogAHfycpQUYhawBWls
         QFr6WAW9TfqqfDd2dMmNaLiScP7v0Gltlo5V/I772rZdK4LW1jC6bHKYxsSX/oEy8jH1
         mJ2SO1bFe4/EhSb+LmGfaMbuSyqLl+BSnEIZtQaCD4rLDT5xmvyv6eOhUeVaxJfrF2Qd
         SCZ9VMrnUE+MmoDg0/PSEDrDPk67wJstPvLWmqA0Nc676fPULPGJpwNyXhGDJQuGNI3C
         68rMXa07QjpYarq2SJuU/jQ0HdJg2HYg7faSxWiDKrPK8MhuxnfWbtAkvZxGu5RUnbXp
         mb0A==
X-Gm-Message-State: AOAM533EYr+ovFoPmA2ETEsg+nBSPKKTeNv31EUAjrty7oeLjqTexZdt
	3pm8nfOMKgrmbgSEhogyAN7Luol1JOY=
X-Google-Smtp-Source: 
 ABdhPJwxUTVb46LFQFgJZ8xAfyZ8icpPD2H3qgqT7kIFKg9x9/JqpRLdVfXRD80aH0KRQQyH9IQUsQ==
X-Received: by 2002:a17:90b:4f91:b0:1cd:3a73:3a5d with SMTP id
 qe17-20020a17090b4f9100b001cd3a733a5dmr4093722pjb.98.1651240466405;
        Fri, 29 Apr 2022 06:54:26 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:bfea:e64:b39d:fb6e])
        by smtp.gmail.com with ESMTPSA id
 123-20020a620681000000b004fa7c20d732sm3230333pfg.133.2022.04.29.06.54.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 06:54:25 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] meta-python-image: Fix build depends
Date: Fri, 29 Apr 2022 06:54:24 -0700
Message-Id: <20220429135424.1658353-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Apr 2022 13:54:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96857

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../packagegroups/packagegroup-meta-python.bb          | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index d2d9dcd185..20492e9522 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -12,9 +12,9 @@ PACKAGES = ' \
 # FORTRAN:forcevariable = ",fortran"
 RDEPENDS:packagegroup-meta-python3 = "\
     ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "python3-systemd", "", d)} \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "python3-blivetgui", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11 systemd", "python3-blivetgui", "", d)} \
     gyp \
-    pamela \
+    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "pamela", "", d)} \
     pyrtm \
     python3-absl \
     python3-aenum \
@@ -52,7 +52,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-bitstring \
     python3-bitstruct \
     python3-blinker \
-    python3-blivet \
+    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "python3-blivet", "", d)} \
     python3-booleanpy \
     python3-cachecontrol \
     python3-cached-property \
@@ -84,7 +84,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-croniter \
     python3-cson \
     python3-custom-inherit \
-    python3-cvxopt \
+    ${@bb.utils.contains_any('FORTRAN', [',fortran',',f77'], 'python3-cvxopt', '', d)} \
     python3-cycler \
     python3-dateparser \
     python3-dateutil \
@@ -328,7 +328,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-pyscaffold \
     python3-pyserial \
     python3-pysonos \
-    python3-pystemd \
+    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "python3-pystemd", "", d)} \
     python3-pytest-asyncio \
     python3-pytest-benchmark \
     python3-pytest-cache \
-- 
2.25.1


