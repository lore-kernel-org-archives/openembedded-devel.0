Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D06FC6160
	for <webhook@archiver.kernel.org>; Sat,  3 Jan 2026 08:48:44 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21539.1767430118475321037
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Jan 2026 00:48:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KDaEVliS;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so98699935e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 03 Jan 2026 00:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767430117; x=1768034917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=aTewHuoM7N0xKZNVpZlV8KSd5u/uglf/ZVtwRX1vK40=;
        b=KDaEVliSWUD5s32S0xv50bBag7IObfXLbPjvIKGlWtkknDMdk7GPTvhjcMEX/eIp8K
         Yc6IQRERF5S2hSvMTAMMhM6xZQo2Rml6M0sxW3vYyE+HB/hsDUQxG2A1tV1g6y8uUIWq
         MfoFdoNu/Rjr0n6Y2MA+wEzVhdMcNwj0CryIfLooerIPzRWLWyj/OqiODvPA+TAAhaPQ
         +sXXlqmSb7VFJwPUUaNo3MCuSiEST/G7Q/yqlLHvLyojfwvHuCXTqTRYQdNgzqFjSaT7
         prkmSq6oX5Mk0F0C+bPwsBtiPd5cCYnbdP0cP4FBhdBEpvTCkHOWydSZcHVjUPj2M093
         OlNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767430117; x=1768034917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aTewHuoM7N0xKZNVpZlV8KSd5u/uglf/ZVtwRX1vK40=;
        b=cZLmARrVJOJhpOfJ/Vb8PLCFZHmRi7g57J1qdPfiFtktRinBipsdqun5cER9ACB+5a
         Uk3lNH9BalR58rC7PCWEozrZCYHPWLvucEcBBhmh0DMZwlRmwJ0R3PUNW54AGuCJgazi
         yXgxdFmQzkVG83Z1ZVVkfnlHIqfciK2QX6jE2YNnf8wiShsgnJvcoEVQplm1sdswoQD2
         VNH2Kbh4epwrhgYw3aEPNoKBhzM8bobJKM++jNX83sK7GRuytUQ0CqLTwQEHLebfoEQf
         zMYIXdxU7a7ZJAY62CiWeUMC/4YDBGdBt/gPiRhryemAEC52yJa/wCroL0AvBZkKWzjb
         WdDw==
X-Gm-Message-State: AOJu0YwxaQhwQPr7dkQdBldGfTHVBA0B7rr9nZGsYEAVDvTB0Z4yicvn
	2kd0M88ZEJ3rU3d3r7Q5B2TF+DtzgiJNM1Xg3+qZiG2TTp2gc4vsfRAaHNx0bg==
X-Gm-Gg: AY/fxX66TxeEAYqjO+6sfot+CqRiZvlJJoc5uIzApBfvSO7pw6n6r06dc6VwOWPzYbI
	E3HTQTgjW6hlBy4LCg0sfl9+y4aI/4zdTjvIqIVXo5JzeyhKbbBJTwhVH6Tiq7XJpQE1QJod3Kx
	T736oZUrme5gv2XYxy/ltFcRF1wkk5O6pAni7ag/mQMGW4VLMIH0u6Q28qniqIniGMckpduHfZ0
	WxYMclquZKla9qpqA92XyzNmPlZOX5YiJxs9VTKGIvVl/bMfyPvhhLDopDdZlcSSLWrtwnwdPpZ
	C1Nu7bOjFIklQ1iMQW7deIOZu+ldfpIzAUo3+Is3cY6Bz7JAjrPYzx035KkWzZgd8cThG8Bo+4X
	K5hmWLl4Az823CyjgCy7PJcL3fblHTdVaQ+xJQFfoM9ZBGv7pH9rQWxwgcndCTOgNb/d0tsQgZw
	TMdpxaNhnN
X-Google-Smtp-Source: AGHT+IFW4YMbSyzJw6PPDVCpGqtE1ydBxEeVS24de3+nwVmw4augs4WXG/cwfx8X/EEGpGpoS4j/MQ==
X-Received: by 2002:a05:600c:1914:b0:477:6d96:b3e5 with SMTP id 5b1f17b1804b1-47d1955b79amr500261405e9.7.1767430116585;
        Sat, 03 Jan 2026 00:48:36 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d13ed34sm26491645e9.2.2026.01.03.00.48.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 00:48:35 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][kirkstone][PATCH 1/5] phpmyadmin: ignore CVE-2020-22452
Date: Sat,  3 Jan 2026 09:48:31 +0100
Message-ID: <20260103084835.2022951-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Jan 2026 08:48:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123099

Details: https://nvd.nist.gov/vuln/detail/CVE-2020-22452

The fix is present in the recipe version (5.1.4)[1]

[1]: https://github.com/phpmyadmin/phpmyadmin/pull/16004/commits/ca42395ee4b2936d3702524f8fb8bec1e9502bc7

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.4.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.4.bb
index 0b855735cb..ca114d1f80 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.4.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.4.bb
@@ -41,3 +41,6 @@ FILES:${PN} = "${datadir}/${BPN} \
                ${sysconfdir}/apache2/conf.d"
 
 RDEPENDS:${PN} += "bash php-cli"
+
+# fix is contained in the recipe version
+CVE_CHECK_IGNORE = "CVE-2020-22452"

