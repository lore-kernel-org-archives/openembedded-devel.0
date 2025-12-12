Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF851D49217
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 11:58:24 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11043.1765540702072879427
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 03:58:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gFzNr9/X;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7baf61be569so1354414b3a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 03:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765540701; x=1766145501; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0vPVFezYCwwt1vphpnj0B7qGS1VcuE91P/wUll4YOw=;
        b=gFzNr9/XD06uHoy/jzY/JTU2NyJl6iVhwO8+YilGJ19sVsWi+uiWraXcgfXihB4tJ3
         pJojcp7RGyVaVp2zCkKLwdIHaVqpETL5nHvtnexrOKuHHzBG7gSxQcgU1ADPEXXvWsN5
         HKtlVMEd3ydyLrg6yg11rXWIdI6KZb7bkkVF+zSKHUnY8FWHGaFVdJMwRYCkENTbrxdX
         gcmD+a3x3Z2u8ANaggIc0qYQ24OhsLDLqsOfyXz/ilbGCer6yErIu5g1TUqdTTZq5BH2
         8PdVuA/Qdz+MR2as7+afVYj56VC85cARpo2YK3emJB8WMUuyKj436hEHFjROtLmGQKbB
         /duA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765540701; x=1766145501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p0vPVFezYCwwt1vphpnj0B7qGS1VcuE91P/wUll4YOw=;
        b=vgHMM5dHOmXhLJ+7d28fqRg/wSj797wlzDpMNZz5mKEIEIt8+yf9MxDph7cGtOMBIs
         OmsxB0c+s0bt1N5evAMvgRfnFXitRYswrB/pgjz67SICR6h6qmDCRZUSoZkTgR+E6Dtg
         D7Q1YrQOhyXvDiS4NgRRXOLOTtY3YgRCDwv+lRbKMlphMv06/pn0wl3UG8c3dl8SNEJi
         IMxcFtj7EPy2IfXNfOb5LJHx4T/MYjmG4E6opORP/yJb8A4VMVNR4mcfZSzdhFLlt35b
         CabTPF3t35Hzc57GNNIDvuAoPt/w7wZc+HCFBJvxcmj1GcSAerzQKjW+A6iRxsHQdl/l
         XuOA==
X-Gm-Message-State: AOJu0YwAGj+k6tUEH0iiuNZvspfBvqNokReJxHn/6mbX+kzKszHgy7tL
	haGlVBuoNdJRpmgxC0XfevYbYcboJAH8q/UvvBIHYCLXgDi8uta60mpZPplSEg==
X-Gm-Gg: AY/fxX50sAHYc60p9F24t8WeO3mmcPLErKrwwDup9wCl3GyHy8Ie1BTml3jMCnJMWvz
	FPaa2k3gpNMynOuuqD5WB+KfOZWONB/322/1gddAOAgY2oWTk+dMsgtjxyjrB3CLnen5UVLoD4d
	ZKExBqJGtE/FHzQ8+QDBWtIBFi82L44UWFlYN4mAgK5iypWjm6PuYvUGP6UGFJH+jQzwLiHYby8
	RygsbXa0rhkh9wQCMwdS+9H2N8ig/sS9zgCy0iIpGkWDWhCksq2DwAWq5AL+OnxCdWI2vqawTBv
	Nw0d2bLoAH+sxJETGdFYw6CleSPmwHK/56UuKmML+LJfF6pGF+c3npY/U8kdaSbFZcb07NTnYQT
	DDvYjkkm/WwLwbymUXOQX5F62Ro1XeAZk2IvQyFWxTSpDgAvotFfhtPban8Nc/u1OR1P9NywXfu
	Lv0tPO3v62DDWH3p41fMRfsiE=
X-Google-Smtp-Source: AGHT+IHAyVVczicu8taZMmqMXzmAr97ufirTIb7MjPueXG6yuv0K6xPyAQwx1Yy9N4c8vyFSZ5Vhqw==
X-Received: by 2002:a05:6a20:12c7:b0:366:1a42:d166 with SMTP id adf61e73a8af0-369adad03e3mr1978131637.11.1765540701275;
        Fri, 12 Dec 2025 03:58:21 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c27771b3sm5163198b3a.27.2025.12.12.03.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 03:58:20 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][whinlatter][PATCH 14/15] python3-huey: Upgrade 2.5.4 -> 2.5.5
Date: Fri, 12 Dec 2025 17:27:43 +0530
Message-ID: <20251212115744.569676-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212115744.569676-1-ankur.tyagi85@gmail.com>
References: <20251212115744.569676-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 11:58:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122614

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 2.5.5:

- Fix for pypi

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 7954f37b3ca479b4b086e887afc7ddc03d7f9eb2)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-huey_2.5.4.bb => python3-huey_2.5.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-huey_2.5.4.bb => python3-huey_2.5.5.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-huey_2.5.4.bb b/meta-python/recipes-devtools/python/python3-huey_2.5.5.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-huey_2.5.4.bb
rename to meta-python/recipes-devtools/python/python3-huey_2.5.5.bb
index 9402dee2f1..d80ece1fc7 100644
--- a/meta-python/recipes-devtools/python/python3-huey_2.5.4.bb
+++ b/meta-python/recipes-devtools/python/python3-huey_2.5.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4"
 
 PYPI_PACKAGE = "huey"
 
-SRC_URI[sha256sum] = "4b7fb217b640fbb46efc4f4681b446b40726593522f093e8ef27c4a8fcb6cfbb"
+SRC_URI[sha256sum] = "a39010628a9a1a9e91462f9bf33dc243b006a9f21193026ea47ae18949a12581"
 
 RDEPENDS:${PN} += " \
 	python3-datetime \

