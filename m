Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6928CD37AE
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 05:33:05 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web11.43305.1725427983392363926
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Sep 2024 22:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LmhM94ro;
 spf=pass (domain: gmail.com, ip: 209.85.161.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5da6865312eso3919106eaf.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Sep 2024 22:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725427982; x=1726032782; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ik0U4MWdyxTdcnwGWA9KExtMe0hMm0pQSqVgS0C323M=;
        b=LmhM94romfBnh+MhvSyrrd1mGfGuvZnvD/XJ48S72/EvWB0rUYUg3rypEw3vqjw6x4
         0NKyL33lMLrQmtPbnQdSJOWu1nmmXTPp//Jb7zIbLP7FMtiFMX6rwKlzgh51LBLWPs6l
         WC4Y2pq2itepWmTCDbSkzhQch4lndPg1H/rzgl3cS9MH71i7o/KYJCstxIbz9JPkRy+A
         iUOpoBboL5TUJIlm7CPkcoTCMg9VbDoHJFZWoqsKxSq/X3n13XB9n3rYRwkAEFYzh6RE
         aZfRbfuJPHIo959DxDFzGmvd9WO5mlWYq1hSXTL7GgjzqiOs0+LJ0FhmZvtJwbhVo3ts
         eDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725427982; x=1726032782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ik0U4MWdyxTdcnwGWA9KExtMe0hMm0pQSqVgS0C323M=;
        b=CFsQ1VBL2jRiU3DwxFfraEzC/EWnXqo+OtUUBTj4LLmlsPft+eSxyb04Mnngt0VUXM
         Va0T48CTsPoPOGykxiAGEPGpq5KmyQkmx9iJ5A+ZaUUFYeZ8KyO2xKMtPEBgKg9I2t29
         w521hxtw5u+KqXPFmgHFWnkYc4TLT0G3MbpsQj4KXUAE6Ar45spl8mQWppf341zuA6kQ
         vaGC6CM15MD6oerQsuKZFlNtgzSNrJhf9Bw5xDE2fOlBu0jZAVYPCH4r/8xkitqJH0cz
         OITn8mrp/RJTOSpLz8yxM8BiSo7MBwm6XRvTpGecp273Ors1dzrOCIfYk71Y/iiXAnZ4
         y2Ew==
X-Gm-Message-State: AOJu0Yzq0EneIDWhLC/ZccX3F96PWOFOM/eXCH+0t9pkWGiYeNFFTU5y
	yhcNHz6C7CziaeX+5pms8vu6Y04c3yEgWOsQImU3ymjenpSTXROGvayzKBKZ
X-Google-Smtp-Source: AGHT+IHykvu6tJUylyBzfzXMrOz+H4L58A6KNmR8/qzu8BPxEPS5IF7pePIUVjUf/GhQcc7MtRZG4g==
X-Received: by 2002:a05:6358:93a5:b0:1aa:c492:1d34 with SMTP id e5c5f4694b2df-1b7ef738b37mr1794387155d.23.1725427982343;
        Tue, 03 Sep 2024 22:33:02 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::2696])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71778589896sm776515b3a.128.2024.09.03.22.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 22:33:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 1/5] xdg-desktop-portal-wlr: Update to latest on master branch
Date: Tue,  3 Sep 2024 22:32:56 -0700
Message-ID: <20240904053300.2085710-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Sep 2024 05:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112084

* d9ada84 (origin/master, origin/HEAD) screencast: fix SelectSources type bitmask check
* 0776565 screenshot: clean up xdpw request
* 32b009a screenshot: remove variable-length-array
* fa0961b screenshot: clean up reply messages on failures
* aa555b7 colorchooser: clean up xdpw request
* 80ae77d colorchooser: clean up reply messages on failures
* c23c886 colorchooser: force grim to only return a single pixel
* d13d6a4 screencast: simplify xdpw_gbm_device_create()
* 67365f7 build: don't use cc.get_supported_arguments() for -D flag
* 31d85ce build: add summary for auto-detected features
* 388c484 screencast: simplify wl_drm format code conversions
* 9895411 Separate wlr_screencopy code into separate file
* 94e3de3 Group wlr_screencopy attributes in structs
* 425da7f screencast: Store transformation as part of the frame
* 91c888c screencast: Refactor xdpw_wlr_* api
* ca7a3e2 screencast: Use PipeWire to drive screencast
* 7444be5 contrib: fix typo in the portals config example
* 1eae4bf readme: list supported portals, explain new portal config
* 3087ad5 build: simplify sd-bus-provider=auto
* 53aeeba build: simplify scdoc invocation

Fixes variable length array usage which fixes build with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.7.0.bb     | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.7.0.bb b/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.7.0.bb
index 8ffe652b22..0b90bc0db9 100644
--- a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.7.0.bb
+++ b/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.7.0.bb
@@ -20,7 +20,8 @@ SRC_URI = "git://github.com/emersion/xdg-desktop-portal-wlr.git;protocol=https;b
            file://0001-screencast-Fix-build-with-older-mesa.patch"
 
 S = "${WORKDIR}/git"
-SRCREV = "776113a4f014639c29d8de8fcb513493ef7b491f"
+PV .= "+git"
+SRCREV = "d9ada849aeca6137915de2df69beaef4e272cc1d"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', 'basu', d)}"
 

