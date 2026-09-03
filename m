Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 248A2C624DA
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 09:50:14 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4186.1788429007521959208
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 02:50:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iTVgk/Cc;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-85c9a79590aso2480422b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 02:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788429007; x=1789033807; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m84/SvVVrjPhJyEwAMRpnASSnXIVPesRlp0Y88XGk5s=;
        b=iTVgk/Cc6v76F1d2ak6KSaOr0/pxui74rz4z0Y5/3KsUkAroQG8AEHLOwKBTQ72tTk
         NY31Us21G1Rp91tLOj6r4lyalO+kbGPpWfkE/TwrIlIcxv94hXW6u6mBu9M/C39GjW0D
         B9DBi4+cX546dKSKOyB2JO+li8ne0rQMLoYp04nVlmNQIi4TIVHVJokI4RjxVq9HolTu
         tjDtmQ8GeDtnec7ZjDNMTWuxQ5a5FGXg41hLHR2HN0mNZ12q5x49M88ut+w3VrYTHX7K
         8PYqHA5tVs1PvQqMuB7+O1+9KfiseSSZhtF2lueEdKjqOR/V0oAWnH7Vg/ZhhcHzeFXt
         mF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788429007; x=1789033807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m84/SvVVrjPhJyEwAMRpnASSnXIVPesRlp0Y88XGk5s=;
        b=UbIgy6aPFUzmwabrXaZU67UBH6bHYJnaX/BXLHqNqCqxioMOyGD6CsV/MmYDUL2j7k
         JCzO+ZDr+2e7qOblLHHKW5cAKD67D80eOpBGehzLQZg+uSGk3v6o9vzSD26FhOV+KMKc
         WqBBRb+gOx+TZEXgBu/Fvoyy3IOoWaF2Ctn4ww3QkuYde5nB67vXLw85/f3Dm8rKLAWX
         TrrwqPR+VRTKnaOMsD+GozAhPQgrdnnCRG1xtqBrsbKHP1W2UQyFGxIRnaUYQ9IqKrMv
         p8l64xX5/Ci4u6Q0juWcw23EzNO8oLYjspb0iUFH6mQ05cfQQiYd+EV9hvTtBcFAggXB
         U6fA==
X-Gm-Message-State: AFuF++mr7hiOai2rFy+GQDCxbXvfjcO+mzm9aHBp/Ju7kB9RJoZBuWsx
	RgYNPGIQT1bxzuCeus7SSVTCtrKatGALRa9EiO3UFgit5IGf9KV1/9a0+9wBkcpq
X-Gm-Gg: AYBFou0GuIgerKDA/pIWTEX7qbiLznOPA1pXTT7kyJ8oCFNjlxVdXZfLUh1PgJeoKxC
	GNVTVLNp1EWbWOvc5zaPuPqFOJCYO5Qf+29xAD5ygLhkB/x4NHpXgkoPHNZZpDtNmEY/XxwtJ7L
	ci/GM7O/sM02JxOrDgvz7+u24EBN6JpVqkYkL7SUkjBUkKt4Kb7xycO8Rbj9ksC93PS8qqq98CQ
	9nKD2rC6UTxJHBjd4rEF+PS5Cf777fEKx8slAW8d8/BG3L0nHIGsy4iqWmLTr0esU+NjX/wuvFD
	q7iKxYA9AGqCIbwXAMeYtAMIhjeUg0m2n4hoBxZDMx2f7qGAlaM49SEUZJmhLCZ8/u0dgGaj9Le
	AHPesZr85pVjpu/xYCMG/CFGQRLD/OVCTzf9S5dAZyaxtP9e153Vjsj/VzSej4NOy9kGRpFiq1i
	bDWeinskwA/vjRBVDaQqghfovhMufX+RxGhnADU3CvPX/TqQjiBQghfABtwG6Usrp9SLD7+y/0T
	A+hdq4/B2k=
X-Received: by 2002:a05:6a00:3c8d:b0:853:5152:a3e9 with SMTP id d2e1a72fcca58-85ed8023e20mr15838577b3a.11.1788429006798;
        Thu, 03 Sep 2026 02:50:06 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc003aebdsm2581265b3a.39.2026.09.03.02.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:50:06 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][wrynose][PATCH 3/22] libde265: mark CVE-2026-45382 and CVE-2026-45383 patched
Date: Thu,  3 Sep 2026 21:49:34 +1200
Message-ID: <20260903094954.3240723-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
References: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 09:50:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129719

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Note[1] also mentions fixed CVE.

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-45382
https://nvd.nist.gov/vuln/detail/cve-2026-45383

[1] https://github.com/strukturag/libde265/releases/tag/v1.0.19

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
index c5fbedb22a..54f158eef9 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
@@ -22,3 +22,6 @@ PACKAGECONFIG[libsdl] = "-DENABLE_SDL=ON,-DENABLE_SDL=OFF,virtual/libsdl2"
 FILES:${PN} += "${libdir}/libde265.so"
 FILES:${PN}-dev = "${includedir} ${libdir}/cmake ${libdir}/pkgconfig"
 INSANE_SKIP:${PN} = "dev-so"
+
+CVE_STATUS[CVE-2026-45382] = "fixed-version: fixed in v1.0.19"
+CVE_STATUS[CVE-2026-45383] = "fixed-version: fixed in v1.0.19"

