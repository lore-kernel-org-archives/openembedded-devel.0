Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 107A710A1E6D
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:03:41 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45494.1774523013097943387
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:03:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Q6DUZDdi;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82748257f5fso979775b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 04:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774523012; x=1775127812; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oSSsZtMvum+HkUpkUY7EOW2FlOv5aVVE3PUsz3EBoqU=;
        b=Q6DUZDdiatygybd84Nr8IdjJ8T7Y44dienbWylDDCgLal3kWB1f30q4SPIkRp5M7kw
         CBFdOaThqN9jncKlaEcOp3QoOHDA33tNhKcrH69m1UJmZ0XmdTTEERGBcyXY26bp0lvA
         ywPcGgniP6AOhV+yrCtQvwdeoEjBhxvFd+1UNuijAvjJJZvYJGNCkDODHAmJYebn9ei1
         V0rbyeEVm4rzGgoBXK/V/SpE+j78XRZ4ETBwkPz+O2GPug/QQIxWObs/+E4rwkB5t1az
         e+BfksYbz3X2ypss8XkXOh5askitjenDDhBeCRP3A7bKgd//vGqT+eSGYEWUTqY8XnpE
         JdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774523012; x=1775127812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oSSsZtMvum+HkUpkUY7EOW2FlOv5aVVE3PUsz3EBoqU=;
        b=DrUheYtnippPV0NmnsmOi592l4B1IrSYsbVw6iX+K8sr2TTHotgilEYPbYuV/qHCmf
         1SA/MwhDHdprkzB5s4P9iakaAJO0IggQM2GKFC9d852Pur3tyqdhzzu+3ULs1p5jwuP3
         1V3QGfSzUR51aaJambY9q/MiBZBGKNT3NSPKc/13aR+p+nOjpsozR8suhTZEYtb23PqO
         4C3JuiDdMm+eNR441rdg//fHVBLWrXX/S+P3tT9/GU5k8tuz6Mjcdl1bGHL9YuLPXjAJ
         AbYCmECuh8iNnTLsV+P/e+gB0wwhULiV1VMxqiuga2HlPsuLS0pKKKjCz3fWd+Fse3N5
         ffug==
X-Gm-Message-State: AOJu0Yy/2eKp5U/CoQ0D1aldoUQ5MnmvHjxq4KfPY6Qlzj8bjY61evIR
	8Ihmk4Gp70fX9SXK2i033kOHJhqZ0E8IIqi73XO7puhzeq3W+o19YyJtm+1unKxw
X-Gm-Gg: ATEYQzxO3XkfZxUhRIIZzijhbgzOfcBGOUDIaGFu60fNAdNzXWAGK3JQLODs1OhlmnZ
	UM9HvoljkY6lnL2uHxWLQQUjWslqLubUcihe03A8P92z4TaTe1ZGPSMU/kRJ9YnHtsQFy6VeXEV
	HbhTKF6jk/kRkUn1HD8usT0wrxhYKQE1tYOtzj5zs66Ap2ZUMrMce6QxmiTtHOT73BPk9ykPEIp
	QmSXNlNCjjaVU2ywMUwIFQD8d8EmZshTaFP1+Vd86wANzWgyGbpCqShRQKpDgKm+5/AKWconJIT
	3FmPzF0yBFeN0RPkFsjh3SWSj7gCSPB6cswlmFn/5rSIOmtwz+gKtv2nch6tqo9u/WEtlfEEXYt
	PBEwovUBJqP7zPfoFTiHNl9+0tW1m77bTI2dnPE3ClxB4pRo0AOdRrQK4XY/tFD+TnRvxdjXPwf
	gJgb9gxmX+vruppk7i/qaGZbhREKDEvPtfWoA=
X-Received: by 2002:a05:6a00:ab89:b0:827:2792:e401 with SMTP id d2e1a72fcca58-82c867801f0mr1099756b3a.15.1774523012231;
        Thu, 26 Mar 2026 04:03:32 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d2113absm2265885b3a.20.2026.03.26.04.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 04:03:31 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][PATCH 4/13] xdg-desktop-portal-gtk: include tag in SRC_URI
Date: Fri, 27 Mar 2026 00:03:01 +1300
Message-ID: <20260326110310.1809866-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326110310.1809866-1-ankur.tyagi85@gmail.com>
References: <20260326110310.1809866-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:03:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125645

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../xdg-desktop-portal/xdg-desktop-portal-gtk_1.15.3.bb         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gtk_1.15.3.bb b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gtk_1.15.3.bb
index 5e83a07a4b..612eb4b815 100644
--- a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gtk_1.15.3.bb
+++ b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gtk_1.15.3.bb
@@ -15,7 +15,7 @@ inherit gettext meson pkgconfig gsettings features_check
 
 REQUIRED_DISTRO_FEATURES = "polkit"
 
-SRC_URI = "git://github.com/flatpak/xdg-desktop-portal-gtk.git;protocol=https;branch=main"
+SRC_URI = "git://github.com/flatpak/xdg-desktop-portal-gtk.git;protocol=https;branch=main;tag=${PV}"
 
 SRCREV = "337202d4e7179857bc37b03c1a6d8c9d92e47c44"
 

