Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2252C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 15:22:54 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.13456.1699370565578401325
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Nov 2023 07:22:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=KsdzfSps;
 spf=pass (domain: konsulko.com, ip: 209.85.218.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9dd6dc9c00cso611549566b.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 07:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1699370564; x=1699975364; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HirFTFp5cm9JtpLtW4EoizB6x+zMLDLEghvGIPTSIEg=;
        b=KsdzfSps5Xt6I2L++FR0gjWX/kx55iO41VMZdg2JSg1VkSzsbqoS50J6COm9KaCIiy
         eU7g/ofZ2kkmIKdLzqd5yj3YVu+5mI8OSmwQljUOD1buI9RwZPytVOvK94y5RRi5jJYS
         r94EeITomgqcQ2cbEuWV9zuz8ENZSipmzugMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699370564; x=1699975364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HirFTFp5cm9JtpLtW4EoizB6x+zMLDLEghvGIPTSIEg=;
        b=pbM/SdmI2vqm/6QAo8XtK318t3VeOhWPaRHh4/3mbn1JZkg7pi/81Q/2hWpAmkjA0L
         AmZX+ARTN9K67qF8tHMtnynok9clbP7U5M7TxUZ9EJiGW1XQHQw0NpDQUPGQDsaufO6X
         O1xNGmOWpPFU2QGFbHDO27nE/sGKd2U31ammPu22SA/Vb/Xw3JlRuyIe7nKWS8UZc8E2
         Euc0k/uivX4e2EK1jZOpXV9g08rEXXFgVxLXnc0lvvj/WflmnqfVrMyfVFZSbVjiCqIa
         cSaLPtXGOVBk8wGM9u9qVFa5QIjTASUuAYJg492PssoRqCl9Op9Df7Ch/81mmp6MwFTt
         LtCw==
X-Gm-Message-State: AOJu0YwPRXT1FuhD4pRs3Dr614ZZbAILXNOVytK9be2IngmP3VR7a/hJ
	oEvnfUseLHkJJQqKSW1ChUu2GFjRqvMJkQQFZhI=
X-Google-Smtp-Source: AGHT+IEGQM+q3D5Pxl/06MNksWr0SjROryk30pAXBQDIZdwpjG7MfEUSbAySwgUuuWm6GUj4wGnzVw==
X-Received: by 2002:a17:907:a088:b0:9e2:ac00:8fb7 with SMTP id hu8-20020a170907a08800b009e2ac008fb7mr1341301ejc.27.1699370563595;
        Tue, 07 Nov 2023 07:22:43 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id s12-20020a170906168c00b0099cd1c0cb21sm1136897ejd.129.2023.11.07.07.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 07:22:43 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 3/3] libblockdev: Upgrade 3.0.3 -> 3.0.4
Date: Tue,  7 Nov 2023 17:22:39 +0200
Message-Id: <20231107152239.2219002-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231107152239.2219002-1-leon.anavi@konsulko.com>
References: <20231107152239.2219002-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 15:22:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106456

Upgrade to 3.0.4:

- spec: Obsolete vdo plugin packages
- spec: Move obsoleted devel subpackages to libblockdev-devel
- ci: Bump actions/checkout from v3 to v4
- part: Do not open disk read-write for read only operations
- fs: Disable progress for ntfsresize
- packit: Add configuration for downstream builds
- logging: Default to DEBUG log level if compiled with --enable-debug
- Use log function when calling a plugin function that is not loaded
- lvm-dbus: Replace g_critical calls with bd_utils_log_format
- tests: Fail early when recompilation fails in library_test
- tests: Fix "invalid escape sequence '\#'" warning from Python 3.12

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../libblockdev/{libblockdev_3.03.bb => libblockdev_3.0.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libblockdev/{libblockdev_3.03.bb => libblockdev_3.0.4.bb} (97%)

diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_3.03.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_3.0.4.bb
similarity index 97%
rename from meta-oe/recipes-extended/libblockdev/libblockdev_3.03.bb
rename to meta-oe/recipes-extended/libblockdev/libblockdev_3.0.4.bb
index 99175e611..d6ee103bb 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_3.03.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_3.0.4.bb
@@ -15,7 +15,7 @@ DEPENDS = "autoconf-archive-native glib-2.0 kmod udev libnvme"
 SRC_URI = "git://github.com/storaged-project/libblockdev;branch=master;protocol=https \
            file://0001-fix-pythondir-for-multilib-when-cross-compiling.patch \
            "
-SRCREV = "38378931d285b91333ff2e2a391b1fe91072f9bb"
+SRCREV = "ec0120de06f28ecfc10953b712f7f42735787bcf"
 S = "${WORKDIR}/git"
 
 FILES:${PN} += "${libdir}/python3.*/site-packages"
-- 
2.39.2


