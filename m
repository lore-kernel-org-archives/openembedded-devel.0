Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C63CE7AD6A
	for <webhook@archiver.kernel.org>; Thu, 25 Dec 2025 19:22:03 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.143464.1766690516078039920
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Dec 2025 11:21:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W8ya6syo;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42fbc305882so3328395f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 11:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766690514; x=1767295314; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yi2BVDuzrG26X4sJ8cOvhd8Q6pfg3ExV0wOlswGc/zM=;
        b=W8ya6syoM5Xzkd9qisSrPjHyfrvJhgXdXPcAUjra7hd4gTRoyQ7ueBMnabjoFsdJOS
         5JBtzm4/jTSXHjRk/U+ifvBee6lqP7cvTlpOe8ZhogtZnzBMg9Euammu69f4AYKOAIP5
         lCZaMXjLVOQ6ZyaA6tlfa7o/SFQPh/K7b5L1wYGHTAkNByrw8fBQLR5M8rSvgv0jSSQJ
         Df1dtZMj3Lc73KZ34cUPtm5NtgsPfuer6ITrXBNvM6kyzl7tOkYtR7XXGxH0W17yv3hX
         KZyo8/0v/FGAkYXZucmv6dUG1LPXM7iuBU+YuBd7FoeBfnV5ec7m6EVIlUx9yHrGRfwK
         IKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766690514; x=1767295314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yi2BVDuzrG26X4sJ8cOvhd8Q6pfg3ExV0wOlswGc/zM=;
        b=YdGa5bNowJgDM2G4vj4jONqfGqjsC2laL3ST8rvjojuS7RXdfrHhLtR2e6Q9PqpcVJ
         3idMcn26HOaerHuhXOI1f6uxw4k+Kor1CqdP04v0yt0EhLsqKGdDiR+ZjjezwzR4avvv
         BkY72AGKoz32VoQORa4Jo3ieHdLYp19MIkpDLMowmbIfOeodzDDQ5KYpuAwWtfB5QtDJ
         Im145IG3I9wyqDp9CleCHTsVf6+CSSIIti0/oDJgb15/hlRjX3+OuaJgY/HhF19bmOJW
         0mqU86yd0Tweaic0Gszo5RZzm3MMQbcRJpS3hFGuVIoj7KqmTpXMng9IeX54UMMPrkuq
         uVLg==
X-Gm-Message-State: AOJu0YxNRJXos/W5EfIQSoDFKBj9VLzGh7F7diM8xPZNs0Iwikei3E67
	VYe9hH3TU16KAEQEJSkYY9QToGctmGZho30fxaB/FtmbLdGVXJEjYbtrcAcKBw==
X-Gm-Gg: AY/fxX4FmUniFmb4BXlIKreFm7+F0DgO8kuEJAA7ZKAOEPWhY8QWJPk0ZwrJtxdlBIk
	1kg3cweecTCeJCwRsJ9aNhdAcB6C/I+ZAH0s0QPuCzVCE/xeoBUkerjmX/g/12vJsomIWHl5kvW
	GvhR4UZ9NjnvtK9To/5vbM/Fs7V6zRm4dHPMIQELvAD8zL0oUKFvabLLVAUCOn2bvFn0huIewNT
	51XWbu1GMHCc8BjSkjZVrVsIT+w9y61UG8zZ1QyzUfNMLRzTyqY6Gp508WVYh7oIgoAsCmD7mgI
	ngelPW4is+WdOsWVydFvvSdEaNNL19va3uWe6eKQ4PFt53ZYcmuMWk+MsqMjD2KNS1mRn468pyl
	Hf4W1B/T9ni1S6+m5QpW1C2GF864qLCRNSvbVfqE86/gafI7IIvHKda4/e7v7ciprf6ZawWjO5e
	IVcsSy+5AU
X-Google-Smtp-Source: AGHT+IHjjUlctQDjIpRJqzUC+72DU/ip4hg4tkzJ9MUaWCllN3XtQM9y7oKe3dkOZvMesxHEQgd+lA==
X-Received: by 2002:a5d:584d:0:b0:431:8f8:7f17 with SMTP id ffacd0b85a97d-4324e4bf5bamr24639700f8f.10.1766690514382;
        Thu, 25 Dec 2025 11:21:54 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af2bsm41545758f8f.1.2025.12.25.11.21.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 11:21:53 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] cifs-utils: fix broken PACKAGECONFIGs
Date: Thu, 25 Dec 2025 20:21:51 +0100
Message-ID: <20251225192151.3580069-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251225192151.3580069-1-skandigraun@gmail.com>
References: <20251225192151.3580069-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 19:22:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122932

Some PACKAGECONFIGs (cifsidmap, cifsacl, pam) were failing to build since
a while, erroring out with:

| ../sources/cifs-utils-7.4/resolve_host.c:23:10: fatal error: config.h: No such file or directory
|    23 | #include "config.h"
|       |          ^~~~~~~~~~
| compilation terminated.

The config.h header is generated in the root of build folder, and it seems
that the recipe can't be built 100% out of the source tree.

To avoid this issue, add ${B} as an include folder to CFLAGS, so it finds
the required header.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-support/cifs/cifs-utils_7.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/cifs/cifs-utils_7.4.bb b/meta-networking/recipes-support/cifs/cifs-utils_7.4.bb
index 9c7b9e3246..d8ab2dacb1 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_7.4.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_7.4.bb
@@ -21,6 +21,8 @@ PACKAGECONFIG[pam] = "--enable-pam --with-pamdir=${base_libdir}/security,--disab
 
 inherit autotools pkgconfig
 
+CFLAGS += "-I ${B}"
+
 do_configure:prepend() {
     # want installed to /usr/sbin rather than /sbin to be DISTRO_FEATURES usrmerge compliant
     # must override ROOTSBINDIR (default '/sbin'),

