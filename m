Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6703CED272
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 10:31:39 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9416.1763461893078429189
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 02:31:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HyGMltJV;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477a219db05so14262725e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 02:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763461891; x=1764066691; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3T9pbSLdnw0Ya2a1whqTiqheGh8LJLk+MCV+99M0OKU=;
        b=HyGMltJVyM1CEj61G//1GqSzeCVeu20fZtuLJrPf+sFJXkoTdIBkTSPMmO4CXWFFIb
         KpmCmJny7hL4Obw9L8gQznHRpxz73oAwTjjYe/LNa4m0rXgp3/TKHcTIPdYPN+/FWd+4
         l3ux5pQdjfxoCOpyUoir9fdLGyVyNGOrsPfY9rr12+hhCz+PwBaU71AddK8rbmMoA586
         4S9VEBxcOvJvif7qqWIrx1VdmX6h19EP2UkxUfvv9xG13BKNa5bnoJ0sqC1ayRMcu3bP
         u2KqucWrDFBsMu6LGzkB6Os5Z9bLmRZap2L7IQYvWt28skOh/bexAk+djvQGueWsDgHp
         EOAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763461891; x=1764066691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3T9pbSLdnw0Ya2a1whqTiqheGh8LJLk+MCV+99M0OKU=;
        b=af362MJzlc86FP4pUszd6tTTLC51JwuRwmDsOR+Cz7lgwYoZDlEPOi9sZoOzbH+0Nl
         xMTun2Y1Etoz7tE9FsoKLDViNNvqmnJffjot4PZaNJEiNJXocRMeW6aQrsecupZTBBfA
         a61xVfqaGQKR27hlAzYrfUF+hk/2AJ7DxUTwQcvEsRZUcwQdqRz4sTjELImZPr2w5Xcz
         0Ao9OKqffgyI6M5c+dkscGrcwjNrrglYu6jeyewgaEzTdchK37q7Ch7dFs83wz4QUxUs
         8UUBjecAlOrvPMytt936rpnNicBs2lawGV7qrEAOdSD9sL2VheO6ch02IjgkAFFg9TTN
         8WRQ==
X-Gm-Message-State: AOJu0YxX2Wg/HJg1u7fFxe1nWlRbWfDcwCcPGjfs3149SK5RGiCgFrtf
	M48OIpUudC0G+CpWuNOJBPy3x28AvRM9Zs3IolYANbXJ88LOTz457B6sNLlxthjP
X-Gm-Gg: ASbGncvd2a1WnwRn/KzDgaOMby37LKWemxuyTAr72j/MiPZAx36b2X3P2QvuzQz9/Q8
	LvjHpILSkeCisrurRk7Lfl9HxE1A+6fuWPSib0S+lErMhzmkZq8t7ZqnzReAKmhgpZEO9FCeG8g
	AQ/0lN6fuKPY0ry3j7qG1vwrUUFBZj6bLp2Kh84g7eWaf46Zo4Z+5VChwSHDIAfSrM1O9ctR7N1
	0s2H4ZKdeRurOonNmi6q39dJYBaTyEB3bgp4zy8UvqEWGSNNnC2ZusMH2RdIfb6fvGIHyLh24VB
	EwJr56v5k5PBvLcrbAS3vIw5wuKHsGHP9sSMPxBTe2+3u92ebq5bf4qM0ctqV1lHZedj2R1rqYd
	HGlC31Ys7MDq9nV3ZkcVNdBPrR6UacnV3Ls3ZmAH7CBDaZmJHNUqmZaavAB5bSiiuSr0ro3oHzr
	0v3MyzbPfAZ4ssBXnn/uA=
X-Google-Smtp-Source: AGHT+IHFu5wzzLV0WhfmlxBl/WwlzBt0Qm7b67aHBdLCpwpyPnxy/4lAsu/xVeSN+OL83hblc5RbjQ==
X-Received: by 2002:a05:600c:1f91:b0:475:dd9a:f791 with SMTP id 5b1f17b1804b1-4778feadab1mr136288595e9.28.1763461891203;
        Tue, 18 Nov 2025 02:31:31 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a81c567bsm55743925e9.9.2025.11.18.02.31.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 02:31:30 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 2/6] libwmf: add missing CVE tag to patch
Date: Tue, 18 Nov 2025 11:31:24 +0100
Message-ID: <20251118103128.1471091-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251118103128.1471091-1-skandigraun@gmail.com>
References: <20251118103128.1471091-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 10:31:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121844

CVE-2006-3376 is already patched, but the patch is missing
the required CVE tag, so the cve-checker misses it.

This patch adds the tag.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libwmf/libwmf/libwmf-0.2.8.4-intoverflow.patch              | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/libwmf/libwmf/libwmf-0.2.8.4-intoverflow.patch b/meta-oe/recipes-extended/libwmf/libwmf/libwmf-0.2.8.4-intoverflow.patch
index 4e7cd8887a..ffec9fb685 100644
--- a/meta-oe/recipes-extended/libwmf/libwmf/libwmf-0.2.8.4-intoverflow.patch
+++ b/meta-oe/recipes-extended/libwmf/libwmf/libwmf-0.2.8.4-intoverflow.patch
@@ -4,6 +4,8 @@ http://cvs.fedoraproject.org/viewvc/devel/libwmf/libwmf-0.2.8.4-intoverflow.patc
 
 CVE-2006-3376 libwmf integer overflow
 
+CVE: CVE-2006-3376
+
 --- libwmf-0.2.8.4.orig/src/player.c	2002-12-10 19:30:26.000000000 +0000
 +++ libwmf-0.2.8.4/src/player.c	2006-07-12 15:12:52.000000000 +0100
 @@ -42,6 +42,7 @@

