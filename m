Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D2CD116EA
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 20:10:10 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3127.1764360607224190744
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Nov 2025 12:10:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z38fHpY9;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42b31507ed8so2026727f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 12:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764360605; x=1764965405; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NTjMcWZ0rlxcaSsk+/Tjm+6umKAVKxyppzjnw573wTo=;
        b=Z38fHpY9nhPEpLmJs4wSsgeKhtM40rFnq9kk4TJN0kwv6flvSkl088KCPGUcUFrL5C
         alIYnISJQymNeKn3iHl7fRlVXGHe1Ya+bZ4HtDAlLDkgVBgbHZfi8EuQfSeqD5uHZVFm
         HEQQoSACxH/SJCJGD2siSPZOrHQ9HxEPzBJ7qg1Y+kVoCa7jwz8M00O8wz96hUpNP4hw
         j40irKfO8WZiIp63am2qzzqjgDixw7ZgeLULQZKqDxjdN/aCsTm9fss9bQAlE6YnzFMJ
         dBgsd4E0WnaE+mleIlQrkD4xL1PeUwfqV4T327OtuVW1soCtCg2SfmpFd/IH365xQjnj
         iSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764360605; x=1764965405;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NTjMcWZ0rlxcaSsk+/Tjm+6umKAVKxyppzjnw573wTo=;
        b=K51LmZXL62yUL1XXXNsRcw0vOZN8CQdhLyCpYd9PFS2db7QYEs3Ct23g6ZpvK+qphv
         Mq8364PI2VaN7catU9A/47kzxymYr0l8DJRimz17Mm5qRLGk15BN5LWcrzTrNofpDP4q
         WgS91lNF79ya0oYGSiYolDYPg8cZBjwDWrGehPXLo5YSDnGPfIBzFJy8Ob4Ko332wq1F
         Mht51H6RYRbs6SCh5X7TWVHxWZiwB9MyzMV5iPHnltvAH40MyfQC9jrkOUVTdav2qW1t
         RnlVVaxab8MVeiGoQ0vJpl213FLfM9gb80Rts4PwUQNdNtB5NaPg6DW41LfpmywSMUbq
         cbcQ==
X-Gm-Message-State: AOJu0YydzKWWSdTdUOk4P4a3vcQ3iV4zq7ClNYBWZTAlLWuPjaYJY4gt
	fu0Gl1iJO8WSK3Wac+NiaP8vBwS4B5QecInvs61lNQDEO2omQ0cmm2gFKB+NDA==
X-Gm-Gg: ASbGncup7z5K+98MTiXuYg0Pdq1VOLx+EOdhr8nK3AGjrgLk54yppEc6T9uwki6ahww
	iZKXf2ExXrCuFZ5rsxuttQuUiSJ3U/tcte8UH9ohGn4zwghYQAcFMPMOIJF84WP7w+/eTXPCV+f
	qysv5rKd84pWCSB1/bBOgO3e/9UAPYGko4q6XZI/M0IiCFMNH2pJnzI27hXGzDQgBYaaoxfzlLS
	gUX5vjxslopXvvNPQGgksejxpV1UIOnEfUV+sTYwrkoFVzFhrIZvV3nCYSQzq2QSQyByMwcRUEk
	9vWnlhzCOdI5ArF35puYKrp9rx8DeHV/P5KQm6CbyhZvtpCummVcRSq3T5pub9QQctKpnULlGx7
	BaP28fwKV0WgRak/c+2YXUcz0NVAwO742Nc7d1o4RJWPV0XxsQS7RIGlyJRkr/CltyFWnY6vIzx
	CcK5yKhJOT3qg9qbQM1jVJmtUIZOfkUg==
X-Google-Smtp-Source: AGHT+IGOQrwb17uU+wkclu3Sm8wwPOhR86uym7LAFRGuyss9A+a8ghMX2and8jBlIwsF9UKouXK/6Q==
X-Received: by 2002:a05:6000:2210:b0:429:d170:b3ac with SMTP id ffacd0b85a97d-42e0f21e7a9mr18128502f8f.13.1764360605329;
        Fri, 28 Nov 2025 12:10:05 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d6133sm12130875f8f.16.2025.11.28.12.10.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 12:10:04 -0800 (PST)
Message-ID: <5e19ffb9-5b1e-4227-a316-0cf26d092f53@gmail.com>
Date: Fri, 28 Nov 2025 21:10:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 2/3] dbus-broker: add ptest support
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20251127161711.2341194-1-skandigraun@gmail.com>
 <20251127161711.2341194-2-skandigraun@gmail.com>
 <CAMKF1sqGCohP7gPUCtBqmiBdQRfWXfcgRpXthaKHtf4OdGCjwA@mail.gmail.com>
 <2326df17-cb30-45df-bbc6-ea0b0c72d84d@gmail.com>
 <CAMKF1sq48H3wCMeQLNHuMCxZ3=4Xpi0Zmg1TK4_xPDmJO6fJWA@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMKF1sq48H3wCMeQLNHuMCxZ3=4Xpi0Zmg1TK4_xPDmJO6fJWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 20:10:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122131


