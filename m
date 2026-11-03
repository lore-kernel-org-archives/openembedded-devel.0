Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4266.1793738644542733139
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 12:44:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=lydANpEF;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a3c08d6928so100156c88.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 12:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793738644; x=1794343444; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pABe/P+6oA6Tpz3CFOHmULoRAMUi3RZlq/7wnGVwSXk=;
        b=lydANpEFmSYTX86hjhFoA70bAxyArQ2iSRbdQeug87/j3z6l8PqGQSKgbFx3V9XttT
         Eb486oRgoL6oy+GrGej1GGFI9uhs7eirWO8Nc8rMY5gXqB7If54dlrvJxo//UChY6T8L
         hySimU0YmnmJMm7HQx4AOW5g8MsgH5seT+gl1T2p7y3XIdirGNNI4u3SYX+FNwzoFkcd
         g5BHaCple5ng4L3MAIfzhH7Zh6kOfz4kCf34huOSZwot/I8mCVVn8n6zcVOJb3dzSrjX
         GnwfnsuMYTfAhQo6tNaCdzFgJUe9M75esQFE0Sbs4ozUKf9FFAz36XJR/79PN2WktKzw
         cAwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738644; x=1794343444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pABe/P+6oA6Tpz3CFOHmULoRAMUi3RZlq/7wnGVwSXk=;
        b=fmkWPAqloVhxItO+pA4cU8R1PLj6B/wVci7EhbSVn+7KEF/4ecvozoTTfQLAUoydlN
         zLcgJ/nWO/Zm/WeNs1WpQYJ/rYIIhqYz9RUtoiOd3Qwpr3Ns44RTcWLX2q1/XASUfuz1
         1xi+jxVTEt6Fuj8ZuvD1qybouV2DqypNT6tiQB/bg6xykLG6eE1uKn51wVS7hBYGfzXg
         0F8lYLPmJNoPybUYvXnapPms4tr2ShPpBVIKFK5//FuxiSXw+mbX3X1UmfKqr0m1thyh
         21EzEhSABx5u4u3cHDh8AdssOek//3J7l6UtiTMpVn+PPTWxlAdKn+/Vw9Pn2RdquiHb
         6N/Q==
X-Gm-Message-State: APuU4Z9f63YxWwZmbUdZVkaOCW5klHOD07UO3dC/0XMj3Bu3wwk74V0C
	K15HN79Qk2t4IZArEnUF8wBblo3vDNkHlm63cPq5X0iA28FOOxROoUoliFB5Aw==
X-Gm-Gg: AYBFou08MZbKVhL2tA+fWvgAXeBZO6FZQNK+Gqg3B+DG7TWPFrmt0iMmapc+/Y4Oazl
	lRltgh138NhN2mJYK0o+yyYTz1g1IvrzLvPDUbYVDH290/BibXbMdYho2nxGeKwv0Y0r3D69Y+3
	MYiGPlY3s4nKMamA0tqGAS+MobH0wUbj+N4h2e3K5QR1OtSx3ConoJABKN9rBdk954drpMZTJ31
	TjQdtvwwkqy2tDzXvIKqOSq3YS42Atb7P5z0SftfPVk/NZy7wsr2DLl3qoBDloIWAl1v4j+w2Xv
	xfOoTRIeq253bO/CCy/OYaTsc5o64VmC6VimZ1SDoWQvQbN00/4LYSYwSM4TSr/8IENqXxgQuC/
	fB+DEmBgWuC2p5AIH3aNw5y3FoSfDgRw1O5iAF4bWqGEtU1Xhv9WDRlHZhbQjzs1XgQwg9CJ+Mo
	p8sOJvXe+awjg2Oh9EoHnPIr/oTv8/JVDw5BFJR8KLVlji/TRH6j9ISftmX+CqkKmXKJ7JqeqP7
	bpkl89ri+MljrklgRpLQuD75FNSN1p3xohlL+v6/mcwmGi8OTndcTHwBIBhOC3FiCOElx3JzKcL
	Q2nAUmgWwYgxPMJpt39qY06eab5McqoSw2+K//HBYF9+i5tkmashR6J7TRjSww==
X-Received: by 2002:a05:701b:4283:10b0:191:a5b2:ef4a with SMTP id a92af1059eb24-1ac5cb186d7mr21273326c88.28.1793738643552;
        Tue, 03 Nov 2026 12:44:03 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c6f0dcsm1544834c88.21.2026.11.03.12.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:44:03 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][master-v1][PATCH 4/5] libinih: upgrade 62 -> 63
Date: Wed,  4 Nov 2026 09:43:49 +1300
Message-ID: <20261103204350.1092741-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103204350.1092741-1-ankur.tyagi85@gmail.com>
References: <20261103204350.1092741-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 20:44:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131822
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/benhoyt/inih/releases/tag/r63

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/inih/{libinih_62.bb => libinih_63.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/inih/{libinih_62.bb => libinih_63.bb} (88%)

diff --git a/meta-oe/recipes-support/inih/libinih_62.bb b/meta-oe/recipes-support/inih/libinih_63.bb
similarity index 88%
rename from meta-oe/recipes-support/inih/libinih_62.bb
rename to meta-oe/recipes-support/inih/libinih_63.bb
index 2ec64c7e69..78ed12ab51 100644
--- a/meta-oe/recipes-support/inih/libinih_62.bb
+++ b/meta-oe/recipes-support/inih/libinih_63.bb
@@ -8,6 +8,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a7a95d2af90376e85a05318794e6f202"
 
 SRC_URI = "git://github.com/benhoyt/inih.git;protocol=https;branch=master"
 
-SRCREV = "26254ee9de7681f8825433415443e7116ff24b98"
+SRCREV = "611ab51f8dd7ec583543815b0de693495045fbf8"
 
 inherit meson pkgconfig
