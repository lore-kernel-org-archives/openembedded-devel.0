Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4299.1793738745052730704
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 12:45:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=vZ8hLk6O;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a8cc11ac42so85502c88.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 12:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793738744; x=1794343544; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pABe/P+6oA6Tpz3CFOHmULoRAMUi3RZlq/7wnGVwSXk=;
        b=vZ8hLk6OfSB0VwinaN6JcdZYYk9EXl6c2MamlKwHKTm0LSgEhzBXZuLHQiaPegRuQL
         +eYIF0BJdcK05n+dPyuVA93Y7JCC7UjRtl5GMwCVjOruPYgkeZhOexMrXbWE6cBxuAsq
         5iOfD98MUVAm7yTqVjACuxIVi8M/LL8iTxvA+qP7rxWs3uIkHWG5gfXHqEG5LoDK58zZ
         6ap2vY5oqaObLNNpI7hzpaZft1RMJM0/P1oGnf4ls1fZAsmsFPKj7ltIeppRyI0CKM3G
         TWlJ51TXu8InoQAVcBHyh2JyODHCzdKcXcBCOilyU41z4zymRg0GzoRSfhHK2OW3wSJu
         gTUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738744; x=1794343544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pABe/P+6oA6Tpz3CFOHmULoRAMUi3RZlq/7wnGVwSXk=;
        b=v9adjyEREDIL+vTxPSfmP9MVR3cCB5mVpQABbBqeIrH4ZdVKkaEFoZpQf1BcpujKLV
         inYPcYtr0qChUXTlxIO7NnbAK9pRCFb8vhM68AI1qSTHkIxWsjSfaffIehpP0YLpVOhP
         yCW9sbVsPGAVEe1UbzdMca8MI6bo4y170QlJxIHLdIe2oJj/FK9+uYaejZJNS7GrM5pL
         2W0CX4pHQyLWFnjIFP3S227ehQVne2EgsebPZYg3BrfCqFT+BGuRMb6U9TwIwTe0ZUS5
         o5EMEx3ipzjjxKFuAH4i7moyRRXi8Ft+Cg51M9Ueu80enVCEdP7P4DikhjIUzGud+ieF
         BU1w==
X-Gm-Message-State: APuU4Z+wO7M0/t8npprMMazylw2ABRvjwNAseVh3RM5rRzceQe1xuIfV
	Idz3J23rNovfXQzqLbBdPwY3gK+xvMJEkUfWFIGDDYqt3wSZDtL/lZ/RrX+73g==
X-Gm-Gg: AYBFou1W+HkFuonS/uFnYGpuj6s4zlgV1hzlgm83gS8aQO5gId5GKCKSHlCxOdmIKY8
	8ouT6W7J5H8zCGxRckc9g+b+5lajqPagL5E41HjZ3OR+Y2c9g/YhfNzXeCTGMNVdrCOvG8M5uo2
	RdZTxAW4GtU48frQlg1DZN17n093H0Jc98n71DWQa4XJtYE81EuIuNiIDG11nXWAFhJzJoMadHR
	wu8ftOOlh/z0n11ANCBc2sXjcaEKPD9dW/fbceBjc5dIGk7ZJrbSl5yjLjPlDLwgh+N6UxzTR9X
	W7QhfP4I0ZWmBJaH/WKtSV98rQG2SCqQeEFnGI7/XlSalX2FuFIifdbv2oCBODNguTh9PWODWsc
	qE3nRE/7v1DSGDJ7E5O0qQR1oatutsztw50wra7GJr1b5NaeT8Nh52d7cSlb+EBwL6Zd211fSp1
	YqrXwj5s8B0+GfIGX74F8X9SOH/aEbQhBedPDS1SQplAC7JLemH9FdpW6fOl+jbyivWYlO0Vp8z
	XUlayOVEawJf6LuEUrcPuF7NiTz0aixGO+OI0VL97MmCKzvjdsYDPz5KWf2l622BBihGLK3RLbC
	mLMGADID8SjifimfcXZlWk0u1PihK3FXKXUbPI8GlD5MLLxn8/DVftQvzerB9Q==
X-Received: by 2002:a05:7022:1187:b0:168:6ad8:e89f with SMTP id a92af1059eb24-1ae5ea2cf95mr16081519c88.3.1793738744153;
        Tue, 03 Nov 2026 12:45:44 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c47076sm1104555c88.16.2026.11.03.12.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:45:43 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 4/5] libinih: upgrade 62 -> 63
Date: Wed,  4 Nov 2026 09:45:27 +1300
Message-ID: <20261103204529.1094356-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103204529.1094356-1-ankur.tyagi85@gmail.com>
References: <20261103204529.1094356-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 20:45:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131828
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
