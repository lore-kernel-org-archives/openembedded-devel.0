Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F38EC9832F
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 02:38:08 +0000 (UTC)
Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50041.1790563084952542285
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 19:38:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jmvI04oD;
 spf=pass (domain: gmail.com, ip: 74.125.229.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144df39b6cfso1838145c88.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 19:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790563084; x=1791167884; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sKx1YoXGB0BKzXgUnFNqqJdZd4sBGjGO6w9BNy1J3Nc=;
        b=jmvI04oD+pZw9BsJFvOFcelRBPCSmtcZ6UVSjUdlZf7RD5P2Zm3I0zKqF6R84bzRyv
         6uYE+O+Yvbnb4kUbYj0L+qAyoKWScByMsv+ite7rPmnDPZAAQAWAIDyU5mxEFovuufmB
         ftFR2y+neYl/yI/uDGsB3f7zSq9lNLDKVBRxLsQTtGlVZO8AuksEwN9vDzVpvkaZypkr
         VSrqur/b3FgQpGCat60Isl4pMt7Hktih9UBopxQwoXiHirZlXhMnA5/uJmldPJjFZhe2
         6JMXbIpj9xkKEtdd8GjOvMkFU2/CceV3st4uNpDeMI2NuOGg9otI+Hu/hczj1XUV3LEc
         SmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790563084; x=1791167884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sKx1YoXGB0BKzXgUnFNqqJdZd4sBGjGO6w9BNy1J3Nc=;
        b=fLyo68Q/74SCF2zD1A9ImDwyQ+SLLUP+R8Cu8YfgTImJC/XJQGT5irmYCWmlo1g67c
         aTHZPnEY8ST5UNy00ilhsPYd5+9et8iVzIbQjtrrIXi6k70qWuR6oNcufFeVkFVUr+zK
         8VIOJZgMAe/93x2/ha0i69gIAqA+SF6tzd8y0NQ2BOA8EoZqN7q62fY6Mepl8JsE4qye
         QTxof20LxYFLICi+EiwX72vxRykUgQiL3Xg7jEzvq3t5zj+iZ2xeGptfP6ib5K3eojeZ
         CSt9x7I5Yg8CoXT3/8XyGwTc6mEEL54jkOywpB2gxiMgK9KTnwsZY+GE3LT4RsjPG5iT
         Gtbg==
X-Gm-Message-State: AFuF++na+Lpam57YCIUCgdzRdTfqVhkKH4/j/LfNgYx5C7hJ0qWeJBqe
	0nfj5Xg5V2crNwIcT+Ur/EtuyRKu+nb9NZOnK++Q0yMWQp/9rgumOZOSkkCmSFL8
X-Gm-Gg: AYBFou0Vc1vfbr8sw37BvWXqYjQTBIYlWeWUKeO9mbepdSeRi8Bb4pZFJQzN2P8ymvw
	x+TGC5s/AgeQ2s1M0PdWb+Uvv4jPdkkTjxuD/n98cpbs/qeM1pZK/0oKTEROBVrWShMEmVEh1O4
	xPXlaAXBqlRNQtCGpZ41CrRbnI07tV64EYsLqnNAsN43LRQejEPfzs8d619AahQl9tSLfLyJn1y
	TsMATevZjtf6JTWW5jTX5bFsyc81UzzaFraEWzXbc48vStxXLH9UVh1RYfy2xNbte28gLGrcoY0
	Tp0wtzr+c7CXGKqa53oUzBdtlIVx3LASx0aCq0cq8vvvum2J4vAcvQCe+a/LQmRfGuSyXQIYM/4
	DAWnlU6lZlHikVxV4QgS5fi8j1ZHn1qT/oPEkqA3JQY3hO1onlNOe3jlLBWNXjSLxj2lVrOwLLP
	D28Saa5E7LejcB0aDTONQreyn4FecXEhUNxFK8lqqRyTXy2WzVfpHx6Kb5v/pfIrqwek0b6lhnw
	LQ7wcd2QwUI1nYupFY/mpMfsGddH8siA34R1u2MMhPLsvioWzMTls5vJtSxsVoa3XxEYfUTILkP
	zlmm+xG+7D7ZVa3kCzriYagKQn50xm/4gCrLVfwMqCxpwa23YHs17JZ07KgBQKkysP6zG31slgM
	nj2bUrokzRztHoizkTAe/fo7xtx/aMLCGWCgGp6HxwliF/7Mk6/KrafdqRZqf7Bfq89iT0toeDd
	gcwo/ZeciWr7w88NsJhPbddrtT9279j5bfTH39mQ==
X-Received: by 2002:a05:7022:7f1c:b0:149:cfa4:9b3b with SMTP id a92af1059eb24-149cfa49d51mr1476223c88.3.1790563084070;
        Sun, 27 Sep 2026 19:38:04 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-347834cf4d3sm2207926eec.7.2026.09.27.19.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 19:38:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 2/2] python3-scapy: fix libpcap loading and ptests on musl
