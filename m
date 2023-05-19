Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD63C77B7A
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 07:01:37 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.20147.1684479695708985330
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 May 2023 00:01:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ISznEW2d;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1ae4c5e1388so29835195ad.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 May 2023 00:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684479695; x=1687071695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VGJ5wsqgm/QE2jGGqpXrNm1Dt4wQA4C123cJpDXX+mQ=;
        b=ISznEW2do35SKCc3dyLW5eeTkotAW94JS850DeEnJqEPPsvFMTxKZvBY/Ee8bqCcOH
         NQyW0ntCGAHE/c2sq41NNPMKYiMiKEIZLR76SzhDYWt5Luskyw/FND581UDOVT8pRqY8
         YqDduK1b9YVfnTTiWzTr1V98GlHCkduPqKERsXqoTm/0pgmhAwTh+t3iz0PtxkFCx/7E
         peEX+zICTrT2QOog1nRE8CAMWJm3iIrKMZi3ir8MXAnLebizdYMstQx09Qus0hgzbqGy
         PrJAxihx4y4offBNSTXiVE+UyVX8V0pVNU/Oi1l3VMfI3v/dCHVJwt6uEeKz0XdMWVnh
         MZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684479695; x=1687071695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VGJ5wsqgm/QE2jGGqpXrNm1Dt4wQA4C123cJpDXX+mQ=;
        b=esKeixbKibKtd+4jk26OX5Ju347Q/OX3u82cj/P+g+BAts11DOhPGuQLbebZNthSrR
         8OJqB3aERityr5H6uuMVukipESdCxrOEHrxqniny68gSQLrhwHWYsYRtadit6UWayoE+
         2ked7pV+5mKAk0I3Spx0jrCjx/8d3ghiF662t/nfV9nRvkjJ+l6dwf6819MAgtO2Nipr
         JuVKN6sZ6R8HN3y8v7y+DKPM4bzCxKCSEtMP2ePepxHqQqkfgIiOI3037ZHG+GBdYP4j
         7Hkq+gNMzhzY5R9qyRXODD1OaziHFjl/iBBK224znOTkQENFtZAqOq81H93SKcYn3i++
         p1Aw==
X-Gm-Message-State: AC+VfDzTYy+UvvertRlpARa7z1tdvkOF4XVKvUHamRGYhKJHfwMJBu8W
	nfswCZQK11hjA4XhS0Ft3mEZb82kDBY=
X-Google-Smtp-Source: ACHHUZ6psk0O55N6FPhsUfoC5qnBd422j6gbKrIUYAgZ+ExMYj3OppclE25/VJRLZQi9+BffDuVp3Q==
X-Received: by 2002:a17:902:7683:b0:1ac:637d:5888 with SMTP id m3-20020a170902768300b001ac637d5888mr1686431pll.43.1684479694614;
        Fri, 19 May 2023 00:01:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id j6-20020a170902c08600b001ae365072cfsm2602234pld.219.2023.05.19.00.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 00:01:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] lirc: Define SH_PATH=/bin/sh
Date: Fri, 19 May 2023 00:01:32 -0700
Message-Id: <20230519070132.1032337-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 May 2023 07:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102671

It points to sh provided by HOSTTOOLS in the build systems path

Fixes
WARNING: lirc-0.10.2-r0 do_package_qa: QA Issue: File /usr/include/lirc/config.h in package lirc-dev contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb
index fcb347a2e5..3d474305d7 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb
@@ -40,7 +40,7 @@ PACKAGECONFIG ?= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ' systemd', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', ' x11', '', d)} \
 "
-CACHED_CONFIGUREVARS = "HAVE_WORKING_POLL=yes"
+CACHED_CONFIGUREVARS = "HAVE_WORKING_POLL=yes SH_PATH=/bin/sh"
 
 #EXTRA_OEMAKE = 'SUBDIRS="lib daemons tools"'
 
-- 
2.40.1


