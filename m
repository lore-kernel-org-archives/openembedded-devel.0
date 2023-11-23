Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A44E6C61D85
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 04:21:54 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.84595.1700713306918421745
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Nov 2023 20:21:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dYg9px0w;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6c33ab26dddso443993b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 20:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700713306; x=1701318106; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s4auh5UlVZTEMASMX011K23AhH8P9rHjPq5gOf9SaIA=;
        b=dYg9px0w6S0DBSIhSPt/GtOabWz6Pt80GWCBXx5Oas7dz0TR1mnGO+Iq5oqadVF2wP
         IjvC0OV5BY5rxl9bL1TJgMMIbeNZdXCbRDHIEbeEUT3Ztn5LD3+oK87YJOK8XLV8UMVK
         ZvU2y/wLkqURuf2KJD+yc2izYaZqguDWWm3bUaajI68SSQuhBeJOIEAhTouvCDFslsmm
         jiE8t0et+LsH6IxC4hrYNqvVd71MzOxcM4mwwBAkAK+BrIcxqZfdmlHITantscovN35s
         UvUyfAij78mLXEPgAgxLJNGW6HVSU34GsUOIEi8lfyuQTkpgiUAvI3WWSf+JQcwE8H7g
         QYyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700713306; x=1701318106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s4auh5UlVZTEMASMX011K23AhH8P9rHjPq5gOf9SaIA=;
        b=MxJ1Y2Izx3op80aqBZBsnuWvZscgFs083gisIT78+njSbO1ZFH+rzjInvnV+XnxRX1
         Bvv1tsXhA7j8mTvtUTY8Gq+KaI/MjxxgLFz8QlGolswGfnZnAQhM3H9l85PgIN6CJtdi
         BPhRKDLNlgGBgezXIpe24fKGOlm1iiT/f94K170XQqcjwkf91QfjLrEjIaO+R1aycHUP
         qDzPKEnEZ9txmUtenkinXEU+U9wouQWB+wKnkWUTwDQgJy6AZLTWHhnBdLEl4MMFAzB+
         Q2sRC9AZ6/P8Fy9DV87bhEctk1SqbZt7TjFMgZUTJ+ULm/EDtXWofJ9rIsmRRRdIXghb
         JyVQ==
X-Gm-Message-State: AOJu0YzPbZBQXrAhQuKP+7Lerv+QPUrqVIQtFx3ISQSUdRGKqpvkeusJ
	pmFKGhESlxVFrFjYGkBF29IyMhJu5mqoHQ==
X-Google-Smtp-Source: AGHT+IHBcxsZMp/wpeJ1Xx4yr/sDo3oI/scPKPLZL2WTuauFTOiVV1BXIlR9Wo/yyFYSYIl46uIE1Q==
X-Received: by 2002:a05:6a20:72a5:b0:187:8bd4:e1ba with SMTP id o37-20020a056a2072a500b001878bd4e1bamr4961701pzk.37.1700713305824;
        Wed, 22 Nov 2023 20:21:45 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0::b328])
        by smtp.gmail.com with ESMTPSA id c10-20020a170902c1ca00b001cf570b10dasm244743plc.65.2023.11.22.20.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 20:21:45 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-java][PATCH v2] commons-collections3: update SRC_URI
Date: Wed, 22 Nov 2023 20:20:57 -0800
Message-Id: <20231123042056.947943-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Nov 2023 04:21:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107019

Older tarballs have been moved to archive:
https://archive.apache.org/dist/commons/collections/source/

Also drop obsolete SRC_URI[md5sum]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Changes in v2:
  Fix parse error by adding closing " to SRC_URI

 recipes-core/jakarta-commons/commons-collections3_3.2.2.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-core/jakarta-commons/commons-collections3_3.2.2.bb b/recipes-core/jakarta-commons/commons-collections3_3.2.2.bb
index 0a53d09..0539403 100644
--- a/recipes-core/jakarta-commons/commons-collections3_3.2.2.bb
+++ b/recipes-core/jakarta-commons/commons-collections3_3.2.2.bb
@@ -5,10 +5,9 @@ PR = "${INC_PR}.1"
 
 DESCRIPTION = "A set of abstract data type interfaces and implementations that offer a wealth of useful functionality and a solid foundation for extending that functionality"
 
-SRC_URI = "http://www.apache.org/dist/commons/collections/source/commons-collections-${PV}-src.tar.gz"
+SRC_URI = "https://archive.apache.org/dist/commons/collections/source/commons-collections-${PV}-src.tar.gz"
 
 S = "${WORKDIR}/commons-collections-${PV}-src"
 
 
-SRC_URI[md5sum] = "776b51a51312c1854ad8f6d344a47cda"
 SRC_URI[sha256sum] = "070d94fe77969d8949bd129a618e6a7bee6b83b5b5db3ef3f983395a5428b914"
-- 
2.34.1


