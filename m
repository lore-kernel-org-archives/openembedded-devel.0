Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE55D2F017
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 13:01:39 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10172.1769518889564106224
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 05:01:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l2+7jkdc;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4327555464cso3950319f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 05:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769518888; x=1770123688; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GKz12MR3SSKomlk/ukjSs/08GhxKOjNpAf+TcPE6OrI=;
        b=l2+7jkdc0oEe+J4o92Rzly5Gnldk10Y2UCf9cvG0960j7b1nPg0sSOXkgrWT2C3nPA
         rdG5Te+hvzl54VlXH5eAMWVcfEBJ2skuk8bOLZilnTMyxD4HmQj85FqmesJYcqtRH7Xb
         cniPdaCRzQd+GSZK0CAT7PWGss63xfY+jJA5aMHdJrtW2tMrIJLtYuIS1DmpHixsxkdI
         GUbyd6TJQdI8KBA4CK6kGZf4OVxYgGprl0d+A0CrOxh5N8Tqth/RNybaJAVfmZFHKUgv
         zltcmN0sH5TsyQ1tLr7Un/1YuDNpQx+V13k94otteYPBGAGVfNiqvnf/ZceXT8OgNare
         BN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769518888; x=1770123688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GKz12MR3SSKomlk/ukjSs/08GhxKOjNpAf+TcPE6OrI=;
        b=uytg+NS7qfnnccSzwIdJPePXbGgfG9d0kcsKAc5+CG10hRoaftbIgRMScNjzNeHnbx
         tXXegsMtD2EO8ScoV1qv2gnrWttFVG8bTEfKIkXhwr5IzW/FURdlahIbBfh3YKPmMP41
         eOoYTEdAaq9AP+9Jvs/yj3TJnsHrCcGn8SYQG+7MHinoXYOcOb4bYrFLnPPUSN5ItiC0
         CQgl7O8HNdkULD2zS/qmI5SVOg3/BxY86AX11+mFtOgdICEtnJbG7mTjftL2hbT4aJA8
         SPd1mHWQWAz0Wfqx+74OERnI18OEMh2gldS+PteQqJfDumzCy8VJeGn4099jhOFr/2Bm
         4SFw==
X-Gm-Message-State: AOJu0Yyk9itleD449edcAe0TIhskHadIYe+TSX9CdyESsvH+29xLqqk5
	E2PvLk4hYk+6c2Dsr+dVwiaLLoh7DgA+/n04IBKvLQQ0k0YQFt7BP8wuyme78g==
X-Gm-Gg: AZuq6aKwaKT6gr9SY6SeEToTF8DorKZotbgBpbnaxf2M4NY9ASfPZx4M0xA1OU9cs5e
	qPiYu07zfjNFhQ0k7W4nn+PFSI01xj9YyYQEWIkAeUGLnLhRmXBJNGOvTDFRl9v5msoZLMsfJnW
	FSiFzuDSChcxx7N/9On98ZyQWd4CiAFfp3MORY2xITAJvqHSbKvVFENAIm5V8aVonlXjGm9SxV6
	UQPNs1bsPq17I2a829RvQNGZ4YnweKOzX8p7DXehV7S+ALfUHMctecT++CMzZuGDjXvmW6PVFMb
	Hp+mdKak0HiGvAUDc3K9K1//IvJl+gBE4XDfrlM4D4AAbg+W6avJ5uC//0d/AiAGBKGxK5OdLqe
	27hz9sB5XF6EqFz6SoInLvHR5SetnObHrlTv6+AAm0LZ3qiHTWU1yiKn8IjdCqH6gHY0Ah244LW
	gIml6XBMfE
X-Received: by 2002:a05:6000:220e:b0:435:a258:76e with SMTP id ffacd0b85a97d-435dd1cec1cmr2442235f8f.60.1769518883384;
        Tue, 27 Jan 2026 05:01:23 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24a8asm37671577f8f.12.2026.01.27.05.01.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 05:01:22 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][RFC PATCH 06/14] tigervnc: patch CVE-2024-0409
Date: Tue, 27 Jan 2026 14:01:06 +0100
Message-ID: <20260127130116.1902238-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127130116.1902238-1-skandigraun@gmail.com>
References: <20260127130116.1902238-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 13:01:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123950

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-0409

Pick the patch that explicitly refers to this CVE ID in its
commit message.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../tigervnc/files/CVE-2024-0409.patch        | 47 +++++++++++++++++++
 .../tigervnc/tigervnc_1.11.0.bb               |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/CVE-2024-0409.patch

diff --git a/meta-oe/recipes-graphics/tigervnc/files/CVE-2024-0409.patch b/meta-oe/recipes-graphics/tigervnc/files/CVE-2024-0409.patch
new file mode 100644
index 0000000000..32aba8f80e
--- /dev/null
+++ b/meta-oe/recipes-graphics/tigervnc/files/CVE-2024-0409.patch
@@ -0,0 +1,47 @@
+From 7018d3738102529f23904d62d7187430d2d2a281 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Wed, 6 Dec 2023 11:51:56 +0100
+Subject: [PATCH] ephyr,xwayland: Use the proper private key for cursor
+
+From: Olivier Fourdan <ofourdan@redhat.com>
+
+The cursor in DIX is actually split in two parts, the cursor itself and
+the cursor bits, each with their own devPrivates.
+
+The cursor itself includes the cursor bits, meaning that the cursor bits
+devPrivates in within structure of the cursor.
+
+Both Xephyr and Xwayland were using the private key for the cursor bits
+to store the data for the cursor, and when using XSELINUX which comes
+with its own special devPrivates, the data stored in that cursor bits'
+devPrivates would interfere with the XSELINUX devPrivates data and the
+SELINUX security ID would point to some other unrelated data, causing a
+crash in the XSELINUX code when trying to (re)use the security ID.
+
+CVE-2024-0409
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+(cherry picked from commit 2ef0f1116c65d5cb06d7b6d83f8a1aea702c94f7)
+(cherry picked from commit a4f0e9466f3bc7073a8f0c28a581211c2d7adf0e)
+
+CVE: CVE-2024-0409
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/a4f0e9466f3bc7073a8f0c28a581211c2d7adf0e]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ hw/kdrive/ephyr/ephyrcursor.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/kdrive/ephyr/ephyrcursor.c b/hw/kdrive/ephyr/ephyrcursor.c
+index f991899c5..3f192d034 100644
+--- a/hw/kdrive/ephyr/ephyrcursor.c
++++ b/hw/kdrive/ephyr/ephyrcursor.c
+@@ -246,7 +246,7 @@ miPointerSpriteFuncRec EphyrPointerSpriteFuncs = {
+ Bool
+ ephyrCursorInit(ScreenPtr screen)
+ {
+-    if (!dixRegisterPrivateKey(&ephyrCursorPrivateKey, PRIVATE_CURSOR_BITS,
++    if (!dixRegisterPrivateKey(&ephyrCursorPrivateKey, PRIVATE_CURSOR,
+                                sizeof(ephyrCursorRec)))
+         return FALSE;
+ 
diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
index 4613d34833..a007297012 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
@@ -24,6 +24,7 @@ SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.11-branch;protocol=ht
            file://CVE-2023-6377.patch;patchdir=${XORG_S} \
            file://CVE-2023-6478.patch;patchdir=${XORG_S} \
            file://CVE-2024-0408.patch;patchdir=${XORG_S} \
+           file://CVE-2024-0409.patch;patchdir=${XORG_S} \
 "
 
 # Keep sync with xorg-server in oe-core

