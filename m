Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D40CCF9ED
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 03:40:34 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.958.1761363625514082462
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 20:40:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HAM2XWVE;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7a27bf4fbcbso2208191b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 20:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761363625; x=1761968425; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+4E6ocKA+RbXQSoe/BqL03tmsLjCpbpo+IT5c8r604c=;
        b=HAM2XWVES1tIvyz2rrOVABNBPbauU5ycyhrJevQy8co/ZFwNPNilNuO7ZIWuNbRSd9
         trUGsRqkSxDrQOF7XHfO3JBZH6gooUJRneNFW6VL1m1yOFNHzXw0oH3Sm/XlOMOimro4
         vsLaIEccOOsfXdlZgwnbJ0mN1kga2xV1B4QjzWMpTiemcmh5gYC9Zm2oQDWgdNL2FJ0B
         6iY4Fk773zUzDd33awv69Sj7YU6NwEOzP7BOqUT150uTK6Wna8058jCPdGcSBl7/ogYd
         GRuco1k/EwHw9S97ZmUN1qlSaeVm+YZvwxqRFUluyji8fO2eRrA1Z1EQjpoK+EB6CdTH
         sMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761363625; x=1761968425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+4E6ocKA+RbXQSoe/BqL03tmsLjCpbpo+IT5c8r604c=;
        b=YCY5AhCye42imBliIJB+Ox53tFgtp0lVYXgUjVE+JcAZwkvS+MG0H6XvLl3PlXnbj6
         q0ukyN2txmS1DMDo6WoiFRIviLeYWk0XCv59yOrwjOk7PsgS432gfwIgkFLLID07e78H
         UUi6MoCtcPK15GnHtc527wagafT8O7EP1i6LOrtMz8dng+05Xchn3goz9rIfNWHBWM99
         Teyxxp0nWlsvddBC69AMLB3cqAVnG8w3cNNbxsXUPuLPOaA0vimvbCWoPXFbZSetf1Ox
         iRqNoychHaZQD6cflfqlXySQS8MHPTMVNbhp0+8+ZQxOr6bb6/J/6TFDTHJgJmB0oOL+
         NkBQ==
X-Gm-Message-State: AOJu0Yw9aEwfg+dFLpKwkx/6RV8XPHSFch2/kXAaJk9agtE7U3iQThsH
	lPHFkbKygxL+fKlLML0QHGe7Vq1D4lLmjr8Up77wDwspyp3lQo/o+AGsCYT2PhB2
X-Gm-Gg: ASbGncuwujPVEm9kHi1KmokHBS2xfG0VhJqyFk9mKhsY2i3nbTsiISgPMYVWRTRDQLR
	D0D1oqvdQJzhsGwKTp1u8/O+KvU3Qr7/jHAnSjJ2rpq6PwoWghdCcRIEqInJUWFpQ0SSexe3Tdb
	bAdv3v8kxzDXCSWvktwVfyj88xODepat7iUGOd94P157v7+ChL/7vehAzL0coyTr5DMkyVM4+D4
	wygshObwxx3BDGcyVR6a70ZlZ5brkYrHljhMUyvnMGFqac/+wPzZCyfRQA+kTc4GBCUlzHdTsnv
	71vFXvEpO76Aon58Xv9VH3H2+i3T6oxil2tm0+bU3qrnoPxoHAC7LHjJNl3ydE/zFo1zqySVPIw
	yYQcY9Aovr9huw+bXxhiMzjo6yCeqDmwM3j0UcNVl9btzUTI1iM5gkzGoxSzhvNc8H/8bguPIMO
	N/Lu9ZwDEun+DtdhgGQKxxkjr9PtbQPXZR3kpMOYb+wx62VdaqbkriAfRwWgHDEbfTgQqggshY
X-Google-Smtp-Source: AGHT+IFZmOaEULiqorZljBZO0keczJyw4H/lQ5cRI5IzIEfl23XDHA0jiST5VrGsOzMpFPev0GchpQ==
X-Received: by 2002:a05:6a20:5493:b0:340:db9b:cfe8 with SMTP id adf61e73a8af0-340db9bd2a9mr2598552637.12.1761363624567;
        Fri, 24 Oct 2025 20:40:24 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::9dbe])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414012bf4sm808487b3a.1.2025.10.24.20.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 20:40:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 05/11] libtorrent: Upgrade to 0.16.1
Date: Fri, 24 Oct 2025 20:40:10 -0700
Message-ID: <20251025034017.2071643-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251025034017.2071643-1-raj.khem@gmail.com>
References: <20251025034017.2071643-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 03:40:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120989

