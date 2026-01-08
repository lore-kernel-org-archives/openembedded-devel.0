Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 340A5D185CA
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 10:53:41 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4000.1767869620303668282
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jan 2026 02:53:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lk7Ivjiy;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47d3ffa6720so31103275e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 02:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767869619; x=1768474419; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CCnOXqx78Uq8IAjzFBZYu0m9/DRjl2CMBXpEz/hSNRY=;
        b=lk7Ivjiy05EX2PHBIBT+wnivyS10SKs9dLbcwkmFDITOA7Vbq8RYKiAsfL4h71J7oa
         VyYEHdJOPpGCHeK8uC/yb7siK9rioeusK/BU3qpPbLVo542yz6fzseWCHJrg6eNPpotu
         fcCyI9l4i0QoytpF9uoUqFkJcfq9FEStNvlNOmubAZumLYkWwLM9JE3p9cCLL+o5THMQ
         wPZSW5VIjb71d1KMWOzIuCU8dt7YQGT2oPnwTLpiHazwwzhndrKYAdN272s/27SJiK23
         5wpxDiQQN6U7qQRy0OTGUIsMCQcb39RXoMJcdBDVY/trmGDaCOnWXpf2tb8xPa1yCmfM
         TC4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767869619; x=1768474419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CCnOXqx78Uq8IAjzFBZYu0m9/DRjl2CMBXpEz/hSNRY=;
        b=Z6K433A5sHaUGcrXnVkPeSJN0D6cnHYE9CvMEq8WkEpl35EIk0tSJou1Mtx9f5G/qZ
         bAifwWxJ3liiG8ksTK8vBqF4rRXgB5TehMsW7dzB2KISnTRMoiUyd5ugQcK1Tu8f2ShD
         MlL+2AbW3SYo1WJpcJHyl3wuC5rI295H2uskNaHXrn0e70a9tKt03rX/BqvwYIVAI3Bg
         BMG4WWS25ueQXVfAFpkOaZglvXQKUQoa2BsP6R+uB06VGCd8qg4KeX0deJ+HNnQMrgaQ
         qx8+VqAmqGviWwpyTxgpBQMY/bM2I0nkayWu6wy9hHVgOeK7tZwqXqVWX68ZSLEznLvP
         EDyg==
X-Gm-Message-State: AOJu0YzQyyZQ0rOD9ZAAc0iBMz4VHuAbIfRj5Cd+lxqJ149M+hrG7FqM
	aCw4SNwD07aVH9mLrUdx3xGGzSN0+SO77Rke9kpxb6cV+pnGY5tld1bDbw8Kdw==
X-Gm-Gg: AY/fxX51LdKNcOlzrGd3lFDAqG5jP0TbSHMuaelh9NVfkrBrsR46uTmC6phhZQAhcN0
	FLJ7oArKKAhTzpuBfJD/qrx4wGv6/hjU5HlAyvmjcLUDCU9HmWPCLioXagX3QixEfxKAX0yyV4d
	pipghTJx4wkVj6ewePKRkS8cizfMnkPdaOXShsqfOk2K4oP0N0TVZz8nToavKF29UvaMtEGrEXb
	Oc57r+AqyjVBGZYFsS8QN6nm1xv3Z5k1ohl/jT+F5Gn6u+/FtxuVWoKhDBwl0J5tkmQaLsuqh31
	4HTBeq0A0kY3JWjPGd261TcHdclLSkf34eMsfwn+T4VjeuA8TxikBFyIV6mkk9WxXWk2kK1DVzu
	/TmFlN7l/hvbO7PCTuOCNTZF18PKeUgoNb9tFHvfcbs43sGfCKAM1hagWCXg4KtCxPmwf8m9osJ
	daDb4yOE3wKZAGHyZXMxU=
X-Google-Smtp-Source: AGHT+IHHnk94Lxd1L7dhpw7QZBHOaxvyj2iPCMLdtmZ4ORpkVkODOM4DXF94kGjNgrGUlG9LH1h10g==
X-Received: by 2002:a05:600c:4ed4:b0:471:14f5:126f with SMTP id 5b1f17b1804b1-47d84b41181mr75394695e9.33.1767869618563;
        Thu, 08 Jan 2026 02:53:38 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f68f69dsm148656615e9.1.2026.01.08.02.53.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 02:53:35 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 03/15] imagemagick: patch CVE-2025-53014
Date: Thu,  8 Jan 2026 11:53:05 +0100
Message-ID: <20260108105317.460246-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108105317.460246-1-skandigraun@gmail.com>
References: <20260108105317.460246-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 10:53:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123257

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-53014

Pick the commit that is mentioned as a solution at the bottom of
the relevant Github advisory[1].

[1]: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-hm4x-r5hc-794f

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imagemagick/CVE-2025-53014.patch          | 25 +++++++++++++++++++
 .../imagemagick/imagemagick_7.1.1.bb          |  4 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53014.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53014.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53014.patch
new file mode 100644
index 0000000000..b20d78e1bb
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53014.patch
@@ -0,0 +1,25 @@
+From ebf0f36974e2c9b47d9bb5bf31d19a19c0ce4e8e Mon Sep 17 00:00:00 2001
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Thu, 26 Jun 2025 23:01:07 +0200
+Subject: [PATCH] Correct out of bounds read of a single byte.
+
+CVE: CVE-2025-53014
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/29d82726c7ec20c07c49ba263bdcea16c2618e03]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ MagickCore/image.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/MagickCore/image.c b/MagickCore/image.c
+index 261d75003..1b242f828 100644
+--- a/MagickCore/image.c
++++ b/MagickCore/image.c
+@@ -1678,7 +1678,7 @@ MagickExport size_t InterpretImageFilename(const ImageInfo *image_info,
+     q=(char *) p+1;
+     if (*q == '%')
+       {
+-        p=q+1;
++        p++;
+         continue;
+       }
+     field_width=0;
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index f947b8e9c6..cc77468731 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -11,7 +11,9 @@ DEPENDS = "lcms bzip2 jpeg libpng tiff zlib fftw freetype libtool"
 
 BASE_PV := "${PV}"
 PV .= "-47"
-SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=https"
+SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=https \
+           file://CVE-2025-53014.patch \
+           "
 SRCREV = "82572afc879b439cbf8c9c6f3a9ac7626adf98fb"
 
 S = "${WORKDIR}/git"

