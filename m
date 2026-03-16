Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 275D1F4645C
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 12:10:03 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49044.1773663000570682797
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 05:10:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RQqZsRnk;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4852f8ac7e9so53717185e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 05:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773662999; x=1774267799; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/n3V5el1SlEyzFPtjARgs8UNODMqEjX0rpLCP8fswWk=;
        b=RQqZsRnkDCvSGtN1s3bQSblXICNBsXOWdhNNbHS8OBEfEGITnq1gt+8bqkVwfoomBJ
         rL7MtWPVWbeep96+n0nB4cJSaOUfh6bfvMazq0XqTP26Ui3d1H5/EcZyiJsEPOjFhrwe
         wBdhskkBk4AF0sG12mWevNw5JH/j/10Lb5oGeNvrwlukWhiZs0TmitYnJfvrlYnrXB45
         riajwBK3Q6kiA+glRQa8AnYmVndtS3nHnrYz6PErvt/0skZ9AyEBzB3B2g8kG58pcOXa
         tBgcDW/yZUZKck7Qqmdl9ThPrtFSyBAad/cNzaRX25k9XlsCQkB/M59JGrqF4EQZqrWI
         FqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773662999; x=1774267799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/n3V5el1SlEyzFPtjARgs8UNODMqEjX0rpLCP8fswWk=;
        b=lT5kZuCs9eGMtrn+pRoFOxl6bKa1wVDL+dXBjczSOBknBF4giiwX48yEMuaq1pqZB8
         Gt4UiAWHZrzZcWXNJxnVkV+0tAQI8nBsjE0vbXsYwdm1GiP1ZZgtcGay4c/b+/y4bR1j
         fsLESUrcckvhtbUWahOz9ZOP8q2Ak3eEjYFDkqynsP7YSFQ9zmvW4wOWr9CHmNxvAd2C
         1/NzsSFQ6zC7gkda05lwM6M5zVtIES49DlxTFSzxsiJrlkwd6Uy1TGnC4eJFlID5eS+I
         0I9FCjwhSCzw/OOyDL7YphyP5wU53yb1iyunHrKB2MwVJVPOiFvkNp1tJWVRIfvqOKWN
         83NA==
X-Gm-Message-State: AOJu0YwyvQ+YZNRNQHZLF343frcsw5Q6bux8XHyDDNCSPB1ij1/mB2+3
	cdyNjGcV1AphcBSWVpleWdPRSMoldse0skh8Wn7qPli9j5C2D97adAH6Wj2yFQ==
X-Gm-Gg: ATEYQzydIPWKMeYTOVFeY9lvTN5BMyrWfcwz5yGtSLmAFTfaFCy9tNI8x/OnYkJMwWh
	wnOJjdlua882bQUxQQ8PKCUHvgsMBkSv7c8zoy1Rf4oXiv2Qjyb7Y/Ta5ufYJ0ri3WAfNLbBO1I
	WPo/40RtUrz8LaXgC+ix+6H3y0v7vF/cf51IL9EQSUvx02n4o175+IiFb1yq6/RdWyBELfLNSO6
	5i51xe5L4hjMndNArCWn3eDlH039rM5/7tb/ne6/daCWVsxcmF561e5OIekiWN0fRDEYqtKoxCB
	p4yhDPzIL6sa429E3A3+HTMln++V8OOaBfCXv/Id/Q8/kMCaZ/pinDDue/nlgz32kyI5satvkz3
	J5fge9LY4vst7+pR6husX069qxQ/oX53ofa5js7WkVE3ClxFL7I3UzVuvdR5qQDZVeVOwmkPWgn
	KRYoo3SQdcGNW+QzzVXSWQsexUSjMOnXA=
X-Received: by 2002:a05:600c:8b45:b0:485:35ba:1d81 with SMTP id 5b1f17b1804b1-48556703194mr204932625e9.21.1773662998502;
        Mon, 16 Mar 2026 05:09:58 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5e9179sm412033195e9.3.2026.03.16.05.09.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 05:09:58 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] postgresql: upgrade 14.21 -> 14.22
Date: Mon, 16 Mar 2026 13:09:57 +0100
Message-ID: <20260316120957.1139756-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 12:10:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125272

This is a bugfix release.

Changelog: https://www.postgresql.org/docs/release/14.22/

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../postgresql/{postgresql_14.21.bb => postgresql_14.22.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_14.21.bb => postgresql_14.22.bb} (84%)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_14.21.bb b/meta-oe/recipes-dbs/postgresql/postgresql_14.22.bb
similarity index 84%
rename from meta-oe/recipes-dbs/postgresql/postgresql_14.21.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_14.22.bb
index ba7a7bb03b..3cd18f15af 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_14.21.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_14.22.bb
@@ -11,7 +11,7 @@ SRC_URI += "\
    file://0001-postgresql-fix-ptest-failure-of-sysviews.patch \
 "
 
-SRC_URI[sha256sum] = "5b30f19347efff32b6e09ed2cdff0b04e9aee913ec9bb7414de2b7c17b17f1f9"
+SRC_URI[sha256sum] = "f57938ad30067077720277f6d7db05aafc07d1545efd2ed82f199ba828a7ad34"
 
 CVE_CHECK_IGNORE += "\
    CVE-2017-8806 \

