Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EC0DCCF9EC
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 03:40:34 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.958.1761363631821942474
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 20:40:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GLjVKxDF;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7a4176547bfso53228b3a.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 20:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761363631; x=1761968431; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWR0OKPVCeDBqgUlGR0uOX2frpfEZvJWI2fzXqqz2Dk=;
        b=GLjVKxDFI8N8CYqy58mCtQm9yWHE2VBCAL7/na749cUMb7XtoCKCjFVkYr/dUrJo4v
         a13acZhsQ6JYeDlJnEFG0vLWTIm8nDPSu9K1Apb06t4pUNfuRhgHX0Vp4nm10Px3rH1s
         TjmEeYoA0LxwPF6X4wUJ1IKXsfLfV49GmYawZWchnWHHxIQ4cWfecY8pBZctiaLoLXja
         HOlmU65JBTJEZ2aFAylMh4jMPajfUCe5HyIpGdE3YagSAIRjQF9kVLLpTTOgaslxNMfm
         PPQoW2HBCjO47jL3V6TT+VDaxWN5fdZp7uivtmVxlUb4gzI3qE5vIY3s3c1tCn7m+ORe
         pdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761363631; x=1761968431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pWR0OKPVCeDBqgUlGR0uOX2frpfEZvJWI2fzXqqz2Dk=;
        b=fsr4AHDKqm4KWLbcchcOBC+6FF4UaHAZIryF9beqAUBz9mJlu6fjf1n+l+TuggvFZZ
         tIEjBojlhT63jyohQxBEYobNAIC4UEtsds5+fOxQb7I+L/GnWgGyKkqPAW7pVT39af/f
         YQxa8vViVJmBdUUmve7QHrFdm4qwD9u3df6aTNF+zahvzERwX7uafr4mXEOttrl8qUBF
         sksezrLdoGS/CQjsS2+XGkiC2nJ7dZkm+kkUkd4iEl90yvlmlKnfa/43INmNnz8JLTqT
         6dS+Q/qJUkVzWiV6rNDwr104rpvN26aZLeqBgHoh40RsS1zexZFvdhlXtoCeS408Ts/E
         GlOg==
X-Gm-Message-State: AOJu0YzIopwmzkgOPvRCg1al09eThMa6IEOKWUQ96/ZF28WsxfUpCApo
	Aim0VlPVR278nXg0GYiZE1SFWudocr27JQxQJVZmodu3t2c55W3f50iXnWUVzrfB
X-Gm-Gg: ASbGncs4PlxYg0IWd49KYQngz/kk+D/C9O76e7KMlQmG8IqZthUk3pyiHU6ZBxMThgn
	bCvxmOfEGDiYCTzW39sdTgrVvzdvU03fUdVSacc/WP6IumJCiV+3+9M5zZOn0ZzNbmiW/68SfmZ
	DxjCnr15uoSic7RmFuos7vp2epf0DCh3xO5DVyuRxm88CfIL1QXp+6Ou3duBvdi1A2ILElv0mxH
	Amt0gMqEP9KQl920Mldq2qQ3SPsl1wpXgwBr+OU2dTzRlzWGmhdsJIpINC/9bwj2Hw5NWFOEYGp
	ywMNhKg0Ft7gj/iWo9nm38mg4aI2f5wqZn4Xr+UQc5X06De1SCS5WaWcybN2D8RHh6/ltVP/W6W
	9qjnBhTZOzAqPmz8DsjicP1X1qeS5G89fjKFFtF4dDirraWdGPYqhiYehxW5ABIAo0OTyOHnSPI
	/vEGXxe2sLqjYCP2Sda8QTUz2v7vutY815g7krq6WgB3JbLRw/9ZegieMdMt+1j5ZG7RJUxgNo
X-Google-Smtp-Source: AGHT+IEkZCosq+TXyj5eTaE/xrsEWBicE7g2EBH0PqVN45puY96AJql+v4+t2vXN+mzljr9TWTMY7g==
X-Received: by 2002:a05:6a00:2d28:b0:7a2:6fce:19bf with SMTP id d2e1a72fcca58-7a28682370emr7372772b3a.17.1761363630816;
        Fri, 24 Oct 2025 20:40:30 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::9dbe])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414012bf4sm808487b3a.1.2025.10.24.20.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 20:40:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 11/11] rtorrent: Upgrade to 0.16.1
Date: Fri, 24 Oct 2025 20:40:16 -0700
Message-ID: <20251025034017.2071643-11-raj.khem@gmail.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120995

Add a patch for m4 macros
Disable execinfo on musl as it does not support it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...mmon.m4-Insert-spaces-in-shell-lists.patch | 45 +++++++++++++++++++
 ...{rtorrent_0.10.0.bb => rtorrent_0.16.1.bb} | 15 +++----
 2 files changed, 50 insertions(+), 10 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/rtorrent/rtorrent/0001-scripts-common.m4-Insert-spaces-in-shell-lists.patch
 rename meta-oe/recipes-connectivity/rtorrent/{rtorrent_0.10.0.bb => rtorrent_0.16.1.bb} (57%)

diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent/0001-scripts-common.m4-Insert-spaces-in-shell-lists.patch b/meta-oe/recipes-connectivity/rtorrent/rtorrent/0001-scripts-common.m4-Insert-spaces-in-shell-lists.patch
new file mode 100644
index 0000000000..bd075c0b21
--- /dev/null
+++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent/0001-scripts-common.m4-Insert-spaces-in-shell-lists.patch
@@ -0,0 +1,45 @@
+From da3687c276078e8ad1df3c972bd1d5deaffb3dc5 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Submitted [https://github.com/rakshasa/rtorrent/pull/1620]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ scripts/common.m4 | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/scripts/common.m4 b/scripts/common.m4
+index 7129204..d8ee019 100644
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
diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.10.0.bb b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.1.bb
similarity index 57%
rename from meta-oe/recipes-connectivity/rtorrent/rtorrent_0.10.0.bb
rename to meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.1.bb
index 02a97cd6e3..0030b7593d 100644
--- a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.10.0.bb
+++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.1.bb
@@ -5,16 +5,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"

 DEPENDS = "autoconf-archive libsigc++-2.0 curl cppunit libtool libtorrent ncurses"

-SRC_URI = "git://github.com/rakshasa/rtorrent;branch=master;protocol=https"
-SRCREV = "a88cab6d2e764e22cac232ef8d5af039d41b8280"
-
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-
-PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+SRC_URI = "git://github.com/rakshasa/rtorrent;branch=master;protocol=https;tag=v${PV} \
+           file://0001-scripts-common.m4-Insert-spaces-in-shell-lists.patch \
+		   "
+SRCREV = "b38f80e59795dc6728b2c31ac3eab564651ce46d"

 inherit autotools pkgconfig

-EXTRA_AUTORECONF += "--exclude=aclocal"
-
-CXXFLAGS += "-std=gnu++14"
+EXTRA_OECONF:append:libc-musl = " --disable-execinfo"

