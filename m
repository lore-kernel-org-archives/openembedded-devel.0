Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web09.19741.1621261511607364234
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 May 2021 07:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kU8efpn/;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id t193so4771955pgb.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 May 2021 07:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=JX6tN5P5iborqC7sovhDor7dL7yPZtn/tACDhR1wNnM=;
        b=kU8efpn/97WGSXU4mN6ouQzJkOnJV+/+hl/D1xHY8merwEDoV4trvoM7710WKXzN2g
         Z0W+VXQWQgN5BaG2PJaLCufQw8F7P8fBbx+Xh1K7vwcbEzgwyAnO58R1JW3X14oYXTWj
         sCtcJ7ZF+ZrpOcli2DiS4M+UDqvaq/uLLMi8vfkRTZwHQUqTSyRnOmX/oHn5d8Lg7Tpg
         zneNoUtEs1jh/0Y4poweeMdMA/eO2Jv0L0d1ZnF1rypyV4/5szjJNmDf+57+CbyjfENo
         B65GFm5d/Nkr+Rv1FBjK5YfaQEUq2cM1Il0rXkWvChlrTEDfbZCbCh31Xhb2GFpwZDlU
         j0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=JX6tN5P5iborqC7sovhDor7dL7yPZtn/tACDhR1wNnM=;
        b=R/3NwNbxZzOlIQyG6qTj4LytfJBUqHSKn/+eDfUdqEGCD5nt01VaxRZ9DqT2+xj5LN
         LDMGQUgoNIKwJS1kiQSTh4tj7oaCrvkifNqsadku3VXRKl8YLQAzaWN6DySgAw1dkmqM
         ziR7EE5IEewgnS/wZXsY2j3oYBWVF2Gn4MT0+Z2x4WB93tXve/1TNbWFmoyx0U3canM3
         zHnku8mAk7Ryf3hdUqNSmOGBnqxIkGS6exSPGn/apMbE+HhEMN3bRhK6WZn6FD4ROdLE
         hFnhR0GpjQ2Us4a5DCCmOtqq4cR/GnD6+BKlTcKQPSzP2PNsM3jaCbO4RpchNjk1c436
         1ljg==
X-Gm-Message-State: AOAM533+8YRcR9PDFuNW7Q+cZ6GvvJi3Ne1VZQ/EoVv0ONJPWdgyjvPz
	VDk3vd1fc8bLMnZxYZZ3yM8ybd9K2zY=
X-Google-Smtp-Source: ABdhPJymXz6cjfUN+OXKy0JFPWuLa/zXYmACo0qHJg2qwcYEG9V3ZViyBqwQjqJEGGx306G91/P4vw==
X-Received: by 2002:a63:a19:: with SMTP id 25mr61570949pgk.177.1621261511070;
        Mon, 17 May 2021 07:25:11 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e1a5:920e:5720:62fe])
        by smtp.gmail.com with ESMTPSA id s16sm10872008pga.5.2021.05.17.07.25.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:25:10 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 04/11] libdevmapper,lvm2: Do not inherit license
Date: Mon, 17 May 2021 07:24:57 -0700
Message-Id: <307a613c732092f0d1b018003f35a39bf1c19dc8.1621261426.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1621261426.git.akuster808@gmail.com>
References: <cover.1621261426.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

inheriting license class which brings in
AVAILABLE_LICENSES into do_configure task checksums class since it wants to
enable thin-provisioning-tools if distro allows GPL-3 automatically, but this
brings issues when other layers which have additional licenses are
provided which ends up in signature mismatches so leave that setting to end-user and keep it disabled by
default with a comment in recipes stating that if needed then the user should enable it via
config metadata or bbappends.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f592e81f11d455546447ddff35b2f89e18c0cc0c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 6618e21f3b..ccb4f7ac14 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -21,12 +21,11 @@ SRC_URI = "git://sourceware.org/git/lvm2.git;branch=main \
 SRCREV = "3e8bd8d1bd70691f09a170785836aeb4f83154e6"
 S = "${WORKDIR}/git"
 
-inherit autotools-brokensep pkgconfig systemd license
+inherit autotools-brokensep pkgconfig systemd
 
 LVM2_PACKAGECONFIG = "dmeventd"
 LVM2_PACKAGECONFIG_append_class-target = " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)} \
-    ${@incompatible_license_contains('GPLv3', '', 'thin-provisioning-tools', d)} \
 "
 
 # odirect is always enabled because there currently is a bug in
@@ -39,6 +38,7 @@ PACKAGECONFIG[dmeventd] = "--enable-dmeventd,--disable-dmeventd"
 PACKAGECONFIG[odirect] = "--enable-o_direct,--disable-o_direct"
 PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
+# NOTE: Add thin-provisioning-tools only if your distro policy allows GPL-3.0 license
 PACKAGECONFIG[thin-provisioning-tools] = "--with-thin=internal,--with-thin=none,,thin-provisioning-tools"
 
 # Unset user/group to unbreak install.
@@ -55,4 +55,3 @@ EXTRA_OECONF = "--with-user= \
                 --with-thin-repair=${sbindir}/thin_repair \
                 --with-thin-restore=${sbindir}/thin_restore \
 "
-
-- 
2.17.1

