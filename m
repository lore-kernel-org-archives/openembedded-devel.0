Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0061C433EF
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 20:36:37 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web09.768.1652992591300211481
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 13:36:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YpCf0HFJ;
 spf=pass (domain: gmail.com, ip: 209.85.215.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id a38so3167807pgl.9
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 13:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SbuYjvoehXvLYW9N1o5kiT4wioHLdfIag21Sv2hre+s=;
        b=YpCf0HFJrPRiGOmJVfij8uiKVU5xAWxpDmZIkzMUZmR5PG00x0osQ4V5+KnewxrK4x
         WchsuKMIIeq9L29YhGdBG1mrbZowmkDsX+D/2cIoDtof1mwNTNr3RDJQjUSNORCtj6n1
         a259inHxDQNhIk5IxMkZ6SSuky7SttwDHvZkAMhehUSeFUHsJqYtG/84fP0T2JgnJ5jU
         YOcc6TpOEfhrBJ19rA6FOshwRLaVHaB4d/8rlvu/TYpoe0mD8t6TCVnTD0WY9jbxdDm9
         rUYywnWV8BEHg6N9hMYyuvQpY4qmz8DLiOwI1gjRtJrCdUeACRZR87Tyep7z7BZCnYBe
         2SgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SbuYjvoehXvLYW9N1o5kiT4wioHLdfIag21Sv2hre+s=;
        b=wkOTRs1RljSgJZ9E0Ghl82UxCNX4CDRGjUSdtIzIvHKKdYCCeG2PD5dzt1qiNsEk/S
         PlYjGzbo6hsyfRBjLLaS9EsMhM8SCm2/RT6m3CvJpyBPuuQ2O42CQrucp6IXXQwboXIE
         ihBuai3b24KXmI60uPjSs0D1gIb/ZV/wddnvBSW7QUiGJT/F34405JV29meKoauKJI4+
         UhfbogEuhUOl8GVTHPB1CLYrnOb9f0d9XG5sSyY36BKcAFdkr7DIjwV1dueKV9JRy1uz
         vE5c0bxWk2pSrf0JYI42PYkYfCDXXF9Uvw0Z9OMtcM8OFN8wItKCg3unnliIMll/+K3a
         VVgQ==
X-Gm-Message-State: AOAM530OgM9H6Ittr+sp5L2PL3EgKsxWnv/WEp/9wJCSsCxY6LakSIZP
	Xgy0UNhIDbka0RW+vfg+XttzDfHZeUaL6g==
X-Google-Smtp-Source: 
 ABdhPJzQ0xIGZufKXbkZBiiVHJbkpcsl6CqmSV+zQKgmETuNCGG+dkvCdzu20dtMA5rDHPWHfiBLxw==
X-Received: by 2002:a63:2c15:0:b0:3f6:6a5f:8f0a with SMTP id
 s21-20020a632c15000000b003f66a5f8f0amr1083666pgs.76.1652992590447;
        Thu, 19 May 2022 13:36:30 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 v20-20020a1709028d9400b00161a9df4de8sm4147377plo.145.2022.05.19.13.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 13:36:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] sdbus-c++: Link with libatomic on mips/ppc32
Date: Thu, 19 May 2022 13:36:28 -0700
Message-Id: <20220519203628.1772787-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 May 2022 20:36:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97205

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Gianfranco Costamagna <locutusofborg@debian.org>
---
 meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.1.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.1.0.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.1.0.bb
index 3904ae5fcc..03d1356042 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.1.0.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.1.0.bb
@@ -28,6 +28,11 @@ EXTRA_OECMAKE = "-DBUILD_CODE_GEN=OFF \
 
 S = "${WORKDIR}/git"
 
+# Link libatomic on architectures without 64bit atomics fixes
+# libsdbus-c++.so.1.1.0: undefined reference to `__atomic_load_8'
+LDFLAGS:append:mips = " -Wl,--no-as-needed -latomic -Wl,--as-needed"
+LDFLAGS:append:powerpc = " -Wl,--no-as-needed -latomic -Wl,--as-needed"
+
 do_install:append() {
     if ! ${@bb.utils.contains('PTEST_ENABLED', '1', 'true', 'false', d)}; then
         rm -rf ${D}${sysconfdir}/dbus-1
-- 
2.36.1


