Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF374E92724
	for <webhook@archiver.kernel.org>; Sun, 28 Dec 2025 12:11:14 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23528.1766923865932845226
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Dec 2025 04:11:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ur6k3TXG;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so54326835e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Dec 2025 04:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766923864; x=1767528664; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U8HVSWe34JAJxcYKT65cK11Y5W04Ozlar2IjDyoJF8o=;
        b=Ur6k3TXGFH+XEZPYcuwzBoDnOh6FDemstnKqAAlknAqjKuy0xh23dQzWCW2b7j6w3t
         wCUV0XbDT5XcL8YviW0kiTlpNCsvpduFuAHZ3wu8bAYfOpQY07GFy5uUf/dVqwOxqW4s
         ASGYNT+wBx92nmhSyF0FA1de2dKnCuHR23lINQfnhV+rFulhPaspif525UZmGaDaG+tB
         /ZQiaN5yfU9J+p+jAXUIQO7H/wrP6mpaGrX4i7dokc4/mHNJjqcHKNMxYr4xmmKlUYYG
         jP5Sa4oK16Mk4w8muiwQOYThP0/D2vx6rL9TpkCw8IOGhyOnvCEaJ68i53AocNxuIJHJ
         7ESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766923864; x=1767528664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U8HVSWe34JAJxcYKT65cK11Y5W04Ozlar2IjDyoJF8o=;
        b=K4H9RYrIP2Vh16fRLaIAsCTEM/LR6pTVed4VpFkNddLw5O8keOsBi1u3Jd+OLixVcA
         nzLVfrqPQs5Xb7RvoZkWWoDYjI8aFgJlXVtq/hH57tgP7lHOgg93r5H69zyVl+6AvCNX
         6r8g7B1ZhEsY312Azc011qcCqYC/OiZRjSg1rkp1FUbRRxI0qW50XgGY0lwKP7hhKc5x
         wy3tnZ1ongV9Jup6lXa/JB+Deol5DAgDRSfdR8hVpCQfT3r684AoA+tV+ulmDTeotg80
         EzF9VUUbq5rnt52phUTZCU8svSWoMqOLw3zUYtcgJSS0ZEpZfL61Ac8jI0W9GSp7nA+c
         OUEA==
X-Gm-Message-State: AOJu0YylbHO6MXE6M2hsJ5Fgjof8aduyO62liXWfQnsdXbE1JxXLGF2W
	MpfuHIyPsIfpjoURMw+O32tp5VTDlygOZ2SaiDswUbmGcFz2DPq4/OCUJck3hw==
X-Gm-Gg: AY/fxX4La2J1MuZ9QTIyW9I/vIux6tqSDIraQn7wS32nUcz6I4ZislAJcx9GXTNJDDn
	m7VZhbaklr7uK2M/wN03f6cEe291Q8CeMDaJHj+nrC0pWORc5hvE8jnKdz+Sot0PRqwbuUBi8Sa
	nWwaklD8rgFeb26vTVK1PsMcAv+wOTXmD80RhzoseEhznvigG90LcSGE9lqpQCbJPC+EFIzPncy
	spi50QfDHeuyclNshXGOJ0BmdaGC8fnSaR6YqK5xQwr0CMOOwZF1nGj72sscLRhd6DauVmLzmZN
	OScqdRM8x7K+yRmd7Va8hPNMzbjn06unxtmZ6lDEhs56jIeH0n9HyGMD/Bf+xYThgFSyjBULk+8
	0AdVjFcFfoD/sqIlTHBWdeGVNMSap0hd84tZ/GHmB1zehqsKGwNKuMRJkn3H2FjiwJJJyO1slMn
	dTUT7QxyWa72WhK4zLcAE=
X-Google-Smtp-Source: AGHT+IFlauSk2AY8OhTPZ8qHb3htV1nHGJsXu4Fec0tjUr+KEBRm+a764u8og+5/nLRY5h7tGwvLdw==
X-Received: by 2002:a05:600c:3b2a:b0:477:b734:8c22 with SMTP id 5b1f17b1804b1-47d1953bd29mr297366635e9.8.1766923864168;
        Sun, 28 Dec 2025 04:11:04 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273e4d5sm546859805e9.6.2025.12.28.04.11.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 04:11:01 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 2/6] pcp: switch SRC_URI to git
Date: Sun, 28 Dec 2025 13:10:55 +0100
Message-ID: <20251228121059.1810946-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228121059.1810946-1-skandigraun@gmail.com>
References: <20251228121059.1810946-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Dec 2025 12:11:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122957

The original link stopped working.

I have compared the original tarball's content with this revision: the contents
are bit-identical to each other. The only difference is that the original
tarball came with an extra "debian/control" file which is not present in
the git repository, but it not using for compiling.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/pcp/pcp.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/pcp/pcp.inc b/meta-oe/recipes-support/pcp/pcp.inc
index 708ebfe7ab..c188bf8f62 100644
--- a/meta-oe/recipes-support/pcp/pcp.inc
+++ b/meta-oe/recipes-support/pcp/pcp.inc
@@ -7,11 +7,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=37ab75b580d5aad4ada04260efa3702f \
                     "
 COMPATIBLE_HOST:libc-musl = "null"
 
-SRC_URI = "https://performancecopilot.jfrog.io/artifactory/pcp-source-release/${BP}.src.tar.gz \
+SRC_URI = "git://git@github.com/performancecopilot/pcp.git;protocol=https;nobranch=1 \
            file://0001-configure-Limit-the-header-search-to-sysroot.patch \
            file://config.linux \
 	   "
-SRC_URI[sha256sum] = "6ef33b7aa14c09860ba7cd8873e76d38ccd24eab0c94a50e235f813e77fe3610"
+SRCREV = "520c142c23f87dc01c4e419d4b56e80069546dc2"
+
+S = "${WORKDIR}/git"
 
 inherit setuptools3-base pkgconfig autotools-brokensep
 

