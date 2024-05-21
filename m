Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88ACFC27C4E
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 18:10:38 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.3046.1716315031418183760
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 May 2024 11:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O14APLJo;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1ee0132a6f3so3483135ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 11:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716315031; x=1716919831; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GU9xvFeyZnDJryhNeRpbPyYKhkh1NO7qC0CMXJ/cRg8=;
        b=O14APLJoqkXJebe62M6nSAvMXz6UrKPfjh/XTgSzOrIg8jtib+Z+0TkCanKq7GSG6s
         E0ytaahvna/+gG3aM6oDXjofNP7FDngjZX9Al45hMC2fnOUQo2dzSyjI7c6ZMzvWiLNk
         N7RB9uxtU5Amaesc+iNrQtD8GI9WiQaoEavhYsdbnJffP9Z5VQBFJtzSTSclSx2PMhQB
         AsDSekeeMjFgiFmjKy6xRVkukqOvIflcR+rBNy9O/LxPxvehjie3ZLvA7DMGkpsV75/H
         R13bxHsC5yXmwDd1NNKRNs/2hEdd96fh8tAMbFis3nL8kVR0jB/m9YExOfTKT8OtFGhv
         gFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716315031; x=1716919831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GU9xvFeyZnDJryhNeRpbPyYKhkh1NO7qC0CMXJ/cRg8=;
        b=ulYYOmUzEFd1FJtMDjoRHw8liVdPQkPSJit1v3xL8gmaFWNmYmv1+sDKZl2NujbwLP
         BJSGhCGhd6yQ9oTKI+kUbclGhOhUepkYp6UcpHkRxvphpk63RI5mDHdt8xRRNwNaFGA2
         ecUy39kGu3Ab0aYSPEnp/e+TbGB1BcFQ8sfVSLuxl+7c8Kw4H80f37FbZkd5vO0/oFwn
         YUEoS9RZK3lD9bmLrs1k1V6iRpt/soslAtyB5YUndab5z3GH6ba8UV3ZLBwxRv9JRa4E
         Wnmet3vWlQLeZVSJdAiLSokzMzbJScRDT2/hW82ZOYjWJhbr/QT9HDvkMmB2lfOz2QRe
         NcAA==
X-Gm-Message-State: AOJu0Yzufxz1Nxx1xiPV7ew8KaYhf/fPCyMX6wMe14M4Sc9UwYDtkHAo
	YM3jWDVLo4D3H+aT9SW3yWhu9MTsVbvCK16LxykOKhEyGZ37EmFmqqJIVlF7J6o=
X-Google-Smtp-Source: AGHT+IHkyLvYGUcfh2WFF9pTYl1NLFVWdVSBWN4yz/X+E7biZ0Bf10TNtJ4hOPqeLjcDKj9Uf2UK5A==
X-Received: by 2002:a17:902:e54d:b0:1f3:244:c619 with SMTP id d9443c01a7336-1f30244c8e0mr73178775ad.7.1716315030601;
        Tue, 21 May 2024 11:10:30 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e8eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c136354sm224799075ad.244.2024.05.21.11.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 11:10:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][ 04/22] gosu: Adjust for UNPACKDIR/WORKDIR rework
Date: Tue, 21 May 2024 11:10:05 -0700
Message-ID: <20240521181024.426176-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240521181024.426176-1-raj.khem@gmail.com>
References: <20240521181024.426176-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 18:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110453

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/etcd/etcd_3.5.7.bb | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-extended/etcd/etcd_3.5.7.bb b/meta-oe/recipes-extended/etcd/etcd_3.5.7.bb
index 0794158a52..24e111dea0 100644
--- a/meta-oe/recipes-extended/etcd/etcd_3.5.7.bb
+++ b/meta-oe/recipes-extended/etcd/etcd_3.5.7.bb
@@ -2,12 +2,12 @@ DESCRIPTION = "etcd is a distributed key-value store for distributed systems"
 HOMEPAGE = "https://etcd.io/"
 
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://${S}/${GO_INSTALL}/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+LIC_FILES_CHKSUM = "file://${GO_INSTALL}/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = " \
-    git://github.com/etcd-io/etcd;branch=release-3.5;protocol=https \
-    file://0001-xxhash-bump-to-v2.1.2.patch;patchdir=src/${GO_IMPORT} \
-    file://0001-test_lib.sh-remove-gobin-requirement-during-build.patch;patchdir=src/${GO_IMPORT} \
+    git://github.com/etcd-io/etcd;branch=release-3.5;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
+    file://0001-xxhash-bump-to-v2.1.2.patch;patchdir=${GO_INSTALL} \
+    file://0001-test_lib.sh-remove-gobin-requirement-during-build.patch;patchdir=${GO_INSTALL} \
     file://etcd.service \
     file://etcd-existing.conf \
     file://etcd-new.service \
@@ -62,11 +62,11 @@ do_install:append() {
     install -m 0755 ${D}${libdir}/go/src/go.etcd.io/etcd/v3/bin/etcd ${D}${bindir}
     install -m 0755 ${D}${libdir}/go/src/go.etcd.io/etcd/v3/bin/etcdctl ${D}${bindir}
     install -m 0755 ${D}${libdir}/go/src/go.etcd.io/etcd/v3/bin/etcdutl ${D}${bindir}
-    install -m 0644 ${WORKDIR}/etcd-existing.conf -D -t ${D}${sysconfdir}/etcd.d
+    install -m 0644 ${UNPACKDIR}/etcd-existing.conf -D -t ${D}${sysconfdir}/etcd.d
     install -d ${D}${systemd_system_unitdir}
-    install -m 0644 ${WORKDIR}/etcd.service ${D}${systemd_system_unitdir}/
-    install -m 0644 ${WORKDIR}/etcd-new.service ${D}${systemd_system_unitdir}/
-    install -m 0644 ${WORKDIR}/etcd-new.path ${D}${systemd_system_unitdir}/
+    install -m 0644 ${UNPACKDIR}/etcd.service ${D}${systemd_system_unitdir}/
+    install -m 0644 ${UNPACKDIR}/etcd-new.service ${D}${systemd_system_unitdir}/
+    install -m 0644 ${UNPACKDIR}/etcd-new.path ${D}${systemd_system_unitdir}/
 }
 
 FILES:${PN}:append = " ${sysconfdir}/etcd.d/etcd-existing.conf"
-- 
2.45.1


