Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8CF1D2F01E
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 13:01:29 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10171.1769518888791865434
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 05:01:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h6YWEJld;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43246af170aso3286744f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 05:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769518887; x=1770123687; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RTvkZrOVKH5r5YnMKGZsXCRnC/MuHEEKAUTbV8Xxg4c=;
        b=h6YWEJldQU28nkq504IAtZbtxIJJ3T3Vn3j39+NqOsS/euxKSKjzZ5At0mcX7hlmd/
         TkHTr+UxDmquRt+rbUgvd3NI/90m9oF6YRT8LKf0shrSnRiExcuMQGIn2qeychTbg7oU
         l7C4GHNz/jpfjG8EM293W6ZZcCeC6hTwpQHlPH8j5UnZZvmUeMKU3116tbXKswS1SLvV
         NflpyyKKwz01IhRZVIRE/BgHckTZlxvOZZ7L6cMwwR5I8mn6cnqISZjD1N75ODxycd4X
         DuxNHmqWusSR46rf7h0bZeQdGsCud6a+s23Jfy2QxAyfDnTHqODnLbHLp0Fu7N8ivHfF
         mchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769518887; x=1770123687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RTvkZrOVKH5r5YnMKGZsXCRnC/MuHEEKAUTbV8Xxg4c=;
        b=Cd1LAm6Ce00/4VoP9zvEhNMNCgi3woaw2aK6S2XtyM6yiPp/XCV6xHDKFjatqpVlcN
         3XFlwzy4oG6bm3b4ZkcAXHXMOdHIwZNUptgLFfPdFj1yOAkxvgkos0JEwngfZX1aY1MB
         C6kR9JX/jM8YiUgEtB1AdzxN/5CPu/4qpiKcusjFNvvUDs2cEflI7OU6tSTrqqIb9jXf
         3AHI4xLUwL2xDSnHhVpiB4kiil5LXBqPQHq52EztjvBNk6x1e6hLBwOuEmPDjvP21GQ3
         usioxenbcY9TJ31+uJNH4gedgp02PEOZOvPsHy5mgLSdMLJ1WEkkXrDtdSL7eUGXW8e9
         BupA==
X-Gm-Message-State: AOJu0YwQxPF4Q6Y8pcAOWrPzp2IafX6Ylhaw4M0oa3ezbTCXbGES143o
	jXCMzcE1fPiA4BXdtg87VAPwGP5/bazCKBtPLCQFj4tcEOr2bEyXfXEyYpGJwg==
X-Gm-Gg: AZuq6aIW5DYFeFWoDv+t9AJx70osJE1MYWZOaNJTHGaQ6WYAdNo+MNt7CojRTUvFogE
	+dXTCP7eVME1iKF/ExfluoGMfLlGiBnZykf1iK9cdFEVhcGAGcceVdzc1TnLKw63myf+pEDcBUJ
	cME8YVMmcLjLc7It6x1dJt4RaLZOrUFqsvSOxoyAAZmDNnLZQogmXrUqH74Xpf5fpJxyfRNrxtl
	nko9NcPuVS8aK8Rh9Lr2UcOhqugta9YyIRRtIXtkWDRz3YOz4biwH5dtmnOf1vbgpd9A0EaKkYG
	8ctn0gHesExEJsj4lrRHCk+is9Sh+u1xe7F/oN4TSRTI9zAFBZY9dY81+cZBS7bs/E+74Gc1Kyh
	DzQZosdaX/ObXmg3VaEkz4e+qs6C+XjehkhltbLb6Cm2VUTwA2yo4ZbirGqXNwWrm7h3iyHBByu
	aSpZAgn7z++jtXc0aFRrI=
X-Received: by 2002:a05:6000:2081:b0:431:771:a50c with SMTP id ffacd0b85a97d-435dd0a7a80mr2396654f8f.1.1769518887030;
        Tue, 27 Jan 2026 05:01:27 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24a8asm37671577f8f.12.2026.01.27.05.01.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 05:01:26 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][RFC PATCH 10/14] tigervnc: patch CVE-2025-26597
Date: Tue, 27 Jan 2026 14:01:10 +0100
Message-ID: <20260127130116.1902238-11-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127130116.1902238-1-skandigraun@gmail.com>
References: <20260127130116.1902238-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 13:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123949

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-26597

Pick the patch that explicitly mentions this CVE ID in its commit message.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../tigervnc/files/CVE-2025-26597.patch       | 48 +++++++++++++++++++
 .../tigervnc/tigervnc_1.11.0.bb               |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26597.patch

diff --git a/meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26597.patch b/meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26597.patch
new file mode 100644
index 0000000000..814d58adda
--- /dev/null
+++ b/meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26597.patch
@@ -0,0 +1,48 @@
+From ba8a4f0af806a1d078037f23c051253e9e2d7efb Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Thu, 28 Nov 2024 14:09:04 +0100
+Subject: [PATCH] xkb: Fix buffer overflow in XkbChangeTypesOfKey()
+
+From: Olivier Fourdan <ofourdan@redhat.com>
+
+If XkbChangeTypesOfKey() is called with nGroups == 0, it will resize the
+key syms to 0 but leave the key actions unchanged.
+
+If later, the same function is called with a non-zero value for nGroups,
+this will cause a buffer overflow because the key actions are of the wrong
+size.
+
+To avoid the issue, make sure to resize both the key syms and key actions
+when nGroups is 0.
+
+CVE-2025-26597, ZDI-CAN-25683
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+(cherry picked from commit 0e4ed94952b255c04fe910f6a1d9c852878dcd64)
+
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1830>
+(cherry picked from commit 8cb23fac62e05d7340e320b2db0dd3e8538d1fba)
+
+CVE: CVE-2025-26597
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/8cb23fac62e05d7340e320b2db0dd3e8538d1fba]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ xkb/XKBMisc.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/xkb/XKBMisc.c b/xkb/XKBMisc.c
+index f17194528..c45471686 100644
+--- a/xkb/XKBMisc.c
++++ b/xkb/XKBMisc.c
+@@ -553,6 +553,7 @@ XkbChangeTypesOfKey(XkbDescPtr xkb,
+         i = XkbSetNumGroups(i, 0);
+         xkb->map->key_sym_map[key].group_info = i;
+         XkbResizeKeySyms(xkb, key, 0);
++        XkbResizeKeyActions(xkb, key, 0);
+         return Success;
+     }
+ 
diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
index e97f82f6e7..caa44ea0d6 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
@@ -29,6 +29,7 @@ SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.11-branch;protocol=ht
            file://CVE-2025-26594-2.patch;patchdir=${XORG_S} \
            file://CVE-2025-26595.patch;patchdir=${XORG_S} \
            file://CVE-2025-26596.patch;patchdir=${XORG_S} \
+           file://CVE-2025-26597.patch;patchdir=${XORG_S} \
 "
 
 # Keep sync with xorg-server in oe-core

