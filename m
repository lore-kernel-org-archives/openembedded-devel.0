Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C6D0C3DA6E
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 12:23:43 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.218938.1704025417956355452
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Dec 2023 04:23:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b2/rRw7X;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40d87ecf579so2129015e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 04:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704025416; x=1704630216; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ie47pa00TfucbbJ39Qf7bgwQnRP93h3MsuKrFnw1v5U=;
        b=b2/rRw7XF9FfTHbvjBUfP1zcvcixplJTl9z9oB+ximoH4nV/V61uwBUv0J4vRA0Y9K
         QMhXrCT51HsCHDgaI3B0MILpU5HV1OFnCabRn3CwdCbTZvqlbNDojAlymsAq+fSbD0bY
         4brxT1syMxvBHGmLELBhWWPB7G4Bj1Gq9CkU2er4SbcSaecPgD1bawvlDoH7OR1D7GhW
         7NOotPXBNKt3ueh+oGyga179NB97e5den4HLG3uAqNXc0RcggdPH/GZp3sJcuvlu34GF
         nSi/7oklVgc3q/UKiVkIcLkpqLNKzNSGFnBj4CprV5SiKiJ4uArQnjYk3BilAbEHOpdZ
         hxhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704025416; x=1704630216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ie47pa00TfucbbJ39Qf7bgwQnRP93h3MsuKrFnw1v5U=;
        b=V1ia5jiyob+0aHKOogJKPditnyDqcOT8Csc5HvW5RXf4dUWPbvlqHcG/QNm6ZhIkEo
         Nycl2k781/ac2UbS9cdBgiwvdFXXqhG/I81Y5TRR1y9Kgevo7mnaDCNV658Vg+GBVAZ+
         s0nKEUtGd50f465CjToVQsMmvgbAULCuLWj44FdX/V70+Wwvku9glbItd4MAVCB/sqCl
         J6leOwdzs1r7ns7pdxhlmVspHaYC3bwsLQ5vZwovVz8EJ5H239Fjix4N4G1ptbcTW1su
         QdAfaqNsnMcA3QA739FFvqRpJpdY9APnH/mgH58RSSbcd1fKVkoVL9CATOwztB6glF8Y
         BnqA==
X-Gm-Message-State: AOJu0YxxI1Up45lobnhNqwNz2I3lvtCfaWc23LEvFG4/q7UVpBq7PG/Q
	2w4koETq+D6VpfaLymrsn28NOT9GLfY=
X-Google-Smtp-Source: AGHT+IEGPnjTzmrKpy5PM3f7WW6fH9zHZ6vKubRl8agOCp5fw3648ExCDSX24ViXO9asb2CEPOGgqA==
X-Received: by 2002:a05:600c:3844:b0:40d:86e7:f77e with SMTP id s4-20020a05600c384400b0040d86e7f77emr253991wmr.72.1704025416179;
        Sun, 31 Dec 2023 04:23:36 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ay23-20020a170907901700b00a26aea4942dsm9155474ejc.123.2023.12.31.04.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 04:23:35 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/23] fontforge: add a readline PACKAGECONFIG
Date: Sun, 31 Dec 2023 13:23:07 +0100
Message-Id: <20231231122329.405225-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 12:23:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107952

This helps with build determinism; also if readline is not in sysroot
but readline-native is, fontforge erroneously decides to build with it.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
index 404e86b86..31dd495fd 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
@@ -24,6 +24,8 @@ SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https \
 S = "${WORKDIR}/git"
 
 EXTRA_OECMAKE = "-DENABLE_DOCS=OFF"
+PACKAGECONFIG = "readline"
+PACKAGECONFIG[readline] = "-DENABLE_READLINE=ON,-DENABLE_READLINE=OFF,readline"
 
 CFLAGS += "-fno-strict-aliasing"
 LDFLAGS += "-lpython${PYTHON_BASEVERSION}${PYTHON_ABI}"
-- 
2.39.2


