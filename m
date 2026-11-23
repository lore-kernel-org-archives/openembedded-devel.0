Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48046.1795411879936558211
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=jDO3DujW;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3866a784546so3600173eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411879; x=1796016679; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LQCQrhCaBbP+tY9GFpEvu5QAEEhteCi5SUK19OBBEW8=;
        b=jDO3DujWQT5mia2nBYfA+GMPfje7sfNb/UJJPYU+hAEBPtALfajRYa/pj4p96m63jd
         roAXbMQa47Y0X0tvglazn9PCX6FgyED6TUVWBzQvYSQ2ezZ3RD1ESwuW57tbC60NKEfr
         Z+65l3SXCDJHgwT7rsH9bVE3CcRX+dvwOFDxDo3cIXJyzYyUHQPje9sMh0F1xQRghIeO
         ca3wPM1+gJGl7+jTwImUqd0HdVKKp8wJ29dMw1TfjNqMPKqFsWc8qj4Gur2utj0Tgyyo
         DWZdKJE/wwaPoBWKe6uPsnRUZg5L4BRN2SguU2Jjxw10SiTtEn0sBRUk0UDNi6HmJNow
         aEpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411879; x=1796016679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LQCQrhCaBbP+tY9GFpEvu5QAEEhteCi5SUK19OBBEW8=;
        b=dQGDIBuAml5JjRqeg2jefeWw0Bly4Ccj+uDCXdUJAtF5pKunec9vXqu1fDkLY32nJp
         jThINZ4q2GlutUjauJUgg7JOrCJVtiFsimMKno3iTVLoIR2bVY21i/E8WoG6fNaFMxl7
         pFYZ1+EOMEWMmMj5B2JvYJ01uUI6BVlekeZY6qzxB8/237rEGKlrGICx5oLeY3naRSIh
         /yKVon/4rzzEZDTxAqIYEyONGfpouu9GojFefA7TLGYSwNgmxUJpHoKqDV/iETyUky82
         qgG6LCLFQf4jHd1YEoJNiS+tSo+/BvOM6t7CsALym15b9o3oIqzKxGRULi9D17lyYnwz
         g4bQ==
X-Gm-Message-State: APuU4Z9u71CcVqb5cEYgFD3MuQZDQ9NBHpnxRbkSicPOLCIUB/EYcUUv
	nNMF2842/fgRz8zEvYzhNSgvpNRgbgiDpemr9L0qZyK0hqA0q19DGAak5Jbm0gV2nFU=
X-Gm-Gg: AZFdTZff77sqFlE7l6DvpanuahTkIfI7WXDLOVAJEloV/mOBS7CsazSG18Ndvr70A99
	FJ9IM755KoQTq2RegL+ZNApH+F9JqmntN1f8FN5EOhmzyNJkbRGfhwHrrt68hTq67kyRX/YfFGL
	4azWibwwlonO9TY/PPbXsrf8O2ze2s3c2PKaeKSVJAa/DJ33OBhrI1fAF8ASDFxcriY+DT/7+d1
	blmKVbXnpj5arMcjmWtWqtddEznpkB0LbIs334KPNi14phrAuEA9R85QYsIF5kXWy7twTdPFxC3
	D+hCwmRWKwR6lLMhPg5sRo0opi9gCufOVgThHU5tTw3IHPK8enWNY3rPgfKZ1C37DXUsJg6BkfS
	jwwN1EO9zkFNaLjdP37RQELO6CV3Gxea7KsMfctLCxGlUDTnH46811WbF3x3gdtDJ92UoKD17Pc
	bwxp0rYCcbS9ozt7WTCZl4mOG90CARkgGNid7fiwICEir2Ui0jMNUCrx4bBvvbUqJ4EJE7EUXjR
	cSAj/hEbELATr7NvzE+m/yo51nLOkbSalzGo9mvf4nQlAYSdMTUEAbISOz94DrocxjNfhv/SlNZ
	QmD5pCh6F5CnPsw/L28jjQ9hBA4UDIzUEk078BXb8YRqOnTEppxfVnxBP0WxTJ/7Yeq8huvHSIX
	SuWJ6mvDQpy696UZv/nEnJy8hBG4MTS7L+WRQ1oyb2PRlr3QtVk1t7LOrXYgL7yh95wCWcZowxw
	K2dPwhgzPYREGzDEg4wQ2IE8NCR72CJq6dQ7r5EC1rZo1TyP4FH1TXjnE/ug+Jw2ysngo3nW+Fv
	TVXZIs75hpKM0FNoKcSo7RejBH5891qYvBAgPdnOU4opfQccpt6wCviTABtkPcwAb7TXNSQireL
	uD55
X-Received: by 2002:a05:7300:1486:b0:383:6eb6:5730 with SMTP id 5a478bee46e88-38570e24c0fmr13009369eec.32.1795411879224;
        Sun, 22 Nov 2026 21:31:19 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 40/42] libirecovery: upgrade 1.3.1 -> 1.4.0
Date: Sun, 22 Nov 2026 21:29:24 -0800
Message-ID: <20261123052953.3658549-68-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132855
Content-Type: text/plain; charset="utf-8"

- Device database moved to data/devices.txt with support for
  user-provided device files; new irecv_devices_add() and
  irecv_command_is_breq() APIs, async request functions
- Support for new Apple devices (iPhone 17e/18 Pro, iPad Air M4,
  MacBook M5 models and others)
- Bug fixes: robust iSerialNumber reading, halted endpoint handling,
  device list locking, leaks and double frees

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{libirecovery_1.3.1.bb => libirecovery_1.4.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libirecovery/{libirecovery_1.3.1.bb => libirecovery_1.4.0.bb} (89%)

diff --git a/meta-oe/recipes-connectivity/libirecovery/libirecovery_1.3.1.bb b/meta-oe/recipes-connectivity/libirecovery/libirecovery_1.4.0.bb
similarity index 89%
rename from meta-oe/recipes-connectivity/libirecovery/libirecovery_1.3.1.bb
rename to meta-oe/recipes-connectivity/libirecovery/libirecovery_1.4.0.bb
index e7a2ece779..74859bb673 100644
--- a/meta-oe/recipes-connectivity/libirecovery/libirecovery_1.3.1.bb
+++ b/meta-oe/recipes-connectivity/libirecovery/libirecovery_1.4.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://www.libimobiledevice.org/"
 
 DEPENDS = "libimobiledevice-glue libusb1 readline"
 
-SRCREV = "b59ef4814525f487287da1609864f432cd79e3ed"
+SRCREV = "25147fbc926d668f425b36fe3157dbb25f548f45"
 SRC_URI = "git://github.com/libimobiledevice/libirecovery;protocol=https;branch=master;tag=${PV}"
 
 inherit autotools pkgconfig
