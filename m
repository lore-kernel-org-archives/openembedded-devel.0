Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2BFFC44500
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 16:22:39 +0000 (UTC)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20724.1782663754029227291
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 09:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ESKP+Vfc;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3078e0dcd67so4380042eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 09:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782663753; x=1783268553; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9hyYSklcCflKTxv8bh9uAZPuPsK8GBvhAT+hiW2+iWU=;
        b=ESKP+Vfc83rGBkQxWwCQ5By+Wfqd4KAccVEBXoY3y/jiOnrzLKGmWhlNSoH6nB2NHk
         0HYmn8xz6v1R1DNcHdGnMnYl10JRpS/moEJaSt1dKLtM4WkCTERzc3XeM4zJ4VqtpMks
         qc+4oP3E1IRNkgj18l32h3COV5RI7pP+s5/00CGgCLirqUs5+3Mso4LhcudfBFsDg16i
         FhyaCGZ+d/lnVzp7abGjf7TkLwq+DobkstsR1mH6jOApPUmDGdQom5WyTjqHDAwAoEIA
         Gu1SBJAG54RNeR6Khi244IYUS2px3vKr7HT5hY0G+3sPpCtJ+9ksrvgHKKEpexCe7p7I
         o94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782663753; x=1783268553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9hyYSklcCflKTxv8bh9uAZPuPsK8GBvhAT+hiW2+iWU=;
        b=MbP4TE1VdIJ+a+rJpq8ITbX+o3vZjR26R6HG0NqcFWnYZAaAyxHCmMvd2e9oRaaZi+
         VbAtmkuQu7fSYQiIqdEIpfS8gGGOI5jv005qvkatezbGLEWXrhpIDkX51I99D+W5UGiE
         4T6S2wn63sP4drvAicTbyGz8i8vq8Zv9QgxdSeows5exDsu/Tf1B21v9E79Ry76Y4HD7
         l4NFqyP2MUBiE7r4FoX0fWBy1tqXIfZnxZeh1mNzdveLXbHh0p99SHJKJTXwpzoZcGg6
         15KLCDQ6cyWbFN4yjI0pcn2DRjpxAdgIYgDrnqqQV15FwAC6SN8JkwKOAMGmVvk/BIVL
         Cn1Q==
X-Gm-Message-State: AOJu0YzRnqHfqQl9JbBS8foxtb4EFrbwcPwZ1S54okScklE6gg6z8vox
	f8BV7HsG15D5CSXqLLEf/Qib0ybN3eSZEVQC4hPdqfq6/XIY9ShPirXnSQ59Qw8kQ7itCw==
X-Gm-Gg: AfdE7cnZ1CqkrI6+mZxqo1W0fU/W2+2bjgkOT9Ev3aMvJFk3NpO/ulJeZOhwcxODSTc
	MhxZhHI0j/YOxh+SSKFj5IrrPt/iwi4xEblXhmRvCGGF+x/A3S8PkB3soyMwF/Ih6LP3JPaeuiS
	sxqMWJsqt90EoyamMaYJY0Gh3ABScRpBJCG9SYnnYKYAQqMEIMU0hSJu2iFJmRjlJ7mvBQ57XWi
	cNJEGjF2kkkVunh4R5aR0NSyhtlX7TqN91SUHdBp/Qfsg5dDnI+I77kSYmPRLWFLU3QUIPjmSz9
	KfUPqq0ZbU1+JoOr8h2p8v7/0Rm0CAImVNjDB11k8qwXFaG82oq/AR8GfMRP22yJ/yNWLegBjRf
	VgDjn6elJpPyQ+ejw4LsmMSr6iyzrZfDHMeRhjlsLvA1J9O1tJKGE6bGEOcGb/7GOb0a1cy5XUm
	kjUUfORwYSpcFteDVS39IKVrgplb8hIQ2oS/99k72Bv2vx0p092h8ONfJKlkUMHitkAr3zSxDcS
	2Fyvd0sLKMeQvfh00YGeiF4m/E7QhKfSr1lnBVgdEQ3IQXoDeq4VBS4+zeu6D8zmpb8q4ecURKG
	hhlbtd68UU6u6XFkOif7Lfxw7hocyI1SclUdqhas
X-Received: by 2002:a05:7300:7b8a:b0:2ea:4228:ab11 with SMTP id 5a478bee46e88-30c84b1df71mr11834039eec.3.1782663753180;
        Sun, 28 Jun 2026 09:22:33 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c591sm49849445eec.7.2026.06.28.09.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 09:22:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 107/128] gd: guard GCC-only -Wno-error=maybe-uninitialized
Date: Sun, 28 Jun 2026 09:22:01 -0700
Message-ID: <20260628162222.4081517-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
References: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 16:22:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127917

clang does not recognise -Wmaybe-uninitialized and errors on
the -Wno-error form under -Werror,-Wunknown-warning-option
apply it only for the gcc toolchain.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/gd/gd_2.3.3.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/gd/gd_2.3.3.bb b/meta-oe/recipes-support/gd/gd_2.3.3.bb
index 884a2b54ac..e7f8b56fd7 100644
--- a/meta-oe/recipes-support/gd/gd_2.3.3.bb
+++ b/meta-oe/recipes-support/gd/gd_2.3.3.bb
@@ -43,9 +43,11 @@ EXTRA_OECONF += "--disable-rpath"
 
 EXTRA_OEMAKE = 'LDFLAGS="${LDFLAGS}"'
 
-CFLAGS += "-Wno-error=maybe-uninitialized"
+# -Wmaybe-uninitialized is a GCC-only option; clang does not recognise it and
+# errors out on -Wno-error=maybe-uninitialized (-Werror,-Wunknown-warning-option).
+CFLAGS += "${@bb.utils.contains('TOOLCHAIN', 'gcc', '-Wno-error=maybe-uninitialized', '', d)}"
 
-DEBUG_OPTIMIZATION:append = " -Wno-error=maybe-uninitialized"
+DEBUG_OPTIMIZATION:append = " ${@bb.utils.contains('TOOLCHAIN', 'gcc', '-Wno-error=maybe-uninitialized', '', d)}"
 
 do_install:append:class-target() {
     # cleanup buildpaths from gdlib.pc

