Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3895.1794729085587108635
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:51:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=proWXgBY;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3791619605cso4880215eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729085; x=1795333885; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BpudN5TdiU5BTc1sH4WCPMgPcVEbJLqbNTytZWMWR9M=;
        b=proWXgBYEPJlxfyHD0TrEcudOktExSS7O5WCBOMIEJ9BgRndTq4f7ShIotkwwn9SWr
         6W+4q1XIRgUc4Ll8p0HzsRW+Zyge+wGoOxyAtutDoWdAEwYfIXhZZ/X4q4ii+V/Z04sI
         fcMVQX7saelz0cwE9mjaLN41ZLnQjh0jnl59Mewmwu2jDiWbZnFC6gXqM4sQCZ+6ITun
         7TY+uddCxJBxMVrJpEi0gOv9QAqILaxEVyTHBIFdX5DhELtEMGXqys9Ky991oU3E3eZv
         C9Zwn9Xp/caXaeXRwLMLlajj/fhq79u/vfKaPxDNmZ/abkyKIDgpyDnh4/GO8aPRJNM4
         ViTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729085; x=1795333885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BpudN5TdiU5BTc1sH4WCPMgPcVEbJLqbNTytZWMWR9M=;
        b=WwPc4KXk9Q3AwugeSHPty5srWtH6+dWTYV4zrwzX8BFxbwaODBGjraaTlwGAaJqiMQ
         tHpl9cHTQJeFavokNg4Jcwqh+zfQiD42wySZ0ampw82TjqnKipAKTizwt9Selrt3xIVC
         7LgmMiqOXvE30oepjVcyAsoEjYPuJ/2bFxzQwPfJlrNrCFsjY8vcqeChhMPkukLXnLWt
         4XWrNUIME3jAuIo0NizYSz7WO6Y5o2LgqO2PZXPZ1MFRkEWdfaw0lddtpyeJtHI5ioAQ
         7w/2uEG1BLZJGIUgJeDOGm5kuDYweaHLvruHtnZGaEI29Ii4T7/o423FyX8Mnyx0GNmj
         6tWg==
X-Gm-Message-State: APuU4Z8YvF84yS/IkMandxJA8zDWd/DCpIHqsYIdZb0Yi6LHeQP7Qk7V
	79IZ82+qMqglzXKQQ6ClNKS9IbGP5yskH3VeD4geqRir8obnEKLEahIGEOD2SzZb
X-Gm-Gg: AYBFou2ZEy8xZKrXKbd25c6WksN2Ixip2GVt/c7ih7dJfGwK6Sq+ncwj0ExbZmMqCF3
	2gcDgwthIFCqq8gcdkHk9wJudjJDFbHrRyVO+hr+vmD2AdHsoyATE3bKFkZ3xUCKa42FcxZesZs
	394TuSJXRCQdkb7nbp9giurZCijrkI7yWo3h5WX97CRDmu8W6Rzyg3TWUpNrnsaX8JG7yofm0ym
	7B1990VjZ82snTQCPlwE/1NjnVRvWiNZeBnkm9uEio6s4fvmzsOpmug/TUC/NXgwVnTSeQpLGB3
	joVhKnQMzcyvwjwve946mYDqlVh2kwnDWalezXIfWMNDc5n+W/eoZJRSjL4FGSN5TZoQkZi+DFE
	pgRuFUIXhdwlLSDKlDwSCTfD4M0vlrTUQcQVkUJBEQp/Ly6HjUkSDqelGr1t6Nz2QfAsKbqT8jI
	JD4xT2CxQ7VPQaeln38lJwJKNR1mMzBO1WE77Xc+bJJvXmla+b+p732lXkYjsEusz/8VUIsmk1u
	QU2xJz+j7QDEnjeanNElMzkPjK8kgG1K9K6VFgVFivrZEwt0LOHQvk0uC7680RYATJHNeqTw9gI
	H79ynQRKwSerueFb/4zttqtjVHwQWf9Txm4alxehkDr3Jwa2Q99QIusk4EkBAYodfSOC9IU/ehR
	fZ0XThv6UlfNTCSGbXigldhJ1Qq1w9amyLH0qewEAOPlrk2NzQUW3JR47ERrR9qcQ9knVR3a7X2
	sUujV3Ozp5UPmc4+vDYQsy1CvJo8l/MAQTSGpBVjZaUxiqJjdiUR+HzwZWE3oPhPSc733hEQVuv
	VmAziP6jzJrrddXtnlP7ixwaGmeYpbjq4CCQxo37HrhG3iJEaoDZoAMVcwITkogq+U8W7tX2dAI
	YJ9Y
X-Received: by 2002:a05:693c:87d7:20b0:35f:8c5d:5928 with SMTP id 5a478bee46e88-37967125e78mr6464155eec.30.1794729084893;
        Sat, 14 Nov 2026 23:51:24 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:51:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 76/96] poppler: Add brotli and harfbuzz PACKAGECONFIGs
Date: Sat, 14 Nov 2026 23:48:54 -0800
Message-ID: <20261115074918.2932593-76-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:51:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132346
Content-Type: text/plain; charset="utf-8"

poppler 26.11 enables brotli and HarfBuzz (font subsetting) support by
default and fails to configure when they are not found, so the result
depended on what happened to be in the sysroot. Make both explicit
options, disabled by default as before.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/poppler/poppler_26.11.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/poppler/poppler_26.11.0.bb b/meta-oe/recipes-support/poppler/poppler_26.11.0.bb
index aa6a0f85b0..e7858a10e8 100644
--- a/meta-oe/recipes-support/poppler/poppler_26.11.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_26.11.0.bb
@@ -25,6 +25,8 @@ PACKAGECONFIG[openjpeg] = "-DENABLE_LIBOPENJPEG=openjpeg2,-DENABLE_LIBOPENJPEG=n
 PACKAGECONFIG[qt5] = "-DENABLE_QT5=ON,-DENABLE_QT5=OFF,qtbase qttools-native"
 PACKAGECONFIG[nss] = "-DENABLE_NSS3=ON,-DENABLE_NSS3=OFF,nss"
 PACKAGECONFIG[gpgme] = "-DENABLE_GPGME=ON,-DENABLE_GPGME=OFF,gpgme"
+PACKAGECONFIG[brotli] = "-DENABLE_BROTLI=ON,-DENABLE_BROTLI=OFF,brotli"
+PACKAGECONFIG[harfbuzz] = "-DENABLE_HARFBUZZ=ON,-DENABLE_HARFBUZZ=OFF,harfbuzz"
 PACKAGECONFIG[qt6] = "-DENABLE_QT6=ON,-DENABLE_QT6=OFF,qtbase"
 
 # surprise - did not expect this to work :)
