Return-Path: <koansoftware@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 336D3C433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 14:26:25 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web08.37607.1634567184633416685
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 07:26:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kM1mgW8c;
 spf=pass (domain: gmail.com, ip: 209.85.208.50,
 mailfrom: koansoftware@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id z20so71979807edc.13
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 07:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=qcN858hYFxBvtR0cPrGzkbdq7ic7lfeHZ+gql6vGksw=;
        b=kM1mgW8cKzGctnoV9c9B2panzir3bOpyfh+GY65QZ2CJXQzrmHyJr970SRxFeBCoia
         OcnObuB9ennym7LPo5eCjOuZ0Z1c0Acw6sf+kqkOIL17ASKHA6NGl5bohpu0qlCYqY2V
         qh3ij7QX3OkMmoXkWW/Cl3afRpnPA5L+G6ck4Sb/3vFizqAupx+sOJRWHFH06vZ4ZTkb
         XIhZ9pseu6E+RuOCvoBBAuWZsB9RWD4ZvTTBpY6+oYuzu/nwJsqIHjXDHaBhsRfRiDRZ
         VdaYa9Dsq20wNJZITZbS2iG8CJ8PXyuLJvufpru+t59BRZCJsYB3C8XIUCAej4Cvsd9h
         Muhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=qcN858hYFxBvtR0cPrGzkbdq7ic7lfeHZ+gql6vGksw=;
        b=U9Nxcfkq1S+0Fagx9+EYJzn9A7orTTMxx7+CfQEhR8RbcjuykQaXDoJeFog0juiGzI
         /jU0uFUXj6NTnxaqMQstvua2SR0zjGEK5VjhsqYbTp1mVcpwt8UA5PcRVJ9an5OhT3f8
         0N4NGdBGKApmAk/jgjwrjhqnuC4hYuMwjHjbhZW8BrMjcGQYSRJpxeSFJBygug9+uF/s
         KD9rZoZDTn40ziIGvclbHlpT5wt8DeJgtqNFJmToW3GEZ+1Py7jCcydqt8V/0EGMBJyI
         4dR7+xgGxriQnaqiJmHAaZr29GDSGiG30griiYBJ480OUgRT1z6nsFMhnrr1vxZLpXRv
         YKVg==
X-Gm-Message-State: AOAM530m7allNCfatzA6Ag3rWH0k0HHvHZXf9Sl3l0yngwdCfY7txp+q
	l8S/StyFFZJ1z1Jk4uH5xcMhC1hE/LtcOA==
X-Google-Smtp-Source: 
 ABdhPJx63ugmXIEboGgn4JxHeB7TgE1QmosI0DqrZHgXABNCECXYheuVsX1n59Uj2ugon0h10/q9Ew==
X-Received: by 2002:a05:6402:1547:: with SMTP id
 p7mr46033796edx.371.1634566977284;
        Mon, 18 Oct 2021 07:22:57 -0700 (PDT)
Received: from amonra.localdomain (host-79-3-92-72.business.telecomitalia.it.
 [79.3.92.72])
        by smtp.gmail.com with ESMTPSA id
 m9sm9745577edl.66.2021.10.18.07.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 07:22:56 -0700 (PDT)
From: Marco Cavallini <koansoftware@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Marco Cavallini <m.cavallini@koansoftware.com>,
	Marco Cavallini <koansoftware@gmail.com>
Subject: [meta-networking][PATCH] bluepy_git.bb: Added recipe for BluePy -
 Python interface to Bluetooth LE on Linux
Date: Mon, 18 Oct 2021 16:22:47 +0200
Message-Id: <20211018142247.32594-1-koansoftware@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Oct 2021 14:26:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93424

From: Marco Cavallini <m.cavallini@koansoftware.com>

Signed-off-by: Marco Cavallini <koansoftware@gmail.com>
---
 .../recipes-connectivity/bluepy/bluepy_git.bb    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/bluepy/bluepy_git.bb

diff --git a/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb b/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
new file mode 100644
index 000000000..651a75254
--- /dev/null
+++ b/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Python interface to Bluetooth LE on Linux"
+HOMEPAGE = "https://github.com/IanHarvey/bluepy"
+SECTION = "devel/python"
+
+DEPENDS = "${PYTHON_PN} glib-2.0"
+RDEPENDS_${PN} = "bluez5"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+
+inherit setuptools3
+
+SRC_URI = "git://github.com/IanHarvey/bluepy.git;protocol=https;rev=7ad565231a97c304c0eff45f2649cd005e69db09"
+S = "${WORKDIR}/git"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
\ No newline at end of file
-- 
2.17.1


