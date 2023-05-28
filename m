Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E433C7EE2E
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 19:02:29 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.35163.1685300542473912454
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 May 2023 12:02:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=hGhHDaiL;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1b021cddb74so10386165ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 May 2023 12:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685300542; x=1687892542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KtOKvOB821TucXKQW5Ru2eVkkgkQ7tpDuGTMEdBFgE=;
        b=hGhHDaiL7FtOQIWCQanoHOK5kC3HBbpnl1JMpvp5Ts3RZ+0UejxnuTOuNCEU5Fn1qI
         0BbQatMWnPWTXhsQMuuVbNQJtBBFAl6b+i7DXburtS+pdoQ6WeLeHPIOfem6pSS4BTf1
         qslnJ6jfTUKBJFiF7dxeY5DEk5N1ZkwTdrO5utqRxUC7Hrbj2DAEAj37deId1jZApFYs
         qe52Q882eSJylHGTfu7RMX3ewoWfnvA/J8Lqz5WLjr9loGxmC6DbEXXb9ocWUC5jOs+t
         aElu9Gr6yTVff1StDCF8pBPSmOdVNdAJ0hdiZQ94r4aW6LMqTF7FVL3+LF9Z34nX5yFL
         zhvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685300542; x=1687892542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7KtOKvOB821TucXKQW5Ru2eVkkgkQ7tpDuGTMEdBFgE=;
        b=UwengoDwcIe79L55mxZPhml5Nwp0FEa0Cnw8kdQEmtuIxk7RMMUS1g1PaTtb/MYSxX
         AqGkzlgA99uToyzbpq/xM8g8ZH04j/dz1SZ6uh6IHV3YskNCzPlWoqjQgjbGHU+ipoJQ
         DFhOe8ctMDIuY35jqTpH/P6yoevVtzvPyXushB/94oPuPugAomlmQ/fsC3umOEyLe/92
         Sll+0KvOcz6n/4WHkxTLnNh0LVEnAMMYfyJ8KGM4DrvcvOrpcQRXS0Vc+NvcBQHKWMir
         Pc2v9vTYYw589v7dk70AyT3+TvzY6XUPT7OOELl+xoCKeB4pNKKNukNYskZk3zkaN+6S
         NMng==
X-Gm-Message-State: AC+VfDwHN70TAH9i1VzM6pJY0uG5mKVAlth2Ov6Tvt/J5DehA3lkhw2k
	EWAlQ4NScKVpmQjhjTRv/owJtX4EEWY=
X-Google-Smtp-Source: ACHHUZ55NuBlhr/qpcuS9X1jrunmbmFcuq7TfSZld8/RR2JsfzMZ7RlqTFwd8jJnX6UuwSOlH96ovg==
X-Received: by 2002:a17:902:e806:b0:1a9:8ba4:d0d3 with SMTP id u6-20020a170902e80600b001a98ba4d0d3mr13074412plg.8.1685300541649;
        Sun, 28 May 2023 12:02:21 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::89af])
        by smtp.gmail.com with ESMTPSA id jb15-20020a170903258f00b001acae973449sm6587059plb.162.2023.05.28.12.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 12:02:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] gattlib: Upgrade to latest tip of trunk
Date: Sun, 28 May 2023 12:02:18 -0700
Message-Id: <20230528190218.1875233-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230528190218.1875233-1-raj.khem@gmail.com>
References: <20230528190218.1875233-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 May 2023 19:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102891

License-Update: Year changed [1]

Remove build directory from include directives in generated sourcecode
via gdbus-codegen

[1] https://github.com/labapart/gattlib/commit/5c87eda925c597e72107b5026c6b8d490ce76d62

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/gattlib/gattlib_git.bb | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
index 1ba7dd4afc..aec41edf7a 100644
--- a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
+++ b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Bluetooth library with attribute support"
 SECTION = "libs/network"
 
 LICENSE = "GPL-2.0-or-later | BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://CMakeLists.txt;beginline=1;endline=6;md5=71fdd2be76b4e95fe28324a70d4981c5"
+LIC_FILES_CHKSUM = "file://CMakeLists.txt;beginline=1;endline=6;md5=a87ee154f005a6f035b8b34ac2191f3b"
 
 DEPENDS = "bluez5 glib-2.0"
 DEPENDS += "glib-2.0-native"
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/labapart/gattlib.git;branch=master;protocol=https \
            "
 
 SRCBRANCH = "master"
-SRCREV = "fa54ae42ccb3d8f911e00b02ed1e581537e47f79"
+SRCREV = "33a8a275928b186381bb0aea0f9778e330e57ec3"
 
 S = "${WORKDIR}/git"
 
@@ -28,5 +28,12 @@ EXTRA_OECMAKE += "-DGATTLIB_BUILD_DOCS=OFF"
 
 inherit pkgconfig cmake
 
+do_compile:append() {
+    for f in org-bluez-gattdescriptor1.c org-bluez-battery1.c org-bluez-adaptater1.c \
+        org-bluez-device1.c org-bluez-gattservice1.c org-bluez-gattcharacteristic1.c; do
+        sed -i -e 's|${B}/dbus/||g' ${B}/dbus/$f
+    done
+}
+
 FILES:${PN} = "${libdir}/*"
 FILES:${PN}-dev = "${includedir}/* ${libdir}/pkgconfig"
-- 
2.40.1


