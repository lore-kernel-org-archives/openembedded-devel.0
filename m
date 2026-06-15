Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE168CD98DE
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 01:42:56 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.141233.1781560964081909753
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2026 15:02:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IRwyVohL;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: colinmca242@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7e701435806so3453142a34.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2026 15:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781560963; x=1782165763; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vaATgkpAnDM/AvYbhYzl3ZPKJj8GLC3sKONavwq7keU=;
        b=IRwyVohLbI7RbThDQqeQ7mgC9mPkHbZa/wEKue4jCA5c67bBDjHnt9QogJKI6n62XY
         YK/zu9OmvadxWPFhGbkZ2MBNqXl8UpGaZnCKwpEgdHROrCkAXHU2w4K2A6LALaMQsCjV
         MaNpEv1taur11WOvzWdVx+bgSImNns+MdliGTEw6vJMjEgIIDXcKGqQxFGzWgUuDOXSR
         J5osTcBWxPChAUGTDo6zdvjMHWHBrhmKYY9ObA/kbsCnnJtAMsA4dNv4WxCoemAqjmGU
         R9pJDoanHNHSc4OS7Y0NsxAxhn9IRqrOzgxUZVQZyWqlb0VEMWdpkj0j85cjWYhUgYP+
         WKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781560963; x=1782165763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vaATgkpAnDM/AvYbhYzl3ZPKJj8GLC3sKONavwq7keU=;
        b=j7Rh87OEItsXs4tL7Xt/0S2SIMgcTCYP7PsiPRGzDgHWa0uEv3nPUTgsdbFj5rH+ks
         NBbIcrpVY7CjkNfAnFM553XT4G13LAWJPy3B+/n6luIoNZPuNFWSGRY6qBnrCvmnbhfA
         9VRDMji+JqDVN+k9ugTniAiO88xViA4Jz6SdyB/xW86G1zCYPEkEL3U1/dbq2aaCOQ4T
         JLTLpM/cO98MdDXA+hIoEf085w7vOyLmtJ4WqoZZBSJcTsZpnEGKDFqGtjFbJCXkfUwy
         7Yu0xUOexpBUZaEABhCkiDworeMkCQNw2SKQb5QiProEJ7sBWU4n9J51EfpBR4rfASX3
         gTOQ==
X-Gm-Message-State: AOJu0YxV53CbiPXTGic2tozbL6KV9zBj7qcE/EH7K8WzZN1eiof8MJWt
	zR7aYb+blqhyY8/c9aGQEogGy9FBPofi49EMKBSk0Z3ux35kwPqOyFLXfFI3Oj3SNqQ=
X-Gm-Gg: Acq92OHAdh4d+7zzGF+m3M+NwoIBn3BniUDh/D/h2IaXhBAouhaOIxjXVBDPIpT2ihq
	WQdde73hY2s2wEpwnmSQAQjn0A2SPHNOL8Vc7gomAMV+27fEK4fgKiZflKleKHqMYd3p1wyjE5k
	+9RCmJqp+tKkfxawoM+Rtm3dgcmZuJvLJrHP4X9kJ3Tok52EpYAQdu90EOx1/h/VFyXXODPdMXJ
	Dx7nCjYMLXoaMyLYrHcoUcTlxljtjhVTSAnTJYivH+m2aLGenlTMCrSAF+LTpK9p1EdW18cLm9p
	UYnuUYLh3Orc1Iv+DTFgJLgD+qNh0fBQFB9A9pKY2UJdea91FrCaNAX8P/ClAad50ky0EZJqhDR
	BU5lBOG6TYyT6GC2Sqnc1w62Aoq//3EYsst3QFZuBF9CjR0Xg2JU6nnkisdyUN65WRhSeK4l8mZ
	RvQXRF3ZbFLWg0GUrtO5mWdWXhqibfmw==
X-Received: by 2002:a05:6830:8384:b0:7e6:f172:ffd1 with SMTP id 46e09a7af769-7e8fe6a4525mr561391a34.23.1781560963127;
        Mon, 15 Jun 2026 15:02:43 -0700 (PDT)
Received: from fedora ([136.37.200.217])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e79f5bb9c3sm5213280a34.10.2026.06.15.15.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 15:02:42 -0700 (PDT)
From: "Colin McAllister" <colinmca242@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Colin Pinnell McAllister <colinmca242@gmail.com>
Subject: [meta-oe][PATCH 1/2] gstd: Upgrade to 0.16.0 release
Date: Mon, 15 Jun 2026 17:02:12 -0500
Message-ID: <20260615220213.604463-1-colinmca242@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 01:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127596

See change notes [1]

Removed exec_prefix from paths passed to rmdir because prefix is no
longer used for runstatedir and logstatedir (See meson chagnes in
commit b2ca22b).

Upgraded libsoup-2.4 dependency to libsoup 3.

[1] https://github.com/RidgeRun/gstd-1.x/releases/tag/v0.16.0

Signed-off-by: Colin Pinnell McAllister <colinmca242@gmail.com>
---
 .../recipes-multimedia/gstreamer-1.0/gstd_git.bb     | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
index d068d66bb6..0b79f5be4d 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
@@ -5,15 +5,15 @@ SECTION = "multimedia"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c71b653a0f608a58cdc5693ae57126bc"
 
-DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad gstreamer1.0-rtsp-server json-glib libdaemon libsoup-2.4 jansson"
+DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad gstreamer1.0-rtsp-server json-glib libdaemon libsoup jansson"
 
 SRCBRANCH ?= "master"
-SRCREV = "dac03d5e4102080a8f3ef274a6a6583455962095"
+SRCREV = "d3e1daefb999c3ba0f4fcc4744b53aab2aaa5f2d"
 SRC_URI = "git://git@github.com/RidgeRun/gstd-1.x.git;protocol=https;branch=${SRCBRANCH} \
            file://0001-gstd-Remove-redundant-rpaths.patch"
 
 # Remove the +really when upstream version is > 1.0
-PV = "1.0+really0.15.2"
+PV = "1.0+really0.16.0"
 
 GTKDOC_MESON_OPTION = "enable-gtk-doc"
 
@@ -24,9 +24,9 @@ GTKDOC_ENABLED = "False"
 inherit meson pkgconfig gettext gtk-doc python3native python3-dir python3targetconfig
 
 do_install:append() {
-        rmdir ${D}${exec_prefix}${localstatedir}/run/${BPN} ${D}${exec_prefix}${localstatedir}/run \
-              ${D}${exec_prefix}${localstatedir}/log/${BPN} ${D}${exec_prefix}${localstatedir}/log \
-              ${D}${exec_prefix}${localstatedir}
+        rmdir ${D}${localstatedir}/run/${BPN} ${D}${localstatedir}/run \
+              ${D}${localstatedir}/log/${BPN} ${D}${localstatedir}/log \
+              ${D}${localstatedir}
         rm -f ${D}${bindir}/gst-client ${D}${bindir}/gstd-client
         if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
                 install -d ${D}${sysconfdir}/tmpfiles.d
-- 
2.54.0