On 11/28/25 21:05, Khem Raj wrote:
> No, typo its with musl/sysvinit
>

Ah, I see. 
I can add this recipe conditionally to the ptest list, and make it a
blank when systemd is not enabled. Will send a v2.

> On Fri, Nov 28, 2025 at 12:02 PM Gyorgy Sarvari
> <skandigraun@gmail.com> wrote:
>
>     On 11/28/25 20:34, Khem Raj wrote:
>     > with musl/systemd combo I get
>     >
>
>     Wait, you mean that you have systemd enabled in DISTRO_FEATURES, and
>     still this error is thrown?
>
>
>     >  ERROR: Nothing RPROVIDES 'dbus-broker-ptest' (but
>     > virtual:mcextend:dbus-broker:/srv/build/yoe/
>     >    ↪
>     >
>     sources/meta-openembedded/meta-oe/recipes-core/images/meta-oe-image-ptest.bb
>     <http://meta-oe-image-ptest.bb>
>     > <http://meta-oe-image-ptest.bb> RDEPENDS on or
>     >    ↪ otherwise requires it)
>     >    dbus-broker RPROVIDES dbus-broker-ptest but was skipped: using
>     > DISTRO 'yoe', which is missing
>     >    ↪ required DISTRO_FEATURES: 'systemd'
>     >    NOTE: Runtime target 'dbus-broker-ptest' is unbuildable,
>     removing...
>     >    Missing or unbuildable dependency chain was:
>     ['dbus-broker-ptest']
>     >    NOTE: Runtime target 'meta-oe-image-ptest-all-dev' is
>     unbuildable,
>     > removing...
>     >    Missing or unbuildable dependency chain was:
>     > ['meta-oe-image-ptest-all-dev', 'meta-oe-image-
>     >    ↪ ptest-dbus-broker', 'dbus-broker-ptest']
>     >    NOTE: Runtime target 'meta-oe-image-ptest-all' is unbuildable,
>     > removing...
>     >    Missing or unbuildable dependency chain was:
>     > ['meta-oe-image-ptest-all', 'meta-oe-image-ptest-
>     >    ↪ dbus-broker', 'dbus-broker-ptest']
>     >    ERROR: Nothing RPROVIDES 'meta-oe-image-ptest-dbus-broker'
>     >    No eligible RPROVIDERs exist for
>     'meta-oe-image-ptest-dbus-broker'
>     >    NOTE: Runtime target 'meta-oe-image-ptest-dbus-broker' is
>     > unbuildable, removing...
>     >    Missing or unbuildable dependency chain was:
>     > ['meta-oe-image-ptest-dbus-broker']
>     >
>     > On Thu, Nov 27, 2025 at 8:17 AM Gyorgy Sarvari via
>     > lists.openembedded.org <http://lists.openembedded.org>
>     <http://lists.openembedded.org>
>     > <skandigraun=gmail.com@lists.openembedded.org> wrote:
>     >
>     >     It takes less than 30 seconds to execute.
>     >
>     >     Add a backported patch that fixes a broken test.
>     >
>     >     Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>     >     ---
>     >      .../include/ptest-packagelists-meta-oe.inc    |  1 +
>     >      ...-loosen-verification-of-stale-pidfds.patch | 52
>     >     +++++++++++++++++++
>     >      .../recipes-core/dbus/dbus-broker/run-ptest   | 19 +++++++
>     >      meta-oe/recipes-core/dbus/dbus-broker_37.bb
>     <http://dbus-broker_37.bb>
>     >     <http://dbus-broker_37.bb>   | 12 ++++-
>     >      4 files changed, 82 insertions(+), 2 deletions(-)
>     >      create mode 100644
>     >   
>      meta-oe/recipes-core/dbus/dbus-broker/0001-test-sockopt-loosen-verification-of-stale-pidfds.patch
>     >      create mode 100644
>     meta-oe/recipes-core/dbus/dbus-broker/run-ptest
>     >
>     >     diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
>     >     b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
>     >     index 52ca06ae43..b725c1aa36 100644
>     >     --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
>     >     +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
>     >     @@ -12,6 +12,7 @@ PTESTS_FAST_META_OE = "\
>     >          cli11 \
>     >          cmocka \
>     >          cunit \
>     >     +    dbus-broker \
>     >          duktape \
>     >          exiv2 \
>     >          fuse3 \
>     >     diff --git
>     >   
>      a/meta-oe/recipes-core/dbus/dbus-broker/0001-test-sockopt-loosen-verification-of-stale-pidfds.patch
>     >   
>      b/meta-oe/recipes-core/dbus/dbus-broker/0001-test-sockopt-loosen-verification-of-stale-pidfds.patch
>     >     new file mode 100644
>     >     index 0000000000..fac5be1917
>     >     --- /dev/null
>     >     +++
>     >   
>      b/meta-oe/recipes-core/dbus/dbus-broker/0001-test-sockopt-loosen-verification-of-stale-pidfds.patch
>     >     @@ -0,0 +1,52 @@
>     >     +From cc7f9da25b103aacbb1595d04af9cb70ef8f43d9 Mon Sep 17
>     00:00:00
>     >     2001
>     >     +From: Gyorgy Sarvari <skandigraun@gmail.com>
>     >     +Date: Thu, 4 Sep 2025 10:23:36 +0200
>     >     +Subject: [PATCH] test/sockopt: loosen verification of stale
>     pidfds
>     >     +
>     >     +From: David Rheinsberg <david@readahead.eu>
>     >     +
>     >     +Newer kernels now properly return stale pidfds from AF_UNIX
>     sockets,
>     >     +rather than refusing the operation. Ensure that our tests adopt
>     >     to this
>     >     +and properly verify staleness.
>     >     +
>     >     +Signed-off-by: David Rheinsberg <david@readahead.eu>
>     >     +Upstream-Status: Backport
>     >   
>      [https://github.com/bus1/dbus-broker/commit/fd5c6e191bffcf5b3e6c9abb8b0b03479accc04b]
>     >     +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>     >     +---
>     >     + src/util/test-sockopt.c | 16 ++++++++++++----
>     >     + 1 file changed, 12 insertions(+), 4 deletions(-)
>     >     +
>     >     +diff --git a/src/util/test-sockopt.c b/src/util/test-sockopt.c
>     >     +index 04148af..eaa8fba 100644
>     >     +--- a/src/util/test-sockopt.c
>     >     ++++ b/src/util/test-sockopt.c
>     >     +@@ -81,17 +81,25 @@ static void test_peerpidfd_client(
>     >     +
>     >     +         r = sockopt_get_peerpidfd(fd, &pidfd);
>     >     +         if (r != SOCKOPT_E_UNSUPPORTED) {
>     >     +-                if (stale) {
>     >     +-                        c_assert(r == SOCKOPT_E_REAPED);
>     >     ++                if (r == SOCKOPT_E_REAPED) {
>     >     ++                        /*
>     >     ++                         * Old kernels refused to return stale
>     >     pidfds. Hence,
>     >     ++                         * in that case verify that we
>     expected
>     >     a stale pidfd.
>     >     ++                         */
>     >     ++                        c_assert(stale);
>     >     +                 } else {
>     >     +                         c_assert(!r);
>     >     +                         c_assert(pidfd >= 0);
>     >     +
>     >     +                         r = proc_resolve_pidfd(pidfd,
>     &pid_socket);
>     >     +                         c_assert(!r);
>     >     +-                        c_assert(pid_socket > 0);
>     >     +
>     >     +-                        c_assert(pid_socket == pid_server);
>     >     ++                        if (stale) {
>     >     ++                                c_assert(pid_socket == -1);
>     >     ++                        } else {
>     >     ++                                c_assert(pid_socket > 0);
>     >     ++                                c_assert(pid_socket ==
>     pid_server);
>     >     ++                        }
>     >     +                 }
>     >     +         }
>     >     + }
>     >     diff --git a/meta-oe/recipes-core/dbus/dbus-broker/run-ptest
>     >     b/meta-oe/recipes-core/dbus/dbus-broker/run-ptest
>     >     new file mode 100644
>     >     index 0000000000..789000523e
>     >     --- /dev/null
>     >     +++ b/meta-oe/recipes-core/dbus/dbus-broker/run-ptest
>     >     @@ -0,0 +1,19 @@
>     >     +#!/bin/sh
>     >     +RET=0
>     >     +
>     >     +run_tests(){
>     >     +  for t in *; do
>     >     +    if ./$t; then
>     >     +      echo PASS: $t
>     >     +    else
>     >     +      echo FAIL: $t
>     >     +      RET=1
>     >     +    fi
>     >     +  done
>     >     +}
>     >     +
>     >     +cd /usr/lib/dbus-broker/tests/dbus
>     >     +run_tests
>     >     +cd /usr/lib/dbus-broker/tests/unit
>     >     +run_tests
>     >     +exit $RET
>     >     diff --git a/meta-oe/recipes-core/dbus/dbus-broker_37.bb
>     <http://dbus-broker_37.bb>
>     >     <http://dbus-broker_37.bb>
>     >     b/meta-oe/recipes-core/dbus/dbus-broker_37.bb
>     <http://dbus-broker_37.bb>
>     >     <http://dbus-broker_37.bb>
>     >     index f0312181b6..c531f555d2 100644
>     >     --- a/meta-oe/recipes-core/dbus/dbus-broker_37.bb
>     <http://dbus-broker_37.bb>
>     >     <http://dbus-broker_37.bb>
>     >     +++ b/meta-oe/recipes-core/dbus/dbus-broker_37.bb
>     <http://dbus-broker_37.bb>
>     >     <http://dbus-broker_37.bb>
>     >     @@ -10,7 +10,10 @@ DEPENDS = "\
>     >          ${@bb.utils.contains('DISTRO_FEATURES', 'selinux',
>     >     'libselinux (>= 3.2)', '', d)} \
>     >      "
>     >
>     >     -SRC_URI =
>     >   
>      "https://github.com/bus1/dbus-broker/releases/download/v${PV}/${BP}.tar.xz
>     <https://github.com/bus1/dbus-broker/releases/download/v$%7BPV%7D/$%7BBP%7D.tar.xz>
>     >   
>      <https://github.com/bus1/dbus-broker/releases/download/v$%7BPV%7D/$%7BBP%7D.tar.xz>"
>     >     +SRC_URI =
>     >   
>      "https://github.com/bus1/dbus-broker/releases/download/v${PV}/${BP}.tar.xz
>     <https://github.com/bus1/dbus-broker/releases/download/v$%7BPV%7D/$%7BBP%7D.tar.xz>
>     >   
>      <https://github.com/bus1/dbus-broker/releases/download/v$%7BPV%7D/$%7BBP%7D.tar.xz>
>     >     \
>     >     +         
>     >   
>       file://0001-test-sockopt-loosen-verification-of-stale-pidfds.patch \
>     >     +           file://run-ptest \
>     >     +           "
>     >      SRC_URI[sha256sum] =
>     >   
>      "f819a8db8795fa08c767612e3823fd594694a0990f2543ecf35d6a1a6bf2ab5b"
>     >
>     >      UPSTREAM_CHECK_URI =
>     "https://github.com/bus1/${BPN}/releases
>     <https://github.com/bus1/$%7BBPN%7D/releases>
>     >     <https://github.com/bus1/$%7BBPN%7D/releases>"
>     >     @@ -18,10 +21,11 @@ UPSTREAM_CHECK_REGEX =
>     >     "releases/tag/v(?P<pver>\d+)"
>     >
>     >      SYSTEMD_SERVICE:${PN} = "${BPN}.service"
>     >
>     >     -inherit meson pkgconfig systemd features_check
>     >     +inherit meson pkgconfig systemd features_check ptest
>     >
>     >      EXTRA_OEMESON +=
>     "-Daudit=${@bb.utils.contains('DISTRO_FEATURES',
>     >     'selinux', 'true', 'false', d)}"
>     >      EXTRA_OEMESON +=
>     >     "-Dselinux=${@bb.utils.contains('DISTRO_FEATURES', 'selinux',
>     >     'true', 'false', d)}"
>     >     +EXTRA_OEMESON += "-Dtests=${@bb.utils.contains('PTEST_ENABLED',
>     >     '1', 'true', 'false', d)}"
>     >
>     >      REQUIRED_DISTRO_FEATURES = "systemd"
>     >
>     >     @@ -36,3 +40,7 @@ RDEPENDS:${PN} += "dbus-common dbus-tools"
>     >      FILES:${PN} += "${nonarch_libdir}/systemd/catalog"
>     >      FILES:${PN} += "${systemd_system_unitdir}"
>     >      FILES:${PN} += "${systemd_user_unitdir}"
>     >     +FILES:${PN}-ptest += "${libdir}/${PN}/tests"
>     >     +
>     >     +# test-sockopt fails to compile with musl without this flag
>     >     +CFLAGS:append:libc-musl =
>     "${@bb.utils.contains('PTEST_ENABLED',
>     >     '1', ' -Wno-error=incompatible-pointer-types ', '', d)}"
>     >
>     >     -=-=-=-=-=-=-=-=-=-=-=-
>     >     Links: You receive all messages sent to this group.
>     >     View/Reply Online (#122111):
>     >   
>      https://lists.openembedded.org/g/openembedded-devel/message/122111
>     >     Mute This Topic:
>     https://lists.openembedded.org/mt/116502872/1997914
>     >     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     >     <mailto:openembedded-devel%2Bowner@lists.openembedded.org
>     <mailto:openembedded-devel%252Bowner@lists.openembedded.org>>
>     >     Unsubscribe:
>     >     https://lists.openembedded.org/g/openembedded-devel/unsub
>     >     [raj.khem@gmail.com]
>     >     -=-=-=-=-=-=-=-=-=-=-=-
>     >
>


