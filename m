Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37DA8CA5FAD
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 22:58:04 +0000 (UTC)
Received: from mail-dl2-f33.google.com (mail-dl2-f33.google.com [74.125.229.161])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1472.1790722675157765969
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 15:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ijJA3GSt;
 spf=pass (domain: gmail.com, ip: 74.125.229.161, mailfrom: raj.khem@gmail.com)
Received: by mail-dl2-f33.google.com with SMTP id a92af1059eb24-1438e88300cso4596345c88.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 15:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790722674; x=1791327474; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qAq08clOhz8EQ3Q4ty9ApsLTPRgGC+bsGynhOnKfy4Y=;
        b=ijJA3GStM72AT7EHfhvsE9OUCgl+90B4NGi3E3ySCb4NAAM5XdiFsAltPA+Zfs7AHt
         vDkltAwH5K7v8FhIso0TaoUf5XZwtcYeV47rSN5OBriFJWrpDCnixN8LTlfFXKzEqP0a
         z6ujyvN+zNNqsEF0dbYgVG6sRIPut7kA2l3IPhVcTVVESLnPFgd/Gx/hLOXC8Xz27+qV
         2k2vC9kvWxEBHfZfLxFY2EmrbJrwGHfA//XqmAZ8aEmcYey1+602Vz3NEAwm4yFVTnQ8
         us+MFDFhoj3kaUvnzXyC4mUjm41JgY9EZ4BrOoaXsEf9A1nQMrTS9BtOdLixyvfc3G9K
         1H/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790722674; x=1791327474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qAq08clOhz8EQ3Q4ty9ApsLTPRgGC+bsGynhOnKfy4Y=;
        b=y6SjBb26w/2rOYIVMFqz5TI6tWAwbJKUm+tiJkFweCH5pKQGRbnl7/lZ7y4spANFbA
         U09TZExEm0sRJxheDnGdBJFSpIaM40PZV8HSovlZoNp7RX/ivZ74E1xR8yG0dUGJbutb
         R6AsiHwMhcZEWGzIoHVsAwPTYYNCWLf2zLXySbLTjNwXT7EmxxQp82VGPodQA9YeuYxz
         5uYRbkmDhoa9/9/2PME482GTmhYs8TBk74t53QksaK+XRiaGsi58m+2lo9F5R7y+QKxJ
         yAPmi1qmN1wxcWo254JFIgowbnCDZ38JhvYSH2OfaMuqfRoDqpuCd+6V7O33VAJuMHSD
         rT8A==
X-Gm-Message-State: AFuF++nLJ62Pnbj0iWnMVGJ/dOU2HA2b9mSusFNxswChYcboWiXEMLhd
	ycEfgrz1DuJCC5Z9c0L8Z/1wFTnoXSFgfAoD5NOr7o1pln8gzI8dAqopdAbp8GsWLYM=
X-Gm-Gg: AYBFou0LNleobNjtPDDRNccH2kiVZK85xtNzOw3l+VnpzLLZgoWV8IZxZkWNmM5HzZy
	KT+XfqX64QEWKQHC4H4qyhF5x6PObgEQd/uEOrpS0ktfTD4G2oJSCQdaZF4zUJ42qNQE9+4M2LP
	sCQIpHVEY9uxEqEe2535paj7JJtmkMyiRg8jbGpnwhcSO14KsUwhaH1bG9ZIWd/PnOmDRWBVDyI
	0AYaOZ5oYrBz8M97dK+O+yYQfMPtsMmkwp30lAbddX5IS6iPi9Lieeq3Y7tE5BvXfnPybL9xngA
	rjcQpgzD5743FQdEOpoYaR3DPgKjXwlYTwacPEYw8sEKyq5qdJcBZCvqjGtJSAsvdzeffIUhLlm
	b6u/MAtJsIRRwPlHJzxVFZ0Ep2LRQYzql4RUFiYelzs6vfZ/vh30ouTOPcwP+XZxww8WL58yE0u
	ZEwQX8Eyy/NV4cdukZcFNnlCn8E/mhIuX1jhHssnFUAlSOTTR1wJmiJY5srhWiQC6FzzV6YPi+q
	qyQiG3imJILDbYTWS/QVknFUZdgBD9ps02+dENj0cjMtQoomo59+pkHk0beaNHYtGwgWLTv/AIO
	S7Upgha6jt4tld2U0XUUlnvLvilC4swqS6L7n3FbS3gKIlzWvZsRxvRqBTmirN1Ml+55r7S9Fld
	nhjrnho/isSwdDoLH9bmh//EgW0nAVqlO/ocTzptByIFmT6K6yPtnv7LYDMtBAGYdbHZyONjSIX
	dY2Zf7R/Kgmd8tTIWpVKaLQcOP8hR0WbAI0TvcUw==
