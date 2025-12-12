Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06EF4D4921A
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 11:58:25 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11044.1765540704575853774
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 03:58:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=atLckY47;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7b852bb31d9so1375876b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 03:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765540704; x=1766145504; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3WCe/xLpfpBlh6gkfYfDNlXuUwnjlnL5lkuFMFSR/c=;
        b=atLckY47iub0lw5Zx+BkcCCNHsk3EY3qTpYyEPDkfyzDfGPJPJLUogBrX1hHqwIn5r
         I3LnuGtmiVjCdNgjX9fvCK+il1Af4YHKRh4uscfqMsjNDynbj0Qjz7XzTdnG5avV0eW9
         hwQqJeaNvNFDLPrNcMpCHJKuV/knfGhDzGx8/PPkW2BsKlyifsZzvV/pyPaAVLIgLC2v
         Lx5umFAJOdHTxGKKDqIj7go4WBkb0OfgKP6g4f8UEZiR8LeZt7U4Y9NWSGgvjjT1uzDk
         QjrPzHqjvXeBsK7Eed9wjV0fXAuufqTO1dZ0lsgQdMVB8btpLfI9Oplcx+Zzx71OmGKz
         u8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765540704; x=1766145504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P3WCe/xLpfpBlh6gkfYfDNlXuUwnjlnL5lkuFMFSR/c=;
        b=GE/sXjSxoPhCLUBOl5O71cHVveYYRBWKJL/S2q6NP2Ns9ahTxYhhgb/rkqUsUtaoXo
         8iWdX4HVqf3IOoVbWaV7kteAXyAJAHM1Vs1nTFCDgtya2het/VZ7Dl9bqmxQ4K3CYW44
         ITRftar4kklHT3nS5sojHz+q3HUSbsk+uFCQKZaS3IHXEe223TeYbd5IIzUGYr01PDrS
         J82++JK5iI55u3QTFqiVYyxKUUo6FmHO4WtaARraNwSZ3lkkG6wr/70RCSbr3ksAn6cV
         FJfd5XK3HwlHra3hVIqOX4N+CJiJe4Pyp1VlDA1AFlxSvxvq6dwXYATSVCm3uER8cfN3
         9mHw==
X-Gm-Message-State: AOJu0YzK3r1VBnBtElzVfwhk8UqT5uT0zKnTSWXyzFpe0P1hSljtCorO
	2G/zQ5teELHJQCcZnLbfzJ/LwDtt5CvIBpJbuG1Cl0L+JyF9CpSthYtYPn6Pfw==
X-Gm-Gg: AY/fxX4qrl6nn5WpIXAUmzWJYFUHdaqRGEFBGEQSaE9JJG64yKoHeXXAYBwGuTa1We4
	MAB0O7jQgwXXCYB4ItkI5G61mjwp985MGIWYTdb/itusiS7BgWKVj1BCm68R+JpdgB5Ukf/zxda
	DLS05dHEA2yYj2z2+DRRdb4T0MNY4e3o5i0ug+kd3lI6+TPpKvmEO2inK4TEebNfHTqxTGt8Q2d
	cHH1LELmXFvtYbqXmpoNzFboW97nNqXDpSxw2vfsjTt/vK+mx5+VaLSwum34uP1xzXgFZatkhKd
	hhWqXKz0YCyP6HJJVmaKu6E+hBTnOWJoy1vFRpGg6GYfLCOfsUquvBsngNhvWsaf+pZ9v69F+/y
	IdfYZgUpry/xSeaPHtFRhiFIAjyEgUBhw89ltsVYWbpf/+lEvTQXCdzqxAVJlDoaD2KmeGB6g0u
	xXwuKkbvMps50/b0fl6Ahoj31Hr5G88aJ75w==
X-Google-Smtp-Source: AGHT+IEiSc/zbUlPHyA9LQ3mXeps0EsrVCW9lBmZl+xGi4wETUBiyx81RRUTVN6tCDyfJF8J/w4D0A==
X-Received: by 2002:a05:6a00:4191:b0:7e8:43f5:bd19 with SMTP id d2e1a72fcca58-7f66969f668mr1582607b3a.46.1765540703792;
        Fri, 12 Dec 2025 03:58:23 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c27771b3sm5163198b3a.27.2025.12.12.03.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 03:58:23 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][whinlatter][PATCH 15/15] python3-protobuf: upgrade 6.33.1 -> 6.33.2
Date: Fri, 12 Dec 2025 17:27:44 +0530
Message-ID: <20251212115744.569676-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212115744.569676-1-ankur.tyagi85@gmail.com>
References: <20251212115744.569676-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 11:58:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122615

From: Liu Yiding <liuyd.fnst@fujitsu.com>

Change log:
https://github.com/protocolbuffers/protobuf/releases/tag/v33.2

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 668902b7742b838a27743d6b85073181b042ca0e)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-protobuf_6.33.1.bb => python3-protobuf_6.33.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_6.33.1.bb => python3-protobuf_6.33.2.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_6.33.1.bb b/meta-python/recipes-devtools/python/python3-protobuf_6.33.2.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-protobuf_6.33.1.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_6.33.2.bb
index fcf53cb9a0..d0ef7753b0 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_6.33.1.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_6.33.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "97f65757e8d09870de6fd973aeddb92f85435607235d20b2dfed93405d00c85b"
+SRC_URI[sha256sum] = "56dc370c91fbb8ac85bc13582c9e373569668a290aa2e66a590c2a0d35ddb9e4"
 
 CVE_PRODUCT += "google:protobuf protobuf:protobuf google-protobuf protobuf-python"
 

