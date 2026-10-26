Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7933.1793057203523425737
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2026 16:26:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YxQnWXv6;
 spf=pass (domain: gmail.com, ip: 74.125.82.54, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-185fd3a4ca3so3004752c88.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 16:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793057203; x=1793662003; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9+hkwzXtoBeBGLaAyjKuCDQzfTLB6F24ErwKDNe25FA=;
        b=YxQnWXv6DgQ/agyGFAz/z8JmKbFOVvrg9Ys5r2KO9w7z3M71Ej9ghSXyCuTZZS10Cq
         23UBccoVwOLKSuIJdu45b4Tp7JewUdEiG4qQVGAFOkg4eSR2rgvtMQbGSP80sA7WVQDH
         +yKdWd4VxzPRZ0BvkCBrPP/PGuMkR8yHZ3Ao8QoGIiR21/bsrojWSb2M1e0V6R/Z7G+w
         u+X4vgVm+ruRgatfaFwzqnoEJa5Yrfm36I4bxUEiCUvKuqk8C66TYxlkvHMvOivnoBzr
         Y/IkY7zDqxnNYQO1MnaPI6vSHuTu6zhePgSilvsol4osQhSaqyPupQXI0XD12R8w46ca
         8HAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793057203; x=1793662003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9+hkwzXtoBeBGLaAyjKuCDQzfTLB6F24ErwKDNe25FA=;
        b=TAfwGDVWRo/xnGgqjd4ZZ6UUdYIBbMBy/82jwqQjLnroeZ56+hWgXnd4kB2LKu6NZf
         M3l3o/05Lh2RdoPVMSzrKe9AAlwh3TkGBlq3Ty3+guHteC57z1HHan2YhFe65oIHPX1E
         snPmJb+4zShj7vijnVyZtBgT0C28LoKNRpDP6VAxMk/DDUtCkygXjHzbLuVfeQqCtEi6
         0TjVmXrqdgzLTVES93Q7O8LH31xHM79l2nY7q8yIgT6QJFmzhFs516A+tAD1J5ZCHB5Q
         Agsob8J+QoKyXCP5S6xFiu0hGxNZc9AJmcpwsWwlJE/yduYy14kWLsxV64VgOvY/maDK
         2ZUA==
X-Gm-Message-State: AFq9FYKlBOB+MTbq/VM8HbHeOu2gWMV8Wt5izbRQo/brLXzVjFhJD528
	BxY6rMyPFH8YZ6oM3bfd9GH/QEpJ5AtqNLXhyD1APDIJRx5juBaXxnvc0GzqFQ==
X-Gm-Gg: AYBFou3UtYO7vAVW/U/2DbD1MPXXgByB64p/8ZAeZ1g6zLmosXcrzzvXOUwt1DptTM9
	z9ugqkPL0FsKPFZWcIgdFUXMWbjb5QY9L8Jra8ePdROFiMYIjIYu2s7eifGAJRm+wdcwhzxv42A
	VmeOeJYkjZNxaCDuSbW44yHplXPRNe5nDdkTxqY9FOhESoy3qIKrMUalKpt1aE6ieZGDnxhRxSC
	M7V7KYTSwCVoX1V+GOG6w7o5B1c5uAxFVvBm30MihUMNx6gFnJrW9Ov1zpD2LKLUCfPDUNw7+D4
	PdTHzhqjG4hDlaFljGHhYLK3khZe95B7w54xPbtooo+jqqa4cHPOovUA3t2jF/SXmXAhmEPogon
	QO4KBF7+/Fm0oYWgBhWbs8++cUQnh5K5F/IqyaevOyqRBCP9FOCIYctO2b5sygdu+IshdQArJWd
	/u1GpC1jsgeFp6m0g+5QcEzYX+cCjkE4adqVOulyyzba0dRKFwQx5zxNTiojSBcmZydlYF8QrFB
	tymQKEIVdPNB2LMzu6gELcOFfB44s8ECVp+dX3E4ek5dMowp2iX6SUhSLr4Bw3R4O+Qd45QHwXy
	1XtkIbQLTtRv
X-Received: by 2002:a05:7023:88d:b0:169:3706:d61b with SMTP id a92af1059eb24-1993505df7amr12784555c88.16.1793057202643;
        Mon, 26 Oct 2026 16:26:42 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0e8d700sm32234982c88.10.2026.10.26.16.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 16:26:42 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 6/13] fluentbit: upgrade 5.1.4 -> 5.1.5
Date: Tue, 27 Oct 2026 12:26:18 +1300
Message-ID: <20261026232625.1275411-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026232625.1275411-1-ankur.tyagi85@gmail.com>
References: <20261026232625.1275411-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 23:26:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131446
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/fluent/fluent-bit/releases/tag/v5.1.4

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../fluentbit/{fluentbit_5.1.4.bb => fluentbit_5.1.5.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/fluentbit/{fluentbit_5.1.4.bb => fluentbit_5.1.5.bb} (99%)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_5.1.4.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_5.1.5.bb
similarity index 99%
rename from meta-oe/recipes-extended/fluentbit/fluentbit_5.1.4.bb
rename to meta-oe/recipes-extended/fluentbit/fluentbit_5.1.5.bb
index 5938656858..a9a5122e83 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_5.1.4.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_5.1.5.bb
@@ -17,7 +17,7 @@ DEPENDS = "\
 "
 DEPENDS:append:libc-musl = " fts"
 
-SRCREV = "eef172226af2879b24ce61d8d73a874567e465c3"
+SRCREV = "0039c4f0d1b530bedd8448df2fa4c301d58a5b91"
 SRC_URI = "\
     git://github.com/fluent/fluent-bit.git;branch=master;protocol=https;tag=v${PV} \
     file://0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch \
