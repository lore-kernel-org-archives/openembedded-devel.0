Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1654.1792738448179043249
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 23:54:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WjIeyaMc;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a05f2d5cd3so250201b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 23:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792738447; x=1793343247; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eA1E1GvgS6PiKXSSOoEqb/GNFyV/0XRlwUpuv5fv/Tk=;
        b=WjIeyaMc5hM8aIs69NBkSHV06SeS54aH2Pp80GNDcmsufFuGsT+6NsOv8fuFhS62EG
         N18k9V/JJyZGYl1HY/oKkeRWZeLITX1zHxNyQPMKoVL+it35Uq/fFrWhkaEaLvPtiGiV
         NznIoGA/F0HA/ELsoF7UhKhuHhHljrfdylhP+wgnHOdG+praLyDt3maqs4VEnydpnciP
         YNFR5lIim00TyOZi9oH6a9SRsMRM7W5aiD+fMmQsBDFEZf125APJR6SyOedsbOoGYWvy
         lsHZfV38YTBlrj6vITz4ErEGQl8PcHlrZ/hnbrxlImUuEQbHJ9U3y03N8e/I/yPxJtXF
         LY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738447; x=1793343247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eA1E1GvgS6PiKXSSOoEqb/GNFyV/0XRlwUpuv5fv/Tk=;
        b=SmbbWyt5SWC60Y36F17v47AW5gfRcp/a9R+z04eWfoUZVI+66x3adMeTKfV7GL6e07
         3ygjF5RvdNKMIZW2E4dP8ZVOutHpkC4xY68BNvkYTr/TjasXvUcSfoKEGonlFjTlvu0m
         YYkSfTpvBdqEgkGG6s+1gdNalLhFh7emE/10+Ms8p83qgiTVmzDgbhZqeZ34gP6sJ3os
         5x7vLC/kQ8+sRQ3QaLKR7UyNX91DHm+HclWFxgkP7D52V5+OE8vqwnl3Fy/SH/a4t7/b
         o7934xxyh46zNTPTQMGybjD/QCdTcZSjdEfbvWTgBJP48Vgk5Lm9JvFahf1JrHQKGD53
         E0sg==
X-Gm-Message-State: AFq9FYLA2Iki0Pow/1OttLudWr/xo5/OK7amca7HLJw0jfMZlh8W2n9z
	9a2Zhkrb//TYv3u71KdRbyNfM5/hUBEdFloHkmCrEkC7ts338c5dBbX2xQd5OBAaXic=
X-Gm-Gg: AYBFou3MHcRcZ2NZpHW90BNWXBo8ARznMaRjJ6nt1R0lCY/rSAn6mhjWkuGWtlaR23I
	g/QfCRl7PhZdRjg8lFHE6s/Q5VP0JMXq0z0fVieYhQz5EcjnkdVjw1SkH29GpTyicaMSd7ZoPNR
	nNlIG5NyMtpQnsu16kI+EhLB0dHs16DDpu/YjCMBtUfBm5ntvm0/llt9SBWrsG8J3LXESBKF9g2
	eXeJU9nc9SrhG14xUfHF7GHThDvfNzIQ1DkcenjZWesB02KOcePsrZdqw466aPX2O1BqBU65vZx
	TJgxfEyn4D7+uQ6bMAr5J5J0GyRFe6KsLENYp9YQQnfUlOivQ+PPYFjdzhatRoksGieOM2D2Q5Y
	J7ntnI6DItwQm7H6eF6DuJYUTwp3jeAlPg22N+DyfB2XEF/z+R5aPKJqKrIX2pmxAkgwZBcrMIZ
	kwUttHJKBqXGlZblGIJsdRwnfNGI3TD4r5n2j2EkhD/EjhNj8lBFRdcxDFAdU9oBpowzPN0Lj+M
	UM58D3UkwZIjH+iU65EYd3295ZUSNHV6Ba4/ut/BM2gQD/PiFFUETUyq+8K6o4GSvXa3bwZeQvN
	MP5ni5776TmY5qR9A/oLS49e6V8L6fqjNyZCpQ2i8iJkFUud49OQa5j4VGAF2DlDdJ6oQYazdzY
	qrO+Sg1xfzeaMBgDwUMYIoE1Sb7JSKNKuEZmYWxWHXQHPPs19uh5YOmR+MXJiiw0b+06SR0dRCT
	+s2TVNzwodxQc+NojffGHsgKev5OEZUH2MNk+C5/pWJ2pIwP6YvR5hZZ+QnkvAtTyrj1owsVhw4
	njZe4wAQ7f+5PNzLtdFV8Ly7zxhmyu+7sxOz2ghcEtZy69mhTMr
