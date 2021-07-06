Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.3753.1625562820590711851
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jul 2021 02:13:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gGuH3g4a;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id s15so27005024edt.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jul 2021 02:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=r2de/Dc/xPrZkFSOVyIFl6BlNCEREoUBEu7jwCnelts=;
        b=gGuH3g4awmMFONxp6qiYSxASl7wNbakvXwqI8TOoY52KjRSYdSIKQbQ/QKzDVsokFA
         7LzhnTyWO6Ntfq5yinrfNYe24iSxcGKFK9r/S/PWlzIchxshnZW4LmbwrPHbySdU9XB1
         32K9EMGr4OAyWTOuOqAMZuiC2j15QLk+EPqaZhQF7Wun9v2E4rTTgyWA2gaZdVVFsZBQ
         nwUrU4buRCDd7DP/RuNYxecSoj1GJnkyPbIvnKtVIWvu20i55gBWEo7qFuzL4uamn/UL
         xfwXPp7Y2ahKVXGkVTBFCwJAZGxCFuSeZ7yx4/vskNF+eGU7vgexgRvqu+bnFlaN4a6s
         48xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r2de/Dc/xPrZkFSOVyIFl6BlNCEREoUBEu7jwCnelts=;
        b=GtVRPQZ0qPaMVwE6WF/XFxnt7xuKYATdEMYVgKmQhEeJJqr/AmMnL9BOdjL0m+Bg8B
         pIOMduSfmEPGT8nj+tJWpAmUsc5ZjVWzinWlN19r3QeTPiZkmdcJTNiPGPsZZW7UYl61
         bWf1f/v8bjn8gCngDnpFauzKwRnhBzcG8xNVMp5nXb9H39AZYZH6rRv30jIoxzayMffk
         hOlNyOQwjndRYkFEpCjUcMviWDZgTB01hnLu6w7Ppe0z6T0db4qDaBOimmGKv7BkWW/c
         MXPGAlGg/zSRsw3h1/uNcjV718jvXTFY1u6LLZuke23MNyXCPqSMPyr0P15qrybHDJgj
         Jbpw==
X-Gm-Message-State: AOAM5318kuGbUmpCDGqd65dap9NDnUJpm8heLBkj5YeRskxRKAZFGD91
	NmJjuchgya/KWdJWT7vFBPq3/FemIZs=
X-Google-Smtp-Source: ABdhPJzs4omgBH0jM5bNSasoISoBrgPwn71jG3NcUhUn2gYXtbluAj6hXutVcdVo8fjLfXajzoqEJg==
X-Received: by 2002:a05:6402:50d3:: with SMTP id h19mr10988691edb.344.1625562819258;
        Tue, 06 Jul 2021 02:13:39 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f3d4039af027e3874c3f08b.dip0.t-ipconnect.de. [2003:f0:7f3d:4039:af02:7e38:74c3:f08b])
        by smtp.gmail.com with ESMTPSA id p5sm5358273ejm.115.2021.07.06.02.13.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 02:13:38 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 6/9] libgusb: upgrade 0.3.6 -> 0.3.7
Date: Tue,  6 Jul 2021 11:13:24 +0200
Message-Id: <20210706091327.1513939-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706091327.1513939-1-schnitzeltony@gmail.com>
References: <20210706091327.1513939-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Version 0.3.7
~~~~~~~~~~~~~
Released: 2021-05-24

New Features:
 - Add a FreeBSD CI target (Richard Hughes)

Bugfixes:
 - Do not depend on libusb_get_parent() to fix FreeBSD compile (Richard Hughes)
 - Do not depend on libusb_get_port_number() to fix DragonFlyBSD compile (Richard Hughes)
 - Do not double-reference USB devices (Marco Trevisan)
 - Do not run the tests on FreeBSD (Richard Hughes)
 - Require *any* python3 to fix FreeBSD build (Richard Hughes)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libgusb/{libgusb_0.3.6.bb => libgusb_0.3.7.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libgusb/{libgusb_0.3.6.bb => libgusb_0.3.7.bb} (85%)

diff --git a/meta-oe/recipes-support/libgusb/libgusb_0.3.6.bb b/meta-oe/recipes-support/libgusb/libgusb_0.3.7.bb
similarity index 85%
rename from meta-oe/recipes-support/libgusb/libgusb_0.3.6.bb
rename to meta-oe/recipes-support/libgusb/libgusb_0.3.7.bb
index 2f74013ca..2b8728179 100644
--- a/meta-oe/recipes-support/libgusb/libgusb_0.3.6.bb
+++ b/meta-oe/recipes-support/libgusb/libgusb_0.3.7.bb
@@ -7,5 +7,5 @@ DEPENDS = "glib-2.0 libusb"
 inherit meson gobject-introspection gtk-doc gettext vala
 
 SRC_URI = "git://github.com/hughsie/libgusb.git"
-SRCREV = "b0464454048cac6779d4d51f12fe7f37ae4bbd57"
+SRCREV = "ff9c606d9d72c7dd369ad220d92729556faaaf0c"
 S = "${WORKDIR}/git"
-- 
2.31.1

