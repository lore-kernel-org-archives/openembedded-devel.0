Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57ED4C61DA4
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 13:02:40 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.101348.1674824557019295972
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Jan 2023 05:02:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lII042OC;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id y11so4669887edd.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Jan 2023 05:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6WPLyvqC28EGt5YcnO60+193aovbzG0LIvF0FiqkLmA=;
        b=lII042OCDS2y1jHFA/Yq+lp5Vu8ksPwA1VypzMhcvrRvSBy1jHWvklwkgoCG5FYq9H
         M58bsRnwX4N5nsGRxUk8mTct1WhvQIIskLcqyFNTt1ObHKh4ceLKkVJZgcMTfdOryKxT
         u2pcG4qR7DAB+CJ1BJfi7SN2lrHJ8in51HoEUU5vuZQ4ByxLdnHZGvKiEAUfqMyDugsc
         DCc+ObdacNFAaA3d86Yy4QHWfI9JtX6MZx+RwrTMdWjdVeHS03rsmoUqcp3fRpr/CJDm
         4St1XMhlHebjHwHmhu3Th7iHYsS49gEOQgR0BTAbTXG/TvGgqzpUVhj+IoHAx80yDraB
         Gd/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6WPLyvqC28EGt5YcnO60+193aovbzG0LIvF0FiqkLmA=;
        b=scwktTTkP/9H5N53gOrCE6fXmnTk7h+D2P+eEILjIWEvdIM5OeAgWbfD6LNkGY9ZDa
         PxC7Vfl0xGaZ0Jh/FagY+ybXZ9+ZQeHOsavUhMTkKHPQUBUGPBpdwA3T7xy4VLWBh4GH
         z9H7H4GlHkm/19qggxYIw3yplyDFarGr+/SS78mDjrlMNEcUo/DOEuVWl6c2SuU3Fr0i
         kO2R8FQvRibzEq41fRXcMhFmhiHiVg1XjW/VjMsC9BO9Qo7290Rk5ZGvV+CN0TFuCEUI
         hg2BymWuKudflDlXtBgDJmZVoweZkF8t43wmgNaa31dVzb2KQydPJNxZRrDZgv5rlOk0
         Rdmg==
X-Gm-Message-State: AFqh2koFQE5LMq5GltWZpt448Q6yaCsthcRG8r0INSOo8gt4nRCn/4sj
	fOkKajXKeKFAQq2bXBeY5ek0dfSveJY=
X-Google-Smtp-Source: AMrXdXsqMIkfKU+V4SdI49tmrvW94yatPRuZZQqxCYLsKUmMrAJeF5BBX69JDyXbsc0kYx/ttlXobw==
X-Received: by 2002:a05:6402:5512:b0:49e:30a2:a6b9 with SMTP id fi18-20020a056402551200b0049e30a2a6b9mr40313877edb.6.1674824555008;
        Fri, 27 Jan 2023 05:02:35 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id g9-20020a05600c308900b003db0dbbea53sm4076687wmn.30.2023.01.27.05.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 05:02:34 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 5/6] .patch: fix Upstream-Status formatting issues reported by patchreview tool from oe-core
