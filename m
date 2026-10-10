Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC10CA9EBE
	for <webhook@archiver.kernel.org>; Sat, 10 Oct 2026 08:58:04 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5824.1791622665218946866
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Oct 2026 01:57:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TBWrQx/K;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2db710396ffso15484255ad.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Oct 2026 01:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791622664; x=1792227464; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zWzFv7VcV8XiXKAi/5k5BafBIIFnvFskRcYHqQH1Kfs=;
        b=TBWrQx/K88LF7wmG1/izu7CcWbsahRsun9TKRPeGX44jqegMLUIyHpfG+FrKpkB757
         /jI7oR9TswQCMtFNv1RxFm5KpTWT/Kr+8Qf+FPWWljTTrz8HJkBwwBCbDkihSwfO9JwW
         HP3Lz+Hm8P1ytM7dlubOxys3ErxWs5aWgzKDJb1A/nv5ZThAcdkyV4ZSCMH0fHva38ed
         E9KfyuDJ/OqoIIKT17P0hdFNXHmte3V4Ap0cwSY/rAJmG8TFUmU2fX5CqRerYeVQ+VUC
         J5J2zqHROZNZ8EKHkFVdEzU+U8rr4P2ySLoJoMaTmaXlWy8av+9u/kqTYuuBEOen9kOi
         9PwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791622664; x=1792227464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zWzFv7VcV8XiXKAi/5k5BafBIIFnvFskRcYHqQH1Kfs=;
        b=z7Dm3wobcvwREcVcoZkd9Glt5aLW7PfdnKv6xsMr3X41Dy1f+Gq6vAnaDbhamN7bgm
         7tCEr+JJ0a3v8rIZFNmD8C8KdMhLHtwKsFBb2pqzQepdmRMXNGvNbK9Rzx399nvFIBHn
         DOMUJ/d71rk6g5hxJLogIP5ANlsiVPGNIV6781lOI5dLyUCD0UuL17Psgna8x7y2MRN1
         lXcwtBj4W41HO1nRgXU7vuMJs9ur2/CU3HQHXQfpysz6h0Qxi8uevkUfPxJGRL+JSsjD
         3c37Ty1gQzKswno0DDRFP+2i7WkXn4pI8Rh8yuo554wafJU8+KljR35+YC13+1ZgagYp
         tvpQ==
X-Gm-Message-State: AFq9FYJYvJ/3ExB+7wmzDTRNdylt1vx+qbla1bHu+iMj3odyLwUMTxrn
	l6abstfQhzMgnvpef4JifNWuc9fO8T7OW2MRW3Z9OiMmiRncb/2c58OaNJeHhcTJX90=
X-Gm-Gg: AYBFou0GGwmZ4rUfFF3cmdGYvVgIul1sMVpyDgXPdysDYhH7Ku9t8znKZXt7EL739DX
	6/9TnzDM8fa4Nyxl7yjV7otmvEqLFGK3uBvtv6T775LSCgbT31WJJ8tmES5XmOMX56bzQAKcTMC
	jK4CQoEsPEfHAWZ+1BrOXBOp47yTAj+Qi7IenK0hGS/ceJySbM/SDRpwQ3hLl6+C3j1RJQkgtr5
	RK52VooUrM+4xX9eGApFBopBucWVWf3uKhYbfezdTEqnqytnAbHwQ/yhgwTrpHY3ATsPfRiK54b
	dokSiHlFBHvZ9zg3A7sRt4MT7Lem5kR3zhvBd69S6MEWpPy2CZDpXUJQt9Fs9Qfpj73ePz/Dh6G
	sMRNoIkS4rnLgAPORv9xkTCKhaUjhG0OEKhtx8OG5pRuVDf4tAvoHkVDOXxL8QEx95FCgicOFe3
	vocw0ZRop2SUslS/YNFvwK2TVm3ClfT5ForzpqFzbD0gFEhqyFmI/HWObnbiSXvFMoxynl9pTFm
	vy9oBqx9R3IzCsuKmh0MRHEUQG49IGFC8yg7nM=
X-Received: by 2002:a17:902:ef45:b0:2e6:caaa:8ea9 with SMTP id d9443c01a7336-2e842cd0a47mr26146695ad.16.1791622664550;
        Sat, 10 Oct 2026 01:57:44 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422c99b6sm20861805ad.65.2026.10.10.01.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 01:57:43 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][scarthgap][PATCH 1/1] apache2: upgrade 2.4.68 -> 2.4.69
Date: Sat, 10 Oct 2026 21:57:37 +1300
Message-ID: <20261010085737.739014-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Oct 2026 08:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130724

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://downloads.apache.org/httpd/CHANGES_2.4.69

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../apache2/{apache2_2.4.68.bb => apache2_2.4.69.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.68.bb => apache2_2.4.69.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.68.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.69.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.68.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.69.bb
index 35cbc7000a..394f9468db 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.68.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.69.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "68c74d4df38c26bed4dfbdb8f3baf1eb532f3872357becc1bba5d136f6b63c06"
+SRC_URI[sha256sum] = "c5e6ebc66e349b87d7fc6916ae7cc2a808ed348003de134cf9e9d89d3e2cc73d"
 
 S = "${WORKDIR}/httpd-${PV}"
 

