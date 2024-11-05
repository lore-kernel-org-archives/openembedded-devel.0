Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25FAED35E3A
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:54:56 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.27718.1730831888532256757
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CrkC9phf;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e5a5a59094so51492297b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831887; x=1731436687; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZzZInh+TSqFltnicM2jerQtD9RkoRE/pHmTWh2xr30=;
        b=CrkC9phfpr+BiOGnBxUy39VFuFnZ2ND+NMtnJYk/EpIEv55y4yDKeqWxOvMKBjB/v0
         XU38UzsyWRBCO0SUHbakgYevYjskFWcS9C4kGM125oOM12MBQ3/YYw5DbiDpRfY0DKLc
         jktQoDxEwipzXcEXJru2L5dD0sAJ++gQEYuOhdjoKsjnOAuEd1VNuTvB1LjSKeBuaZL4
         hdSzPlR75U2PfeYIqBcTtBwYv43ZoZqRQ5KLkxwrSqaLuvJh55R42U5N5Fzue3dWhuNo
         aMgfn6y4ERl/qDHq2pXFkGqcEUek/ozGLhg0DQfRxJiVS8lM7mKrmBehC5OlHDtZuog5
         co1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831887; x=1731436687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GZzZInh+TSqFltnicM2jerQtD9RkoRE/pHmTWh2xr30=;
        b=UwhbygLFEWFT7/GepMqR8IcuuJ9AdopLVugEh6OMFyaK3gbaNG075BJUqj1qXJyHXS
         N8sI+A5+WTMZYRaQCxjXBUrTaQYFsRLTcKuuw0ZJJ++ZrlO6DtaeH3EyZSIJvbgoQ41J
         X2KU2MOs1toNSKsUtrbrtf1PfCmQJz0Rpj+QJJ+kQZW6b7ujcokZEcbCMtsW4SGvWXOU
         RHf/Q1M17ounbZ9hIX3wqhFdl3ayeybkDiHuPefKaOjpZze82XjFirKHUihoWGgcjxad
         oarFnQeN8R8buGc20mzrvaMbbjZiOewmHgVzfD7OxPGxHAXebZQVRHBVAsc9dKNX3tsC
         oINw==
X-Gm-Message-State: AOJu0YyhXKztLwl37Fjrn8VCUWoeubLDPCt+ZlCGixv6pMnwIqNUPj0f
	uhwYf+rnakeDyGWuz7EbPuX5C7pcvPD09iWrLUVHckK26KMgq1JxF/PrTq6b
X-Google-Smtp-Source: AGHT+IGixHdqz+yvyOHWsym/y1ARCwglXYzbaljJv2zx2iH5GdTn4GIrK8VSXz+1DdbmM8yLqUuYaw==
X-Received: by 2002:a05:690c:6c8c:b0:6e3:37a7:8a98 with SMTP id 00721157ae682-6ea64acac71mr174824007b3.14.1730831887058;
        Tue, 05 Nov 2024 10:38:07 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:06 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 012/161] irda-utils: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:24:48 -0500
Message-ID: <20241105183658.34982-14-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:54:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113527

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-bsp/irda-utils/irda-utils_0.9.18.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/irda-utils/irda-utils_0.9.18.bb b/meta-oe/recipes-bsp/irda-utils/irda-utils_0.9.18.bb
index 22bb30a50..d4d76e0e5 100644
--- a/meta-oe/recipes-bsp/irda-utils/irda-utils_0.9.18.bb
+++ b/meta-oe/recipes-bsp/irda-utils/irda-utils_0.9.18.bb
@@ -16,7 +16,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/irda/irda-utils-${PV}.tar.gz \
            file://musl.patch \
            file://init"
 
-SRC_URI[md5sum] = "84dc12aa4c3f61fccb8d8919bf4079bb"
 SRC_URI[sha256sum] = "61980551e46b2eaa9e17ad31cbc1a638074611fc33bff34163d10c7a67a9fdc6"
 
 inherit update-rc.d
-- 
2.43.0