X-Received: by 2002:a05:6a21:748b:b0:3e0:d237:244b with SMTP id adf61e73a8af0-3e369359686mr996865637.16.1792738447462;
        Thu, 22 Oct 2026 23:54:07 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c92f7bd8sm384769b3a.50.2026.10.22.23.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:54:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 12/29] rtorrent: Fix libatomic detection with optimized builds
Date: Thu, 22 Oct 2026 23:53:33 -0700
Message-ID: <20261023065350.3228996-12-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
References: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 06:54:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131336
Content-Type: text/plain; charset="utf-8"

The configure check for -latomic links a program that loads from a
local std::atomic<uint64_t>, which clang folds away at -O2. On riscv32
it therefore reports that libatomic is not needed, and linking rtorrent
fails:

  ld.lld: error: undefined symbol: __atomic_load_8

Add a patch that makes the test atomic global and modifies it with
fetch_add() so the check cannot be optimized away.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...e-atomic-test-program-from-being-opt.patch | 57 +++++++++++++++++++
 .../rtorrent/rtorrent_0.16.25.bb              |  4 +-
 2 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/rtorrent/rtorrent/0001-checks.m4-Keep-the-atomic-test-program-from-being-opt.patch

diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent/0001-checks.m4-Keep-the-atomic-test-program-from-being-opt.patch b/meta-oe/recipes-connectivity/rtorrent/rtorrent/0001-checks.m4-Keep-the-atomic-test-program-from-being-opt.patch
new file mode 100644
index 0000000000..5f18c63c2c
--- /dev/null
+++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent/0001-checks.m4-Keep-the-atomic-test-program-from-being-opt.patch
@@ -0,0 +1,57 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Wed, 21 Oct 2026 13:00:00 -0700
+Subject: [PATCH] checks.m4: Keep the atomic test program from being optimized
+ away
+
+TORRENT_CHECK_ATOMIC decides whether -latomic is needed by linking a
+program that loads from a local std::atomic<uint64_t>. The atomic never
+escapes, so with -O2 in CXXFLAGS clang folds the load to a constant and
+no __atomic_* call is emitted. The check then reports that -latomic is
+not required even on targets that need it for 64-bit atomics, such as
+riscv32, and linking fails later:
+
+  ld.lld: error: undefined symbol: __atomic_load_8
+
+Make the atomic global and modify it with fetch_add() so the atomic
+operations are emitted at any optimization level.
+
+Upstream-Status: Submitted [https://github.com/rakshasa/rtorrent/pull/2072]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ scripts/checks.m4 | 13 +++++++++----
+ 1 file changed, 9 insertions(+), 4 deletions(-)
+
+--- a/scripts/checks.m4
++++ b/scripts/checks.m4
+@@ -99,13 +99,17 @@
+ ])
+
+
++# The atomic is global and modified with a read-modify-write operation,
++# otherwise the compiler can optimize the operations away and the program
++# links without libatomic even on targets that need it.
+ AC_DEFUN([TORRENT_CHECK_ATOMIC], [
+   AC_MSG_CHECKING([whether 64-bit atomic operations require -latomic])
+   AC_LANG_PUSH(C++)
+
+   AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <cstdint>
+-                                    #include <atomic>]],
+-                                    [[std::atomic<uint64_t> x(0);
++                                    #include <atomic>
++                                    std::atomic<uint64_t> x(0);]],
++                                    [[x.fetch_add(1);
+                                     return x.load();]])],
+     [
+       AC_MSG_RESULT([no])
+@@ -116,8 +120,9 @@
+       LIBS="$LIBS -latomic"
+
+       AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <cstdint>
+-                                        #include <atomic>]],
+-                                        [[std::atomic<uint64_t> x(0);
++                                        #include <atomic>
++                                        std::atomic<uint64_t> x(0);]],
++                                        [[x.fetch_add(1);
+                                         return x.load();]])],
+         [
+           AC_MSG_RESULT([yes])
diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.25.bb b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.25.bb
index 26cf52346c..b6057872a6 100644
--- a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.25.bb
+++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.25.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"

 DEPENDS = "autoconf-archive libsigc++-2.0 curl cppunit libtool libtorrent ncurses"

-SRC_URI = "git://github.com/rakshasa/rtorrent;branch=master;protocol=https;tag=v${PV}"
+SRC_URI = "git://github.com/rakshasa/rtorrent;branch=master;protocol=https;tag=v${PV} \
+           file://0001-checks.m4-Keep-the-atomic-test-program-from-being-opt.patch \
+           "

 SRCREV = "15ccae27deb9aa1dc8e46ea0ed218a673ccc5732"