Date: Sun, 27 Sep 2026 19:38:00 -0700
Message-ID: <20260928023800.2665021-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928023800.2665021-1-khem.raj@oss.qualcomm.com>
References: <20260928023800.2665021-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 02:38:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130423

- ctypes.util.find_library() relies on "ldconfig -p", gcc or ld, none of
  which exist on a musl target, so find_library("pcap") returns None
  and scapy raises "Cannot find libpcap.so library" even with libpcap
  installed. That disabled conf.use_pcap and BPF filter compilation and
  failed ten ptests (offline sniff() with filters, tcpdump(), tdecode(),
  traceroute). Fall back to loading libpcap.so.1/libpcap.so by name.

- The NetBSD read_routes6() test compares IPv4-compatible IPv6 prefixes
  as strings, but musl's inet_ntop() prints ::127.0.0.0 as ::7f00:0.
  Normalise the expected values with in6_ptop().

Tested with meta-networking-image-ptest-python3-scapy on qemux86-64
with yoe-musl-systemd-wayland: TOTAL: 1 FAIL: 0.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...pcap-even-when-find_library-cannot-l.patch | 52 +++++++++++++++++++
 ...d-on-libc-formatting-of-IPv4-compati.patch | 37 +++++++++++++
 .../python/python3-scapy_2.7.0.bb             |  2 +
 3 files changed, 91 insertions(+)
 create mode 100644 meta-networking/recipes-devtools/python/python3-scapy/0003-libpcap-load-libpcap-even-when-find_library-cannot-l.patch
 create mode 100644 meta-networking/recipes-devtools/python/python3-scapy/0004-test-don-t-depend-on-libc-formatting-of-IPv4-compati.patch

