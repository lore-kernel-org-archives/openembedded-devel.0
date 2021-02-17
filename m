Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.7928.1613570986086724833
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Feb 2021 06:09:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NaPF+qpW;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id d3so21590266lfg.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Feb 2021 06:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LIB/KFat2slcmUz/BnFDwuAB6S+FBqbJflvX16VXrYA=;
        b=NaPF+qpWjogjSKk8S9DyOjZQ4bqVt0zrTtbeNAOejfN/DZJqMAYApVsNl5kCvcU1P+
         Ne052bI+oUbpbr5/Cn68oZVcGYKPCW/rQfvgs+qLUL2oxVovniIUbOajcTip4V+e3Cu7
         d0atBO+5NaZSipUmVFpRwCd37RuJCrOlJ8SO8/O33XY0qxQTlIW/PZMfqQm3A3h1+GmY
         789ViDhVkhr4Zv3sws61hXhv/woPijhz90L6Somz79109ak5HZdWzp/Jw4lrEvJfkZCk
         e3tZwQJjyNBvtZeSJljvp/pCI/dZp2QWv/rQhLfonsyJmiNIjyI3IFyLBXCLwJ5r0zG8
         2/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LIB/KFat2slcmUz/BnFDwuAB6S+FBqbJflvX16VXrYA=;
        b=IsusO/4wfizuRtVj+Hq/yis3+aYlg8pOsVjcDFcTgz0I08cSQpWYKdkpiy41mRIEW/
         MrEweehfvX9adiwsaioDuMbyCpHEHmLWOzNCXdlFmrRw4dK1Q73UiC1R9IsXzq2x+wEn
         2kPFi3nu0L4QKGqardFXchCgxZaKTSMt0AOG+fu7tQ9S3Poa8CPxZuN3KHB5Yhr+H/h7
         +bO5vaNn3kYk09iM/ryxeMfrYf818gG9X2c+VMDi4AcP3nWGiTuanrz1KD782dPOlXAQ
         B2lW6zzQuYMcJ4EnqKHxuKDjRoVZrAI2hmXOjDQuwZhCh/iFYOpVeS2yfgPsOVANMKxK
         UlMA==
X-Gm-Message-State: AOAM530hDsyD66qSFuzpI7wyNE+Fg0Cerns1DxGL1FsxaPrzCDgxav8/
	lLcLpJ0zIC5aoK4QSU8loCA=
X-Google-Smtp-Source: ABdhPJyeJ8+lLS1BGA+P1vdAnLXTV62oPlgIwabv4MTkAk/Xe/sJle9JOlnbY5fMdu9tEURFaDsVnQ==
X-Received: by 2002:a05:6512:558:: with SMTP id h24mr14281040lfl.531.1613570984384;
        Wed, 17 Feb 2021 06:09:44 -0800 (PST)
Return-Path: <liu.ming50@gmail.com>
Received: from localhost.localdomain ([90.129.215.157])
        by smtp.gmail.com with ESMTPSA id q26sm253363lfc.254.2021.02.17.06.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 06:09:44 -0800 (PST)
From: "Ming Liu" <liu.ming50@gmail.com>
To: yocto@lists.yoctoproject.org,
	openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	sergio.prado@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [meta-security] [PATCH 4/5] initramfs-framework-ima: let ima_enabled return 0
Date: Wed, 17 Feb 2021 15:09:28 +0100
Message-Id: <20210217140929.987752-5-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210217140929.987752-1-liu.ming50@gmail.com>
References: <20210217140929.987752-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <liu.ming50@gmail.com>

Otherwise, ima script would not run as intended.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 .../recipes-core/initrdscripts/initramfs-framework-ima/ima       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-integrity/recipes-core/initrdscripts/initramfs-framework-ima/ima b/meta-integrity/recipes-core/initrdscripts/initramfs-framework-ima/ima
index 16ed53f..cff26a3 100644
--- a/meta-integrity/recipes-core/initrdscripts/initramfs-framework-ima/ima
+++ b/meta-integrity/recipes-core/initrdscripts/initramfs-framework-ima/ima
@@ -6,6 +6,7 @@ ima_enabled() {
     if [ "$bootparam_no_ima" = "true" ]; then
         return 1
     fi
+    return 0
 }
 
 ima_run() {
-- 
2.29.0

