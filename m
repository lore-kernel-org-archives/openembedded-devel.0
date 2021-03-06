Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.12516.1615062350479477613
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Mar 2021 12:25:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=wc0LwqQ7;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.47, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f47.google.com with SMTP id d15so6727403wrv.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Mar 2021 12:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KIPDnsJDVXYs2KvWpyHt/wh4tkYdSNjXgo+WPLMI9HY=;
        b=wc0LwqQ7mdSiJ/SXgSq8kChxdZC/8rUIv7NDsb+lztTeaRymhm5g5x9PrU/DPcRlCQ
         KC0M6oAHvaOJnbFAqD9AiHT4W3YnK9+rrAHWRjC3t5yAGSn7Npysf9jLOT+sMFdrS+UY
         mopo8AWxPxxQDb5wDzROkOc3A7/DodLReuEWSLZhAKUnTw93U9lnrfAIvX1e2ReKsHLB
         lbFregBnOJ2QWR1+EJ3yVBceP/5CJD5GecHDhye1LXyGFgFEaFhy7eV4UMVLuWo1D076
         2iKXFb8cpxQcHz+frTWVEjzDOZFPvQ0KprPlz8rtkmWgTMWVbzTt2xMj+aja738TPIm6
         NzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KIPDnsJDVXYs2KvWpyHt/wh4tkYdSNjXgo+WPLMI9HY=;
        b=t4u2KkLkQ+Ka1jQtmIg8RM1TWPaawY1HcLwS99peihVJzVfd16atb/qrjfqwTcM77B
         BcIFy1v8HHvC5jTFDl4XE+bdOwniVXH2MAWPYgMM+ZeKAgIQOltg0Yexttu/X/UGrLqN
         NqnlQv1HL7jDqrer++dJrsduLl6Av/1RLfGj7IzBLrZDmhX728FBYolKSyGNt1EEsS5z
         G1btEoeyrrrCco6A+q9Ize1SPEd2fgQtnHhX2fO+rh+y6Ba/ef0FL+/TVrx9UlnbCDzf
         WPqko3cCraKQDvHA87+Y4JJ2eLVWMcaoO/kKGJEAi5vfJMWGJyoMQ/ZLCHa0MWUvkKVJ
         icdQ==
X-Gm-Message-State: AOAM533JMkqk2hzhlZlu0JiXG9ePIr4hewh1cLGbcqeB0s2jNBqpXLnw
	x4S2dCOnpyH3653kq5/wREW6bQ==
X-Google-Smtp-Source: ABdhPJy2g+3Eri93z1SwZX3qdI6098jRpldLn+/us5V2dr2G+O0B34yW7RExN1UsHyfQs0X11Ym8AQ==
X-Received: by 2002:adf:f083:: with SMTP id n3mr15034206wro.134.1615062348877;
        Sat, 06 Mar 2021 12:25:48 -0800 (PST)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id o20sm10637089wmq.5.2021.03.06.12.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 12:25:48 -0800 (PST)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembedded-devel@lists.openembedded.org,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-python][PATCH] pystemd: satisfy runtime dependencies
Date: Sat,  6 Mar 2021 21:25:44 +0100
Message-Id: <20210306202544.18324-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The current recipe for pystemd doesn't specify its runtime dependencies.
This fixes it by adding xml and pprint modules to RDEPENDS.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb b/meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb
index e09b633f9..6f302fa52 100644
--- a/meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb
@@ -6,6 +6,7 @@ SRC_URI[md5sum] = "f993739eca645749f18d4ccfd4a0fbf3"
 SRC_URI[sha256sum] = "cac2e42043ab28d43adf33dab493c6a3cf8a99794f824ae8af6d9cd6458b9972"
 
 DEPENDS = "systemd"
+RDEPENDS_${PN} += "python3-xml python3-pprint"
 REQUIRED_DISTRO_FEATURES = "systemd"
 
 inherit pypi setuptools3 features_check
-- 
2.30.1

