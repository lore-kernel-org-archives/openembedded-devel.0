Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA8FC6FA82
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:34:44 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web09.11278.1662276874164431717
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KfYLTgWa;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id o4so5718242pjp.4
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=tq6owdDsb8m2Yh/GJAS2twbHdnvRwefRBaWeCAV8QMQ=;
        b=KfYLTgWaumI7LWJjYcFVtYJf64J53X1jF2ByxO5R0CUAA9zc7QO52HFRxIOB+TD23k
         8dWgycwYMKzIaHx+5nspVgD0trQN1r9tI+oix7QyWhAU6EVpXx7cZgRHw0/N1voeR6Oo
         eocdqDNSgRfk28HflL9p3SPW/r/M91xZZ6izwGwuqgDBAyy9LZaj6QgPkH1wviq4AuVs
         qyK7PjIclEtR7aXGnH2TfkcPXX2mdSfIDzhEjXJwIKUj/GdEVzS/cBa0k6DjF9mbI1/v
         xaprt+vbt7bhhjIA69qxEI9U98G61KXMz0nQa7YeK+2ch4KD+y4BCHHLeqrzwPXxUriP
         jJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=tq6owdDsb8m2Yh/GJAS2twbHdnvRwefRBaWeCAV8QMQ=;
        b=iLANOcV5t3qPdChbouO6g3sUj+fREHih/QtJk6NW5/fpiF3RWssR4v7osHXPTxoeLv
         bARqqSVjGdZTfAHOToUkeqy8kVam+des30CH2uEbXBlxszVAlrEi9ywjc+WEx6uvvCpt
         6BLDBY1xxHlMD40/t9MyoZQ3lCjpa+tgTCFf5C8IJtRZtCxmVVi9WiITyU+3N72M0DHX
         ykw+bcMaInHkIber/M3nDa7kWi0EhXtegrktUfkcbLAUUFW5YHq7InoFR9J9W977kKnF
         sK0lybVxZaO0nMAStot0Dcp91uFd9JdbRwegxnp+uQlek2AL9F6wAfr1VK7t2SxC3wT8
         irnQ==
X-Gm-Message-State: ACgBeo3Qqh06rn4nYcE893TuD+fU9cePimFPsyLz9baqVb/czEMLADdb
	aNjXrn1dPfz/jlBLDRBjNOo0BVf1slDWIw==
X-Google-Smtp-Source: 
 AA6agR6zaHXjDVjiwVku++BE9J4flSRh72wZXKOducD0y1FidCx0Acrpib/qexBxAUGa25GdIIXVeg==
X-Received: by 2002:a17:90b:2496:b0:1ef:a94:7048 with SMTP id
 nt22-20020a17090b249600b001ef0a947048mr13453061pjb.244.1662276873223;
        Sun, 04 Sep 2022 00:34:33 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:34:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 12/63] xf86-video-nouveau: Do not treat
 implicit-function-declaration as error
Date: Sun,  4 Sep 2022 00:33:26 -0700
Message-Id: <20220904073417.3251865-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:34:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98606

clang 15 treats it as error by default.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.17.bb   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.17.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.17.bb
index d471610bab..fbf6406caf 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.17.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.17.bb
@@ -15,5 +15,7 @@ REQUIRED_DISTRO_FEATURES += "opengl"
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
+CFLAGS += "-Wno-error=implicit-function-declaration"
+
 SRC_URI += "file://0001-nouveau-fixup-driver-for-new-X-server-ABI.patch"
 SRC_URI[sha256sum] = "499322e27a55c8183166bf2dd1e47d085eb834143e0d7036baba8427b90c156b"
-- 
2.37.3