Date: Fri, 27 Jan 2023 14:02:24 +0100
Message-Id: <20230127130225.1280161-5-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127130225.1280161-1-Martin.Jansa@gmail.com>
References: <20230127130225.1280161-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jan 2023 13:02:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100820

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0001-Use-unistd.h-not-argp.h-for-all-POSIX-systems.patch   | 2 +-
 .../recipes-utils/fatcat/fatcat/0002-Enable-64bit-off_t.patch  | 2 +-
 .../recipes-multimedia/vlc/vlc/0002-use-vorbisidec.patch       | 2 +-
 .../recipes-multimedia/vlc/vlc/0003-fix-luaL-checkint.patch    | 2 +-
 .../autofs/autofs/add-the-needed-stdarg.h.patch                | 2 +-
 .../Fixed-100-CPU-using-issue-by-adding-minimum-POSIX-ti.patch | 3 +--
 .../recipes-daemons/ptpd/ptpd/ptpd-use-pkgconfig.patch         | 2 +-
 .../tftp-hpa/files/add-error-check-for-disk-filled-up.patch    | 2 +-
 .../recipes-netkit/netkit-rpc/netkit-rpc/gcc4.patch            | 2 +-
 .../netkit-rsh/netkit-rsh/netkit-rsh-0.17-rexec-ipv6.patch     | 2 +-
 .../net-snmp-add-knob-whether-nlist.h-are-checked.patch        | 2 +-
 .../openl2tp/openl2tp/openl2tp-simplify-gcc-warning-hack.patch | 2 +-
 ...0001-fping-Initialize-msghdr-struct-in-a-portable-way.patch | 2 +-
 .../0001-fix-compile-error-with-linux-kernel-v4.8.patch        | 2 +-
 .../recipes-benchmark/dhrystone/dhrystone-2.1/dhrystone.patch  | 2 +-
 .../glmark2/files/0001-fix-dispmanx-build.patch                | 2 +-
 .../glmark2/files/0002-run-dispmanx-fullscreen.patch           | 2 +-
 .../lmbench/lmbench/fix-lmbench-memory-check-failure.patch     | 2 +-
 .../lmbench/lmbench/lmbench_result_html_report.patch           | 2 +-
 .../obex-data-server-0.4.6-build-fixes-1.patch                 | 3 ++-
 .../files/psqlodbc-donot-use-the-hardcode-libdir.patch         | 2 +-
 .../doxygen/doxygen/0001-build-don-t-look-for-Iconv.patch      | 2 +-
 ...001-CMakeLists.txt-Do-not-use-private-makefile-target.patch | 3 +--
 .../fluentbit/0003-mbedtls-Do-not-overwrite-CFLAGS.patch       | 3 +--
 ...-build-Make-systemd-init-systemd-detection-contingent.patch | 3 +--
 .../libwmf/0001-configure-use-pkg-config-for-freetype.patch    | 2 +-
 .../recipes-kernel/ipmiutil/ipmiutil/fix_systemd_path.patch    | 2 +-
 .../libusbg/libusbg/0001-Fix-out-of-tree-builds.patch          | 2 +-
 .../recipes-support/log4c/log4c/fix_configure_with-expat.patch | 2 +-
 .../openct/openct/etc-openct.udev.in-disablePROGRAM.patch      | 2 +-
 .../openct/openct/etc-openct_usb.in-modify-UDEVINFO.patch      | 2 +-
 .../picocom/picocom/0001-Fix-building-with-musl.patch          | 2 +-
 ...0001-setup.py-link-in-sysroot-not-in-host-directories.patch | 2 +-
 .../fcgiwrap/0001-Fix-implicit-fallthrough-warning.patch       | 2 +-
 .../recipes-webadmin/webmin/files/disable-version-check.patch  | 2 +-
 .../recipes-webadmin/webmin/files/mount-excludefs.patch        | 2 +-
 .../recipes-webadmin/webmin/files/mysql-config-fix.patch       | 2 +-
 .../recipes-webadmin/webmin/files/proftpd-config-fix.patch     | 2 +-
 .../recipes-webadmin/webmin/files/samba-config-fix.patch       | 2 +-
 39 files changed, 40 insertions(+), 43 deletions(-)

diff --git a/meta-filesystems/recipes-utils/fatcat/fatcat/0001-Use-unistd.h-not-argp.h-for-all-POSIX-systems.patch b/meta-filesystems/recipes-utils/fatcat/fatcat/0001-Use-unistd.h-not-argp.h-for-all-POSIX-systems.patch
index 7e215e3080..c612dd8d5d 100644
--- a/meta-filesystems/recipes-utils/fatcat/fatcat/0001-Use-unistd.h-not-argp.h-for-all-POSIX-systems.patch
+++ b/meta-filesystems/recipes-utils/fatcat/fatcat/0001-Use-unistd.h-not-argp.h-for-all-POSIX-systems.patch
@@ -8,7 +8,7 @@ of any of the GNU specific argp extensions. Include unistd.h directly to
 allow building with musl on linux, whilst retaining compatibility with
 glibc and other unices.
 