X-Received: by 2002:a05:701b:2607:b0:145:15d:3717 with SMTP id a92af1059eb24-14c9ef30178mr762506c88.10.1790722674282;
        Tue, 29 Sep 2026 15:57:54 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c38bf0948sm1595527eec.25.2026.09.29.15.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 15:57:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 18/26] spdm-emu: provide AF_MCTP fallback for musl
Date: Tue, 29 Sep 2026 15:57:15 -0700
Message-ID: <20260929225723.1046705-18-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
References: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 22:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130505

spdm_emu_mctp_kernel.c uses AF_MCTP, a very recent Linux socket
family constant that musl's <sys/socket.h> doesn't define yet. Add a
guarded fallback definition.

AI-Generated: Uses Claude Code

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...rnel-provide-AF_MCTP-fallback-for-mu.patch | 45 +++++++++++++++++++
 .../recipes-security/spdm-emu/spdm-emu_git.bb |  4 +-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-security/spdm-emu/files/0001-spdm_emu_mctp_kernel-provide-AF_MCTP-fallback-for-mu.patch

diff --git a/meta-oe/recipes-security/spdm-emu/files/0001-spdm_emu_mctp_kernel-provide-AF_MCTP-fallback-for-mu.patch b/meta-oe/recipes-security/spdm-emu/files/0001-spdm_emu_mctp_kernel-provide-AF_MCTP-fallback-for-mu.patch
new file mode 100644
index 0000000000..80aa78bc08
--- /dev/null
+++ b/meta-oe/recipes-security/spdm-emu/files/0001-spdm_emu_mctp_kernel-provide-AF_MCTP-fallback-for-mu.patch
@@ -0,0 +1,45 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 29 Sep 2026 02:14:39 +0000
+Subject: [PATCH] spdm_emu_mctp_kernel: provide AF_MCTP fallback for musl
+
+AF_MCTP (Linux commit 583be982d934, merged in v5.15) is a newer socket
+address family. <linux/mctp.h>, which this header's implementation
+files include, assumes AF_MCTP is already declared by the libc's own
+socket headers and does not define it itself. This musl version's
+<sys/socket.h> has not picked up AF_MCTP yet (its AF_* list stops at
+AF_XDP), so building the AF_MCTP-based kernel MCTP transport fails
+with "use of undeclared identifier 'AF_MCTP'".
+
+Provide the numeric fallback (45, matching the kernel's
+include/linux/socket.h) so kernel-mode MCTP socket support still
+builds against this libc. Drop this once the staged libc defines
+AF_MCTP itself.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+diff --git a/spdm_emu/spdm_emu_common/spdm_emu_mctp_kernel.h b/spdm_emu/spdm_emu_common/spdm_emu_mctp_kernel.h
+index 4c0eb2b..5feb99f 100644
+--- a/spdm_emu/spdm_emu_common/spdm_emu_mctp_kernel.h
++++ b/spdm_emu/spdm_emu_common/spdm_emu_mctp_kernel.h
+@@ -7,6 +7,20 @@
+ #ifndef __SPDM_EMU_MCTP_KERNEL_H__
+ #define __SPDM_EMU_MCTP_KERNEL_H__
+
++#include <sys/socket.h>
++
++/*
++ * AF_MCTP (Linux commit 583be982d934, v5.15) is a newer socket address
++ * family. <linux/mctp.h> assumes it is already declared by the libc's own
++ * socket headers and does not define it itself; this musl version's
++ * <sys/socket.h> has not picked it up yet (its AF_* list stops at AF_XDP).
++ * Provide the numeric fallback so kernel-mode MCTP socket support still
++ * builds; drop this once the staged libc defines AF_MCTP.
++ */
++#ifndef AF_MCTP
++#define AF_MCTP 45
++#endif
++
+ /**
+  * Register the Linux kernel AF_MCTP IO ops and reset the peer address state.
+  *
diff --git a/meta-oe/recipes-security/spdm-emu/spdm-emu_git.bb b/meta-oe/recipes-security/spdm-emu/spdm-emu_git.bb
index 2a9735fc7c..33c02dae72 100644
--- a/meta-oe/recipes-security/spdm-emu/spdm-emu_git.bb
+++ b/meta-oe/recipes-security/spdm-emu/spdm-emu_git.bb
@@ -6,7 +6,9 @@ HOMEPAGE = "https://github.com/DMTF/spdm-emu"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ed4cfe4688e1ac2cc2e6748766571949"
 
-SRC_URI = "gitsm://github.com/DMTF/spdm-emu;protocol=https;branch=main"
+SRC_URI = "gitsm://github.com/DMTF/spdm-emu;protocol=https;branch=main \
+           file://0001-spdm_emu_mctp_kernel-provide-AF_MCTP-fallback-for-mu.patch \
+           "
 
 SRCREV = "ea77f25410cc01098320c0b44b3e150192ec4d5e"
 # Upstream release tags are "X.Y.Z" (newest 3.8.0).

