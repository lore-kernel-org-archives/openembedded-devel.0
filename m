Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.13895.1616423278820053012
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Mar 2021 07:27:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=SsmwU6S6;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.41, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f41.google.com with SMTP id k8so17160553wrc.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Mar 2021 07:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mqkLwDqXypeT6iTRFM11/B04XxYOlB/2Yy1cMP4oTXA=;
        b=SsmwU6S6lwf4OpI4Uk+Y2sCbklQHttcWhBVHhEXP8JN/SwDRSmArgRi+mvPJdeaO8J
         kynb1QFPAWTMEvAdA45T65YYr/88M2M7jFAHHzB0PVkFj5JJC3UU4UthZ/0C4EaRHUSs
         tx5j6DAGtdyQrAmIWHCdeNJMR1RTLCpuAs7ueyWuikWpnG57ZuudiNfLNMFf+9VgEYmr
         uO9ZJpAvzJlWpWRLeCgLSstNYIX8w3PIIZM1lLXZbtyUTHbNr1dVrT+he9Xj1XiOd1mD
         nelsIsaRVA49EFG721c4IenKlZb3Lh/j3bQdAngH+VNyBgJeAIfkQONRFHjd8Ci/YRCF
         9WvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mqkLwDqXypeT6iTRFM11/B04XxYOlB/2Yy1cMP4oTXA=;
        b=L527y4JsBv2QHvUkSsMM1cuMB/VLYHzi33gXc5TVeKTUsKAYCEybddYprTuMTSilps
         +iDzbwGAlrkTDIaD3Ke8MtMVXbQquVr8vHiW91VtmfC+AJrnAsOgsj0Nwpqr4yKtVQyl
         MmggoStY/8nzPsa2J0hMr+pRK6nqhhMWcz23bPkpMCRy+nBRIaXnz4U+xGIZRDwXVtuF
         PO0P6bP/TcJyJ/oPryqEZmKVLptlS4paQ31tCvfyk1ogxI25bD/GeLC9wghwRkyGsQ6z
         MYXN8NixQf+dhkaKLqgSuQxLlfv011qYYOVsLFLG5FqkXyKiLwWRowrJQ5Kc7dV0EsMW
         b3tQ==
X-Gm-Message-State: AOAM532JFtkESTj8PNn5Us6URn9F387l7Um+ottR6NR5+3UNXrrE5N1M
	lwQaY3owEw99qqVnw6YPwd4xnw==
X-Google-Smtp-Source: ABdhPJx0nJXgGVlXPI61VuCqMQHc+GiZkHRrkd6NRPDoos8Vkaa2cL6Pcdw3quys3WMWxv1QdhwnwQ==
X-Received: by 2002:a5d:65cd:: with SMTP id e13mr18862763wrw.334.1616423277227;
        Mon, 22 Mar 2021 07:27:57 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id l8sm20498379wrx.83.2021.03.22.07.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 07:27:56 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-oe][PATCH] libgpiod: update v1.6.2 -> v1.6.3
Date: Mon, 22 Mar 2021 15:27:55 +0100
Message-Id: <20210322142755.21353-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a small bugfix release addressing some issues with C++ and
Python bindings.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../libgpiod/{libgpiod_1.6.2.bb => libgpiod_1.6.3.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libgpiod/{libgpiod_1.6.2.bb => libgpiod_1.6.3.bb} (91%)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.2.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
similarity index 91%
rename from meta-oe/recipes-support/libgpiod/libgpiod_1.6.2.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
index c6c262b70..d9c251705 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.2.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
@@ -8,8 +8,8 @@ SRC_URI = "https://www.kernel.org/pub/software/libs/${BPN}/${BP}.tar.xz \
            file://run-ptest \
 "
 
-SRC_URI[md5sum] = "4765470becb619fead3cdaeac61b9a77"
-SRC_URI[sha256sum] = "c601e71846f5ab140c83bc757fdd62a4fda24a9cee39cc5e99c96ec2bf1b06a9"
+SRC_URI[md5sum] = "28e79f6f70fee1da9079558d8b7b3736"
+SRC_URI[sha256sum] = "841be9d788f00bab08ef22c4be5c39866f0e46cb100a3ae49ed816ac9c5dddc7"
 
 inherit autotools pkgconfig python3native ptest
 
-- 
2.30.1

