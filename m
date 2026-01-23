Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF852D77887
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 17:02:28 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.114.1769187745913802334
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 09:02:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C5zJ5hEP;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4801c1ad878so25128085e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 09:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769187744; x=1769792544; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jbAwHTRIBxE3JSGMww8E45wjkvEFoRZ6hAH2pqVAzK8=;
        b=C5zJ5hEPhdxn+sy6HxMD4ND3FSUaDFjhQKKlkUeSbAU2o61MUkuqq7No+NWBD8cNrC
         mL5ca1UYhZrfh59L25hXHKoItn+6cAo1wyHKZI8imTt9zm/fFEtXy9IoR/hdn9o4b+Wj
         v6bkvFPmkgKVEeoiufAJF4pC5vz792ywpRKkl4J7ZnGmwV28nocYW9xu2GZlP5vHk0y5
         bdGq1eR7LSmsIuwnHRESmac96pM7K0yWloVOBiOuMWZHn2/ssOSyURC6U/F9q/iZ135P
         0PdIJapG5qWkMa1awyBMLclp5r9qjpYkbFo58JoMwONPfGkVrZAVqq/XnG41gPLobD8P
         2vxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769187744; x=1769792544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jbAwHTRIBxE3JSGMww8E45wjkvEFoRZ6hAH2pqVAzK8=;
        b=SizB5HsFbveatMD/qGt0E06R13+V2m0D2imoEwmys6wCg9u0cqvXS+moc75iyOF8R3
         mgmehDAcPLCO9fTRBaZZMy9drW03Aa4HgcQFM4l5+dokq4U33wK1twlYM/hmf73A1J1V
         XKV60beUdDyWaM5r/wUt1/X59HpeU2rgu6+BwCn2YbxG7my4fEzoTgmphFy22yAjh0qf
         x4yPi/jMXIeSPJz1gjvwFz19eIht0DvmETjG8A7X43v7DvWj0fO++t8f40MLzJWMDMBX
         bDRUe2Oz7BWi1ZVWR6/MJTXVP31vr8oJ8LoWBVM/oC+u88M0CoWy2YczvDXquSp74UKw
         1iiw==
X-Gm-Message-State: AOJu0Yw0jsZVQqcKpYG5WUg126WpXd0OZPnJ9TIOxbr3W9wX8gUXrFh8
	mgGlS/NGARKWOXsHlpIid0PSORxKqM9480FRICuw+4MwitIgn5ij25gRc6kXIg==
X-Gm-Gg: AZuq6aJx3bKVfljmbiqEk00qbleBXXuMGolGi0HJjsysrLCSBu5uP3ifM0yYYoLsS8W
	5awA1MbPITV6LG3FV5udDKZbrDvaCkNb610xIUH0sTSn2J1H9hfSfl6Pvz95Xve6xSSocFsAKil
	QMJHknW4rEf6nXavVZZf8BNBKkb+QXTcNNMdXWEAJbMgPzGAh1x8Za382Xkpy+32KY/u4QV1XGS
	p3CDfbz7j/On0N5DAgCGCrJffREDNU0ujBT1TJr+3clo1E2S+xVnFu5aO19MbQNEYRn00EEDlvY
	l6FeNLIdjZlrKjs9+Frharj6cSrSeXsBIFqWWx/0GZ/mMoyJQ399XmEeCHBW3Fbafuq1AexXFUe
	qmm/J10ToDy30Ix4/ywHHEZk93GldKYVhyaFiAESF2i6/8LSfBJf612nPNzv1C2BK7MUbH0Hf3f
	XR6nO4JyFn
X-Received: by 2002:a05:600c:35c4:b0:477:9574:d641 with SMTP id 5b1f17b1804b1-4804c9b194emr64428345e9.22.1769187744035;
        Fri, 23 Jan 2026 09:02:24 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804dbd4630sm25455165e9.17.2026.01.23.09.02.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 09:02:23 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 02/10] redis: ignore CVE-2025-46686
Date: Fri, 23 Jan 2026 18:02:13 +0100
Message-ID: <20260123170221.671471-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123170221.671471-1-skandigraun@gmail.com>
References: <20260123170221.671471-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 17:02:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123787

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-46686

Upstream disputes that it is a security violation, and says that
implementing a mitigation for this would negatively affect the rest
of the application, so they elected to ignore it.

See Github advisory about the same vulnerability:
https://github.com/redis/redis/security/advisories/GHSA-2r7g-8hpc-rpq9

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 868b4b2959c1f6be13693e31eae5b27a1fa697e6)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/redis/redis_6.2.21.bb | 2 ++
 meta-oe/recipes-extended/redis/redis_7.2.12.bb | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.21.bb b/meta-oe/recipes-extended/redis/redis_6.2.21.bb
index 82e029fd82..c47f51692d 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.21.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.21.bb
@@ -23,6 +23,8 @@ SRC_URI[sha256sum] = "6383b32ba8d246f41bbbb83663381f5a5f4c4713235433cec22fc4a47e
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
+CVE_STATUS[CVE-2025-46686] = "disputed: upstream rejected because mitigating it would affect other functionality"
+
 FINAL_LIBS:x86:toolchain-clang = "-latomic"
 FINAL_LIBS:riscv32 = "-latomic"
 FINAL_LIBS:mips = "-latomic"
diff --git a/meta-oe/recipes-extended/redis/redis_7.2.12.bb b/meta-oe/recipes-extended/redis/redis_7.2.12.bb
index 98af45cb88..2b4087a74b 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.12.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.12.bb
@@ -21,6 +21,8 @@ SRC_URI[sha256sum] = "97c60478a7c777ac914ca9d87a7e88ba265926456107e758c62d8f971d
 
 inherit autotools-brokensep pkgconfig update-rc.d systemd useradd
 
+CVE_STATUS[CVE-2025-46686] = "disputed: upstream rejected because mitigating it would affect other functionality"
+
 FINAL_LIBS:x86:toolchain-clang = "-latomic"
 FINAL_LIBS:riscv32 = "-latomic"
 FINAL_LIBS:mips = "-latomic"

