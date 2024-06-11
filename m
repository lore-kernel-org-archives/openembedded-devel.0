Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09612C25B76
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 07:09:25 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.3813.1718089758465964151
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 00:09:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=cR33EbOO;
 spf=pass (domain: mvista.com, ip: 209.85.214.177, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1f68834bfdfso38970895ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Jun 2024 00:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1718089757; x=1718694557; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yeLR3xNo8xQeXGwqjHA+315o0u7/DCXW6tr49mBNcUg=;
        b=cR33EbOODnDPBGbSsCDsZDi9Q9wYaam1WedL98ioif96xg6BqwYL8SpFIAxiR65hz/
         BZMI3RcEytI2vdTwDWgbLbC1/qL3tP6neK1ZSiRf1lDxmvlSYIr/mXmAJzTMbYLpyb6T
         X0dLaC5D2/ttLR2u0fBnkekf8j38cFzTjXmRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718089757; x=1718694557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yeLR3xNo8xQeXGwqjHA+315o0u7/DCXW6tr49mBNcUg=;
        b=WH0MHqPsONbUT7uLj6TpNxZaPuCEQovPk4lMTUefjP17Ko1r2Co7UHIza/x7HTS+6b
         165L1QnBh4wppqRY46eu+d7RwhAbwA5A0usBU1WR3m3mD1ehqs2upJ6bnjRbrk0BD7J8
         GbDny0Ym0YCYiwGSOv/PYAnVY4CoXDcYgieoaN2zJDINn1kN5GlwbZTX+yUKuW8QXv3/
         Kj/g+Z6BbA9Roa10But2TzbJN0cdoIck42C1ukDTMcuaqmfsZ9JmwXMTxVClcUBisLcF
         /5mccZ58u4PUsZMujM0CbGR1SWatTnjsjuIeUDvlAuRLZfO7cIruv7u41h9qxSfcRAkD
         RQeQ==
X-Gm-Message-State: AOJu0YxthksUFg/OXColPLDOXV5yGCXmkHc+1wF4thRqR9+RnS0PZ7Ge
	qxLTSFLPxrleiSn2D0HsaWJpwDP7myMtpyq8NA1nhILgJDPXw9+CxfoSM24zVC1taCHx0YP0zv1
	t
X-Google-Smtp-Source: AGHT+IE6+84IXhhlr99lDSIzHw/i1n+21pXrloZhAL3Owg5LWdXlOTMWn3+ASMvSVuVdJOWaDtTsRA==
X-Received: by 2002:a17:902:e543:b0:1f6:673c:ff2f with SMTP id d9443c01a7336-1f6d03e0b85mr123671515ad.68.1718089756824;
        Tue, 11 Jun 2024 00:09:16 -0700 (PDT)
Received: from MVIN00020.mvista.com ([2401:4900:882c:a9c8:6203:d5d2:2fb9:c814])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f714953b58sm31744765ad.109.2024.06.11.00.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 00:09:16 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [meta-oe][master][scarthgap][PATCH] tipcutils: add systemd service file
Date: Tue, 11 Jun 2024 12:38:57 +0530
Message-Id: <20240611070857.825852-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jun 2024 07:09:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110818

From: Vijay Anusuri <vanusuri@mvista.com>

Add systemd service file for tipcutils

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../tipcutils/tipcutils/tipcutils.service            | 12 ++++++++++++
 meta-oe/recipes-extended/tipcutils/tipcutils_git.bb  |  9 ++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/tipcutils/tipcutils/tipcutils.service

diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils/tipcutils.service b/meta-oe/recipes-extended/tipcutils/tipcutils/tipcutils.service
new file mode 100644
index 000000000..42bf6517e
--- /dev/null
+++ b/meta-oe/recipes-extended/tipcutils/tipcutils/tipcutils.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=Transparent Inter-Process Communication protocol
+After=syslog.target remote-fs.target
+
+[Service]
+Type=oneshot
+RemainAfterExit=yes
+ExecStart=modprobe tipc
+ExecStop=rmmod tipc
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb b/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
index 596aa260e..335263009 100644
--- a/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
+++ b/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
@@ -3,6 +3,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://tipclog/tipc.h;endline=35;md5=985b6ea8735818511d276c1b466cce98"
 
 SRC_URI = "git://git.code.sf.net/p/tipc/tipcutils;branch=master \
+           file://tipcutils.service \
            file://0001-include-sys-select.h-for-FD_-definitions.patch \
            file://0002-replace-non-standard-uint-with-unsigned-int.patch \
            file://0001-multicast_blast-tipcc-Fix-struct-type-for-TIPC_GROUP.patch \
@@ -11,7 +12,7 @@ SRC_URI = "git://git.code.sf.net/p/tipc/tipcutils;branch=master \
 SRCREV = "7ab2211b87414ba240b0b2e4af219c1057c9cf9a"
 PV = "2.2.0+git"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig systemd
 
 DEPENDS += "libdaemon"
 
@@ -41,8 +42,14 @@ do_install:append() {
     install -d ${D}${sysconfdir}
     cp -R --no-dereference --preserve=mode,links -v ${S}/scripts/etc/* ${D}${sysconfdir}/
     chown -R root:root ${D}${sysconfdir}
+    if [ "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}" ]; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0755 ${WORKDIR}/tipcutils.service ${D}/${systemd_unitdir}/system
+    fi
 }
 
+SYSTEMD_SERVICE:${PN} = "tipcutils.service"
+
 PACKAGES += "${PN}-demos"
 FILES:${PN}-dbg += "/opt/tipcutils/demos/*/.debug /opt/tipcutils/ptts/.debug"
 FILES:${PN}-demos = "/opt/tipcutils/*"
-- 
2.25.1


