Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C235C0218F
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 15:36:42 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.21994.1738337794630921349
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jan 2025 07:36:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N1j7rWNK;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4361815b96cso14980925e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 07:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738337793; x=1738942593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4hDgYKMoGYYBtPk1TaKCIxLGMICQ2NTcHauFGA5rMAE=;
        b=N1j7rWNKgJHu1NpRjwYnPLBgHBMmk48dqYCFdMtJtG4QH4bPXuwW2+/esauoEag5rX
         1x4UtSm6RNOIk1W3TJYFuG+dTzjBxcUeDpTOJJyn80dzujziQOQYN1y7DGvczRO27ojS
         Fs2TLeFxdzX5XtVjAC+za5tNdGfT2ngdk0XKgWMnxIJ72t/xvNrW3VOBEtZCYsYO76T2
         gFQkpaQJ/OSeMFfSUPlVM8/U7WR+CVlGoWCMXMKPENyT23X3EdYqkh/arfx/yH5OUkKQ
         Y1m0PqG3Hyz0Tw8sV3QwXmuqDywaoG8JgaWRb4C+Fk6+9CAca/b+eZbcmcev0iVrCzIW
         +txA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738337793; x=1738942593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4hDgYKMoGYYBtPk1TaKCIxLGMICQ2NTcHauFGA5rMAE=;
        b=ttx1mWaGPVi0n9MKsPRllWY3r44iydGTjFCP0MmY5COdRXQHIn5Gyu1dK6lp/0owh6
         LNliLQSTxl0cqdl7sd1hGz2wDZdm2cbC3osOhT4smKJwVVyZ3HbsJbGne3NZmD92nbeR
         tpt4rSqgzmTBUNk92J7ygG0VFer0BESeW7PnQjm0A186zV5cdahKaEqdcEYXeuXQwL9E
         Pjm/C79Ymu3TVTAMeUAezpUM1xt0xE7peUHR9+5PZoNmcRQeYKDMl8OUykfqVLBJPgx5
         0hdeV9Cj/hfM1Y6TuomYIkmnynrszynNV9+BXTcHEnAGbS9lq0mPz3eZ+Ml3d7EMPB0u
         K7nA==
X-Gm-Message-State: AOJu0Yz1cynk8eiVlJcXzeGsghJOXUROi+ztHuEVIJ7t1srPz0SPmC1O
	41IVEJDUreeV210NHL9KLoEFYvW8lc/OnRC1tzlRrUXwq2r41rsXMsOD6bEz
X-Gm-Gg: ASbGncscW58DFhSpF79LHkIA6Z0RXSjFDgOaGlrEB2i67/UgY8FuJ+qXV87imHwM7qK
	2cfjvzJrPkekDlVNvplrmj58a2tol8Qk2GpNQcledjITLQp/RjFgBSZogu+km7Sssv0F9p7kgYF
	PQ92soPNnHHU83ManIu9K5Ap8/8vqwSOOxjFycJP0AHEAC1t0hactsAIADz3LyxcJ1zB5c4CA2K
	ar5iqoyK47agg6DuP12GDK/X5yr/WQQ0k6umSitZVaU22tS//pYti6czo2OgZQaqoQuBocG9JiM
	ZxZFykRRdt3G1Y4ZlUTZVUb98G42Kx8=
X-Google-Smtp-Source: AGHT+IG7v70q34F51ZGvdKTTlebuX86+IZO5CLHtg9wb76Iif1v8BJao0uNzEywqzn1/stfI9u5w0Q==
X-Received: by 2002:a05:600c:3494:b0:434:a315:19c with SMTP id 5b1f17b1804b1-438dc3a85b3mr100179785e9.3.1738337792798;
        Fri, 31 Jan 2025 07:36:32 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cf571sm4849646f8f.82.2025.01.31.07.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 07:36:32 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [meta-multimedia][PATCH] libdvbcsa: set correct LICENSE
Date: Fri, 31 Jan 2025 16:36:31 +0100
Message-ID: <20250131153631.313990-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 15:36:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115200

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb b/meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb
index 1e5381bb2..bfa6de90d 100644
--- a/meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb
+++ b/meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Open implementation of the DVB Common Scrambling Algorithm, encrypt and decrypt "
 SECTION = "libs/multimedia"
-LICENSE = "LGPL-2.1-or-later"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRCREV = "bc6c0b164a87ce05e9925785cc6fb3f54c02b026"

