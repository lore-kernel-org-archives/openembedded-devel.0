Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 935B4CCD184
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 14:24:53 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.736.1760192683846516197
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Oct 2025 07:24:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TP/uJ0L4;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b3c2c748bc8so406817466b.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 07:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760192682; x=1760797482; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=guwsRAntowyve1h+ZBQNtJhm6uHw4oe7mkMXFX8PVzk=;
        b=TP/uJ0L4m5URYw/IQHid5uQxsB3XXOaxEZpZIyI3orkvoa7oOlLnKulefkA8QFn7Ej
         1Qkrf03IMv/N+h+nQuxSoreIC6vUWNp+p+XJAXjtB0ulw216/SDDp8njIUtdm9L5CzKy
         z8oUsinIDH36Sh35i1CsJFTJj9511b6fnIhL5B+SAEBPlnoHxoaY4Z5Vkb2LIecEjQNi
         rtOK0ARvBmqkTfI5Z3hPZJRuaiJ/yKJyGQASVcHw8tY7Qm2AM/3mnZ+uUVoubjn6HCwy
         LcEMidoA0llg6ZGbMjuWQ2tR2z1jREbAW5npdioBhrSarZkxlqPAvnsChEX8YWl3YSuW
         m4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760192682; x=1760797482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=guwsRAntowyve1h+ZBQNtJhm6uHw4oe7mkMXFX8PVzk=;
        b=V+zbD9Ry7wBMsI4DiRY347Uct1lqJ4VDp9cF/1ppDWHnQmPtPemgBHd478eSsNdTdI
         fdMtcxv8HxwFHQJKhR4fx4oPkX1YB6e8LDAPw5T9B/p3gSIYUzRRk1aYLNomK3Y590Yi
         TxLiGob6uj88+MjkxQphJ99Pfgkjvxqbe3imoFElKLNEl86o5o2SlFjjd8Lluwg4+1E2
         uawPWGqbAqy7/gWM/oj3xS0iEOAJZcOOQ7BeZjV252V4NBFNiap3/jOqt4hNPXzIk0b0
         3hmRClKe42PTuoT8+X5PdYm29iwL9f6LCQdbr4D1GLRnRQzjPSqG/IfN02ZFei24y82G
         +/2g==
X-Gm-Message-State: AOJu0YymZgb7aqtj0oz/Bw4e3p3GW/UNBbH+qUf+Uq1K9xBz8MTMTtuK
	6zv8rai2gYF+nfdPf7IEOVwAcScFtI47+mR1JooZFwaUdTQqqSYv0wttjacPag==
X-Gm-Gg: ASbGncs+1SAMJLsuZ6xm6mdfY0hMW2vpuzWPa5jq6f7WnXaUGn8hkY358emqbpeadAK
	xmzOQxnmTIUbTnhgUfcS+i4jjU1AkjOuykvtQxyIesXS5T5BtQAZuBmpa1uZOgHwSP9SxYeJeWD
	5n+LMCMxnY04knbFhh6YuSSQOjW4guC2ZIzW53dG55ED+xd88gFr+qLTQBvUmzl5BuvX/H4q+K3
	JkLtbK/4/4KpNVD/SgEG+tdV6va+xP+Cju+etuiboeTBS9W/OYGGDcneB+zJtOatNGE0uysaqtb
	4OC9V3HU2cQQbB4ugwtsYWnjn1d3TdcAPYlEq8KD4p3ws7VE6ZYXxy7lfL3UksN1GmOZRgRwXsP
	T8hTTYwIg3dx9YVeoukr93yfzfsv6bKi53oFGY5Q=
X-Google-Smtp-Source: AGHT+IFnWmpvqkihQtENkUJOY+lEMnpimvAHBMPHJjST/fA+M6EiTpgaPemoEB+10tGEI8UUKopfcQ==
X-Received: by 2002:a17:907:96a9:b0:b33:b8bc:d1da with SMTP id a640c23a62f3a-b50aa491efcmr1653702966b.1.1760192681859;
        Sat, 11 Oct 2025 07:24:41 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d900e432sm478708866b.65.2025.10.11.07.24.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 07:24:41 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] freerdp: patch CVE-2024-32661
Date: Sat, 11 Oct 2025 16:24:40 +0200
Message-ID: <20251011142440.2790840-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 14:24:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120497

From: Peter Marko <peter.marko@siemens.com>

Pick commit [1] as mentioned in [2] or [3].

[1] https://github.com/FreeRDP/FreeRDP/commit/71e463e31b4d69f4022d36bfc814592f56600793
[2] https://nvd.nist.gov/vuln/detail/CVE-2024-32661
[3] https://security-tracker.debian.org/tracker/CVE-2024-32661

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c91d6a2c6574d828f249b85dcae50462ee3aacb5)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../freerdp/freerdp/CVE-2024-32661.patch      | 27 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp_2.11.7.bb |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32661.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32661.patch b/meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32661.patch
new file mode 100644
index 0000000000..002135b5e4
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32661.patch
@@ -0,0 +1,27 @@
+From 71e463e31b4d69f4022d36bfc814592f56600793 Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Sun, 21 Apr 2024 13:56:13 +0200
+Subject: [PATCH] [core,info] fix missing check in rdp_write_logon_info_v1
+
+CVE: CVE-2024-32661
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/71e463e31b4d69f4022d36bfc814592f56600793]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libfreerdp/core/info.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/libfreerdp/core/info.c b/libfreerdp/core/info.c
+index 7d6eec137..3395e4d2e 100644
+--- a/libfreerdp/core/info.c
++++ b/libfreerdp/core/info.c
+@@ -1322,6 +1322,10 @@ static BOOL rdp_write_logon_info_v1(wStream* s, logon_info* info)
+ 		return FALSE;
+ 
+ 	/* domain */
++	WINPR_ASSERT(info);
++	if (!info->domain || !info->username)
++		return FALSE;
++
+ 	ilen = ConvertToUnicode(CP_UTF8, 0, info->domain, -1, &wString, 0);
+ 
+ 	if (ilen < 0)
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
index 37a28bfecf..af185f6191 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https
            file://0001-Fixed-compilation-warnings.patch \
            file://0001-Fix-const-qualifier-error.patch \
            file://0002-Do-not-install-tools-a-CMake-targets.patch \
+           file://CVE-2024-32661.patch \
            "
 
 S = "${WORKDIR}/git"

