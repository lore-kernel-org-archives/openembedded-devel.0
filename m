Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0ACDF55802
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 09:33:34 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15573.1776677607545246619
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 02:33:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PWCvNJhI;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488d2079582so32796645e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 02:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776677606; x=1777282406; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q2q0Teh2VFw0LnVYc9T+opIhA7hDqQCUg0IsSd9+54g=;
        b=PWCvNJhIIXCAbU8xuSOd7QSshUDT7RBOrjchX4u2gZAzCB3N6Wf92K86aknhQToynO
         +hpEb5Z4DLIpxWf4q5AbwvDSDTMknXN82vjyw/smA3jyT/82eF8GqluvZKvw86aUWZaH
         vZIjw6BofAUanbtPJxH3YyO9VFe8eGjrzuy/7OFla9kCOHhdjZn+Xpcbwna9p1HtSpjR
         A7fydaJHokeoqBqK0r64xxeePu+mWBuz0xs0aDnF+nTctw4537uQ2XN8mgPMbIYCmtPc
         Q+3+n1wfpNHw2IOp7/Q6IFwn5aRzWoWS5JH3+/QFPrkZgLw4VnS7IQVBNl6RYbpxRKAq
         d51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776677606; x=1777282406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q2q0Teh2VFw0LnVYc9T+opIhA7hDqQCUg0IsSd9+54g=;
        b=FCWYMLksv6m+dMb/Kw0h3aXM/9pMfsRlTKonsOy1u6W6PIgnEEnlNX4Zr6f+LkZFU8
         aO3On/oyzntv2M3uphUV177Pn6y14PsMwXHTHTPkhti41nkgjHwTXSFdAsHAB2nOuvwp
         /GV/G7ly3oQYyxNJ5DYGZVDBTnP1hlFxvo/3GF7c1CGfltGXEk2gUwZYurwBASP5qxdp
         2PbYqmoRsye8MjpqSMZ54Vvj1qTKJOl6NULbpqBbOhCoFNcy65jKLQspyandkfX1NiJO
         qSMMvrQzrGqxiRw/31rATXVbF85rlbxXyTxb/crszxfeaFscNujCYrj8C9jJVSgV30xd
         tP/w==
X-Gm-Message-State: AOJu0Yx2x8YbnJIQ5q9e1dGJwCaM/+IQzVgA/M1n98lV7mFj4RXruW0f
	khU6DFpmXYlkW2SHcQd+doXSnVZ5kj5We3ju9QW9YhvzPpRDCbFNQv8/EgR4MQ==
X-Gm-Gg: AeBDiesdHPTbSJkEBKSQ9/nF5RtCyxpJpYMQbUUswMCN/C9M19fFwYTnKJdFZTNhWDL
	qva9pDIKJGnAz82fE04E7HnBX1Vvsv36tfckYeAv+9NdlPwK7whfhBxwanx3KWc1SOnp16qWoNd
	xq1i1GgSSAmQ7jyNU0MePN3uFiaKwixThGH25gfX4+zlRBTLF3DZMnBpMI+WNzmWtGa31P6S/Pk
	gvn5TtZR782whzfQh9KKPeqZ274lby6fTbJMdImAU0gaW5bEfwYjdYTyRuuYSISSZXkk1m18o3s
	MEi8axIP8kEKl09TAemndfIlAe8T1yNyuFDpLAuY1cW8Pbe2QYKRCkQrZRcI0ZGiGL6uNuBf80i
	AUWpH4PMbjLmpExvYcD6C46SA57HGdLUlz4eahh7b89kYACbVhwc0Ohm7ZRB7eWSRID95F5/NVc
	n7pQj5wLPyqndQs4JywhO5SczBwz/QbFo=
X-Received: by 2002:a05:600c:a416:b0:488:90ac:8f71 with SMTP id 5b1f17b1804b1-488fb73a9fcmr146543575e9.5.1776677605528;
        Mon, 20 Apr 2026 02:33:25 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4eec9sm26577488f8f.34.2026.04.20.02.33.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 02:33:25 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/8] openjpeg: patch CVE-2026-6192
Date: Mon, 20 Apr 2026 11:33:17 +0200
Message-ID: <20260420093323.357053-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420093323.357053-1-skandigraun@gmail.com>
References: <20260420093323.357053-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 09:33:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126488

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-6192

Backport the patch referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../openjpeg/openjpeg/CVE-2026-6192.patch     | 35 +++++++++++++++++++
 .../openjpeg/openjpeg_2.5.4.bb                |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2026-6192.patch

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2026-6192.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2026-6192.patch
new file mode 100644
index 0000000000..49be9bd0a6
--- /dev/null
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2026-6192.patch
@@ -0,0 +1,35 @@
+From 776b00ff792a3c54b65f3bd92dbe7476a5a54106 Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Sun, 5 Apr 2026 13:25:27 +0200
+Subject: [PATCH] opj_pi_initialise_encode() (write code path): avoid potential
+ integer overflow leading to insufficient memory allocation
+
+Fixes #1619
+
+CVE: CVE-2026-6192
+Upstream-Status: Backport [https://github.com/uclouvain/openjpeg/commit/839936aa33eb8899bbbd80fda02796bb65068951]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/lib/openjp2/pi.c | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/src/lib/openjp2/pi.c b/src/lib/openjp2/pi.c
+index 15ac3314..4abb87af 100644
+--- a/src/lib/openjp2/pi.c
++++ b/src/lib/openjp2/pi.c
+@@ -1694,9 +1694,12 @@ opj_pi_iterator_t *opj_pi_initialise_encode(const opj_image_t *p_image,
+     l_current_pi = l_pi;
+ 
+     /* memory allocation for include*/
+-    l_current_pi->include_size = l_tcp->numlayers * l_step_l;
+-    l_current_pi->include = (OPJ_INT16*) opj_calloc(l_current_pi->include_size,
+-                            sizeof(OPJ_INT16));
++    l_current_pi->include = NULL;
++    if (l_step_l <= UINT_MAX / l_tcp->numlayers) {
++        l_current_pi->include_size = l_tcp->numlayers * l_step_l;
++        l_current_pi->include = (OPJ_INT16*) opj_calloc(l_current_pi->include_size,
++                                sizeof(OPJ_INT16));
++    }
+     if (!l_current_pi->include) {
+         opj_free(l_tmp_data);
+         opj_free(l_tmp_ptr);
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb
index 33dc48b2ea..968b7a0a5c 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb
@@ -8,6 +8,7 @@ DEPENDS = "libpng tiff lcms zlib"
 SRC_URI = "git://github.com/uclouvain/openjpeg.git;branch=master;protocol=https \
            file://0001-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch \
            file://CVE-2023-39327.patch \
+           file://CVE-2026-6192.patch \
            "
 SRCREV = "6c4a29b00211eb0430fa0e5e890f1ce5c80f409f"
 

