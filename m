Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA92AC3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 05:30:50 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.782.1704691842183048063
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 21:30:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jz7y7wZe;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40d5f40ce04so17217785e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 21:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704691840; x=1705296640; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F+Uud8B2zf/E0Vu3CxXfKWtMj3iIw+uDCPgEB9Tv+Tk=;
        b=jz7y7wZe1Ixb3QFfioJNpqUi0V4ku7T/+myoR1tgs2PIEhiocepGGkzAL1gpM6gxR3
         B6I/ovMP0rpw7EJ+5T0v76XGGDXFLhBZoDqhmbdDcDaFvM7ITo+j2Wc4D6a4fra+2hpO
         Baqhzl7HZqbLwTFrOgNe2NcWz9az7lgwK/setr5EzmyE6kt1dwT8PeYl0QI9DPz8zRyM
         CTUPkQZllajJf5HEX8ZkriVTjQYUuzNLhoxWQ0oDvpN24OAG1zsPAHNoPoZ5KVG74/0e
         1rJ/ZaUuyOxbSJxi3sZoXn3+cqwEyIBa2zHH9+ddZuWHDpmkH8smmNjDG8OrWjzL62am
         grjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704691840; x=1705296640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F+Uud8B2zf/E0Vu3CxXfKWtMj3iIw+uDCPgEB9Tv+Tk=;
        b=UITb/RZxKYK0FocRDs5CXoLA6DTQ1OG9kIYstRMFNcWG4m0BGreXA5mcQp4fDgP/40
         EJCq+t4xLotArGKKomHjVIF1dYbhT1EkpM/o2mlbv/rLhnQqpH3B/Fot89SiB4tP9dMz
         WsirThEruWC9HayBgz+L1W9LRBgBAfzW8StLtgwA7ot/Vog1UpdxZ/5xZ4VMMjKhDUTW
         AxtMkFfAd9WWA6YsNOQ5Sa5gc1c7f88In7/L6vFBzo0IySo7y3BrnEdxh/jQifGUTXZZ
         MzyQ0lDGdOjah+3gC7j9uza0HvWRR3MlLq11lTn30+HEFNQNw0zC4iHjvQAXgR/rCoqy
         01Pw==
X-Gm-Message-State: AOJu0YzjjOf/UziQbH42SvsIkD8CPMFVVxhb8fGAMkRt+DT3sHrXiwWP
	nasrodVTVReA3YRm3nw9IKn6H9rtZrTCIg==
X-Google-Smtp-Source: AGHT+IFfVACazqiCZtAeI4rCkNf0rtLdfOQL9uZHmUApXyeN8vCDLxDAoivO2IjVO9ZcaEqfJBUNhA==
X-Received: by 2002:a05:600c:3c85:b0:40d:8bc6:b153 with SMTP id bg5-20020a05600c3c8500b0040d8bc6b153mr1523539wmb.110.1704691839870;
        Sun, 07 Jan 2024 21:30:39 -0800 (PST)
Received: from localhost.localdomain ([176.33.64.25])
        by smtp.gmail.com with ESMTPSA id fl13-20020a05600c0b8d00b0040e490cb666sm489117wmb.12.2024.01.07.21.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 21:30:39 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] pcsc-tools: upgrade 1.6.2 -> 1.7.1
Date: Mon,  8 Jan 2024 08:30:34 +0300
Message-Id: <20240108053034.28440-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 05:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108125

Changelog:

===== 1.7.1 =====
- 64 new ATRs
- configure: Use ATR_analysis by default on GNU/Linux
- improve Windows support

===== 1.7.0 =====
- 182 new ATRs
- pcsc_scan:
	. add debug option -d
	. add PnP option -p
- gscriptor: i18n and l10n in English (default), French and Russian
- configure: add --enable-ATRparser=foobar to specify an ATR parser
- minor fixes and improvements

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../{pcsc-tools_1.6.2.bb => pcsc-tools_1.7.1.bb}           | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/pcsc-tools/{pcsc-tools_1.6.2.bb => pcsc-tools_1.7.1.bb} (75%)

diff --git a/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.6.2.bb b/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.1.bb
similarity index 75%
rename from meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.6.2.bb
rename to meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.1.bb
index b71fb0427..57348ee7e 100644
--- a/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.6.2.bb
+++ b/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.1.bb
@@ -5,13 +5,13 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "git://github.com/LudovicRousseau/pcsc-tools;protocol=https;branch=master"
 
-SRCREV = "b1018b83346f8a3bc3d42c96f2ed4dc62147cb24"
+SRCREV = "53834cd33155ae1f0332102b1baca6ce63660fc5"
 
 inherit autotools pkgconfig
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "pcsc-lite"
+DEPENDS = "pcsc-lite autoconf-archive"
 
 RDEPENDS:${PN} += " \
 	${@bb.utils.contains('DISTRO_FEATURES','systemd','pcsc-lite-systemd', 'pcsc-lite', d)} \
@@ -21,4 +21,5 @@ RDEPENDS:${PN} += " \
 	libpcsc-perl \
 "
 
-FILES:${PN} += "${datadir}/pcsc/smartcard_list.txt"
+FILES:${PN} += "${datadir}/pcsc/smartcard_list.txt \
+				${datadir}/pcsc/gscriptor.png"
-- 
2.25.1


