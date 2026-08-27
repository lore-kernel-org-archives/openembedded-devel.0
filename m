Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F653C61DCB
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 02:53:54 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28014.1787799231571358737
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 19:53:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sH3/mB7K;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc1c9879395so1246056a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 19:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787799231; x=1788404031; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tp/3zJ8nw8VXKpRbfFYkNVRsOAlyf+Xpakjv4XV/PEM=;
        b=sH3/mB7KwOeJqy8ExGllo1UWBXahP8862oHX1hYjVzDmxzVu1pDX3Qhbln8zXALWaV
         kSLgikqgECNjYLPujh1z5O5MnBBKxMEpqQwlUSJB4N8u3aMAt3tlMXFY9z2gEQNICeJP
         S40MYGiU5WNlR3WqtJqVouYeUgbYBhSc/I/YQW8B0aoQ+T6JjrI8TonmbreKXXlpgMtx
         4lWuyL5oDFcX7wIPA9XCUBlCOiLmwiweJF3GJtISwXSm2XomY4ShfhQrf8TN7i1LoJY7
         nnH6y6YrtJ2tvqJLwp9AN9oBX7c6nVZGLjRgFJAZXiIli8v5NtIqWPCz9koGdTDro3Q1
         k1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787799231; x=1788404031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tp/3zJ8nw8VXKpRbfFYkNVRsOAlyf+Xpakjv4XV/PEM=;
        b=YajsO7wNvJK1T4tQXyHonEJLTuXaIN9cvxI9Frv+YnIZSrskejJ/akb5eZ9eadOc6i
         xfsrR3Rj00/peZZo7iDC3g1wljYgV9pvFUBSPwtSIhHkAaigoFNEgd3pqPVh1pznmtud
         roZahXpdxRhlxmZxVWDJcmFB4VkRhkr8SW4VE4JX1Sk6P9PH+KWDRS2OH7a7Vxum1NkY
         S9Bg9rE57tJ251DrFlkiupsigyh06li4GRte4FVL+UE/TSmJFbAIAT6HGUQQ58oK50kS
         7WOhFvtmYLOC37Z9Bz58QZr0CWxvoFQjM+m0mTYeErluP4GbboEpRawWngpXxTO72sh6
         Jgfg==
X-Gm-Message-State: AFuF++lEDOqTRx3SgfhM1X78z4RpWdbU5ZkrhAf21GsU8//F6LugY7Jo
	sLrrjgKBxluB+0eF8gr682Jf4vVDpv1IoeNEs9dd2Rhq8DIenuBCUAYT20fwpw==
X-Gm-Gg: AR+sD12VaJrgQYuq3k0rnp58ehozkFijBWRMhsDGrbVV1AxRzsT2qUOhHAHvpUfMCtI
	Mm53iiZ+9eTCB5fwC2BhinfLoK7SQ3G7j7iFmVfgONj4s1Tz3SZtaNcGfgqMI7kE4E5iLZaPXMe
	sRuNqpSBuWRodVu2awoxsoy7CVo7R8+J2Az6NbFxw4Pg6wRerwWDEKosm2rxoVOzNsG5JhrP8dT
	4h32YqWN0DJ3CF0BgeukE631ewGMvRMq7nO/vy43yNo9j9EdDsmmWFU+Egj5OkWqWQvjTdkICbc
	5WvtqFjqFWPSG2gTsJy7Hs2uQxHyUfXSIMNHH0Sr8pRZj8nOpMVUuyBWTfmOq0tCs58gduXPOqI
	PPkibKKCZ9HDaf+oMwO++XhSZSunL+5tEwTINoF9Hlgtz5b/5K+1P5SGkX4ZRUjQr+KEsCeMVYU
	hIFyDOsHwwzj6UEPs4UXSr22mQWLykqtEu7bnvApfPiQB6/5E2BBdQ8qHT+E9w4WfwCgemspSrL
	EASUVS6X8I=
X-Received: by 2002:a05:6a00:21c8:b0:846:8b22:4933 with SMTP id d2e1a72fcca58-85375fa1548mr16136207b3a.17.1787799230960;
        Wed, 26 Aug 2026 19:53:50 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8556db7ab0esm5787b3a.48.2026.08.26.19.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 19:53:50 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 8/11] proftpd: upgrade 1.3.9c -> 1.3.9d
Date: Thu, 27 Aug 2026 14:53:20 +1200
Message-ID: <20260827025323.1433982-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827025323.1433982-1-ankur.tyagi85@gmail.com>
References: <20260827025323.1433982-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2026 02:53:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129528

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/proftpd/proftpd/blob/v1.3.9d/NEWS

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../proftpd/{proftpd_1.3.9c.bb => proftpd_1.3.9d.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.9c.bb => proftpd_1.3.9d.bb} (99%)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9c.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9d.bb
similarity index 99%
rename from meta-networking/recipes-daemons/proftpd/proftpd_1.3.9c.bb
rename to meta-networking/recipes-daemons/proftpd/proftpd_1.3.9d.bb
index 95c9f3919c..8172ba3018 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9c.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9d.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.proftpd.org"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb0d1484d11915fa88a6a7702f1dc184"
 
-SRCREV = "78a1bea439969913d7002bfb16ee7f0f60e262b4"
+SRCREV = "f59f248e26bdfa514443e42bf72a145641df635d"
 BRANCH = "1.3.9"
 
 SRC_URI = "git://github.com/proftpd/proftpd.git;branch=${BRANCH};protocol=https;tag=v${PV} \

