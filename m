Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C81D4CD4F4B
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 06:20:35 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17716.1763014833751141606
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 22:20:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RUxfbrm6;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7a9fb6fccabso337725b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763014833; x=1763619633; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KC2y1P7ffm+VLphuRFlhxI7ukdfNgasN2V6QUony/I4=;
        b=RUxfbrm6HidscoeIXXABgDUBM0x2vcTsbDDH279z79zK9ll7ccXC/c1BFTiws8HYFb
         /rGR+04v6ms0qZJagVNKF3JOG+Dm/ze6MtYNNFCa58+9f3ggr/bhf0385vJXTHGzq+m/
         sCeaN/Xrhbr9yOxqeQKHvfe69MU3ktbf06jh3BThE8fOgXXfaD4nw28mKSUm4UWHsmoD
         8nSjCxv0Rv7lb865rM80zJDPsVqipQexRD7c2eaTU7HMtM9t8FSuMrRnPjNOWq2DqWZO
         nnUrkFgwF+KTkUVnv3P8EBfcCIZlP2fHbNLjvXPTYT4LMOSi+uQuE6by7w1ig5GuT3Ih
         rojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014833; x=1763619633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KC2y1P7ffm+VLphuRFlhxI7ukdfNgasN2V6QUony/I4=;
        b=FVhcVzpWUnSXE8Da8rn1wJfplUIijmXyvgoDQ5/DsED8R7KFsn92NYm56z7C9czO5/
         5hQ+nJGppNp+dOgXdmQutgS7TR0Or1zyRyTRr2n48HUCqqj0udjcshk+Ri4pH374F5be
         ua0v/8OWegackKLATItWH7a84aHLdclxsOBvaSIlAQWYKzuxNfIRV8KsGHGOAQLnyLhJ
         NL3peTExPbJwZC7bxq7lJFeqViEkNgKbaoz6CPrSvqciQZth4lrnpD+0gXr6FO/rMPco
         T3QVAiZlmpQgWMmQXGxPG1NzzQmh5F63YkT1jJS3zz4LhYDjNev7m4VB7fJk10R2l3US
         Qn1A==
X-Gm-Message-State: AOJu0YxQXVrKbWy5mZ5/JetZC0oP9yX9sSmCc8RqGrOWVRfHeAkuD+ga
	Q1H0Ybdm+BHhfElGiDrGhtXiWduA4cHmu2OI+f6yWt9C1EaplegUWJ+coxkKXQ==
X-Gm-Gg: ASbGnctwkf+LQ22DcwkC9npSkmrFA3Xd7GHoXIDOzmbylZ1RBwyQYf0b9IXE4zP950y
	+a7eB/vR5aoG+AK1+VbAFId7Xo7KY4dmke3okxHTw6aFjlcbcPgU7uRfS1vuW8s+xhh7LJaUv1N
	UMVub2SURuhP0t1ccxle0GY0sH+vM+M8Iqrqm66N3km2/P/EYMn+iZGqtFgC2z6wVAYwEmuw9Ft
	dGEa5ebvDrMhaKg/QhgbSYmcK72OjVUMglE1c29Rj+F+hS470sVopueklqsLq1dR/r7oFdJR9Be
	3IgUI0UAnXH3aArzkcPFntnkbcN6c3pAmZ9k0vr5WeZlCi49UCHrNtk9lJaCsgsIoD1Nd2aq8LD
	948X1SqNtF9jRLhFalp6POMn6/DypEjdfmlvi2rikR2rZR/4Bc+B6SZViBtESh+hEQIRIhkWWF7
	iDQ4j1BtTbnGcUEA==
X-Google-Smtp-Source: AGHT+IHJa/DWW49xfA35vfmiML7/l1wXu2YgBtE6WVDtduHetMwFItjzgF29lObL/7HYSCdgN2Pg0Q==
X-Received: by 2002:a05:6a00:a46c:b0:7b9:4e34:621b with SMTP id d2e1a72fcca58-7b94e3480a8mr930183b3a.12.1763014833028;
        Wed, 12 Nov 2025 22:20:33 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm1000454b3a.69.2025.11.12.22.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:20:32 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 21/38] audit: fix build when systemd is enabled.
Date: Thu, 13 Nov 2025 19:18:56 +1300
Message-ID: <20251113061914.3756301-21-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
References: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 06:20:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121619

From: Armin Kuster <akuster808@gmail.com>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e68145b00260fc380242cd67579068427e501c10)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-security/audit/audit_4.0.2.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-security/audit/audit_4.0.2.bb b/meta-oe/recipes-security/audit/audit_4.0.2.bb
index 8a080eb709..93195c0eae 100644
--- a/meta-oe/recipes-security/audit/audit_4.0.2.bb
+++ b/meta-oe/recipes-security/audit/audit_4.0.2.bb
@@ -93,7 +93,13 @@ do_install:append() {
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         install -D -m 0755 ${WORKDIR}/auditd ${D}/etc/init.d/auditd
+    fi
+
+    if ! ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         rm -rf ${D}${libdir}/systemd
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${B}/init.d/auditd.service      ${D}${systemd_unitdir}/system/
+        install -m 0644 ${B}/init.d/audit-rules.service ${D}${systemd_unitdir}/system/
     fi
 
     # Create /var/spool/audit directory for audisp-remote

