Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D8DBC4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 09:00:52 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.46099.1671526844266946577
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 01:00:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gDqnvD7b;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id m18so27615888eji.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 01:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1oroouW4uytJz7tyEOB5oMIBG13RGLsfLXETAp/KP9U=;
        b=gDqnvD7bFU7R5Puhv62B95bHRKBWGGNxR/OZAQkfv6g3UXqGPCAtSIssuFtfqbtaEm
         /Lj32t5Wkbdi98UVClitk2F4OuAgF+HymtFQk7F1JhdWHKA5YtUpuu4t2gSuo4QwIp+r
         l5znI/hULUQlLFL5tPaIRVCNZplsSd4CdRJQVxRqQLrraERuuoCl/Iwa0rOwCHGIu6Es
         3jSjPwbBq1v9Yl7JlSnDqerXQAr+xCkVWgJ8NXgVdz9BGSrCSx67/5l01vTaNe5NL8Fp
         XGh7BKuCHOMJeCjKzYRLnb1bnYiokOKQxxsdpGK1jvQbJxxP1oqs/BqlVZUzW3Q2xfHP
         xm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1oroouW4uytJz7tyEOB5oMIBG13RGLsfLXETAp/KP9U=;
        b=1wQKfl23qeOaEg3ssFX6C+7vURAvTslaXfZRE7hnm5ai1X6zvyMrauh5Yzr3LWVIzL
         MchBb9Dk1O6fIVwAyS/Nra+/FVto+TrKhNpTlaSguuvEMvKwpMjWQOP9v21oJubtY+5K
         6U3+3rUyzIHHZI+6FAuG+2ez6O/bwCOxjDCKhnJ+TdSDOCjrnKdwTJ9z9E7uAxYIqh5F
         hJ7eiiiTzV4c7ZFjQJ+RzKb6du9hk7ZLQAPDcPEzq8iKCacADzrT+MgBDuzgEcB0HbP9
         i5e+ZFXV9Gkh8d1c0VhxXjiG+HTS88nAsoByeWtsDl36OvDbMuvL/MQys5OcG/LPEZ6W
         TCIg==
X-Gm-Message-State: AFqh2kpUkQOCGRjvRdBPGBBSVAOBf3nh7L5QKZnSh4d1xhG+EUeEhJqQ
	r81Rb+5TWPn19PRb8R5wwpTNNTV0mPU=
X-Google-Smtp-Source: AMrXdXvXKu4CHUc8R4yLEk1LrxyxLuOUjtzeNOddw8mmTq3EnRIgUkpZGG1RZN6W5WJ13aAEHbwWCQ==
X-Received: by 2002:a17:906:f45:b0:7d3:8159:f361 with SMTP id h5-20020a1709060f4500b007d38159f361mr1100942ejj.36.1671526842569;
        Tue, 20 Dec 2022 01:00:42 -0800 (PST)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ec34-20020a0564020d6200b0046b4e0fae75sm5339392edb.40.2022.12.20.01.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 01:00:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] geoclue: fix polkit files only with modem-gps PACKAGECONFIG
Date: Tue, 20 Dec 2022 10:00:37 +0100
Message-Id: <20221220090037.1191034-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 09:00:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100126

* this directory is created only when modem-gps-source option is enabled
  in meson
* fix indentation to use 4 spaces instead of tabs

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/geoclue/geoclue_2.6.0.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.6.0.bb b/meta-oe/recipes-navigation/geoclue/geoclue_2.6.0.bb
index 61b37cd9e8..798a9c16b6 100644
--- a/meta-oe/recipes-navigation/geoclue/geoclue_2.6.0.bb
+++ b/meta-oe/recipes-navigation/geoclue/geoclue_2.6.0.bb
@@ -38,9 +38,11 @@ USERADD_PACKAGES = "${PN}"
 USERADD_PARAM:${PN} = "--system --no-create-home --user-group --home-dir ${sysconfdir}/polkit-1 --shell /bin/nologin polkitd"
 
 do_install:append() {
-	#Fix up permissions on polkit rules.d to work with rpm4 constraints
-	chmod 700 ${D}/${datadir}/polkit-1/rules.d
-	chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
+    if ${@bb.utils.contains('PACKAGECONFIG', 'modem-gps', 'true', 'false', d)}; then
+        # Fix up permissions on polkit rules.d to work with rpm4 constraints
+        chmod 700 ${D}/${datadir}/polkit-1/rules.d
+        chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
+    fi
 }
 
 FILES:${PN} += " \
-- 
2.39.0


