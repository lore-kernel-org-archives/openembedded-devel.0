Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3586DC27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 10:27:19 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.22856.1719397630421955651
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jun 2024 03:27:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XMCnwB/6;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ec4eefbaf1so56554501fa.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 03:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719397628; x=1720002428; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6DP579SeCTwAfPhZwTXyxDHErkicupCCE4eaSitceRE=;
        b=XMCnwB/6A/R3K2QhgA847LdiYAYby9C7/aupmGm8Yx7zahNMb2z77NMBJjwiGsXnXA
         jgiajU2P9zETLngSYxhQWy59UH3TyfqzyJUdHAbmEVC5UMvj/72WXwn6qUM7055lwnz+
         QlZhT6sxpq5umHLEmJe0DjlMhyMoAGjjBAqM82AlDyIO2rjswciNtJXtiguoAdZQTvcT
         ogq/fbYNVbt0qub4CpGjt9kaCaSNZ/4nmCenbkaLfhHYVBl5etUh9ZQeBSV09eflqO0n
         AJDr+ImYsAp2UgXhhOze+SyLZ9XaO4BcKPQUyMpWlvmQ1eChk349UKYpxPI6rmUqycvj
         vGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719397628; x=1720002428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6DP579SeCTwAfPhZwTXyxDHErkicupCCE4eaSitceRE=;
        b=onFTtr67sjxP4loX4Q3L1SdZgWofmGMBTTXIdIZywVIntUwU/cNPgOHWDJsvX0xP3d
         7FFke8JxGhQPh2WAri3kIKMdzmzJtIDqtZThyzzoqkuz8M5vYPgQNxYE24Z5k+jjFtZt
         r0YNqyL+aRE1DyMRRTE96icz1alT+5QYgscinnupuD4EESE5tWUVRVL7ud6yT0YuIqwn
         Z4FF2T2s84XJnEdRIuMP1HgxOZJ91CydEb9FC81vtPHhmM8GG1hWtzTulQP0DFodnfgg
         9J48UKtzy6aZPw7mv0wdy99FqVe1UaSqimZrD6CMU6RKjFZn3fcKDxLyCtx9lBpAzZgp
         LmRA==
X-Gm-Message-State: AOJu0YzrVy/LSQQQbsK8S6fHlriD1aedLBa++pnOSBwVd4vf+Ah/+ae1
	CoA3Ckab9hwr4O+CoVOV1QQGDQv0FZQcJ0b/p0WL9wYDBUd90KMSr0WNPe4t
X-Google-Smtp-Source: AGHT+IHXSdq0oTQ+OhtuZBbAhHQINN0vpWSwMywZsDD40FrAnloDhR5FGJYHRLqfEOgjyhQDiancDA==
X-Received: by 2002:a2e:9f05:0:b0:2ec:fa4:e310 with SMTP id 38308e7fff4ca-2ec5b3d48ccmr54767241fa.34.1719397627601;
        Wed, 26 Jun 2024 03:27:07 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c82785c9sm20304065e9.33.2024.06.26.03.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 03:27:06 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-networking][PATCH] rdist: Fix contains reference to TMPDIR [buildpaths] warning
Date: Wed, 26 Jun 2024 13:26:57 +0300
Message-Id: <20240626102657.1225736-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 10:27:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111090

Pass OE cflags to makefile

WARNING: rdist-6.1.5-r0 do_package_qa: QA Issue: File /usr/bin/.debug/rdistd in package rdist-dbg contains reference to TMPDIR
File /usr/bin/.debug/rdist in package rdist-dbg contains reference to TMPDIR [buildpaths]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb b/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb
index d81cc9a3d..e6d99431b 100644
--- a/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb
+++ b/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb
@@ -38,7 +38,7 @@ DEPENDS = "bison-native"
 
 inherit autotools-brokensep
 
-EXTRA_OEMAKE = "BIN_GROUP=root MAN_GROUP=root RDIST_MODE=755 RDISTD_MODE=755 MAN_MODE=644"
+EXTRA_OEMAKE = "CPPFLAGS='${CFLAGS}' BIN_GROUP=root MAN_GROUP=root RDIST_MODE=755 RDISTD_MODE=755 MAN_MODE=644"
 
 # http://errors.yoctoproject.org/Errors/Details/186972/
 COMPATIBLE_HOST:libc-musl = 'null'
-- 
2.25.1


