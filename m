Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B180CAC5A5
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 18:06:52 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.4448.1758650805614321628
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 11:06:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mu33gow0;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-afcb78ead12so897795366b.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758650804; x=1759255604; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sB7/MYNi8mo/N7hIM1RbTWSLdL0q8w2rPAvPTR4k+7A=;
        b=Mu33gow0X5FTIKT1dZfPIzcMXzg54N1eWsZalSlsifhfrF7zHnabBgrMVbkukdiwiv
         eaLerUtS2Ft8tO3vQgRoldHfAXOBsG1C0OZ+mJ88hYpJza0mJAeFii2WgLC1eLl0EXzI
         qERZEo/qyBAChuRt6krwv6YtkZOYapNPULaO3VQGFVQb4WFE9Op2g5TRJ4hi7vaHCPQU
         y/QTC6qzrxP6Mo6Kx1ELmcN5BmS8MYu2mjb71pPiyIHZnZ6Ardm/Iy7vIEI1bRQlSE3i
         eQj05X0uaiFZQkgzFaxe9jZlEMLbhsNPbYTfPfjYD/lZ3EIiM8LWJ9UFhwE03KZDYykx
         UwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758650804; x=1759255604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sB7/MYNi8mo/N7hIM1RbTWSLdL0q8w2rPAvPTR4k+7A=;
        b=UA0gTiVOJ7sN0GnfK9bwxf5VfsoIAZ6vgoB7hh8fOLZWtoNxfkQw6gdUbNPtOnJHd1
         am9PboW91YuZm2azw99S0Lz2jXACxqvVZ8FeaqiJb4EFSRfp9VCF4dV5OtPGkMANXEOS
         CtGFxjy17vObd1tlaXmdm8n/cJ+CU9fJjEoHyV3/3zPRXIA5LaEEr7eEdWRQUPneV5IS
         Yv0KQAiLXRk6qM/9xmUOXLrVykdCimDs+7Mah4x/LDmOiiCiybu0BkLnxpxkHYqG6zWQ
         EcOmTWLsbHEOIwxFTocuscDxKa+7Cbif30PPcVWo2BOCK03oK/ISaagrBCLTDlXF4EHn
         7vQg==
X-Gm-Message-State: AOJu0YztBMxfLOHixY88JkUO+jmbfJCj8D4pW4VFhVCzRv7eLd+gUAoE
	8scfDnlJpukcK118zpnhh/Cb+PPIKAoJwoK4FvdmeKrqbna/IiS9rWdq6ipIhfbs
X-Gm-Gg: ASbGncvZTdu0KCDAnbDoBU/5UToz7vahM2hqMFvJGH5Sgrtd0egRl+BHlutDG3sLOXc
	DCzUTO7qc65okVcH5iY3gdCtDqy9lbTfkZztimeaLnZcmC0F9N3k4/n2tIEHjuPlmlrjGFBVQvb
	ik3Dulbz13rnrs6DCTKbMEImwJqcMs46X+VU8s5pCRw6cADh/vmzjxwTUN6VipmjejOnYhZdlhp
	V+OESwMA4bJ/HDgYgUiwPSHYaqBV1NEuu+tevV2HB+c5pRq/C6pmS4bzBvEdTUblY3t8TLXlxrS
	09xfQaNpUcPaiKnMB7MErn9REGEPUU1dqnO9P6eKj81HdhKVYmD4p3KR4wxa4hYdgDqyesPzc10
	L8bRIxpwInaAeJ+YXrZ54
X-Google-Smtp-Source: AGHT+IGHg4do+FpOYzApSJxwJz7+h/iU1YSuHgn05pGbcC7zS+EeQnGJ9Z81eS0468cpibAnWwW9qg==
X-Received: by 2002:a17:906:c10a:b0:b04:4046:db6b with SMTP id a640c23a62f3a-b302b712d2amr315840566b.45.1758650803890;
        Tue, 23 Sep 2025 11:06:43 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b28be3fa38bsm826714866b.46.2025.09.23.11.06.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 11:06:43 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH 2/3] tokyocabinet: fix license
Date: Tue, 23 Sep 2025 20:06:40 +0200
Message-ID: <20250923180641.2307188-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923180641.2307188-1-skandigraun@gmail.com>
References: <20250923180641.2307188-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 18:06:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119730

The application is distributed under the LGPL license, not GPL.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb b/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
index a7c10128b3..d0ed6013f7 100644
--- a/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
+++ b/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
@@ -12,7 +12,7 @@ Records are organized in hash table, B+ tree, or fixed-length array."
 
 HOMEPAGE = "http://fallabs.com/tokyocabinet/"
 
-LICENSE = "GPL-2.0-only"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/t/${BPN}/${BPN}_${PV}.orig.tar.gz \

