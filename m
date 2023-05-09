Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A95E4C7EE22
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 07:07:10 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.25906.1683616029284431860
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 00:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=mBF0jP3s;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3f41d087b24so19273035e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 00:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683616027; x=1686208027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SaQbCVxU2SqR80OEH7QkcDFWI7/86DrpmsSzlFsC44U=;
        b=mBF0jP3s5m6dRvIPaRDLPdriWEi7gkSxyy+xlKpohFfrYpzhtYuysBebN8EDNYlaLJ
         2BqimQ8kXScHs9gFBwPqFPyVLrSMz6/8Xh2Do73aG4iM3Nlr+cQfX7c61CCky62BW4Cx
         9Hn97Me6mpJSHvA1Zu8sPebgZW1fx+YLWJD+/ELSvupA6B6HhEsCoU29SSp0xrqc76Kk
         THrQn6/R+QTIRzxR6hk/lyrWK8mQpKUQrBpGnMN7u0jOGvnQiDUc3aS1Cwi7S98XCMM0
         Qe69fYJj7fibvToI7dHYI1k1EtdnSuWRTgdZYFD3RywzY4u2SNhI1GYkezFFsd5T/Dcr
         BY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683616027; x=1686208027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SaQbCVxU2SqR80OEH7QkcDFWI7/86DrpmsSzlFsC44U=;
        b=ApblRakXaCxHxN1zWh85MwV5fqNtnJyrLnf5U1MPUj7uWq5MS+1y2LilZDtOJzT715
         RZdPkJQ+UihKrFqt0OnqK273Id5K4+ihjp62f8/1vVKbXiUvAFjRLjEp3M1JIPVTN1EJ
         cYsZpUwWRbtgrlFGyrBWNBrgJYbVncXq8Zojy4W3zGneyTmmmpC3QuIuYUEG1qGIj4z8
         M6j470BvDyxm3x4C/BA1j+zUNWpZXzvJ5o48wMxHv+nw1I3waXqEpaDLwsc3sVrfcwnW
         hFfwKUDk3YLVWW4FkQ4bGHTJD+QWEMzSNpZ/m15kxLPq2mnZ7k1cIKzfhkk9FN2vivxK
         kTug==
X-Gm-Message-State: AC+VfDzLCnLmthP8xCCpLZWGb1tdQ6tlA74ulZlzS+jshSbDDCtBrgxV
	h/OdSZ9ABl4av15Ow4TXEM0QvABksog=
X-Google-Smtp-Source: ACHHUZ7tTSzD4HA5CHZEa/OBko31JuG8Y2LMlxuoC8dncCLNsjBq0/BBZu+N9p+Z2yofMOSjvJa7kw==
X-Received: by 2002:a05:600c:218:b0:3f4:28fd:83e0 with SMTP id 24-20020a05600c021800b003f428fd83e0mr2284902wmi.31.1683616027711;
        Tue, 09 May 2023 00:07:07 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id d10-20020a1c730a000000b003f325f0e020sm18743703wmb.47.2023.05.09.00.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 00:07:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][mickledore][PATCH 12/16] btrfsmaintenance: install to ${datadir}/${BPN}
Date: Tue,  9 May 2023 09:06:51 +0200
Message-Id: <20230509070655.70784-12-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509070655.70784-1-Martin.Jansa@gmail.com>
References: <20230509070655.70784-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 07:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102480

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


