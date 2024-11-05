Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6596FD2C11E
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:11 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.19628.1730817427009057719
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eYYbkIQL;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6ea8419a57eso30390367b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817426; x=1731422226; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eyXl/iorUQaw6Xiay7VJfMGBbNWpZr9sljxFLq6aYfQ=;
        b=eYYbkIQL45MZN6edmmda8wmVJjIUmyrcPR3Qq/HzvyU0rwOUcWD4InoA9HtSapu2V1
         eQtN+28U7f/AjpeBG99/8OSD2bWChDVWOecNoEmYOrrVf5Ipx4ChnhGaVYi7UvMRm9q0
         5YpWADcXWhtGvPNjOUXn7VpBRsa+ax26Hvpknxfxa3w9snfGiK6ZiUnPJaVV8PJ7GeXd
         eYeOxjWnhToqKvxES8+4aC8rWIelnxZ51FrE9itI1ztR0YZ8vM7L9uxI5/IuD3BSXDum
         pkE1yluB8uW/KcmS7njiWACJRJ8cCmXy8rhtuDGoG4Ogsl1/0PXXVT6ZQKsXL006mqKW
         vpOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817426; x=1731422226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eyXl/iorUQaw6Xiay7VJfMGBbNWpZr9sljxFLq6aYfQ=;
        b=Upuv0ee3RUQZahCcrCNwBv4MFDB3kUUJGT3cbLD8kTqEDZo4VmuTt/QC+/LweoDFHj
         YVKSxfnucenukMX+dhCN0cD33sh5kmqeraRz5//JysN83SaZCpyoeHlVs8/BLjbeb1EI
         2M+KWux1Kbc7MWgw04rPmdOlxiblLwsyGjkHRI9vNvmriFmV9RnTyLj5cVcyxbEOGy7+
         FoR4QtOhQJbbTlkbsgNv+6K9QXk1uxL+rvs5rrLCEF6vbxv0uYVLe7QOABMg5gkRf4zF
         LSrpp4TXzrOu71qKYR18xcfniB95BY0yIM0phzW5KX3bN2WbyVZY8J+Rz5FyfYDXVY+L
         E3ug==
X-Gm-Message-State: AOJu0Yx7XOo8/diwOObSVT26GCZ361btZcYcynsoRgvDYKi5Pi6W0m8z
	ovjOO7wPDYuugPcZ1DkupmKnYQ19QR7vsDcPjIUWMrgB1dv9i8Uwg+LUIQ==
X-Google-Smtp-Source: AGHT+IFD28NnpVFPCzBT2IT4Ccg9pAt42YTH5vqjherXrP6DzAGnG3DL/3g/JzpcwpwkkXE+HbdaMg==
X-Received: by 2002:a05:690c:3184:b0:6e3:5c5c:215 with SMTP id 00721157ae682-6e9d8b063a5mr251213997b3.37.1730817426055;
        Tue, 05 Nov 2024 06:37:06 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:05 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 58/90] audit: fix build when systemd is enabled.
Date: Tue,  5 Nov 2024 09:35:23 -0500
Message-ID: <20241105143638.2301245-59-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113476

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e68145b00260fc380242cd67579068427e501c10)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-security/audit/audit_4.0.2.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-security/audit/audit_4.0.2.bb b/meta-oe/recipes-security/audit/audit_4.0.2.bb
index 6bb8a2c703..4f1507923a 100644
--- a/meta-oe/recipes-security/audit/audit_4.0.2.bb
+++ b/meta-oe/recipes-security/audit/audit_4.0.2.bb
@@ -93,7 +93,13 @@ do_install:append() {
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         install -D -m 0755 ${UNPACKDIR}/auditd ${D}/etc/init.d/auditd
+    fi
+
+    if ! ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         rm -rf ${D}${libdir}/systemd
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${B}/init.d/auditd.service      ${D}${systemd_unitdir}/system/
+        install -m 0644 ${B}/init.d/audit-rules.service ${D}${systemd_unitdir}/system/
     fi
 
     # Create /var/spool/audit directory for audisp-remote
-- 
2.43.0


