Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web08.9880.1613844199232699868
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Feb 2021 10:03:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l/WNgcuB;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id n10so7453364pgl.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 20 Feb 2021 10:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EU2kMZ7HMToq0rSDb+9alb7UXSkWqHUx+mmAGp5Q7G0=;
        b=l/WNgcuB146kXOJHgeVLuPDYcr6dFr2/PEFKuxYZr1YjmVGG0u5q9vTsSvYDvODp7T
         B3z9yEs9T68ORg5GLe4bVNfeZKJKJ7bJAAPEa18hEyF2TU8zrh3deRCQUoRUyxqx9zEf
         76VAD7/eP3jxjlh6VA53D7Hcf/2phFl5Ns6ckBoyBMime5nfdSvyuX3RewalUWJzmTiE
         KROjkXsWfJ6reN0Q09PHw0d17i+ULJeILGuSUnaMhQRaUYv5khYbdGl3LrJ258S2ngbI
         5tnXw04iAzAhUJVKiZWkPnNGyD/s3+KjhGq9zBpjedjWBlORzoPhsciplPA1FxxwxzCM
         DQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=EU2kMZ7HMToq0rSDb+9alb7UXSkWqHUx+mmAGp5Q7G0=;
        b=cNN/U7ThTxCcUngZ8N3eL0UOTRmrTma9gRRqMF0A2pwofZim/MGBeunhbxssGIJZRr
         X2kkMm+ILBsWFqrqiQ0QZ/TQNrT4UTsYxpWNfb76gK4YR1AllqotvVEb4stuC2WsBoJs
         TPeMwEGPgHxcx6XeULUXe0c8PAUDakwfWPwYHoMfDMVXjTSV0gY/iBMsOjSyBHdpglWh
         vc035fIMy/v8SOTXKCYz/A15wluHA/omylTB8tjvc4TA0lh0EiD9BFlWpe9tGWxLXEU4
         olE3QYiTF5FUe2CoDTjZyQpvJJrC2r6vcGwAVZO9PnQqfAiGlB9ZTtT9WXBiGYxUYjZl
         7JWg==
X-Gm-Message-State: AOAM531Nq69XKQ/vf6IRzx/EJETf5H1J4m4nt0zI0MBWSi/5i8yjsAkA
	rvyqqRFr/Nv5fvAtOVQgHjQTwsJYrinUZg==
X-Google-Smtp-Source: ABdhPJzpuX9bWux2kDM6+SLvL/A/Nj0sBSoEsFjNamafmosW2wnjx5JHqxO+rvJOPc8DiFg5TEWYXQ==
X-Received: by 2002:a62:1e41:0:b029:1e6:fe13:b78e with SMTP id e62-20020a621e410000b02901e6fe13b78emr14776413pfe.26.1613844198663;
        Sat, 20 Feb 2021 10:03:18 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:70a2:885b:8c45:14d6])
        by smtp.gmail.com with ESMTPSA id c17sm12106267pjq.17.2021.02.20.10.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Feb 2021 10:03:18 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][dunfell][PATCH 2/5] openipmi: Inherit python3targetconfig
Date: Sat, 20 Feb 2021 10:03:13 -0800
Message-Id: <20210220180316.17789-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210220180316.17789-1-akuster808@gmail.com>
References: <20210220180316.17789-1-akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

Fixes

configure: error:
  Could not link test program to Python. Maybe the main Python library has been
  installed in some non-standard library path. If so, pass it to configure,
  via the LIBS environment variable.
  Example: ./configure LIBS="-L/usr/non-standard-path/python/lib"

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 59f817bbe374799e4398766c2a444692d932d979)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 59d3d64e902d4d2e7ea9c3d2e1fec442912bcdd5)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/openipmi/openipmi_2.0.29.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.29.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.29.bb
index 85634a70eb..6918485870 100644
--- a/meta-networking/recipes-support/openipmi/openipmi_2.0.29.bb
+++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.29.bb
@@ -38,7 +38,7 @@ S = "${WORKDIR}/OpenIPMI-${PV}"
 SRC_URI[md5sum] = "46b452e95d69c92e4172b3673ed88d52"
 SRC_URI[sha256sum] = "2244124579afb14e569f34393e9ac61e658a28b6ffa8e5c0d2c1c12a8ce695cd"
 
-inherit autotools-brokensep pkgconfig python3native perlnative update-rc.d systemd cpan-base
+inherit autotools-brokensep pkgconfig python3native perlnative update-rc.d systemd cpan-base python3targetconfig
 
 EXTRA_OECONF = "--disable-static \
                 --with-perl='${STAGING_BINDIR_NATIVE}/perl-native/perl' \
-- 
2.17.1

