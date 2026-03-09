Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D20EFCD6E
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 09:20:02 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9944.1773047998562852380
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 02:19:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DiJvQrZz;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-485345e1013so8238915e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 02:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773047997; x=1773652797; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VvMj6k9BYiMB/EYNV0ZtzM8KI46SoKdKvAaxvOVxwjg=;
        b=DiJvQrZz7Z/TmZKbxBPT8bly9WfM8D4ZlQpOySqTEpJlNd2lxl8ggpRCZ2tXJhhuvB
         DZl1IBaHb3JGC2h/wXQoSaqRXu4vtk4fLN2CKjpBceNaDVxx8OwKNCrwDE469rK3Zf2+
         61/DKyWTUCAKhUgYAZ5wX2MQCWYOkcjR9GFXOydXbK0Gd/mUFrXDo5eFOcOv5rWPbVe5
         c9PH1adfCI/yXXZ0FWUze7xzR25IS2D7kQUz/nZxQJaLenVOt8BQqg7ey0BbAmNNdJn2
         YonS+Ec1/FzQFqepMcn7Dck8QvaEavalP9XkPw4XDBGJ9ZmSXNL0NHCT0Ot4EiMgYLJs
         iOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773047997; x=1773652797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VvMj6k9BYiMB/EYNV0ZtzM8KI46SoKdKvAaxvOVxwjg=;
        b=wlDz8rIY90m0HCSVJ99gB/F5bmXDB9lYWvZ934lzEvqRXDVfMsulUYVKYdF+vRBeO2
         mC9nrsDe8HxM/WPcTUttCYU2INFLHCCwZz7ndzf8kQ7t0T2/ritcKRhilER+MB8oI8B9
         Y+91TazNBrhD7OOmFw+UEVob1CzwMcaAuKN3WOZfFURJIBOogWV0ZFcM83C/N5I1/EO/
         eDtMAeOn6EwyNLGev+A+JGweP16nb7sh+YzWubObQwxNgEEdu7ZSzVzWA9NRF2inm3x+
         0YWW+nxm4eQv0Rz6ZAjbLxwFNTd7e7G0QAK6s44EzFryZKOf/sPfh2lKMqA2VCpIsZ0r
         tTGA==
X-Gm-Message-State: AOJu0YzUSwxCVg0dXHyikvE5NyppLFjqnm69YgYNelUVxqCO/yJEAzyG
	tTcK6280iOO/Bm1KTsZ69Bat723iI5d1J8TVAqSJd15Yi6liwS4fCUZwkxMMeg==
X-Gm-Gg: ATEYQzzvVFHNco9mDRalZ873tguko8rwfHwW3lJxxATpV62rA5aMHPhnZGIAjoTE3RK
	RJskAU7Azo+fKeswfYM1iY0FVaKmY7Vwrnna+7682EFWAS840MmJd5NtTxzlEFTanJWMzhDwmgb
	YIqWGz7FjqG4LTDm7tKGpqVMYiaY2HT+IpmCp/1gaThtINJpuYOTu04qpUYqcOmDtdRR0pbvOdv
	h65rr4dy06sUDmrdj9/kmBnllyW2P/GmD/KJ6kVb1PpK081nv6faDsd4FTB0kjBf05K9GnOoGXq
	HXQCPsHO42LGctKUvCAWXIst1dlAbac6zQzg628bUbLQR5Kfv2O4ZYa9i7NhAfYO2ew7gRn1X8S
	ljjMZuPBW6DCzqguPRKGSYvLaCaCXVzbrn+D1PLmwL7tlxOvkhJy9XPVRelJZ96TQRuj1GHKx4Y
	HEMQyMH2kTuIIyt6viwO3i
X-Received: by 2002:a05:600c:3f06:b0:485:3e00:944a with SMTP id 5b1f17b1804b1-4853e0094c8mr17202465e9.9.1773047996513;
        Mon, 09 Mar 2026 02:19:56 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853ebab1a2sm26911935e9.1.2026.03.09.02.19.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:19:56 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH] libjxl: mark CVE-2025-12474 and CVE-2026-1837 patched
Date: Mon,  9 Mar 2026 10:19:55 +0100
Message-ID: <20260309091955.189952-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 09:20:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124966

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-12474
https://nvd.nist.gov/vuln/detail/CVE-2026-1837

Both CVEs have been fixed in v0.11.2, but NVD tracks these
vulnerabilities without version information.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-multimedia/libjxl/libjxl_0.11.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl_0.11.2.bb b/meta-oe/recipes-multimedia/libjxl/libjxl_0.11.2.bb
index 1157f07d84..0976987717 100644
--- a/meta-oe/recipes-multimedia/libjxl/libjxl_0.11.2.bb
+++ b/meta-oe/recipes-multimedia/libjxl/libjxl_0.11.2.bb
@@ -51,3 +51,6 @@ CFLAGS:append:toolchain-clang:arm = " -fno-integrated-as"
 CXXFLAGS:append:toolchain-clang:arm = " -fno-integrated-as"
 
 FILES:${PN} += "${libdir}/gdk-pixbuf-2.0 ${datadir}"
+
+CVE_STATUS[CVE-2025-12474] = "fixed-version: fixed in v0.11.2"
+CVE_STATUS[CVE-2026-1837] = "fixed-version: fixed in v0.11.2"

