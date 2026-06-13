Return-Path: <danwalkes@trellis-logic.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 968DACD98D8
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 17:13:54 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.94474.1781370829018533202
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jun 2026 10:13:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@trellis-logic-com.20251104.gappssmtp.com header.s=20251104 header.b=PRzxAS9A;
 spf=none, err=SPF record not found (domain: trellis-logic.com, ip: 209.85.161.44, mailfrom: danwalkes@trellis-logic.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-69e505c7e22so665580eaf.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 10:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trellis-logic-com.20251104.gappssmtp.com; s=20251104; t=1781370828; x=1781975628; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4gnm60Jc+ZVwf/iL/WKAlRVw3nywIBwc1EYQgCZrXRs=;
        b=PRzxAS9A9tyac1Yd0ni39bYh6dGzYuyX2tQ9O4/sRbAgj2ROH70pkozEXeDC7V5bGM
         +lL4xWTzM1QgJxMNgZI5QXQlRlIEOWl0I8vI7bFMuZHhShamJMbCgYm0AFtFzYPAi4vM
         P4Pccbp6vBGRS6AYL+R0NMWNsaZrLeyvb43Y0+7GG2Mc1UruIefG5gqqEAXctsUDFuBf
         wvrGdHYW5JB0DoubZkt6tEVuDTQFy6EU5jpl6ci7Bv3IUxdYj/Z7gbHvnLKBbT1XR/pG
         7odi3+bw4Xq3sxswoq7qiJ8LOS/EXaYxDoEHKsYT/GyYOe4/ij3EHrXkSv971h1NVaiS
         KgxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781370828; x=1781975628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4gnm60Jc+ZVwf/iL/WKAlRVw3nywIBwc1EYQgCZrXRs=;
        b=rq/GX/A255ek7FqgiHI+3ixqnB22sSBLDzidTQ8dzr+hZMgq9p5wtARVjwEHnYZsOJ
         BDOaONCw2B5P2AE27C03uZmx15Les3etHN8uunhJmOEHf0XZxMHmYgjz5SCjzhV12ujB
         c0DphEqdMZvUsZRQZCozF8Aq2S1fDBxJwNNGmlS7DPiHz7zoe3PFA5O+hBYUXL+KFHWm
         vCPyUbBOcf4eqfY1PlTm1Exk5OLs6D9MK6t3RpYANuUNiOhuBooxue9H+2gYv+UaG94b
         FKqwQQqk2Jf9kdJotpJNbAi0BqlVf6m4Fyzo7miFz/D5kEnrxDtumEZ7QGoWHK8vG0i5
         NUDQ==
X-Gm-Message-State: AOJu0YwMRtxUVxRM+KcuJ/mEucsCCqfYnyv5ysuR3E9uVpUtcQ3KrtMI
	8SQ+/g4flgGpRG27/gujvXkBx+0h3MLliopUrO/0rQxDFdpEtyjJQrCBAD0pfFGU3wiQzLd5sDN
	kg/796dQ=
X-Gm-Gg: Acq92OFqNDh9/eezw9xVmMi6rwka1fDbUlj/st5l5/uhXPuAdiAPA8iuVsmb1xIqyE/
	2a+vvVQ1OLRPCHoIZJKPCI/TMZTqCTVnOOujSAXzOP6sw2sGS/jegZwlIypG4EpldZA0AL4S60x
	d7NKBnVdtWM0CbOtx5GTJ8RbwYwWDqvUWvumQYCxrmv/OuevZdle6viLN1LN60IwM6AsG1I+scj
	i/azQWJJOClUNQeiD0/MhgCoUTU1Ext/jDdLzYNW5U5IEoPB70W7jdsEJEzCdOBh9PD4VyUc1AA
	s3CvcKOxazWRm3/EEnB6rsnikYtNf0gSIoMkBirFnAG0Ma3qKimARA9QTQ+mKZaKliZK+T3ATS2
	/nUvxVu1zH0avKDOxx26fZveR1GRNnXID4TG0hYWU/gvqygD4VKH/brjM5L11kpF5EcA1XSyWfj
	yu1B9sWSkX9McNK6qESK8laeDD8R+OQ4Vc0Q8ldsi4xXx8BcF7A1zVQUETt2Guteqc/Q==
X-Received: by 2002:a05:6820:16aa:b0:69e:2da0:c1e2 with SMTP id 006d021491bc7-69edc6d4546mr4352624eaf.26.1781370828033;
        Sat, 13 Jun 2026 10:13:48 -0700 (PDT)
Received: from dan-tr.. (c-98-245-195-12.hsd1.co.comcast.net. [98.245.195.12])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69ed83694afsm3605072eaf.2.2026.06.13.10.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 10:13:46 -0700 (PDT)
From: Dan Walkes <danwalkes@trellis-logic.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	joe@deserted.net,
	Dan Walkes <danwalkes@trellis-logic.com>
Subject: [PATCH] python3-scapy: replace all_distro_features() with DISTRO_FEATURES check
Date: Sat, 13 Jun 2026 11:13:01 -0600
Message-ID: <20260613171301.155306-1-danwalkes@trellis-logic.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 17:13:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127573

python3-scapy uses oe.utils.all_distro_features() in do_install_ptest().

After oe-core commit 28d32a940ff4 ("utils: Remove any/all_distro_features"),
building against current oe-core master fails with:

AttributeError: module 'oe.utils' has no attribute 'all_distro_features'

Replace the call with an equivalent DISTRO_FEATURES check.

This appears to be the only remaining use of all_distro_features() or
any_distro_features() within meta-openembedded.

Signed-off-by: Dan Walkes <danwalkes@trellis-logic.com>
---
 meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb b/meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb
index 678aec0135..f6087b9b87 100644
--- a/meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb
+++ b/meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb
@@ -42,7 +42,7 @@ do_install_ptest() {
     # note1: if ipv6 isn't enabled, skip the related test (add '-K ipv6' argument)
     # note2: to make this test work, your ISP also must support ipv6 - the test is trying
     #        to ping google.com through ipv6.
-    if [ "${@oe.utils.all_distro_features(d, 'ipv6', 'true', 'false')}" = "false" ]; then
+    if [ "${@bb.utils.contains("DISTRO_FEATURES", 'ipv6', 'true', 'false', d)}" = "false" ]; then
         sed -i 's/UTscapy.py/UTscapy.py -K ipv6/g' ${D}${PTEST_PATH}/run-ptest
     fi
 }
-- 
2.43.0


