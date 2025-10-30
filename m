Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80105CCF9F0
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 18:19:59 +0000 (UTC)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
 by mx.groups.io with SMTP id smtpd.web11.4942.1761848390937343164
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Oct 2025 11:19:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O/r+80Sp;
 spf=pass (domain: gmail.com, ip: 74.125.224.46, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-63e330a1360so1637944d50.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 11:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761848390; x=1762453190; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bbg/IdkSlnq6WILkGrmxUd64HvWpDBqLvI5n6BvHlnI=;
        b=O/r+80SpbzpCY4ou0JRufDLUl/RpF974WC8BAzY5vjBJAaetdcrrAA0+/11l6UJ/lo
         /5Cx4EqcChhRQVc31mGCqSrUzJ1AS4Myx3pL1HZ9i66Fq5cMgf9dwX+Y2lIjAHoXPG96
         ZW+vWxQv/ksX+cdM/4NqFfHKvBwZH/S4zg2wc2XUTBv95A8JH7riJ2g9e0l7ZRCdKUMw
         6FEZDfvqkGbC9YIkIs4u/1eX2RlHjZDlJhOdqlHCHKNXIxCKlfl4AO+7tR2lCHmuxFM8
         GJeeVMLTlOIxUd7MoDpjV41bklx7jMa3jWwUMRXDplaezF+NbcKNsVwIb/ZJ2hBkbtbb
         RdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761848390; x=1762453190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bbg/IdkSlnq6WILkGrmxUd64HvWpDBqLvI5n6BvHlnI=;
        b=XjrGdNCaLtDAbCXVFJHUYJCbafagDhHFhY9i0vPR9pMjfSezXrzD0jRMIKul87wn/0
         rZhuWX3C2b1Q5Hj0GIQRqWwZlv8g6jlzxGcotRxLa/hBnfopep01d22QQ3nOLgRadT4Y
         Xplxnm4bmYFVsbLQVMtenwhjzOOw7CtXt1uMJ/WRp2NvKoTBddNPQl94+JrpA6einE7Y
         0oOBzIS6Xog8gfSukbB71F+IX/d540c3hBTQtcgvs6Iq5JjXVzPPR2yAOggaNZxujVf4
         BKiaVIe50UcEiOPAnGFo9ME1aUMIQ0t1b23B2LHa/MShT/AWXRXoeQ4bK+5swbyzvDMd
         mL/w==
X-Gm-Message-State: AOJu0Yw1B+lZasXi1mxdTwR6SgNBf8GBaV4+pvDEREjimcXAHvZHG8Xn
	TcsIfth6p3Z6F1rMRDrFMS6TgJjBw1b94H/bhMjGXW4WMqqZVpJmw6muE5TL3qFt
X-Gm-Gg: ASbGncvmB4wWhkuJiH8z+sIQJ6IB4ym83CEws4R7fu/VfTMmGNX/Rp0Js2p7s1Vpdye
	LuCmbHlf8t1ZIu6tGIDLN+99qd8ev2xlIk/4ntI4qQBzYMCO/1YhYqpozVuOnWSIRgXvjtkLWKM
	rXQBNM0uOwJdiZgdJyBy3j5rzgP6Aiur+QdHa8YA1hfBltTfrBdxZaNh+xEZ+WMdX68oJXMBpM0
	EOFODva9F/PKZ3o0r2hsOEuouz61ew4FChRpmUdTnQ4Or91IXqvjpPg1Oq+9s65xYQeE1tyHmj2
	VTx9iXWdJmRko1oLXLB2scNi10TcXOLOfaBC2hjcduA7Zsd7XhN/maYJYYg5SFPYWt4gTJ1KkcB
	wkPDGLysRan3m3QO8b9atbVCzk9ouHHJMGaKWXZtnWjxXqFIgBiPgav59fOQgxduMugYhWvga97
	hX1tPPnrITzJAS0IIzDoPbEjLiNgnDikM=
X-Google-Smtp-Source: AGHT+IEhe7zOOAdULXHosIxAwUUPUPbLOBLWeScxzLRyFWisZDFtrywE8MUetYVvZqSMmatVOxwU3Q==
X-Received: by 2002:a05:690e:1519:b0:63e:c1c:4af1 with SMTP id 956f58d0204a3-63f92239054mr422648d50.8.1761848389570;
        Thu, 30 Oct 2025 11:19:49 -0700 (PDT)
Received: from localhost.localdomain (71-208-0-23.ftmy.qwest.net. [71.208.0.23])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-63f6304c4c2sm3687221d50.21.2025.10.30.11.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 11:19:49 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-webserver][PATCH] webmin: upgrade 2.303 -> 2.402
Date: Thu, 30 Oct 2025 14:19:09 -0400
Message-ID: <20251030181909.1562364-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 18:19:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121209

Changelog: https://github.com/webmin/webmin/releases/tag/2.402
Changelog: https://github.com/webmin/webmin/releases/tag/2.401
Changelog: https://github.com/webmin/webmin/releases/tag/2.400

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../webmin/{webmin_2.303.bb => webmin_2.402.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-webadmin/webmin/{webmin_2.303.bb => webmin_2.402.bb} (98%)

diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_2.303.bb b/meta-webserver/recipes-webadmin/webmin/webmin_2.402.bb
similarity index 98%
rename from meta-webserver/recipes-webadmin/webmin/webmin_2.303.bb
rename to meta-webserver/recipes-webadmin/webmin/webmin_2.402.bb
index f65898bf93..b2b1b818f2 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_2.303.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_2.402.bb
@@ -19,7 +19,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
            file://mysql-config-fix.patch \
            file://webmin.service \
             "
-SRC_URI[sha256sum] = "1317935427aa893159b2dae52a2860adbd9ba5482522115abd2422a4bb27c983"
+SRC_URI[sha256sum] = "ced99a948411e255549f4ce8b730820387a50379d755e802ff90ef6ae5deaca5"
 UPSTREAM_CHECK_URI = "http://www.webmin.com/download.html"
 UPSTREAM_CHECK_REGEX = "webmin-(?P<pver>\d+(\.\d+)+).tar.gz"
 
-- 
2.43.0


