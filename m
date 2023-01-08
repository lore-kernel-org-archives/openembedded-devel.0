Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0871AC54EBE
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 15:21:32 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web10.46773.1673191286449493835
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jan 2023 07:21:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F2hMtjPr;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id h185so5179324oif.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 07:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tIrO8dXi0YvjaaHj7pDx/Q63MkWKZ1UeEP/WhElRuXs=;
        b=F2hMtjPrOHhdyjTOf3Oo61+Y5hzT3gwqXR0OMw+AewNEDVeaeI2eShIOsIWGCXlrUt
         xZFTPEiqh0xuMKXcKoq/maaGw3iYuuCf7GmY3S+0Rzgp39XNlDOuELdx4Jxcp0BCDW0F
         tqMlhPVVWz/fnpjZeOlNzFIniWHAA35MsoICFwgMi282RjgmnQZ6VDCHBRJUz58i3kY3
         Kjaf0YLsHlJebVZbv0P9CynTdkkWpuNvWI3Hf73VW48HbcqwP7VtvQiHocYA+VNkn/Zo
         S1oK6p60kzO5oyo2BB3XA3Yn9YbJqAFgfvzvIgcws9WjzWlJMXKQlXLH3v0DJaGQT0Nc
         PL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tIrO8dXi0YvjaaHj7pDx/Q63MkWKZ1UeEP/WhElRuXs=;
        b=6gfszpZqeuC1ae6oNwuCMXH5uMowk2L5ZpYAj9jIOBJ1CoPOOuf+b2al5Nq6RVHOu2
         pAyouCV4kk6M0qXKThZqrLcNEHHBqbPVytdYZIWwnakrwqlJSLyPv2X5SpuUmr0MKKgM
         BLgixdfjaiqdBMS95D7D6dwLERmUQZ/HsEd9ZIpDOvKTT8nmtSgBtao1GKeC/OD7sksb
         2DhQFOwEK+D2FNniEpYbQ9SdLjwdDEAYP12F1Rv2DMy3NO8afvLfGZfYfNuo6PW3zYi9
         lGKHTgnKW/BgEfYJUY9QNyPq8e+rVr4mSNPzhMFtMDg6Cma7XX8juGQTdoqsJnv6MYXq
         YVJA==
X-Gm-Message-State: AFqh2ko3kqUrW1XA4f1Qa6g/otHjtfAorzeBIBon1cOVAiESwuu/wjTs
	UMEkI3D3b1f82QhNToSO6f5fdPHXors=
X-Google-Smtp-Source: AMrXdXvOq0BRXFFRe5g+3urTMswxw0CAO95VEBkAsP5yce3kIidnfT2W9buaywljWPWvl2B9uYxXvw==
X-Received: by 2002:a05:6808:1388:b0:35f:4055:dd96 with SMTP id c8-20020a056808138800b0035f4055dd96mr39279881oiw.8.1673191285711;
        Sun, 08 Jan 2023 07:21:25 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:14ca:f21f:f9fe:c54d])
        by smtp.gmail.com with ESMTPSA id s24-20020a056830125800b00684074fbce6sm3184725otp.54.2023.01.08.07.21.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 07:21:25 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 14/26] colord: upgrade 1.4.5 -> 1.4.6
Date: Sun,  8 Jan 2023 10:20:49 -0500
Message-Id: <232db5370795342f9b103013f4219c4a3a1ceeab.1673191116.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673191116.git.akuster808@gmail.com>
References: <cover.1673191116.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 15:21:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100459

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Bugfixes:
 - Add missing copyright notices
 - Add Spyder X entry
 - Document where to send patches
 - Don't use exact floating point comparisons
 - Drop option for removed reverse engineering tools
 - Drop references to hughski.com
 - Fix a small memory leak in sqlite3_exec()
 - Fix typo in device-removed signal documentation
 - Make introspection optional in meson

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 706cfeb2504ebec37872e6ee051a5b07385412b7)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/colord/colord.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/colord/colord.inc b/meta-oe/recipes-support/colord/colord.inc
index 41962cd63c..0ae1a30fe6 100644
--- a/meta-oe/recipes-support/colord/colord.inc
+++ b/meta-oe/recipes-support/colord/colord.inc
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = " \
     file://meson.build;beginline=3;endline=3;md5=f42198707d793be58b274d34fd5238c3 \
 "
 
-PV = "1.4.5"
+PV = "1.4.6"
 SRC_URI = "https://www.freedesktop.org/software/colord/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "b774ea443d239f4a2ee1853bd678426e669ddeda413dcb71cea1638c4d6c5e17"
+SRC_URI[sha256sum] = "7407631a27bfe5d1b672e7ae42777001c105d860b7b7392283c8c6300de88e6f"
 
-- 
2.25.1


