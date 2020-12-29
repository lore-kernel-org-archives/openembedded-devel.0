Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web12.8895.1609223290160253025
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Dec 2020 22:28:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XB1OwDpB;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id hk16so1005103pjb.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Dec 2020 22:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7slEZXeNV69Xl0N00isfDho1nwFQMZA0TbaS4ZlL/jU=;
        b=XB1OwDpBwVmWqT22lM8N02kVTp6Fcp5cJVCZdOYiSBpTIaHxZTEG2AQIpmrPJY6xRc
         YB4Jng5dVJdduKIxHdxoglWEg84RV6NtOPJLb5t4h6gpsfxa7xIzOpyEwTx1LynpwvuQ
         hp+Z8tktv49AMvTNPgtTB80ih/ItBncMaGkwG1CWQVgV3BJCj8+C8vCiEqizWmEIihQA
         jHzcLMPNLXrhNiu+WUzDzBOKSinGvwJn+FxFwm/wHDEvzusZ3kiBRd3pJLqf6p3XEUtu
         J7+RErC/1tI+lHmxp/haY3/fL97gdN2u1+MuQXHigT/agzKaWPC3gYFPrjZM/wVExG/g
         rTkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7slEZXeNV69Xl0N00isfDho1nwFQMZA0TbaS4ZlL/jU=;
        b=g2pAxFzxf6qdwK4oUCVqZTGDSFonzGvApvCsSjGdhHPf4zneCrGhfa2CkvRlSJxkWi
         xqsGYfsvKvyg/A6zfFxJZ1KXT7qnp9GmkFg3S3/HuvkxZsI/Bab2L/4TOctK95XTFnQ6
         lCf46t7DH+/3BI6yFS070NUsws5GgyOqc8MQxN542/5qWZmheCRqRykgwyxkvxkE6zGT
         ojyT0OXDiNydUhNAwaAJKEiXQQW/nHRPcxA4k6RjhE7/CNq8cL17JhcV7Fe/2OMut0q1
         j4Lao6Xo8bAbv0rarWdzVFXXQOL3d5UbN7fH7S3fQO3ZXthzzh5MUUBDbMXUVl4s0zRa
         ahrg==
X-Gm-Message-State: AOAM532gq71mkAupPPm/IeDegZOyF3q//xrXIOjRXqdqeuSGf1FbDnnS
	pHfNzn9aEziZW3Sgqb2zLZ3vvjs23OG+XA==
X-Google-Smtp-Source: ABdhPJxLEXtwlHzdBUZiVADkZjwpbC4XprBi/YjB0jfGY4vsgdTFXItdiCv4omcsUeGSsTCZO0BVWw==
X-Received: by 2002:a17:90a:5891:: with SMTP id j17mr2639585pji.166.1609223289523;
        Mon, 28 Dec 2020 22:28:09 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::92e8])
        by smtp.gmail.com with ESMTPSA id j23sm22117591pgj.34.2020.12.28.22.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 22:28:08 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] iwd: Upgrade to 1.10
Date: Mon, 28 Dec 2020 22:28:06 -0800
Message-Id: <20201229062806.1158419-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/iwd/{iwd_1.9.bb => iwd_1.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_1.9.bb => iwd_1.10.bb} (96%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.9.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.10.bb
similarity index 96%
rename from meta-oe/recipes-connectivity/iwd/iwd_1.9.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_1.10.bb
index 25500e6501..b2495348ff 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.9.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.10.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
 DEPENDS = "ell"
 
 SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git"
-SRCREV = "aa3dc1b95348dea177e9d8c2c3063b29e20fe2e9"
+SRCREV = "d8dc5a9bd19c5b98d8692801d3cf4e8af495930a"
 S = "${WORKDIR}/git"
 
 inherit autotools manpages pkgconfig python3native systemd
-- 
2.29.2