diff --git a/meta-networking/recipes-devtools/python/python3-scapy/0003-libpcap-load-libpcap-even-when-find_library-cannot-l.patch b/meta-networking/recipes-devtools/python/python3-scapy/0003-libpcap-load-libpcap-even-when-find_library-cannot-l.patch
new file mode 100644
index 0000000000..fe4bd431ea
--- /dev/null
+++ b/meta-networking/recipes-devtools/python/python3-scapy/0003-libpcap-load-libpcap-even-when-find_library-cannot-l.patch
@@ -0,0 +1,52 @@
+From 6ee4ddc1b53f792d4e2a7826d65cebeeb9d9eb79 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sun, 27 Sep 2026 15:54:57 -0700
+Subject: [PATCH 3/4] libpcap: load libpcap even when find_library() cannot
+ locate it
+
+ctypes.util.find_library() finds libraries through "ldconfig -p", gcc
+or ld. A target system may have none of them; on musl-based systems
+there is no ldconfig cache at all, so find_library("pcap") returns None
+even with libpcap installed, and scapy reports
+
+  OSError: Cannot find libpcap.so library
+
+which disables conf.use_pcap and BPF filter compilation (sniff() with a
+filter, tcpdump(), tdecode(), ...). Fall back to loading libpcap.so.1 or
+libpcap.so by name and let the dynamic loader search its default paths.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ scapy/libs/winpcapy.py | 18 +++++++++++++++---
+ 1 file changed, 15 insertions(+), 3 deletions(-)
+
+diff --git a/scapy/libs/winpcapy.py b/scapy/libs/winpcapy.py
+index 42bfa850..c537b22b 100644
+--- a/scapy/libs/winpcapy.py
++++ b/scapy/libs/winpcapy.py
+@@ -36,9 +36,21 @@ else:
+     # Try to load libpcap
+     SOCKET = c_int
+     _lib_name = find_library("pcap")
+-    if not _lib_name:
+-        raise OSError("Cannot find libpcap.so library")
+-    _lib = CDLL(_lib_name)
++    if _lib_name:
++        _lib = CDLL(_lib_name)
++    else:
++        # ctypes.util.find_library() relies on ldconfig, gcc or ld to
++        # locate libraries, none of which may exist on the target (e.g.
++        # musl-based systems have no "ldconfig -p"). Fall back to letting
++        # the dynamic loader search its default paths.
++        for _lib_name in ("libpcap.so.1", "libpcap.so"):
++            try:
++                _lib = CDLL(_lib_name)
++                break
++            except OSError:
++                pass
++        else:
++            raise OSError("Cannot find libpcap.so library")
+
+
+ ##
diff --git a/meta-networking/recipes-devtools/python/python3-scapy/0004-test-don-t-depend-on-libc-formatting-of-IPv4-compati.patch b/meta-networking/recipes-devtools/python/python3-scapy/0004-test-don-t-depend-on-libc-formatting-of-IPv4-compati.patch
new file mode 100644
index 0000000000..cc238fbd12
--- /dev/null
+++ b/meta-networking/recipes-devtools/python/python3-scapy/0004-test-don-t-depend-on-libc-formatting-of-IPv4-compati.patch
@@ -0,0 +1,37 @@
+From 7602260f82f54cf9b179549c5b03866ec16f68d5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sun, 27 Sep 2026 15:54:57 -0700
+Subject: [PATCH 4/4] test: don't depend on libc formatting of IPv4-compatible
+ addresses
+
+The NetBSD read_routes6() test compares route prefixes such as
+::127.0.0.0 as strings, but scapy formats them with the libc's
+inet_ntop(). glibc prints IPv4-compatible addresses in dotted form,
+while musl only does so for IPv4-mapped (::ffff:a.b.c.d) addresses and
+prints ::7f00:0, ::e000:0 and ::ff00:0, so the test fails on musl.
+Both forms denote the same address; normalise the expected values with
+in6_ptop() so they match whatever the libc produces.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ test/regression.uts | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/test/regression.uts b/test/regression.uts
+index 4c972fa1..b6bb9d6e 100644
+--- a/test/regression.uts
++++ b/test/regression.uts
+@@ -3134,9 +3134,9 @@ assert routes == [
+     ('::', 104, '::1', 'lo0', ['::1'], 1),
+     ('::', 96, '::1', 'lo0', ['::1'], 1),
+     ('::1', 128, '::', 'lo0', ['::1'], 1),
+-    ('::127.0.0.0', 104, '::1', 'lo0', ['::1'], 1),
+-    ('::224.0.0.0', 100, '::1', 'lo0', ['::1'], 1),
+-    ('::255.0.0.0', 104, '::1', 'lo0', ['::1'], 1),
++    (in6_ptop('::127.0.0.0'), 104, '::1', 'lo0', ['::1'], 1),
++    (in6_ptop('::224.0.0.0'), 100, '::1', 'lo0', ['::1'], 1),
++    (in6_ptop('::255.0.0.0'), 104, '::1', 'lo0', ['::1'], 1),
+     ('::ffff:0.0.0.0', 96, '::1', 'lo0', ['::1'], 1),
+     ('2001:db8::', 32, '::1', 'lo0', ['::1'], 1),
+     ('2002::', 24, '::1', 'lo0', ['::1'], 1),
diff --git a/meta-networking/recipes-devtools/python/python3-scapy_2.7.0.bb b/meta-networking/recipes-devtools/python/python3-scapy_2.7.0.bb
index 35a4c6fc36..aa570308a9 100644
--- a/meta-networking/recipes-devtools/python/python3-scapy_2.7.0.bb
+++ b/meta-networking/recipes-devtools/python/python3-scapy_2.7.0.bb
@@ -20,6 +20,8 @@ SRCREV = "1de09fe85fe5c9d60ea5c6de130374e170b5bc28"
 SRC_URI = "git://github.com/secdev/scapy.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-python3-scapy-skip-ICMP-regression-tests-in-ptest.patch \
            file://0002-main-initialize-banner-for-the-default-Python-shell.patch \
+           file://0003-libpcap-load-libpcap-even-when-find_library-cannot-l.patch \
+           file://0004-test-don-t-depend-on-libc-formatting-of-IPv4-compati.patch \
            file://run-ptest"

 UPSTREAM_CHECK_COMMITS = "1"

