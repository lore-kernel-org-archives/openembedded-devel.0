Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1948BCCF2D4
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 00:41:35 +0000 (UTC)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24904.1792370494098691971
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Oct 2026 17:41:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PBshphDM;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35d7fa491deso1807762eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Oct 2026 17:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792370493; x=1792975293; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L3bgMi22A0Pf5hUcPYh8M4iL5EuTHnF2WQfJ9fwCXMg=;
        b=PBshphDMiXvhJgIEruD+xtwHzwyCYsPBYUiO25Eze/N21Ijd/usw0T1EkiH9yoIrDN
         YGsSYqj5MrZ509r/P1LMN/VwJj8BuWGRtkrNthDxEruJl1E83eIuowxSZI92KS90mrYQ
         ihn6TlB0AD/YRivkxQPmiH+jT6Ygym7rzj69ao78MqJo0KxdslWXITycalWURXDuMCkc
         EW9k0ypYq6KY7vDtht0nNDBvt3pz4KgOkdMTuQfs15GI59EOI8EtUKB59XWFa76v8Cur
         FmB26UaX3buw2YwxKXwtjpc4bIxz7psLi57jgS/l8Md52X4geofI0fxV4bbKqeCZanaI
         +jYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792370493; x=1792975293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L3bgMi22A0Pf5hUcPYh8M4iL5EuTHnF2WQfJ9fwCXMg=;
        b=NDqx3WuVtNg/1yOSWSYGBsVxM3TKMrCAVJyuco1+ApDT26CLtvk7n99e64iaSrll4I
         hPkR6ZjyJxUu2wuWaxzX1orsHwzA14E8XaTmGaNzVK2EGYQfNcM6CX6F7PNILl0ZjmNO
         sK0PnUQKAVKJ6g5oK00BkxeZZh2TQpIoxB4Ia05KPfWQr3AJPJLuFOY0N3zQaM69CVAo
         HavCXP25olHVzHAPc+/lIe+OEhtmASxwcInWxWRYUsmrHTbgtNmgZOWwxv8n+itgbT24
         MrMcWgv7d5/6INYfTO537VfUgLHhyPjg42A4pg57gX39jemjeuxcy2CwsgrtOOdx2kAT
         7dag==
X-Gm-Message-State: AFq9FYKs+mleFsWf+Q8eUS8MkAkOwlj1cwAO9A6w1Lmp5tTMtdX6VliS
	m0W3PU38y935uTeAOlva9OkRvLiYujJ4C7cwK3n2oq16Tp9zQNo42EAaIxarEgchPiI=
X-Gm-Gg: AYBFou0dSMj7/M7HrWd84BpzybHCpk5jeWZECOSWBuhHcbLQt1iuMWcz6z3vXXRYWir
	K42/E2vjWOXny/eZLHZJJRRCf+74ihCqcdrhx6E209YpMzb+4TA92pe7IVNjuNrqyLJAQF74HlJ
	BBaG6dTyI4HucajbWigRH8rD0ZuyE2jhuykwuzIsJWdhY0kqcCgaFNliM9L4QNrNP+XIVaWeIz/
	HEsNPGDUCME91gtgCwtFzULpDAVkbB2yxiM8yKmnoZ3UAXuLiqS8Cz19MmPjGgQtBV/MN+5hzw8
	p/WkrXp+FWFPXDjKr6xfCzwGQ2NfVm52dJlS8I9jYwkIra9dAED7CZzHzVaL6G2IVHeYt+ihaS4
	PSqG6JsZXrUZvcOA9hKfsUTMoFwW2bVX5Bbqpm8z37cJbNe2+BOC+0AAU+uQVSrIh22aYlCVHxq
	Kd+0E1923xYWYnLebG/ZWd0vaths8/XkqjUo7u2JywuhjDPzTw44miF0lD6dK6k87YZIaTxDUVO
	Jax7hTUzoth81kc5WJ8c4waUKWwTPsRr5LJNSwGgIO2mJgcmxdmTrE+grl8/9/7PecNUDNK9otY
	VkwaBz0m/wff0ascvVcqyaIerQ/NHMgaUkgLhN9zDmxSgqAy1/k+w+e6eNYkANyjvzGozqnfB39
	LmLvxvhmZfMKruluRZO/VXV83PCh8Up4Rb+6AIIGwC0AiPjifuaC2hCBcNRQjr4M5BqtLTTD+si
	l2dHeDfrGjQmkGuUFY6ENSeMOjfqiuagwfTRDf32/LDtcOsg==
