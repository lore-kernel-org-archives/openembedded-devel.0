Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 121AECCD185
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 12:59:37 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.7958.1759409970475083209
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 05:59:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lHnzFAW+;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b403bb7843eso222975466b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 05:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759409969; x=1760014769; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KBVMXA0svvTeG4AWNNef2Mmd74CIX6nbyDvXTSDwRCE=;
        b=lHnzFAW+DOWAy3781y0MbaiH1Fh0k/RrrXFlbhi6FcK69g8bknREP9F0Ro0qv0YviW
         Yxp6RLqCvR1q71vsfSN7RGaVhxiNHhOnYPtB7ysNqNOV0k0cJGfJj5Ox2AaUl1NVbGRY
         r7tVjmISx87WCrh70GV84+NfUBl656ZBo3I+kv7eYcBkbPG7s7hBbzWk4bTlYAfXakTI
         F2ZFkmoJ1kwB/+UqdS6nHONz68Ww2SHU0KAl71bo6sX+CgaTYr2SuZZdEpGbs3ZSI5fF
         E7fN5XOLBiO8G6X/KoE6e0KadBrwH0c7BgEILpZWDjcXHIOU1fJqetIhyKFE8ROGorNC
         nmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759409969; x=1760014769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KBVMXA0svvTeG4AWNNef2Mmd74CIX6nbyDvXTSDwRCE=;
        b=pMINyXQQDadc+23xZzErnnm+LJZd45n49hocFE+m6jq+AMvNRP85v5jMqJjKZKcfHq
         4oVgOuilIwtkRJzFSOy3KQaZUyk9fo2vkKWzy0PX/jRbYf+YNRLUm6ZXod5HzpqcONEu
         fILY/Ne67GHURLORNLSF7i27SBE7aB2RFjSJBhl3CBbxZBxFk3w7wi7F9gZlXmdpvRQP
         rOtAg//gsH+f+Wl9ufbUAUjIOJtBsz5EnnXE0OGw8KICv7v3BQnH8Z3M5kki+YtRh7Jq
         JenNVDDwhJsjkH2vKBIsg/IwfCnhGi0JpHzcKNLC2uwwM4VWaxoDoNo/x+YXvSB9ITuC
         L0dw==
X-Gm-Message-State: AOJu0YwWktAGkeFhps8L6z6yJrSojhX8Gur+3nGgwwg76QoOt8NFUO88
	0LB35RJ91eEV05CZSn+xe8JSOiBpK66gNaNJQvnP+WjbcAV41Pb1ZKoOPRg0Mw==
X-Gm-Gg: ASbGncvJR/7f/ABeunpQQ1B5GlfcchizIVNb6DVtcxs3vwkVbNyd4LKX3q8DwSz20k3
	fFUY+8eLg6gMwvgU60YeE3n69ciqyEceqw3N5K2HWZVFxSQbW743s6f99YWvMiyGJmA3rZIleQg
	99O/NE7IjYAdBkXSNbH1W2IpqEc9KRnfORyGbXryXRlWlVv2L/hFG/EtSUwibQzYCXB51QwyMRX
	zlXDYD9TGUf8b3VET5lCMm+m6gMXk8anBhZJHElEcpAZrH4qlNwl8X0V97er2+KIpAWzHAylujT
	TRdXImcZWGCGTpN8/90ZXSJEs2iSLTmG8UKxniuDwgAGxmSLLMlXFnz35z69NGjTuC/mo4muZ0L
	MUjbVsWhtwximuAaFb5CT380u6Qr1WLbI68CXmJAznEyH
X-Google-Smtp-Source: AGHT+IHP2mCaC03y4PPO8ki96fQpMkt4BVOC8V7ujHUfMcBF5nLqB4Axeu1s4N6dD/NyJUUsa/1hzg==
X-Received: by 2002:a17:907:7287:b0:b3f:1028:a866 with SMTP id a640c23a62f3a-b46e516296dmr847435266b.15.1759409968757;
        Thu, 02 Oct 2025 05:59:28 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b03sm194127166b.84.2025.10.02.05.59.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 05:59:28 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 01/26] dash: correct licence
Date: Thu,  2 Oct 2025 14:59:01 +0200
Message-ID: <20251002125926.2624522-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002125926.2624522-1-skandigraun@gmail.com>
References: <20251002125926.2624522-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 12:59:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120170

From: Dan McGregor <dan.mcgregor@usask.ca>

According to its copyright file, dash is only BSD-3-Clause. It has
a build time tool from bash that's under the GPL, but only the
tool's output is used, not the tool itself. So all compiled artefacts
in dash appear to share the same licence.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8eba35f8b03659ffd73aceb52b6e78da8661a6dd)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-shells/dash/dash_0.5.11.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-shells/dash/dash_0.5.11.5.bb b/meta-oe/recipes-shells/dash/dash_0.5.11.5.bb
index ad3672f3e4..3674052311 100644
--- a/meta-oe/recipes-shells/dash/dash_0.5.11.5.bb
+++ b/meta-oe/recipes-shells/dash/dash_0.5.11.5.bb
@@ -2,7 +2,7 @@ SUMMARY = "Small and fast POSIX-compliant shell"
 HOMEPAGE = "http://gondor.apana.org.au/~herbert/dash/"
 SECTION = "System Environment/Shells"
 
-LICENSE = "BSD-3-Clause & GPL-2.0-or-later"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b5262b4a1a1bff72b48e935531976d2e"
 
 inherit autotools update-alternatives

