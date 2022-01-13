Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A92AC433EF
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 18:19:30 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.829.1642097968578957368
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 10:19:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=jI8FxSDN;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.53, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f53.google.com with SMTP id e3so19755941lfc.9
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 10:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uCspra9edwd6GF2WOIZSZYzmrNDQArUKN6sRGwRL5wY=;
        b=jI8FxSDN9ezk+dfOwbocuOKvQQ8U+iAbZ32kyymkHI8Xk+rRBYaOe55nLvp7xqjLlh
         u5nfNvX13JUmV9fY0suH0wl+t5urJp4QWSmfzBiELMES459g5687vMITafMWGUPtg04y
         ytTdNBN7GGkd2AxhHS3Zsve9J/mdpYQjHvshRzGoslFsKRp1gQwuXtj3DNTDp/LQuiRj
         9ixNWvU7eVwBVZSeeg/dBu6yp7UoBdWm+odP96FraQrj/CMeKZfYNepY+ry2FiWCwP3T
         oYkD52pbbpY9JZJ5TUpWz1pjYVu4srxVukYtaQQLZCs4h6lOvz0a+6URhdam3hioxMXQ
         RdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uCspra9edwd6GF2WOIZSZYzmrNDQArUKN6sRGwRL5wY=;
        b=zUhcgYmasm869z8cvq9k792j8zB9v8ky1fVKKFW5gMT5cDgGdZIQKURJs5jcVocf1j
         P6N3Ye7uc0CNcMpbtsXR02t5n9V3toldyYSHRLxWIu5LmzKqR0sR9w58/3I9ap0jj52W
         UQYd7f8wLIWQt3Lx5pxztIoFCaF+YoRABrXRRy6DA4qB1iFWeYUOlu/kEL3upI76oaaa
         mnLzBi5cL7Ie0yFb+jSiXm4Nx2RaSlgMR21HSDUvy5vZXBfUdNjYiBQoFDp5dY3HGUMa
         3Hgy2DNfR1SzYBRoHKXPzVQsHAIa8b0ZthHy41Y2/QWOzsQafQpkepBwF0SMdL5znjQq
         Nnrg==
X-Gm-Message-State: AOAM530j6Ud6mDKBk+XuDQI+L0g+dIBX2sYDaPGkz1A4V6Hi/ijJqfhx
	FaR0ItoOmBKBUOdZRCVPkiP52MT/sKAOg9bW
X-Google-Smtp-Source: 
 ABdhPJwZJen/ueUvDNnKRCqoB/NAbuG6d3pQ7FEvNLCfrxz1kGdUZUvtpZP6F3OqCxulAp5qUY+xvg==
X-Received: by 2002:a05:651c:171c:: with SMTP id
 be28mr3490125ljb.183.1642097965854;
        Thu, 13 Jan 2022 10:19:25 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id z23sm339924ljn.4.2022.01.13.10.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 10:19:25 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] lirc: replace setuptools3-bas with
 distutils-common-base
Date: Thu, 13 Jan 2022 19:19:22 +0100
Message-Id: <20220113181922.2054457-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Jan 2022 18:19:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94811

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb
index 1ca7b6084..f3070c5d2 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb
@@ -29,7 +29,7 @@ SYSTEMD_SERVICE:${PN}-exec = "irexec.service"
 SYSTEMD_AUTO_ENABLE:lirc = "enable"
 SYSTEMD_AUTO_ENABLE:lirc-exec = "enable"
 
-inherit autotools pkgconfig systemd python3native distutils-common-base
+inherit autotools pkgconfig systemd python3native setuptools3-base
 
 PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir,systemd"
 PACKAGECONFIG[x11] = "--with-x,--with-x=no,libx11,"
-- 
2.25.1


