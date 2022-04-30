Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED864C433F5
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 19:19:00 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web12.26119.1651346331928460276
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k8WRSkVA;
 spf=pass (domain: gmail.com, ip: 209.85.214.175,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id h12so9674197plf.12
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=TBHf2domq20kOjiqU/iAGRvjOmya4D00sNisPnM4N74=;
        b=k8WRSkVA9k4obR26utrm9mgPxNT1darIdRmiN7K1gp7cUbBIVfPS61ImK0Cw3x7H3F
         JU00MMocThH6ychJnIAwem1FriA4RX+EjWxzSTi+B+axpqKJG3oLOvj3kjFt42u9YnoG
         +M8q1UOHnFBG0F09JyrfDG2hI53gQp8aFDcfTaPWrjZEUVssKK0PLoN4cox63DhZSUQq
         Km7sjS+YFHV0V/dvxP503xZxITNZRAxXHmZuvBeZ7P4GjE+GlKgG7SXw6xxYjKoRnCP+
         JK35Eg3gxtLCJxlK5ng8zBCCmkG0mIY0oPKlc6XhJ0cpJmpyPXDQ+g8HG7CQYXdZJndc
         cnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TBHf2domq20kOjiqU/iAGRvjOmya4D00sNisPnM4N74=;
        b=WeO9PReOD4JTVpoJZAagkXqbOfWjWzARt+n3SgEcDTOWC4oOvzkLveZKRL7IsemG1j
         5KRkXWqH2PaixEODJf5EO8PaMXqDc6FjEtsMrjd9VWHiPc33WzwRNzIMUYQusM+2PYPa
         yttmvJ4u7SZbJnm9mDrku6X8q0oAmUnOT21wY3dVMwsNaC8yr5T5bkkxCfHfVzae5hkp
         cJGFkbmka2dVlXe+SOcPaKSmmxCKdChzFMc71THJl8NcASx5VA0l6UZ2yAuSgq+pRUhO
         Kvvuho3oaROwOL0ytR+ghB1Ycv7u14fA36+ahpayxxvtSzKRESLhAAWAg3nVXthhLIob
         nbqg==
X-Gm-Message-State: AOAM531wa7V2pOyQzXHaRPt6zwuu862jl0SObqNyLiVgAzWtZ5A98ALA
	mbH9FQNIb5W1cTfQIqGQFI+h30ZM3TFrnA==
X-Google-Smtp-Source: 
 ABdhPJzhJa38mjfgkybrLHDD/o4o4Es64ahEC3uflrSJs0/hlgYqULMTFXMZLApL9CAGV0bLBb+ggg==
X-Received: by 2002:a17:902:aa46:b0:159:6cb:163 with SMTP id
 c6-20020a170902aa4600b0015906cb0163mr4645511plr.83.1651346331168;
        Sat, 30 Apr 2022 12:18:51 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:8e62:e537:ba7a:ce43])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a170902b94a00b0015e8d4eb28bsm1810756pls.213.2022.04.30.12.18.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 12:18:50 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 16/39] fwupd: Enable build with musl
Date: Sat, 30 Apr 2022 12:17:56 -0700
Message-Id: 
 <0bf5d0fcf0df4ad109e538795a1509a802d7ac61.1651346200.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651346200.git.akuster808@gmail.com>
References: <cover.1651346200.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 19:19:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96883

From: Khem Raj <raj.khem@gmail.com>

It does not fail anymore as the qemu options has been sorted

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1fa927eba97561d00e3a249c41356a482d68b402)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-bsp/fwupd/fwupd_1.7.6.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.7.6.bb b/meta-oe/recipes-bsp/fwupd/fwupd_1.7.6.bb
index 20dccc2356..53f1720b04 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_1.7.6.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.7.6.bb
@@ -4,8 +4,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "glib-2.0 libxmlb json-glib sqlite3 libjcat gcab vala-native"
 
-COMPATIBLE_HOST:libc-musl = 'null'
-
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
            file://run-ptest"
 SRC_URI[sha256sum] = "7ebe1514acb688d2649cecc392db929094da3f03cfc98a9c0faccabb084912fa"
-- 
2.25.1


