Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 881FBC27C79
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 04:43:48 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.40328.1718858621699056326
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jun 2024 21:43:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Iw22yoxK;
 spf=pass (domain: mvista.com, ip: 209.85.210.182, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-705cffc5bcfso504285b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Jun 2024 21:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1718858620; x=1719463420; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+TipDE5jAG9lBEFi6s5164zU8bTsBqyakxykhzWGHWk=;
        b=Iw22yoxKV9yLhCdO/PiwpGrCL03HThgGv2YDzhMVc8rRLFI1y0xg5pgA3lemyiFyu/
         PKPksfm1yQM9f2zu0xq0Wfs61suTW7hEOrliBIzlGnhxRKYSwesXY9jF62XD7iAtJnq7
         ZttX9KXj3wjtP1SfRrCQvhAijpuKD+j3BFoWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718858620; x=1719463420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+TipDE5jAG9lBEFi6s5164zU8bTsBqyakxykhzWGHWk=;
        b=d5PCNMGLkUmWS5akmmqRFRWcWl2DO1QmV9jdz/vMH/qRaCkDDU+yOkyrj3Hsg/pkhU
         5DQL0LujF2cxnSc13i5cbClyzw3TAGjh4V3mtyg0sBbFWE3tckLGbo928EZs6DrOliTk
         J88kg60KjG6omar6aGSlTnYc786nBYuxDY80OrN5NvczGsrs6/bzW9vVQAznpWM0uRKr
         R8McmfGYZ13AR1CeO0aifbpUNe7LKV234ViNFxa2LVAAYqnPDUqsw+9+BH8QXGabQb6C
         wNzZ4DLnHz1kSsaaa/99JgeCGz7lrkSK3u6zfny6rVt5WzDOtpxsBJJGOE/O1REN3qEl
         CMLw==
X-Gm-Message-State: AOJu0YyJGssEUuaJVLvJqKkTjEannReIq/r8NRCYe0o+VYOGiZmN0tQv
	8PKJGoH7Y4ngJAqAumYSG/RH35G4oaG/Uwr1qy1nsjdZVM5z8d86cnK08ZT0AO0UUZWG3jFTauf
	auxM=
X-Google-Smtp-Source: AGHT+IEDM7/IeGfVg2PlJn/lH0mNWpnF0+iz8oBUVvVRs6QuNPpBpp83G1urwfdlzj6k2UbziROkTg==
X-Received: by 2002:a05:6a20:b712:b0:1b8:a188:53ed with SMTP id adf61e73a8af0-1bcbb41d10cmr4367688637.22.1718858619984;
        Wed, 19 Jun 2024 21:43:39 -0700 (PDT)
Received: from MVIN00020.mvista.com ([2401:4900:882e:bebc:1053:b4de:c100:bbdb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9c5158785sm7875015ad.192.2024.06.19.21.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 21:43:39 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [meta-oe][master][scarthgap][PATCH v2] tipcutils: Add systemd support
Date: Thu, 20 Jun 2024 10:13:25 +0530
Message-Id: <20240620044325.8391-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Jun 2024 04:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110970

From: Vijay Anusuri <vanusuri@mvista.com>

Install tipc kernel module explictly. tipcutils.conf is added to
modules-load.d to load the required tipc kernel module.

Ref: http://tipc.io/getting_started.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../tipcutils/tipcutils/tipcutils.conf                |  1 +
 meta-oe/recipes-extended/tipcutils/tipcutils_git.bb   | 11 ++++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/tipcutils/tipcutils/tipcutils.conf

diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils/tipcutils.conf b/meta-oe/recipes-extended/tipcutils/tipcutils/tipcutils.conf
new file mode 100644
index 000000000..39ed83d6a
--- /dev/null
+++ b/meta-oe/recipes-extended/tipcutils/tipcutils/tipcutils.conf
@@ -0,0 +1 @@
+tipc
diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb b/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
index 596aa260e..580d03cbb 100644
--- a/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
+++ b/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
@@ -3,6 +3,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://tipclog/tipc.h;endline=35;md5=985b6ea8735818511d276c1b466cce98"
 
 SRC_URI = "git://git.code.sf.net/p/tipc/tipcutils;branch=master \
+           file://tipcutils.conf \
            file://0001-include-sys-select.h-for-FD_-definitions.patch \
            file://0002-replace-non-standard-uint-with-unsigned-int.patch \
            file://0001-multicast_blast-tipcc-Fix-struct-type-for-TIPC_GROUP.patch \
@@ -11,7 +12,7 @@ SRC_URI = "git://git.code.sf.net/p/tipc/tipcutils;branch=master \
 SRCREV = "7ab2211b87414ba240b0b2e4af219c1057c9cf9a"
 PV = "2.2.0+git"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig systemd
 
 DEPENDS += "libdaemon"
 
@@ -41,8 +42,16 @@ do_install:append() {
     install -d ${D}${sysconfdir}
     cp -R --no-dereference --preserve=mode,links -v ${S}/scripts/etc/* ${D}${sysconfdir}/
     chown -R root:root ${D}${sysconfdir}
+
+    # Install systemd related configuration file
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/modules-load.d
+        install -m 0644 ${WORKDIR}/tipcutils.conf ${D}${sysconfdir}/modules-load.d
+    fi
 }
 
+SYSTEMD_SERVICE:${PN} = ""
+
 PACKAGES += "${PN}-demos"
 FILES:${PN}-dbg += "/opt/tipcutils/demos/*/.debug /opt/tipcutils/ptts/.debug"
 FILES:${PN}-demos = "/opt/tipcutils/*"
-- 
2.25.1


