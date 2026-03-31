Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 204A31061B21
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 09:58:30 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16631.1774951108098641574
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Mar 2026 02:58:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DIojl6e2;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-486fd3a577eso50168425e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 02:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774951106; x=1775555906; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NZs+RhFLJb6z+0xU5SEH7oYlqu1kpwugC7VC6vHHdCM=;
        b=DIojl6e2ttCLgrf+Yoon0Cs2HvU0ILG+7VkAuTuWDfPPRGPHrP/c/bWSeFXgtDNyeN
         27X+B5dkdFLmDeB7Lmi9C7j3Ef02XrNnIjoilUd78Gtz5iI1401dxr1Bk/y0Q7pGzunP
         4BQsDBvDyDSsLczCMGFKQ1l73rn/GyfQ/8GTycA11fv+ZYD94f/JamugsGFcB4Mmz1YD
         R1z8cQLnZ3qf00J4FhzbM2perUIAM7ILwnV1p0rAH+h2LBetRIdUietp+Vgtd0g0zvTi
         Z9DA5HUFbc8CR/QtcETq+AkBd69Wnil+tadDkb7eR1e/rpI+axUqyRVxvUAE1xeYCWEu
         XkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774951106; x=1775555906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZs+RhFLJb6z+0xU5SEH7oYlqu1kpwugC7VC6vHHdCM=;
        b=fQ2m5xyOrJkxyA13NHvgYAptEia+n05Ckul5NwmfS7brtKv7yZB0WoHmPtjXLuNUbX
         yZKJN/nMcE5+K4vRaOO16UpUwUCQ6J3ilAclgYGcAbTDyZnRKVF1iHAGbNIBFAz+NlH+
         +DJZd0zpkj0Lg4Gf8ZKMKY5h8Ros1nsCjp6zZ2PTU8k0t5oVowPzyAhp0mJv9nPx7cBJ
         mjXyngeveghYeHQ+01qYVoghKRklJD2Nj3BzzvV+QAFBsvYvCPvvsSFPcQXSecd8iRH4
         3C2eFBX+4ekP477kix1G/5QeMEg+rang4jiibpUjptubw8rvbeKvXjcSIeKbSzO3clE2
         +p2Q==
X-Gm-Message-State: AOJu0YwrPU3N0+NiyC86lbgmU+hsl8lX6OeFwXx+/qBBGT1VrM1lNzWr
	DAJCPd7B6Z5FY3PXkq7JvPCX7vtHEeCZCceEsMn1xCgkrAJXlWQIm2TSW6z1Ng==
X-Gm-Gg: ATEYQzx8RjCFHG3UtTz8a8n5aADDFlcGGuWAkK8m2ALnmVSXFt7HnPdbkOmNykb5ylS
	aBPWnrAXYO1cgUcq0A6oamlEO3J2kee+fizkp91OLVQGslHaI2euMsH/c9cD5MlBNHCln3vZUjY
	vTQqKAfJHE6kLRQKYvabehnpjw8e4j9y90kXW1Eq2texCWp8cfDU/K8wcPhuHl6SXWvPMkCMBBz
	BwlcNw+MhBmhpw7OWaPIZcTxV63bG6LBlUJt9hBrKrknhga5FqsfUfaokzIBCkE9t2cr5LkQZQ5
	pDXDkETmG9iCfRH/G568DwpS445eJ3omxeWDRhRBWquFyYOQi/lyKxfg+s3tpzipGXpnkDlpupq
	RxXkj+WJrsaZOsf/aihraNoQdW6jql8nnL5AftlpF4JKrMDbzXeZC1RouO0sYrqbnxOcY8Y7Pj8
	hPi1G0SSnTiv3SqODVAt8x/Hbn2UKrGapbZKiB
X-Received: by 2002:a05:600c:43d4:b0:488:7ebd:78 with SMTP id 5b1f17b1804b1-4887ebd0102mr11940655e9.14.1774951106142;
        Tue, 31 Mar 2026 02:58:26 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21f279bsm23453461f8f.16.2026.03.31.02.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:58:25 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [scarthgap][meta-oe][PATCH] flatpak: add PACKAGECONFIG for dconf
Date: Tue, 31 Mar 2026 11:58:20 +0200
Message-ID: <20260331095820.1967914-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 09:58:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125884

From: Markus Volk <f_l_k@t-online.de>

Disable by default to avoid a requirement for meta-gnome

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb b/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
index 639027701b..3a2974294f 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
@@ -21,7 +21,6 @@ REQUIRED_DISTRO_FEATURES = "polkit"
 DEPENDS = " \
     appstream \
     bison-native \
-    dconf \
     fuse3 \
     gdk-pixbuf \
     glib-2.0 \
@@ -38,7 +37,6 @@ DEPENDS = " \
 
 RDEPENDS:${PN} = " \
     ca-certificates \
-    dconf \
     flatpak-xdg-utils \
     fuse3-utils \
 "
@@ -51,6 +49,7 @@ GTKDOC_MESON_ENABLE_FLAG = 'enabled'
 GTKDOC_MESON_DISABLE_FLAG = 'disabled'
 
 PACKAGECONFIG[curl] = "-Dhttp_backend=curl,,curl"
+PACKAGECONFIG[dconf] = "-Ddconf=enabled,-Ddconf=disabled,dconf"
 PACKAGECONFIG[docbook_docs] = "-Ddocbook_docs=enabled,-Ddocbook_docs=disabled,xmlto-native"
 PACKAGECONFIG[man] = "-Dman=enabled,-Dman=disabled,libxslt-native"
 PACKAGECONFIG[soup] = "-Dhttp_backend=soup,,libsoup-2.4"

