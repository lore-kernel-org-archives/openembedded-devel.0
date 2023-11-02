Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CEA0C4167B
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 14:05:38 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.31697.1698933930867800326
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Nov 2023 07:05:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=L/2SHIaK;
 spf=pass (domain: konsulko.com, ip: 209.85.208.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5409bc907edso1577015a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Nov 2023 07:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1698933929; x=1699538729; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snocGhNR7qg2HtShlTHqgWXGMIha++MSuYRIeSHrj4c=;
        b=L/2SHIaKD1CEJup/EQv++FieyVy8tDmHelvhExISC63r4h5MU5G8fz+yQ2UkMMr1OJ
         87o9kIXRX06jmj3W/Zu1PY/syH5SXk57aeJD0XPwOeFLUUBNhk8Om+zfT0bvtvH8FFdX
         RZcKKdAK8em+ehx5StU4i9oZAeLnQBWBL+3aQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698933929; x=1699538729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=snocGhNR7qg2HtShlTHqgWXGMIha++MSuYRIeSHrj4c=;
        b=ATn5maZ+6SCGKv1d4lUXfj3r9LmBRwnjllc5HhkQPlWJW31E1blVtwVV2sqaFboC6F
         dKw9LyxuRqm3VFEgiZxMdDyyxcbWjpyeRPEtTCYZ+2vdCIUs2hF1a2KhK2e91EFfjdc/
         ctU9RWEK+e5zBxVAtboejJzcdszUTySMNt1XWbcJFCcVVqAoGwX47Mye5rOabNKI92xC
         SfchAAPec90qt7XiA61voLgnqn9gXFTaRhNcBUMn++xnm8v3SFe+cDwtZPKFcD85TRV9
         8MWJGy4xo3KvUjFBNul75MviHlomGYl+5wZ5bAXh9gT9vRdej7raIaXLPNza7QUPyLwX
         wKNg==
X-Gm-Message-State: AOJu0Yylvzd9grOo+s6z//PsusI72MfV6mypcn0DVjAsArLjDQqmeP/i
	weROdbWgYvT1TuV1ZZD9pnhNsSVeta9+8obsAW0=
X-Google-Smtp-Source: AGHT+IGd9dL5O7c0S1BLQLkpJwhFGg4MgnKzJ8JbZns4oZLCAA7Myi/4LiPEFtI7tibEz0SmhW/hFg==
X-Received: by 2002:a50:aada:0:b0:543:75cb:2149 with SMTP id r26-20020a50aada000000b0054375cb2149mr5445910edc.38.1698933928836;
        Thu, 02 Nov 2023 07:05:28 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id d5-20020a50f685000000b005401a4184ddsm2401763edn.27.2023.11.02.07.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 07:05:28 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/4] python3-pcodedmp: add recipe
Date: Thu,  2 Nov 2023 16:05:23 +0200
Message-Id: <20231102140523.3337713-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231102140523.3337713-1-leon.anavi@konsulko.com>
References: <20231102140523.3337713-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Nov 2023 14:05:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105841

Add pcodedmp, a VBA (Visual Basic for Applications; the macro
programming language used in Microsoft Office) p-code disassembler
version 1.2.6:

- Some cosmetic changes
- win_unicode_console not used when unavailable
- win_unicode_console is now used only on Windows

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-pcodedmp_1.2.6.bb                 | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pcodedmp_1.2.6.bb

diff --git a/meta-python/recipes-devtools/python/python3-pcodedmp_1.2.6.bb b/meta-python/recipes-devtools/python/python3-pcodedmp_1.2.6.bb
new file mode 100644
index 000000000..185597dea
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pcodedmp_1.2.6.bb
@@ -0,0 +1,12 @@
+SUMMARY = "A VBA p-code disassembler"
+HOMEPAGE = "https://github.com/bontchev/pcodedmp"
+LICENSE = "GPL-3.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=84dcc94da3adb52b53ae4fa38fe49e5d"
+
+SRC_URI[sha256sum] = "025f8c809a126f45a082ffa820893e6a8d990d9d7ddb68694b5a9f0a6dbcd955"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE="pcodedmp"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


