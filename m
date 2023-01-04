Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C64C4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:22:02 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.9640.1672831321746532886
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:22:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PRoacKCi;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id bs20so30502508wrb.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Jan 2023 03:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FHIHDXBHQb7kcMYTzuSTf4zVWRdzeDuXS/bl/Ylrde0=;
        b=PRoacKCiDBUUkwxjHJL9+D4IpFyaljNNNW4MTVkJcKqjB6ra8udaH9nchgxaFxMRCK
         zSZMXf46oRT2+GnWX8Z3tIiIoPEK/aFvfff43O5EKb2L8lolwuLL8SDjXzkr3r+f9znv
         Ff14wvxV1tsuOMUeUxKOwUU05+WV865DMGIydX24P8h6cdMHQ25nD6LPmhfH+xOS6Cez
         wgZ0ccJaYcbWK8QN2UvH2H1GksNrxT+VI/rl+WJgh8XSPxoZGiGbDEk7gik/x+wfMfUt
         klMEAhXD+Ll65xyAIdYWxhqzrmfmd1FgTXfstAua4GJRAlI8tI3Ktlm9kMXJ7TSpzraP
         mVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHIHDXBHQb7kcMYTzuSTf4zVWRdzeDuXS/bl/Ylrde0=;
        b=Ywb6nQqmefq7qJKSoppDNC3GCeaHISa7Ste9f1xZS2g7VDXEnuSerIQl1rl/vzVgz8
         Z5jF2nxQXg4sz5GIy2taZu+OnxlmMWlfd5wFPPnc9Imozr1Q9S3Cdo9NFMgscfq84eDY
         YNCPrJPg/x3HlwWj2QvuudipkV+0cVpDdg1cEXHBTP+OPytXs8OLg7EalUhfa5MMtpUq
         HsClIuCmjCu8y5TjR1/GiGLHNVWDVE5/je1SY3KAzrik/786OcLEM8MswDXpsvh313FM
         6mH8d1LEdGmYNVjt516WdBK4QK+rol4bo5OXHpuArmqvEaLXZHXOLo/5AG68vc77IxBO
         6EvA==
X-Gm-Message-State: AFqh2kr6Ez8epnMWZhS7D6B4g3d+wR4lRQESzjQv5NWCkNjSJnFBxUPt
	YNk3B1MwfzVNJZheXkp/1h1jnZOfgOg=
X-Google-Smtp-Source: AMrXdXta/o787RJEIVG/LTXcNMnkDEd6+a8GEqaMxA78yaIZCRujU/nOpxMdfLKus64OtCKT3/Dkog==
X-Received: by 2002:a5d:63cb:0:b0:293:b54e:4f09 with SMTP id c11-20020a5d63cb000000b00293b54e4f09mr8661542wrw.4.1672831320055;
        Wed, 04 Jan 2023 03:22:00 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id f6-20020adff446000000b002425504ae7dsm32762274wrp.80.2023.01.04.03.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:21:59 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] packagegroup-meta-python: drop python3-strict-rfc3339
Date: Wed,  4 Jan 2023 12:21:57 +0100
Message-Id: <20230104112157.2537461-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jan 2023 11:22:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100397

This has been unmaintained, not needed by anything and is now
removed from oe-core.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb       | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 4e318967d..2275ccd6c 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -414,7 +414,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-sqlparse \
     python3-sqlsoup \
     python3-stevedore \
-    python3-strict-rfc3339 \
     python3-supervisor \
     python3-sympy \
     python3-tabulate \
-- 
2.30.2