-Upstream-status: Submitted [https://github.com/Gregwar/fatcat/pull/34]
+Upstream-Status: Submitted [https://github.com/Gregwar/fatcat/pull/34]
 Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
 ---
  src/fatcat.cpp | 8 ++------
diff --git a/meta-filesystems/recipes-utils/fatcat/fatcat/0002-Enable-64bit-off_t.patch b/meta-filesystems/recipes-utils/fatcat/fatcat/0002-Enable-64bit-off_t.patch
index caaf105eea..306e36d068 100644
--- a/meta-filesystems/recipes-utils/fatcat/fatcat/0002-Enable-64bit-off_t.patch
+++ b/meta-filesystems/recipes-utils/fatcat/fatcat/0002-Enable-64bit-off_t.patch
@@ -10,7 +10,7 @@ same as lseek64
 This helps compiling on latest musl where lseek64 and friends are not
 available
 
-Upstream-status: Submitted [https://github.com/Gregwar/fatcat/pull/34]
+Upstream-Status: Submitted [https://github.com/Gregwar/fatcat/pull/34]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  CMakeLists.txt         | 2 ++
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0002-use-vorbisidec.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0002-use-vorbisidec.patch
index d05cf02b71..b174ec127e 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc/0002-use-vorbisidec.patch
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc/0002-use-vorbisidec.patch
@@ -1,6 +1,6 @@
 * tremor provides libvorbisidec, use it instead of libvorbisdec
 
-Upstream-status: Pending
+Upstream-Status: Pending
 
 Signed-off-by: Tim Orling <TicoTimo@gmail.com>
 
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0003-fix-luaL-checkint.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0003-fix-luaL-checkint.patch
index 96b5d2d246..e10002f78e 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc/0003-fix-luaL-checkint.patch
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc/0003-fix-luaL-checkint.patch
@@ -1,7 +1,7 @@
 * luaL_checkint and luaL_optint were deprecated in lua 5.3
 * replacement functions are luaL_checkinteger and luaL_optinteger
 
-Upstream-status: Pending
+Upstream-Status: Pending
 
 Signed-off-by: Tim Orling <TicoTimo@gmail.com>
 
diff --git a/meta-networking/recipes-daemons/autofs/autofs/add-the-needed-stdarg.h.patch b/meta-networking/recipes-daemons/autofs/autofs/add-the-needed-stdarg.h.patch
index 816a409cdd..4cfd8edf9f 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/add-the-needed-stdarg.h.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/add-the-needed-stdarg.h.patch
@@ -3,7 +3,7 @@ From: Roy Li <rongqing.li@windriver.com>
 Date: Tue, 19 Aug 2014 11:31:35 +0800
 Subject: [PATCH] [PATCH] add the needed stdarg.h
 
-Upstream-status: Pending
+Upstream-Status: Pending
 
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
 
diff --git a/meta-networking/recipes-daemons/ptpd/ptpd/Fixed-100-CPU-using-issue-by-adding-minimum-POSIX-ti.patch b/meta-networking/recipes-daemons/ptpd/ptpd/Fixed-100-CPU-using-issue-by-adding-minimum-POSIX-ti.patch
index 1d2a5368c1..91028d82bc 100644
--- a/meta-networking/recipes-daemons/ptpd/ptpd/Fixed-100-CPU-using-issue-by-adding-minimum-POSIX-ti.patch
+++ b/meta-networking/recipes-daemons/ptpd/ptpd/Fixed-100-CPU-using-issue-by-adding-minimum-POSIX-ti.patch
@@ -8,8 +8,7 @@ Added minimum POSIX timer interval to prevent from timers firing
 to quickly for the process to handle, resulting in 100% CPU and
 endless signal queue.
 
-Upstream-status: Backport
-[From commit 1f0baae98a7b23e85f2bfd8f5de64795421c270e:
+Upstream-Status: Backport [From commit 1f0baae98a7b23e85f2bfd8f5de64795421c270e:
   - critical: added minimum POSIX timer interval to prevent from
     timers firing to quickly for the process to handle,
     resulting in 100% CPU and endless signal queue]
diff --git a/meta-networking/recipes-daemons/ptpd/ptpd/ptpd-use-pkgconfig.patch b/meta-networking/recipes-daemons/ptpd/ptpd/ptpd-use-pkgconfig.patch
index e4578dda74..cb8c81385b 100644
--- a/meta-networking/recipes-daemons/ptpd/ptpd/ptpd-use-pkgconfig.patch
+++ b/meta-networking/recipes-daemons/ptpd/ptpd/ptpd-use-pkgconfig.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] ptpd: use pkgconfig
 Yocto uses pkg-config for libpcap, rather than pcap-config, so use that
 instead as the source for libs and cflags.
 
-Upstream-status: Inappropriate [ embedded specific ]
+Upstream-Status: Inappropriate [ embedded specific ]
 
 Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
 ---
diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/add-error-check-for-disk-filled-up.patch b/meta-networking/recipes-daemons/tftp-hpa/files/add-error-check-for-disk-filled-up.patch
index d01c20d385..e4acd099ab 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/files/add-error-check-for-disk-filled-up.patch
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/add-error-check-for-disk-filled-up.patch
@@ -3,7 +3,7 @@ From: "Roy.Li" <rongqing.li@windriver.com>
 Date: Thu, 22 Aug 2013 08:56:09 +0800
 Subject: [PATCH] tftp-hpa: add error check for disk filled up
 
-Upstream-status: Pending [Sent to http://www.syslinux.org/archives/2013-August/020765.html]
+Upstream-Status: Pending [Sent to http://www.syslinux.org/archives/2013-August/020765.html]
 
 Add error check when the write-buffer is finally flushed to the file,
 the caller can detect if the disk filled up (or had an i/o error) and
diff --git a/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc/gcc4.patch b/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc/gcc4.patch
index d54cea9fdc..715ddb7b68 100644
--- a/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc/gcc4.patch
+++ b/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc/gcc4.patch
@@ -2,7 +2,7 @@ This fixes an issue when building with gcc 4.x
 
 https://github.com/openembedded/openembedded/tree/master/recipes/netkit-rpc/netkit-rpc
 
-Upstream-status: Backported
+Upstream-Status: Backported
 
 Signed-off-By: Armin Kuster <akuster808@gmail.com>
 
diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/netkit-rsh-0.17-rexec-ipv6.patch b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/netkit-rsh-0.17-rexec-ipv6.patch
index efd060f365..7afd70859f 100644
--- a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/netkit-rsh-0.17-rexec-ipv6.patch
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/netkit-rsh-0.17-rexec-ipv6.patch
@@ -1,6 +1,6 @@
 make rexec support ipv6
 
-Upstream-status: Pending
+Upstream-Status: Pending
 
 rexec equals rexec_af(... ,AF_INET) which only support ipv4,
 use rexec_af(..., AF_UNSPEC) to support both ipv6 and ipv4.
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-add-knob-whether-nlist.h-are-checked.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-add-knob-whether-nlist.h-are-checked.patch
index c5a453abe2..3152ce288a 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-add-knob-whether-nlist.h-are-checked.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-add-knob-whether-nlist.h-are-checked.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] net-snmp: add knob whether nlist.h are checked
 Previously, it still was checked when there was no nlish.h in sysroots directory.
 Add knob to decide whether nlist.h are checked or not.
 
-Upstream-status: Pending
+Upstream-Status: Pending
 
 Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
 
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tp-simplify-gcc-warning-hack.patch b/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tp-simplify-gcc-warning-hack.patch
index c11a127b81..c9cf15c1db 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tp-simplify-gcc-warning-hack.patch
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tp-simplify-gcc-warning-hack.patch
@@ -10,7 +10,7 @@ it in place but remove the #if guard since it is only there to ensure that
 the l2tp_private.h file is updated if the rpc source file is changed and
 the two get out of sync.
 
-Upstream-status: pending
+Upstream-Status: pending
 
 Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
 ---
diff --git a/meta-networking/recipes-support/fping/fping/0001-fping-Initialize-msghdr-struct-in-a-portable-way.patch b/meta-networking/recipes-support/fping/fping/0001-fping-Initialize-msghdr-struct-in-a-portable-way.patch
index 2a5b3e6193..9965d2ec57 100644
--- a/meta-networking/recipes-support/fping/fping/0001-fping-Initialize-msghdr-struct-in-a-portable-way.patch
+++ b/meta-networking/recipes-support/fping/fping/0001-fping-Initialize-msghdr-struct-in-a-portable-way.patch
@@ -7,7 +7,7 @@ Initializing the structure assuming glibc layout results in
 compile errors on musl, therefore do partial intialization and then
 assigning the members individually.
 
-Upstream-status: Submitted [https://github.com/schweikert/fping/pull/263]
+Upstream-Status: Submitted [https://github.com/schweikert/fping/pull/263]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/fping.c | 16 +++++++---------
diff --git a/meta-networking/recipes-support/linux-atm/linux-atm/0001-fix-compile-error-with-linux-kernel-v4.8.patch b/meta-networking/recipes-support/linux-atm/linux-atm/0001-fix-compile-error-with-linux-kernel-v4.8.patch
index 583a6ca60b..403146e603 100644
--- a/meta-networking/recipes-support/linux-atm/linux-atm/0001-fix-compile-error-with-linux-kernel-v4.8.patch
+++ b/meta-networking/recipes-support/linux-atm/linux-atm/0001-fix-compile-error-with-linux-kernel-v4.8.patch
@@ -13,7 +13,7 @@ We should exclude the linux time.h by disable linux/atm_zatm.h and
 move some useful definition in linux/atm_zatm.h to zntune.c to resolve
 it.
 
-Upstream-status: Pending
+Upstream-Status: Pending
 
 Signed-off-by: Dengke Du <dengke.du@windriver.com>
 ---
diff --git a/meta-oe/recipes-benchmark/dhrystone/dhrystone-2.1/dhrystone.patch b/meta-oe/recipes-benchmark/dhrystone/dhrystone-2.1/dhrystone.patch
index 6a5350c37c..63e743f64b 100644
--- a/meta-oe/recipes-benchmark/dhrystone/dhrystone-2.1/dhrystone.patch
+++ b/meta-oe/recipes-benchmark/dhrystone/dhrystone-2.1/dhrystone.patch
@@ -13,7 +13,7 @@ dhrystone sources:
 
 Additionally, this patch adds a simple Makefile.
 
-Upstream-status: Pending
+Upstream-Status: Pending
 
 Sign-off-by: Kimmo Surakka <kimmo.surakka@ge.com>
 Signed-off-by: Jose Alarcon <jose.alarcon@ge.com>
diff --git a/meta-oe/recipes-benchmark/glmark2/files/0001-fix-dispmanx-build.patch b/meta-oe/recipes-benchmark/glmark2/files/0001-fix-dispmanx-build.patch
index e9b880c260..9d652e10ad 100644
--- a/meta-oe/recipes-benchmark/glmark2/files/0001-fix-dispmanx-build.patch
+++ b/meta-oe/recipes-benchmark/glmark2/files/0001-fix-dispmanx-build.patch
@@ -16,7 +16,7 @@ See:
 
 My contribution is to tweak the wscript to link all the required libraries.
 
-Upstream-status: submitted [https://github.com/glmark2/glmark2/pull/135]
+Upstream-Status: Submitted [https://github.com/glmark2/glmark2/pull/135]
 Signed-off-by: Trevor Woerner <twoerner@gmail.com>
 ---
  src/native-state-dispmanx.cpp | 22 +++++++++++++++++-----
diff --git a/meta-oe/recipes-benchmark/glmark2/files/0002-run-dispmanx-fullscreen.patch b/meta-oe/recipes-benchmark/glmark2/files/0002-run-dispmanx-fullscreen.patch
index 27bd62edb9..0cb22fd563 100644
--- a/meta-oe/recipes-benchmark/glmark2/files/0002-run-dispmanx-fullscreen.patch
+++ b/meta-oe/recipes-benchmark/glmark2/files/0002-run-dispmanx-fullscreen.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] run dispmanx fullscreen
 The dispmanx flavour can only run fullscreen, therefore set the size to
 fullscreen when glmark2-es2-dispmanx is run.
 
-Upstream-status: submitted [https://github.com/glmark2/glmark2/pull/135]
+Upstream-Status: Submitted [https://github.com/glmark2/glmark2/pull/135]
 Signed-off-by: Trevor Woerner <twoerner@gmail.com>
 ---
  src/main.cpp | 5 +++++
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench/fix-lmbench-memory-check-failure.patch b/meta-oe/recipes-benchmark/lmbench/lmbench/fix-lmbench-memory-check-failure.patch
index cbab5c424e..0274bc32af 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench/fix-lmbench-memory-check-failure.patch
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench/fix-lmbench-memory-check-failure.patch
@@ -24,7 +24,7 @@ Signed-off-by: Fupan Li <fupan.li@windriver.com>
 
 Add and reword above comments
 
-Upstream-status: inappropriate [ configuration ]
+Upstream-Status: Inappropriate [ configuration ]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench/lmbench_result_html_report.patch b/meta-oe/recipes-benchmark/lmbench/lmbench/lmbench_result_html_report.patch
index 30708c81db..ae2443476a 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench/lmbench_result_html_report.patch
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench/lmbench_result_html_report.patch
@@ -13,7 +13,7 @@ Signed-off-by: Fupan Li <fupan.li@windriver.com>
 
 Reworded patch description.
 
-Upstream-status: inappropriate [ configuration ]
+Upstream-Status: Inappropriate [ configuration ]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
diff --git a/meta-oe/recipes-connectivity/obex/obex-data-server/obex-data-server-0.4.6-build-fixes-1.patch b/meta-oe/recipes-connectivity/obex/obex-data-server/obex-data-server-0.4.6-build-fixes-1.patch
index e2c4e9ff6c..c18627b2fa 100644
--- a/meta-oe/recipes-connectivity/obex/obex-data-server/obex-data-server-0.4.6-build-fixes-1.patch
+++ b/meta-oe/recipes-connectivity/obex/obex-data-server/obex-data-server-0.4.6-build-fixes-1.patch
@@ -1,10 +1,11 @@
 Submitted By:            Armin K. <krejzi at email dot com>
 Date:                    2012-07-06
 Initial Package Version: 0.4.6
-Upstream Status:         Unknown
 Origin:                  Self
 Description:             Some build fixes.
 
+Upstream-Status: Pending
+
 Index: obex-data-server-0.4.6/src/ods-obex.c
 ===================================================================
 --- obex-data-server-0.4.6.orig/src/ods-obex.c
diff --git a/meta-oe/recipes-dbs/psqlodbc/files/psqlodbc-donot-use-the-hardcode-libdir.patch b/meta-oe/recipes-dbs/psqlodbc/files/psqlodbc-donot-use-the-hardcode-libdir.patch
index acfaa3f6be..84d4467c0e 100644
--- a/meta-oe/recipes-dbs/psqlodbc/files/psqlodbc-donot-use-the-hardcode-libdir.patch
+++ b/meta-oe/recipes-dbs/psqlodbc/files/psqlodbc-donot-use-the-hardcode-libdir.patch
@@ -3,7 +3,7 @@ From: "Roy.Li" <rongqing.li@windriver.com>
 Date: Tue, 5 Sep 2017 10:24:10 +0800
 Subject: [PATCH] [PATCH] do not use the hardcode libdir
 
-Upstream-status: Pending
+Upstream-Status: Pending
 
 Signed-off-by: Roy.Li <rongqing.li@windriver.com>
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
diff --git a/meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-for-Iconv.patch b/meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-for-Iconv.patch
index 6906efd1c0..47c8edb497 100644
--- a/meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-for-Iconv.patch
+++ b/meta-oe/recipes-devtools/doxygen/doxygen/0001-build-don-t-look-for-Iconv.patch
@@ -10,7 +10,7 @@ C library. We don't need this check in meta-openembedded.
 Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
 Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
 
-Upstream-status: Inappropriate
+Upstream-Status: Inappropriate
 - upstream doxygen must build on many architectures, this change is
   too intrusive for upstream
 ---
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-CMakeLists.txt-Do-not-use-private-makefile-target.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-CMakeLists.txt-Do-not-use-private-makefile-target.patch
index b4634a2445..f5a1716c07 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-CMakeLists.txt-Do-not-use-private-makefile-target.patch
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-CMakeLists.txt-Do-not-use-private-makefile-target.patch
@@ -8,8 +8,7 @@ are not under control or to be used at the CMakeLists level. In 3.20
 that private generation changed pre-requisite targets[1] and now logs
 contain the path compiler_depend.ts instead of the actual file.
 
-Upstream status: Pending [1]
-[1] https://github.com/fluent/fluent-bit/issues/5492
+Upstream-Status: Pending [https://github.com/fluent/fluent-bit/issues/5492]
 ---
  CMakeLists.txt              | 6 +-----
  lib/chunkio/CMakeLists.txt  | 7 +------
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-overwrite-CFLAGS.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-overwrite-CFLAGS.patch
index af31b436db..6c585c2f5b 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-overwrite-CFLAGS.patch
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-overwrite-CFLAGS.patch
@@ -7,8 +7,7 @@ bitbake passes CFLAGS that are often in conflict with the ones set
 in mbedtls' CMakeLists.txt. Such conflicts are the inability to use
 FORTIFY_SOURCE=2 except in release mode
 
-Upstream status: Innapropriate due to fluent-bit having it's own Release
-flags that also overwrite bitbake ones.
+Upstream-Status: Innapropriate [due to fluent-bit having it's own Release flags that also overwrite bitbake ones.]
 ---
  lib/mbedtls-2.28.0/CMakeLists.txt | 2 --
  1 file changed, 2 deletions(-)
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0004-build-Make-systemd-init-systemd-detection-contingent.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0004-build-Make-systemd-init-systemd-detection-contingent.patch
index 9d4d950d15..f6e3dce2f3 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0004-build-Make-systemd-init-systemd-detection-contingent.patch
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0004-build-Make-systemd-init-systemd-detection-contingent.patch
@@ -8,8 +8,7 @@ Use pkg-config to get systemd.pc variables and systemdunitdir. Those
 variable ensure that .service files are installed in the correct paths
 and only when systemd is detected.
 
-Upstream Status: Pending [1]
-[1] https://github.com/fluent/fluent-bit/pull/5818
+Upstream-Status: Pending [https://github.com/fluent/fluent-bit/pull/5818]
 
 ---
  cmake/FindJournald.cmake | 4 ++++
diff --git a/meta-oe/recipes-extended/libwmf/libwmf/0001-configure-use-pkg-config-for-freetype.patch b/meta-oe/recipes-extended/libwmf/libwmf/0001-configure-use-pkg-config-for-freetype.patch
index 0f133e2e75..21a6f292c8 100644
--- a/meta-oe/recipes-extended/libwmf/libwmf/0001-configure-use-pkg-config-for-freetype.patch
+++ b/meta-oe/recipes-extended/libwmf/libwmf/0001-configure-use-pkg-config-for-freetype.patch
@@ -3,7 +3,7 @@ From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Wed, 6 Aug 2014 14:53:03 +0200
 Subject: [PATCH] configure: use pkg-config for freetype
 
-Upstream-status: Pending
+Upstream-Status: Pending
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  configure.ac | 37 ++++++++-----------------------------
diff --git a/meta-oe/recipes-kernel/ipmiutil/ipmiutil/fix_systemd_path.patch b/meta-oe/recipes-kernel/ipmiutil/ipmiutil/fix_systemd_path.patch
index 33116b3c06..dd9230dd4e 100644
--- a/meta-oe/recipes-kernel/ipmiutil/ipmiutil/fix_systemd_path.patch
+++ b/meta-oe/recipes-kernel/ipmiutil/ipmiutil/fix_systemd_path.patch
@@ -2,7 +2,7 @@ allow systemd path to be defined by configure option.
 
 The configure probes the host for systemd path information.
 
-Upstream Status: Inappropriate [Embedded]
+Upstream-Status: Inappropriate [Embedded]
 
 Signed-off-By: Armin Kuster <akuster@mvista.com>
 
diff --git a/meta-oe/recipes-support/libusbg/libusbg/0001-Fix-out-of-tree-builds.patch b/meta-oe/recipes-support/libusbg/libusbg/0001-Fix-out-of-tree-builds.patch
index 6be49fbca4..16506999e2 100644
--- a/meta-oe/recipes-support/libusbg/libusbg/0001-Fix-out-of-tree-builds.patch
+++ b/meta-oe/recipes-support/libusbg/libusbg/0001-Fix-out-of-tree-builds.patch
@@ -7,7 +7,7 @@ The include flag should point to the source directory, not the build
 directory.
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
-Upstream-status: Submitted [https://github.com/libusbg/libusbg/pull/9]
+Upstream-Status: Submitted [https://github.com/libusbg/libusbg/pull/9]
 ---
  examples/Makefile.am | 2 +-
  src/Makefile.am      | 2 +-
diff --git a/meta-oe/recipes-support/log4c/log4c/fix_configure_with-expat.patch b/meta-oe/recipes-support/log4c/log4c/fix_configure_with-expat.patch
index 4872eb4f5e..dadefec33a 100644
--- a/meta-oe/recipes-support/log4c/log4c/fix_configure_with-expat.patch
+++ b/meta-oe/recipes-support/log4c/log4c/fix_configure_with-expat.patch
@@ -1,7 +1,7 @@
 The original use of AC_ARG_WITH is buggy and causes expat support
 to be *disabled* if "--with-expat" is passed to configure.
 
-Upstream status: pending
+Upstream-Status: Pending
 
 Index: log4c-1.2.4/configure.in
 ===================================================================
diff --git a/meta-oe/recipes-support/openct/openct/etc-openct.udev.in-disablePROGRAM.patch b/meta-oe/recipes-support/openct/openct/etc-openct.udev.in-disablePROGRAM.patch
index 745f923af1..e2401bb31b 100644
--- a/meta-oe/recipes-support/openct/openct/etc-openct.udev.in-disablePROGRAM.patch
+++ b/meta-oe/recipes-support/openct/openct/etc-openct.udev.in-disablePROGRAM.patch
@@ -5,7 +5,7 @@ Subject: [PATCH 1/2] etc/openct.udev.in: disablePROGRAM
 
 Bug fix: https://bugzilla.redhat.com/show_bug.cgi?id=287871
 
-Upstream-status: Pending
+Upstream-Status: Pending
 
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
 ---
diff --git a/meta-oe/recipes-support/openct/openct/etc-openct_usb.in-modify-UDEVINFO.patch b/meta-oe/recipes-support/openct/openct/etc-openct_usb.in-modify-UDEVINFO.patch
index d5e3fe5753..22eda729fb 100644
--- a/meta-oe/recipes-support/openct/openct/etc-openct_usb.in-modify-UDEVINFO.patch
+++ b/meta-oe/recipes-support/openct/openct/etc-openct_usb.in-modify-UDEVINFO.patch
@@ -5,7 +5,7 @@ Subject: [PATCH 2/2] etc/openct_usb.in: modify UDEVINFO
 
 this patch is from Fedora
 
-Upstream-status: Pending
+Upstream-Status: Pending
 
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
 ---
diff --git a/meta-oe/recipes-support/picocom/picocom/0001-Fix-building-with-musl.patch b/meta-oe/recipes-support/picocom/picocom/0001-Fix-building-with-musl.patch
index 5b344b9e83..c6b01d06fc 100644
--- a/meta-oe/recipes-support/picocom/picocom/0001-Fix-building-with-musl.patch
+++ b/meta-oe/recipes-support/picocom/picocom/0001-Fix-building-with-musl.patch
@@ -3,7 +3,7 @@ From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Sun, 14 Jul 2019 19:13:21 -0700
 Subject: [PATCH] Fix building with musl
 
-Upstream-status: Pending
+Upstream-Status: Pending
 
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 ---
diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch b/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
index f4c74384f9..85423a3fec 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
+++ b/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] setup.py: link in sysroot, not in host directories
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 
-Upstream-status: Unknown
+Upstream-Status: Unknown
 ---
  setup.py | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
diff --git a/meta-webserver/recipes-support/fcgiwrap/fcgiwrap/0001-Fix-implicit-fallthrough-warning.patch b/meta-webserver/recipes-support/fcgiwrap/fcgiwrap/0001-Fix-implicit-fallthrough-warning.patch
index d05abd25ca..e160b8644a 100644
--- a/meta-webserver/recipes-support/fcgiwrap/fcgiwrap/0001-Fix-implicit-fallthrough-warning.patch
+++ b/meta-webserver/recipes-support/fcgiwrap/fcgiwrap/0001-Fix-implicit-fallthrough-warning.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] Fix implicit fallthrough warning
 Fixes a warning about an implicit fall through in a case statement
 (-Werror=implicit-fallthrough) with newer versions of GCC
 
-Upstream-status: Submitted [https://github.com/gnosek/fcgiwrap/pull/54]
+Upstream-Status: Submitted [https://github.com/gnosek/fcgiwrap/pull/54]
 Signed-off-by: Joshua Watt <Joshua.Watt@garmin.com>
 ---
  configure.ac                |   3 +
diff --git a/meta-webserver/recipes-webadmin/webmin/files/disable-version-check.patch b/meta-webserver/recipes-webadmin/webmin/files/disable-version-check.patch
index 9aad894e0c..1ca26ca0dd 100644
--- a/meta-webserver/recipes-webadmin/webmin/files/disable-version-check.patch
+++ b/meta-webserver/recipes-webadmin/webmin/files/disable-version-check.patch
@@ -3,7 +3,7 @@ Disable OS version check in status screen
 The code is not able to accurately detect the correct distro/version at
 the moment.
 
-Upstream-status: Inappropriate
+Upstream-Status: Inappropriate
 
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 
diff --git a/meta-webserver/recipes-webadmin/webmin/files/mount-excludefs.patch b/meta-webserver/recipes-webadmin/webmin/files/mount-excludefs.patch
index 8cb74c4b13..787bd8c69b 100644
--- a/meta-webserver/recipes-webadmin/webmin/files/mount-excludefs.patch
+++ b/meta-webserver/recipes-webadmin/webmin/files/mount-excludefs.patch
@@ -6,7 +6,7 @@ since these shouldn't be modified from the web interface.
 
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 
-Upstream-status: Pending
+Upstream-Status: Pending
 
 --- webmin-1.570.orig/mount/index.cgi
 +++ webmin-1.570/mount/index.cgi
diff --git a/meta-webserver/recipes-webadmin/webmin/files/mysql-config-fix.patch b/meta-webserver/recipes-webadmin/webmin/files/mysql-config-fix.patch
index 2cbc627076..c6c1f0df79 100644
--- a/meta-webserver/recipes-webadmin/webmin/files/mysql-config-fix.patch
+++ b/meta-webserver/recipes-webadmin/webmin/files/mysql-config-fix.patch
@@ -3,7 +3,7 @@ From: Diego Rondini <diego.ml@zoho.com>
 Date: Thu, 18 Feb 2016 15:44:06 +0100
 Subject: [PATCH] Adjust Mysql config defaults
 
-Upstream-status: Inappropriate [configuration]
+Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Diego Rondini <diego.ml@zoho.com>
 ---
diff --git a/meta-webserver/recipes-webadmin/webmin/files/proftpd-config-fix.patch b/meta-webserver/recipes-webadmin/webmin/files/proftpd-config-fix.patch
index 492a652d48..4e78ff4c22 100644
--- a/meta-webserver/recipes-webadmin/webmin/files/proftpd-config-fix.patch
+++ b/meta-webserver/recipes-webadmin/webmin/files/proftpd-config-fix.patch
@@ -1,4 +1,4 @@
-Upstream-status: Inappropriate [configuration]
+Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
 
diff --git a/meta-webserver/recipes-webadmin/webmin/files/samba-config-fix.patch b/meta-webserver/recipes-webadmin/webmin/files/samba-config-fix.patch
index 46645ac30e..d9ea2d145e 100644
--- a/meta-webserver/recipes-webadmin/webmin/files/samba-config-fix.patch
+++ b/meta-webserver/recipes-webadmin/webmin/files/samba-config-fix.patch
@@ -1,4 +1,4 @@
-Upstream-status: Inappropriate [configuration]
+Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
 
-- 
2.39.1


