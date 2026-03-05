Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9632FF47CBB
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 19:25:07 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52567.1772738706321013036
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Mar 2026 11:25:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aWE9DJ9a;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-483abed83b6so70762765e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 11:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772738705; x=1773343505; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gUG58JlFt9C2WXFO1Zk63yTgv12miFehaugREHFSN1M=;
        b=aWE9DJ9amlUcH5fh09iUTkTbE0FbpX/2R9FB19lrUUSlrvOGMKPP+8qROISoIsjG/e
         U1kbCfJdNnGUli2gB8stgp9R7hWI8FCAfxTs35lEKFCJ/j024jdlEgrkQg7nuSaSbDg2
         JopHwW29ik6uMWj0hwUIcB8oCzjc5drO17oCoEy2X0IQK2Ye8+Z+GV1+58h76abBlvKk
         cTkfiPu4RoWgfofZ5Dh9Nex47ZoDoy+uyfwlDmTS4zbrt4TF12NTo9Ig2sdFJKaN3P5j
         2bMNJGpx04bg42nAHGw0W75x1BfpSDx8LUAg6Bcon8aYn5oiQ4uZjpDKsJPCVyRd7b7R
         MXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772738705; x=1773343505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gUG58JlFt9C2WXFO1Zk63yTgv12miFehaugREHFSN1M=;
        b=XXT0k03pRmcPlpEJx5yWY/ByZxdNfT4Zk0MEBfbo23zgn76yfEi1q4tduYu4IkmGtt
         OPTbBdIvQDBPQmVkSVlGgi7DO3Zx/xiPZcfEbL3IWwEyqAX/J4L1yk8aJdym9i0BrU6K
         B+o8nK/JfVonllRfcZLDKRe+IgcYpYRngCqkV2XmlwVvBycUToA1olxKtgEuWYCklfcL
         wUSTu+2jwBpFzQ77VNv8hGzdsafX/4DlpR/hqbmcIjkLAoFj6eA5hIjn++QjmFbQwnxC
         VJU8KOcXsKYpPkeDd6OBO9tiyT1j4aDVJflARRlm91tBiYE/5A2dNAqmDs2j+bZ136hE
         OPtA==
X-Gm-Message-State: AOJu0Yy1d06nTo8x5r4aF69dfo60nF4r0CCkC+R0p7m6z2/pcHOSi7R5
	kjWiY4CZ/gTTk+hwvFnymVzWE4ZlIKAIXTDo//t99KjT2R3ok5E/+D2HbM9ihQ==
X-Gm-Gg: ATEYQzxQMbiIGFYy/x3rA+RzNSSJ1N4o0WP/u8Z6Th14J/JxREA67N6rkBiCFi0Z4En
	YwFf/c58/rKWG7Lr6WBF5ZHmhkQv0uMh6sSGVa+LC4B1dyNPEPqPWNiw4ojERy9nJThmoRirhbb
	YYUhC5/0JASMeLWOeBvnfx22lW4GAifLNyh17OklBHjwqp9HheBgUy7Yk0k/VCs3lOgiiW1L1WV
	lDNfhVrL1kwAdK3xHP6hrAanm+DH0degxj0eXL/hSPYRPslCJw2vfo9GWKCixxng4tjAeHBLzUV
	6Z0ah3S7epPkyuYLR0QWlSGyPU94fTL2mlf83EPZKAqyHg9cTcKlC5j8oO54xXZ+7D/po0/ns9P
	ZD8ER7H92hbOD1TdxZCVNQ0a0dx4rt3ObfEbLE0XMJ1r4rqykCU8bWHGZfhTT+Ab/PearvXrHzo
	wiihp7TZhoOuBppauOymJ+
X-Received: by 2002:a05:600c:348c:b0:480:49ce:42cc with SMTP id 5b1f17b1804b1-4851983285dmr117658665e9.9.1772738704395;
        Thu, 05 Mar 2026 11:25:04 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad25a17sm47310795e9.29.2026.03.05.11.25.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 11:25:03 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][whinlatter][PATCH] gimp: ignore already fixed CVEs
Date: Thu,  5 Mar 2026 20:25:03 +0100
Message-ID: <20260305192503.3864009-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 19:25:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124892

There are a number of CVEs which are tracked by NVD with insufficient
version information, but are aleady fixed.

CVE-2026-0797[1][2], CVE-2026-2044[3], CVE-2026-2045[4], CVE-2026-2047[5]
CVE-2026-2048[6]

[1]: https://gitlab.gnome.org/GNOME/gimp/-/commit/13849c5a9a65c2366c47f703d9d075e4bfb83525
[2]: https://gitlab.gnome.org/GNOME/gimp/-/commit/ca449c745d58daa3f4b1ed4c2030d35d401a009d
[3]: https://gitlab.gnome.org/GNOME/gimp/-/commit/3b5f9ec2b4c03cf4a51a5414f2793844c26747e5
[4]: https://gitlab.gnome.org/GNOME/gimp/-/commit/bb896f67942557658b3fbfc67a1c073775c002c7
[5]: https://gitlab.gnome.org/GNOME/gimp/-/commit/5873e16f80cf4152d25a4c86b08553008a331e90
[6]: https://gitlab.gnome.org/GNOME/gimp/-/commit/fa69ac5ec5692f675de5c50a6df758f7d3e45117

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb b/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb
index 860fb5d26b..b22eb3a1d3 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb
@@ -135,4 +135,8 @@ RDEPENDS:${PN} = "mypaint-brushes-1.0 glib-networking python3-pygobject"
 
 CVE_STATUS[CVE-2007-3741] = "not-applicable-platform: This only applies for Mandriva Linux"
 CVE_STATUS[CVE-2025-8672] = "not-applicable-config: the vulnerability only affects MacOS"
-CVE_STATUS[CVE-2025-15059] = "fixed-version: The issue is fixed since v3.0.8"
+
+CVE_STATUS_GROUPS += "CVE_STATUS_FIXED_IN_308"
+CVE_STATUS_FIXED_IN_308[status] = "fixed-version: The issue is fixed since v3.0.8"
+CVE_STATUS_FIXED_IN_308 = "CVE-2025-15059 CVE-2026-0797 CVE-2026-2044 CVE-2026-2045 \
+    CVE-2026-2047 CVE-2026-2048"

