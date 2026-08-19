Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E06FAC5DF85
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 05:36:50 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.822.1787117803504283772
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 22:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=q1DU+7TI;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so586978a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 22:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787117803; x=1787722603; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NbeugqRPwVZKViojTihIWkHFFnevJTPuzMv9MM7DwuY=;
        b=q1DU+7TIqFRyIaPpcuGUBaXhZFeOhzF4bA1XZJ8UU3+v+iOKdrQqUDv98wotYKvQ01
         jvHP2spnqk8BVeCs0CM3+RXpt8vr7ZD3hUs3ylTVzi3fnrt+rvUUgP4mq6ONFUvcZDki
         nUbsQyInpynDl8TKlbCna8W7m4TVM7Xpsd13OM3zoVaYIohti/v125TiBimd5SZVd1ma
         /x1SwCRCeSGHDcqfbn1yLtJshAbkzFEUA0hKPcyUz1aNG1huo8QD+5K11/zcG0ewuz5b
         3nZadyNixPhLM7Ih3oh9axZcs8mneMkzMbu+K6c0lwEMmKneh+ojGhEZC4Mkx0i8pM2t
         DNzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787117803; x=1787722603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NbeugqRPwVZKViojTihIWkHFFnevJTPuzMv9MM7DwuY=;
        b=SK1/Nk5eCCl4mIjK0hLjI5ysLyMs9YITx+C+TDyGplgsX71h8Raz/lsPnwkb7mHIy5
         RmQCu3HqrUffREwmuCSBRQYmd+vmBdp9uIVlhQg3UjZ7ZaY6cfz6dX/1fkmxN3htDNFT
         vxee/e+Z7YJXidB7ELcsxkbrw+QR9/kYyrnXTYcCvnUdfTZ6Vi8cuf7JGxZFTSZ8Nh56
         1gHlS6Si9I+Gj9VfxCqFGcmmUpIe8sE73c4/HC9GMt/kMdyaypjM0dzkbpncJ0kuS4dF
         W3T2kU1jHNo5Iv4yRdm6cvZf4om+HWG4bbJqJmCFMpeeMiZZ5TrL8smA6EPOChnuwA21
         Z7wQ==
X-Gm-Message-State: AOJu0YzVoiVrYflmRPZZR7NWFAMQAi4EG9TRvhm2w/YKaiKwNz52P80e
	GbIV4zMInAU0lg3PRGdps94mdTFgsrpPeSfIi0rO7EkpLIz4q/kqH7H9c+txaIzV
X-Gm-Gg: AR+sD10e39s6WvAGV2Y93N5r5cRPiCvLQSgh8/5fFpn0i4YVhjv9uyw+WgptNKk50AL
	XdrSjP6QODCAvrmZfCBwiIWPb1/dyVDSB6h82wpshQlgusIMO9NJkiEEZizC2BvjSYh4W/pwL6P
	LTFAmMRWTOrBtla97suiVB1IuFxqoR8yxuhcL6GtpRlK4IgRDU1hAlFlCk+Uao0zoiQZVOsrXpt
	OwV02GB2hz1kT7qzWnjbeGdtWGOt1jlWKU8Ljrqg5RjdZzMV7ovztamLZ3XVG4asz2jpR2ivCof
	g6lF4mh/m6KBEWis+DgzghuomvfMN2Q6FCi8ja9+FJ0FCCkzxVWg6SzT07/m9ISojGac20bIIX8
	sZJLXt5Vphe3OL+B4GNFE5st8oaIZg8DUqjMhlpSR2WOQEWAqN3ThkHthpd9F2D0WU3YVcQoc/1
	wvfnn5D1QrtfYYhZpu15uTrWM0CF1RSENXbCfN/O1w6sslz4pRfRlFQPkxOZaI3I2U1UFso8ETg
	Q==
X-Received: by 2002:a17:90b:4e8f:b0:383:f52b:d616 with SMTP id 98e67ed59e1d1-395810844a8mr3766009a91.10.1787117802746;
        Tue, 18 Aug 2026 22:36:42 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416aea2429sm2830814c88.15.2026.08.18.22.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 22:36:42 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 3/25] nuttcp: upgrade 8.2.2 -> 8.2.4
Date: Wed, 19 Aug 2026 17:36:07 +1200
Message-ID: <20260819053629.391864-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
References: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 05:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129247

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Drop redundant md5sum.

Changelog:
8.2.4
- Provide compile time options -DMIN_PORT=n, -DMIN_CTL_PORT=n,
  and -DMIN_DATA_PORT=n to set the allowed mimimum port number
- Provide compile time option -DNO_BLANK_LINE to suppress
- blank line in normal nuttcp output
- New "-A" option to bind to a specified interface IP address
- Fix compilation with -DNO_IPV6
- Document -D user compile time options in Usage: statement
- Shut up apparently bogus gcc 10.2.1 warning:
- writing 1 byte into a region of size 0 [-Wstringop-overflow=]
8.2.3
- Simplify handling of stream_idx (no more references to [stream_idx + 1])

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../nuttcp/{nuttcp_8.2.2.bb => nuttcp_8.2.4.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/nuttcp/{nuttcp_8.2.2.bb => nuttcp_8.2.4.bb} (90%)

diff --git a/meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb b/meta-networking/recipes-support/nuttcp/nuttcp_8.2.4.bb
similarity index 90%
rename from meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb
rename to meta-networking/recipes-support/nuttcp/nuttcp_8.2.4.bb
index 17fc818e8a..815e937c39 100644
--- a/meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb
+++ b/meta-networking/recipes-support/nuttcp/nuttcp_8.2.4.bb
@@ -15,8 +15,8 @@ UPSTREAM_CHECK_URI = "https://www.nuttcp.net/nuttcp/beta/"
 SRC_URI = "http://nuttcp.net/${BPN}/beta/${BP}.c \
            file://nuttcp@.service \
            file://nuttcp.socket"
-SRC_URI[md5sum] = "d3c92c4d2f261221193c3726c1b9a42f"
-SRC_URI[sha256sum] = "8c5595bcd27c2fd66831be74c390df078cfb1870aa427f2511ac2586d236c8a1"
+
+SRC_URI[sha256sum] = "06a9de5be3e021130a65548072fba75296c9b8b425b10da062bf733278d5e9d0"
 
 S = "${UNPACKDIR}"
 

