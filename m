Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E05AC7EE23
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 01:10:46 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.3013.1684717837570065672
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 May 2023 18:10:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=mk/PQSsm;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-64d2981e3abso2680253b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 21 May 2023 18:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684717837; x=1687309837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pSQ9BXd44dUi8zw3WU8LuXHQjDWzRmadtS48QkraANM=;
        b=mk/PQSsm75dhAcQqpWfLQhbze4tM1IRxYBM3BQhPkLhxEVfFbGANKqrVd/MtwEseIE
         NWTmAyM6Pv5mc5qBq4P56ZoJ0vj8kU4GulVPZQ/y1j6V2i4iHPf468kcCAjkLWLR7xFU
         tVO+HIqMjkKIpvVxhTx3Q9X/jvHHH4UnZP5elhoQofQ8ftqMGePhfEhWpYWBnAM9KDd1
         fzNiGsvjo/8Xak0l+xdsBWHPKWq5+kNQY5mzmzxlyzQorg5OXXG2NmSyhDkGxAMi9mOr
         2gnRf5CQVbAE3QUUhDGxUhzSmo61o5MZd4+sgyE421yBZtyKUKUug9RjH5xcrlKWrc1S
         uiow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684717837; x=1687309837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pSQ9BXd44dUi8zw3WU8LuXHQjDWzRmadtS48QkraANM=;
        b=ISQIaiko4+8yVp+/dybGja5Ew1RqIFyXapFCDuIxGnuphv0xNcWMLK3pDGlZ2mkpqh
         W1TcC4G+8Rjf0WRQleijVHX+Ag3UeMHvTgGmgPN5wYehBXR5Wij9YrI/nzANSbHxMR2S
         Gy9hk9Pr1VsmEEC3kr8l0hEgMo+uVa1t+Re9nMgr3iI7TLrJvRDDFtpv/f8lSS5cVubZ
         BUwkMvAxdebvj5uNhHUFS0APWKa91CUZV3CG75WKBkZva+SLwEkfItKfNs3P0c+1DCdy
         /sHt/q8+6lnko3HATPCyPGdDFNEC998UJ4DUypKGaPfqZOzFmOqMeLn8hVzT/6ThoXfs
         dHfQ==
X-Gm-Message-State: AC+VfDzROMb+hRFyeDwZ0LkR+l2ElaCu8P2kMwVAX6KtKdfrWTGwMA3g
	c80CjedFwRLHKroYbzwiTDr6Y+FGCFg=
X-Google-Smtp-Source: ACHHUZ6y5gRdN0lZ0hVGv5NzG6PwuIKEPIiu8pjJ/G4BOuyBNWo2rMrlrHLQpUlqRGngsHk3aSUsjA==
X-Received: by 2002:a17:90b:1d01:b0:24e:109a:94e with SMTP id on1-20020a17090b1d0100b0024e109a094emr9268013pjb.7.1684717836576;
        Sun, 21 May 2023 18:10:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id v23-20020a17090ae99700b002532d74fb59sm3037349pjy.22.2023.05.21.18.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 18:10:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/3] xrdb: Pass target CPP location to configure
Date: Sun, 21 May 2023 18:10:32 -0700
Message-Id: <20230522011034.1311197-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 01:10:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102692

CPP is encoded into xrdb binary and it ends up encoding the cpp from
HOSTTOOLS location which obviously wont be where cpp will live at
runtime

Fixes
WARNING: xrdb-1.2.1-r0 do_package_qa: QA Issue: File /usr/bin/xrdb in package xrdb contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/xorg-app/xrdb_1.2.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/xorg-app/xrdb_1.2.1.bb b/meta-oe/recipes-graphics/xorg-app/xrdb_1.2.1.bb
index a8c5b3d0a4..20fdea1a54 100644
--- a/meta-oe/recipes-graphics/xorg-app/xrdb_1.2.1.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xrdb_1.2.1.bb
@@ -6,3 +6,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d1167c4f586bd41f0c62166db4384a69"
 DEPENDS += "libxmu"
 
 SRC_URI[sha256sum] = "4f5d031c214ffb88a42ae7528492abde1178f5146351ceb3c05f3b8d5abee8b4"
+
+EXTRA_OECONF += "--with-cpp=${bindir}/cpp"
-- 
2.40.1


