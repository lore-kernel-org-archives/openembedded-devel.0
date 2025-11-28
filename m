Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C81C5D116F5
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 20:02:10 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3011.1764360127067411013
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Nov 2025 12:02:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Uzh1i7vW;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b3377aaf2so1376662f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 12:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764360125; x=1764964925; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SpCcjZ2pcUFQxNPYKQarsoFg7PJXyrZU+dqrxc9/wqY=;
        b=Uzh1i7vWCejIDgPIVa1ZwJG0dri4HgEyWssqp5+u7JvKyQqYn/lUUN2MnSi6HqbOi2
         QLlZL/q3lK1qhxamGG4iMGyxapZMtkjBI6oy5kiDNYL62LKFb1muUNiVeNrQ8h4EcoW1
         r6LsFzDSmtZuijv5UdMXeVp+reQUtNnNpY+IFlzaWhTLZD1z8m/NYk7ETHT1RPCOQIhG
         /h9olZG7WZeIeXQR5yH5mFkYuXQ14qO264FhASKfo983QE+9G69OF4aSVqHnCj0urUhe
         BtXq6l+ozRUfqPi3AlujKXOvJ97N+uF/M6q9Xy/WqdI1MYh26kamivDUXBHsQjK69pxi
         pMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764360125; x=1764964925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SpCcjZ2pcUFQxNPYKQarsoFg7PJXyrZU+dqrxc9/wqY=;
        b=YzrdVSG/d+GzrDzCn6I7g+H0GkeTXrtO4Djy1z+w6bSRI0RhFV6VexRVL/VqrDCrzg
         EFJxZSu8FBVqndDKE19GS1ptKCCryOPz/mkrQh0lmqwzR2yjSTfFCRRBir9+093JQhGx
         LpGlkshon534R/BMFukJoBTiUZPvyLgqidYwfcSrwy34BD8/rmlE3A0BsWNXaJhWHBCp
         rlWBgqL45MgrapUd9aQOd7zChCX9Gfec59GAO18LpF2s2kC6zwGJUQXbXV+BEslYqmT2
         MMMPmC2V5UXHFPtkvQbchHWlRLS5a5fEKcTsYb5z+mZqFZ8q6e3eFlBOVnht2XRXWnjR
         x0og==
X-Gm-Message-State: AOJu0YxUSBNaKIugalJv5zjDKk0Ku/fcsjdOXBzztgRq2cldl2S0ojBR
	yOY40mmFYFGNZHIInUtyLjJYPConER7aWkpeRoq9EPf5/VcK9LKf1xZs
X-Gm-Gg: ASbGnctiQAZhGKBpYLo4fZWEuXgA7FliKtDrPa9tj/BJoW/O4zlCNCsbbeowD0+qq/9
	AMF31kh2IHXVodOYeLq4v2DEBElJz8TEtuRi1MX7lUqbzJftg/Y9G+IolsZkWYL3xdAU543oBZU
	z+6WyMbdSDuRYngUJy6n95yCBrdGqQ4XSk3Ms3D7kxTtXSgPYeqvmBKh9XGxwxCstDMswXNMz39
	KXdxYubgKFoZAP2MFmUrOBuQjhyufHWEuypHQbZoeAFkEWtjwTdCYKkw2jM/zrhYT6d98tkR4ET
	TbWZbYB47siJUSJD9vNsaQXP03aWKiGpoJ8QLBI+VDOEIO0tVrNpNNpqobKyHZ71dlf+qq4+rLH
	Gma54zCLCcoc8DeL6867nNBSs+dbO+DIy8lHkO8ggbPxYSYBfYMCWWobzNBTxugimz6wi0Kq5GV
	qyC9f+1uT8Wn1VpHoIy+w=
X-Google-Smtp-Source: AGHT+IEnS8uKETZRxPc/bTrfo3f8xDuzBvLjYOLNAIZSROJNArJ/CRHrjDjN7xblxhYtT0FweCzkbg==
X-Received: by 2002:a5d:5d02:0:b0:42b:3339:c7ff with SMTP id ffacd0b85a97d-42cc1d19a16mr32741375f8f.43.1764360125186;
        Fri, 28 Nov 2025 12:02:05 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca1a310sm11586310f8f.26.2025.11.28.12.02.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 12:02:04 -0800 (PST)
