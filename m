Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACFFCC43638
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 16:22:38 +0000 (UTC)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20726.1782663754666615889
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 09:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qgc9mP0q;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-30b9e755555so3979044eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 09:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782663754; x=1783268554; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezCuULdGxCE8bEH+JnjPc28uGf60AIGlvjmxotIUF3A=;
        b=qgc9mP0qibxaXaynoBzTX3aUMntY6vAoXsakp9j1SX9DD4XGD/zVf0Zf0BvP1f8lmE
         i3M9FK7XbXdYabPPzGAC4chGCClKszDJHGB7M9lCs2OCHAg0l5LwjT1zOfLgaJ8JSCax
         anaJGob+cV2VkochozPob1k+zj4ro1WJxKyoYtGmuvSajxs908DvnDDd36+9EdiA3EFz
         N5sMezG7M788g/4Hw5eGfwdT7iufao8G7TaGOAYsIX5LxZi4oe3Uxv5iKXvNvC8f/im4
         j2+Fn4fo4KIlx/OgHZF3Il+e5GxsWfn2h1SMD2HVvy8x/Zp2mEtQ5rxoNScg/Mdc9UzC
         TZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782663754; x=1783268554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ezCuULdGxCE8bEH+JnjPc28uGf60AIGlvjmxotIUF3A=;
        b=iTarI2SxGcA61FSmw4DE5aTa5o3fR+ASSt2GVcA98azaXsC+WM9xElwGhx/cTOE+hs
         CWRWQWwOqqCZF1NvMDVROYaGzIEBHV1aeVp8WvwaaUQvNXoerr2uLo94gjPzZhMuiV/A
         6RQD9pAPStcFZJQkOiMD5+s5eB1YaFd6sHgCnWWOlYLRVDeOIvhyZ/0lRqcQZyna0Uw6
         /UgVfmb90hW93MgrVVcH4UUVP/k/Qvas8+aDXFmcYbyUhiBHSNrgTWxj293GNN46uFO1
         8hOE815HuOp1e+j43wrowMRqqI5DhG64xcmthp1Yn2sZaJs+zgOklvKTCnWNBxOjjHsc
         5SIA==
X-Gm-Message-State: AOJu0Ywt02zzciawn4E12dCOu+skrVZ5B7VJYN0ItXaKTY9kp2gAWj7g
	4+Zn51TJ7dy4V8dd5K5HLBU4Gy4DicDxxvWTBp3d3wmhvOcM3vnzuqgatV9nMRdOTjkgFQ==
X-Gm-Gg: AfdE7cmd2KK6OVz1x+mMrGm5Y6Dw4KCkA2F4d/r1LZNXcsBBMk/EOjbkMM7fHuP3FHX
	xZFu+Sdz/fsu3Ls0R6u1qT+Rlc+8xKQLqRPk9qO0PwE62I4LHH5kb/BL9ez9y1vvI0aloRyDyC6
	j/Mjb0YdhphXPxwR1gkMKilHAZ0YeQ8bGzQ52h1NLKjcxVtYbITflcolGHaXc3Uj0cKrik8K/F8
	zw8ay7IMX4hKxPdkXw//Fjel0pLMXp8r3IKTg7UPYN9+T8au5+NG6S6kp4eJ/iM+xMfMA3jdlLt
	e1h3b6mNXsdzPT+GHG/+Qfqt9F8SkQVyXaLkhZtZxHOXXuwngAdWTwNNZhAW7bI967TFHUxVnCf
	AcvZTByr0C01tlblOIUwdnXE79boX1YUmIl2rd+WRXDTpw22Y7G1Y+VX7gt+3XXi+Jb+4i6H2XX
	p/UDQ6+CcwEfjWo7cOWB9UaMy2oPls9ZSf5L9jR9xZYYEpRzsnEZ+k1S8rJJRlP6X1WqQzyWpt7
	EczPSuCWGPIT5QMkApHYWqVM4GbkpGb8iU2Caqb9RTLcON5oIXB0soFu/DOe5dqkKXZ72c6WAQX
	4+Eilufd1DFpxIF+ykptJ8KYmr9y3w==
X-Received: by 2002:a05:7301:6003:b0:30b:eb75:8a5a with SMTP id 5a478bee46e88-30c84e0bb96mr14768867eec.25.1782663753982;
        Sun, 28 Jun 2026 09:22:33 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c591sm49849445eec.7.2026.06.28.09.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 09:22:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 108/128] genimage: set pipefail shell explicitly for cross builds
Date: Sun, 28 Jun 2026 09:22:02 -0700
Message-ID: <20260628162222.4081517-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
References: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 16:22:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127918

configure cannot probe for a pipefail-capable shell when
cross compiling; pass --with-shell=/bin/bash and add bash
to runtime deps.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/genimage/genimage_20.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/genimage/genimage_20.bb b/meta-oe/recipes-support/genimage/genimage_20.bb
index 8e7f59e9f1..4ef402a305 100644
--- a/meta-oe/recipes-support/genimage/genimage_20.bb
+++ b/meta-oe/recipes-support/genimage/genimage_20.bb
@@ -12,10 +12,15 @@ DEPENDS = "libconfuse"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/genimage-${PV}.tar.xz"
 SRC_URI[sha256sum] = "397545be2fa52d482c5fba9a11897c61324bfc559ea0efb700b9edba7a807b55"
 
-EXTRA_OECONF = "--enable-largefile"
+# When cross compiling, configure cannot probe for a shell that supports
+# "set -o pipefail", so it must be specified explicitly. genimage uses this
+# shell at runtime to run command pipelines, so point it at bash.
+EXTRA_OECONF = "--enable-largefile --with-shell=/bin/bash"
 
 inherit pkgconfig autotools gettext github-releases
 
+RDEPENDS:${PN}:append:class-target = " bash"
+
 GITHUB_BASE_URI = "https://github.com/pengutronix/genimage/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)*)"
 

