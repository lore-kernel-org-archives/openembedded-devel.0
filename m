Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97C05C3DA4B
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 22:59:13 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.5406.1721084343761139801
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 15:59:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=M2aMZClL;
 spf=pass (domain: linaro.org, ip: 209.85.167.46, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52ea2f58448so6474963e87.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 15:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721084342; x=1721689142; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RKL8MXIGa8hGFgAb1UzRJPgQVl7y/2HE1Hdvu3YGaAE=;
        b=M2aMZClLNTMYzpQvsCHndhqREMM2EQtIVCQoOGtT/lVIUOCFbNiWPuBv/OIZaRTkc4
         P3M+saFcS3wQYCZdhmjWBZyUtTX8Jt6F0RbxRpStqMx7i20Tc9G1hpCR4KStrqerKL8b
         QG/O2DpL1uWbtssOo/AqgQHhLDUfooTWm2dup0O1ZYGaC5Q8XJa/t9zi20aQ69UsbrUo
         JiWeeb4IE1bbEzqV/pX/gQM3rCLz2AJYUH3D2kBL7ToS3MokCB7Czd8IWr98BMn7GbYj
         XUB6dAzmrgflf/fTHERpt6FjGMLcM0apnI5A/tWnev+CERSU7wUgihkfu35PVvFu0DJ9
         MGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721084342; x=1721689142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RKL8MXIGa8hGFgAb1UzRJPgQVl7y/2HE1Hdvu3YGaAE=;
        b=xD4dc+X/BtSqjO8BiEZgyZ+jML/pqc0xua9hoQnot3ztuNd1rW8cKCWbMbn34ZyTiu
         2d+Ugbrv6Xi8AuWH8BQPaRUAsn3G4bCZtFu1i4+GWSSpqcLztJh+7BISlgJA94VosVZ/
         7z3RJHfvHZ6IzO6U+CEdyBCBvfzb7tjd/4iyNlBVaN6XIS869kZw6Tz58eu1/GzzLDkT
         Gd5k/LWnh0EvfU1B3Yi8oeKIhZvM8SZsmlP9KSAMbdYA3ix+M8W61OusETez1WpggAb2
         1mClrKPN2sH8SDmnlaGZgmHvxHKneFetj+PPBHacsGus7DQjFn28GeQ0YZj4iBew0JsS
         eR8g==
X-Gm-Message-State: AOJu0YwfO7eiEphZhMu/HutS0oVtX0qR5cl5eF45i3jlmuei3AQUCwyk
	HgbsIl0bccnuXdDZAYnKa80StSVXcus431V0ez7QN5erVw+4TQ6kbbEgXeeaQf8uTMST2YIMwYy
	49vGRug==
X-Google-Smtp-Source: AGHT+IF+Qcvk+E9e/PoTlhx4YoNo/XKmhvl7UXRH5Bgmpmg0U7+hNl0kYqDFCpd5PHXu+jFcEQDtYw==
X-Received: by 2002:a05:6512:1382:b0:52c:890e:e8e7 with SMTP id 2adb3069b0e04-52edf02a9d4mr182065e87.50.1721084341616;
        Mon, 15 Jul 2024 15:59:01 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ed252d50csm989203e87.129.2024.07.15.15.59.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 15:59:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] android-tools: make PN-adbd as a systemd package
Date: Tue, 16 Jul 2024 01:59:00 +0300
Message-Id: <20240715225900.3832758-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 22:59:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111365

The android-tools package doesn't include the systemd units. Instead
adbd unit is a part of the android-tools-adbd package. Set the
SYSTEMD_PACKAGES variable accordingly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../recipes-devtool/android-tools/android-tools_29.0.6.r14.bb    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
index 456c7400ef22..18068478f8c7 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
@@ -68,6 +68,7 @@ COMPATIBLE_HOST:powerpc64le = "(null)"
 
 inherit systemd
 
+SYSTEMD_PACKAGES = "${PN}-adbd"
 SYSTEMD_SERVICE:${PN}-adbd = "android-tools-adbd.service"
 
 # Find libbsd headers during native builds
-- 
2.39.2


