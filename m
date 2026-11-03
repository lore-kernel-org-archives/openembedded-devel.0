Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1464.1793731010270665539
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 10:36:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=B37T4RuH;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso4980201eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793731009; x=1794335809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sYu9iTHvNeuuSyYS7CRvYj41EctkaVcbzDEBvBZFBh0=;
        b=B37T4RuHR81FQaW8K6Xn9C1ejnNSY4QM5HtGFeS+Ul4wpvl2DErkn5xTXIwcRfrEMv
         qhVal/7X3whn2n44MnRvjrG2+jHCs5Ga+g97W65Y7q4JFloLATXFEtcbgt/SXwOfdrqc
         5A1A4MOx31s5esh6HTm3Q92xJfJjk55/4AN5aDdo6D5V5UBMs3v6jF3J+x9CjVQSG2k9
         1OmHC5Q2M0X6NSmyWj2VABTOcC/R9XDfO0XEXnjXrUzhjH4I8Kx0vD/nltTc3wudUIWa
         2CQ3igeJ8xr3v+9HIAe72DyimVyNYD46TVStkzV0Qb+QJAx6EsY7qY0f7OPBqkymAXro
         orqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731009; x=1794335809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sYu9iTHvNeuuSyYS7CRvYj41EctkaVcbzDEBvBZFBh0=;
        b=A79nPIRp317WKNzG6xoejTFRXMUa/yVUnx/OjLb0NL1P05ZVV3OaxaVJ4buop9yXUE
         trb20rfumoA/BXfkEMTcRBRaoYaUcrMg3xFyzUDNhDokWXahWVx97qlBVT5ciBknPrwY
         GUrXTQSgldRG1Do+Bpnh2ToAjuF8LEUbtiytEw+Rs5n57h3dKPqXR2G3D6kz6aZuIWeH
         S7be5LO0m6Qb4FudQXaHKsaqw3Kr8HYtEwujpd8p6mQJajm7ntqOaihkkEcWYyTGSe+o
         Tr1K0uxFrWsgs0TpfUHSoveFhZnmPezQzNARXYt6+O2zR4lWfTHyDTRchN68Z6VcPnpp
         myow==
X-Gm-Message-State: APuU4Z8H8dPwHfZynn1cnGefyzcu6jU8NCYcrlidmun9NBiZQcMUgyuv
	jsz+ezdU7ync7XRhzEpdFjBU4hBQKeSe5tY01B1KGW4X943dqQr08m8z/CbIJA==
X-Gm-Gg: AYBFou27hlXXNyggxnTvlU5BY1XnoTtZwWvz/brwtvpfKGCEyoGIbjxxIdcOjf0G58j
	jQfe1sNxVBtiJGKcwIm6PKqvo3cn2dDbs7AOSNLdhQA7s5+WahzJNad2EuHdRNxpwJhmJaot2pi
	cEIwVB37pR3zBdGdJE4xo2Fs9xCxZUKBTUZgr8IfNnhTKYci4BTfOdWLA6/NgLTDXhqVHqHhODL
	+sebVAIuZ4GPVsV2JxLvoVsd4ebQmPNH9Vwv+b7Db/7zSXZheePglA699aCBL96BWuOZ5znR4+t
	U1hbF7cgOlnhyUpAy066W+E7vFqC7krhZpfwwHOqPj4pJ4tKlTbgGSdqCBly8kr57w8zzT6eqe8
	ayTuU5oUEd2lewSNGtZeEelS8cG3TjdHVsEpjvSmL+dT+kaDvdB8WDe6zoUeT9WfIVUEBZ/PKWd
	+MFY7CWh5Vvuz/6ijR/cMw1fNl/zIXNgPWhCrKL29xXQotsJGPc4wAP0ZUWS0khWE+I//AikY4U
	LIfRYpjf7i0CpgDzwp1vJLWEE6ChJVR5wtEjoNESkc+5O8JGXFPb7eaVaR88WRdVB1y6uWQ00bt
	I9o78w4NNmZgsqmQFe6AjwkSRqB/pH4bqgO416/rMshJTY+HA/a781N4fr5jlA==
X-Received: by 2002:a05:7022:7f12:b0:1ab:faad:cc9 with SMTP id a92af1059eb24-1ac5bbb503dmr20756987c88.11.1793731009406;
        Tue, 03 Nov 2026 10:36:49 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4f83fsm1192887c88.17.2026.11.03.10.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:36:48 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 2/20] libuvc: upgrade 0.0.8 -> 0.0.9
Date: Wed,  4 Nov 2026 07:36:22 +1300
Message-ID: <20261103183640.919438-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103183640.919438-1-ankur.tyagi85@gmail.com>
References: <20261103183640.919438-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 18:36:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131800
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/libuvc/libuvc/releases/tag/v0.0.9

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libuvc/{libuvc_0.0.8.bb => libuvc_0.0.9.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/libuvc/{libuvc_0.0.8.bb => libuvc_0.0.9.bb} (89%)

diff --git a/meta-multimedia/recipes-multimedia/libuvc/libuvc_0.0.8.bb b/meta-multimedia/recipes-multimedia/libuvc/libuvc_0.0.9.bb
similarity index 89%
rename from meta-multimedia/recipes-multimedia/libuvc/libuvc_0.0.8.bb
rename to meta-multimedia/recipes-multimedia/libuvc/libuvc_0.0.9.bb
index 0c4d765d7d..ddab31eeb0 100644
--- a/meta-multimedia/recipes-multimedia/libuvc/libuvc_0.0.8.bb
+++ b/meta-multimedia/recipes-multimedia/libuvc/libuvc_0.0.9.bb
@@ -8,7 +8,7 @@ DEPENDS = "libusb"
 
 SRC_URI = "git://github.com/libuvc/libuvc.git;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "4e9fc773914377ec0bcf2f31621f56da5a0fa09f"
+SRCREV = "448d78b9aa4f54172c1ca5b5d1b4a6b9b93f7957"
 
 inherit cmake pkgconfig
 
