Return-Path: <frederikbraendstrup@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2B2DCD37AC
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 10:37:59 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46987.1778495871622742216
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 May 2026 03:37:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=phAINy2Z;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: frederikbraendstrup@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bcd0111ea98so183632366b.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2026 03:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778495870; x=1779100670; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m1V2rIl0kp6gGilitE9RsY1MD/asxJWSq1eVaPmIIy0=;
        b=phAINy2Z1pgit2GMRBFpOFYqrAJJGQvyGH6zgcj4xsoNKqnLqynZrw+OoyljmbnhEP
         NHF3v25lQJQkYj7BAwOXZmKSw5lPTlFr+n3avsX8WAObEXQt/qWmVo8O787ibLawewJG
         iKtpUNCC4Z0ENxTPMhgWaKf0w3edGSghCktv3JFDaQFhT3FfokxfEQYLzjevPXiafTKg
         TGX9lfmSWdIQuej4R1i7MV4GkrNfDgY7YXiLG5DHNULxSuIe9/uurTxLAG/Xsga0NHED
         b7uOmeaOdRh/WpSLKPkZI1yX23wgbwjxNUzKLd7mTgw9B9xdRpIU16DjfBM3sxfQwGIQ
         6qlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778495870; x=1779100670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m1V2rIl0kp6gGilitE9RsY1MD/asxJWSq1eVaPmIIy0=;
        b=e59vL/aprUJPZXzeFnohvwYPWj9FZ/ONVsJ//XOL4iF2aO8XRNp1geKYfot0taEgi2
         cwWqXDVTttsZGQTzJdeghgF2NxbNmo6Zpd+3IjDwPCdo8yxwDXOB43iqz/u2cxFpvfZs
         0hBzPhzx1h8g66T0FnehfcbMtWRB1/EHpShq5869SzvomU9nJaV6veEwZt+Js/pyptI3
         4csOuZ6Hp3eCcDJbnYn11FnPUfdMpO65uFnpqeXbs640kn8yco6EuqCrpONc9BxeKJPt
         hlmiKD2gv3wsDxd8311HtFDvr6x71xv0EE3vwWe5VoNlwVih9hKejo2AuEB8ctjtfLja
         E6pg==
X-Gm-Message-State: AOJu0YwCoRPaBcttp8mNCQnfS6wADha8QbppsPMndVYO22h+O2ScMF7I
	P5z4b1fZ9GOxQEJCVcVBnaioW/79iXwGyjpX/A1M7n0MD2du3Qm1o4NcVNTMAw==
X-Gm-Gg: Acq92OFNGs2914VT0E7y5gRQ148lpBlPkPWYghy578vdNpz5/9lbATLnzwPd+5sq+B6
	3SJzj77AQbTM4wVuF+tVC/rRj5j2psjsp5ECKld5xf8GqWSeJEZr7Wz8J+ZUQVhPxRUYnMSub2i
	tkULDCe1aEzzjOf0CaxfNl+6wNQxDgZYrzXmtBws7NgSOTiZUlik8kEjVyhTK24szWEvTzqOmdi
	kBzUqzJsOE3+lKqaNSDHXiow/Qf0UpgNATwGx/mGbrmHkBrs1L+hdXLjP4eLAPneMIhJn/RhIwf
	8tnggs1TLVe5iFVju5DghJCxFk7IjHJskkr9sgSuoDG8/HUyGRQsIdfgUzLzREpYKJcIcl2k3tb
	b6ZC5kwg5WhiaBPWdmx2FUIATXUrNcdhv+niznim2awZgDQr3njvE5On6SjuqGPyjO5MAjGs8OY
	+AWKxDWC3hRstLM22Zb9ozMcmwy5ajlEv8hv4YBn14MpT4/hE=
X-Received: by 2002:a17:907:a4a:b0:ba2:140a:a48a with SMTP id a640c23a62f3a-bc56c8221a9mr1254307766b.26.1778495869875;
        Mon, 11 May 2026 03:37:49 -0700 (PDT)
Received: from ws.taila4487.ts.net ([80.166.137.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac11b7084sm473753966b.28.2026.05.11.03.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:37:49 -0700 (PDT)
From: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
Subject: [meta-oe][PATCH 2/2] dbus-cxx: 2.6.1 -> 2.6.2
Date: Mon, 11 May 2026 12:36:56 +0200
Message-ID: <20260511103655.3350355-3-frederikbraendstrup@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511103655.3350355-2-frederikbraendstrup@gmail.com>
References: <20260511103655.3350355-2-frederikbraendstrup@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2026 10:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126843

---
 .../dbus-cxx/{dbus-cxx_2.6.1.bb => dbus-cxx_2.6.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/dbus-cxx/{dbus-cxx_2.6.1.bb => dbus-cxx_2.6.2.bb} (96%)

diff --git a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.6.1.bb b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.6.2.bb
similarity index 96%
rename from meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.6.1.bb
rename to meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.6.2.bb
index bedd379e89..569d12aaf9 100644
--- a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.6.1.bb
+++ b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.6.2.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPL-3.0-or-later | BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=24594f493407a4cd401ce9794e0b9308"
 
 SRC_URI = "git://github.com/dbus-cxx/dbus-cxx.git;branch=master;protocol=https;tag=${PV}"
-SRCREV = "521a3d88bb731b94cc9998a0f711a5ca9e831e04"
+SRCREV = "c17186844a1493a246a4f4b8bde841c09322abc2"
 
 DEPENDS = "libsigc++-3"
 
-- 
2.54.0


