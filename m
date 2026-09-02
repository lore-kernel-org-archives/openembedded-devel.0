Return-Path: <alistair23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BEEDC61DFD
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 04:12:07 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4843.1788322316532701058
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2026 21:11:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=N5xod1Md;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: alistair23@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d6e954afbdso3416355ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2026 21:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788322316; x=1788927116; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HQhEw2GbE6WU+6qVzHpYrfT3mF2MVPD5W6YuO3feEDE=;
        b=N5xod1MdwHOy6EqNGq/ga3h9vvf633W6rTJS4ByTX67As121EZPUfcut4ezNlYf1rZ
         yQTAy2YIw/Ov2LlOTwbBAkwwMd6Cb1yb/k4olR108twjhHQL/wj3zszWGivAfb9+F/Lj
         6+ksXGzsCqwnAKWkxO4V3u9w0DfAYS+jT3pMdvzVrOQ1GH0SiXYwa6mf0SF8RBUSoHMY
         Jrk/N2EbJbUpSlSFrtPjOdR+TKCnxONRL5ZHrhMxdMcZP1xALGnSVaFVtoC2AKZehrlF
         HjV1K3DK41gyfMDPrtAUq+d28/Ow3WBpWxpXnQxMIfMpWjqzoZ0LHQWAGyFonPlfqFTo
         zi6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788322316; x=1788927116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HQhEw2GbE6WU+6qVzHpYrfT3mF2MVPD5W6YuO3feEDE=;
        b=gFARgkC21wOIMOdC9tBi81IkMe3ImIfvLGNV/N4zWcv77NO02M3Ib4YL5KhhUKWheh
         1VbkNMx8RFH2pkHwUMvya0thMPEXsxXIMxsUYZxs19noTSzYbhjouaeM/lWW1wPKun6Y
         zFfV7NBWENgPRTOr5gIlNnMoiChK9hv1RBeut/lNAO1xqBiTGywI6y3tAC0W2C0Hz80x
         Xa3ATmLjZ+l2yTxN667R81+VMKJIqJXOujTWBYozmsdt7+dxx+fqcPhPE0IoOzU7g6QW
         j5YjejpzWNWAw8BFkItt9MlLI93nkhcZi6SvfgSar4tzQZgDU+AyKyEkuJFarmrXz02L
         sgBA==
X-Gm-Message-State: AFuF++kV8cHojn0RX4AY5/OpM+7OB1ftkPzK7vfGxz+S8DaegQWtJy5h
	IiEHes4W9LwraBVMllZ7asAKfBvXYBMvM7K/GFFnUaGJ614c9kL88AthlRcnRg==
X-Gm-Gg: AYBFou1mbtdDsCTe30y/SoVFm1OgFgvtJFF/eKMj58Jf106/39S/+dLHimwLt4tOgVX
	Sa6ss4we1ydaDtut7kup+BPt4BOz86TByvqGtDQjTLYZgqYwI9G0IFsfcQKS48DIHkS/vAI61SJ
	tkQqvT+6qXcIr5fLHmfe9fxWJoSLMA31cKJIDSHKldbH/TrVgWePuo/9Wzv9FPuoN+q4zTzI9cB
	rs5183+YFKePTmi/VjVhYwsI9jj8Kzs5idUW+XF9n4vaqp0Nw6IxiSMuLh9NQxP0MKyOvna1EBU
	lmwq0eHf9ELnnyZMqAjoxr7SJZsK0yFXV+k5/N7lGMuLIHojZSOM2pBVleE/tBfmO57B2zQCs7Y
	mN7NHZnTsOX9u21hq3x0Z0XFPY3Ffgp1ZmoR4NY6qtxKggJz7eB2gyCeWELddPKE8GIRQiyjDHc
	BfFQMEWJpaMHXJWgnXvt7nNQjVjPKE5/KbulJozM4p284WL74GimDxE/ANoKTtg07YDcQMxnb7h
	akGpnC8bcSNiXyv
X-Received: by 2002:a17:902:ef0a:b0:2d3:160b:c01f with SMTP id d9443c01a7336-2daec636360mr31099415ad.6.1788322315837;
        Tue, 01 Sep 2026 21:11:55 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc34d006c7bsm398507a12.21.2026.09.01.21.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 21:11:55 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: openembedded-devel@lists.openembedded.org
Cc: alistair@alistair23.me,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [meta-filesystems][PATCH] python3-rtslib-fb: Initial commit
Date: Wed,  2 Sep 2026 14:11:35 +1000
Message-ID: <20260902041136.4041397-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 04:12:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129630

From: Alistair Francis <alistair.francis@wdc.com>

Initial support for verion 2.2.4 of python3-rtslib-fb.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../python3-rtslib-fb/python3-rtslib-fb_2.2.4.bb     | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/python3-rtslib-fb/python3-rtslib-fb_2.2.4.bb

diff --git a/meta-filesystems/recipes-utils/python3-rtslib-fb/python3-rtslib-fb_2.2.4.bb b/meta-filesystems/recipes-utils/python3-rtslib-fb/python3-rtslib-fb_2.2.4.bb
new file mode 100644
index 0000000000..b9e98ec2e8
--- /dev/null
+++ b/meta-filesystems/recipes-utils/python3-rtslib-fb/python3-rtslib-fb_2.2.4.bb
@@ -0,0 +1,12 @@
+SUMMARY = "A Python object API for managing the Linux LIO kernel target"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=34400b68072d710fecd0a2940a0d1658"
+DEPENDS = "python3-hatchling-native python3-hatch-vcs-native"
+
+inherit pypi python_hatchling
+
+PYPI_PACKAGE = "rtslib_fb"
+
+SRC_URI[sha256sum] = "0084daa651a72b1cacd0eaaf162725df69b991f501cffe87e0f67e99224a7267"
+
+RDEPENDS:${PN} = "python3-pyudev"
-- 
2.55.0


