Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C83EFF885D
	for <webhook@archiver.kernel.org>; Sun, 26 Apr 2026 11:51:02 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16930.1777204255918549613
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Apr 2026 04:50:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QBkRuBf6;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso99337645e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Apr 2026 04:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777204254; x=1777809054; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UdakTJJFQtsfSjH06U0NNsbf29qdvQRstQhjkfb19iY=;
        b=QBkRuBf6dbN3xezt3tcuPlAlo+u3ruON2wh+cuXIh5iqevg6IUseMTItdzASL/LWFT
         QW9d6nJgPPf8TFcTx0A5ogKt5pEHvU1qcr9UnJnZbVtDbrbf2SpwWKKHdEXDUIM0CFja
         BmHHmuMrFaH4Tb3FrhYUo9PBpNqDbrTE4t6qLhgpr6G8amrP1c3dpKEMYzv4ofiwUpED
         Dq5EM6lSU/92TG4DwuIdgs3jYmE71t1CHjFl6E0/s9mSESdSJKbsWjd4euU2OXK57lWx
         MyyRNro4sdE0XwoA2CHOzd3tbs0IBmUrwGZDg1n+sLuKu85u+wrFa3DY4n7VFGSB2NQ4
         0e/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777204254; x=1777809054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UdakTJJFQtsfSjH06U0NNsbf29qdvQRstQhjkfb19iY=;
        b=E1HVFBneCP9vBy5fzR1krX356QHjJtTWySrFVhWWsCHY+TkOrOWPYvKAxboH5ybch2
         lyETcvCRUcI52+brkdhHRgQzHizYjCfhKuANReI9oDRPSHchOO16gSMEmiMvIm5YGM6j
         xnxue7rEgeiJvGlSb00+j0EMdyKviakE/9b5gOLFL3VvM2qx347GVy6X4U0GbAZCcQA+
         K+84fxE18sVfv4xJUSaJdCpSpGA4I/OC7fmH6TI2TCMabAQuvf/ra7V3+eNRXi16HsNT
         VMVFONY00AjrELEsavvBwqd1fKacsJoYD2OeRnMKf3L+9hclY3OCCvSzVV7NWs36TWg4
         3Jzg==
X-Gm-Message-State: AOJu0YzWBkebWNRsW+htpEhBqTKMbg0C2MNnyBtORL4+AbA1dNBJm6XN
	PuD+6nwuoTw0v0EFlTsO68R+d2Hn8cGOIMpjEwbUE+cqtDygrCfxNv6J9JClGg==
X-Gm-Gg: AeBDiesI6Lb4xuoAqhU0QdKAeNJdmJRRe1ED9IN1BVQx2FlzF9PLGpu9kL1rswOpMOm
	BUVWyPezris7GRiFtGc2OowD3B3VYsP587ATpiJphGSvWcH8DneGN1VSNxEi4BF4mgcL3nDm2Tc
	ZnZ8bwaaFQc6htSa929cp5aJCswYEnK73TT2DxsR6dkM0kmkoPYCZ1WITUFG5hyI2WHTS0mF3J4
	HP2OCnf/JvdeePUl7q2CcCcEap0YLrImXwBBC72YeefwUQebVavfje8uDbbWZuzKk9jgXyf9Uuu
	NDbFc7jD+ZJD7KRt3220FmN5R8WoHpqvX2AJCJpSq6VWApw63aA8Edr6MSEQa40YMPyUETjW0Uz
	hQimHu0D0oypd9X2WMbOY5AeZ+eO4G79YwvK3jh3n/UH4+uKZKgp6Y0GqfUYIK93TTVlUBDbQ8+
	0wT7tqCcOTAhc0op/GvcGjpt+OjuxhuzeuHB6ghajhSw==
X-Received: by 2002:a05:600c:c106:b0:489:1ba8:5be9 with SMTP id 5b1f17b1804b1-4891ba85d07mr296549865e9.29.1777204254021;
        Sun, 26 Apr 2026 04:50:54 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb75a913sm222019155e9.12.2026.04.26.04.50.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 04:50:53 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH] nodejs: mark CVE-2026-21710 patched
Date: Sun, 26 Apr 2026 13:50:52 +0200
Message-ID: <20260426115052.4006506-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Apr 2026 11:51:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126616

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-21710

The CVE is fixed in the current recipe version[1], but NVD tracks it
without verison info.

Mark it as patched in the recipe.

[1]: https://github.com/nodejs/node/blob/v22.x/doc/changelogs/CHANGELOG_V22.md

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit b483760dba76bb66bad820ea0246a38692c28c45)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_22.22.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.22.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.2.bb
index c64cc5b7c2..2b04c6df97 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.22.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.2.bb
@@ -218,6 +218,7 @@ python __anonymous () {
 
 BBCLASSEXTEND = "native"
 
+CVE_STATUS[CVE-2026-21710] = "fixed-version: fixed since v22.22.2"
 CVE_STATUS[CVE-2026-21712] = "cpe-incorrect: only v24 and v25 are affected"
 CVE_STATUS[CVE-2026-21713] = "fixed-version: fixed since v22.22.2"
 CVE_STATUS[CVE-2026-21714] = "fixed-version: fixed since v22.22.2"