Message-ID: <2326df17-cb30-45df-bbc6-ea0b0c72d84d@gmail.com>
Date: Fri, 28 Nov 2025 21:02:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 2/3] dbus-broker: add ptest support
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20251127161711.2341194-1-skandigraun@gmail.com>
 <20251127161711.2341194-2-skandigraun@gmail.com>
 <CAMKF1sqGCohP7gPUCtBqmiBdQRfWXfcgRpXthaKHtf4OdGCjwA@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMKF1sqGCohP7gPUCtBqmiBdQRfWXfcgRpXthaKHtf4OdGCjwA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 20:02:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122128

On 11/28/25 20:34, Khem Raj wrote:
> with musl/systemd combo I get
>

Wait, you mean that you have systemd enabled in DISTRO_FEATURES, and
still this error is thrown?


>  ERROR: Nothing RPROVIDES 'dbus-broker-ptest' (but
> virtual:mcextend:dbus-broker:/srv/build/yoe/
>    ↪
> sources/meta-openembedded/meta-oe/recipes-core/images/meta-oe-image-ptest.bb
> <http://meta-oe-image-ptest.bb> RDEPENDS on or
>    ↪ otherwise requires it)
>    dbus-broker RPROVIDES dbus-broker-ptest but was skipped: using
> DISTRO 'yoe', which is missing
>    ↪ required DISTRO_FEATURES: 'systemd'
>    NOTE: Runtime target 'dbus-broker-ptest' is unbuildable, removing...
>    Missing or unbuildable dependency chain was: ['dbus-broker-ptest']
>    NOTE: Runtime target 'meta-oe-image-ptest-all-dev' is unbuildable,
> removing...
>    Missing or unbuildable dependency chain was:
> ['meta-oe-image-ptest-all-dev', 'meta-oe-image-
>    ↪ ptest-dbus-broker', 'dbus-broker-ptest']
>    NOTE: Runtime target 'meta-oe-image-ptest-all' is unbuildable,
> removing...
>    Missing or unbuildable dependency chain was:
> ['meta-oe-image-ptest-all', 'meta-oe-image-ptest-
>    ↪ dbus-broker', 'dbus-broker-ptest']
>    ERROR: Nothing RPROVIDES 'meta-oe-image-ptest-dbus-broker'
>    No eligible RPROVIDERs exist for 'meta-oe-image-ptest-dbus-broker'
>    NOTE: Runtime target 'meta-oe-image-ptest-dbus-broker' is
> unbuildable, removing...
>    Missing or unbuildable dependency chain was:
> ['meta-oe-image-ptest-dbus-broker']
>
> On Thu, Nov 27, 2025 at 8:17 AM Gyorgy Sarvari via
> lists.openembedded.org <http://lists.openembedded.org>
> <skandigraun=gmail.com@lists.openembedded.org> wrote:
>
>     It takes less than 30 seconds to execute.
>
>     Add a backported patch that fixes a broken test.
>
>     Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>     ---
>      .../include/ptest-packagelists-meta-oe.inc    |  1 +
>      ...-loosen-verification-of-stale-pidfds.patch | 52
>     +++++++++++++++++++
>      .../recipes-core/dbus/dbus-broker/run-ptest   | 19 +++++++
>      meta-oe/recipes-core/dbus/dbus-broker_37.bb
>     <http://dbus-broker_37.bb>   | 12 ++++-
>      4 files changed, 82 insertions(+), 2 deletions(-)
>      create mode 100644
>     meta-oe/recipes-core/dbus/dbus-broker/0001-test-sockopt-loosen-verification-of-stale-pidfds.patch
>      create mode 100644 meta-oe/recipes-core/dbus/dbus-broker/run-ptest
>
>     diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
>     b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
>     index 52ca06ae43..b725c1aa36 100644
>     --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
>     +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
>     @@ -12,6 +12,7 @@ PTESTS_FAST_META_OE = "\
>          cli11 \
>          cmocka \
>          cunit \
>     +    dbus-broker \
>          duktape \
>          exiv2 \
>          fuse3 \
>     diff --git
>     a/meta-oe/recipes-core/dbus/dbus-broker/0001-test-sockopt-loosen-verification-of-stale-pidfds.patch
>     b/meta-oe/recipes-core/dbus/dbus-broker/0001-test-sockopt-loosen-verification-of-stale-pidfds.patch
>     new file mode 100644
>     index 0000000000..fac5be1917
>     --- /dev/null
>     +++
>     b/meta-oe/recipes-core/dbus/dbus-broker/0001-test-sockopt-loosen-verification-of-stale-pidfds.patch
>     @@ -0,0 +1,52 @@
>     +From cc7f9da25b103aacbb1595d04af9cb70ef8f43d9 Mon Sep 17 00:00:00
>     2001
>     +From: Gyorgy Sarvari <skandigraun@gmail.com>
>     +Date: Thu, 4 Sep 2025 10:23:36 +0200
>     +Subject: [PATCH] test/sockopt: loosen verification of stale pidfds
>     +
>     +From: David Rheinsberg <david@readahead.eu>
>     +
>     +Newer kernels now properly return stale pidfds from AF_UNIX sockets,
>     +rather than refusing the operation. Ensure that our tests adopt
>     to this
>     +and properly verify staleness.
>     +
>     +Signed-off-by: David Rheinsberg <david@readahead.eu>
>     +Upstream-Status: Backport
>     [https://github.com/bus1/dbus-broker/commit/fd5c6e191bffcf5b3e6c9abb8b0b03479accc04b]
>     +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>     +---
>     + src/util/test-sockopt.c | 16 ++++++++++++----
>     + 1 file changed, 12 insertions(+), 4 deletions(-)
>     +
>     +diff --git a/src/util/test-sockopt.c b/src/util/test-sockopt.c
>     +index 04148af..eaa8fba 100644
>     +--- a/src/util/test-sockopt.c
>     ++++ b/src/util/test-sockopt.c
>     +@@ -81,17 +81,25 @@ static void test_peerpidfd_client(
>     +
>     +         r = sockopt_get_peerpidfd(fd, &pidfd);
>     +         if (r != SOCKOPT_E_UNSUPPORTED) {
>     +-                if (stale) {
>     +-                        c_assert(r == SOCKOPT_E_REAPED);
>     ++                if (r == SOCKOPT_E_REAPED) {
>     ++                        /*
>     ++                         * Old kernels refused to return stale
>     pidfds. Hence,
>     ++                         * in that case verify that we expected
>     a stale pidfd.
>     ++                         */
>     ++                        c_assert(stale);
>     +                 } else {
>     +                         c_assert(!r);
>     +                         c_assert(pidfd >= 0);
>     +
>     +                         r = proc_resolve_pidfd(pidfd, &pid_socket);
>     +                         c_assert(!r);
>     +-                        c_assert(pid_socket > 0);
>     +
>     +-                        c_assert(pid_socket == pid_server);
>     ++                        if (stale) {
>     ++                                c_assert(pid_socket == -1);
>     ++                        } else {
>     ++                                c_assert(pid_socket > 0);
>     ++                                c_assert(pid_socket == pid_server);
>     ++                        }
>     +                 }
>     +         }
>     + }
>     diff --git a/meta-oe/recipes-core/dbus/dbus-broker/run-ptest
>     b/meta-oe/recipes-core/dbus/dbus-broker/run-ptest
>     new file mode 100644
>     index 0000000000..789000523e
>     --- /dev/null
>     +++ b/meta-oe/recipes-core/dbus/dbus-broker/run-ptest
>     @@ -0,0 +1,19 @@
>     +#!/bin/sh
>     +RET=0
>     +
>     +run_tests(){
>     +  for t in *; do
>     +    if ./$t; then
>     +      echo PASS: $t
>     +    else
>     +      echo FAIL: $t
>     +      RET=1
>     +    fi
>     +  done
>     +}
>     +
>     +cd /usr/lib/dbus-broker/tests/dbus
>     +run_tests
>     +cd /usr/lib/dbus-broker/tests/unit
>     +run_tests
>     +exit $RET
>     diff --git a/meta-oe/recipes-core/dbus/dbus-broker_37.bb
>     <http://dbus-broker_37.bb>
>     b/meta-oe/recipes-core/dbus/dbus-broker_37.bb
>     <http://dbus-broker_37.bb>
>     index f0312181b6..c531f555d2 100644
>     --- a/meta-oe/recipes-core/dbus/dbus-broker_37.bb
>     <http://dbus-broker_37.bb>
>     +++ b/meta-oe/recipes-core/dbus/dbus-broker_37.bb
>     <http://dbus-broker_37.bb>
>     @@ -10,7 +10,10 @@ DEPENDS = "\
>          ${@bb.utils.contains('DISTRO_FEATURES', 'selinux',
>     'libselinux (>= 3.2)', '', d)} \
>      "
>
>     -SRC_URI =
>     "https://github.com/bus1/dbus-broker/releases/download/v${PV}/${BP}.tar.xz
>     <https://github.com/bus1/dbus-broker/releases/download/v$%7BPV%7D/$%7BBP%7D.tar.xz>"
>     +SRC_URI =
>     "https://github.com/bus1/dbus-broker/releases/download/v${PV}/${BP}.tar.xz
>     <https://github.com/bus1/dbus-broker/releases/download/v$%7BPV%7D/$%7BBP%7D.tar.xz>
>     \
>     +         
>      file://0001-test-sockopt-loosen-verification-of-stale-pidfds.patch \
>     +           file://run-ptest \
>     +           "
>      SRC_URI[sha256sum] =
>     "f819a8db8795fa08c767612e3823fd594694a0990f2543ecf35d6a1a6bf2ab5b"
>
>      UPSTREAM_CHECK_URI = "https://github.com/bus1/${BPN}/releases
>     <https://github.com/bus1/$%7BBPN%7D/releases>"
>     @@ -18,10 +21,11 @@ UPSTREAM_CHECK_REGEX =
>     "releases/tag/v(?P<pver>\d+)"
>
>      SYSTEMD_SERVICE:${PN} = "${BPN}.service"
>
>     -inherit meson pkgconfig systemd features_check
>     +inherit meson pkgconfig systemd features_check ptest
>
>      EXTRA_OEMESON += "-Daudit=${@bb.utils.contains('DISTRO_FEATURES',
>     'selinux', 'true', 'false', d)}"
>      EXTRA_OEMESON +=
>     "-Dselinux=${@bb.utils.contains('DISTRO_FEATURES', 'selinux',
>     'true', 'false', d)}"
>     +EXTRA_OEMESON += "-Dtests=${@bb.utils.contains('PTEST_ENABLED',
>     '1', 'true', 'false', d)}"
>
>      REQUIRED_DISTRO_FEATURES = "systemd"
>
>     @@ -36,3 +40,7 @@ RDEPENDS:${PN} += "dbus-common dbus-tools"
>      FILES:${PN} += "${nonarch_libdir}/systemd/catalog"
>      FILES:${PN} += "${systemd_system_unitdir}"
>      FILES:${PN} += "${systemd_user_unitdir}"
>     +FILES:${PN}-ptest += "${libdir}/${PN}/tests"
>     +
>     +# test-sockopt fails to compile with musl without this flag
>     +CFLAGS:append:libc-musl = "${@bb.utils.contains('PTEST_ENABLED',
>     '1', ' -Wno-error=incompatible-pointer-types ', '', d)}"
>
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#122111):
>     https://lists.openembedded.org/g/openembedded-devel/message/122111
>     Mute This Topic: https://lists.openembedded.org/mt/116502872/1997914
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     [raj.khem@gmail.com]
>     -=-=-=-=-=-=-=-=-=-=-=-
>


