Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B6EEC7EE24
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 07:33:25 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.44412.1683185594877339356
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 May 2023 00:33:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=GChrnJ76;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5083bd8e226so95964a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 May 2023 00:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683185593; x=1685777593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SaQbCVxU2SqR80OEH7QkcDFWI7/86DrpmsSzlFsC44U=;
        b=GChrnJ76SrROyNYlysSTur3pfcxvJVeBI+slXj6k9t7UsbN6iDGaEi/mv56q+2zj4L
         g2sNVrBlaxQRHnWjHvhoWR16LVBdp0PTc29lsrbV/m9S9AkNuDtjsViYBtT7u6sYDsi7
         kKUX4QHwkyjTz60Q6niqnx0zaHifzU0/lTQS2JwbWqzIA8py2vJs7G7s01ukxBsiEL3O
         ZLX7UG/7UzzK6x/Unk3b6WC0RykkPpDbVXqBlxHN/XHVZ2TlmRqMBhhFN4fOYY/s1gn8
         L59LX+qiNdqjQjHlCLoaZ1UB+j5qMAyCpGagn6PR/mon8TH7qYxZ6prAwUvdqVd626v4
         VDvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683185593; x=1685777593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SaQbCVxU2SqR80OEH7QkcDFWI7/86DrpmsSzlFsC44U=;
        b=h5vjSFB804/NfjmIDalybT23FarKVblnZZdudiMWVqITQiQx/5F0uxru9NQkuufr2h
         VUVFk1vwTVH4T6+2W/8ZDEcysabmZZbs/WGwm4smwsCZovmCHW+kpMqyM678Tt8iV+s3
         zcc5nUiFLgxRq/fUczgtjEbv1++pY6L52u5LjkhmH9dI9JvDkVE0x103PC9h+fKMvmyg
         wg9rgJ9RMIu+QqWT3yVZqaNii2Yw9VTmoznYSAtMJi+AaH7bXKe3g+4MCiJ9x7ucIW8s
         LqdLxwnCJt86hjVznOkyjZ9H3GLfdLoeGWSVLhQ9inkbUBLcaMGciAPC2q8CE3rfNyPK
         ZsJg==
X-Gm-Message-State: AC+VfDxXk51vznmFjnLlp3OK8s6b/CSU7f0Fydv3jsMsFbCwdGZhQsZ0
	NC5TkR7prd7rvOGUGsGZT7gvcnl2Sf8=
X-Google-Smtp-Source: ACHHUZ4XKppkLmILm2kdFdgC2kOTaTdwnC6r3qGileaRrKBJBSLo3ek60zCNFDwc2YI9zzAMjxnWtQ==
X-Received: by 2002:aa7:c64d:0:b0:504:9346:11d3 with SMTP id z13-20020aa7c64d000000b00504934611d3mr881852edr.29.1683185593230;
        Thu, 04 May 2023 00:33:13 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id m11-20020aa7c48b000000b00504a356b149sm1550298edq.25.2023.05.04.00.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 00:33:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/4] btrfsmaintenance: install to ${datadir}/${BPN}
Date: Thu,  4 May 2023 09:33:05 +0200
Message-Id: <20230504073308.1251185-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 May 2023 07:33:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102302

* fix installed-vs-shipped with multilib:

ERROR: QA Issue: lib32-btrfsmaintenance: Files/directories were installed but not shipped in any package:
  /usr
  /usr/share
  /usr/share/lib32-btrfsmaintenance
  /usr/share/lib32-btrfsmaintenance/btrfsmaintenance-functions
  /usr/share/lib32-btrfsmaintenance/btrfs-defrag.sh
  /usr/share/lib32-btrfsmaintenance/prepare-release.sh
  /usr/share/lib32-btrfsmaintenance/btrfs-trim.sh
  /usr/share/lib32-btrfsmaintenance/btrfsmaintenance-refresh-cron.sh
  /usr/share/lib32-btrfsmaintenance/btrfs-scrub.sh
  /usr/share/lib32-btrfsmaintenance/btrfs-balance.sh
  /usr/share/lib32-btrfsmaintenance/dist-install.sh
  /usr/share/lib32-btrfsmaintenance/btrfs-defrag-plugin.sh
  /usr/share/lib32-btrfsmaintenance/update-balance-usage-defaults.sh
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
lib32-btrfsmaintenance: 13 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb b/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb
index a4573cf596..5761844f81 100644
--- a/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb
+++ b/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb
@@ -38,9 +38,9 @@ do_install() {
         ${D}${systemd_system_unitdir}
 
     install -Dm0644 ${S}/btrfsmaintenance-functions \
-        ${D}${datadir}/${PN}/btrfsmaintenance-functions
+        ${D}${datadir}/${BPN}/btrfsmaintenance-functions
     install -Dm0755 ${S}/*.sh \
-        ${D}${datadir}/${PN}
+        ${D}${datadir}/${BPN}
 
     install -Dm0644 ${S}/sysconfig.btrfsmaintenance \
         ${D}${sysconfdir}/default/btrfsmaintenance
-- 
2.40.1


