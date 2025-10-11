Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0043CCD18C
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 14:28:33 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.838.1760192904214663562
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Oct 2025 07:28:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M8Aam3Wr;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-63994113841so5285313a12.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 07:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760192902; x=1760797702; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vIJexefwNfb2x8SAWuFijxtH1Rc+KuWzRkWBd+5d7IM=;
        b=M8Aam3Wr0XxxJsTrG1ZzUOpFn8SHE4aqZlswlMrTvy35LMPMEm6fs0Z9ft5+gGIiWu
         vmJV0eWj3C7KysZvTM2DtjYn2EpKKyeAC/xe+hkihLDMtSimR/MIM5+59y8hSXoNfuKb
         lXQjms4xZdao/v9uAcLRsTMo+9xkCNObcLvaxryJf/29y6T25B8BqCIOuupZ4e/mhgXz
         rzG7bmJEeIQtJqWGUoTXVujpMjv5CTESwUw7zn5jGt6t3zha2fPDDh7x4ALnKQa4n/i3
         ZmvnaAOqPdxFThluvhwg3W7+4qoMcb63+dCiAMbbaO6NGF4tiLVBqzjDKpEl+rM0o3Vy
         kQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760192902; x=1760797702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vIJexefwNfb2x8SAWuFijxtH1Rc+KuWzRkWBd+5d7IM=;
        b=OzQXS+57Tw3FmY0EQlyxKbN5Pn6QSb3TEbHjCaFfdmDOdRKGBfzNR6rzyOa9fyPZMo
         Q4r0n550hLZThYsxxXT6pSYhKSD9qmpze7xiPvagyg3CUyeE9ZTLNCrWKN4ew118XYuG
         iLrFxcKrTY64NeS6bud+QOZ6Pb2JSgLgAngrPqRtN3BzRdvKcZLOZEK+6Vyd0mgT5h2U
         vBSVYl9wk0Hu8+LYpNsPWvXwWyqvGh1GETZzfBBo1fi0w72PJVaIWVVm49Gp6q8ej3vx
         o3D8dcnZYwsZrLp1ChpSnvqoiayszQK3J76SBI9BPl4doq1SQj1Q8m97zLMhORjYNRtn
         JbSA==
X-Gm-Message-State: AOJu0Yxq+yGujlipvnG/lzO1LJC1KL9qk7C6rCZ+O0OlpSWyQEYeRbm4
	uCa5i2Qcpz820x5nK/Mot5clU1UowlKE2cvJgaAKcT307hbGTRe/bYQrbKDBkg==
X-Gm-Gg: ASbGnctDS+HbWkstQ7zF7ja4n3adnMEwoOsYFNt3DYCwdz/U/suHoqYIfD5SVP/pGBU
	kjkPJ/p6ue49XKobU2A3am9e9INl3ShEbarQ6jrbN6cP72wld0fiX1tc7tCBT4/kzOl0e4XrOxL
	TlurdCjxX8ciBF6swtwwqjUdWWPR4w/M9IEjXLsAKtXraCx/RApzTgzOWt5AS8ygquuWSt+euQ8
	OYlhYMKG2QsC2G6iP9hZKakDOZg//csATxBcyiRpEYLvy4RQafQNG0/DvXBcCoVKGNaL5t1DBdX
	b30wbRyx1hIhA5oM+nnxyV/57NSYjVa9yKxjOG5i/yDJJrVgUDSLzUJhIG+IyNTbjNOuiS0WvKl
	9U2eEJDjE5z0KKYh9Wy1AX2If4IfX5BjC1JrA5yo=
X-Google-Smtp-Source: AGHT+IGF6lQzMnqP5kBDgW484MeXZiSqs3lnm071lxW7DZCwz8baH+X3kcPxicuvMr+h1GRrOSLpww==
X-Received: by 2002:a05:6402:4313:b0:639:eed9:14c7 with SMTP id 4fb4d7f45d1cf-639eed9eae0mr10509634a12.15.1760192902439;
        Sat, 11 Oct 2025 07:28:22 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5235e7fasm4878620a12.7.2025.10.11.07.28.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 07:28:22 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] freerdp: mark CVE-2024-32662 as fixed
Date: Sat, 11 Oct 2025 16:28:21 +0200
Message-ID: <20251011142821.2861802-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 14:28:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120498

From: Peter Marko <peter.marko@siemens.com>

2.x is not affected, bug was introduced in 3.0.0.
See e.g. https://security-tracker.debian.org/tracker/CVE-2024-32662

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a7f20510686d181b236eb78d79dc2a56bb4c3bba)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
index af185f6191..d0d7d28b55 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
@@ -92,3 +92,5 @@ python populate_packages:prepend () {
         description='FreeRDP plugin %s',
         prepend=True, extra_depends='')
 }
+
+CVE_STATUS[CVE-2024-32662] = "fixed-version: 2.x is not affected, bug was introduced in 3.0.0"