Fix a m4 script bug
Drop CVE_STATUS since this is only needed for < 0.14 release
Enable using posix_fallocate when creating a new file to avoid fragmentation

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...mmon.m4-Insert-spaces-in-shell-lists.patch | 45 +++++++++++++++++++
 ...torrent_0.14.0.bb => libtorrent_0.16.1.bb} | 12 +++--
 2 files changed, 50 insertions(+), 7 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0001-scripts-common.m4-Insert-spaces-in-shell-lists.patch
 rename meta-oe/recipes-connectivity/libtorrent/{libtorrent_0.14.0.bb => libtorrent_0.16.1.bb} (76%)

diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0001-scripts-common.m4-Insert-spaces-in-shell-lists.patch b/meta-oe/recipes-connectivity/libtorrent/libtorrent/0001-scripts-common.m4-Insert-spaces-in-shell-lists.patch
new file mode 100644
index 0000000000..1740b0f478
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent/0001-scripts-common.m4-Insert-spaces-in-shell-lists.patch
@@ -0,0 +1,45 @@
+From 9df2559d55c454c7128b65103456c2f88b3bf2f5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 24 Oct 2025 08:45:02 -0700
+Subject: [PATCH] scripts/common.m4: Insert spaces in shell lists
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+$1=$(echo "$result" | tr -d '\n')
+
+removes all newlines without inserting spaces
+That usually isn’t what we want for shell lists.
+It should typically be space-separated output.
+
+Fixes a bug seen with yocto where compiler is not a single word
+but a string e.g.
+
+ccache aarch64-yoe-linux-musl-clang++  -mcpu=cortex-a72+crc+nocrypto   --dyld-prefix=/usr -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux-musl/libtorrent/0.16.1/recipe-sysroot
+
+It changes it to
+
+ccacheaarch64-yoe-linux-musl-clang++-mcpu=cortex-a72+crc+nocrypto--dyld-prefix=/usr-fstack-protector-strong-O2-D_FORTIFY_SOURCE=2-Wformat-Wformat-security-Werror=format-security--sysroot=/mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux-musl/libtorrent/0.16.1/recipe-sysroot
+
+When doing c++17 checks on compiler, resulting in failure
+
+Upstream-Status: Submitted [https://github.com/rakshasa/libtorrent/pull/583]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ scripts/common.m4 | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/scripts/common.m4 b/scripts/common.m4
+index 74b99e6a..44a5fe65 100644
+--- a/scripts/common.m4
++++ b/scripts/common.m4
+@@ -30,7 +30,8 @@ AC_DEFUN([TORRENT_REMOVE_UNWANTED],
+     $1="$2"
+   else
+     result=`echo "${values_to_check}" | $GREP -Fvx -- "${unwanted_values}" | $GREP -v '^$'`
+-    $1=$(echo "$result" | tr -d '\n')
++    # join with spaces, squeeze repeats, and trim trailing space
++    $1=$(printf '%s\n' "$result" | tr '\n' ' ' | sed 's/  */ /g; s/ *$//')
+   fi
+ ])
+
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.14.0.bb b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.1.bb
similarity index 76%
rename from meta-oe/recipes-connectivity/libtorrent/libtorrent_0.14.0.bb
rename to meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.1.bb
index 220bb62c64..4a8a68aa15 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.14.0.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.1.bb
@@ -4,16 +4,14 @@ HOMEPAGE = "http://libtorrent.rakshasa.no/"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"

-DEPENDS = "zlib libsigc++-2.0 openssl cppunit"
+DEPENDS = "zlib curl libsigc++-2.0 openssl cppunit"

-SRC_URI = "git://github.com/rakshasa/libtorrent;branch=master;protocol=https"
-SRCREV = "08fb6635ba249665cb08a4de1b955288d25c21e1"
+SRC_URI = "git://github.com/rakshasa/libtorrent;branch=master;protocol=https;tag=v${PV} \
+		   file://0001-scripts-common.m4-Insert-spaces-in-shell-lists.patch"
+SRCREV = "919d23923ad0a483fa24441093eda1c12cea4c0b"

 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"

-CVE_STATUS[CVE-2009-1760] = "backported-patch: patched in our product"
-
-
 CVE_PRODUCT = ""

 PACKAGECONFIG ??= "instrumentation aligned"
@@ -27,4 +25,4 @@ PACKAGECONFIG[aligned] = "--enable-aligned,--disable-aligned,"

 inherit autotools pkgconfig

-EXTRA_OECONF = "--with-zlib=${STAGING_EXECPREFIXDIR}"
+EXTRA_OECONF = "--with-posix-fallocate"