X-Received: by 2002:a05:7301:9a82:b0:351:2f0a:cb2a with SMTP id 5a478bee46e88-3602a684494mr11432480eec.2.1792370493287;
        Sun, 18 Oct 2026 17:41:33 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm45211774eec.28.2026.10.18.17.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 17:41:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 8/8] ptyxis: Fix build with musl
Date: Sun, 18 Oct 2026 17:41:22 -0700
Message-ID: <20261019004122.2475327-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019004122.2475327-1-khem.raj@oss.qualcomm.com>
References: <20261019004122.2475327-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 00:41:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131107

W_EXITCODE() is a glibc extension that musl does not provide, so clang
fails with -Wimplicit-function-declaration. Define it when missing,
using the glibc definition.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...n-Define-W_EXITCODE-if-libc-lacks-it.patch | 33 +++++++++++++++++++
 .../recipes-gnome/ptyxis/ptyxis_50.1.bb       |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/ptyxis/ptyxis/0001-application-Define-W_EXITCODE-if-libc-lacks-it.patch

diff --git a/meta-gnome/recipes-gnome/ptyxis/ptyxis/0001-application-Define-W_EXITCODE-if-libc-lacks-it.patch b/meta-gnome/recipes-gnome/ptyxis/ptyxis/0001-application-Define-W_EXITCODE-if-libc-lacks-it.patch
new file mode 100644
index 0000000000..bd7ccc0f01
--- /dev/null
+++ b/meta-gnome/recipes-gnome/ptyxis/ptyxis/0001-application-Define-W_EXITCODE-if-libc-lacks-it.patch
@@ -0,0 +1,33 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sun, 18 Oct 2026 17:40:00 -0700
+Subject: [PATCH] application: Define W_EXITCODE() if libc lacks it
+
+W_EXITCODE() is a glibc extension in <sys/wait.h> that musl does not
+provide, so the build fails with clang:
+
+  src/ptyxis-application.c:1926:34: error: call to undeclared function 'W_EXITCODE'
+
+Fall back to the same definition glibc uses.
+
+Upstream-Status: Pending
+AI-Generated: Uses Claude Code
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/ptyxis-application.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+--- a/src/ptyxis-application.c
++++ b/src/ptyxis-application.c
+@@ -26,6 +26,11 @@
+ #include <sys/utsname.h>
+ #include <sys/wait.h>
+
++/* musl does not provide W_EXITCODE(), use the glibc definition */
++#ifndef W_EXITCODE
++# define W_EXITCODE(ret, sig) ((ret) << 8 | (sig))
++#endif
++
+ #include "ptyxis-action-group.h"
+ #include "ptyxis-application.h"
+ #include "ptyxis-build-ident.h"
diff --git a/meta-gnome/recipes-gnome/ptyxis/ptyxis_50.1.bb b/meta-gnome/recipes-gnome/ptyxis/ptyxis_50.1.bb
index 5b80c7dd15..15a122d704 100644
--- a/meta-gnome/recipes-gnome/ptyxis/ptyxis_50.1.bb
+++ b/meta-gnome/recipes-gnome/ptyxis/ptyxis_50.1.bb
@@ -19,6 +19,7 @@ DEPENDS = " \
     vte \
 "

+SRC_URI += "file://0001-application-Define-W_EXITCODE-if-libc-lacks-it.patch"
 SRC_URI[archive.sha256sum] = "73f4b76480644b2840415859a51d20cd7487b0619714f8defcd38212c3ddcffe"

 FILES:${PN} += "${datadir}"

