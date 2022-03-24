Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9998C433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 19:50:00 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web09.15716.1648151399711244473
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 12:49:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=DjgnB9/r;
 spf=pass (domain: konsulko.com, ip: 209.85.160.172,
 mailfrom: scott.murray@konsulko.com)
Received: by mail-qt1-f172.google.com with SMTP id t7so4817826qta.10
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 12:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QiSENU44x/pyE84oUT+iU00m5jhtPCzkyANZaniwpKE=;
        b=DjgnB9/rrF6oGzcLZT55tBAo0CKugJDK8RUVKN//qqHprZYqO7H0NI3pot8hiZo8sX
         07hKschTAWczz2v/bIsdyIJF+fjd+BPy1bNU8GRMP458TRn3L/TisuPFaAAatwr29Tpi
         p2Kior+M9OZkSiQXVE6gB3lC4wZ1u5NtbUMrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QiSENU44x/pyE84oUT+iU00m5jhtPCzkyANZaniwpKE=;
        b=Twd0w8uiCkXD350h7vIXL493bTR9I6BfrEp3hV3UXTnaPlloT4M/Vksmdtd/JbbT7c
         SrvsY6wCa+HSoMjzy7oJMnDd8hl23cYRFxjAUpa1VrN6q/cZ3KmlULibPAtrOWCi5rHd
         9TDjG+ePKwBCxdZrK2VseHuyYnK6aJBmUwhQTqsLvfpc6DEn/jVUhAvie27nuw4suHcr
         pvbWPo9RblWUtBM83STETpO0gC3S/QBROMpz9gAIU/7n+gcdASFkqXYTjTVKWxRJz4vT
         Jho/uWUDw/vRBqlxW6W2iHCy89btUbSEpcqmvfS5awsZg1AFiQBHnD6FmERpo+TCum+x
         UXYg==
X-Gm-Message-State: AOAM5304M2fShi2Vto0DtU3gdiUAXiA6tvwAYED8Dz6zDQtvtHMHcmX9
	VMNXXROyVIb8Y1oXhKCLGoBeTsE1HDe/RQ==
X-Google-Smtp-Source: 
 ABdhPJys380z2ZIYxq8VhdXDyEjgvQwyHQ42v4NleRe9hvOPrGVlCudAxa7SyKF/5WGcw9FB/05dqA==
X-Received: by 2002:ac8:5bc7:0:b0:2e1:ecde:e1e6 with SMTP id
 b7-20020ac85bc7000000b002e1ecdee1e6mr6089151qtb.529.1648151398413;
        Thu, 24 Mar 2022 12:49:58 -0700 (PDT)
Received: from ghidorah.spiteful.org (192-0-174-222.cpe.teksavvy.com.
 [192.0.174.222])
        by smtp.gmail.com with ESMTPSA id
 a9-20020ac85b89000000b002e2072c9dedsm3203874qta.67.2022.03.24.12.49.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Mar 2022 12:49:57 -0700 (PDT)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] polkit: Fix build with libtool 2.4.7
Date: Thu, 24 Mar 2022 15:49:49 -0400
Message-Id: <20220324194949.1769445-1-scott.murray@konsulko.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Mar 2022 19:50:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96203

Delete old m4 macros, so autoreconf can repopulate it.

Fixes

libtool: Version mismatch error.  This is libtool 2.4.7, but the
libtool: definition of this LT_INIT comes from libtool 2.4.6.
libtool: You should recreate aclocal.m4 with macros from libtool 2.4.7
libtool: and run autoconf again.

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
---
 meta-oe/recipes-extended/polkit/polkit_0.119.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-extended/polkit/polkit_0.119.bb b/meta-oe/recipes-extended/polkit/polkit_0.119.bb
index b5f77700c..8a326a981 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.119.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_0.119.bb
@@ -35,6 +35,10 @@ EXTRA_OECONF = "--with-os-type=moblin \
                 --disable-libelogind \
                "
 
+do_configure:prepend () {
+    rm -f ${S}/buildutil/lt*.m4 ${S}/buildutil/libtool.m4
+}
+
 do_compile:prepend () {
     export GIR_EXTRA_LIBS_PATH="${B}/src/polkit/.libs"
 }
-- 
2.35.1


