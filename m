Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7981CEB64DD
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 16:09:33 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.2602.1687363766793530326
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jun 2023 09:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ipoT8PWr;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-988a2715b8cso669592166b.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jun 2023 09:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687363765; x=1689955765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPVoJOwpw9x3FhMFEF+ORYcTEefkZAVOLJcVHRXUdn4=;
        b=ipoT8PWrLKa4K3xHEtfKifjRc++5GoLDVaoaukjd50KNj1pvxz96PqDhPH93gRC65c
         u0JWAfykAXmP67i8zsvKF7MrvTH72iiUlvZO0mpHmLPa+2oLCG/GFpFSTZcNFbaTfBE+
         Me4BPkdOZ7WI/1eSt1533ansy/zrXcsVJKYldxdIktDxkFdpUpnTEjDWfRqYLdxLhYLb
         ldWK62+r34EekizH+ZwKKeXpCJ6hqCdxuPSXZGSMoAmKeI64ehqWNT970OcIGhJyERro
         ZtAlZ1IkUOZvGqebxfrnshVuDYtZbsH9IM9YxfB7zFSj0cwvdefnbQWwuym27Chbz7Tu
         8/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687363765; x=1689955765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OPVoJOwpw9x3FhMFEF+ORYcTEefkZAVOLJcVHRXUdn4=;
        b=dnBVLCHjJY6+OnadYuuNLjqlc9fA2JOBw2NkHpDOfXpWD6lJO9cDzoCEHMqspd9KUU
         lHVYl0YOp0RsTN005lxV1bg5eCtw90GOICPyqjz+Gg2VnORO2AAlhINeCRWyWEVudHnu
         iDKJZDAMch4A1kP3Eus9iT0FYuQOCZoQUbBibGt7bqJHQ3cWy1UgLl5k6RH40Q79w0wA
         1xOJ13vxNXgzgyFa4QmjzKIeAtQ+4bpZdYBOkRpPSvX6duf0Y3YjMh791nFz7nP8ukrk
         1tctzLLS3dPXheBk+CeYxYjH2x+ltZaM10P4iaviokIXGozCHxTshMsXdj/fTMfLmL4D
         IwPQ==
X-Gm-Message-State: AC+VfDy2praadGJQmYaGUmX4Byew3M6GwaKQKpss97JLwSgUIxLZ9a+v
	JC3g5y2Co01VZedwT21HSfGX/5O5NR4=
X-Google-Smtp-Source: ACHHUZ5ICilJ62mQxKfxVLu7UcF5vVPtEZs8SBLjNsf8zBtor9tO+WcwPT0IdVVhGnX6MiVbafGwNQ==
X-Received: by 2002:a17:906:4796:b0:974:5e8b:fc28 with SMTP id cw22-20020a170906479600b009745e8bfc28mr14169858ejc.9.1687363764526;
        Wed, 21 Jun 2023 09:09:24 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a19-20020a1709065f9300b00988a2c2f3e5sm3366695eju.73.2023.06.21.09.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 09:09:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCHv2 2/2] *.patch: add Upstream-Status to all patches
Date: Wed, 21 Jun 2023 18:09:11 +0200
Message-ID: <20230621160912.4193765-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230621160912.4193765-1-Martin.Jansa@gmail.com>
References: <20230621160912.4193765-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jun 2023 16:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103479

There is new patch-status QA check in oe-core:
https://git.openembedded.org/openembedded-core/commit/?id=76a685bfcf927593eac67157762a53259089ea8a

This is temporary work around just to hide _many_ warnings from
optional patch-status (if you add it to WARN_QA).

This just added
Upstream-Status: Pending
everywhere without actually investigating what's the proper status.

This is just to hide current QA warnings and to catch new .patch files being
added without Upstream-Status, but the number of Pending patches is now terrible:

5 (26%) 	meta-xfce
6 (50%) 	meta-perl
15 (42%)        meta-webserver
21 (36%)        meta-gnome
25 (57%)        meta-filesystems
26 (43%)        meta-initramfs
45 (45%)        meta-python
47 (55%)        meta-multimedia
312 (63%)       meta-networking
756 (61%)       meta-oe

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../logfsprogs/0001-Add-LDFLAGS-to-linker-cmdline.patch       | 2 ++
 ...btree-Avoid-conflicts-with-libc-namespace-about-setk.patch | 2 ++
 .../owfs/owfs/0001-Add-build-rule-for-README.patch            | 2 ++
 ...ing-PKG_CHECK_MODULES-to-found-headers-and-libraries.patch | 2 ++
 .../recipes-filesystems/smbnetfs/smbnetfs/configure.patch     | 2 ++
 .../0001-define-loff_t-if-not-already-defined.patch           | 2 ++
 ...util-ulockmgr_server.c-conditionally-define-closefro.patch | 2 ++
 .../0001-Makefile-proper-location-of-LDFLAGS.patch            | 2 ++
 ...1-Fixed-includes-so-that-it-compiles-on-Ubuntu-20.04.patch | 2 ++
 .../overlayfs-tools/0002-makefile-fix-linking-flags.patch     | 2 ++
 .../files/0001-udevil-0.4.3-fix-compile-with-gcc6.patch       | 2 ++
 ...etc-Makefile.am-Use-systemd_unitdir-instead-of-libdi.patch | 2 ++
 .../xfsprogs/files/remove_flags_from_build_flags.patch        | 2 ++
 .../files/0001-make-Add-compiler-includes-in-cflags.patch     | 2 ++
 .../0001-util.h-include-sys-reg.h-when-libc-glibc.patch       | 2 ++
 .../0001-Define-in_-structs-for-non-glibc-system-libs.patch   | 2 ++
 .../klibc/files/0001-always-use-bfd-linker.patch              | 2 ++
 .../0001-arm-Do-not-set-a-fallback-march-and-mtune.patch      | 2 ++
 .../klibc/files/0001-include-linux-sysinfo.h-directly.patch   | 2 ++
 .../klibc/files/0001-klibc-add-getrandom-syscall.patch        | 2 ++
 .../files/0001-klibc_2.0.4-add-kexec_file_load-syscall.patch  | 2 ++
 .../klibc/files/0001-mkfifo-Implement-mkfifo.patch            | 2 ++
 .../recipes-devtools/klibc/files/armv4-fix-v4bx.patch         | 2 ++
 meta-initramfs/recipes-devtools/klibc/files/cross-clang.patch | 2 ++
 .../recipes-devtools/klibc/files/klcc-consider-sysroot.patch  | 2 ++
 .../recipes-devtools/klibc/files/use-env-for-perl.patch       | 2 ++
 .../kexec-tools-klibc/0014-add-if_nameindex-from-musl.patch   | 2 ++
 .../kexec-tools-klibc/0015-vmcore-dmesg-fix-warning.patch     | 2 ++
 .../140-mips_disable_devicetree_support.patch                 | 2 ++
 .../arm64-crashdump-arm64.c-fix-warning.patch                 | 2 ++
 .../kexec-tools-klibc/arm_crashdump-fix-buffer-align.patch    | 2 ++
 .../recipes-kernel/kexec/kexec-tools-klibc/include_next.patch | 2 ++
 .../recipes-kernel/kexec/kexec-tools-klibc/klibc-reboot.patch | 2 ++
 .../0002-test-test_x509.c-fix-potential-overflow-issue.patch  | 2 ++
 .../daq/files/0001-correct-the-location-of-unistd.h.patch     | 2 ++
 .../dibbler/dibbler/dibbler_fix_getSize_crash.patch           | 2 ++
 .../recipes-connectivity/ez-ipupdate/files/Makefile.am.patch  | 2 ++
 .../recipes-connectivity/ez-ipupdate/files/cache_file.c.patch | 2 ++
 .../recipes-connectivity/ez-ipupdate/files/conf_file.c.patch  | 2 ++
 .../recipes-connectivity/ez-ipupdate/files/wformat.patch      | 2 ++
 ...pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch | 2 ++
 .../openthread/ot-br-posix/unused_var.patch                   | 2 ++
 .../rdate/rdate/0001-rdate-define-logwtmp-on-libc-glibc.patch | 2 ++
 ...0002-do-not-import-target-module-while-cross-compile.patch | 2 ++
 .../samba/samba/samba-4.3.9-remove-getpwent_r.patch           | 2 ++
 .../recipes-connectivity/samba/samba/samba-pam.patch          | 2 ++
 .../vpnc/vpnc/0001-search-for-log-help-in-build-dir.patch     | 2 ++
 .../vpnc/vpnc/0002-Fix-vpnc-install-for-cross-compile.patch   | 2 ++
 .../vpnc/0003-error.h-is-specific-to-glibc-on-linux.patch     | 2 ++
 .../vpnc/0004-Use-pkgconfig-instead-of-libgcrypt-config.patch | 2 ++
 .../0005-include-sys-ttydefaults.h-for-CEOT-definition.patch  | 2 ++
 ...sysdep-Add-header-include-sequence-to-adjust-for-mus.patch | 2 ++
 .../0007-add-error-API-when-error.h-is-not-on-platform.patch  | 2 ++
 .../vpnc/vpnc/0008-include-sysdep.h-before-net-if_tun.h.patch | 2 ++
 .../vpnc/vpnc/0009-reduce-lifetime-value.patch                | 2 ++
 .../0001-Define-__SWORD_TYPE-and-_PATH_NSSWITCH_CONF.patch    | 2 ++
 ...1-autofs-5.1.8-add-autofs_strerror_r-helper-for-musl.patch | 2 ++
 ...modules-lookup_multi.c-Replace-__S_IEXEC-with-S_IEXE.patch | 2 ++
 .../autofs/autofs/0002-Replace-__S_IEXEC-with-S_IEXEC.patch   | 2 ++
 meta-networking/recipes-daemons/autofs/autofs/cross.patch     | 2 ++
 .../autofs/fix-the-YACC-rule-to-fix-a-building-failure.patch  | 2 ++
 .../recipes-daemons/autofs/autofs/force-STRIP-to-emtpy.patch  | 2 ++
 meta-networking/recipes-daemons/autofs/autofs/no-bash.patch   | 2 ++
 .../ippool/ippool/0001-Respect-flags-from-env.patch           | 2 ++
 .../ippool/ippool/0001-read-returns-ssize_t.patch             | 2 ++
 .../0001-usl_timer-Check-for-return-value-of-write-API.patch  | 2 ++
 .../ippool/0002-Mark-first-element-of-a-string-as-null.patch  | 2 ++
 .../ippool/ippool/0002-link-with-libtirpc.patch               | 2 ++
 .../ippool/0003-cli-Mark-return-of-strtol-as-long-int.patch   | 2 ++
 .../recipes-daemons/ippool/ippool/0003-musl-fixes.patch       | 2 ++
 .../0001-layer4-Change-order-of-include-files.patch           | 2 ++
 .../recipes-daemons/openhpi/files/fix-narrowing-warning.patch | 2 ++
 ...configure-Disable-format-overflow-if-supported-by-gc.patch | 2 ++
 .../0001-configure-Pass-linker-specific-options-with-Wl.patch | 2 ++
 ...0001-immpbe_dump.cc-Use-sys-wait.h-instead-of-wait.h.patch | 2 ++
 ...src-Add-missing-header-limits.h-for-_POSIX_HOST_NAME.patch | 2 ++
 .../0002-Fix-Werror-enum-int-mismatch-with-gcc13.patch        | 2 ++
 .../recipes-daemons/postfix/files/0001-Fix-makedefs.patch     | 2 ++
 ...-makedefs-Use-native-compiler-to-build-makedefs.test.patch | 2 ++
 .../recipes-daemons/postfix/files/0004-Fix-icu-config.patch   | 2 ++
 ...configure-Check-for-Wno-error-format-truncation-comp.patch | 2 ++
 .../files/Fix-flawed-dynamic-ldb-link-test-in-configure.patch | 2 ++
 .../squid/files/Set-up-for-cross-compilation.patch            | 2 ++
 .../tftp-hpa/files/0001-__progname-is-provided-by-libc.patch  | 2 ++
 ...sysdeputil.c-Fix-with-musl-which-does-not-have-utmpx.patch | 2 ++
 .../files/usr-Makefile-apply-LDFLAGS-to-all-executables.patch | 2 ++
 .../ebtables-2.0.11/0010-Adjust-header-include-sequence.patch | 2 ++
 ...cct-Declare-the-define-visivility-attribute-together.patch | 2 ++
 .../netkit-ftp/0001-ftp-include-sys-types.h-for-u_long.patch  | 2 ++
 .../netkit-rpc/0001-rpcgen-Fix-printf-formats.patch           | 2 ++
 .../files/0001-telnet-telnetd-Fix-deadlock-on-cleanup.patch   | 2 ++
 .../files/0001-telnet-telnetd-Fix-print-format-strings.patch  | 2 ++
 .../mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch  | 2 ++
 ...snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch | 2 ++
 .../net-snmp/net-snmp/reproducibility-have-printcap.patch     | 2 ++
 .../open62541/0001-fix-build-do-not-install-git-files.patch   | 2 ++
 ...-Check-and-use-strlcpy-from-libc-before-defining-own.patch | 2 ++
 .../0002-lib-netdev-Adjust-header-include-sequence.patch      | 2 ++
 .../openl2tp/openl2tp/0001-Use-1-instead-of-WAIT_ANY.patch    | 2 ++
 .../openl2tp/0001-l2tp_api-Included-needed-headers.patch      | 2 ++
 .../openl2tp/0001-test-pppd_dummy.c-Fix-return-value.patch    | 2 ++
 .../0002-cli-include-fcntl.h-for-O_CREAT-define.patch         | 2 ++
 .../openl2tp/openl2tp/0002-user-ipv6-structures.patch         | 2 ++
 ...0003-cli-Define-_GNU_SOURCE-for-getting-sighandler_t.patch | 2 ++
 .../openl2tp/openl2tp/openl2tpd-enable-tests.patch            | 2 ++
 .../openlldp/files/0001-Fix-musl-libc-build-issue.patch       | 2 ++
 ...01-autotools-Add-include-path-to-generated-version.h.patch | 2 ++
 ...autotools-Add-option-to-disable-installation-of-syst.patch | 2 ++
 .../rp-pppoe/0001-ppoe-Dont-include-linux-if_ether.h.patch    | 2 ++
 .../rp-pppoe/0002-Enable-support-for-the-kernel-module.patch  | 2 ++
 .../recipes-protocols/rp-pppoe/rp-pppoe/configure.patch       | 2 ++
 .../rp-pppoe/rp-pppoe/discard-use-of-dnl-in-Makefile.am.patch | 2 ++
 ...zeroconf-Rename-arp_op-to-avoid-namespace-conflicts-.patch | 2 ++
 .../aoetools/aoetools/reproducible-build.patch                | 2 ++
 ...01-Use-ARPCFLAGS-for-package-specific-compiler-flags.patch | 2 ++
 .../chrony/chrony/0001-Fix-compilation-with-musl.patch        | 2 ++
 meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch     | 2 ++
 .../dovecot/dovecot/0001-not-check-pandoc.patch               | 2 ++
 .../drbd-utils/0001-drbdmon-add-LDFLAGS-when-linking.patch    | 2 ++
 .../esmtp/esmtp/0001-Fix-libESMTP-dependency-check.patch      | 2 ++
 .../recipes-support/ifmetric/ifmetric/ifmetric.8_typo.patch   | 2 ++
 .../ifmetric/ifmetric/ifmetric.c_netlink-invalid-arg.patch    | 2 ++
 .../recipes-support/ifmetric/ifmetric/ifmetric.c_typo.patch   | 2 ++
 .../ifmetric/ifmetric/nlrequest.c_packet-too-small_fix.patch  | 2 ++
 .../libmemcached/files/0001-Fix-comparison-types.patch        | 2 ++
 .../files/0001-configure.ac-Do-not-configure-build-aux.patch  | 2 ++
 ...POSIX_SPAWN_USEVFORK-is-not-linux-specific-but-glibc.patch | 2 ++
 .../recipes-support/libmemcached/files/crosscompile.patch     | 2 ++
 .../libtalloc/libtalloc/avoid-attr-unless-wanted.patch        | 2 ++
 .../libtevent/libtevent/avoid-attr-unless-wanted.patch        | 2 ++
 .../linux-atm/linux-atm/install-from-buildir.patch            | 2 ++
 .../linux-atm/linux-atm/link-with-ldflags.patch               | 2 ++
 .../lowpan-tools/0001-Remove-newline-from-format-line.patch   | 2 ++
 ...addrdb-coord-config-parse.y-add-missing-time.h-inclu.patch | 2 ++
 .../0001-coordinator-Fix-strncpy-range-warning.patch          | 2 ++
 .../0001-src-iz.c-Undef-dprintf-before-redefining.patch       | 2 ++
 .../macchanger/macchanger/0001-Fix-musl-build.patch           | 2 ++
 .../files/0001-Cmds-automatically-create-folder.patch         | 2 ++
 .../recipes-support/ntp/ntp/ntp-4.2.4_p6-nano.patch           | 2 ++
 .../ntp/ntp/reproducibility-fixed-path-to-posix-shell.patch   | 2 ++
 .../ntpsec/ntpsec/0001-wscript-Add-BISONFLAGS-support.patch   | 2 ++
 .../0002-Use-configure-test-for-struct-timespec.patch         | 2 ++
 .../0003-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch     | 2 ++
 ...Use-configure-to-test-for-feature-instead-of-platfor.patch | 2 ++
 .../0005-Use-configure-test-for-sys-stat.h-include.patch      | 2 ++
 .../0006-Fix-subdir-objects-configure-error.patch             | 2 ++
 .../0007-include-poll.h-instead-of-sys-poll.h.patch           | 2 ++
 .../open-vm-tools/0008-Rename-poll.h-to-vm_poll.h.patch       | 2 ++
 .../0009-use-posix-strerror_r-unless-on-gnu-libc-system.patch | 2 ++
 .../0010-Use-uintmax_t-for-handling-rlim_t.patch              | 2 ++
 ...0001-configure-Dont-use-uname-to-determine-target-OS.patch | 2 ++
 .../tinyproxy/tinyproxy/disable-documentation.patch           | 2 ++
 .../0001-contrib-add-yocto-compatible-init-script.patch       | 2 ++
 ...Detect-bool-definition-considering-stdbool.h-being-p.patch | 2 ++
 .../iperf3/iperf3/0002-Remove-pg-from-profile_CFLAGS.patch    | 2 ++
 .../files/0001-include-stddef.h-for-ptrdiff_t.patch           | 2 ++
 .../libhugetlbfs/files/0002-Mark-glibc-specific-code-so.patch | 2 ++
 ...alloc.c-Avoid-sysconf-_SC_LEVEL2_CACHE_LINESIZE-on-l.patch | 2 ++
 .../files/0004-shm.c-Mark-glibc-specific-changes-so.patch     | 2 ++
 .../libhugetlbfs/files/0005-Include-dirent.h-for-ino_t.patch  | 2 ++
 .../files/0006-include-limits.h-for-PATH_MAX.patch            | 2 ++
 .../0001-doc-Fix-typos-in-lat_unix_connect-manual-page.patch  | 2 ++
 .../lmbench/lmbench/0001-doc-Fix-typos-in-manual-pages.patch  | 2 ++
 .../lmbench/lmbench/0001-lat_fifo-Fix-cleanup-sequence.patch  | 2 ++
 .../lmbench/lmbench/0001-lat_http.c-Add-printf-format.patch   | 2 ++
 .../0001-lmbench-Point-webpage-lm-to-target-directory.patch   | 2 ++
 ...build-Adjust-CFLAGS-LDFLAGS-to-append-values-passed-.patch | 2 ++
 meta-oe/recipes-benchmark/memtester/files/Makefile.patch      | 2 ++
 .../0001-asm-Delete-.func-.endfunc-directives.patch           | 2 ++
 .../cpufrequtils/cpufrequtils/0001-dont-unset-cflags.patch    | 2 ++
 meta-oe/recipes-connectivity/ace/files/ace_config.patch       | 2 ++
 .../files/dbus-avoid-strange-chars-from-the-build-dir.patch   | 2 ++
 .../ifplugd/ifplugd/Fix-build-with-musl.patch                 | 2 ++
 ...Use-standard-int64_t-instead-of-__int64_t-for-mingw-.patch | 2 ++
 .../loudmouth-1.4.3/04-use-pkg-config-for-gnutls.patch        | 2 ++
 .../loudmouth/loudmouth-1.4.3/glib-2.32.patch                 | 2 ++
 ...apps-CMakeLists.txt-Explicitly-link-libbfb-and-libmu.patch | 2 ++
 .../obexftp/obexftp/make_fuse_swig_optional.patch             | 2 ++
 ...cmake-Use-CMAKE_INSTALL_LIBDIR-and-CMAKE_INSTALL_BIN.patch | 2 ++
 ...rfkill-makefile-don-t-use-t-the-OE-install-wrapper-d.patch | 2 ++
 .../rfkill/rfkill/dont.call.git.rev-parse.on.parent.dir.patch | 2 ++
 .../smstools3/smstools3/scripts_no_bash.patch                 | 2 ++
 .../smstools3/smstools3/sms_binpath.patch                     | 2 ++
 ...fix-path-to-usr-sbin-for-script-and-make-script-for-.patch | 2 ++
 .../wvdial/wvdial/typo_pon.wvdial.1.patch                     | 2 ++
 .../wvstreams/0001-Check-for-limits.h-during-configure.patch  | 2 ++
 .../wvdial/wvstreams/0001-build-fix-parallel-make.patch       | 2 ++
 .../wvstreams/0002-wvrules.mk-Use-_DEFAULT_SOURCE.patch       | 2 ++
 ...wvtask-Check-for-HAVE_LIBC_STACK_END-only-on-glibc-s.patch | 2 ++
 .../wvstreams/0004-wvcrash-Replace-use-of-basename-API.patch  | 2 ++
 .../0005-check-for-libexecinfo-during-configure.patch         | 2 ++
 .../wvdial/wvstreams/04_signed_request.diff                   | 2 ++
 meta-oe/recipes-connectivity/wvdial/wvstreams/05_gcc.diff     | 2 ++
 meta-oe/recipes-connectivity/wvdial/wvstreams/06_gcc-4.7.diff | 2 ++
 .../recipes-connectivity/wvdial/wvstreams/07_buildflags.diff  | 2 ++
 meta-oe/recipes-connectivity/wvdial/wvstreams/argp.patch      | 2 ++
 meta-oe/recipes-connectivity/wvdial/wvstreams/gcc-6.patch     | 2 ++
 .../wvdial/wvstreams/openssl-buildfix.patch                   | 2 ++
 ...dbus-daemon-proxy-Return-DBUS_HANDLER_RESULT_NOT_YET.patch | 2 ++
 .../0001-pipe.c-Use-a-string-instead-of-char.patch            | 2 ++
 meta-oe/recipes-core/emlog/emlog/Drop-use-of-error-h.patch    | 2 ++
 meta-oe/recipes-core/libxml/libxml++/libxml++_ptest.patch     | 2 ++
 .../sdbus-c++-libsystemd/static-libsystemd-pkgconfig.patch    | 2 ++
 .../files/0001-Makefile-use-libprefix-instead-of-libdir.patch | 2 ++
 .../lmdb/files/0001-make-set-soname-on-liblmdb.patch          | 2 ++
 .../mysql/mariadb/0001-Fix-library-LZ4-lookup.patch           | 2 ++
 ...01-aio_linux-Check-if-syscall-exists-before-using-it.patch | 2 ++
 meta-oe/recipes-dbs/mysql/mariadb/lfs64.patch                 | 2 ++
 meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch             | 2 ++
 meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch  | 2 ++
 .../postgresql/files/0001-Add-support-for-RISC-V.patch        | 2 ++
 ...replace-old-sync-with-new-atomic-builtin-equivalents.patch | 2 ++
 meta-oe/recipes-dbs/rocksdb/files/arm.patch                   | 2 ++
 meta-oe/recipes-dbs/rocksdb/files/mips.patch                  | 2 ++
 meta-oe/recipes-dbs/rocksdb/files/ppc64.patch                 | 2 ++
 .../0002-Remove-maes-option-from-cross-compilation.patch      | 2 ++
 .../0003-Remove-neon-option-from-cross-compilation.patch      | 2 ++
 .../abseil-cpp/abseil-cpp/abseil-ppc-fixes.patch              | 2 ++
 .../build/0001-Riscv-Add-risc-v-Android-config-header.patch   | 2 ++
 .../core/0004-adb-Fix-build-on-big-endian-systems.patch       | 2 ++
 .../core/0005-adb-add-base64-implementation.patch             | 2 ++
 .../android-tools/core/0006-adb-Musl-fixes.patch              | 2 ++
 .../core/0007-adb-usb_linux.c-fix-build-with-glibc-2.28.patch | 2 ++
 .../core/0008-adb-Allow-adbd-to-be-ran-as-root.patch          | 2 ++
 .../android-tools/core/0013-adb-Support-riscv64.patch         | 2 ++
 .../core/0014-add-u3-ss-descriptor-support-for-adb.patch      | 2 ++
 .../android-tools/android-tools/core/adb_libssl_11.diff       | 4 ++++
 ...libselinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch | 2 ++
 .../0001-Do-not-add-stack-pointer-to-clobber-list.patch       | 2 ++
 .../breakpad/0001-Turn-off-sign-compare-for-musl-libc.patch   | 2 ++
 ...001-include-sys-reg.h-to-get-__WORDSIZE-on-musl-libc.patch | 2 ++
 .../breakpad/0001-lss-Match-syscalls-to-match-musl.patch      | 2 ++
 .../breakpad/breakpad/0003-Dont-include-stab.h.patch          | 2 ++
 ...0003-Fix-conflict-between-musl-libc-dirent.h-and-lss.patch | 2 ++
 ...elf_reader.cc-include-sys-reg.h-to-get-__WORDSIZE-on.patch | 2 ++
 .../recipes-devtools/breakpad/breakpad/mips_asm_sgidefs.patch | 2 ++
 .../dmalloc/dmalloc/0001-undefined-strdup-macro.patch         | 2 ++
 meta-oe/recipes-devtools/dmalloc/dmalloc/02-Makefile.in.patch | 2 ++
 meta-oe/recipes-devtools/dmalloc/dmalloc/03-threads.patch     | 2 ++
 meta-oe/recipes-devtools/dmalloc/dmalloc/100-use-xtools.patch | 2 ++
 .../dmalloc/dmalloc/13-fix-ldflags-in-makefile.patch          | 2 ++
 meta-oe/recipes-devtools/dmalloc/dmalloc/130-mips.patch       | 2 ++
 .../recipes-devtools/dmalloc/dmalloc/150-use_DESTDIR.patch    | 2 ++
 .../dmalloc/dmalloc/configure-pagesize-HACK.patch             | 2 ++
 ...Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch | 2 ++
 ...002-builtin-Replace-_BSD_SOURCE-with-_DEFAULT_SOURCE.patch | 2 ++
 .../libubox/libubox/0001-version-libraries.patch              | 2 ++
 ...ARM-code-has-unreachable-code-after-switch-statement.patch | 2 ++
 .../ltrace/ltrace/0001-Use-correct-enum-type.patch            | 2 ++
 .../0001-configure-Recognise-linux-musl-as-a-host-OS.patch    | 2 ++
 .../ltrace/0001-mips-plt.c-Delete-include-error.h.patch       | 2 ++
 .../0001-ppc-Remove-unused-host_powerpc64-function.patch      | 2 ++
 .../ltrace/ltrace/0002-Fix-const-qualifier-error.patch        | 2 ++
 meta-oe/recipes-devtools/ltrace/ltrace/add_ppc64le.patch      | 2 ++
 meta-oe/recipes-devtools/mcpp/files/CVE-2019-14274.patch      | 2 ++
 meta-oe/recipes-devtools/mcpp/files/ice-mcpp.patch            | 2 ++
 .../0001-Include-limits.h-for-PATH_MAX-definition.patch       | 2 ++
 .../0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch       | 2 ++
 .../octave/files/fix-blas-library-integer-size.patch          | 2 ++
 .../files/0001-Remove-check_build_deps-build-steps.patch      | 2 ++
 .../files/0001-meson-add-pc-file-for-lib_perfetto.patch       | 2 ++
 .../php/php/0005-pear-fix-Makefile.frag-for-Yocto.patch       | 2 ++
 .../php/php/0009-php-don-t-use-broken-wrapper-for-mkdir.patch | 2 ++
 ...build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch | 2 ++
 ...jitter-jitter-config.in-avoit-host-poisoning-while-c.patch | 2 ++
 ...configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch | 2 ++
 .../protobuf/0001-Fix-linking-error-with-ld-gold.patch        | 2 ++
 .../0001-Preserve-CXXFLAGS-from-environment-in-Mongoose.patch | 2 ++
 .../0002-Preserve-links-when-installing-libmetis.patch        | 2 ++
 .../0003-Add-version-information-to-libmetis.patch            | 2 ++
 meta-oe/recipes-devtools/tcltk/tk/confsearch.diff             | 2 ++
 meta-oe/recipes-devtools/tcltk/tk/fix-xft.diff                | 2 ++
 meta-oe/recipes-devtools/tcltk/tk/tkprivate.diff              | 2 ++
 meta-oe/recipes-devtools/uw-imap/uw-imap/quote_cctype.patch   | 2 ++
 ...makefile.am-Fix-build-when-build-dir-is-not-same-as-.patch | 2 ++
 .../0001-Fixed-with-libxml2-no-case-in-configure.ac.patch     | 2 ++
 .../cmpi-bindings/cmpi-bindings/0001-Fix-error.patch          | 2 ++
 .../0001-fix-the-build-error-when-python-3.0.patch            | 2 ++
 ...configure-Check-for-Wno-error-format-truncation-comp.patch | 2 ++
 .../collectd/collectd/0005-Disable-new-gcc8-warnings.patch    | 2 ++
 .../collectd/collectd/no-gcrypt-badpath.patch                 | 2 ++
 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/481.patch      | 2 ++
 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/482.patch      | 2 ++
 ...01-test_lib.sh-remove-gobin-requirement-during-build.patch | 2 ++
 .../etcd/etcd/0001-xxhash-bump-to-v2.1.2.patch                | 2 ++
 .../flatpak/flatpak/0001-flatpak-pc-add-pc_sysrootdir.patch   | 2 ++
 .../0002-chunkio-Link-with-fts-library-with-musl.patch        | 2 ++
 ...flb_info.h.in-Do-not-hardcode-compilation-directorie.patch | 2 ++
 .../fluentbit/0002-mbedtls-Remove-unused-variable.patch       | 2 ++
 ...mbedtls-Disable-documentation-warning-as-error-with-.patch | 2 ++
 ...Use-correct-type-to-store-return-from-flb_kv_item_cr.patch | 2 ++
 .../fluentbit/0005-stackdriver-Fix-return-type-mismatch.patch | 2 ++
 .../fluentbit/0006-monkey-Fix-TLS-detection-testcase.patch    | 2 ++
 .../gnuplot/gnuplot/0003-Use-native-tools-to-build-docs.patch | 2 ++
 .../hplip/hplip/0001-Fix-installing-ipp-usb-quirk.patch       | 2 ++
 .../0003-pserror.c-Define-column-to-be-int-explcitly.patch    | 2 ++
 .../hplip/0004-Define-missing-prototype-for-functions.patch   | 2 ++
 .../0005-hp_ipp.c-Add-printf-format-to-snprintf-calls.patch   | 2 ++
 ...Workaround-patch-for-missing-Python3-transition-of-t.patch | 2 ++
 .../hplip/hplip/030-replace_unsafe_memcpy_with_memmove.patch  | 2 ++
 meta-oe/recipes-extended/hplip/hplip/050-fix-glibcisms.patch  | 2 ++
 meta-oe/recipes-extended/hplip/hplip/600-fix.patch            | 2 ++
 meta-oe/recipes-extended/hplip/hplip/configure.patch          | 2 ++
 .../hplip/hplip/hplip-3.19.6-fix-return.patch                 | 2 ++
 ...CMakeLists.txt-fix-lib64-can-not-be-shiped-in-64bit-.patch | 2 ++
 .../konkretcmpi/0001-drop-including-rpath-cmake-module.patch  | 2 ++
 .../0001-Remove-buggy-test-confusing-host-and-target.patch    | 2 ++
 .../libexecinfo/0001-makefile-Fix-build-on-linux.patch        | 2 ++
 ...execinfo-Fix-compiler-errors-found-with-newer-gcc-cl.patch | 2 ++
 .../libgxim/0001-Use-AM_CPPFLAGS-instead-of-INCLUDES.patch    | 2 ++
 .../libgxim/libgxim/0002-Update-autotools-macro.patch         | 2 ++
 ...Add-format-string-qualifier-to-fix-potential-securit.patch | 2 ++
 ...i-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch | 2 ++
 .../libleak/libleak/0001-respect-environment-variables.patch  | 2 ++
 .../recipes-extended/liblockfile/liblockfile/configure.patch  | 2 ++
 .../Fix-float-endianness-issue-on-big-endian-arch.patch       | 2 ++
 .../libwmf/libwmf/libwmf-0.2.8.4-intoverflow.patch            | 2 ++
 .../libwmf/libwmf/libwmf-0.2.8.4-useafterfree.patch           | 2 ++
 .../libx86-1/libx86-1.1/libx86-mmap-offset.patch              | 2 ++
 .../md5deep/files/wrong-variable-expansion.patch              | 2 ++
 .../files/fix-libressl-avoid-BSWAP-assembly-for-ARM-v6.patch  | 2 ++
 .../minifi-cpp/files/fix-libressl-compile.patch               | 2 ++
 .../minifi-cpp/files/fix-minifi-compile.patch                 | 2 ++
 .../minifi-cpp/files/fix-osspuuid-compile.patch               | 2 ++
 .../minifi-cpp/files/fix-osspuuid-cross-compile.patch         | 2 ++
 .../minifi-cpp/files/fix-osspuuid-musl-compile.patch          | 2 ++
 .../minifi-cpp/files/fix-rocksdb-cross-compile.patch          | 2 ++
 .../minifi-cpp/files/remove_const_due_to_std_lock_guard.patch | 2 ++
 meta-oe/recipes-extended/mozjs/mozjs-102/fix-musl-build.patch | 2 ++
 ...cmake-Use-a-regular-expression-to-match-x86-architec.patch | 2 ++
 .../0001-nicstat.c-Do-not-define-uint64_t-and-uint32_t.patch  | 2 ++
 ...lock.c-Define-PTHREAD_MUTEX_RECURSIVE_NP-if-undefine.patch | 2 ++
 .../openwsman/libssl-is-required-if-eventint-supported.patch  | 2 ++
 .../rarpd/rarpd/0001-rarpd.8-add-man-file.patch               | 2 ++
 .../rarpd/rarpd/0002-Makefile-modify-compile-parameters.patch | 2 ++
 .../recipes-extended/rarpd/rarpd/0003-rarpd.c-bug-fix.patch   | 2 ++
 .../rarpd/rarpd/0004-rarpd.init-add-new-init-file.patch       | 2 ++
 .../rarpd/rarpd/0005-ethernet.c-remove-it.patch               | 2 ++
 .../redis-7.0.11/hiredis-use-default-CC-if-it-is-set.patch    | 2 ++
 ...lua-update-Makefile-to-use-environment-build-setting.patch | 2 ++
 .../redis/redis-7.0.11/oe-use-libc-malloc.patch               | 2 ++
 .../redis/redis/hiredis-use-default-CC-if-it-is-set.patch     | 2 ++
 ...lua-update-Makefile-to-use-environment-build-setting.patch | 2 ++
 meta-oe/recipes-extended/redis/redis/oe-use-libc-malloc.patch | 2 ++
 .../0001-include-stdint.h-system-header-for-UINT16_MAX.patch  | 2 ++
 .../sblim-sfcb/sblim-sfcb-1.3.15-fix-provider-debugging.patch | 2 ++
 .../sblim-sfcb/sblim-sfcb/sblim-sfcb-1.3.16-maxMsgLen.patch   | 2 ++
 .../sblim-sfcb/sblim-sfcb-1.3.16-multilib-man-cfg.patch       | 2 ++
 .../sblim-sfcb-1.3.9-sfcbrepos-schema-location.patch          | 2 ++
 .../sblim-sfcb/sblim-sfcb/sblim-sfcb-1.4.5-service.patch      | 2 ++
 .../sblim-sfcb/sblim-sfcb-1.4.8-default-ecdh-curve-name.patch | 2 ++
 .../sblim-sfcb/sblim-sfcb/sblim-sfcb-1.4.9-fix-ftbfs.patch    | 2 ++
 .../recipes-extended/scsirastools/scsirastools/mdadm.patch    | 2 ++
 .../scsirastools/scsirastools/print-format.patch              | 2 ++
 .../files/0001-Fix-build-on-big-endian-architectures.patch    | 2 ++
 .../sgpio/0001-makefile-Add-LDFLAGS-to-linking-rule.patch     | 2 ++
 .../0001-include-sys-select.h-for-FD_-definitions.patch       | 2 ++
 .../0002-replace-non-standard-uint-with-unsigned-int.patch    | 2 ++
 ...include-required-system-header-files-for-fd_set-and-.patch | 2 ++
 .../uml-utilities/uml-utilities-20040406/fix-ldflags.patch    | 2 ++
 .../uml-utilities/uml-utilities-20040406/unstrip.patch        | 2 ++
 ...CMakeLists.txt-Use-SWIG_SUPPORT_FILES-to-find-the-li.patch | 2 ++
 .../recipes-extended/wxwidgets/wxwidgets/musl-locale-l.patch  | 2 ++
 .../0001-configure.ac-Do-not-demand-linker-hash-style.patch   | 2 ++
 ...0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch | 2 ++
 .../dnfdragora/0001-To-fix-error-when-do_package.patch        | 2 ++
 .../dnfdragora/dnfdragora/0001-disable-build-manpages.patch   | 2 ++
 meta-oe/recipes-graphics/fbida/files/fix-preprocessor.patch   | 2 ++
 meta-oe/recipes-graphics/fbida/files/support-jpeg-turbo.patch | 2 ++
 .../glm/glm/0001-Do-not-use-Werror-with-clang.patch           | 2 ++
 .../gphoto2/0001-configure.ac-remove-AM_PO_SUBDIRS.patch      | 2 ++
 .../gtkperf/gtkperf/0001-Include-stdlib.h-for-exit-API.patch  | 2 ++
 .../gtkperf/0002-timing.c-Fix-format-security-errors.patch    | 2 ++
 ...001-libdecor-gtk.c-dont-skip-for-conflicting-symbols.patch | 2 ++
 .../libforms/files/add-absolute-path-for-include-dir.patch    | 2 ++
 .../libforms/files/fix-link-to-xforms-man.patch               | 2 ++
 .../libforms/files/fix-path-fdesign_LDADD.patch               | 2 ++
 .../libsdl/libsdl-1.2.15/CVE-2019-13616.patch                 | 2 ++
 meta-oe/recipes-graphics/libsdl/libsdl-image/configure.patch  | 2 ++
 meta-oe/recipes-graphics/libsdl/libsdl-mixer/configure.patch  | 2 ++
 meta-oe/recipes-graphics/libsdl/libsdl-net/am_foreign.patch   | 2 ++
 meta-oe/recipes-graphics/libsdl/libsdl-net/libtool2.patch     | 2 ++
 .../libsdl/libsdl-ttf/use.pkg-config.for.freetype2.patch      | 2 ++
 .../libsdl/libsdl2-ttf/automake_foreign.patch                 | 2 ++
 .../0003-check-for-libexecinfo-providing-backtrace-APIs.patch | 2 ++
 ...0001-meson.build-WORKAROUND-Remove-vulkan-dependency.patch | 2 ++
 .../surf/surf/0001-config.mk-Fix-compiler-and-linker.patch    | 2 ++
 ...0001-config.ml-make-compatible-with-webkitgtk-2.34.0.patch | 2 ++
 .../vk-gl-cts/files/fix-clang-private-operator.patch          | 2 ++
 meta-oe/recipes-graphics/vk-gl-cts/files/fix-musl.patch       | 2 ++
 .../xorg-lib/liblbxutil-1.1.0/mkg3states-1.1.patch            | 2 ++
 .../0001-COPYING-add-GPLv2-license-file.patch                 | 2 ++
 .../0001-Don-t-install-Xsession-or-Xserver.patch              | 2 ++
 .../xserver-common-1.34/0002-add-setdpi-Xinit.d-script.patch  | 2 ++
 .../0006-add-support-for-etc-X11-xserver-system.patch         | 2 ++
 ...-use-own-functions-file-instead-etc-init.d-functions.patch | 2 ++
 ...xserver-common-add-dpi-and-nocursor-params-for-gta01.patch | 2 ++
 ...xserver-common-add-support-for-n900-alias-nokia_rx-5.patch | 2 ++
 ...xserver-common-add-support-for-nexus-S-alias-herring.patch | 2 ++
 ...xserver-common-add-support-for-nexus-one-alias-mahim.patch | 2 ++
 ...xserver-common-add-support-for-gta04-alias-OpenPhoen.patch | 2 ++
 ...xserver-common-add-support-for-tuna-alias-Galaxy-Nex.patch | 2 ++
 .../crash/crash/0001-cross_add_configure_option.patch         | 2 ++
 .../crash/crash/7001force_define_architecture.patch           | 2 ++
 meta-oe/recipes-kernel/crash/crash/7003cross_ranlib.patch     | 2 ++
 .../kernel-selftest/kernel-selftest/userfaultfd.patch         | 2 ++
 .../audiofile/files/0001-fix-negative-shift-constants.patch   | 2 ++
 .../audiofile/files/0002-fix-build-on-gcc6.patch              | 2 ++
 .../0001-define-__THROW-to-avoid-build-issue-with-musl.patch  | 2 ++
 .../files/0001-genisoimage-Fix-fprintf-format-errors.patch    | 2 ++
 .../files/0002-Do-not-use-rcmd-on-build-with-musl.patch       | 2 ++
 .../libmad/0004-Remove-clang-unsupported-compiler-flags.patch | 2 ++
 ...Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch | 2 ++
 .../v4l-utils/0002-original-patch-mediactl-pkgconfig.patch    | 2 ++
 .../0003-original-patch-export-mediactl-headers.patch         | 2 ++
 .../webm/libvpx/libvpx-configure-support-blank-prefix.patch   | 2 ++
 meta-oe/recipes-multimedia/xpext/xpext/auxdir.patch           | 2 ++
 meta-oe/recipes-multimedia/xsp/xsp/xsp-fix-pc.patch           | 2 ++
 .../libspatialite/libspatialite/libspatialite_geos.patch      | 2 ++
 .../libspatialite/libspatialite/libspatialite_macros.patch    | 2 ++
 .../libspatialite/libspatialite/libspatialite_pkgconfig.patch | 2 ++
 .../orrery/orrery/0001-orrery-Fix-sprintf-format.patch        | 2 ++
 meta-oe/recipes-navigation/orrery/orrery/use.GdkPixbuf.patch  | 2 ++
 .../cyrus-sasl/cyrus-sasl/CVE-2019-19906.patch                | 2 ++
 .../cyrus-sasl/debian_patches_0014_avoid_pic_overwrite.diff   | 2 ++
 ...localize-org.opensuse.CupsPkHelper.Mechanism.service.patch | 2 ++
 ...Replace-__attribute_malloc__-with-__attribute__-__ma.patch | 2 ++
 .../files/0001-Adhere-to-the-SOURCE_DATE_EPOCH-standard.patch | 2 ++
 ...0001-Include-time.h-header-to-pass-clang-compilation.patch | 2 ++
 .../tcsh/tcsh/0001-Enable-system-malloc-on-all-linux.patch    | 2 ++
 .../tcsh/tcsh/0002-Add-debian-csh-scripts.patch               | 2 ++
 meta-oe/recipes-support/anthy/anthy/2ch_t.patch               | 2 ++
 meta-oe/recipes-support/anthy/anthy/native-helpers.patch      | 2 ++
 meta-oe/recipes-support/anthy/anthy/not_build_elc.patch       | 2 ++
 meta-oe/recipes-support/anthy/anthy/target-helpers.patch      | 2 ++
 ...libgeis-Compare-the-first-character-of-string-to-nul.patch | 2 ++
 .../canonical-multitouch/geis/fix-indentation-for-gcc6.patch  | 2 ++
 .../ccid/ccid/0001-Add-build-rule-for-README.patch            | 2 ++
 .../recipes-support/cpprest/cpprest/disable-float-tests.patch | 2 ++
 .../cpprest/cpprest/disable-outside-tests.patch               | 2 ++
 .../daemontools/0001-daemontools-Fix-QA-Issue.patch           | 2 ++
 .../0001-error.h-include-errno.h-instead-of-extern-int.diff   | 2 ++
 ...2-supervise.c-.-supervise-may-be-a-symlink-if-it-s-da.diff | 2 ++
 .../daemontools/daemontools/cross-compile.patch               | 2 ++
 .../recipes-support/daemontools/daemontools/warnings.patch    | 2 ++
 meta-oe/recipes-support/enca/enca/dont-run-tests.patch        | 2 ++
 meta-oe/recipes-support/enca/enca/libenca-003-iconv.patch     | 2 ++
 meta-oe/recipes-support/enca/enca/makefile-remove-tools.patch | 2 ++
 ...Fix-build-of-shared-library-on-architectures-needing.patch | 2 ++
 meta-oe/recipes-support/fbset/fbset-2.1/makefile.patch        | 2 ++
 meta-oe/recipes-support/fftw/fftw/install-bench.patch         | 2 ++
 ...Fl_Preferences.cxx-do-not-use-dlopen-in-case-glibc-s.patch | 2 ++
 meta-oe/recipes-support/fltk/fltk/disable_test.patch          | 2 ++
 .../freerdp/winpr-makecert-Build-with-install-RPATH.patch     | 2 ++
 meta-oe/recipes-support/gperftools/gperftools/ppc-musl.patch  | 2 ++
 .../0001-Makefile-Append-instead-of-overriding-LDFLAGS.patch  | 2 ++
 .../gsoap/gsoap/0001-Simplify-check-for-gethostbyname_r.patch | 2 ++
 .../hddtemp/hddtemp-0.3-beta15-autodetect-717479.patch        | 2 ++
 .../hddtemp/hddtemp/hddtemp-no-nls-support.patch              | 2 ++
 .../iniparser/iniparser/Add-CMake-support.patch               | 2 ++
 ...001-build-gtk-and-gtk3-version-for-canberra_gtk_play.patch | 2 ++
 ...gtk-Don-t-assume-all-GdkDisplays-are-GdkX11Displays-.patch | 2 ++
 ...libmimetic-Removing-test-directory-from-the-Makefile.patch | 2 ++
 meta-oe/recipes-support/liboop/liboop/tcl_dev.patch           | 2 ++
 .../libtar/files/0002-Do-not-strip-libtar.patch               | 2 ++
 .../recipes-support/libtar/files/fix_libtool_sysroot.patch    | 2 ++
 .../0001-include-sys-select.h-for-fd_set-definition.patch     | 2 ++
 .../libteam/0002-teamd-Re-adjust-include-header-order.patch   | 2 ++
 .../libutempter/0002-Proper-macro-path-generation.patch       | 2 ++
 meta-oe/recipes-support/links/files/ac-prog-cxx.patch         | 2 ++
 ...Makefiles-Respect-environment-variables-and-add-LDFL.patch | 2 ++
 meta-oe/recipes-support/lockdev/lockdev/build.patch           | 2 ++
 meta-oe/recipes-support/lockdev/lockdev/cross_compile.patch   | 2 ++
 ...Use-the-API-properly-in-the-example-format-security-.patch | 2 ++
 meta-oe/recipes-support/log4cpp/files/fix-pc.patch            | 2 ++
 .../files/0001-implement-libc-specific-reopen_stream.patch    | 2 ++
 .../files/0002-Guard-use-of-mallinfo-with-__GLIBC__.patch     | 2 ++
 .../mg/mg/0001-Undefine-REGEX-for-musl-based-systems.patch    | 2 ++
 .../mg/mg/0001-fileio-Include-sys-param.h-for-MAXNAMLEN.patch | 2 ++
 ...002-fileio-Define-DEFFILEMODE-if-platform-is-missing.patch | 2 ++
 .../files/0001-fix-bug-of-do_compile-and-do_install.patch     | 2 ++
 .../files/0021-RH-fixup-udev-rules-for-redhat.patch           | 2 ++
 ...2-RH-Remove-the-property-blacklist-exception-builtin.patch | 2 ++
 ...libdmmp-Makefile-replace-perl-with-sed-in-install-ta.patch | 2 ++
 .../ne10/0001-CMakeLists.txt-Remove-mthumb-interwork.patch    | 2 ++
 .../ne10/ne10/0001-Dont-specify-march-explicitly.patch        | 2 ++
 .../neon/neon/0001-Disable-installing-documentation.patch     | 2 ++
 .../nmon/nmon/0001-lmon16g.c-Adjust-system-headers.patch      | 2 ++
 ...-build-enable-serial-tests-automake-option-for-ptest.patch | 2 ++
 ...Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch | 2 ++
 .../opencv/opencv/0003-To-fix-errors-as-following.patch       | 2 ++
 meta-oe/recipes-support/pcp/pcp/fix_parallel_make.patch       | 2 ++
 .../recipes-support/pidgin/pidgin/purple-OE-branding-25.patch | 2 ++
 .../recipes-support/pidgin/pidgin/sanitize-configure.ac.patch | 2 ++
 .../0001-make-Respect-variables-from-environement.patch       | 2 ++
 ...png-fix-IDAT-windowsize-Fix-format-string-errors-in-.patch | 2 ++
 .../pngcheck/pngcheck/10-pngsplit-format-strings.patch        | 2 ++
 .../poppler/poppler/0001-cmake-Do-not-use-isystem.patch       | 2 ++
 .../procmail/procmail/from-debian-to-fix-compile-errors.patch | 2 ++
 .../procmail/procmail/from-debian-to-fix-man-file.patch       | 2 ++
 .../procmail/procmail/from-debian-to-modify-parameters.patch  | 2 ++
 .../procmail/procmail/man-file-mailstat.1-from-debian.patch   | 2 ++
 meta-oe/recipes-support/pxaregs/pxaregs-1.14/i2c.patch        | 2 ++
 meta-oe/recipes-support/pxaregs/pxaregs-1.14/munmap.patch     | 2 ++
 meta-oe/recipes-support/pxaregs/pxaregs-1.14/serial.patch     | 2 ++
 meta-oe/recipes-support/pxaregs/pxaregs-1.14/usb.patch        | 2 ++
 .../0001-serial_forward-Disable-default-static-linking.patch  | 2 ++
 .../sharutils/sharutils/0001-Fix-build-with-clang.patch       | 2 ++
 .../sharutils/sharutils/0001-Fix-building-with-GCC-10.patch   | 2 ++
 .../0002-Do-not-include-lib-md5.c-into-src-shar.c.patch       | 2 ++
 .../ssiapi/ssiapi/0001-Don-t-use-__GNUC_PREREQ.patch          | 2 ++
 .../recipes-support/ssiapi/ssiapi/0001-Include-libgen.h.patch | 2 ++
 .../0001-log-Avoid-shadowing-functions-from-std-lib.patch     | 2 ++
 .../ssiapi/ssiapi/0002-Use-stangard-int-types.patch           | 2 ++
 .../ssiapi/ssiapi/0002-boost-Backport-clang-support.patch     | 2 ++
 ...engine-Define-discover-const-String-path-in-base-cla.patch | 2 ++
 .../0003-replace-canonicalize_file_name-with-realpath.patch   | 2 ++
 ...-Do-not-override-flags-coming-from-build-environment.patch | 2 ++
 .../recipes-support/ssiapi/ssiapi/0004-include-limits.h.patch | 2 ++
 .../ssiapi/ssiapi/0005-enable-out-of-source-tree-builds.patch | 2 ++
 meta-oe/recipes-support/uim/uim/uim-module-manager.patch      | 2 ++
 ...01-include-sys-stat.h-for-fixing-build-issue-on-musl.patch | 2 ++
 .../recipes-support/websocketpp/websocketpp-0.8.2/1024.patch  | 2 ++
 .../recipes-support/websocketpp/websocketpp-0.8.2/855.patch   | 2 ++
 .../recipes-support/websocketpp/websocketpp-0.8.2/857.patch   | 2 ++
 .../0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch | 2 ++
 meta-oe/recipes-support/xmlstarlet/files/configure.ac.patch   | 2 ++
 ...Added-req_distinguished_name-in-etc-xrdp-openssl.con.patch | 2 ++
 .../xrdp/xrdp/0001-Fix-the-compile-error.patch                | 2 ++
 .../zbar/zbar/0001-qt-Create-subdir-in-Makefile.patch         | 2 ++
 .../zbar/zbar/0002-zbarcam-Create-subdir-in-Makefile.patch    | 2 ++
 .../fwts/0001-Add-correct-printf-qualifier-for-off_t.patch    | 2 ++
 .../0006-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch | 2 ++
 .../files/0001-Makefile-for-cross-compile-SoftFloat.patch     | 2 ++
 .../files/0002-Makefile-for-cross-compile-TestFloat.patch     | 2 ++
 .../gyp/gyp/0001-Fix-for-Python-3.10-compatibility.patch      | 2 ++
 .../python/python-flask-xstatic/remove-pip-requires.patch     | 2 ++
 .../python3-bleak/0001-fix-poetry-version-compatibility.patch | 2 ++
 .../python/python3-cmake/run-cmake-from-path.patch            | 2 ++
 .../0001-setup-don-t-use-setuptools-markdown.patch            | 2 ++
 .../python/python3-grpcio/abseil-ppc-fixes.patch              | 2 ++
 .../python/python3-grpcio/mips_bigendian.patch                | 2 ++
 .../python/python3-kivy/0001-add-support-for-glesv2.patch     | 2 ++
 .../0001-pyproject.toml-Remove-hard-coded-dependencies.patch  | 2 ++
 .../0001-setup-don-t-use-setuptools-markdown.patch            | 2 ++
 .../9b939c0b534c1b7958fa0a3c7aedf30bca910431.patch            | 2 ++
 .../0001-setup-use-setuptools-instead-of-distutils.patch      | 2 ++
 .../0001-setup.py-Do-not-strip-debugging-symbols.patch        | 2 ++
 .../python/python3-yappi/0001-Fix-imports-for-ptests.patch    | 2 ++
 .../python/python3-yappi/0002-add-3.11-to-the-setup.patch     | 2 ++
 ...pykickstart-parser.py-add-lock-for-readKickstart-and.patch | 2 ++
 551 files changed, 1104 insertions(+)

diff --git a/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs/0001-Add-LDFLAGS-to-linker-cmdline.patch b/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs/0001-Add-LDFLAGS-to-linker-cmdline.patch
index 30ad1b8ad6..8d790125e3 100644
--- a/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs/0001-Add-LDFLAGS-to-linker-cmdline.patch
+++ b/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs/0001-Add-LDFLAGS-to-linker-cmdline.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] Add $(LDFLAGS) to linker cmdline
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  Makefile | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
diff --git a/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs/0001-btree-Avoid-conflicts-with-libc-namespace-about-setk.patch b/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs/0001-btree-Avoid-conflicts-with-libc-namespace-about-setk.patch
index dbf7ae0163..73e42df7e4 100644
--- a/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs/0001-btree-Avoid-conflicts-with-libc-namespace-about-setk.patch
+++ b/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs/0001-btree-Avoid-conflicts-with-libc-namespace-about-setk.patch
@@ -9,6 +9,8 @@ static function
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  btree.c | 32 ++++++++++++++++----------------
  1 file changed, 16 insertions(+), 16 deletions(-)
 
diff --git a/meta-filesystems/recipes-filesystems/owfs/owfs/0001-Add-build-rule-for-README.patch b/meta-filesystems/recipes-filesystems/owfs/owfs/0001-Add-build-rule-for-README.patch
index e4d52a802b..870d0ef056 100644
--- a/meta-filesystems/recipes-filesystems/owfs/owfs/0001-Add-build-rule-for-README.patch
+++ b/meta-filesystems/recipes-filesystems/owfs/owfs/0001-Add-build-rule-for-README.patch
@@ -8,6 +8,8 @@ Makefile.am: required file `./README' not found
 
 Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
 ---
+Upstream-Status: Pending
+
  Makefile.am | 1 +
  1 file changed, 1 insertion(+)
 
diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/Using-PKG_CHECK_MODULES-to-found-headers-and-libraries.patch b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/Using-PKG_CHECK_MODULES-to-found-headers-and-libraries.patch
index 6d60c9d229..fbdb6cbcd7 100644
--- a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/Using-PKG_CHECK_MODULES-to-found-headers-and-libraries.patch
+++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/Using-PKG_CHECK_MODULES-to-found-headers-and-libraries.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] Using PKG_CHECK_MODULES to found headers and libraries of
 
 Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
 ---
+Upstream-Status: Pending
+
  configure.in    | 5 +++++
  src/Makefile.am | 3 +++
  2 files changed, 8 insertions(+)
diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/configure.patch b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/configure.patch
index 31892d230d..d5e9040b9a 100644
--- a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/configure.patch
+++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs/configure.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- a/configure.ac
 +++ b/configure.ac
 @@ -1,5 +1,5 @@
diff --git a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/0001-define-loff_t-if-not-already-defined.patch b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/0001-define-loff_t-if-not-already-defined.patch
index df202c8555..6cedc3cb4e 100644
--- a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/0001-define-loff_t-if-not-already-defined.patch
+++ b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/0001-define-loff_t-if-not-already-defined.patch
@@ -7,6 +7,8 @@ Helps to build with musl
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  yaffs_guts.h | 4 ++++
  1 file changed, 4 insertions(+)
 
diff --git a/meta-filesystems/recipes-support/fuse/files/fuse2-0007-util-ulockmgr_server.c-conditionally-define-closefro.patch b/meta-filesystems/recipes-support/fuse/files/fuse2-0007-util-ulockmgr_server.c-conditionally-define-closefro.patch
index 3607304e05..7b548b4cde 100644
--- a/meta-filesystems/recipes-support/fuse/files/fuse2-0007-util-ulockmgr_server.c-conditionally-define-closefro.patch
+++ b/meta-filesystems/recipes-support/fuse/files/fuse2-0007-util-ulockmgr_server.c-conditionally-define-closefro.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 From: Sam James <sam@gentoo.org>
 Date: Sat, 24 Jul 2021 22:02:45 +0100
 Subject: [PATCH] util/ulockmgr_server.c: conditionally define closefrom (fix
diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-progs/0001-Makefile-proper-location-of-LDFLAGS.patch b/meta-filesystems/recipes-utils/overlayfs/overlayfs-progs/0001-Makefile-proper-location-of-LDFLAGS.patch
index d9f285d947..2c001834b6 100644
--- a/meta-filesystems/recipes-utils/overlayfs/overlayfs-progs/0001-Makefile-proper-location-of-LDFLAGS.patch
+++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-progs/0001-Makefile-proper-location-of-LDFLAGS.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] Makefile: proper location of LDFLAGS
 
 Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
 ---
+Upstream-Status: Pending
+
  Makefile | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0001-Fixed-includes-so-that-it-compiles-on-Ubuntu-20.04.patch b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0001-Fixed-includes-so-that-it-compiles-on-Ubuntu-20.04.patch
index f7490ebcec..ed84d92c7c 100644
--- a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0001-Fixed-includes-so-that-it-compiles-on-Ubuntu-20.04.patch
+++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0001-Fixed-includes-so-that-it-compiles-on-Ubuntu-20.04.patch
@@ -4,6 +4,8 @@ Date: Fri, 19 Mar 2021 08:18:58 +0100
 Subject: [PATCH] Fixed includes so that it compiles on Ubuntu 20.04
 
 ---
+Upstream-Status: Pending
+
  logic.c | 3 +--
  main.c  | 3 ++-
  2 files changed, 3 insertions(+), 3 deletions(-)
diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0002-makefile-fix-linking-flags.patch b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0002-makefile-fix-linking-flags.patch
index cf4de18a79..8fbb250f04 100644
--- a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0002-makefile-fix-linking-flags.patch
+++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0002-makefile-fix-linking-flags.patch
@@ -8,6 +8,8 @@ https://www.gnu.org/software/make/manual/html_node/Catalogue-of-Rules.html
 
 Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
 ---
+Upstream-Status: Pending
+
  makefile | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
diff --git a/meta-filesystems/recipes-utils/udevil/files/0001-udevil-0.4.3-fix-compile-with-gcc6.patch b/meta-filesystems/recipes-utils/udevil/files/0001-udevil-0.4.3-fix-compile-with-gcc6.patch
index 355e93a37b..6e3a6ecb1f 100644
--- a/meta-filesystems/recipes-utils/udevil/files/0001-udevil-0.4.3-fix-compile-with-gcc6.patch
+++ b/meta-filesystems/recipes-utils/udevil/files/0001-udevil-0.4.3-fix-compile-with-gcc6.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Fix compilation with GCC6
 
 --- a/src/device-info.c	2013-12-09 14:59:27.000000000 +0100
diff --git a/meta-filesystems/recipes-utils/udevil/files/0002-etc-Makefile.am-Use-systemd_unitdir-instead-of-libdi.patch b/meta-filesystems/recipes-utils/udevil/files/0002-etc-Makefile.am-Use-systemd_unitdir-instead-of-libdi.patch
index f014a0f537..a65c0218ce 100644
--- a/meta-filesystems/recipes-utils/udevil/files/0002-etc-Makefile.am-Use-systemd_unitdir-instead-of-libdi.patch
+++ b/meta-filesystems/recipes-utils/udevil/files/0002-etc-Makefile.am-Use-systemd_unitdir-instead-of-libdi.patch
@@ -8,6 +8,8 @@ libdir.
 
 Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
 ---
+Upstream-Status: Pending
+
  etc/Makefile.am | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/remove_flags_from_build_flags.patch b/meta-filesystems/recipes-utils/xfsprogs/files/remove_flags_from_build_flags.patch
index bd2d025635..5bab162c85 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/files/remove_flags_from_build_flags.patch
+++ b/meta-filesystems/recipes-utils/xfsprogs/files/remove_flags_from_build_flags.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: xfsprogs-4.14.0/include/builddefs.in
 ===================================================================
 --- xfsprogs-4.14.0.orig/include/builddefs.in
diff --git a/meta-initramfs/recipes-bsp/kexecboot/files/0001-make-Add-compiler-includes-in-cflags.patch b/meta-initramfs/recipes-bsp/kexecboot/files/0001-make-Add-compiler-includes-in-cflags.patch
index 931d0fa584..abfd8b77ee 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/files/0001-make-Add-compiler-includes-in-cflags.patch
+++ b/meta-initramfs/recipes-bsp/kexecboot/files/0001-make-Add-compiler-includes-in-cflags.patch
@@ -11,6 +11,8 @@ Fixes
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  src/Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-initramfs/recipes-devtools/dracut/dracut/0001-util.h-include-sys-reg.h-when-libc-glibc.patch b/meta-initramfs/recipes-devtools/dracut/dracut/0001-util.h-include-sys-reg.h-when-libc-glibc.patch
index aa2ea723b5..68ec2b8fdb 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut/0001-util.h-include-sys-reg.h-when-libc-glibc.patch
+++ b/meta-initramfs/recipes-devtools/dracut/dracut/0001-util.h-include-sys-reg.h-when-libc-glibc.patch
@@ -11,6 +11,8 @@ https://github.com/voidlinux/void-packages/blob/master/srcpkgs/dracut/patches/mu
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  src/install/util.h | 3 +++
  1 file changed, 3 insertions(+)
 
diff --git a/meta-initramfs/recipes-devtools/klibc/files/0001-Define-in_-structs-for-non-glibc-system-libs.patch b/meta-initramfs/recipes-devtools/klibc/files/0001-Define-in_-structs-for-non-glibc-system-libs.patch
index 29873cf7b5..c782cf03c8 100644
--- a/meta-initramfs/recipes-devtools/klibc/files/0001-Define-in_-structs-for-non-glibc-system-libs.patch
+++ b/meta-initramfs/recipes-devtools/klibc/files/0001-Define-in_-structs-for-non-glibc-system-libs.patch
@@ -12,6 +12,8 @@ to infer that these structs should be defined in linux/in.h
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  usr/include/net/if.h     | 11 +++++++++++
  usr/include/netinet/in.h | 36 ++++++++++++++++++++++++++++++++++++
  2 files changed, 47 insertions(+)
diff --git a/meta-initramfs/recipes-devtools/klibc/files/0001-always-use-bfd-linker.patch b/meta-initramfs/recipes-devtools/klibc/files/0001-always-use-bfd-linker.patch
index de04d691fe..895254889c 100644
--- a/meta-initramfs/recipes-devtools/klibc/files/0001-always-use-bfd-linker.patch
+++ b/meta-initramfs/recipes-devtools/klibc/files/0001-always-use-bfd-linker.patch
@@ -10,6 +10,8 @@ linking issues on such distros
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-initramfs/recipes-devtools/klibc/files/0001-arm-Do-not-set-a-fallback-march-and-mtune.patch b/meta-initramfs/recipes-devtools/klibc/files/0001-arm-Do-not-set-a-fallback-march-and-mtune.patch
index ea14c49f0d..5ac0d4596a 100644
--- a/meta-initramfs/recipes-devtools/klibc/files/0001-arm-Do-not-set-a-fallback-march-and-mtune.patch
+++ b/meta-initramfs/recipes-devtools/klibc/files/0001-arm-Do-not-set-a-fallback-march-and-mtune.patch
@@ -11,6 +11,8 @@ which is a bit harder in OE
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  usr/klibc/arch/arm/MCONFIG | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-initramfs/recipes-devtools/klibc/files/0001-include-linux-sysinfo.h-directly.patch b/meta-initramfs/recipes-devtools/klibc/files/0001-include-linux-sysinfo.h-directly.patch
index d58229681d..d49dfc1924 100644
--- a/meta-initramfs/recipes-devtools/klibc/files/0001-include-linux-sysinfo.h-directly.patch
+++ b/meta-initramfs/recipes-devtools/klibc/files/0001-include-linux-sysinfo.h-directly.patch
@@ -12,6 +12,8 @@ override to avoid this assumption
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  usr/include/sys/sysinfo.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-initramfs/recipes-devtools/klibc/files/0001-klibc-add-getrandom-syscall.patch b/meta-initramfs/recipes-devtools/klibc/files/0001-klibc-add-getrandom-syscall.patch
index f096486d0b..80e6c6b11c 100644
--- a/meta-initramfs/recipes-devtools/klibc/files/0001-klibc-add-getrandom-syscall.patch
+++ b/meta-initramfs/recipes-devtools/klibc/files/0001-klibc-add-getrandom-syscall.patch
@@ -7,6 +7,8 @@ needed by latest kexec-tools for qemuarm64 (kashan)
 
 Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
 ---
+Upstream-Status: Pending
+
  usr/klibc/SYSCALLS.def | 1 +
  1 file changed, 1 insertion(+)
 
diff --git a/meta-initramfs/recipes-devtools/klibc/files/0001-klibc_2.0.4-add-kexec_file_load-syscall.patch b/meta-initramfs/recipes-devtools/klibc/files/0001-klibc_2.0.4-add-kexec_file_load-syscall.patch
index b03fb91265..16885488e4 100644
--- a/meta-initramfs/recipes-devtools/klibc/files/0001-klibc_2.0.4-add-kexec_file_load-syscall.patch
+++ b/meta-initramfs/recipes-devtools/klibc/files/0001-klibc_2.0.4-add-kexec_file_load-syscall.patch
@@ -7,6 +7,8 @@ for supported archs only (matched in kexec-tools)
 
 Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
 ---
+Upstream-Status: Pending
+
  usr/klibc/SYSCALLS.def | 1 +
  1 file changed, 1 insertion(+)
 
diff --git a/meta-initramfs/recipes-devtools/klibc/files/0001-mkfifo-Implement-mkfifo.patch b/meta-initramfs/recipes-devtools/klibc/files/0001-mkfifo-Implement-mkfifo.patch
index 3bc081d4e9..4378ca5610 100644
--- a/meta-initramfs/recipes-devtools/klibc/files/0001-mkfifo-Implement-mkfifo.patch
+++ b/meta-initramfs/recipes-devtools/klibc/files/0001-mkfifo-Implement-mkfifo.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] mkfifo: Implement mkfifo
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  usr/utils/mkfifo.c | 5 +++++
  1 file changed, 5 insertions(+)
 
diff --git a/meta-initramfs/recipes-devtools/klibc/files/armv4-fix-v4bx.patch b/meta-initramfs/recipes-devtools/klibc/files/armv4-fix-v4bx.patch
index 6c734dfd6e..585fb2d439 100644
--- a/meta-initramfs/recipes-devtools/klibc/files/armv4-fix-v4bx.patch
+++ b/meta-initramfs/recipes-devtools/klibc/files/armv4-fix-v4bx.patch
@@ -9,6 +9,8 @@ which is "" in case of armv5 or thumbs.
 Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  usr/klibc/arch/arm/MCONFIG | 1 +
  1 file changed, 1 insertion(+)
 
diff --git a/meta-initramfs/recipes-devtools/klibc/files/cross-clang.patch b/meta-initramfs/recipes-devtools/klibc/files/cross-clang.patch
index 41936c9fe3..f39701a65e 100644
--- a/meta-initramfs/recipes-devtools/klibc/files/cross-clang.patch
+++ b/meta-initramfs/recipes-devtools/klibc/files/cross-clang.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- a/scripts/Kbuild.klibc
 +++ b/scripts/Kbuild.klibc
 @@ -113,10 +113,8 @@ KLIBCCPPFLAGS    := -nostdinc -iwithpref
diff --git a/meta-initramfs/recipes-devtools/klibc/files/klcc-consider-sysroot.patch b/meta-initramfs/recipes-devtools/klibc/files/klcc-consider-sysroot.patch
index 5f47d3f20a..af76564901 100644
--- a/meta-initramfs/recipes-devtools/klibc/files/klcc-consider-sysroot.patch
+++ b/meta-initramfs/recipes-devtools/klibc/files/klcc-consider-sysroot.patch
@@ -3,6 +3,8 @@ From: Andrea Adami <andrea.adami@gmail.com>
 Date: Fri, 19 Sep 2014 23:09:29 +0200
 
 ---
+Upstream-Status: Pending
+
  klcc/klcc.in | 3 +++
  1 file changed, 3 insertions(+)
 
diff --git a/meta-initramfs/recipes-devtools/klibc/files/use-env-for-perl.patch b/meta-initramfs/recipes-devtools/klibc/files/use-env-for-perl.patch
index 5973824885..d2a19909f0 100644
--- a/meta-initramfs/recipes-devtools/klibc/files/use-env-for-perl.patch
+++ b/meta-initramfs/recipes-devtools/klibc/files/use-env-for-perl.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Patch was imported from the OpenEmbedded git server
 (git://git.openembedded.org/openembedded)
 as of commit id 676cbb54d42c89a4832871064cfcb7ee2ad372ee
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0014-add-if_nameindex-from-musl.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0014-add-if_nameindex-from-musl.patch
index f4d0d5d942..eca01b956c 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0014-add-if_nameindex-from-musl.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0014-add-if_nameindex-from-musl.patch
@@ -22,6 +22,8 @@ to fix :
 Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  kexec/Makefile       |  2 +-
  kexec/if_nameindex.c | 64 ++++++++++++++++++++++++++++++++++++++++++++
  kexec/if_nameindex.h | 15 +++++++++++
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0015-vmcore-dmesg-fix-warning.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0015-vmcore-dmesg-fix-warning.patch
index 9b8107aedc..044a70d93b 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0015-vmcore-dmesg-fix-warning.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0015-vmcore-dmesg-fix-warning.patch
@@ -8,6 +8,8 @@ Subject: [PATCH] vmcore-dmesg: fix warning
 Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  vmcore-dmesg/vmcore-dmesg.c | 3 +++
  1 file changed, 3 insertions(+)
 
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/140-mips_disable_devicetree_support.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/140-mips_disable_devicetree_support.patch
index 6e347c048e..031efb6275 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/140-mips_disable_devicetree_support.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/140-mips_disable_devicetree_support.patch
@@ -16,6 +16,8 @@ Signed-off-by: Konstantin Kuzov <master.nosferatu@gmail.com>
 Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  kexec/arch/mips/include/arch/options.h |  4 +-
  kexec/arch/mips/kexec-elf-mips.c       | 58 ++++++++++++++------------
  kexec/arch/mips/kexec-mips.c           |  4 ++
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm64-crashdump-arm64.c-fix-warning.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm64-crashdump-arm64.c-fix-warning.patch
index c2418d8fa0..a3b7789eba 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm64-crashdump-arm64.c-fix-warning.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm64-crashdump-arm64.c-fix-warning.patch
@@ -13,6 +13,8 @@ ng: "__bitwise" redefined
 Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  kexec/arch/arm64/crashdump-arm64.c | 3 +++
  1 file changed, 3 insertions(+)
 
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm_crashdump-fix-buffer-align.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm_crashdump-fix-buffer-align.patch
index 5323a81e6b..89a5d34c83 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm_crashdump-fix-buffer-align.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm_crashdump-fix-buffer-align.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] arm- backport from oe-core
 Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  kexec/arch/arm/crashdump-arm.c | 5 ++++-
  1 file changed, 4 insertions(+), 1 deletion(-)
 
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/include_next.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/include_next.patch
index d4fbd1436f..29ea1d9f18 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/include_next.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/include_next.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- a/kexec/Makefile
 +++ b/kexec/Makefile
 @@ -110,7 +110,7 @@ $(KEXEC): $(KEXEC_OBJS) $(UTIL_LIB)
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/klibc-reboot.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/klibc-reboot.patch
index 6497fb4160..1c58e92b35 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/klibc-reboot.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/klibc-reboot.patch
@@ -3,6 +3,8 @@ From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 15 Mar 2019 00:22:40 -0700
 
 ---
+Upstream-Status: Pending
+
  kexec/kexec.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-networking/recipes-connectivity/bearssl/bearssl/0002-test-test_x509.c-fix-potential-overflow-issue.patch b/meta-networking/recipes-connectivity/bearssl/bearssl/0002-test-test_x509.c-fix-potential-overflow-issue.patch
index 94abd27faf..e0e5c13588 100644
--- a/meta-networking/recipes-connectivity/bearssl/bearssl/0002-test-test_x509.c-fix-potential-overflow-issue.patch
+++ b/meta-networking/recipes-connectivity/bearssl/bearssl/0002-test-test_x509.c-fix-potential-overflow-issue.patch
@@ -19,6 +19,8 @@ Fixes:
 
 Signed-off-by: Jens Rehsack <sno@netbsd.org>
 ---
+Upstream-Status: Pending
+
  test/test_x509.c | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
 
diff --git a/meta-networking/recipes-connectivity/daq/files/0001-correct-the-location-of-unistd.h.patch b/meta-networking/recipes-connectivity/daq/files/0001-correct-the-location-of-unistd.h.patch
index 4798a77f55..38dae2099a 100644
--- a/meta-networking/recipes-connectivity/daq/files/0001-correct-the-location-of-unistd.h.patch
+++ b/meta-networking/recipes-connectivity/daq/files/0001-correct-the-location-of-unistd.h.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] correct the location of unistd.h
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  os-daq-modules/daq_ipfw.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-networking/recipes-connectivity/dibbler/dibbler/dibbler_fix_getSize_crash.patch b/meta-networking/recipes-connectivity/dibbler/dibbler/dibbler_fix_getSize_crash.patch
index 42d2627a1a..439ef1177d 100644
--- a/meta-networking/recipes-connectivity/dibbler/dibbler/dibbler_fix_getSize_crash.patch
+++ b/meta-networking/recipes-connectivity/dibbler/dibbler/dibbler_fix_getSize_crash.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: git/ClntMessages/ClntMsgRequest.cpp
 ===================================================================
 --- git.orig/ClntMessages/ClntMsgRequest.cpp
diff --git a/meta-networking/recipes-connectivity/ez-ipupdate/files/Makefile.am.patch b/meta-networking/recipes-connectivity/ez-ipupdate/files/Makefile.am.patch
index d80ed3e29d..dde233121a 100644
--- a/meta-networking/recipes-connectivity/ez-ipupdate/files/Makefile.am.patch
+++ b/meta-networking/recipes-connectivity/ez-ipupdate/files/Makefile.am.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Remove EXTRASRC and EXTRAOBJ from obj list
 
 --- ez-ipupdate-3.0.11b7/Makefile.am.orig	2014-07-02 13:47:50.758034983 -0600
diff --git a/meta-networking/recipes-connectivity/ez-ipupdate/files/cache_file.c.patch b/meta-networking/recipes-connectivity/ez-ipupdate/files/cache_file.c.patch
index de5eb3a6d1..0199cb1278 100644
--- a/meta-networking/recipes-connectivity/ez-ipupdate/files/cache_file.c.patch
+++ b/meta-networking/recipes-connectivity/ez-ipupdate/files/cache_file.c.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Dont assume errno type
 
 --- ez-ipupdate-3.0.11b7/cache_file.c.orig	2014-07-02 14:01:07.126029412 -0600
diff --git a/meta-networking/recipes-connectivity/ez-ipupdate/files/conf_file.c.patch b/meta-networking/recipes-connectivity/ez-ipupdate/files/conf_file.c.patch
index 02218a39ea..6325c1873f 100644
--- a/meta-networking/recipes-connectivity/ez-ipupdate/files/conf_file.c.patch
+++ b/meta-networking/recipes-connectivity/ez-ipupdate/files/conf_file.c.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Dont assume errno type
 
 --- ez-ipupdate-3.0.11b7/conf_file.c.orig	2014-07-02 14:01:19.174029328 -0600
diff --git a/meta-networking/recipes-connectivity/ez-ipupdate/files/wformat.patch b/meta-networking/recipes-connectivity/ez-ipupdate/files/wformat.patch
index 1de267f083..3b791559d5 100644
--- a/meta-networking/recipes-connectivity/ez-ipupdate/files/wformat.patch
+++ b/meta-networking/recipes-connectivity/ez-ipupdate/files/wformat.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: ez-ipupdate-3.0.11b7/ez-ipupdate.c
 ===================================================================
 --- ez-ipupdate-3.0.11b7.orig/ez-ipupdate.c
diff --git a/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch b/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch
index 2168a0713c..3f0490cb80 100644
--- a/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch
+++ b/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch
@@ -8,6 +8,8 @@ https://stackoverflow.com/questions/1242904/finding-python-site-packages-directo
 
 Signed-off-by: Romain Naour <romain.naour@smile.fr>
 ---
+Upstream-Status: Pending
+
  pyiec61850/CMakeLists.txt | 11 ++---------
  1 file changed, 2 insertions(+), 9 deletions(-)
 
diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix/unused_var.patch b/meta-networking/recipes-connectivity/openthread/ot-br-posix/unused_var.patch
index 9727cbafd8..f10cec2d6c 100644
--- a/meta-networking/recipes-connectivity/openthread/ot-br-posix/unused_var.patch
+++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix/unused_var.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- a/third_party/openthread/repo/src/cli/cli.cpp
 +++ b/third_party/openthread/repo/src/cli/cli.cpp
 @@ -1785,6 +1785,7 @@ template <> otError Interpreter::Process
diff --git a/meta-networking/recipes-connectivity/rdate/rdate/0001-rdate-define-logwtmp-on-libc-glibc.patch b/meta-networking/recipes-connectivity/rdate/rdate/0001-rdate-define-logwtmp-on-libc-glibc.patch
index 08ba2c31e9..5fc21808f9 100644
--- a/meta-networking/recipes-connectivity/rdate/rdate/0001-rdate-define-logwtmp-on-libc-glibc.patch
+++ b/meta-networking/recipes-connectivity/rdate/rdate/0001-rdate-define-logwtmp-on-libc-glibc.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] rdate: define logwtmp on libc != glibc
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  src/rdate.c | 15 +++++++++++++++
  1 file changed, 15 insertions(+)
 
diff --git a/meta-networking/recipes-connectivity/samba/samba/0002-do-not-import-target-module-while-cross-compile.patch b/meta-networking/recipes-connectivity/samba/samba/0002-do-not-import-target-module-while-cross-compile.patch
index 186ee553a2..3b02690926 100644
--- a/meta-networking/recipes-connectivity/samba/samba/0002-do-not-import-target-module-while-cross-compile.patch
+++ b/meta-networking/recipes-connectivity/samba/samba/0002-do-not-import-target-module-while-cross-compile.patch
@@ -11,6 +11,8 @@ Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
 update to version 4.10.5, and switch to python3
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
+Upstream-Status: Pending
+
  buildtools/wafsamba/samba_bundled.py | 27 +++++++++++++++++++--------
  1 file changed, 19 insertions(+), 8 deletions(-)
 
diff --git a/meta-networking/recipes-connectivity/samba/samba/samba-4.3.9-remove-getpwent_r.patch b/meta-networking/recipes-connectivity/samba/samba/samba-4.3.9-remove-getpwent_r.patch
index 22451a2d11..9a83574e66 100644
--- a/meta-networking/recipes-connectivity/samba/samba/samba-4.3.9-remove-getpwent_r.patch
+++ b/meta-networking/recipes-connectivity/samba/samba/samba-4.3.9-remove-getpwent_r.patch
@@ -9,6 +9,8 @@ http://data.gpo.zugaina.org/musl/net-fs/samba/files/samba-4.3.9-remove-getpwent_
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  source4/torture/local/nss_tests.c | 13 ++++++++-----
  1 file changed, 8 insertions(+), 5 deletions(-)
 
diff --git a/meta-networking/recipes-connectivity/samba/samba/samba-pam.patch b/meta-networking/recipes-connectivity/samba/samba/samba-pam.patch
index 9e45459931..9bf1f9757c 100644
--- a/meta-networking/recipes-connectivity/samba/samba/samba-pam.patch
+++ b/meta-networking/recipes-connectivity/samba/samba/samba-pam.patch
@@ -7,6 +7,8 @@ http://data.gpo.zugaina.org/musl/net-fs/samba/files/samba-4.2.7-pam.patch
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  source3/wscript | 13 ++++++++++++-
  1 file changed, 12 insertions(+), 1 deletion(-)
 
diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc/0001-search-for-log-help-in-build-dir.patch b/meta-networking/recipes-connectivity/vpnc/vpnc/0001-search-for-log-help-in-build-dir.patch
index 184c7943b5..735edb582e 100644
--- a/meta-networking/recipes-connectivity/vpnc/vpnc/0001-search-for-log-help-in-build-dir.patch
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc/0001-search-for-log-help-in-build-dir.patch
@@ -5,6 +5,8 @@ Subject: [PATCH 1/8] search for log-help in build dir
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  makeman.pl | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc/0002-Fix-vpnc-install-for-cross-compile.patch b/meta-networking/recipes-connectivity/vpnc/vpnc/0002-Fix-vpnc-install-for-cross-compile.patch
index 6f00d3b894..6380804368 100644
--- a/meta-networking/recipes-connectivity/vpnc/vpnc/0002-Fix-vpnc-install-for-cross-compile.patch
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc/0002-Fix-vpnc-install-for-cross-compile.patch
@@ -4,6 +4,8 @@ Date: Sun, 2 Dec 2012 02:16:54 +0100
 Subject: [PATCH 2/8] Fix vpnc install for cross compile
 
 ---
+Upstream-Status: Pending
+
  Makefile | 22 +++++++++++-----------
  1 file changed, 11 insertions(+), 11 deletions(-)
 
diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc/0003-error.h-is-specific-to-glibc-on-linux.patch b/meta-networking/recipes-connectivity/vpnc/vpnc/0003-error.h-is-specific-to-glibc-on-linux.patch
index bb7730647b..60c28cef31 100644
--- a/meta-networking/recipes-connectivity/vpnc/vpnc/0003-error.h-is-specific-to-glibc-on-linux.patch
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc/0003-error.h-is-specific-to-glibc-on-linux.patch
@@ -5,6 +5,8 @@ Subject: [PATCH 3/8] error.h is specific to glibc on linux
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  sysdep.h | 5 +++--
  1 file changed, 3 insertions(+), 2 deletions(-)
 
diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc/0004-Use-pkgconfig-instead-of-libgcrypt-config.patch b/meta-networking/recipes-connectivity/vpnc/vpnc/0004-Use-pkgconfig-instead-of-libgcrypt-config.patch
index f70a13898f..305e9aabb1 100644
--- a/meta-networking/recipes-connectivity/vpnc/vpnc/0004-Use-pkgconfig-instead-of-libgcrypt-config.patch
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc/0004-Use-pkgconfig-instead-of-libgcrypt-config.patch
@@ -5,6 +5,8 @@ Subject: [PATCH 4/8] Use pkgconfig instead of libgcrypt-config
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  Makefile | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc/0005-include-sys-ttydefaults.h-for-CEOT-definition.patch b/meta-networking/recipes-connectivity/vpnc/vpnc/0005-include-sys-ttydefaults.h-for-CEOT-definition.patch
index 01783f45b7..af63433c0f 100644
--- a/meta-networking/recipes-connectivity/vpnc/vpnc/0005-include-sys-ttydefaults.h-for-CEOT-definition.patch
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc/0005-include-sys-ttydefaults.h-for-CEOT-definition.patch
@@ -10,6 +10,8 @@ config.c:146:25: error: use of undeclared identifier 'CEOT'
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  config.c | 1 +
  1 file changed, 1 insertion(+)
 
diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc/0006-sysdep-Add-header-include-sequence-to-adjust-for-mus.patch b/meta-networking/recipes-connectivity/vpnc/vpnc/0006-sysdep-Add-header-include-sequence-to-adjust-for-mus.patch
index fa89df2796..664c73a713 100644
--- a/meta-networking/recipes-connectivity/vpnc/vpnc/0006-sysdep-Add-header-include-sequence-to-adjust-for-mus.patch
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc/0006-sysdep-Add-header-include-sequence-to-adjust-for-mus.patch
@@ -4,6 +4,8 @@ Date: Wed, 29 Mar 2017 23:09:47 -0700
 Subject: [PATCH 6/8] sysdep: Add header include sequence to adjust for musl
 
 ---
+Upstream-Status: Pending
+
  sysdep.h | 10 +++++++---
  1 file changed, 7 insertions(+), 3 deletions(-)
 
diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc/0007-add-error-API-when-error.h-is-not-on-platform.patch b/meta-networking/recipes-connectivity/vpnc/vpnc/0007-add-error-API-when-error.h-is-not-on-platform.patch
index de67b47a43..f7d7b0aec3 100644
--- a/meta-networking/recipes-connectivity/vpnc/vpnc/0007-add-error-API-when-error.h-is-not-on-platform.patch
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc/0007-add-error-API-when-error.h-is-not-on-platform.patch
@@ -5,6 +5,8 @@ Subject: [PATCH 7/8] add error() API when error.h is not on platform
 
 sign-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  sysdep.c | 24 ++++++++++++++++++++++++
  sysdep.h |  2 ++
  2 files changed, 26 insertions(+)
diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc/0008-include-sysdep.h-before-net-if_tun.h.patch b/meta-networking/recipes-connectivity/vpnc/vpnc/0008-include-sysdep.h-before-net-if_tun.h.patch
index 62ffdb7c9f..6c63011997 100644
--- a/meta-networking/recipes-connectivity/vpnc/vpnc/0008-include-sysdep.h-before-net-if_tun.h.patch
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc/0008-include-sysdep.h-before-net-if_tun.h.patch
@@ -7,6 +7,8 @@ Fixes duplicate defines in header errors
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  sysdep.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc/0009-reduce-lifetime-value.patch b/meta-networking/recipes-connectivity/vpnc/vpnc/0009-reduce-lifetime-value.patch
index 2bed550415..3da2efe479 100644
--- a/meta-networking/recipes-connectivity/vpnc/vpnc/0009-reduce-lifetime-value.patch
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc/0009-reduce-lifetime-value.patch
@@ -12,6 +12,8 @@ don't.
 Reducing the lifetime from its current value to 28800 (exactly 8 hours)
 causes it to start working with fortigate devices.
 ---
+Upstream-Status: Pending
+
  vpnc.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
diff --git a/meta-networking/recipes-daemons/autofs/autofs/0001-Define-__SWORD_TYPE-and-_PATH_NSSWITCH_CONF.patch b/meta-networking/recipes-daemons/autofs/autofs/0001-Define-__SWORD_TYPE-and-_PATH_NSSWITCH_CONF.patch
index 87159718b2..6128f3d0ed 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/0001-Define-__SWORD_TYPE-and-_PATH_NSSWITCH_CONF.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/0001-Define-__SWORD_TYPE-and-_PATH_NSSWITCH_CONF.patch
@@ -9,6 +9,8 @@ them here
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  include/automount.h | 8 ++++++++
  include/nsswitch.h  | 3 +++
  2 files changed, 11 insertions(+)
diff --git a/meta-networking/recipes-daemons/autofs/autofs/0001-autofs-5.1.8-add-autofs_strerror_r-helper-for-musl.patch b/meta-networking/recipes-daemons/autofs/autofs/0001-autofs-5.1.8-add-autofs_strerror_r-helper-for-musl.patch
index 5fd9a8d129..caf0105118 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/0001-autofs-5.1.8-add-autofs_strerror_r-helper-for-musl.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/0001-autofs-5.1.8-add-autofs_strerror_r-helper-for-musl.patch
@@ -11,6 +11,8 @@ Signed-off-by: Fabian Groffen <grobian@gentoo.org>
 Signed-off-by: Ian Kent <raven@themaw.net>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  include/automount.h |  5 +++++
  lib/log.c           | 10 ++++++++++
  2 files changed, 15 insertions(+)
diff --git a/meta-networking/recipes-daemons/autofs/autofs/0001-modules-lookup_multi.c-Replace-__S_IEXEC-with-S_IEXE.patch b/meta-networking/recipes-daemons/autofs/autofs/0001-modules-lookup_multi.c-Replace-__S_IEXEC-with-S_IEXE.patch
index 32293dd09f..8eec3014a0 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/0001-modules-lookup_multi.c-Replace-__S_IEXEC-with-S_IEXE.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/0001-modules-lookup_multi.c-Replace-__S_IEXEC-with-S_IEXE.patch
@@ -9,6 +9,8 @@ all libc e.g. musl
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  modules/lookup_multi.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-networking/recipes-daemons/autofs/autofs/0002-Replace-__S_IEXEC-with-S_IEXEC.patch b/meta-networking/recipes-daemons/autofs/autofs/0002-Replace-__S_IEXEC-with-S_IEXEC.patch
index 1a2eb4fc21..d67f6300c8 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/0002-Replace-__S_IEXEC-with-S_IEXEC.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/0002-Replace-__S_IEXEC-with-S_IEXEC.patch
@@ -12,6 +12,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 update patch to version 5.1.5
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
+Upstream-Status: Pending
+
  daemon/lookup.c        | 6 +++---
  modules/lookup_multi.c | 2 +-
  2 files changed, 4 insertions(+), 4 deletions(-)
diff --git a/meta-networking/recipes-daemons/autofs/autofs/cross.patch b/meta-networking/recipes-daemons/autofs/autofs/cross.patch
index b25c43f747..2a4f4fd0dd 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/cross.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/cross.patch
@@ -3,6 +3,8 @@ From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 5 Jan 2013 19:53:10 -0800
 
 ---
+Upstream-Status: Pending
+
  aclocal.m4   | 2 ++
  configure.in | 8 ++++++--
  2 files changed, 8 insertions(+), 2 deletions(-)
diff --git a/meta-networking/recipes-daemons/autofs/autofs/fix-the-YACC-rule-to-fix-a-building-failure.patch b/meta-networking/recipes-daemons/autofs/autofs/fix-the-YACC-rule-to-fix-a-building-failure.patch
index 8ad3b22de5..fd736296a5 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/fix-the-YACC-rule-to-fix-a-building-failure.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/fix-the-YACC-rule-to-fix-a-building-failure.patch
@@ -19,6 +19,8 @@ This lead to a race when compile amd_tok.o, the header file maybe rewritten.
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
 
 ---
+Upstream-Status: Pending
+
  lib/Makefile     | 6 ++++--
  modules/Makefile | 3 ++-
  2 files changed, 6 insertions(+), 3 deletions(-)
diff --git a/meta-networking/recipes-daemons/autofs/autofs/force-STRIP-to-emtpy.patch b/meta-networking/recipes-daemons/autofs/autofs/force-STRIP-to-emtpy.patch
index 21396dd6f6..1fc500319e 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/force-STRIP-to-emtpy.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/force-STRIP-to-emtpy.patch
@@ -8,6 +8,8 @@ otherwise the generate file will be stripped
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
 
 ---
+Upstream-Status: Pending
+
  Makefile.rules | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-networking/recipes-daemons/autofs/autofs/no-bash.patch b/meta-networking/recipes-daemons/autofs/autofs/no-bash.patch
index c46c0e5ad2..f91c307d34 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/no-bash.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/no-bash.patch
@@ -3,6 +3,8 @@ From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 5 Jan 2013 19:53:10 -0800
 
 ---
+Upstream-Status: Pending
+
  samples/auto.net | 2 +-
  samples/auto.smb | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
diff --git a/meta-networking/recipes-daemons/ippool/ippool/0001-Respect-flags-from-env.patch b/meta-networking/recipes-daemons/ippool/ippool/0001-Respect-flags-from-env.patch
index e967621259..5555d464c1 100644
--- a/meta-networking/recipes-daemons/ippool/ippool/0001-Respect-flags-from-env.patch
+++ b/meta-networking/recipes-daemons/ippool/ippool/0001-Respect-flags-from-env.patch
@@ -5,6 +5,8 @@ Subject: [PATCH 1/3] Respect flags from env
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  Makefile      | 4 ++--
  cli/Makefile  | 2 +-
  pppd/Makefile | 2 +-
diff --git a/meta-networking/recipes-daemons/ippool/ippool/0001-read-returns-ssize_t.patch b/meta-networking/recipes-daemons/ippool/ippool/0001-read-returns-ssize_t.patch
index 7d3f9acb65..1b8de349cf 100644
--- a/meta-networking/recipes-daemons/ippool/ippool/0001-read-returns-ssize_t.patch
+++ b/meta-networking/recipes-daemons/ippool/ippool/0001-read-returns-ssize_t.patch
@@ -10,6 +10,8 @@ usl_fd.c:284:10: error: comparison of unsigned expression < 0 is always false [-
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  usl/usl_fd.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-networking/recipes-daemons/ippool/ippool/0001-usl_timer-Check-for-return-value-of-write-API.patch b/meta-networking/recipes-daemons/ippool/ippool/0001-usl_timer-Check-for-return-value-of-write-API.patch
index 6fb7cc5c46..2c612e42fe 100644
--- a/meta-networking/recipes-daemons/ippool/ippool/0001-usl_timer-Check-for-return-value-of-write-API.patch
+++ b/meta-networking/recipes-daemons/ippool/ippool/0001-usl_timer-Check-for-return-value-of-write-API.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] usl_timer: Check for return value of write() API
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  usl/usl_timer.c | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
diff --git a/meta-networking/recipes-daemons/ippool/ippool/0002-Mark-first-element-of-a-string-as-null.patch b/meta-networking/recipes-daemons/ippool/ippool/0002-Mark-first-element-of-a-string-as-null.patch
index 6e2bd523da..f21c68f0d1 100644
--- a/meta-networking/recipes-daemons/ippool/ippool/0002-Mark-first-element-of-a-string-as-null.patch
+++ b/meta-networking/recipes-daemons/ippool/ippool/0002-Mark-first-element-of-a-string-as-null.patch
@@ -10,6 +10,8 @@ cli_lib.c:427:20: error: expression which evaluates to zero treated as a null po
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  cli/cli_lib.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-networking/recipes-daemons/ippool/ippool/0002-link-with-libtirpc.patch b/meta-networking/recipes-daemons/ippool/ippool/0002-link-with-libtirpc.patch
index d80f7b4362..75bb825302 100644
--- a/meta-networking/recipes-daemons/ippool/ippool/0002-link-with-libtirpc.patch
+++ b/meta-networking/recipes-daemons/ippool/ippool/0002-link-with-libtirpc.patch
@@ -7,6 +7,8 @@ musl needs it
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  Makefile | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
diff --git a/meta-networking/recipes-daemons/ippool/ippool/0003-cli-Mark-return-of-strtol-as-long-int.patch b/meta-networking/recipes-daemons/ippool/ippool/0003-cli-Mark-return-of-strtol-as-long-int.patch
index 3854b1133c..f6a8d62b98 100644
--- a/meta-networking/recipes-daemons/ippool/ippool/0003-cli-Mark-return-of-strtol-as-long-int.patch
+++ b/meta-networking/recipes-daemons/ippool/ippool/0003-cli-Mark-return-of-strtol-as-long-int.patch
@@ -10,6 +10,8 @@ error: taking the absolute value of unsigned type 'unsigned long' has no effect
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  cli/cli_lib.c | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
diff --git a/meta-networking/recipes-daemons/ippool/ippool/0003-musl-fixes.patch b/meta-networking/recipes-daemons/ippool/ippool/0003-musl-fixes.patch
index 952e4f0d04..8c42ebe30b 100644
--- a/meta-networking/recipes-daemons/ippool/ippool/0003-musl-fixes.patch
+++ b/meta-networking/recipes-daemons/ippool/ippool/0003-musl-fixes.patch
@@ -5,6 +5,8 @@ Subject: [PATCH 3/3] musl fixes
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  cli/cli_readline.c |   7 +-
  ippool_api.c       |   9 ++-
  net/ppp_defs.h     | 194 +++++++++++++++++++++++++++++++++++++++++++++++++++++
diff --git a/meta-networking/recipes-daemons/keepalived/keepalived/0001-layer4-Change-order-of-include-files.patch b/meta-networking/recipes-daemons/keepalived/keepalived/0001-layer4-Change-order-of-include-files.patch
index f9cadbc26d..678a208ac3 100644
--- a/meta-networking/recipes-daemons/keepalived/keepalived/0001-layer4-Change-order-of-include-files.patch
+++ b/meta-networking/recipes-daemons/keepalived/keepalived/0001-layer4-Change-order-of-include-files.patch
@@ -14,6 +14,8 @@ amicably, and I think this is right order too
 Upsteam-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  keepalived/core/layer4.c | 21 ++++++++++-----------
  1 file changed, 10 insertions(+), 11 deletions(-)
 
diff --git a/meta-networking/recipes-daemons/openhpi/files/fix-narrowing-warning.patch b/meta-networking/recipes-daemons/openhpi/files/fix-narrowing-warning.patch
index 4c545708fc..eabffa7d9c 100644
--- a/meta-networking/recipes-daemons/openhpi/files/fix-narrowing-warning.patch
+++ b/meta-networking/recipes-daemons/openhpi/files/fix-narrowing-warning.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Fix
 
 sensor_factors_000.cpp:66:5: error: non-constant-expression cannot be narrowed from type 'int' to 'unsigned char' in initializer list [-Wc++11-narrowing]
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-configure-Disable-format-overflow-if-supported-by-gc.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-configure-Disable-format-overflow-if-supported-by-gc.patch
index be0a587679..c5264e5e7a 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf/0001-configure-Disable-format-overflow-if-supported-by-gc.patch
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/0001-configure-Disable-format-overflow-if-supported-by-gc.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] configure: Disable format-overflow if supported by gcc
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  Makefile.am                 |  6 +--
  configure.ac                |  2 +
  m4/ax_check_compile_flag.m4 | 74 +++++++++++++++++++++++++++++++++++++
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-configure-Pass-linker-specific-options-with-Wl.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-configure-Pass-linker-specific-options-with-Wl.patch
index e4bbb4c3cd..daf06d38fb 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf/0001-configure-Pass-linker-specific-options-with-Wl.patch
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/0001-configure-Pass-linker-specific-options-with-Wl.patch
@@ -9,6 +9,8 @@ and we can use non-gcc compilers
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-immpbe_dump.cc-Use-sys-wait.h-instead-of-wait.h.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-immpbe_dump.cc-Use-sys-wait.h-instead-of-wait.h.patch
index e40d2b3198..99fab3b034 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf/0001-immpbe_dump.cc-Use-sys-wait.h-instead-of-wait.h.patch
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/0001-immpbe_dump.cc-Use-sys-wait.h-instead-of-wait.h.patch
@@ -9,6 +9,8 @@ redirecting incorrect #include <wait.h> to <sys/wait.h>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  src/imm/common/immpbe_dump.cc | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-src-Add-missing-header-limits.h-for-_POSIX_HOST_NAME.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-src-Add-missing-header-limits.h-for-_POSIX_HOST_NAME.patch
index e4a3975da6..2521839c73 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf/0001-src-Add-missing-header-limits.h-for-_POSIX_HOST_NAME.patch
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/0001-src-Add-missing-header-limits.h-for-_POSIX_HOST_NAME.patch
@@ -9,6 +9,8 @@ Do not use the deprecated headers under include/sys
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  src/base/os_defs.h        | 5 +++--
  src/mds/mds_dt_tcp.c      | 1 -
  src/mds/mds_dt_tcp_disc.h | 2 +-
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0002-Fix-Werror-enum-int-mismatch-with-gcc13.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0002-Fix-Werror-enum-int-mismatch-with-gcc13.patch
index e3288431eb..a6aa2c3d07 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf/0002-Fix-Werror-enum-int-mismatch-with-gcc13.patch
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/0002-Fix-Werror-enum-int-mismatch-with-gcc13.patch
@@ -5,6 +5,8 @@ Subject: [PATCH 2/2] Fix -Werror=enum-int-mismatch with gcc13
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  src/evt/agent/eda_hdl.h | 5 +++--
  src/evt/evtd/eds_mds.h  | 3 +--
  src/smf/smfnd/smfnd.h   | 8 ++++----
diff --git a/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
index 8c9c13b1c4..bacfdb5e67 100644
--- a/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
@@ -15,6 +15,8 @@ Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
 ---
+Upstream-Status: Pending
+
  makedefs | 27 +++++++++++----------------
  1 file changed, 11 insertions(+), 16 deletions(-)
 
diff --git a/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch b/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch
index 0fc938e13d..1545f21637 100644
--- a/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch
@@ -7,6 +7,8 @@ Its a binary used during build
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  makedefs | 10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)
 
diff --git a/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch b/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch
index 6b4a5f7a0c..a38e783309 100644
--- a/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch
@@ -12,6 +12,8 @@ entertained.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  makedefs | 1 -
  1 file changed, 1 deletion(-)
 
diff --git a/meta-networking/recipes-daemons/squid/files/0001-configure-Check-for-Wno-error-format-truncation-comp.patch b/meta-networking/recipes-daemons/squid/files/0001-configure-Check-for-Wno-error-format-truncation-comp.patch
index 302136a03c..acebd6dce5 100644
--- a/meta-networking/recipes-daemons/squid/files/0001-configure-Check-for-Wno-error-format-truncation-comp.patch
+++ b/meta-networking/recipes-daemons/squid/files/0001-configure-Check-for-Wno-error-format-truncation-comp.patch
@@ -11,6 +11,8 @@ client.c:834:23: error: '%s' directive output may be truncated writing up to 102
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  acinclude/ax_check_compile_flag.m4 | 74 ++++++++++++++++++++++++++++++++++++++
  configure.ac                       |  2 ++
  2 files changed, 76 insertions(+)
diff --git a/meta-networking/recipes-daemons/squid/files/Fix-flawed-dynamic-ldb-link-test-in-configure.patch b/meta-networking/recipes-daemons/squid/files/Fix-flawed-dynamic-ldb-link-test-in-configure.patch
index a429b7b2db..738e609c05 100644
--- a/meta-networking/recipes-daemons/squid/files/Fix-flawed-dynamic-ldb-link-test-in-configure.patch
+++ b/meta-networking/recipes-daemons/squid/files/Fix-flawed-dynamic-ldb-link-test-in-configure.patch
@@ -12,6 +12,8 @@ about why and setting the need for -ldb incorrectly.
 Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
 
 ---
+Upstream-Status: Pending
+
  configure.ac | 10 ++++++++++
  1 file changed, 10 insertions(+)
 
diff --git a/meta-networking/recipes-daemons/squid/files/Set-up-for-cross-compilation.patch b/meta-networking/recipes-daemons/squid/files/Set-up-for-cross-compilation.patch
index 3852f7c255..ffb7371640 100644
--- a/meta-networking/recipes-daemons/squid/files/Set-up-for-cross-compilation.patch
+++ b/meta-networking/recipes-daemons/squid/files/Set-up-for-cross-compilation.patch
@@ -11,6 +11,8 @@ proper cross compilation can occur.
 Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
 
 ---
+Upstream-Status: Pending
+
  configure.ac | 1 +
  1 file changed, 1 insertion(+)
 
diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/0001-__progname-is-provided-by-libc.patch b/meta-networking/recipes-daemons/tftp-hpa/files/0001-__progname-is-provided-by-libc.patch
index cead977e28..66c15b5f8b 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/files/0001-__progname-is-provided-by-libc.patch
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/0001-__progname-is-provided-by-libc.patch
@@ -12,6 +12,8 @@ global symbols and work around Debian bug #519006 (Closes: #564052).
 Signed-off-by: Ron Lee <ron@debian.org>
 Signed-off-by: H. Peter Anvin <hpa@linux.intel.com>
 ---
+Upstream-Status: Pending
+
  tftpd/tftpd.c | 10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)
 
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/0001-sysdeputil.c-Fix-with-musl-which-does-not-have-utmpx.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/0001-sysdeputil.c-Fix-with-musl-which-does-not-have-utmpx.patch
index d81c94a4aa..6c68989d3b 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/0001-sysdeputil.c-Fix-with-musl-which-does-not-have-utmpx.patch
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.5/0001-sysdeputil.c-Fix-with-musl-which-does-not-have-utmpx.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] sysdeputil.c: Fix with musl which does not have utmpx
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  sysdeputil.c | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
diff --git a/meta-networking/recipes-extended/tgt/files/usr-Makefile-apply-LDFLAGS-to-all-executables.patch b/meta-networking/recipes-extended/tgt/files/usr-Makefile-apply-LDFLAGS-to-all-executables.patch
index d480ef786e..b6c674bd9d 100644
--- a/meta-networking/recipes-extended/tgt/files/usr-Makefile-apply-LDFLAGS-to-all-executables.patch
+++ b/meta-networking/recipes-extended/tgt/files/usr-Makefile-apply-LDFLAGS-to-all-executables.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] usr/Makefile: apply LDFLAGS to all executables
 
 Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
 ---
+Upstream-Status: Pending
+
  usr/Makefile | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/0010-Adjust-header-include-sequence.patch b/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/0010-Adjust-header-include-sequence.patch
index 1f3fcfe370..dd8ad969c0 100644
--- a/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/0010-Adjust-header-include-sequence.patch
+++ b/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/0010-Adjust-header-include-sequence.patch
@@ -8,6 +8,8 @@ This fixes the build with musl
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
 ---
+Upstream-Status: Pending
+
  extensions/ebt_among.c    | 2 +-
  extensions/ebt_arpreply.c | 2 +-
  extensions/ebt_nat.c      | 2 +-
diff --git a/meta-networking/recipes-filter/libnetfilter/files/0001-libnetfilter-acct-Declare-the-define-visivility-attribute-together.patch b/meta-networking/recipes-filter/libnetfilter/files/0001-libnetfilter-acct-Declare-the-define-visivility-attribute-together.patch
index 9e0b420e0a..92e178efb7 100644
--- a/meta-networking/recipes-filter/libnetfilter/files/0001-libnetfilter-acct-Declare-the-define-visivility-attribute-together.patch
+++ b/meta-networking/recipes-filter/libnetfilter/files/0001-libnetfilter-acct-Declare-the-define-visivility-attribute-together.patch
@@ -10,6 +10,8 @@ fail to link due to these missing symbols
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  doxygen.cfg.in          |  2 +-
  src/internal.h          |  5 ++---
  src/libnetfilter_acct.c | 41 ++++++++++++++---------------------------
diff --git a/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp/0001-ftp-include-sys-types.h-for-u_long.patch b/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp/0001-ftp-include-sys-types.h-for-u_long.patch
index 8376603ead..2cd639ee92 100644
--- a/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp/0001-ftp-include-sys-types.h-for-u_long.patch
+++ b/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp/0001-ftp-include-sys-types.h-for-u_long.patch
@@ -10,6 +10,8 @@ ftp.c:1091:2: error: unknown type name 'u_long'; did you mean 'long'?
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  ftp/ftp.c | 1 +
  1 file changed, 1 insertion(+)
 
diff --git a/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc/0001-rpcgen-Fix-printf-formats.patch b/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc/0001-rpcgen-Fix-printf-formats.patch
index 8bd77d2e47..508db6aadf 100644
--- a/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc/0001-rpcgen-Fix-printf-formats.patch
+++ b/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc/0001-rpcgen-Fix-printf-formats.patch
@@ -7,6 +7,8 @@ Fixes build with hardening flags
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  rpcgen/rpc_hout.c   | 2 +-
  rpcgen/rpc_tblout.c | 4 ++--
  2 files changed, 3 insertions(+), 3 deletions(-)
diff --git a/meta-networking/recipes-netkit/netkit-telnet/files/0001-telnet-telnetd-Fix-deadlock-on-cleanup.patch b/meta-networking/recipes-netkit/netkit-telnet/files/0001-telnet-telnetd-Fix-deadlock-on-cleanup.patch
index 945785d3ce..afcc66dada 100644
--- a/meta-networking/recipes-netkit/netkit-telnet/files/0001-telnet-telnetd-Fix-deadlock-on-cleanup.patch
+++ b/meta-networking/recipes-netkit/netkit-telnet/files/0001-telnet-telnetd-Fix-deadlock-on-cleanup.patch
@@ -47,6 +47,8 @@ in upstream.
 
 Signed-off-by: Seiichi Ishitsuka <ishitsuka.sc@ncos.nec.co.jp>
 ---
+Upstream-Status: Pending
+
  telnetd/ext.h      |  1 +
  telnetd/sys_term.c | 17 ++++++++++++++++-
  telnetd/telnetd.c  |  2 +-
diff --git a/meta-networking/recipes-netkit/netkit-telnet/files/0001-telnet-telnetd-Fix-print-format-strings.patch b/meta-networking/recipes-netkit/netkit-telnet/files/0001-telnet-telnetd-Fix-print-format-strings.patch
index f2f1b12e28..755b882b67 100644
--- a/meta-networking/recipes-netkit/netkit-telnet/files/0001-telnet-telnetd-Fix-print-format-strings.patch
+++ b/meta-networking/recipes-netkit/netkit-telnet/files/0001-telnet-telnetd-Fix-print-format-strings.patch
@@ -7,6 +7,8 @@ Fixes build with hardening flags
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  telnet/utilities.cc | 6 +++---
  telnetd/utility.c   | 6 +++---
  2 files changed, 6 insertions(+), 6 deletions(-)
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch b/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch
index 6553f6b983..39e67cdf48 100644
--- a/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch
+++ b/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch
@@ -5,6 +5,8 @@ Subject: [PATCH 5/6] mDNSCore: Fix broken debug parameter
 
 Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
 ---
+Upstream-Status: Pending
+
  mDNSCore/mDNS.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch
index af6334f726..6450c1cc92 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch
@@ -13,6 +13,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
 
 ---
+Upstream-Status: Pending
+
  snmplib/keytools.c | 5 +----
  1 file changed, 1 insertion(+), 4 deletions(-)
 
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibility-have-printcap.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibility-have-printcap.patch
index c0b51c51e3..5fbb411a5f 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibility-have-printcap.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibility-have-printcap.patch
@@ -9,6 +9,8 @@ ac_cv_file__etc_printcap instead. When cross-compiling, this variable should be
 set in the environment to "yes" or "no" as appropriate for the target platform.
 
 ---
+Upstream-Status: Pending
+
  configure.d/config_os_misc4 | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
diff --git a/meta-networking/recipes-protocols/opcua/open62541/0001-fix-build-do-not-install-git-files.patch b/meta-networking/recipes-protocols/opcua/open62541/0001-fix-build-do-not-install-git-files.patch
index 44ee7b92c5..a84290218d 100644
--- a/meta-networking/recipes-protocols/opcua/open62541/0001-fix-build-do-not-install-git-files.patch
+++ b/meta-networking/recipes-protocols/opcua/open62541/0001-fix-build-do-not-install-git-files.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] fix(build): do not install git files
 
 Signed-off-by: Vyacheslav Yurkov <v.yurkov@precitec.de>
 ---
+Upstream-Status: Pending
+
  CMakeLists.txt | 1 +
  1 file changed, 1 insertion(+)
 
diff --git a/meta-networking/recipes-protocols/openflow/openflow/0001-Check-and-use-strlcpy-from-libc-before-defining-own.patch b/meta-networking/recipes-protocols/openflow/openflow/0001-Check-and-use-strlcpy-from-libc-before-defining-own.patch
index 952274bb97..2175a20b90 100644
--- a/meta-networking/recipes-protocols/openflow/openflow/0001-Check-and-use-strlcpy-from-libc-before-defining-own.patch
+++ b/meta-networking/recipes-protocols/openflow/openflow/0001-Check-and-use-strlcpy-from-libc-before-defining-own.patch
@@ -9,6 +9,8 @@ failures.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  configure.ac | 2 +-
  lib/util.c   | 2 ++
  lib/util.h   | 1 +
diff --git a/meta-networking/recipes-protocols/openflow/openflow/0002-lib-netdev-Adjust-header-include-sequence.patch b/meta-networking/recipes-protocols/openflow/openflow/0002-lib-netdev-Adjust-header-include-sequence.patch
index 75180fe32f..9a49f4ef39 100644
--- a/meta-networking/recipes-protocols/openflow/openflow/0002-lib-netdev-Adjust-header-include-sequence.patch
+++ b/meta-networking/recipes-protocols/openflow/openflow/0002-lib-netdev-Adjust-header-include-sequence.patch
@@ -10,6 +10,8 @@ about double definition in libc headers
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  lib/netdev.c | 11 +++++------
  1 file changed, 5 insertions(+), 6 deletions(-)
 
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-Use-1-instead-of-WAIT_ANY.patch b/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-Use-1-instead-of-WAIT_ANY.patch
index d1ee3c5916..8314b5d964 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-Use-1-instead-of-WAIT_ANY.patch
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-Use-1-instead-of-WAIT_ANY.patch
@@ -8,6 +8,8 @@ e.g. musl do not define this.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  usl/usl_pid.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-l2tp_api-Included-needed-headers.patch b/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-l2tp_api-Included-needed-headers.patch
index c50f68e65d..4bdbf458cd 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-l2tp_api-Included-needed-headers.patch
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-l2tp_api-Included-needed-headers.patch
@@ -7,6 +7,8 @@ These are flagged by musl
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  l2tp_api.c | 7 +++++--
  1 file changed, 5 insertions(+), 2 deletions(-)
 
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-test-pppd_dummy.c-Fix-return-value.patch b/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-test-pppd_dummy.c-Fix-return-value.patch
index 1f576fa710..42d6f58007 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-test-pppd_dummy.c-Fix-return-value.patch
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-test-pppd_dummy.c-Fix-return-value.patch
@@ -9,6 +9,8 @@ declaration
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  test/pppd_dummy.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/0002-cli-include-fcntl.h-for-O_CREAT-define.patch b/meta-networking/recipes-protocols/openl2tp/openl2tp/0002-cli-include-fcntl.h-for-O_CREAT-define.patch
index 9df32658a0..bad1007e04 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp/0002-cli-include-fcntl.h-for-O_CREAT-define.patch
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/0002-cli-include-fcntl.h-for-O_CREAT-define.patch
@@ -5,6 +5,8 @@ Subject: [PATCH 2/4] cli: include fcntl.h for O_CREAT define
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  cli/cli_readline.c | 1 +
  1 file changed, 1 insertion(+)
 
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/0002-user-ipv6-structures.patch b/meta-networking/recipes-protocols/openl2tp/openl2tp/0002-user-ipv6-structures.patch
index bd9bcb8f27..6574ba22f0 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp/0002-user-ipv6-structures.patch
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/0002-user-ipv6-structures.patch
@@ -8,6 +8,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Update for ipv6 address compare
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
+Upstream-Status: Pending
+
  l2tp_api.c | 8 +++++---
  1 file changed, 5 insertions(+), 3 deletions(-)
 
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/0003-cli-Define-_GNU_SOURCE-for-getting-sighandler_t.patch b/meta-networking/recipes-protocols/openl2tp/openl2tp/0003-cli-Define-_GNU_SOURCE-for-getting-sighandler_t.patch
index e05be1bbb4..5d0c29cb42 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp/0003-cli-Define-_GNU_SOURCE-for-getting-sighandler_t.patch
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/0003-cli-Define-_GNU_SOURCE-for-getting-sighandler_t.patch
@@ -5,6 +5,8 @@ Subject: [PATCH 3/4] cli: Define _GNU_SOURCE for getting sighandler_t
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  cli/cli_readline.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd-enable-tests.patch b/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd-enable-tests.patch
index 0bece2f4d7..ad60083d1c 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd-enable-tests.patch
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd-enable-tests.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 commit 3e96a6c41bdd26417265a45ed685138d8eed564e
 Author: Aws Ismail <aws.ismail@windriver.com>
 Date:   Fri Sep 14 02:32:53 2012 -0400
diff --git a/meta-networking/recipes-protocols/openlldp/files/0001-Fix-musl-libc-build-issue.patch b/meta-networking/recipes-protocols/openlldp/files/0001-Fix-musl-libc-build-issue.patch
index 40b082e77a..04ceb6b572 100644
--- a/meta-networking/recipes-protocols/openlldp/files/0001-Fix-musl-libc-build-issue.patch
+++ b/meta-networking/recipes-protocols/openlldp/files/0001-Fix-musl-libc-build-issue.patch
@@ -9,6 +9,8 @@ to compile when using musl libc.
 Signed-off-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
 
 ---
+Upstream-Status: Pending
+
  include/clif.h | 1 +
  1 file changed, 1 insertion(+)
 
diff --git a/meta-networking/recipes-protocols/openlldp/files/0001-autotools-Add-include-path-to-generated-version.h.patch b/meta-networking/recipes-protocols/openlldp/files/0001-autotools-Add-include-path-to-generated-version.h.patch
index b58fc104d2..f1a3ac3ad2 100644
--- a/meta-networking/recipes-protocols/openlldp/files/0001-autotools-Add-include-path-to-generated-version.h.patch
+++ b/meta-networking/recipes-protocols/openlldp/files/0001-autotools-Add-include-path-to-generated-version.h.patch
@@ -10,6 +10,8 @@ dir. Include the path to it in AM_CPPFLAGS.
 Signed-off-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
 
 ---
+Upstream-Status: Pending
+
  Makefile.am | 3 +++
  1 file changed, 3 insertions(+)
 
diff --git a/meta-networking/recipes-protocols/openlldp/files/0001-autotools-Add-option-to-disable-installation-of-syst.patch b/meta-networking/recipes-protocols/openlldp/files/0001-autotools-Add-option-to-disable-installation-of-syst.patch
index a26a5299ab..98ecd38642 100644
--- a/meta-networking/recipes-protocols/openlldp/files/0001-autotools-Add-option-to-disable-installation-of-syst.patch
+++ b/meta-networking/recipes-protocols/openlldp/files/0001-autotools-Add-option-to-disable-installation-of-syst.patch
@@ -16,6 +16,8 @@ to a hard coded path that couldn't be changed.
 
 Signed-off-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
 ---
+Upstream-Status: Pending
+
  Makefile.am  | 3 ++-
  configure.ac | 9 +++++++++
  2 files changed, 11 insertions(+), 1 deletion(-)
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/0001-ppoe-Dont-include-linux-if_ether.h.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/0001-ppoe-Dont-include-linux-if_ether.h.patch
index 7601f0d325..572886a26c 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/0001-ppoe-Dont-include-linux-if_ether.h.patch
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/0001-ppoe-Dont-include-linux-if_ether.h.patch
@@ -8,6 +8,8 @@ Fixes build with musl
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  src/pppoe.h | 4 ----
  1 file changed, 4 deletions(-)
 
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/0002-Enable-support-for-the-kernel-module.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/0002-Enable-support-for-the-kernel-module.patch
index 2103b38888..cd9e40d5eb 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/0002-Enable-support-for-the-kernel-module.patch
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/0002-Enable-support-for-the-kernel-module.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] Enable support for the kernel module
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  src/configure.in | 1 +
  1 file changed, 1 insertion(+)
 
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure.patch
index be892803e6..c486716b97 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure.patch
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure.patch
@@ -3,6 +3,8 @@ From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 18 Jul 2014 08:25:16 +0000
 
 ---
+Upstream-Status: Pending
+
  configure.in | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/discard-use-of-dnl-in-Makefile.am.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/discard-use-of-dnl-in-Makefile.am.patch
index 9801f6e277..57301f430d 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/discard-use-of-dnl-in-Makefile.am.patch
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/discard-use-of-dnl-in-Makefile.am.patch
@@ -9,6 +9,8 @@ not introduce a comment.
 Signed-off-by: Ting Liu <b28495@freescale.com>
 
 ---
+Upstream-Status: Pending
+
  Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-networking/recipes-protocols/zeroconf/zeroconf/0001-zeroconf-Rename-arp_op-to-avoid-namespace-conflicts-.patch b/meta-networking/recipes-protocols/zeroconf/zeroconf/0001-zeroconf-Rename-arp_op-to-avoid-namespace-conflicts-.patch
index b4d6d94b06..92b581416f 100644
--- a/meta-networking/recipes-protocols/zeroconf/zeroconf/0001-zeroconf-Rename-arp_op-to-avoid-namespace-conflicts-.patch
+++ b/meta-networking/recipes-protocols/zeroconf/zeroconf/0001-zeroconf-Rename-arp_op-to-avoid-namespace-conflicts-.patch
@@ -12,6 +12,8 @@ and causes the conflict
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  zeroconf.c | 10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)
 
diff --git a/meta-networking/recipes-support/aoetools/aoetools/reproducible-build.patch b/meta-networking/recipes-support/aoetools/aoetools/reproducible-build.patch
index 4939ab25c1..34d59b1aa6 100644
--- a/meta-networking/recipes-support/aoetools/aoetools/reproducible-build.patch
+++ b/meta-networking/recipes-support/aoetools/aoetools/reproducible-build.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- a/Makefile
 +++ b/Makefile
 @@ -40,7 +40,8 @@ NPERSHELF=16
diff --git a/meta-networking/recipes-support/arptables/arptables/0001-Use-ARPCFLAGS-for-package-specific-compiler-flags.patch b/meta-networking/recipes-support/arptables/arptables/0001-Use-ARPCFLAGS-for-package-specific-compiler-flags.patch
index eb58389c38..c58ef1a9ef 100644
--- a/meta-networking/recipes-support/arptables/arptables/0001-Use-ARPCFLAGS-for-package-specific-compiler-flags.patch
+++ b/meta-networking/recipes-support/arptables/arptables/0001-Use-ARPCFLAGS-for-package-specific-compiler-flags.patch
@@ -8,6 +8,8 @@ which OE uses to pass tweaks
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  Makefile            | 10 ++++------
  extensions/Makefile |  4 ++++
  2 files changed, 8 insertions(+), 6 deletions(-)
diff --git a/meta-networking/recipes-support/chrony/chrony/0001-Fix-compilation-with-musl.patch b/meta-networking/recipes-support/chrony/chrony/0001-Fix-compilation-with-musl.patch
index 17b6353527..5e2bc64af3 100644
--- a/meta-networking/recipes-support/chrony/chrony/0001-Fix-compilation-with-musl.patch
+++ b/meta-networking/recipes-support/chrony/chrony/0001-Fix-compilation-with-musl.patch
@@ -8,6 +8,8 @@ Fixes:
 
 Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
 ---
+Upstream-Status: Pending
+
  hash_intmd5.c | 2 ++
  1 file changed, 2 insertions(+)
 
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch b/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
index be2bb42fc2..f8697699ac 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
@@ -7,6 +7,8 @@ Signed-off-by: Christopher Larson <chris_larson@mentor.com>
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 
 ---
+Upstream-Status: Pending
+
  Makefile | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0001-not-check-pandoc.patch b/meta-networking/recipes-support/dovecot/dovecot/0001-not-check-pandoc.patch
index 20ba73a824..af69c82f0f 100644
--- a/meta-networking/recipes-support/dovecot/dovecot/0001-not-check-pandoc.patch
+++ b/meta-networking/recipes-support/dovecot/dovecot/0001-not-check-pandoc.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] not check pandoc
 
 Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
 ---
+Upstream-Status: Pending
+
  m4/dovecot.m4 | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-drbdmon-add-LDFLAGS-when-linking.patch b/meta-networking/recipes-support/drbd/drbd-utils/0001-drbdmon-add-LDFLAGS-when-linking.patch
index 354be0ff18..0bf4b2fce1 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils/0001-drbdmon-add-LDFLAGS-when-linking.patch
+++ b/meta-networking/recipes-support/drbd/drbd-utils/0001-drbdmon-add-LDFLAGS-when-linking.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] drbdmon: add LDFLAGS when linking
 
 Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
 ---
+Upstream-Status: Pending
+
  user/drbdmon/Makefile.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-networking/recipes-support/esmtp/esmtp/0001-Fix-libESMTP-dependency-check.patch b/meta-networking/recipes-support/esmtp/esmtp/0001-Fix-libESMTP-dependency-check.patch
index 92ac4b12ba..18bffe55b2 100644
--- a/meta-networking/recipes-support/esmtp/esmtp/0001-Fix-libESMTP-dependency-check.patch
+++ b/meta-networking/recipes-support/esmtp/esmtp/0001-Fix-libESMTP-dependency-check.patch
@@ -8,6 +8,8 @@ check for existence instead.
 
 Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
 ---
+Upstream-Status: Pending
+
  configure.ac | 8 +++++---
  1 file changed, 5 insertions(+), 3 deletions(-)
 
diff --git a/meta-networking/recipes-support/ifmetric/ifmetric/ifmetric.8_typo.patch b/meta-networking/recipes-support/ifmetric/ifmetric/ifmetric.8_typo.patch
index 246910036e..3bd87ff457 100644
--- a/meta-networking/recipes-support/ifmetric/ifmetric/ifmetric.8_typo.patch
+++ b/meta-networking/recipes-support/ifmetric/ifmetric/ifmetric.8_typo.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Description: Correct typo: s/ommited/omitted/
 Author: Michael Shuler <michael@pbandjelly.org>
 Index: ifmetric/man/ifmetric.8
diff --git a/meta-networking/recipes-support/ifmetric/ifmetric/ifmetric.c_netlink-invalid-arg.patch b/meta-networking/recipes-support/ifmetric/ifmetric/ifmetric.c_netlink-invalid-arg.patch
index 374135d4f6..a6d1828d22 100644
--- a/meta-networking/recipes-support/ifmetric/ifmetric/ifmetric.c_netlink-invalid-arg.patch
+++ b/meta-networking/recipes-support/ifmetric/ifmetric/ifmetric.c_netlink-invalid-arg.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Description: Fix "NETLINK: Error: Invalid argument" for links that are down, in kernel 4.4+
 Author: Jim Paris <jim@jtan.com>
 Bug-Debian: http://bugs.debian.org/864889
diff --git a/meta-networking/recipes-support/ifmetric/ifmetric/ifmetric.c_typo.patch b/meta-networking/recipes-support/ifmetric/ifmetric/ifmetric.c_typo.patch
index 992f7d2fbb..19290a59dd 100644
--- a/meta-networking/recipes-support/ifmetric/ifmetric/ifmetric.c_typo.patch
+++ b/meta-networking/recipes-support/ifmetric/ifmetric/ifmetric.c_typo.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Description: Correct spelling-error-in-binary s/Recieved/Received/
 Author: Michael Shuler <michael@pbandjelly.org>
 Index: ifmetric/src/ifmetric.c
diff --git a/meta-networking/recipes-support/ifmetric/ifmetric/nlrequest.c_packet-too-small_fix.patch b/meta-networking/recipes-support/ifmetric/ifmetric/nlrequest.c_packet-too-small_fix.patch
index 15b3103334..89851517bf 100644
--- a/meta-networking/recipes-support/ifmetric/ifmetric/nlrequest.c_packet-too-small_fix.patch
+++ b/meta-networking/recipes-support/ifmetric/ifmetric/nlrequest.c_packet-too-small_fix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Description: Fix "NETLINK: Packet too small or truncated!" error.
 Author: Benedek László <benedekl@gmail.com>
 Bug-Debian: http://bugs.debian.org/514197
diff --git a/meta-networking/recipes-support/libmemcached/files/0001-Fix-comparison-types.patch b/meta-networking/recipes-support/libmemcached/files/0001-Fix-comparison-types.patch
index 26b5e250cb..9e5121fed7 100644
--- a/meta-networking/recipes-support/libmemcached/files/0001-Fix-comparison-types.patch
+++ b/meta-networking/recipes-support/libmemcached/files/0001-Fix-comparison-types.patch
@@ -8,6 +8,8 @@ error: comparison between pointer and integer ('char *' and 'int')
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  clients/memflush.cc | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
diff --git a/meta-networking/recipes-support/libmemcached/files/0001-configure.ac-Do-not-configure-build-aux.patch b/meta-networking/recipes-support/libmemcached/files/0001-configure.ac-Do-not-configure-build-aux.patch
index 06febc5b13..1c1d814b50 100644
--- a/meta-networking/recipes-support/libmemcached/files/0001-configure.ac-Do-not-configure-build-aux.patch
+++ b/meta-networking/recipes-support/libmemcached/files/0001-configure.ac-Do-not-configure-build-aux.patch
@@ -8,6 +8,8 @@ configure: error: cannot find install-sh, install.sh, or shtool
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  configure.ac | 1 -
  1 file changed, 1 deletion(-)
 
diff --git a/meta-networking/recipes-support/libmemcached/files/0002-POSIX_SPAWN_USEVFORK-is-not-linux-specific-but-glibc.patch b/meta-networking/recipes-support/libmemcached/files/0002-POSIX_SPAWN_USEVFORK-is-not-linux-specific-but-glibc.patch
index e1e1be8c68..4d38fe452e 100644
--- a/meta-networking/recipes-support/libmemcached/files/0002-POSIX_SPAWN_USEVFORK-is-not-linux-specific-but-glibc.patch
+++ b/meta-networking/recipes-support/libmemcached/files/0002-POSIX_SPAWN_USEVFORK-is-not-linux-specific-but-glibc.patch
@@ -9,6 +9,8 @@ cmdline.cc:206:12: error: use of undeclared identifier 'POSIX_SPAWN_USEVFORK'
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  libtest/cmdline.cc | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-networking/recipes-support/libmemcached/files/crosscompile.patch b/meta-networking/recipes-support/libmemcached/files/crosscompile.patch
index 63511bff5f..441b8d4177 100644
--- a/meta-networking/recipes-support/libmemcached/files/crosscompile.patch
+++ b/meta-networking/recipes-support/libmemcached/files/crosscompile.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
  libmemcached/backtrace.cc |    3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
diff --git a/meta-networking/recipes-support/libtalloc/libtalloc/avoid-attr-unless-wanted.patch b/meta-networking/recipes-support/libtalloc/libtalloc/avoid-attr-unless-wanted.patch
index 3c85a8a2d4..fe8d10d6f4 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc/avoid-attr-unless-wanted.patch
+++ b/meta-networking/recipes-support/libtalloc/libtalloc/avoid-attr-unless-wanted.patch
@@ -4,6 +4,8 @@ Date: Fri, 25 Dec 2020 15:10:58 +0900
 Subject: [PATCH] avoid attr unless wanted
 
 ---
+Upstream-Status: Pending
+
  lib/replace/wscript | 4 +---
  1 file changed, 1 insertion(+), 3 deletions(-)
 
diff --git a/meta-networking/recipes-support/libtevent/libtevent/avoid-attr-unless-wanted.patch b/meta-networking/recipes-support/libtevent/libtevent/avoid-attr-unless-wanted.patch
index 1e340f3692..e15f14ab78 100644
--- a/meta-networking/recipes-support/libtevent/libtevent/avoid-attr-unless-wanted.patch
+++ b/meta-networking/recipes-support/libtevent/libtevent/avoid-attr-unless-wanted.patch
@@ -4,6 +4,8 @@ Date: Fri, 25 Dec 2020 15:10:58 +0900
 Subject: [PATCH] avoid attr unless wanted
 
 ---
+Upstream-Status: Pending
+
  lib/replace/wscript | 4 +---
  1 file changed, 1 insertion(+), 3 deletions(-)
 
diff --git a/meta-networking/recipes-support/linux-atm/linux-atm/install-from-buildir.patch b/meta-networking/recipes-support/linux-atm/linux-atm/install-from-buildir.patch
index d1380eb2aa..08cb817f77 100644
--- a/meta-networking/recipes-support/linux-atm/linux-atm/install-from-buildir.patch
+++ b/meta-networking/recipes-support/linux-atm/linux-atm/install-from-buildir.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 install binaries from builddir not srcdir.
 
 Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
diff --git a/meta-networking/recipes-support/linux-atm/linux-atm/link-with-ldflags.patch b/meta-networking/recipes-support/linux-atm/linux-atm/link-with-ldflags.patch
index 62fad2a54a..8324040da9 100644
--- a/meta-networking/recipes-support/linux-atm/linux-atm/link-with-ldflags.patch
+++ b/meta-networking/recipes-support/linux-atm/linux-atm/link-with-ldflags.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 LDFLAGS_FOR_BUILD should be required when doing link for qgen.
 
 Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Remove-newline-from-format-line.patch b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Remove-newline-from-format-line.patch
index 1453b75d56..b8fe66f346 100644
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Remove-newline-from-format-line.patch
+++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Remove-newline-from-format-line.patch
@@ -11,6 +11,8 @@ error: '__builtin___snprintf_chk' output truncated before the last format charac
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  addrdb/addrdb.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-addrdb-coord-config-parse.y-add-missing-time.h-inclu.patch b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-addrdb-coord-config-parse.y-add-missing-time.h-inclu.patch
index 0a81a22526..81a3f52d90 100644
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-addrdb-coord-config-parse.y-add-missing-time.h-inclu.patch
+++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-addrdb-coord-config-parse.y-add-missing-time.h-inclu.patch
@@ -21,6 +21,8 @@ Yacc.
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  addrdb/coord-config-parse.y | 4 ++++
  1 file changed, 4 insertions(+)
 
diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-coordinator-Fix-strncpy-range-warning.patch b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-coordinator-Fix-strncpy-range-warning.patch
index 493832bb84..aadfae238d 100644
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-coordinator-Fix-strncpy-range-warning.patch
+++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-coordinator-Fix-strncpy-range-warning.patch
@@ -8,6 +8,8 @@ error: 'strncpy' specified bound 4096 equals destination size [-Werror=stringop-
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  src/coordinator.c | 5 +++--
  1 file changed, 3 insertions(+), 2 deletions(-)
 
diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-src-iz.c-Undef-dprintf-before-redefining.patch b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-src-iz.c-Undef-dprintf-before-redefining.patch
index 68393067d0..fec9b5736d 100644
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-src-iz.c-Undef-dprintf-before-redefining.patch
+++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-src-iz.c-Undef-dprintf-before-redefining.patch
@@ -7,6 +7,8 @@ Clang is picky and warns about macros redefinition
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  src/iz.c | 1 +
  1 file changed, 1 insertion(+)
 
diff --git a/meta-networking/recipes-support/macchanger/macchanger/0001-Fix-musl-build.patch b/meta-networking/recipes-support/macchanger/macchanger/0001-Fix-musl-build.patch
index d36087d550..5231015701 100644
--- a/meta-networking/recipes-support/macchanger/macchanger/0001-Fix-musl-build.patch
+++ b/meta-networking/recipes-support/macchanger/macchanger/0001-Fix-musl-build.patch
@@ -11,6 +11,8 @@ Missing data type is defined in <sys/types.h>.
 
 Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
 ---
+Upstream-Status: Pending
+
  src/netinfo.c | 1 +
  1 file changed, 1 insertion(+)
 
diff --git a/meta-networking/recipes-support/netsniff-ng/files/0001-Cmds-automatically-create-folder.patch b/meta-networking/recipes-support/netsniff-ng/files/0001-Cmds-automatically-create-folder.patch
index e535aedf51..490990d29d 100644
--- a/meta-networking/recipes-support/netsniff-ng/files/0001-Cmds-automatically-create-folder.patch
+++ b/meta-networking/recipes-support/netsniff-ng/files/0001-Cmds-automatically-create-folder.patch
@@ -4,6 +4,8 @@ Date: Mon, 14 Feb 2022 18:37:22 +0100
 Subject: [PATCH] Cmds: automatically create folder
 
 ---
+Upstream-Status: Pending
+
  Cmds | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
diff --git a/meta-networking/recipes-support/ntp/ntp/ntp-4.2.4_p6-nano.patch b/meta-networking/recipes-support/ntp/ntp/ntp-4.2.4_p6-nano.patch
index d45b7e38b7..d8e0ad3309 100644
--- a/meta-networking/recipes-support/ntp/ntp/ntp-4.2.4_p6-nano.patch
+++ b/meta-networking/recipes-support/ntp/ntp/ntp-4.2.4_p6-nano.patch
@@ -3,6 +3,8 @@ From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Wed, 12 Jan 2011 21:38:46 +0100
 
 ---
+Upstream-Status: Pending
+
  include/ntp_syscall.h | 8 ++++++++
  1 file changed, 8 insertions(+)
 
diff --git a/meta-networking/recipes-support/ntp/ntp/reproducibility-fixed-path-to-posix-shell.patch b/meta-networking/recipes-support/ntp/ntp/reproducibility-fixed-path-to-posix-shell.patch
index 1961ada9b6..036c61a78f 100644
--- a/meta-networking/recipes-support/ntp/ntp/reproducibility-fixed-path-to-posix-shell.patch
+++ b/meta-networking/recipes-support/ntp/ntp/reproducibility-fixed-path-to-posix-shell.patch
@@ -1,5 +1,7 @@
 reproducibility fixed path to posixshell
 ---
+Upstream-Status: Pending
+
  sntp/libopts/m4/libopts.m4 | 7 -------
  1 file changed, 7 deletions(-)
 
diff --git a/meta-networking/recipes-support/ntpsec/ntpsec/0001-wscript-Add-BISONFLAGS-support.patch b/meta-networking/recipes-support/ntpsec/ntpsec/0001-wscript-Add-BISONFLAGS-support.patch
index 2e3730df47..fb29fdc47e 100644
--- a/meta-networking/recipes-support/ntpsec/ntpsec/0001-wscript-Add-BISONFLAGS-support.patch
+++ b/meta-networking/recipes-support/ntpsec/ntpsec/0001-wscript-Add-BISONFLAGS-support.patch
@@ -4,6 +4,8 @@ Date: Thu, 19 Jan 2023 13:00:45 +0000
 Subject: [PATCH] wscript: Add BISONFLAGS support
 
 ---
+Upstream-Status: Pending
+
  wscript | 2 ++
  1 file changed, 2 insertions(+)
 
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0002-Use-configure-test-for-struct-timespec.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0002-Use-configure-test-for-struct-timespec.patch
index aa5ffde418..c6af3d5ff7 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0002-Use-configure-test-for-struct-timespec.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0002-Use-configure-test-for-struct-timespec.patch
@@ -8,6 +8,8 @@ to keep track of what platforms has it.
 
 Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
 ---
+Upstream-Status: Pending
+
  open-vm-tools/configure.ac           | 1 +
  open-vm-tools/lib/include/hgfsUtil.h | 8 +-------
  2 files changed, 2 insertions(+), 7 deletions(-)
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0003-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0003-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch
index 24279e34a0..4b6e089ace 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0003-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0003-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch
@@ -10,6 +10,8 @@ This is needed for musl libc.
 
 Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
 ---
+Upstream-Status: Pending
+
  open-vm-tools/lib/hgfsServer/hgfsServerLinux.c      | 8 +++++---
  open-vm-tools/services/plugins/dndcp/dnd/dndLinux.c | 3 +--
  2 files changed, 6 insertions(+), 5 deletions(-)
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0004-Use-configure-to-test-for-feature-instead-of-platfor.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0004-Use-configure-to-test-for-feature-instead-of-platfor.patch
index 613bba2126..9fe0126d30 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0004-Use-configure-to-test-for-feature-instead-of-platfor.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0004-Use-configure-to-test-for-feature-instead-of-platfor.patch
@@ -23,6 +23,8 @@ Refit patch of open-vm-tools/lib/nicInfo/nicInfoPosix.c
 Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
 Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
 ---
+Upstream-Status: Pending
+
  open-vm-tools/configure.ac               |  4 ++++
  open-vm-tools/lib/misc/idLinux.c         | 30 +++++++++++-------------
  open-vm-tools/lib/nicInfo/nicInfoPosix.c |  6 ++++-
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0005-Use-configure-test-for-sys-stat.h-include.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0005-Use-configure-test-for-sys-stat.h-include.patch
index b52f242481..ec9aa7d2ed 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0005-Use-configure-test-for-sys-stat.h-include.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0005-Use-configure-test-for-sys-stat.h-include.patch
@@ -7,6 +7,8 @@ This is needed for musl libc.
 
 Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
 ---
+Upstream-Status: Pending
+
  open-vm-tools/services/plugins/vix/vixTools.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0006-Fix-subdir-objects-configure-error.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0006-Fix-subdir-objects-configure-error.patch
index cb30966afe..e83fb36214 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0006-Fix-subdir-objects-configure-error.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0006-Fix-subdir-objects-configure-error.patch
@@ -7,6 +7,8 @@ Fix build on musl while here
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  open-vm-tools/configure.ac | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
 
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0007-include-poll.h-instead-of-sys-poll.h.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0007-include-poll.h-instead-of-sys-poll.h.patch
index ff5fee6d4e..7eac04ab56 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0007-include-poll.h-instead-of-sys-poll.h.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0007-include-poll.h-instead-of-sys-poll.h.patch
@@ -7,6 +7,8 @@ including sys/poll.h is deprecated
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  open-vm-tools/lib/asyncsocket/asyncsocket.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0008-Rename-poll.h-to-vm_poll.h.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0008-Rename-poll.h-to-vm_poll.h.patch
index b3906e827a..d9000b4f13 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0008-Rename-poll.h-to-vm_poll.h.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0008-Rename-poll.h-to-vm_poll.h.patch
@@ -17,6 +17,8 @@ Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
 ---
+Upstream-Status: Pending
+
  open-vm-tools/lib/asyncsocket/asyncsocket.c     | 2 +-
  open-vm-tools/lib/hgfsServer/hgfsServer.c       | 2 +-
  open-vm-tools/lib/include/asyncsocket.h         | 2 +-
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0009-use-posix-strerror_r-unless-on-gnu-libc-system.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0009-use-posix-strerror_r-unless-on-gnu-libc-system.patch
index 9ae1a8e6b8..9800194920 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0009-use-posix-strerror_r-unless-on-gnu-libc-system.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0009-use-posix-strerror_r-unless-on-gnu-libc-system.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] use posix strerror_r unless on gnu libc system
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  open-vm-tools/lib/err/errPosix.c | 9 ++++++---
  1 file changed, 6 insertions(+), 3 deletions(-)
 
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0010-Use-uintmax_t-for-handling-rlim_t.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0010-Use-uintmax_t-for-handling-rlim_t.patch
index 36d0c641ae..d3c9149f77 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0010-Use-uintmax_t-for-handling-rlim_t.patch
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0010-Use-uintmax_t-for-handling-rlim_t.patch
@@ -13,6 +13,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
 Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
 ---
+Upstream-Status: Pending
+
  open-vm-tools/lib/hgfsServer/hgfsServerLinux.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
diff --git a/meta-networking/recipes-support/pimd/pimd/0001-configure-Dont-use-uname-to-determine-target-OS.patch b/meta-networking/recipes-support/pimd/pimd/0001-configure-Dont-use-uname-to-determine-target-OS.patch
index eb549ded9d..cacb84a1ca 100644
--- a/meta-networking/recipes-support/pimd/pimd/0001-configure-Dont-use-uname-to-determine-target-OS.patch
+++ b/meta-networking/recipes-support/pimd/pimd/0001-configure-Dont-use-uname-to-determine-target-OS.patch
@@ -7,6 +7,8 @@ Helps with cross-compiling
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  configure | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/disable-documentation.patch b/meta-networking/recipes-support/tinyproxy/tinyproxy/disable-documentation.patch
index 364baaa000..faefd1d4ea 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy/disable-documentation.patch
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/disable-documentation.patch
@@ -3,6 +3,8 @@ From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
 Date: Thu, 20 Apr 2017 14:25:18 +0200
 
 ---
+Upstream-Status: Pending
+
  Makefile.am  |  1 -
  configure.ac | 17 -----------------
  2 files changed, 18 deletions(-)
diff --git a/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-init-script.patch b/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-init-script.patch
index 7168a352f7..7bcf972612 100644
--- a/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-init-script.patch
+++ b/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-init-script.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] contrib: add yocto compatible init script
 
 Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
 ---
+Upstream-Status: Pending
+
  contrib/unbound.init | 20 ++++++++++----------
  1 file changed, 10 insertions(+), 10 deletions(-)
 
diff --git a/meta-oe/recipes-benchmark/iperf2/iperf2/0001-Detect-bool-definition-considering-stdbool.h-being-p.patch b/meta-oe/recipes-benchmark/iperf2/iperf2/0001-Detect-bool-definition-considering-stdbool.h-being-p.patch
index 45c69ca067..dc3b85f8ef 100644
--- a/meta-oe/recipes-benchmark/iperf2/iperf2/0001-Detect-bool-definition-considering-stdbool.h-being-p.patch
+++ b/meta-oe/recipes-benchmark/iperf2/iperf2/0001-Detect-bool-definition-considering-stdbool.h-being-p.patch
@@ -13,6 +13,8 @@ template <>          struct __libcpp_is_integral<int>                : public tr
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  m4/dast.m4 | 7 ++++++-
  1 file changed, 6 insertions(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/0002-Remove-pg-from-profile_CFLAGS.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/0002-Remove-pg-from-profile_CFLAGS.patch
index 7870261ee6..ff1ea05bcb 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3/0002-Remove-pg-from-profile_CFLAGS.patch
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3/0002-Remove-pg-from-profile_CFLAGS.patch
@@ -9,6 +9,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 
 ---
+Upstream-Status: Pending
+
  src/Makefile.am | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-include-stddef.h-for-ptrdiff_t.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-include-stddef.h-for-ptrdiff_t.patch
index a84414c024..914b0514f8 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-include-stddef.h-for-ptrdiff_t.patch
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-include-stddef.h-for-ptrdiff_t.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] include stddef.h for ptrdiff_t
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  morecore.c | 1 +
  1 file changed, 1 insertion(+)
 
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0002-Mark-glibc-specific-code-so.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0002-Mark-glibc-specific-code-so.patch
index 8cb184a651..7ad6c43eb1 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0002-Mark-glibc-specific-code-so.patch
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0002-Mark-glibc-specific-code-so.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] Mark glibc specific code so
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  morecore.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0003-alloc.c-Avoid-sysconf-_SC_LEVEL2_CACHE_LINESIZE-on-l.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0003-alloc.c-Avoid-sysconf-_SC_LEVEL2_CACHE_LINESIZE-on-l.patch
index aca7e803d0..858a8e511a 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0003-alloc.c-Avoid-sysconf-_SC_LEVEL2_CACHE_LINESIZE-on-l.patch
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0003-alloc.c-Avoid-sysconf-_SC_LEVEL2_CACHE_LINESIZE-on-l.patch
@@ -8,6 +8,8 @@ musl does not have it
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  alloc.c | 15 ++++++++++++++-
  1 file changed, 14 insertions(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0004-shm.c-Mark-glibc-specific-changes-so.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0004-shm.c-Mark-glibc-specific-changes-so.patch
index 58776e8710..c3f7b3e479 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0004-shm.c-Mark-glibc-specific-changes-so.patch
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0004-shm.c-Mark-glibc-specific-changes-so.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] shm.c: Mark glibc specific changes so
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  shm.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0005-Include-dirent.h-for-ino_t.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0005-Include-dirent.h-for-ino_t.patch
index e736cbc791..8bd1633392 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0005-Include-dirent.h-for-ino_t.patch
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0005-Include-dirent.h-for-ino_t.patch
@@ -11,6 +11,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Update for 2.22.
 Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
 ---
+Upstream-Status: Pending
+
  tests/hugetests.h | 1 +
  1 file changed, 1 insertion(+)
 
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0006-include-limits.h-for-PATH_MAX.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0006-include-limits.h-for-PATH_MAX.patch
index 2ead21fb46..e4f8030961 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0006-include-limits.h-for-PATH_MAX.patch
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0006-include-limits.h-for-PATH_MAX.patch
@@ -10,6 +10,8 @@ error: 'PATH_MAX' undeclared
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  hugeadm.c                | 1 +
  tests/gethugepagesizes.c | 1 +
  2 files changed, 2 insertions(+)
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench/0001-doc-Fix-typos-in-lat_unix_connect-manual-page.patch b/meta-oe/recipes-benchmark/lmbench/lmbench/0001-doc-Fix-typos-in-lat_unix_connect-manual-page.patch
index d49dac5b20..9014f80ab6 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench/0001-doc-Fix-typos-in-lat_unix_connect-manual-page.patch
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench/0001-doc-Fix-typos-in-lat_unix_connect-manual-page.patch
@@ -5,6 +5,8 @@ Subject: [PATCH 1/2] doc: Fix typos in lat_unix_connect manual page
 
 Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
 ---
+Upstream-Status: Pending
+
  doc/lat_unix_connect.8 | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench/0001-doc-Fix-typos-in-manual-pages.patch b/meta-oe/recipes-benchmark/lmbench/lmbench/0001-doc-Fix-typos-in-manual-pages.patch
index b27e6c9fe0..b960a7d19f 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench/0001-doc-Fix-typos-in-manual-pages.patch
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench/0001-doc-Fix-typos-in-manual-pages.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] doc: Fix typos in manual pages
 
 Signed-off-by: He Zhe <zhe.he@windriver.com>
 ---
+Upstream-Status: Pending
+
  doc/bw_mem.8     | 2 +-
  doc/lat_fcntl.8  | 2 +-
  doc/lat_fifo.8   | 2 +-
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench/0001-lat_fifo-Fix-cleanup-sequence.patch b/meta-oe/recipes-benchmark/lmbench/lmbench/0001-lat_fifo-Fix-cleanup-sequence.patch
index 42b14cecee..b46c5fae76 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench/0001-lat_fifo-Fix-cleanup-sequence.patch
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench/0001-lat_fifo-Fix-cleanup-sequence.patch
@@ -7,6 +7,8 @@ Files should be unlinked after all users exit.
 
 Signed-off-by: He Zhe <zhe.he@windriver.com>
 ---
+Upstream-Status: Pending
+
  src/lat_fifo.c | 12 ++++++------
  1 file changed, 6 insertions(+), 6 deletions(-)
 
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench/0001-lat_http.c-Add-printf-format.patch b/meta-oe/recipes-benchmark/lmbench/lmbench/0001-lat_http.c-Add-printf-format.patch
index 943b3ec889..eaa4ad0814 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench/0001-lat_http.c-Add-printf-format.patch
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench/0001-lat_http.c-Add-printf-format.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] lat_http.c: Add printf format
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  src/lat_http.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench/0001-lmbench-Point-webpage-lm-to-target-directory.patch b/meta-oe/recipes-benchmark/lmbench/lmbench/0001-lmbench-Point-webpage-lm-to-target-directory.patch
index 4a26b8ea7a..7b713a3243 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench/0001-lmbench-Point-webpage-lm-to-target-directory.patch
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench/0001-lmbench-Point-webpage-lm-to-target-directory.patch
@@ -8,6 +8,8 @@ Plus improve 'hello' copying in lmbench script.
 
 Signed-off-by: He Zhe <zhe.he@windriver.com>
 ---
+Upstream-Status: Pending
+
  scripts/lmbench | 18 +++++++++---------
  1 file changed, 9 insertions(+), 9 deletions(-)
 
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench/0002-build-Adjust-CFLAGS-LDFLAGS-to-append-values-passed-.patch b/meta-oe/recipes-benchmark/lmbench/lmbench/0002-build-Adjust-CFLAGS-LDFLAGS-to-append-values-passed-.patch
index 1d5d9c12ab..096726cc23 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench/0002-build-Adjust-CFLAGS-LDFLAGS-to-append-values-passed-.patch
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench/0002-build-Adjust-CFLAGS-LDFLAGS-to-append-values-passed-.patch
@@ -9,6 +9,8 @@ to link in librirpc, make room for those changes to take effect
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  scripts/build |  2 +-
  src/Makefile  | 14 +++++++-------
  2 files changed, 8 insertions(+), 8 deletions(-)
diff --git a/meta-oe/recipes-benchmark/memtester/files/Makefile.patch b/meta-oe/recipes-benchmark/memtester/files/Makefile.patch
index 971e52ac7f..c6da3b7059 100644
--- a/meta-oe/recipes-benchmark/memtester/files/Makefile.patch
+++ b/meta-oe/recipes-benchmark/memtester/files/Makefile.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] memtester: Added patch to Makefile to change no-longer-supporte
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 ---
+Upstream-Status: Pending
+
  Makefile |    4 ++--
  1 files changed, 2 insertions(+), 2 deletions(-)
 
diff --git a/meta-oe/recipes-benchmark/tinymembench/tinymembench/0001-asm-Delete-.func-.endfunc-directives.patch b/meta-oe/recipes-benchmark/tinymembench/tinymembench/0001-asm-Delete-.func-.endfunc-directives.patch
index c090700763..d69c52bee9 100644
--- a/meta-oe/recipes-benchmark/tinymembench/tinymembench/0001-asm-Delete-.func-.endfunc-directives.patch
+++ b/meta-oe/recipes-benchmark/tinymembench/tinymembench/0001-asm-Delete-.func-.endfunc-directives.patch
@@ -9,6 +9,8 @@ and rightly so.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  aarch64-asm.S | 14 +-------------
  arm-neon.S    | 24 ------------------------
  mips-32.S     |  5 ++---
diff --git a/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils/0001-dont-unset-cflags.patch b/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils/0001-dont-unset-cflags.patch
index fb2f07f073..72f4801000 100644
--- a/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils/0001-dont-unset-cflags.patch
+++ b/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils/0001-dont-unset-cflags.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- git.old/Makefile	2012-04-17 13:29:46.280435340 +0200
 +++ git/Makefile	2012-04-17 13:31:13.664433470 +0200
 @@ -77,17 +77,7 @@ INSTALL_PROGRAM = ${INSTALL}
diff --git a/meta-oe/recipes-connectivity/ace/files/ace_config.patch b/meta-oe/recipes-connectivity/ace/files/ace_config.patch
index 1b8e218658..c820e46522 100644
--- a/meta-oe/recipes-connectivity/ace/files/ace_config.patch
+++ b/meta-oe/recipes-connectivity/ace/files/ace_config.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -ruN ACE_wrappers1/ace/config.h ACE_wrappers/ace/config.h
 --- ACE_wrappers1/ace/config.h	1970-01-01 02:00:00.000000000 +0200
 +++ ACE_wrappers/ace/config.h	2019-01-10 13:36:52.698012477 +0200
diff --git a/meta-oe/recipes-connectivity/gattlib/files/dbus-avoid-strange-chars-from-the-build-dir.patch b/meta-oe/recipes-connectivity/gattlib/files/dbus-avoid-strange-chars-from-the-build-dir.patch
index 96e4f8d6fa..7319280ca4 100644
--- a/meta-oe/recipes-connectivity/gattlib/files/dbus-avoid-strange-chars-from-the-build-dir.patch
+++ b/meta-oe/recipes-connectivity/gattlib/files/dbus-avoid-strange-chars-from-the-build-dir.patch
@@ -14,6 +14,8 @@ the normal include guards and request "#pragma once" instead.
 
 Signed-off-by: Peter Rosin <peda@axentia.se>
 ---
+Upstream-Status: Pending
+
  dbus/CMakeLists.txt | 12 ++++++------
  1 file changed, 6 insertions(+), 6 deletions(-)
 
diff --git a/meta-oe/recipes-connectivity/ifplugd/ifplugd/Fix-build-with-musl.patch b/meta-oe/recipes-connectivity/ifplugd/ifplugd/Fix-build-with-musl.patch
index 35665bd3f2..7dc0067304 100644
--- a/meta-oe/recipes-connectivity/ifplugd/ifplugd/Fix-build-with-musl.patch
+++ b/meta-oe/recipes-connectivity/ifplugd/ifplugd/Fix-build-with-musl.patch
@@ -6,6 +6,8 @@ Organization: O.S. Systems Software LTDA.
 
 Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
 ---
+Upstream-Status: Pending
+
  src/ethtool-local.h | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
diff --git a/meta-oe/recipes-connectivity/libnet/libnet/0001-Use-standard-int64_t-instead-of-__int64_t-for-mingw-.patch b/meta-oe/recipes-connectivity/libnet/libnet/0001-Use-standard-int64_t-instead-of-__int64_t-for-mingw-.patch
index f1c607dd8a..a32414bdf6 100644
--- a/meta-oe/recipes-connectivity/libnet/libnet/0001-Use-standard-int64_t-instead-of-__int64_t-for-mingw-.patch
+++ b/meta-oe/recipes-connectivity/libnet/libnet/0001-Use-standard-int64_t-instead-of-__int64_t-for-mingw-.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] Use standard int64_t instead of __int64_t for mingw cross
 
 Signed-off-by: Joachim Nilsson <troglobit@gmail.com>
 ---
+Upstream-Status: Pending
+
  include/libnet/libnet-structures.h | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
diff --git a/meta-oe/recipes-connectivity/loudmouth/loudmouth-1.4.3/04-use-pkg-config-for-gnutls.patch b/meta-oe/recipes-connectivity/loudmouth/loudmouth-1.4.3/04-use-pkg-config-for-gnutls.patch
index 20f388e890..0fc87abd09 100644
--- a/meta-oe/recipes-connectivity/loudmouth/loudmouth-1.4.3/04-use-pkg-config-for-gnutls.patch
+++ b/meta-oe/recipes-connectivity/loudmouth/loudmouth-1.4.3/04-use-pkg-config-for-gnutls.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Description: use pkg-config to detect gnutls
 Debian: http://bugs.debian.org/529835
 Origin: http://groups.google.com/group/loudmouth-dev/browse_thread/thread/3f78255837048daf#
diff --git a/meta-oe/recipes-connectivity/loudmouth/loudmouth-1.4.3/glib-2.32.patch b/meta-oe/recipes-connectivity/loudmouth/loudmouth-1.4.3/glib-2.32.patch
index b6c9422e8c..921aded943 100644
--- a/meta-oe/recipes-connectivity/loudmouth/loudmouth-1.4.3/glib-2.32.patch
+++ b/meta-oe/recipes-connectivity/loudmouth/loudmouth-1.4.3/glib-2.32.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- loudmouth-1.4.3.orig/loudmouth/lm-error.c	2008-10-29 21:48:15.000000000 +0100
 +++ loudmouth-1.4.3/loudmouth/lm-error.c	2012-05-06 08:27:07.455739440 +0200
 @@ -19,7 +19,6 @@
diff --git a/meta-oe/recipes-connectivity/obexftp/obexftp/0001-apps-CMakeLists.txt-Explicitly-link-libbfb-and-libmu.patch b/meta-oe/recipes-connectivity/obexftp/obexftp/0001-apps-CMakeLists.txt-Explicitly-link-libbfb-and-libmu.patch
index 1f6de87c8d..7a19b6172f 100644
--- a/meta-oe/recipes-connectivity/obexftp/obexftp/0001-apps-CMakeLists.txt-Explicitly-link-libbfb-and-libmu.patch
+++ b/meta-oe/recipes-connectivity/obexftp/obexftp/0001-apps-CMakeLists.txt-Explicitly-link-libbfb-and-libmu.patch
@@ -9,6 +9,8 @@ they are required to be added to link line explicitly.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  apps/CMakeLists.txt | 13 +++++++++++--
  1 file changed, 11 insertions(+), 2 deletions(-)
 
diff --git a/meta-oe/recipes-connectivity/obexftp/obexftp/make_fuse_swig_optional.patch b/meta-oe/recipes-connectivity/obexftp/obexftp/make_fuse_swig_optional.patch
index 84b143bf51..25f2a7d9e7 100644
--- a/meta-oe/recipes-connectivity/obexftp/obexftp/make_fuse_swig_optional.patch
+++ b/meta-oe/recipes-connectivity/obexftp/obexftp/make_fuse_swig_optional.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: obexftp-0.24.2-Source/CMakeLists.txt
 ===================================================================
 --- obexftp-0.24.2-Source.orig/CMakeLists.txt
diff --git a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp/0001-cmake-Use-CMAKE_INSTALL_LIBDIR-and-CMAKE_INSTALL_BIN.patch b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp/0001-cmake-Use-CMAKE_INSTALL_LIBDIR-and-CMAKE_INSTALL_BIN.patch
index 7cf9a8b121..2436b36f2d 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp/0001-cmake-Use-CMAKE_INSTALL_LIBDIR-and-CMAKE_INSTALL_BIN.patch
+++ b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp/0001-cmake-Use-CMAKE_INSTALL_LIBDIR-and-CMAKE_INSTALL_BIN.patch
@@ -7,6 +7,8 @@ This ensures the install paths are not hardcoded.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  cmake/CMakeLists.txt       | 4 ++--
  src/samples/CMakeLists.txt | 4 ++--
  2 files changed, 4 insertions(+), 4 deletions(-)
diff --git a/meta-oe/recipes-connectivity/rfkill/rfkill/0001-rfkill-makefile-don-t-use-t-the-OE-install-wrapper-d.patch b/meta-oe/recipes-connectivity/rfkill/rfkill/0001-rfkill-makefile-don-t-use-t-the-OE-install-wrapper-d.patch
index c6f60d0ede..89a7d6f34a 100644
--- a/meta-oe/recipes-connectivity/rfkill/rfkill/0001-rfkill-makefile-don-t-use-t-the-OE-install-wrapper-d.patch
+++ b/meta-oe/recipes-connectivity/rfkill/rfkill/0001-rfkill-makefile-don-t-use-t-the-OE-install-wrapper-d.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] rfkill makefile: don't use -t, the OE install wrapper dislikes
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
+Upstream-Status: Pending
+
  Makefile |    4 ++--
  1 files changed, 2 insertions(+), 2 deletions(-)
 
diff --git a/meta-oe/recipes-connectivity/rfkill/rfkill/dont.call.git.rev-parse.on.parent.dir.patch b/meta-oe/recipes-connectivity/rfkill/rfkill/dont.call.git.rev-parse.on.parent.dir.patch
index 2b83689127..020419ea8a 100644
--- a/meta-oe/recipes-connectivity/rfkill/rfkill/dont.call.git.rev-parse.on.parent.dir.patch
+++ b/meta-oe/recipes-connectivity/rfkill/rfkill/dont.call.git.rev-parse.on.parent.dir.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 When WORKDIR is included in some other git checkout, version.sh calls git rev-parse
 and it returns some description from that upper git checkout even when rfkill is
 being built from release tarball.
diff --git a/meta-oe/recipes-connectivity/smstools3/smstools3/scripts_no_bash.patch b/meta-oe/recipes-connectivity/smstools3/smstools3/scripts_no_bash.patch
index 49b4d1ddac..e287ae5e73 100644
--- a/meta-oe/recipes-connectivity/smstools3/smstools3/scripts_no_bash.patch
+++ b/meta-oe/recipes-connectivity/smstools3/smstools3/scripts_no_bash.patch
@@ -3,6 +3,8 @@ From: Bill Randle <bill.randle@gmail.com>
 Date: Sun, 31 Dec 2017 09:08:23 -0800
 
 ---
+Upstream-Status: Pending
+
  scripts/sendsms     | 2 +-
  scripts/sms2html    | 2 +-
  scripts/sms2unicode | 2 +-
diff --git a/meta-oe/recipes-connectivity/smstools3/smstools3/sms_binpath.patch b/meta-oe/recipes-connectivity/smstools3/smstools3/sms_binpath.patch
index e1d79d3327..db829744d3 100644
--- a/meta-oe/recipes-connectivity/smstools3/smstools3/sms_binpath.patch
+++ b/meta-oe/recipes-connectivity/smstools3/smstools3/sms_binpath.patch
@@ -3,6 +3,8 @@ From: Kai Ulrich <kaiu@gmx.de>
 Date: Wed, 18 Mar 2015 11:20:53 +0100
 
 ---
+Upstream-Status: Pending
+
  scripts/sms3 | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
diff --git a/meta-oe/recipes-connectivity/wifi-test-suite/files/0003-fix-path-to-usr-sbin-for-script-and-make-script-for-.patch b/meta-oe/recipes-connectivity/wifi-test-suite/files/0003-fix-path-to-usr-sbin-for-script-and-make-script-for-.patch
index a51302a0cb..cfa46ff496 100644
--- a/meta-oe/recipes-connectivity/wifi-test-suite/files/0003-fix-path-to-usr-sbin-for-script-and-make-script-for-.patch
+++ b/meta-oe/recipes-connectivity/wifi-test-suite/files/0003-fix-path-to-usr-sbin-for-script-and-make-script-for-.patch
@@ -6,6 +6,8 @@ Subject: [PATCH 3/3] fix path to /usr/sbin for script and make script for
 
 Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
 ---
+Upstream-Status: Pending
+
  lib/wfa_cs.c           | 4 ++--
  scripts/dev_send_frame | 2 +-
  scripts/sta_reset_parm | 2 +-
diff --git a/meta-oe/recipes-connectivity/wvdial/wvdial/typo_pon.wvdial.1.patch b/meta-oe/recipes-connectivity/wvdial/wvdial/typo_pon.wvdial.1.patch
index eec5a5d646..5f9cf8a31f 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvdial/typo_pon.wvdial.1.patch
+++ b/meta-oe/recipes-connectivity/wvdial/wvdial/typo_pon.wvdial.1.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Remove warnings found by lintian
 Last-Update: 2011-01-09
 Index: wvdial-1.61/pon.wvdial.1
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/0001-Check-for-limits.h-during-configure.patch b/meta-oe/recipes-connectivity/wvdial/wvstreams/0001-Check-for-limits.h-during-configure.patch
index b092ba2fce..42f3e42757 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams/0001-Check-for-limits.h-during-configure.patch
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/0001-Check-for-limits.h-during-configure.patch
@@ -5,6 +5,8 @@ Subject: [PATCH 1/5] Check for limits.h during configure
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  configure.ac | 2 ++
  1 file changed, 2 insertions(+)
 
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/0001-build-fix-parallel-make.patch b/meta-oe/recipes-connectivity/wvdial/wvstreams/0001-build-fix-parallel-make.patch
index 6bc34331d6..954c3d9fca 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams/0001-build-fix-parallel-make.patch
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/0001-build-fix-parallel-make.patch
@@ -7,6 +7,8 @@ Imported from Gentoo
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  Makefile         | 15 +++++++++++++--
  wvrules-posix.mk |  7 +++++--
  2 files changed, 18 insertions(+), 4 deletions(-)
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/0002-wvrules.mk-Use-_DEFAULT_SOURCE.patch b/meta-oe/recipes-connectivity/wvdial/wvstreams/0002-wvrules.mk-Use-_DEFAULT_SOURCE.patch
index 59f70e380d..5b7135c3f3 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams/0002-wvrules.mk-Use-_DEFAULT_SOURCE.patch
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/0002-wvrules.mk-Use-_DEFAULT_SOURCE.patch
@@ -8,6 +8,8 @@ warning: "_BSD_SOURCE and _SVID_SOURCE are deprecated, use _DEFAULT_SOURCE"
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  wvrules.mk | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/0003-wvtask-Check-for-HAVE_LIBC_STACK_END-only-on-glibc-s.patch b/meta-oe/recipes-connectivity/wvdial/wvstreams/0003-wvtask-Check-for-HAVE_LIBC_STACK_END-only-on-glibc-s.patch
index f9304197ae..856c2460b4 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams/0003-wvtask-Check-for-HAVE_LIBC_STACK_END-only-on-glibc-s.patch
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/0003-wvtask-Check-for-HAVE_LIBC_STACK_END-only-on-glibc-s.patch
@@ -6,6 +6,8 @@ Subject: [PATCH 3/5] wvtask: Check for HAVE_LIBC_STACK_END only on glibc
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  utils/wvtask.cc | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/0004-wvcrash-Replace-use-of-basename-API.patch b/meta-oe/recipes-connectivity/wvdial/wvstreams/0004-wvcrash-Replace-use-of-basename-API.patch
index 6f3fbffbdf..f960c98622 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams/0004-wvcrash-Replace-use-of-basename-API.patch
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/0004-wvcrash-Replace-use-of-basename-API.patch
@@ -7,6 +7,8 @@ musl does not have this API
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  utils/wvcrash.cc | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/0005-check-for-libexecinfo-during-configure.patch b/meta-oe/recipes-connectivity/wvdial/wvstreams/0005-check-for-libexecinfo-during-configure.patch
index 25e9ee2369..508007c0ea 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams/0005-check-for-libexecinfo-during-configure.patch
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/0005-check-for-libexecinfo-during-configure.patch
@@ -5,6 +5,8 @@ Subject: [PATCH 5/5] check for libexecinfo during configure
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  configure.ac | 6 ++++++
  1 file changed, 6 insertions(+)
 
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/04_signed_request.diff b/meta-oe/recipes-connectivity/wvdial/wvstreams/04_signed_request.diff
index 5ab633bc3d..50f3f72cd4 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams/04_signed_request.diff
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/04_signed_request.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: wvstreams-4.6/crypto/wvx509.cc
 ===================================================================
 --- wvstreams-4.6.orig/crypto/wvx509.cc	2009-07-29 11:58:16.000000000 -0400
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/05_gcc.diff b/meta-oe/recipes-connectivity/wvdial/wvstreams/05_gcc.diff
index 616843d4ae..6b31f2e10f 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams/05_gcc.diff
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/05_gcc.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: wvstreams-4.6.1/ipstreams/wvunixdgsocket.cc
 ===================================================================
 --- wvstreams-4.6.1.orig/ipstreams/wvunixdgsocket.cc	2011-05-20 00:02:38.391136584 +0200
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/06_gcc-4.7.diff b/meta-oe/recipes-connectivity/wvdial/wvstreams/06_gcc-4.7.diff
index a75067a108..7b05e468a9 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams/06_gcc-4.7.diff
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/06_gcc-4.7.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Description: Fix FTBFS with gcc-4.7
  Small header include change. This is borderlinde cosmetic, but still needed
  to prevent the FTBFS.
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/07_buildflags.diff b/meta-oe/recipes-connectivity/wvdial/wvstreams/07_buildflags.diff
index ec99dcd36a..bd08d81c37 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams/07_buildflags.diff
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/07_buildflags.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: b/gen-cc
 ===================================================================
 --- a/gen-cc
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/argp.patch b/meta-oe/recipes-connectivity/wvdial/wvstreams/argp.patch
index e857213637..ed6e8599e1 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams/argp.patch
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/argp.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Check for argp_parse in libargp and then in libc before using internal version
 
 Index: wvstreams-4.6.1/configure.ac
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/gcc-6.patch b/meta-oe/recipes-connectivity/wvdial/wvstreams/gcc-6.patch
index b084887ba7..899eeb9212 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams/gcc-6.patch
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/gcc-6.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Description: Fix compilation with gcc-6
 Author: Gert Wollny <gw.fossdev@gmail.com>
 Last-Updated: 2016-07-26
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/openssl-buildfix.patch b/meta-oe/recipes-connectivity/wvdial/wvstreams/openssl-buildfix.patch
index 1c7005c2fe..7e372d391d 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams/openssl-buildfix.patch
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/openssl-buildfix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: wvstreams-4.6.1/crypto/wvx509.cc
 ===================================================================
 --- wvstreams-4.6.1.orig/crypto/wvx509.cc
diff --git a/meta-oe/recipes-core/dbus/dbus-daemon-proxy/0001-dbus-daemon-proxy-Return-DBUS_HANDLER_RESULT_NOT_YET.patch b/meta-oe/recipes-core/dbus/dbus-daemon-proxy/0001-dbus-daemon-proxy-Return-DBUS_HANDLER_RESULT_NOT_YET.patch
index 1c2fc3813f..ebcb9e7e24 100644
--- a/meta-oe/recipes-core/dbus/dbus-daemon-proxy/0001-dbus-daemon-proxy-Return-DBUS_HANDLER_RESULT_NOT_YET.patch
+++ b/meta-oe/recipes-core/dbus/dbus-daemon-proxy/0001-dbus-daemon-proxy-Return-DBUS_HANDLER_RESULT_NOT_YET.patch
@@ -9,6 +9,8 @@ not be handled here
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  dbus-daemon-proxy.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0001-pipe.c-Use-a-string-instead-of-char.patch b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0001-pipe.c-Use-a-string-instead-of-char.patch
index 6883f9a0b2..5710c867fa 100644
--- a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0001-pipe.c-Use-a-string-instead-of-char.patch
+++ b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0001-pipe.c-Use-a-string-instead-of-char.patch
@@ -8,6 +8,8 @@ error: invalid conversion from 'char' to 'const void*' [-fpermissive]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  src/pipe.cpp | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-core/emlog/emlog/Drop-use-of-error-h.patch b/meta-oe/recipes-core/emlog/emlog/Drop-use-of-error-h.patch
index 6bfc44cb85..4c5a191ac4 100644
--- a/meta-oe/recipes-core/emlog/emlog/Drop-use-of-error-h.patch
+++ b/meta-oe/recipes-core/emlog/emlog/Drop-use-of-error-h.patch
@@ -10,6 +10,8 @@ friendly it makes sense to avoid glibc-specific code.
 Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
 Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
 ---
+Upstream-Status: Pending
+
  mkemlog.c | 29 ++++++++++++++---------------
  1 file changed, 14 insertions(+), 15 deletions(-)
 
diff --git a/meta-oe/recipes-core/libxml/libxml++/libxml++_ptest.patch b/meta-oe/recipes-core/libxml/libxml++/libxml++_ptest.patch
index dc6198fe98..2172c147c3 100644
--- a/meta-oe/recipes-core/libxml/libxml++/libxml++_ptest.patch
+++ b/meta-oe/recipes-core/libxml/libxml++/libxml++_ptest.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -40,5 +40,8 @@ EXTRA_DIST = \
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/static-libsystemd-pkgconfig.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/static-libsystemd-pkgconfig.patch
index 1f0e911cfc..4f42308471 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/static-libsystemd-pkgconfig.patch
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/static-libsystemd-pkgconfig.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- a/src/libsystemd/libsystemd.pc.in
 +++ b/src/libsystemd/libsystemd.pc.in
 @@ -16,5 +16,5 @@ Name: systemd
diff --git a/meta-oe/recipes-dbs/lmdb/files/0001-Makefile-use-libprefix-instead-of-libdir.patch b/meta-oe/recipes-dbs/lmdb/files/0001-Makefile-use-libprefix-instead-of-libdir.patch
index 2cc98e6d62..3017bcede1 100644
--- a/meta-oe/recipes-dbs/lmdb/files/0001-Makefile-use-libprefix-instead-of-libdir.patch
+++ b/meta-oe/recipes-dbs/lmdb/files/0001-Makefile-use-libprefix-instead-of-libdir.patch
@@ -10,6 +10,8 @@ to be configurable.
 
 Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
 ---
+Upstream-Status: Pending
+
  libraries/liblmdb/Makefile | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
diff --git a/meta-oe/recipes-dbs/lmdb/files/0001-make-set-soname-on-liblmdb.patch b/meta-oe/recipes-dbs/lmdb/files/0001-make-set-soname-on-liblmdb.patch
index 312809d1d2..3dde46573f 100644
--- a/meta-oe/recipes-dbs/lmdb/files/0001-make-set-soname-on-liblmdb.patch
+++ b/meta-oe/recipes-dbs/lmdb/files/0001-make-set-soname-on-liblmdb.patch
@@ -4,6 +4,8 @@ Date: Thu, 25 Aug 2022 17:22:20 -0400
 Subject: [PATCH] make: set soname on liblmdb
 
 ---
+Upstream-Status: Pending
+
  libraries/liblmdb/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-library-LZ4-lookup.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-library-LZ4-lookup.patch
index 6d9352fe86..d8671b76b0 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-library-LZ4-lookup.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-library-LZ4-lookup.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] Fix library LZ4 lookup.
 Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
+Upstream-Status: Pending
+
  cmake/FindLZ4.cmake | 9 +++++++--
  1 file changed, 7 insertions(+), 2 deletions(-)
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exists-before-using-it.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exists-before-using-it.patch
index 6ed174113b..aba9b9d966 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exists-before-using-it.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exists-before-using-it.patch
@@ -13,6 +13,8 @@ tpool/aio_linux.cc:63:20: error: '__NR_io_getevents' was not declared in this sc
 Upstream-Staus: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  tpool/aio_linux.cc | 4 ++++
  1 file changed, 4 insertions(+)
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/lfs64.patch b/meta-oe/recipes-dbs/mysql/mariadb/lfs64.patch
index 9867908c6c..7a685a6521 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/lfs64.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/lfs64.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- a/storage/connect/os.h
 +++ b/storage/connect/os.h
 @@ -2,13 +2,15 @@
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch b/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
index 347fcd8516..6aa6c84882 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- a/storage/rocksdb/rocksdb/port/jemalloc_helper.h
 +++ b/storage/rocksdb/rocksdb/port/jemalloc_helper.h
 @@ -5,7 +5,7 @@
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch b/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
index a4deee6070..3787b74ad1 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Remove glibc specific function dependencies
 
 Sourced from: https://git.alpinelinux.org/aports/tree/main/mariadb/ppc-remove-glibc-dep.patch
diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch b/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch
index 8ba685cfe1..7a4ba9897c 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] Add support for RISC-V.
 The architecture is sufficiently similar to aarch64 that simply
 extending the existing aarch64 macro works.
 ---
+Upstream-Status: Pending
+
  src/include/storage/s_lock.h | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-replace-old-sync-with-new-atomic-builtin-equivalents.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-replace-old-sync-with-new-atomic-builtin-equivalents.patch
index 4aa91d9b26..c98623360f 100644
--- a/meta-oe/recipes-dbs/rocksdb/files/0001-replace-old-sync-with-new-atomic-builtin-equivalents.patch
+++ b/meta-oe/recipes-dbs/rocksdb/files/0001-replace-old-sync-with-new-atomic-builtin-equivalents.patch
@@ -8,6 +8,8 @@ __sync* builtins are not implemented atleast for 64bit values
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  .../range/range_tree/lib/portability/toku_atomic.h   | 12 ++++++------
  1 file changed, 6 insertions(+), 6 deletions(-)
 
diff --git a/meta-oe/recipes-dbs/rocksdb/files/arm.patch b/meta-oe/recipes-dbs/rocksdb/files/arm.patch
index 573767797d..3066aa8279 100644
--- a/meta-oe/recipes-dbs/rocksdb/files/arm.patch
+++ b/meta-oe/recipes-dbs/rocksdb/files/arm.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 implement timer for arm >= v6
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
diff --git a/meta-oe/recipes-dbs/rocksdb/files/mips.patch b/meta-oe/recipes-dbs/rocksdb/files/mips.patch
index 0104d54347..cea70352d1 100644
--- a/meta-oe/recipes-dbs/rocksdb/files/mips.patch
+++ b/meta-oe/recipes-dbs/rocksdb/files/mips.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 implement timer implementation for mips platform
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
diff --git a/meta-oe/recipes-dbs/rocksdb/files/ppc64.patch b/meta-oe/recipes-dbs/rocksdb/files/ppc64.patch
index 211c1c720b..273b8fe2ed 100644
--- a/meta-oe/recipes-dbs/rocksdb/files/ppc64.patch
+++ b/meta-oe/recipes-dbs/rocksdb/files/ppc64.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 implement support for musl/ppc64
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0002-Remove-maes-option-from-cross-compilation.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0002-Remove-maes-option-from-cross-compilation.patch
index 7b7244b491..b92a487523 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0002-Remove-maes-option-from-cross-compilation.patch
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0002-Remove-maes-option-from-cross-compilation.patch
@@ -4,6 +4,8 @@ Date: Mon, 3 Feb 2020 03:25:57 +0000
 Subject: [PATCH 2/3] Remove maes option from cross-compilation
 
 ---
+Upstream-Status: Pending
+
  absl/copts/GENERATED_AbseilCopts.cmake | 4 ----
  absl/copts/GENERATED_copts.bzl         | 4 ----
  2 files changed, 8 deletions(-)
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0003-Remove-neon-option-from-cross-compilation.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0003-Remove-neon-option-from-cross-compilation.patch
index c0039c2107..1a80a428b7 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0003-Remove-neon-option-from-cross-compilation.patch
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0003-Remove-neon-option-from-cross-compilation.patch
@@ -8,6 +8,8 @@ them.
 
 Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
 ---
+Upstream-Status: Pending
+
  absl/copts/GENERATED_AbseilCopts.cmake | 4 ----
  absl/copts/GENERATED_copts.bzl         | 4 ----
  2 files changed, 8 deletions(-)
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/abseil-ppc-fixes.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/abseil-ppc-fixes.patch
index 9b408259f9..f2ebd9f08c 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/abseil-ppc-fixes.patch
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/abseil-ppc-fixes.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 An all-in-one patch that fixes several issues:
 
 1) UnscaledCycleClock not fully implemented for ppc*-musl (disabled on musl)
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/build/0001-Riscv-Add-risc-v-Android-config-header.patch b/meta-oe/recipes-devtools/android-tools/android-tools/build/0001-Riscv-Add-risc-v-Android-config-header.patch
index 57c443b707..c091fd404b 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/build/0001-Riscv-Add-risc-v-Android-config-header.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/build/0001-Riscv-Add-risc-v-Android-config-header.patch
@@ -4,6 +4,8 @@ Date: Mon, 20 Apr 2020 15:32:40 +0800
 Subject: [PATCH 1/1] Riscv: Add risc-v Android config header
 
 ---
+Upstream-Status: Pending
+
  .../arch/linux-riscv64/AndroidConfig.h        | 340 ++++++++++++++++++
  1 file changed, 340 insertions(+)
  create mode 100644 core/combo/include/arch/linux-riscv64/AndroidConfig.h
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0004-adb-Fix-build-on-big-endian-systems.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/0004-adb-Fix-build-on-big-endian-systems.patch
index 79e9d4d3b2..7f03cd2beb 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0004-adb-Fix-build-on-big-endian-systems.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/core/0004-adb-Fix-build-on-big-endian-systems.patch
@@ -18,6 +18,8 @@ them to be used when initializing structures.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
+Upstream-Status: Pending
+
  adb/usb_linux_client.c | 11 +++++++++--
  1 file changed, 9 insertions(+), 2 deletions(-)
 
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0005-adb-add-base64-implementation.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/0005-adb-add-base64-implementation.patch
index fcd4ae2388..4827ffe042 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0005-adb-add-base64-implementation.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/core/0005-adb-add-base64-implementation.patch
@@ -7,6 +7,8 @@ musl needs it
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  adb/adb_auth_client.c |   2 +-
  adb/base64.c          | 315 ++++++++++++++++++++++++++++++++++++++++++
  2 files changed, 316 insertions(+), 1 deletion(-)
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0006-adb-Musl-fixes.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/0006-adb-Musl-fixes.patch
index 53f7bcb8e8..182b1eb29e 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0006-adb-Musl-fixes.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/core/0006-adb-Musl-fixes.patch
@@ -9,6 +9,8 @@ Do not redefine close() and lseek()
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  adb/adb.h                    |  2 ++
  adb/disable_verity_service.c | 13 ++++++++-----
  adb/framebuffer_service.c    |  7 ++++---
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0007-adb-usb_linux.c-fix-build-with-glibc-2.28.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/0007-adb-usb_linux.c-fix-build-with-glibc-2.28.patch
index e02a95687f..64fbce4cbe 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0007-adb-usb_linux.c-fix-build-with-glibc-2.28.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/core/0007-adb-usb_linux.c-fix-build-with-glibc-2.28.patch
@@ -7,6 +7,8 @@ Subject: [PATCH] adb: usb_linux.c: fix build with glibc-2.28
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
+Upstream-Status: Pending
+
  adb/usb_linux.c | 1 +
  1 file changed, 1 insertion(+)
 
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0008-adb-Allow-adbd-to-be-ran-as-root.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/0008-adb-Allow-adbd-to-be-ran-as-root.patch
index 7d223e05f1..ad21b5aaa6 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0008-adb-Allow-adbd-to-be-ran-as-root.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/core/0008-adb-Allow-adbd-to-be-ran-as-root.patch
@@ -4,6 +4,8 @@ Date: Mon, 30 Oct 2017 21:05:46 +0100
 Subject: [PATCH] adb: Allow adbd to be ran as root
 
 ---
+Upstream-Status: Pending
+
  adb/adb.c | 1 +
  1 file changed, 1 insertion(+)
 
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0013-adb-Support-riscv64.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/0013-adb-Support-riscv64.patch
index a8434afbad..5138556d63 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0013-adb-Support-riscv64.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/core/0013-adb-Support-riscv64.patch
@@ -4,6 +4,8 @@ Date: Mon, 20 Apr 2020 15:27:22 +0800
 Subject: [PATCH 1/1] adb: Support riscv64
 
 ---
+Upstream-Status: Pending
+
  include/cutils/atomic-inline.h  |   2 +
  include/cutils/atomic-riscv64.h | 156 ++++++++++++++++++++++++++++++++
  2 files changed, 158 insertions(+)
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0014-add-u3-ss-descriptor-support-for-adb.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/0014-add-u3-ss-descriptor-support-for-adb.patch
index 05973aaaf2..cf23f3c251 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0014-add-u3-ss-descriptor-support-for-adb.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/core/0014-add-u3-ss-descriptor-support-for-adb.patch
@@ -12,6 +12,8 @@ modified for backporting to android-tools_5.1.1.r37.
 Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
 Signed-off-by: Jiacheng Liu <jiacheng.liu@mediatek.com>
 ---
+Upstream-Status: Pending
+
  adb/usb_linux_client.c | 275 +++++++++++++++++++++++++++++++----------
  1 file changed, 207 insertions(+), 68 deletions(-)
 
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/adb_libssl_11.diff b/meta-oe/recipes-devtools/android-tools/android-tools/core/adb_libssl_11.diff
index 3ead649b1d..177d69a97a 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/adb_libssl_11.diff
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/core/adb_libssl_11.diff
@@ -4,8 +4,12 @@ Description: adb: Make compatible with openssl 1.1
 Author: Chirayu Desai <chirayudesai1@gmail.com
 Last-Update: 2016-11-10
 ---
+Upstream-Status: Pending
+
 This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
 ---
+Upstream-Status: Pending
+
  system/core/adb/adb_auth_host.c |    5 +++--
  1 file changed, 3 insertions(+), 2 deletions(-)
 
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-libselinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch b/meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-libselinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch
index 87771cba85..8b5e4cf999 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-libselinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-libselinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch
@@ -24,6 +24,8 @@ Signed-off-by: Petr Lautrbach <plautrba@redhat.com>
 Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  src/procattr.c | 14 +++++++++++++-
  1 file changed, 13 insertions(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0001-Do-not-add-stack-pointer-to-clobber-list.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0001-Do-not-add-stack-pointer-to-clobber-list.patch
index 6e58490980..e572022684 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad/0001-Do-not-add-stack-pointer-to-clobber-list.patch
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/0001-Do-not-add-stack-pointer-to-clobber-list.patch
@@ -13,6 +13,8 @@ so it should not cause change in behavior.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  linux_syscall_support.h | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0001-Turn-off-sign-compare-for-musl-libc.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0001-Turn-off-sign-compare-for-musl-libc.patch
index 6b8d011d8b..b2d2c72cb1 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad/0001-Turn-off-sign-compare-for-musl-libc.patch
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/0001-Turn-off-sign-compare-for-musl-libc.patch
@@ -10,6 +10,8 @@ Fix
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  src/client/linux/crash_generation/crash_generation_server.cc | 10 ++++++++++
  1 file changed, 10 insertions(+)
 
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0001-include-sys-reg.h-to-get-__WORDSIZE-on-musl-libc.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0001-include-sys-reg.h-to-get-__WORDSIZE-on-musl-libc.patch
index 3dc55cf1fc..87e00c2422 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad/0001-include-sys-reg.h-to-get-__WORDSIZE-on-musl-libc.patch
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/0001-include-sys-reg.h-to-get-__WORDSIZE-on-musl-libc.patch
@@ -4,6 +4,8 @@ Date: Sun, 1 Feb 2015 14:26:52 +0100
 Subject: [PATCH 1/3] include <sys/reg.h> to get __WORDSIZE on musl libc
 
 ---
+Upstream-Status: Pending
+
  src/common/linux/elf_core_dump.h | 1 +
  1 file changed, 1 insertion(+)
 
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0001-lss-Match-syscalls-to-match-musl.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0001-lss-Match-syscalls-to-match-musl.patch
index bdd787afd5..f2d1fe681d 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad/0001-lss-Match-syscalls-to-match-musl.patch
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/0001-lss-Match-syscalls-to-match-musl.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] lss: Match syscalls to match musl
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  linux_syscall_support.h | 3 +++
  1 file changed, 3 insertions(+)
 
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0003-Dont-include-stab.h.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0003-Dont-include-stab.h.patch
index 76b2088b01..cd5546d761 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad/0003-Dont-include-stab.h.patch
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/0003-Dont-include-stab.h.patch
@@ -5,6 +5,8 @@ Subject: [PATCH 3/5] Dont include stab.h
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  src/common/stabs_reader.cc          |  1 -
  src/common/stabs_reader.h           | 12 +++++++++++-
  src/common/stabs_reader_unittest.cc |  1 -
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0003-Fix-conflict-between-musl-libc-dirent.h-and-lss.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0003-Fix-conflict-between-musl-libc-dirent.h-and-lss.patch
index 851004704f..aa89959e9f 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad/0003-Fix-conflict-between-musl-libc-dirent.h-and-lss.patch
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/0003-Fix-conflict-between-musl-libc-dirent.h-and-lss.patch
@@ -6,6 +6,8 @@ Subject: [PATCH 3/3] Fix conflict between musl libc <dirent.h> and lss
 Include <dirent.h> late to avoid the macro getdents64 in musl
 libc's <dirent.h> to conflict with linux_sycall_support.h.
 ---
+Upstream-Status: Pending
+
  src/client/linux/crash_generation/crash_generation_server.cc | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0004-elf_reader.cc-include-sys-reg.h-to-get-__WORDSIZE-on.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0004-elf_reader.cc-include-sys-reg.h-to-get-__WORDSIZE-on.patch
index 5892cfa7d6..b4bccb44cb 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad/0004-elf_reader.cc-include-sys-reg.h-to-get-__WORDSIZE-on.patch
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/0004-elf_reader.cc-include-sys-reg.h-to-get-__WORDSIZE-on.patch
@@ -6,6 +6,8 @@ Subject: [PATCH 4/5] elf_reader.cc: include <sys/reg.h> to get __WORDSIZE on
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  src/common/dwarf/elf_reader.cc | 1 +
  1 file changed, 1 insertion(+)
 
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/mips_asm_sgidefs.patch b/meta-oe/recipes-devtools/breakpad/breakpad/mips_asm_sgidefs.patch
index 96f5f48cc8..77d08399bf 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad/mips_asm_sgidefs.patch
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/mips_asm_sgidefs.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- a/linux_syscall_support.h
 +++ b/linux_syscall_support.h
 @@ -119,14 +119,7 @@ extern "C" {
diff --git a/meta-oe/recipes-devtools/dmalloc/dmalloc/0001-undefined-strdup-macro.patch b/meta-oe/recipes-devtools/dmalloc/dmalloc/0001-undefined-strdup-macro.patch
index ea940e9932..a3a3df4a7b 100644
--- a/meta-oe/recipes-devtools/dmalloc/dmalloc/0001-undefined-strdup-macro.patch
+++ b/meta-oe/recipes-devtools/dmalloc/dmalloc/0001-undefined-strdup-macro.patch
@@ -8,6 +8,8 @@ system header.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  dmalloc.h.3 | 3 +++
  1 file changed, 3 insertions(+)
 
diff --git a/meta-oe/recipes-devtools/dmalloc/dmalloc/02-Makefile.in.patch b/meta-oe/recipes-devtools/dmalloc/dmalloc/02-Makefile.in.patch
index 967643badc..ba65d394f0 100644
--- a/meta-oe/recipes-devtools/dmalloc/dmalloc/02-Makefile.in.patch
+++ b/meta-oe/recipes-devtools/dmalloc/dmalloc/02-Makefile.in.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Description: Changes for building shared libraries
  This patch includes changes for building shared libraries with PIC object
  files and the correct soname and libname.
diff --git a/meta-oe/recipes-devtools/dmalloc/dmalloc/03-threads.patch b/meta-oe/recipes-devtools/dmalloc/dmalloc/03-threads.patch
index be09452573..9cbc0a2884 100644
--- a/meta-oe/recipes-devtools/dmalloc/dmalloc/03-threads.patch
+++ b/meta-oe/recipes-devtools/dmalloc/dmalloc/03-threads.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Description: Fix LOCK_THREADS in settings.dist
  This patch takes into account that if --enable-threads is used, LOCK_THREADS
  doesn't get updated
diff --git a/meta-oe/recipes-devtools/dmalloc/dmalloc/100-use-xtools.patch b/meta-oe/recipes-devtools/dmalloc/dmalloc/100-use-xtools.patch
index e1db690599..94ca93647f 100644
--- a/meta-oe/recipes-devtools/dmalloc/dmalloc/100-use-xtools.patch
+++ b/meta-oe/recipes-devtools/dmalloc/dmalloc/100-use-xtools.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 This patch makes configure use the cross ld and ar rather than the native tools.
 
 It was build up by Yann E. MORIN <yann.morin.1998@anciens.enib.fr> from some
diff --git a/meta-oe/recipes-devtools/dmalloc/dmalloc/13-fix-ldflags-in-makefile.patch b/meta-oe/recipes-devtools/dmalloc/dmalloc/13-fix-ldflags-in-makefile.patch
index 2581e54880..3b7344dbf9 100644
--- a/meta-oe/recipes-devtools/dmalloc/dmalloc/13-fix-ldflags-in-makefile.patch
+++ b/meta-oe/recipes-devtools/dmalloc/dmalloc/13-fix-ldflags-in-makefile.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: dmalloc-5.5.2/Makefile.in
 ===================================================================
 --- dmalloc-5.5.2.orig/Makefile.in
diff --git a/meta-oe/recipes-devtools/dmalloc/dmalloc/130-mips.patch b/meta-oe/recipes-devtools/dmalloc/dmalloc/130-mips.patch
index 935ac983a6..18f5993e47 100644
--- a/meta-oe/recipes-devtools/dmalloc/dmalloc/130-mips.patch
+++ b/meta-oe/recipes-devtools/dmalloc/dmalloc/130-mips.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Patch to correctly handle the MIPS case.
 
 It was build up by Yann E. MORIN <yann.morin.1998@anciens.enib.fr> from some
diff --git a/meta-oe/recipes-devtools/dmalloc/dmalloc/150-use_DESTDIR.patch b/meta-oe/recipes-devtools/dmalloc/dmalloc/150-use_DESTDIR.patch
index 7edd46412a..1a9b0060b9 100644
--- a/meta-oe/recipes-devtools/dmalloc/dmalloc/150-use_DESTDIR.patch
+++ b/meta-oe/recipes-devtools/dmalloc/dmalloc/150-use_DESTDIR.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Make install rules use DESTDIR.
 Split installation of the utilitity from the global install.
 
diff --git a/meta-oe/recipes-devtools/dmalloc/dmalloc/configure-pagesize-HACK.patch b/meta-oe/recipes-devtools/dmalloc/dmalloc/configure-pagesize-HACK.patch
index a5bd736610..9c928fc438 100644
--- a/meta-oe/recipes-devtools/dmalloc/dmalloc/configure-pagesize-HACK.patch
+++ b/meta-oe/recipes-devtools/dmalloc/dmalloc/configure-pagesize-HACK.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 We cant run tests during cross compile therefore pin to 4k pages
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch b/meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch
index 2f1483f97c..b245ad8657 100644
--- a/meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch
+++ b/meta-oe/recipes-devtools/grpc/grpc/0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch
@@ -33,6 +33,8 @@ core2-64-oe-linux/sysdig/0.27.1-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  include/grpcpp/impl/codegen/sync.h | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
diff --git a/meta-oe/recipes-devtools/jq/jq/0002-builtin-Replace-_BSD_SOURCE-with-_DEFAULT_SOURCE.patch b/meta-oe/recipes-devtools/jq/jq/0002-builtin-Replace-_BSD_SOURCE-with-_DEFAULT_SOURCE.patch
index d2f999a728..e849436578 100644
--- a/meta-oe/recipes-devtools/jq/jq/0002-builtin-Replace-_BSD_SOURCE-with-_DEFAULT_SOURCE.patch
+++ b/meta-oe/recipes-devtools/jq/jq/0002-builtin-Replace-_BSD_SOURCE-with-_DEFAULT_SOURCE.patch
@@ -12,6 +12,8 @@ warning "_BSD_SOURCE and _SVID_SOURCE are deprecated, use _DEFAULT_SOURCE"
 Uptream-Status: Submitted [https://github.com/stedolan/jq/pull/2480]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  src/builtin.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-devtools/libubox/libubox/0001-version-libraries.patch b/meta-oe/recipes-devtools/libubox/libubox/0001-version-libraries.patch
index 02117fa8d6..f82c31ad07 100644
--- a/meta-oe/recipes-devtools/libubox/libubox/0001-version-libraries.patch
+++ b/meta-oe/recipes-devtools/libubox/libubox/0001-version-libraries.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff --git a/CMakeLists.txt b/CMakeLists.txt
 index 57804cf..1aa7f27 100644
 --- a/CMakeLists.txt
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/0001-ARM-code-has-unreachable-code-after-switch-statement.patch b/meta-oe/recipes-devtools/ltrace/ltrace/0001-ARM-code-has-unreachable-code-after-switch-statement.patch
index 4d0e0392f7..c896e3ebb0 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace/0001-ARM-code-has-unreachable-code-after-switch-statement.patch
+++ b/meta-oe/recipes-devtools/ltrace/ltrace/0001-ARM-code-has-unreachable-code-after-switch-statement.patch
@@ -11,6 +11,8 @@ sysdeps/linux-gnu/arm/trace.c:173:33: error: statement will never be executed [-
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  sysdeps/linux-gnu/arm/trace.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/0001-Use-correct-enum-type.patch b/meta-oe/recipes-devtools/ltrace/ltrace/0001-Use-correct-enum-type.patch
index 01a35842c8..38a7d055dc 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace/0001-Use-correct-enum-type.patch
+++ b/meta-oe/recipes-devtools/ltrace/ltrace/0001-Use-correct-enum-type.patch
@@ -7,6 +7,8 @@ Clang warns about wrong enum initializtion
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  sysdeps/linux-gnu/aarch64/fetch.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/0001-configure-Recognise-linux-musl-as-a-host-OS.patch b/meta-oe/recipes-devtools/ltrace/ltrace/0001-configure-Recognise-linux-musl-as-a-host-OS.patch
index 52264a17e6..f3a6d9e599 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace/0001-configure-Recognise-linux-musl-as-a-host-OS.patch
+++ b/meta-oe/recipes-devtools/ltrace/ltrace/0001-configure-Recognise-linux-musl-as-a-host-OS.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] configure: Recognise linux-musl as a host OS
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  configure.ac | 1 +
  1 file changed, 1 insertion(+)
 
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/0001-mips-plt.c-Delete-include-error.h.patch b/meta-oe/recipes-devtools/ltrace/ltrace/0001-mips-plt.c-Delete-include-error.h.patch
index 76ba7de785..ce4dcf8a98 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace/0001-mips-plt.c-Delete-include-error.h.patch
+++ b/meta-oe/recipes-devtools/ltrace/ltrace/0001-mips-plt.c-Delete-include-error.h.patch
@@ -7,6 +7,8 @@ Its not needed
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  sysdeps/linux-gnu/mips/plt.c | 1 -
  1 file changed, 1 deletion(-)
 
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/0001-ppc-Remove-unused-host_powerpc64-function.patch b/meta-oe/recipes-devtools/ltrace/ltrace/0001-ppc-Remove-unused-host_powerpc64-function.patch
index 39e1f77a0a..35062debf2 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace/0001-ppc-Remove-unused-host_powerpc64-function.patch
+++ b/meta-oe/recipes-devtools/ltrace/ltrace/0001-ppc-Remove-unused-host_powerpc64-function.patch
@@ -8,6 +8,8 @@ with clang
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  sysdeps/linux-gnu/ppc/plt.c | 10 ----------
  1 file changed, 10 deletions(-)
 
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/0002-Fix-const-qualifier-error.patch b/meta-oe/recipes-devtools/ltrace/ltrace/0002-Fix-const-qualifier-error.patch
index c152771923..f78db5b0db 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace/0002-Fix-const-qualifier-error.patch
+++ b/meta-oe/recipes-devtools/ltrace/ltrace/0002-Fix-const-qualifier-error.patch
@@ -8,6 +8,8 @@ error: duplicate 'const' declaration specifier [-Werror,-Wduplicate-decl-specifi
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  dict.h    | 2 +-
  library.c | 2 +-
  vect.h    | 2 +-
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/add_ppc64le.patch b/meta-oe/recipes-devtools/ltrace/ltrace/add_ppc64le.patch
index dff61b1502..dcd0285db6 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace/add_ppc64le.patch
+++ b/meta-oe/recipes-devtools/ltrace/ltrace/add_ppc64le.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- a/sysdeps/linux-gnu/ppc/ptrace.h
 +++ b/sysdeps/linux-gnu/ppc/ptrace.h
 @@ -18,4 +18,5 @@
diff --git a/meta-oe/recipes-devtools/mcpp/files/CVE-2019-14274.patch b/meta-oe/recipes-devtools/mcpp/files/CVE-2019-14274.patch
index a0c6584ecb..b1e05c59d5 100644
--- a/meta-oe/recipes-devtools/mcpp/files/CVE-2019-14274.patch
+++ b/meta-oe/recipes-devtools/mcpp/files/CVE-2019-14274.patch
@@ -4,6 +4,8 @@ Date: Tue, 4 Feb 2014 11:00:40 -0800
 Subject: [PATCH] line comment bug
 
 ---
+Upstream-Status: Pending
+
  src/support.c | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-devtools/mcpp/files/ice-mcpp.patch b/meta-oe/recipes-devtools/mcpp/files/ice-mcpp.patch
index 1df3ae55bc..36cc2bd64d 100644
--- a/meta-oe/recipes-devtools/mcpp/files/ice-mcpp.patch
+++ b/meta-oe/recipes-devtools/mcpp/files/ice-mcpp.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -r -c -N ../mcpp-2.7.2-old/noconfig/vc2010.dif ./noconfig/vc2010.dif
 *** ../mcpp-2.7.2-old/noconfig/vc2010.dif	Wed Dec 31 20:30:00 1969
 --- ./noconfig/vc2010.dif	Fri May 14 12:47:22 2010
diff --git a/meta-oe/recipes-devtools/memstat/memstat/0001-Include-limits.h-for-PATH_MAX-definition.patch b/meta-oe/recipes-devtools/memstat/memstat/0001-Include-limits.h-for-PATH_MAX-definition.patch
index 9a0a17e0e4..907ac9edbd 100644
--- a/meta-oe/recipes-devtools/memstat/memstat/0001-Include-limits.h-for-PATH_MAX-definition.patch
+++ b/meta-oe/recipes-devtools/memstat/memstat/0001-Include-limits.h-for-PATH_MAX-definition.patch
@@ -9,6 +9,8 @@ error: use of undeclared identifier 'PATH_MAX'
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  memstat.c | 1 +
  1 file changed, 1 insertion(+)
 
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch
index 4773f05109..dd9c9015e2 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch
@@ -7,6 +7,8 @@ clang does not support this option
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  common.gypi | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-devtools/octave/files/fix-blas-library-integer-size.patch b/meta-oe/recipes-devtools/octave/files/fix-blas-library-integer-size.patch
index e89d7d3466..4189d4083a 100644
--- a/meta-oe/recipes-devtools/octave/files/fix-blas-library-integer-size.patch
+++ b/meta-oe/recipes-devtools/octave/files/fix-blas-library-integer-size.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -Naur octave-4.4.1.orig/configure.ac octave-4.4.1/configure.ac
 --- octave-4.4.1.orig/configure.ac	2019-02-23 10:46:24.287240571 +0000
 +++ octave-4.4.1/configure.ac	2019-02-23 10:46:42.255249333 +0000
diff --git a/meta-oe/recipes-devtools/perfetto/files/0001-Remove-check_build_deps-build-steps.patch b/meta-oe/recipes-devtools/perfetto/files/0001-Remove-check_build_deps-build-steps.patch
index 28fa983874..c10400aef4 100644
--- a/meta-oe/recipes-devtools/perfetto/files/0001-Remove-check_build_deps-build-steps.patch
+++ b/meta-oe/recipes-devtools/perfetto/files/0001-Remove-check_build_deps-build-steps.patch
@@ -12,6 +12,8 @@ rather than the Bitbake-generated one.
 
 Signed-off-by: Sui Chen <suichen6@gmail.com>
 ---
+Upstream-Status: Pending
+
  gn/BUILD.gn                  |  1 -
  gn/standalone/BUILD.gn       | 12 ++++++------
  gn/standalone/BUILDCONFIG.gn |  5 +++--
diff --git a/meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-lib_perfetto.patch b/meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-lib_perfetto.patch
index 21033eaaa8..ae644747c1 100644
--- a/meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-lib_perfetto.patch
+++ b/meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-lib_perfetto.patch
@@ -4,6 +4,8 @@ Date: Mon, 17 Oct 2022 19:20:53 +0200
 Subject: [PATCH] meson: add PC file for lib_perfetto
 
 ---
+Upstream-Status: Pending
+
  meson.build | 12 ++++++++++--
  1 file changed, 10 insertions(+), 2 deletions(-)
 
diff --git a/meta-oe/recipes-devtools/php/php/0005-pear-fix-Makefile.frag-for-Yocto.patch b/meta-oe/recipes-devtools/php/php/0005-pear-fix-Makefile.frag-for-Yocto.patch
index fa956e0284..37752ef949 100644
--- a/meta-oe/recipes-devtools/php/php/0005-pear-fix-Makefile.frag-for-Yocto.patch
+++ b/meta-oe/recipes-devtools/php/php/0005-pear-fix-Makefile.frag-for-Yocto.patch
@@ -8,6 +8,8 @@ Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 update patch to 8.0.12
 Signed-off-by: Claude Bing <cbing@cybernetics.com>
 ---
+Upstream-Status: Pending
+
  pear/Makefile.frag | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-devtools/php/php/0009-php-don-t-use-broken-wrapper-for-mkdir.patch b/meta-oe/recipes-devtools/php/php/0009-php-don-t-use-broken-wrapper-for-mkdir.patch
index 57b05e6a77..b5a33cca7f 100644
--- a/meta-oe/recipes-devtools/php/php/0009-php-don-t-use-broken-wrapper-for-mkdir.patch
+++ b/meta-oe/recipes-devtools/php/php/0009-php-don-t-use-broken-wrapper-for-mkdir.patch
@@ -11,6 +11,8 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
 update patch to version 8.0.12
 Signed-off-by: Claude Bing <cbing@cybernetics.com>
 ---
+Upstream-Status: Pending
+
  build/Makefile.global | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-devtools/poke/poke/0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch b/meta-oe/recipes-devtools/poke/poke/0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch
index 3bd041a0e7..a41f985eb8 100644
--- a/meta-oe/recipes-devtools/poke/poke/0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch
+++ b/meta-oe/recipes-devtools/poke/poke/0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch
@@ -12,6 +12,8 @@ Subject: [PATCH] build: do not check for Tcl/Tk if --disable-gui is specified
 [Romain: remove Changelog entry]
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
 ---
+Upstream-Status: Pending
+
  configure.ac | 9 ++++++---
  1 file changed, 6 insertions(+), 3 deletions(-)
 
diff --git a/meta-oe/recipes-devtools/poke/poke/0002-jitter-jitter-config.in-avoit-host-poisoning-while-c.patch b/meta-oe/recipes-devtools/poke/poke/0002-jitter-jitter-config.in-avoit-host-poisoning-while-c.patch
index fa55f817ff..660b19f514 100644
--- a/meta-oe/recipes-devtools/poke/poke/0002-jitter-jitter-config.in-avoit-host-poisoning-while-c.patch
+++ b/meta-oe/recipes-devtools/poke/poke/0002-jitter-jitter-config.in-avoit-host-poisoning-while-c.patch
@@ -20,6 +20,8 @@ for @-substitutions.
 
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
 ---
+Upstream-Status: Pending
+
  jitter/bin/jitter-config.in | 6 +-----
  1 file changed, 1 insertion(+), 5 deletions(-)
 
diff --git a/meta-oe/recipes-devtools/poke/poke/0003-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch b/meta-oe/recipes-devtools/poke/poke/0003-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch
index f217c917f1..ad2bf764d3 100644
--- a/meta-oe/recipes-devtools/poke/poke/0003-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch
+++ b/meta-oe/recipes-devtools/poke/poke/0003-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch
@@ -13,6 +13,8 @@ Avoid:
 
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
 ---
+Upstream-Status: Pending
+
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-linking-error-with-ld-gold.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-linking-error-with-ld-gold.patch
index 2bcb138731..2bc44c898b 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-linking-error-with-ld-gold.patch
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-linking-error-with-ld-gold.patch
@@ -21,6 +21,8 @@ N/A
               protobuf-3.11.4
 
 ---
+Upstream-Status: Pending
+
  src/libprotobuf-lite.map | 2 ++
  src/libprotobuf.map      | 2 ++
  src/libprotoc.map        | 2 ++
diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse/0001-Preserve-CXXFLAGS-from-environment-in-Mongoose.patch b/meta-oe/recipes-devtools/suitesparse/suitesparse/0001-Preserve-CXXFLAGS-from-environment-in-Mongoose.patch
index c955b5fa7d..47865de858 100644
--- a/meta-oe/recipes-devtools/suitesparse/suitesparse/0001-Preserve-CXXFLAGS-from-environment-in-Mongoose.patch
+++ b/meta-oe/recipes-devtools/suitesparse/suitesparse/0001-Preserve-CXXFLAGS-from-environment-in-Mongoose.patch
@@ -8,6 +8,8 @@ build process, instead of overwriting them. This is useful in a cross
 compile context where the CXXFLAGS variable might contain necessary
 flags for cross compiling.
 ---
+Upstream-Status: Pending
+
  Mongoose/CMakeLists.txt | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse/0002-Preserve-links-when-installing-libmetis.patch b/meta-oe/recipes-devtools/suitesparse/suitesparse/0002-Preserve-links-when-installing-libmetis.patch
index 190eaf164d..d80c1a7362 100644
--- a/meta-oe/recipes-devtools/suitesparse/suitesparse/0002-Preserve-links-when-installing-libmetis.patch
+++ b/meta-oe/recipes-devtools/suitesparse/suitesparse/0002-Preserve-links-when-installing-libmetis.patch
@@ -4,6 +4,8 @@ Date: Wed, 21 Oct 2020 15:26:52 -0600
 Subject: [PATCH] Preserve links when installing libmetis
 
 ---
+Upstream-Status: Pending
+
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse/0003-Add-version-information-to-libmetis.patch b/meta-oe/recipes-devtools/suitesparse/suitesparse/0003-Add-version-information-to-libmetis.patch
index dee6039a81..fc83897a05 100644
--- a/meta-oe/recipes-devtools/suitesparse/suitesparse/0003-Add-version-information-to-libmetis.patch
+++ b/meta-oe/recipes-devtools/suitesparse/suitesparse/0003-Add-version-information-to-libmetis.patch
@@ -4,6 +4,8 @@ Date: Wed, 21 Oct 2020 15:27:07 -0600
 Subject: [PATCH] Add version information to libmetis
 
 ---
+Upstream-Status: Pending
+
  metis-5.1.0/Makefile                | 8 ++++----
  metis-5.1.0/libmetis/CMakeLists.txt | 1 +
  2 files changed, 5 insertions(+), 4 deletions(-)
diff --git a/meta-oe/recipes-devtools/tcltk/tk/confsearch.diff b/meta-oe/recipes-devtools/tcltk/tk/confsearch.diff
index 229acf3e7a..e13bf69b23 100644
--- a/meta-oe/recipes-devtools/tcltk/tk/confsearch.diff
+++ b/meta-oe/recipes-devtools/tcltk/tk/confsearch.diff
@@ -8,6 +8,8 @@ and tkConfig.sh in /usr/share/tcltk/tk8.5 where they are located in Debian
 installation.
 
 ---
+Upstream-Status: Pending
+
  unix/configure | 1 +
  unix/tcl.m4    | 2 ++
  2 files changed, 3 insertions(+)
diff --git a/meta-oe/recipes-devtools/tcltk/tk/fix-xft.diff b/meta-oe/recipes-devtools/tcltk/tk/fix-xft.diff
index 4aa5d6b894..fdf3c66535 100644
--- a/meta-oe/recipes-devtools/tcltk/tk/fix-xft.diff
+++ b/meta-oe/recipes-devtools/tcltk/tk/fix-xft.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- /tmp/configure.in	2010-05-19 13:29:03.000000000 +0200
 +++ unix/configure.in	2010-05-19 13:42:05.000000000 +0200
 @@ -526,13 +526,9 @@
diff --git a/meta-oe/recipes-devtools/tcltk/tk/tkprivate.diff b/meta-oe/recipes-devtools/tcltk/tk/tkprivate.diff
index 4e15469736..62467af1d5 100644
--- a/meta-oe/recipes-devtools/tcltk/tk/tkprivate.diff
+++ b/meta-oe/recipes-devtools/tcltk/tk/tkprivate.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Patch by Chris Waters sets path which are normally point to a directory
 with Tk sources to a subdirectory of /usr/include/tcl8.4 (debian/rules
 puts private Tk headers there).
diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap/quote_cctype.patch b/meta-oe/recipes-devtools/uw-imap/uw-imap/quote_cctype.patch
index f729ee2074..10c91673c3 100644
--- a/meta-oe/recipes-devtools/uw-imap/uw-imap/quote_cctype.patch
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap/quote_cctype.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -urN imap-2007.orig/Makefile imap-2007/Makefile
 --- imap-2007.orig/Makefile	2007-12-20 23:11:10.000000000 +0100
 +++ imap-2007/Makefile	2008-03-19 14:08:47.000000000 +0100
diff --git a/meta-oe/recipes-extended/bitwise/files/0001-makefile.am-Fix-build-when-build-dir-is-not-same-as-.patch b/meta-oe/recipes-extended/bitwise/files/0001-makefile.am-Fix-build-when-build-dir-is-not-same-as-.patch
index ad3f0bb1fd..76d12f9cd8 100644
--- a/meta-oe/recipes-extended/bitwise/files/0001-makefile.am-Fix-build-when-build-dir-is-not-same-as-.patch
+++ b/meta-oe/recipes-extended/bitwise/files/0001-makefile.am-Fix-build-when-build-dir-is-not-same-as-.patch
@@ -8,6 +8,8 @@ This ensures right include paths are added to compiler
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-extended/cfengine/cfengine/0001-Fixed-with-libxml2-no-case-in-configure.ac.patch b/meta-oe/recipes-extended/cfengine/cfengine/0001-Fixed-with-libxml2-no-case-in-configure.ac.patch
index 01d470b833..78f36bde45 100644
--- a/meta-oe/recipes-extended/cfengine/cfengine/0001-Fixed-with-libxml2-no-case-in-configure.ac.patch
+++ b/meta-oe/recipes-extended/cfengine/cfengine/0001-Fixed-with-libxml2-no-case-in-configure.ac.patch
@@ -8,6 +8,8 @@ The CF3_WITH_LIBRARY and AC_CHECK_HEADERS were moved to outside of the check for
 Ticket: CFE-4023
 Changelog: title
 ---
+Upstream-Status: Pending
+
  configure.ac          | 21 +++++++++++----------
  libntech/configure.ac | 21 +++++++++++----------
  2 files changed, 22 insertions(+), 20 deletions(-)
diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Fix-error.patch b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Fix-error.patch
index d1a303cf4f..1d8013be6f 100644
--- a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Fix-error.patch
+++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Fix-error.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] Fix error
 
 Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
 ---
+Upstream-Status: Pending
+
  swig/python/CMakeLists.txt | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-fix-the-build-error-when-python-3.0.patch b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-fix-the-build-error-when-python-3.0.patch
index 0d6f029e4c..5d5652a5f2 100644
--- a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-fix-the-build-error-when-python-3.0.patch
+++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-fix-the-build-error-when-python-3.0.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] fix Xthe build error when python>3.0
 
 Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
 ---
+Upstream-Status: Pending
+
  src/target_python.c | 7 ++++++-
  1 file changed, 6 insertions(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-extended/collectd/collectd/0001-configure-Check-for-Wno-error-format-truncation-comp.patch b/meta-oe/recipes-extended/collectd/collectd/0001-configure-Check-for-Wno-error-format-truncation-comp.patch
index 8d31e12f94..f42461e322 100644
--- a/meta-oe/recipes-extended/collectd/collectd/0001-configure-Check-for-Wno-error-format-truncation-comp.patch
+++ b/meta-oe/recipes-extended/collectd/collectd/0001-configure-Check-for-Wno-error-format-truncation-comp.patch
@@ -14,6 +14,8 @@ client.c:834:23: error: '%s' directive output may be truncated writing up to 102
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  configure.ac                |  1 +
  m4/ax_check_compile_flag.m4 | 74 +++++++++++++++++++++++++++++++++++++
  2 files changed, 75 insertions(+)
diff --git a/meta-oe/recipes-extended/collectd/collectd/0005-Disable-new-gcc8-warnings.patch b/meta-oe/recipes-extended/collectd/collectd/0005-Disable-new-gcc8-warnings.patch
index 13510cdea0..459bbd4e5a 100644
--- a/meta-oe/recipes-extended/collectd/collectd/0005-Disable-new-gcc8-warnings.patch
+++ b/meta-oe/recipes-extended/collectd/collectd/0005-Disable-new-gcc8-warnings.patch
@@ -9,6 +9,8 @@ already in place
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  src/libcollectdclient/network_parse.c | 7 +++++++
  src/write_sensu.c                     | 7 +++++++
  2 files changed, 14 insertions(+)
diff --git a/meta-oe/recipes-extended/collectd/collectd/no-gcrypt-badpath.patch b/meta-oe/recipes-extended/collectd/collectd/no-gcrypt-badpath.patch
index f12b16cb91..409f8dea02 100644
--- a/meta-oe/recipes-extended/collectd/collectd/no-gcrypt-badpath.patch
+++ b/meta-oe/recipes-extended/collectd/collectd/no-gcrypt-badpath.patch
@@ -3,6 +3,8 @@ From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Mon, 22 Apr 2013 16:28:16 +0000
 
 ---
+Upstream-Status: Pending
+
  configure.ac | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/481.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/481.patch
index a3f2b2f9e5..52d9de2fd7 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/481.patch
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/481.patch
@@ -24,6 +24,8 @@ In file included from /usr/include/string.h:535,
                  from dlt-daemon-2.18.9/tests/gtest_dlt_daemon_multiple_files_logging.cpp:27:
 In function ‘strncpy’,
 ---
+Upstream-Status: Pending
+
  tests/gtest_dlt_daemon_multiple_files_logging.cpp | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/482.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/482.patch
index a4c18779c9..7c9e222b35 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/482.patch
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/482.patch
@@ -11,6 +11,8 @@ cd dlt-daemon-2.18.9/obj-x86_64-linux-gnu/tests && /usr/bin/cmake -E cmake_link_
 /usr/bin/c++ -g -O2 -ffile-prefix-map=dlt-daemon-2.18.9=. -flto=auto -ffat-lto-objects -flto=auto -ffat-lto-objects -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -isystem /include -std=gnu++0x -Wl,-Bsymbolic-functions -flto=auto -ffat-lto-objects -flto=auto -Wl,-z,relro -rdynamic CMakeFiles/gtest_dlt_daemon_gateway.dir/gtest_dlt_daemon_gateway.cpp.o CMakeFiles/gtest_dlt_daemon_gateway.dir/__/systemd/3rdparty/sd-daemon.c.o -o gtest_dlt_daemon_gateway  -Wl,-rpath,dlt-daemon-2.18.9/obj-x86_64-linux-gnu/src/daemon ../src/daemon/libdlt_daemon.so /usr/lib/x86_64-linux-gnu/libgtest.a /usr/lib/x86_64-linux-gnu/libgtest_main.a -lrt /usr/lib/x86_64-linux-gnu/libgtest.a
 /usr/bin/ld: ../src/daemon/libdlt_daemon.so: undefined reference to `sd_listen_fds_with_names'
 ---
+Upstream-Status: Pending
+
  tests/CMakeLists.txt | 10 +++++++++-
  1 file changed, 9 insertions(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-extended/etcd/etcd/0001-test_lib.sh-remove-gobin-requirement-during-build.patch b/meta-oe/recipes-extended/etcd/etcd/0001-test_lib.sh-remove-gobin-requirement-during-build.patch
index a6a31d2308..f0d9c2936a 100644
--- a/meta-oe/recipes-extended/etcd/etcd/0001-test_lib.sh-remove-gobin-requirement-during-build.patch
+++ b/meta-oe/recipes-extended/etcd/etcd/0001-test_lib.sh-remove-gobin-requirement-during-build.patch
@@ -15,6 +15,8 @@ optional test cases).
 
 Signed-off-by: Andrew Geissler <geissonator@yahoo.com>
 ---
+Upstream-Status: Pending
+
  scripts/test_lib.sh | 8 ++++++--
  1 file changed, 6 insertions(+), 2 deletions(-)
 
diff --git a/meta-oe/recipes-extended/etcd/etcd/0001-xxhash-bump-to-v2.1.2.patch b/meta-oe/recipes-extended/etcd/etcd/0001-xxhash-bump-to-v2.1.2.patch
index 2893258264..c897fe17cd 100644
--- a/meta-oe/recipes-extended/etcd/etcd/0001-xxhash-bump-to-v2.1.2.patch
+++ b/meta-oe/recipes-extended/etcd/etcd/0001-xxhash-bump-to-v2.1.2.patch
@@ -18,6 +18,8 @@ the etcd v3.5 release tag.
 
 Signed-off-by: Andrew Geissler <geissonator@yahoo.com>
 ---
+Upstream-Status: Pending
+
  client/v3/go.mod | 2 +-
  client/v3/go.sum | 2 ++
  etcdctl/go.mod   | 2 +-
diff --git a/meta-oe/recipes-extended/flatpak/flatpak/0001-flatpak-pc-add-pc_sysrootdir.patch b/meta-oe/recipes-extended/flatpak/flatpak/0001-flatpak-pc-add-pc_sysrootdir.patch
index 99e9cd23b1..c1f2cca5c6 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak/0001-flatpak-pc-add-pc_sysrootdir.patch
+++ b/meta-oe/recipes-extended/flatpak/flatpak/0001-flatpak-pc-add-pc_sysrootdir.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] flatpak.pc: add pc_sysrootdir
 
 Signed-off-by: Markus Volk <f_l_k@t-online.de>
 ---
+Upstream-Status: Pending
+
  meson.build | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-chunkio-Link-with-fts-library-with-musl.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0002-chunkio-Link-with-fts-library-with-musl.patch
index 4ffb20d9ca..bdcc534964 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-chunkio-Link-with-fts-library-with-musl.patch
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0002-chunkio-Link-with-fts-library-with-musl.patch
@@ -8,6 +8,8 @@ cio_utils.c:(.text+0x64): undefined reference to `fts_read'
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  lib/chunkio/src/CMakeLists.txt | 1 +
  1 file changed, 1 insertion(+)
 
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.patch
index 4358b2a512..425b838b78 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.patch
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.patch
@@ -8,6 +8,8 @@ reproducible and contaminates it with host builder paths. Instead
 make it take CMAKE_DEBUG_SRCDIR that can be set to a known
 reproducible value
 ---
+Upstream-Status: Pending
+
  include/fluent-bit/flb_info.h.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-mbedtls-Remove-unused-variable.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0002-mbedtls-Remove-unused-variable.patch
index d4451bcaef..d911420df2 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-mbedtls-Remove-unused-variable.patch
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0002-mbedtls-Remove-unused-variable.patch
@@ -8,6 +8,8 @@ library/bignum.c:1395:29: error: variable 't' set but not used [-Werror,-Wunused
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  lib/mbedtls-2.28.0/library/bignum.c | 4 +---
  1 file changed, 1 insertion(+), 3 deletions(-)
 
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Disable-documentation-warning-as-error-with-.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Disable-documentation-warning-as-error-with-.patch
index 2d7b4efda7..473ebaf7d4 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Disable-documentation-warning-as-error-with-.patch
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Disable-documentation-warning-as-error-with-.patch
@@ -9,6 +9,8 @@ treat them as errors
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  lib/mbedtls-2.28.0/CMakeLists.txt | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0004-Use-correct-type-to-store-return-from-flb_kv_item_cr.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0004-Use-correct-type-to-store-return-from-flb_kv_item_cr.patch
index 224b8ccf1b..bd4276193d 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0004-Use-correct-type-to-store-return-from-flb_kv_item_cr.patch
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0004-Use-correct-type-to-store-return-from-flb_kv_item_cr.patch
@@ -8,6 +8,8 @@ error: incompatible pointer to integer conversion assigning to 'int' from 'struc
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  plugins/out_stackdriver/stackdriver_conf.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0005-stackdriver-Fix-return-type-mismatch.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0005-stackdriver-Fix-return-type-mismatch.patch
index cdbbb6b2c1..f023ab5732 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0005-stackdriver-Fix-return-type-mismatch.patch
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0005-stackdriver-Fix-return-type-mismatch.patch
@@ -10,6 +10,8 @@ error: incompatible integer to pointer conversion returning 'int' from a functio
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  plugins/out_stackdriver/stackdriver.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0006-monkey-Fix-TLS-detection-testcase.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0006-monkey-Fix-TLS-detection-testcase.patch
index eef1a56ba7..c3f2574d26 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0006-monkey-Fix-TLS-detection-testcase.patch
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0006-monkey-Fix-TLS-detection-testcase.patch
@@ -13,6 +13,8 @@ error: call to undeclared function '__tls_get_addr'; ISO C99 and later do not su
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  lib/monkey/CMakeLists.txt | 2 ++
  1 file changed, 2 insertions(+)
 
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/0003-Use-native-tools-to-build-docs.patch b/meta-oe/recipes-extended/gnuplot/gnuplot/0003-Use-native-tools-to-build-docs.patch
index c2d2f7f3f0..7a7e550349 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot/0003-Use-native-tools-to-build-docs.patch
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot/0003-Use-native-tools-to-build-docs.patch
@@ -14,6 +14,8 @@ Content-Transfer-Encoding: 8bit
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  docs/Makefile.am | 22 +++++++++++-----------
  1 file changed, 11 insertions(+), 11 deletions(-)
 
diff --git a/meta-oe/recipes-extended/hplip/hplip/0001-Fix-installing-ipp-usb-quirk.patch b/meta-oe/recipes-extended/hplip/hplip/0001-Fix-installing-ipp-usb-quirk.patch
index 71ed697221..d45db1b2e3 100644
--- a/meta-oe/recipes-extended/hplip/hplip/0001-Fix-installing-ipp-usb-quirk.patch
+++ b/meta-oe/recipes-extended/hplip/hplip/0001-Fix-installing-ipp-usb-quirk.patch
@@ -12,6 +12,8 @@ Use $(DESTDIR) as installation prefix for
 
 Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
 ---
+Upstream-Status: Pending
+
  Makefile.am | 7 +++----
  1 file changed, 3 insertions(+), 4 deletions(-)
 
diff --git a/meta-oe/recipes-extended/hplip/hplip/0003-pserror.c-Define-column-to-be-int-explcitly.patch b/meta-oe/recipes-extended/hplip/hplip/0003-pserror.c-Define-column-to-be-int-explcitly.patch
index 78325ac8d6..bf93c222ea 100644
--- a/meta-oe/recipes-extended/hplip/hplip/0003-pserror.c-Define-column-to-be-int-explcitly.patch
+++ b/meta-oe/recipes-extended/hplip/hplip/0003-pserror.c-Define-column-to-be-int-explcitly.patch
@@ -5,6 +5,8 @@ Subject: [PATCH 3/4] pserror.c: Define column to be int explcitly
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  prnt/hpps/pserror.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-extended/hplip/hplip/0004-Define-missing-prototype-for-functions.patch b/meta-oe/recipes-extended/hplip/hplip/0004-Define-missing-prototype-for-functions.patch
index 276d025785..7223bf939e 100644
--- a/meta-oe/recipes-extended/hplip/hplip/0004-Define-missing-prototype-for-functions.patch
+++ b/meta-oe/recipes-extended/hplip/hplip/0004-Define-missing-prototype-for-functions.patch
@@ -5,6 +5,8 @@ Subject: [PATCH 4/4] Define missing prototype for functions
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  prnt/cupsext/cupsext.c | 1 +
  protocol/hp_ipp.c      | 4 ++--
  2 files changed, 3 insertions(+), 2 deletions(-)
diff --git a/meta-oe/recipes-extended/hplip/hplip/0005-hp_ipp.c-Add-printf-format-to-snprintf-calls.patch b/meta-oe/recipes-extended/hplip/hplip/0005-hp_ipp.c-Add-printf-format-to-snprintf-calls.patch
index d844e49ad3..ac0ff81e6f 100644
--- a/meta-oe/recipes-extended/hplip/hplip/0005-hp_ipp.c-Add-printf-format-to-snprintf-calls.patch
+++ b/meta-oe/recipes-extended/hplip/hplip/0005-hp_ipp.c-Add-printf-format-to-snprintf-calls.patch
@@ -7,6 +7,8 @@ Avoid -Wformat warnings
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  protocol/hp_ipp.c | 14 +++++++-------
  1 file changed, 7 insertions(+), 7 deletions(-)
 
diff --git a/meta-oe/recipes-extended/hplip/hplip/0006-Workaround-patch-for-missing-Python3-transition-of-t.patch b/meta-oe/recipes-extended/hplip/hplip/0006-Workaround-patch-for-missing-Python3-transition-of-t.patch
index 5d78bb3bbb..194deb8b81 100644
--- a/meta-oe/recipes-extended/hplip/hplip/0006-Workaround-patch-for-missing-Python3-transition-of-t.patch
+++ b/meta-oe/recipes-extended/hplip/hplip/0006-Workaround-patch-for-missing-Python3-transition-of-t.patch
@@ -9,6 +9,8 @@ Subject: Workaround patch for missing Python3 transition of the old
  proper solution in the next upstream release of HPLIP (see LP: #1275353)
 
 ---
+Upstream-Status: Pending
+
  pcard/pcardext/pcardext.c | 59 +++++++++++++++++++++++++++++++++++++----------
  pcard/photocard.py        |  2 +-
  unload.py                 |  5 ++++
diff --git a/meta-oe/recipes-extended/hplip/hplip/030-replace_unsafe_memcpy_with_memmove.patch b/meta-oe/recipes-extended/hplip/hplip/030-replace_unsafe_memcpy_with_memmove.patch
index 2babb2b67a..e8ca8b2d6c 100644
--- a/meta-oe/recipes-extended/hplip/hplip/030-replace_unsafe_memcpy_with_memmove.patch
+++ b/meta-oe/recipes-extended/hplip/hplip/030-replace_unsafe_memcpy_with_memmove.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 https://bugs.launchpad.net/hplip/+bug/1672256
 
 memcpy should never be used with overlapping memory regions
diff --git a/meta-oe/recipes-extended/hplip/hplip/050-fix-glibcisms.patch b/meta-oe/recipes-extended/hplip/hplip/050-fix-glibcisms.patch
index e020bd4642..93fdcf4bfd 100644
--- a/meta-oe/recipes-extended/hplip/hplip/050-fix-glibcisms.patch
+++ b/meta-oe/recipes-extended/hplip/hplip/050-fix-glibcisms.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff --git a/scan/sane/OrbliteScan/LinuxCommon.h b/scan/sane/OrbliteScan/LinuxCommon.h
 index 6605dd9..55c7110 100644
 --- a/scan/sane/OrbliteScan/LinuxCommon.h
diff --git a/meta-oe/recipes-extended/hplip/hplip/600-fix.patch b/meta-oe/recipes-extended/hplip/hplip/600-fix.patch
index 91a5035ae9..cddc5e0065 100644
--- a/meta-oe/recipes-extended/hplip/hplip/600-fix.patch
+++ b/meta-oe/recipes-extended/hplip/hplip/600-fix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- a/configure.in
 +++ b/configure.in
 @@ -254,7 +254,6 @@ if test "$class_driver" = "yes"; then
diff --git a/meta-oe/recipes-extended/hplip/hplip/configure.patch b/meta-oe/recipes-extended/hplip/hplip/configure.patch
index a6e61a47ca..0e0fd47fa1 100644
--- a/meta-oe/recipes-extended/hplip/hplip/configure.patch
+++ b/meta-oe/recipes-extended/hplip/hplip/configure.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- a/configure.in
 +++ b/configure.in
 @@ -30,7 +30,7 @@
diff --git a/meta-oe/recipes-extended/hplip/hplip/hplip-3.19.6-fix-return.patch b/meta-oe/recipes-extended/hplip/hplip/hplip-3.19.6-fix-return.patch
index 67546b07dc..45b25c5e76 100644
--- a/meta-oe/recipes-extended/hplip/hplip/hplip-3.19.6-fix-return.patch
+++ b/meta-oe/recipes-extended/hplip/hplip/hplip-3.19.6-fix-return.patch
@@ -4,6 +4,8 @@ Date: Wed, 14 Aug 2019 15:47:38 -0700
 Subject: [PATCH] Fixing invalid return in void function
 
 ---
+Upstream-Status: Pending
+
  prnt/hpps/hppsfilter.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi/0001-CMakeLists.txt-fix-lib64-can-not-be-shiped-in-64bit-.patch b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi/0001-CMakeLists.txt-fix-lib64-can-not-be-shiped-in-64bit-.patch
index 40a064307e..2671111b79 100644
--- a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi/0001-CMakeLists.txt-fix-lib64-can-not-be-shiped-in-64bit-.patch
+++ b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi/0001-CMakeLists.txt-fix-lib64-can-not-be-shiped-in-64bit-.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] CMakeLists.txt: fix lib64 can not be shiped in 64bit target
 
 Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
 ---
+Upstream-Status: Pending
+
  CMakeLists.txt | 7 -------
  1 file changed, 7 deletions(-)
 
diff --git a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi/0001-drop-including-rpath-cmake-module.patch b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi/0001-drop-including-rpath-cmake-module.patch
index 342017bedc..293706d889 100644
--- a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi/0001-drop-including-rpath-cmake-module.patch
+++ b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi/0001-drop-including-rpath-cmake-module.patch
@@ -8,6 +8,8 @@ Fixes cross compilation QA errors e.g.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  src/konkret/CMakeLists.txt | 1 -
  src/program/CMakeLists.txt | 1 -
  2 files changed, 2 deletions(-)
diff --git a/meta-oe/recipes-extended/libcec/libcec/0001-Remove-buggy-test-confusing-host-and-target.patch b/meta-oe/recipes-extended/libcec/libcec/0001-Remove-buggy-test-confusing-host-and-target.patch
index 7c29e15e20..07277f7064 100644
--- a/meta-oe/recipes-extended/libcec/libcec/0001-Remove-buggy-test-confusing-host-and-target.patch
+++ b/meta-oe/recipes-extended/libcec/libcec/0001-Remove-buggy-test-confusing-host-and-target.patch
@@ -4,6 +4,8 @@ Date: Mon, 7 Sep 2020 18:17:21 +0200
 Subject: [PATCH] Remove buggy test confusing host and target
 
 ---
+Upstream-Status: Pending
+
  src/libcec/cmake/CheckPlatformSupport.cmake | 8 --------
  1 file changed, 8 deletions(-)
 
diff --git a/meta-oe/recipes-extended/libexecinfo/libexecinfo/0001-makefile-Fix-build-on-linux.patch b/meta-oe/recipes-extended/libexecinfo/libexecinfo/0001-makefile-Fix-build-on-linux.patch
index f1863f14b3..b37b1aa2a6 100644
--- a/meta-oe/recipes-extended/libexecinfo/libexecinfo/0001-makefile-Fix-build-on-linux.patch
+++ b/meta-oe/recipes-extended/libexecinfo/libexecinfo/0001-makefile-Fix-build-on-linux.patch
@@ -5,6 +5,8 @@ Subject: [PATCH 1/2] makefile: Fix build on linux
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  Makefile | 33 +++++++++++++++++----------------
  1 file changed, 17 insertions(+), 16 deletions(-)
 
diff --git a/meta-oe/recipes-extended/libexecinfo/libexecinfo/0002-execinfo-Fix-compiler-errors-found-with-newer-gcc-cl.patch b/meta-oe/recipes-extended/libexecinfo/libexecinfo/0002-execinfo-Fix-compiler-errors-found-with-newer-gcc-cl.patch
index 423b670823..34fd98aaba 100644
--- a/meta-oe/recipes-extended/libexecinfo/libexecinfo/0002-execinfo-Fix-compiler-errors-found-with-newer-gcc-cl.patch
+++ b/meta-oe/recipes-extended/libexecinfo/libexecinfo/0002-execinfo-Fix-compiler-errors-found-with-newer-gcc-cl.patch
@@ -5,6 +5,8 @@ Subject: [PATCH 2/2] execinfo: Fix compiler errors found with newer gcc/clang
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  execinfo.c | 19 +++++++++++--------
  1 file changed, 11 insertions(+), 8 deletions(-)
 
diff --git a/meta-oe/recipes-extended/libgxim/libgxim/0001-Use-AM_CPPFLAGS-instead-of-INCLUDES.patch b/meta-oe/recipes-extended/libgxim/libgxim/0001-Use-AM_CPPFLAGS-instead-of-INCLUDES.patch
index 41e07f39f1..393571c313 100644
--- a/meta-oe/recipes-extended/libgxim/libgxim/0001-Use-AM_CPPFLAGS-instead-of-INCLUDES.patch
+++ b/meta-oe/recipes-extended/libgxim/libgxim/0001-Use-AM_CPPFLAGS-instead-of-INCLUDES.patch
@@ -4,6 +4,8 @@ Date: Mon, 13 May 2013 16:05:32 +0900
 Subject: [PATCH 1/3] Use AM_CPPFLAGS instead of INCLUDES
 
 ---
+Upstream-Status: Pending
+
  docs/reference/Makefile.am | 2 +-
  libgxim/Makefile.am        | 2 +-
  tests/Makefile.am          | 2 +-
diff --git a/meta-oe/recipes-extended/libgxim/libgxim/0002-Update-autotools-macro.patch b/meta-oe/recipes-extended/libgxim/libgxim/0002-Update-autotools-macro.patch
index 808203b6ef..01233f0a1f 100644
--- a/meta-oe/recipes-extended/libgxim/libgxim/0002-Update-autotools-macro.patch
+++ b/meta-oe/recipes-extended/libgxim/libgxim/0002-Update-autotools-macro.patch
@@ -4,6 +4,8 @@ Date: Wed, 22 Jan 2014 18:59:32 +0900
 Subject: [PATCH 2/3] Update autotools macro
 
 ---
+Upstream-Status: Pending
+
  configure.ac | 6 ++++--
  1 file changed, 4 insertions(+), 2 deletions(-)
 
diff --git a/meta-oe/recipes-extended/libgxim/libgxim/0003-Add-format-string-qualifier-to-fix-potential-securit.patch b/meta-oe/recipes-extended/libgxim/libgxim/0003-Add-format-string-qualifier-to-fix-potential-securit.patch
index cb21e1ef44..98bbde08a2 100644
--- a/meta-oe/recipes-extended/libgxim/libgxim/0003-Add-format-string-qualifier-to-fix-potential-securit.patch
+++ b/meta-oe/recipes-extended/libgxim/libgxim/0003-Add-format-string-qualifier-to-fix-potential-securit.patch
@@ -9,6 +9,8 @@ libgxim/gximprotocol10.c:2076:66: error: format string is not a string literal (
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  libgxim/gximprotocol10.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-extended/libgxim/libgxim/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch b/meta-oe/recipes-extended/libgxim/libgxim/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
index 3d293b473e..f2603d1399 100644
--- a/meta-oe/recipes-extended/libgxim/libgxim/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
+++ b/meta-oe/recipes-extended/libgxim/libgxim/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 multi-line ACLOCAL_AMFLAGS isn't supported by autoreconf.
 It will cause configure error as follow.
 
diff --git a/meta-oe/recipes-extended/libleak/libleak/0001-respect-environment-variables.patch b/meta-oe/recipes-extended/libleak/libleak/0001-respect-environment-variables.patch
index 979fd323ae..800ddd9507 100644
--- a/meta-oe/recipes-extended/libleak/libleak/0001-respect-environment-variables.patch
+++ b/meta-oe/recipes-extended/libleak/libleak/0001-respect-environment-variables.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] respect environment variables
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  Makefile | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile/configure.patch b/meta-oe/recipes-extended/liblockfile/liblockfile/configure.patch
index 56f2d05eb5..2bdf96e639 100644
--- a/meta-oe/recipes-extended/liblockfile/liblockfile/configure.patch
+++ b/meta-oe/recipes-extended/liblockfile/liblockfile/configure.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] Update patch for 1.17
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
+Upstream-Status: Pending
+
  configure.ac | 8 +++++---
  1 file changed, 5 insertions(+), 3 deletions(-)
 
diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus/Fix-float-endianness-issue-on-big-endian-arch.patch b/meta-oe/recipes-extended/libmodbus/libmodbus/Fix-float-endianness-issue-on-big-endian-arch.patch
index 5372a23b6a..e7fbb0389f 100644
--- a/meta-oe/recipes-extended/libmodbus/libmodbus/Fix-float-endianness-issue-on-big-endian-arch.patch
+++ b/meta-oe/recipes-extended/libmodbus/libmodbus/Fix-float-endianness-issue-on-big-endian-arch.patch
@@ -9,6 +9,8 @@ This patch was modified from rm5248 [1]
 [1] https://github.com/synexxus/libmodbus/commit/a511768e7fe7ec52d7bae1d9ae04e33f87a59627
 
 ---
+Upstream-Status: Pending
+
  src/modbus-data.c        | 110 ++++++++++++++++++++++++++++++++++++++---------
  tests/unit-test-client.c |  22 ++++++----
  tests/unit-test.h.in     |  41 ++++++++++++++++--
diff --git a/meta-oe/recipes-extended/libwmf/libwmf/libwmf-0.2.8.4-intoverflow.patch b/meta-oe/recipes-extended/libwmf/libwmf/libwmf-0.2.8.4-intoverflow.patch
index 50d915c010..4e7cd8887a 100644
--- a/meta-oe/recipes-extended/libwmf/libwmf/libwmf-0.2.8.4-intoverflow.patch
+++ b/meta-oe/recipes-extended/libwmf/libwmf/libwmf-0.2.8.4-intoverflow.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 http://cvs.fedoraproject.org/viewvc/devel/libwmf/libwmf-0.2.8.4-intoverflow.patch?view=log
 
 CVE-2006-3376 libwmf integer overflow
diff --git a/meta-oe/recipes-extended/libwmf/libwmf/libwmf-0.2.8.4-useafterfree.patch b/meta-oe/recipes-extended/libwmf/libwmf/libwmf-0.2.8.4-useafterfree.patch
index 4d2d285641..9a8cbcb508 100644
--- a/meta-oe/recipes-extended/libwmf/libwmf/libwmf-0.2.8.4-useafterfree.patch
+++ b/meta-oe/recipes-extended/libwmf/libwmf/libwmf-0.2.8.4-useafterfree.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 
 http://cvs.fedoraproject.org/viewvc/devel/libwmf/libwmf-0.2.8.4-useafterfree.patch?view=log
 Resolves: CVE-2009-1364
diff --git a/meta-oe/recipes-extended/libx86-1/libx86-1.1/libx86-mmap-offset.patch b/meta-oe/recipes-extended/libx86-1/libx86-1.1/libx86-mmap-offset.patch
index 843acc8868..1c120c04b9 100644
--- a/meta-oe/recipes-extended/libx86-1/libx86-1.1/libx86-mmap-offset.patch
+++ b/meta-oe/recipes-extended/libx86-1/libx86-1.1/libx86-mmap-offset.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Upstream-Statue: Pending 
 [from ftp://195.220.108.108/linux/fedora/linux/development/rawhide/source/SRPMS/l/libx86-1.1-21.fc23.src.rpm]
 
diff --git a/meta-oe/recipes-extended/md5deep/files/wrong-variable-expansion.patch b/meta-oe/recipes-extended/md5deep/files/wrong-variable-expansion.patch
index 73c6cb126a..b637d81e9e 100644
--- a/meta-oe/recipes-extended/md5deep/files/wrong-variable-expansion.patch
+++ b/meta-oe/recipes-extended/md5deep/files/wrong-variable-expansion.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: git/configure.ac
 ===================================================================
 --- git.orig/configure.ac
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/fix-libressl-avoid-BSWAP-assembly-for-ARM-v6.patch b/meta-oe/recipes-extended/minifi-cpp/files/fix-libressl-avoid-BSWAP-assembly-for-ARM-v6.patch
index d0febfd534..a7dc35ae57 100644
--- a/meta-oe/recipes-extended/minifi-cpp/files/fix-libressl-avoid-BSWAP-assembly-for-ARM-v6.patch
+++ b/meta-oe/recipes-extended/minifi-cpp/files/fix-libressl-avoid-BSWAP-assembly-for-ARM-v6.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -urN -x .git orig/thirdparty/libressl/avoid-BSWAP-assembly-for-ARM-v6.patch patched/thirdparty/libressl/avoid-BSWAP-assembly-for-ARM-v6.patch
 --- orig/thirdparty/libressl/avoid-BSWAP-assembly-for-ARM-v6.patch	1970-01-01 09:00:00.000000000 +0900
 +++ patched/thirdparty/libressl/avoid-BSWAP-assembly-for-ARM-v6.patch	2020-08-07 23:14:46.196764271 +0900
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/fix-libressl-compile.patch b/meta-oe/recipes-extended/minifi-cpp/files/fix-libressl-compile.patch
index 84b8c8cb0e..32bcfbd2b9 100644
--- a/meta-oe/recipes-extended/minifi-cpp/files/fix-libressl-compile.patch
+++ b/meta-oe/recipes-extended/minifi-cpp/files/fix-libressl-compile.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -urN -x .git orig/cmake/LibreSSL.cmake patched/cmake/LibreSSL.cmake
 --- orig/cmake/LibreSSL.cmake	2020-08-07 21:58:34.660773928 +0900
 +++ patched/cmake/LibreSSL.cmake	2020-08-07 22:51:18.620767245 +0900
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/fix-minifi-compile.patch b/meta-oe/recipes-extended/minifi-cpp/files/fix-minifi-compile.patch
index 9653ba3426..d5b4449b82 100644
--- a/meta-oe/recipes-extended/minifi-cpp/files/fix-minifi-compile.patch
+++ b/meta-oe/recipes-extended/minifi-cpp/files/fix-minifi-compile.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -urN -x .git orig/CMakeLists.txt patched/CMakeLists.txt
 --- orig/CMakeLists.txt	2020-08-07 21:58:34.656773928 +0900
 +++ patched/CMakeLists.txt	2020-08-10 15:08:31.800278357 +0900
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-compile.patch b/meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-compile.patch
index 42e1e583c3..903e72e07b 100644
--- a/meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-compile.patch
+++ b/meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-compile.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -urN -x .git orig/cmake/BundledOSSPUUID.cmake patched/cmake/BundledOSSPUUID.cmake
 --- orig/cmake/BundledOSSPUUID.cmake	2020-08-07 21:58:34.660773928 +0900
 +++ patched/cmake/BundledOSSPUUID.cmake	2020-08-07 22:05:57.404772993 +0900
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-cross-compile.patch b/meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-cross-compile.patch
index dc354d9ac7..add1f6f2d5 100644
--- a/meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-cross-compile.patch
+++ b/meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-cross-compile.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -urN -x .git orig/thirdparty/ossp-uuid/ossp-uuid-cross-compile-fix.patch patched/thirdparty/ossp-uuid/ossp-uuid-cross-compile-fix.patch
 --- orig/thirdparty/ossp-uuid/ossp-uuid-cross-compile-fix.patch	1970-01-01 09:00:00.000000000 +0900
 +++ patched/thirdparty/ossp-uuid/ossp-uuid-cross-compile-fix.patch	2020-08-07 22:28:04.396770190 +0900
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-musl-compile.patch b/meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-musl-compile.patch
index 7caf848eb5..f8ba89dc3c 100644
--- a/meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-musl-compile.patch
+++ b/meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-musl-compile.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -urN -x .git orig/thirdparty/ossp-uuid/ossp-uuid-musl-compile-fix.patch patched/thirdparty/ossp-uuid/ossp-uuid-musl-compile-fix.patch
 --- orig/thirdparty/ossp-uuid/ossp-uuid-musl-compile-fix.patch	1970-01-01 09:00:00.000000000 +0900
 +++ patched/thirdparty/ossp-uuid/ossp-uuid-musl-compile-fix.patch	2020-08-07 11:22:49.344854508 +0900
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/fix-rocksdb-cross-compile.patch b/meta-oe/recipes-extended/minifi-cpp/files/fix-rocksdb-cross-compile.patch
index 8c5db7c9e3..0a3194da94 100644
--- a/meta-oe/recipes-extended/minifi-cpp/files/fix-rocksdb-cross-compile.patch
+++ b/meta-oe/recipes-extended/minifi-cpp/files/fix-rocksdb-cross-compile.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -urN orig/thirdparty/rocksdb/CMakeLists.txt patched/thirdparty/rocksdb/CMakeLists.txt
 --- orig/thirdparty/rocksdb/CMakeLists.txt	2020-07-28 11:39:40.254677515 +0900
 +++ patched/thirdparty/rocksdb/CMakeLists.txt	2020-07-28 11:51:11.898676054 +0900
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/remove_const_due_to_std_lock_guard.patch b/meta-oe/recipes-extended/minifi-cpp/files/remove_const_due_to_std_lock_guard.patch
index 2d66576f6e..365dec9d44 100644
--- a/meta-oe/recipes-extended/minifi-cpp/files/remove_const_due_to_std_lock_guard.patch
+++ b/meta-oe/recipes-extended/minifi-cpp/files/remove_const_due_to_std_lock_guard.patch
@@ -20,6 +20,8 @@ Compiling this on FreeBSD with CLang fails due to:
 1 error generated.
 ```
 ---
+Upstream-Status: Pending
+
  thirdparty/rocksdb/util/channel.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-102/fix-musl-build.patch b/meta-oe/recipes-extended/mozjs/mozjs-102/fix-musl-build.patch
index f847979ea2..6905282eb7 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-102/fix-musl-build.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs-102/fix-musl-build.patch
@@ -8,6 +8,8 @@ Reason: mozjs60 miscompiles on musl if built with HAVE_THREAD_TLS_KEYWORD:
 https://github.com/void-linux/void-packages/issues/2598
 
 ---
+Upstream-Status: Pending
+
  js/src/old-configure.in | 3 +++
  1 file changed, 3 insertions(+)
 
diff --git a/meta-oe/recipes-extended/mraa/mraa/0001-cmake-Use-a-regular-expression-to-match-x86-architec.patch b/meta-oe/recipes-extended/mraa/mraa/0001-cmake-Use-a-regular-expression-to-match-x86-architec.patch
index 0cae02f061..dedb4adf9b 100644
--- a/meta-oe/recipes-extended/mraa/mraa/0001-cmake-Use-a-regular-expression-to-match-x86-architec.patch
+++ b/meta-oe/recipes-extended/mraa/mraa/0001-cmake-Use-a-regular-expression-to-match-x86-architec.patch
@@ -13,6 +13,8 @@ So using a wildcard helps in using any x86 arch
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  CMakeLists.txt | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
 
diff --git a/meta-oe/recipes-extended/nicstat/nicstat/0001-nicstat.c-Do-not-define-uint64_t-and-uint32_t.patch b/meta-oe/recipes-extended/nicstat/nicstat/0001-nicstat.c-Do-not-define-uint64_t-and-uint32_t.patch
index a208f97eb2..78e3176e89 100644
--- a/meta-oe/recipes-extended/nicstat/nicstat/0001-nicstat.c-Do-not-define-uint64_t-and-uint32_t.patch
+++ b/meta-oe/recipes-extended/nicstat/nicstat/0001-nicstat.c-Do-not-define-uint64_t-and-uint32_t.patch
@@ -8,6 +8,8 @@ Use the defines from platform
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  nicstat.c | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
 
diff --git a/meta-oe/recipes-extended/openwsman/openwsman/0001-lock.c-Define-PTHREAD_MUTEX_RECURSIVE_NP-if-undefine.patch b/meta-oe/recipes-extended/openwsman/openwsman/0001-lock.c-Define-PTHREAD_MUTEX_RECURSIVE_NP-if-undefine.patch
index 7823fde7a0..0e2349e303 100644
--- a/meta-oe/recipes-extended/openwsman/openwsman/0001-lock.c-Define-PTHREAD_MUTEX_RECURSIVE_NP-if-undefine.patch
+++ b/meta-oe/recipes-extended/openwsman/openwsman/0001-lock.c-Define-PTHREAD_MUTEX_RECURSIVE_NP-if-undefine.patch
@@ -8,6 +8,8 @@ checking for OS
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  src/lib/u/lock.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-extended/openwsman/openwsman/libssl-is-required-if-eventint-supported.patch b/meta-oe/recipes-extended/openwsman/openwsman/libssl-is-required-if-eventint-supported.patch
index bd540e37c1..71f3d90a81 100644
--- a/meta-oe/recipes-extended/openwsman/openwsman/libssl-is-required-if-eventint-supported.patch
+++ b/meta-oe/recipes-extended/openwsman/openwsman/libssl-is-required-if-eventint-supported.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 libssl is required by wsman_client_transport if ENABLE_EVENTING_SUPPORT enabled.
 
 Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
diff --git a/meta-oe/recipes-extended/rarpd/rarpd/0001-rarpd.8-add-man-file.patch b/meta-oe/recipes-extended/rarpd/rarpd/0001-rarpd.8-add-man-file.patch
index 77c75b4a27..05483aa3eb 100644
--- a/meta-oe/recipes-extended/rarpd/rarpd/0001-rarpd.8-add-man-file.patch
+++ b/meta-oe/recipes-extended/rarpd/rarpd/0001-rarpd.8-add-man-file.patch
@@ -5,6 +5,8 @@ Subject: [PATCH 1/5] rarpd.8 : add man file
 
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
 ---
+Upstream-Status: Pending
+
  rarpd.8 | 69 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  1 file changed, 69 insertions(+)
  create mode 100644 rarpd.8
diff --git a/meta-oe/recipes-extended/rarpd/rarpd/0002-Makefile-modify-compile-parameters.patch b/meta-oe/recipes-extended/rarpd/rarpd/0002-Makefile-modify-compile-parameters.patch
index 0b3ebc468f..54b8e8181d 100644
--- a/meta-oe/recipes-extended/rarpd/rarpd/0002-Makefile-modify-compile-parameters.patch
+++ b/meta-oe/recipes-extended/rarpd/rarpd/0002-Makefile-modify-compile-parameters.patch
@@ -5,6 +5,8 @@ Subject: [PATCH 2/5] Makefile : modify compile parameters
 
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
 ---
+Upstream-Status: Pending
+
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-extended/rarpd/rarpd/0003-rarpd.c-bug-fix.patch b/meta-oe/recipes-extended/rarpd/rarpd/0003-rarpd.c-bug-fix.patch
index 7ce1279090..82655644f0 100644
--- a/meta-oe/recipes-extended/rarpd/rarpd/0003-rarpd.c-bug-fix.patch
+++ b/meta-oe/recipes-extended/rarpd/rarpd/0003-rarpd.c-bug-fix.patch
@@ -5,6 +5,8 @@ Subject: [PATCH 3/5] rarpd.c : bug fix
 
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
 ---
+Upstream-Status: Pending
+
  rarpd.c | 98 +++++++++++++++++++++++++++++++++++++----------------------------
  1 file changed, 56 insertions(+), 42 deletions(-)
 
diff --git a/meta-oe/recipes-extended/rarpd/rarpd/0004-rarpd.init-add-new-init-file.patch b/meta-oe/recipes-extended/rarpd/rarpd/0004-rarpd.init-add-new-init-file.patch
index 3ba11ffe55..7a50ca3ce9 100644
--- a/meta-oe/recipes-extended/rarpd/rarpd/0004-rarpd.init-add-new-init-file.patch
+++ b/meta-oe/recipes-extended/rarpd/rarpd/0004-rarpd.init-add-new-init-file.patch
@@ -5,6 +5,8 @@ Subject: [PATCH 4/5] rarpd.init : add new init file
 
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
 ---
+Upstream-Status: Pending
+
  rarpd.init | 96 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  1 file changed, 96 insertions(+)
  create mode 100644 rarpd.init
diff --git a/meta-oe/recipes-extended/rarpd/rarpd/0005-ethernet.c-remove-it.patch b/meta-oe/recipes-extended/rarpd/rarpd/0005-ethernet.c-remove-it.patch
index c77c806127..c651d656af 100644
--- a/meta-oe/recipes-extended/rarpd/rarpd/0005-ethernet.c-remove-it.patch
+++ b/meta-oe/recipes-extended/rarpd/rarpd/0005-ethernet.c-remove-it.patch
@@ -5,6 +5,8 @@ Subject: [PATCH 5/5] ethernet.c : remove it
 
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
 ---
+Upstream-Status: Pending
+
  ethernet.c | 224 -------------------------------------------------------------
  1 file changed, 224 deletions(-)
  delete mode 100644 ethernet.c
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.11/hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis-7.0.11/hiredis-use-default-CC-if-it-is-set.patch
index 657b0923e2..250fdd0ff4 100644
--- a/meta-oe/recipes-extended/redis/redis-7.0.11/hiredis-use-default-CC-if-it-is-set.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.0.11/hiredis-use-default-CC-if-it-is-set.patch
@@ -18,6 +18,8 @@ Reworked for 6.0.4
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  deps/hiredis/Makefile | 2 --
  1 file changed, 2 deletions(-)
 
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.11/lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis-7.0.11/lua-update-Makefile-to-use-environment-build-setting.patch
index c6c6fde162..bff07535de 100644
--- a/meta-oe/recipes-extended/redis/redis-7.0.11/lua-update-Makefile-to-use-environment-build-setting.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.0.11/lua-update-Makefile-to-use-environment-build-setting.patch
@@ -16,6 +16,8 @@ updated to work wtih 6.2.1
 Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
 
 ---
+Upstream-Status: Pending
+
  deps/Makefile         |  1 -
  deps/lua/Makefile     |  1 -
  deps/lua/src/Makefile | 16 ++++++----------
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.11/oe-use-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis-7.0.11/oe-use-libc-malloc.patch
index bf6d0cf3c1..bf05fc4c50 100644
--- a/meta-oe/recipes-extended/redis/redis-7.0.11/oe-use-libc-malloc.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.0.11/oe-use-libc-malloc.patch
@@ -15,6 +15,8 @@ Update to work with 4.0.8
 Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
 
 ---
+Upstream-Status: Pending
+
  src/Makefile | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-extended/redis/redis/hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis/hiredis-use-default-CC-if-it-is-set.patch
index 878cd36973..d2a1b45e66 100644
--- a/meta-oe/recipes-extended/redis/redis/hiredis-use-default-CC-if-it-is-set.patch
+++ b/meta-oe/recipes-extended/redis/redis/hiredis-use-default-CC-if-it-is-set.patch
@@ -14,6 +14,8 @@ Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
 Reworked for 6.0.4
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 ---
+Upstream-Status: Pending
+
  deps/hiredis/Makefile | 2 --
  1 file changed, 2 deletions(-)
 
diff --git a/meta-oe/recipes-extended/redis/redis/lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis/lua-update-Makefile-to-use-environment-build-setting.patch
index 1619e9db35..aade7afd06 100644
--- a/meta-oe/recipes-extended/redis/redis/lua-update-Makefile-to-use-environment-build-setting.patch
+++ b/meta-oe/recipes-extended/redis/redis/lua-update-Makefile-to-use-environment-build-setting.patch
@@ -15,6 +15,8 @@ Signed-off-by: Armin Kuster <akust808@gmail.com>
 updated to work wtih 6.2.1
 Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
 ---
+Upstream-Status: Pending
+
  deps/Makefile         |  1 -
  deps/lua/Makefile     |  1 -
  deps/lua/src/Makefile | 16 ++++++----------
diff --git a/meta-oe/recipes-extended/redis/redis/oe-use-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis/oe-use-libc-malloc.patch
index a0f66b845e..e76bdbc263 100644
--- a/meta-oe/recipes-extended/redis/redis/oe-use-libc-malloc.patch
+++ b/meta-oe/recipes-extended/redis/redis/oe-use-libc-malloc.patch
@@ -15,6 +15,8 @@ Update to work with 4.0.8
 Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
 
 ---
+Upstream-Status: Pending
+
  src/Makefile | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/0001-include-stdint.h-system-header-for-UINT16_MAX.patch b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/0001-include-stdint.h-system-header-for-UINT16_MAX.patch
index c2111a2c10..1c93d42f3c 100644
--- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/0001-include-stdint.h-system-header-for-UINT16_MAX.patch
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/0001-include-stdint.h-system-header-for-UINT16_MAX.patch
@@ -9,6 +9,8 @@ error: 'UINT16_MAX' undeclared (first use in this function)
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  interopServerProvider.c | 1 +
  1 file changed, 1 insertion(+)
 
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.3.15-fix-provider-debugging.patch b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.3.15-fix-provider-debugging.patch
index 4fbecaa63f..f21b3b9a5b 100644
--- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.3.15-fix-provider-debugging.patch
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.3.15-fix-provider-debugging.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -up sblim-sfcb-1.4.5/providerDrv.c.orig sblim-sfcb-1.4.5/providerDrv.c
 --- sblim-sfcb-1.4.5/providerDrv.c.orig	2013-09-04 12:59:22.140813239 +0200
 +++ sblim-sfcb-1.4.5/providerDrv.c	2013-09-04 12:59:40.511870274 +0200
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.3.16-maxMsgLen.patch b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.3.16-maxMsgLen.patch
index a0dd81653d..941b522b17 100644
--- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.3.16-maxMsgLen.patch
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.3.16-maxMsgLen.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -up sblim-sfcb-1.3.16/sfcb.cfg.pre.in.old sblim-sfcb-1.3.16/sfcb.cfg.pre.in
 --- sblim-sfcb-1.3.16/sfcb.cfg.pre.in.old	2012-06-13 23:21:09.000000000 +0200
 +++ sblim-sfcb-1.3.16/sfcb.cfg.pre.in	2013-06-24 15:34:38.881992781 +0200
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.3.16-multilib-man-cfg.patch b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.3.16-multilib-man-cfg.patch
index c8cece2c20..a175d1b063 100644
--- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.3.16-multilib-man-cfg.patch
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.3.16-multilib-man-cfg.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -up sblim-sfcb-1.3.16/man/sfcbd.1.pre.in.orig sblim-sfcb-1.3.16/man/sfcbd.1.pre.in
 --- sblim-sfcb-1.3.16/man/sfcbd.1.pre.in.orig	2014-02-26 14:05:32.213091734 +0100
 +++ sblim-sfcb-1.3.16/man/sfcbd.1.pre.in	2014-02-26 15:10:54.476196379 +0100
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.3.9-sfcbrepos-schema-location.patch b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.3.9-sfcbrepos-schema-location.patch
index 7f95a9da3f..83d4bbcd1e 100644
--- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.3.9-sfcbrepos-schema-location.patch
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.3.9-sfcbrepos-schema-location.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -up sblim-sfcb-1.3.9/man/sfcbrepos.1.pre.in.orig sblim-sfcb-1.3.9/man/sfcbrepos.1.pre.in
 --- sblim-sfcb-1.3.9/man/sfcbrepos.1.pre.in.orig	2009-10-13 21:54:13.000000000 +0200
 +++ sblim-sfcb-1.3.9/man/sfcbrepos.1.pre.in	2010-09-06 14:01:57.294564062 +0200
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.4.5-service.patch b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.4.5-service.patch
index eaccfa594c..08b9a1403b 100644
--- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.4.5-service.patch
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.4.5-service.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -up sblim-sfcb-1.4.6/Makefile.in.orig sblim-sfcb-1.4.6/Makefile.in
 --- sblim-sfcb-1.4.6/Makefile.in.orig	2013-10-07 10:43:34.783228137 +0200
 +++ sblim-sfcb-1.4.6/Makefile.in	2013-10-07 10:44:30.178533289 +0200
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.4.8-default-ecdh-curve-name.patch b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.4.8-default-ecdh-curve-name.patch
index 3268d49f43..f11cf925f5 100644
--- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.4.8-default-ecdh-curve-name.patch
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.4.8-default-ecdh-curve-name.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -up sblim-sfcb-1.4.8/control.c.orig sblim-sfcb-1.4.8/control.c
 --- sblim-sfcb-1.4.8/control.c.orig	2014-03-27 00:46:28.000000000 +0100
 +++ sblim-sfcb-1.4.8/control.c	2014-05-15 12:31:38.304169409 +0200
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.4.9-fix-ftbfs.patch b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.4.9-fix-ftbfs.patch
index 9548b3c063..fd2d076b85 100644
--- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.4.9-fix-ftbfs.patch
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.4.9-fix-ftbfs.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -up sblim-sfcb-1.4.9/control.c.orig sblim-sfcb-1.4.9/control.c
 --- sblim-sfcb-1.4.9/control.c.orig	2015-07-13 15:06:21.331660336 +0200
 +++ sblim-sfcb-1.4.9/control.c	2015-07-13 15:08:38.031308917 +0200
diff --git a/meta-oe/recipes-extended/scsirastools/scsirastools/mdadm.patch b/meta-oe/recipes-extended/scsirastools/scsirastools/mdadm.patch
index 6edda08cdf..3dc9d4766c 100644
--- a/meta-oe/recipes-extended/scsirastools/scsirastools/mdadm.patch
+++ b/meta-oe/recipes-extended/scsirastools/scsirastools/mdadm.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- mdadm.d/mdadm-1.3.0/mdadm.h.org	2017-06-20 00:35:55.366978372 -0700
 +++ mdadm.d/mdadm-1.3.0/mdadm.h	2017-06-20 00:36:41.244363348 -0700
 @@ -29,8 +29,9 @@
diff --git a/meta-oe/recipes-extended/scsirastools/scsirastools/print-format.patch b/meta-oe/recipes-extended/scsirastools/scsirastools/print-format.patch
index ac81780582..4494ae1eef 100644
--- a/meta-oe/recipes-extended/scsirastools/scsirastools/print-format.patch
+++ b/meta-oe/recipes-extended/scsirastools/scsirastools/print-format.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: scsirastools-1.6.6/src/sgcommon.c
 ===================================================================
 --- scsirastools-1.6.6.orig/src/sgcommon.c
diff --git a/meta-oe/recipes-extended/sedutil/files/0001-Fix-build-on-big-endian-architectures.patch b/meta-oe/recipes-extended/sedutil/files/0001-Fix-build-on-big-endian-architectures.patch
index 7351197e4f..0b78d238bb 100644
--- a/meta-oe/recipes-extended/sedutil/files/0001-Fix-build-on-big-endian-architectures.patch
+++ b/meta-oe/recipes-extended/sedutil/files/0001-Fix-build-on-big-endian-architectures.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] Fix build on big endian architectures
 
 Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
 ---
+Upstream-Status: Pending
+
  Common/DtaEndianFixup.h | 13 +++++++------
  1 file changed, 7 insertions(+), 6 deletions(-)
 
diff --git a/meta-oe/recipes-extended/sgpio/sgpio/0001-makefile-Add-LDFLAGS-to-linking-rule.patch b/meta-oe/recipes-extended/sgpio/sgpio/0001-makefile-Add-LDFLAGS-to-linking-rule.patch
index 87fdd6058a..895916ceab 100644
--- a/meta-oe/recipes-extended/sgpio/sgpio/0001-makefile-Add-LDFLAGS-to-linking-rule.patch
+++ b/meta-oe/recipes-extended/sgpio/sgpio/0001-makefile-Add-LDFLAGS-to-linking-rule.patch
@@ -8,6 +8,8 @@ No GNU_HASH in the elf binary
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils/0001-include-sys-select.h-for-FD_-definitions.patch b/meta-oe/recipes-extended/tipcutils/tipcutils/0001-include-sys-select.h-for-FD_-definitions.patch
index 6c8ba9074a..9f0604892d 100644
--- a/meta-oe/recipes-extended/tipcutils/tipcutils/0001-include-sys-select.h-for-FD_-definitions.patch
+++ b/meta-oe/recipes-extended/tipcutils/tipcutils/0001-include-sys-select.h-for-FD_-definitions.patch
@@ -5,6 +5,8 @@ Subject: [PATCH 1/2] include sys/select.h for FD_* definitions
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  demos/inventory_sim/inventory_sim.c | 1 +
  1 file changed, 1 insertion(+)
 
diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils/0002-replace-non-standard-uint-with-unsigned-int.patch b/meta-oe/recipes-extended/tipcutils/tipcutils/0002-replace-non-standard-uint-with-unsigned-int.patch
index 03e711e9a4..89eae015c6 100644
--- a/meta-oe/recipes-extended/tipcutils/tipcutils/0002-replace-non-standard-uint-with-unsigned-int.patch
+++ b/meta-oe/recipes-extended/tipcutils/tipcutils/0002-replace-non-standard-uint-with-unsigned-int.patch
@@ -7,6 +7,8 @@ make it portable on musl
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  demos/benchmark/client_tipc.c       | 34 +++++++++++++++++-----------------
  demos/benchmark/common_tipc.h       |  2 +-
  demos/benchmark/server_tipc.c       | 10 +++++-----
diff --git a/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-include-required-system-header-files-for-fd_set-and-.patch b/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-include-required-system-header-files-for-fd_set-and-.patch
index 38e945d64d..02aca7da45 100644
--- a/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-include-required-system-header-files-for-fd_set-and-.patch
+++ b/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/0001-include-required-system-header-files-for-fd_set-and-.patch
@@ -8,6 +8,8 @@ makedev macro is defined in sys/sysmacros.h
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  uml_net/ethertap.c | 1 +
  uml_net/host.c     | 1 +
  2 files changed, 2 insertions(+)
diff --git a/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/fix-ldflags.patch b/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/fix-ldflags.patch
index f4a175cdfd..a66d7d5906 100644
--- a/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/fix-ldflags.patch
+++ b/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/fix-ldflags.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 
 #
 # Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
diff --git a/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/unstrip.patch b/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/unstrip.patch
index 868001dbd5..b6fce00986 100644
--- a/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/unstrip.patch
+++ b/meta-oe/recipes-extended/uml-utilities/uml-utilities-20040406/unstrip.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Dont strip during install let the packaging handle it
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
diff --git a/meta-oe/recipes-extended/upm/upm/0001-CMakeLists.txt-Use-SWIG_SUPPORT_FILES-to-find-the-li.patch b/meta-oe/recipes-extended/upm/upm/0001-CMakeLists.txt-Use-SWIG_SUPPORT_FILES-to-find-the-li.patch
index 4b9a195e02..8c3b148369 100644
--- a/meta-oe/recipes-extended/upm/upm/0001-CMakeLists.txt-Use-SWIG_SUPPORT_FILES-to-find-the-li.patch
+++ b/meta-oe/recipes-extended/upm/upm/0001-CMakeLists.txt-Use-SWIG_SUPPORT_FILES-to-find-the-li.patch
@@ -10,6 +10,8 @@ cmake version 3.12 or higher
 
 Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
 ---
+Upstream-Status: Pending
+
  src/CMakeLists.txt | 8 +++++++-
  1 file changed, 7 insertions(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/musl-locale-l.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/musl-locale-l.patch
index f83d2d4458..e4ca6579f8 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/musl-locale-l.patch
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/musl-locale-l.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 these macro'd away functions don't exist in musl (yet)
 diff --git a/include/wx/xlocale.h b/include/wx/xlocale.h
 index c433d25..3ab9d84 100644
diff --git a/meta-oe/recipes-graphics/dietsplash/dietsplash/0001-configure.ac-Do-not-demand-linker-hash-style.patch b/meta-oe/recipes-graphics/dietsplash/dietsplash/0001-configure.ac-Do-not-demand-linker-hash-style.patch
index 87e8637eec..aad393b1d9 100644
--- a/meta-oe/recipes-graphics/dietsplash/dietsplash/0001-configure.ac-Do-not-demand-linker-hash-style.patch
+++ b/meta-oe/recipes-graphics/dietsplash/dietsplash/0001-configure.ac-Do-not-demand-linker-hash-style.patch
@@ -8,6 +8,8 @@ is not supported
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  configure.ac | 1 -
  1 file changed, 1 deletion(-)
 
diff --git a/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index 6a7b1bf31d..5740f4a819 100644
--- a/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python.
 
 Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
 ---
+Upstream-Status: Pending
+
  CMakeLists.txt | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-To-fix-error-when-do_package.patch b/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-To-fix-error-when-do_package.patch
index bef471189f..2951ee4555 100644
--- a/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-To-fix-error-when-do_package.patch
+++ b/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-To-fix-error-when-do_package.patch
@@ -11,6 +11,8 @@ shipped in any package:
 
 Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
 ---
+Upstream-Status: Pending
+
  CMakeLists.txt | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-disable-build-manpages.patch b/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-disable-build-manpages.patch
index c8b105ea35..078f525117 100644
--- a/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-disable-build-manpages.patch
+++ b/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-disable-build-manpages.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] disable build manpages.
 
 Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
 ---
+Upstream-Status: Pending
+
  CMakeLists.txt | 1 -
  1 file changed, 1 deletion(-)
 
diff --git a/meta-oe/recipes-graphics/fbida/files/fix-preprocessor.patch b/meta-oe/recipes-graphics/fbida/files/fix-preprocessor.patch
index cdeac996a1..ef70a070dd 100644
--- a/meta-oe/recipes-graphics/fbida/files/fix-preprocessor.patch
+++ b/meta-oe/recipes-graphics/fbida/files/fix-preprocessor.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- a/scripts/jpeg-version.sh
 +++ b/scripts/jpeg-version.sh
 @@ -1,2 +1,2 @@
diff --git a/meta-oe/recipes-graphics/fbida/files/support-jpeg-turbo.patch b/meta-oe/recipes-graphics/fbida/files/support-jpeg-turbo.patch
index 05cd74da92..719c096e2b 100644
--- a/meta-oe/recipes-graphics/fbida/files/support-jpeg-turbo.patch
+++ b/meta-oe/recipes-graphics/fbida/files/support-jpeg-turbo.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Add patch by Ondrej Sury to migrate to libjpeg-turbo (Closes: #763263)
 
 Index: fbida-2.10/jpeg/62/jpegcomp.h
diff --git a/meta-oe/recipes-graphics/glm/glm/0001-Do-not-use-Werror-with-clang.patch b/meta-oe/recipes-graphics/glm/glm/0001-Do-not-use-Werror-with-clang.patch
index 7b3e005ff9..dee2749898 100644
--- a/meta-oe/recipes-graphics/glm/glm/0001-Do-not-use-Werror-with-clang.patch
+++ b/meta-oe/recipes-graphics/glm/glm/0001-Do-not-use-Werror-with-clang.patch
@@ -7,6 +7,8 @@ Too many warnings to handle for a distro build
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  test/CMakeLists.txt | 4 ----
  1 file changed, 4 deletions(-)
 
diff --git a/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-configure.ac-remove-AM_PO_SUBDIRS.patch b/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-configure.ac-remove-AM_PO_SUBDIRS.patch
index eaef8180ee..14976ffb72 100644
--- a/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-configure.ac-remove-AM_PO_SUBDIRS.patch
+++ b/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-configure.ac-remove-AM_PO_SUBDIRS.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] configure.ac remove AM_PO_SUBDIRS
 This is done twice together with oe autotools.bbclass.
 
 ---
+Upstream-Status: Pending
+
  configure.ac | 1 -
  1 file changed, 1 deletion(-)
 
diff --git a/meta-oe/recipes-graphics/gtkperf/gtkperf/0001-Include-stdlib.h-for-exit-API.patch b/meta-oe/recipes-graphics/gtkperf/gtkperf/0001-Include-stdlib.h-for-exit-API.patch
index d529ddd234..949151a827 100644
--- a/meta-oe/recipes-graphics/gtkperf/gtkperf/0001-Include-stdlib.h-for-exit-API.patch
+++ b/meta-oe/recipes-graphics/gtkperf/gtkperf/0001-Include-stdlib.h-for-exit-API.patch
@@ -14,6 +14,8 @@ http://sources.debian.net/src/gtkperf/0.40%2Bds-2/debian/patches/01-include_stdl
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  src/main.c | 1 +
  1 file changed, 1 insertion(+)
 
diff --git a/meta-oe/recipes-graphics/gtkperf/gtkperf/0002-timing.c-Fix-format-security-errors.patch b/meta-oe/recipes-graphics/gtkperf/gtkperf/0002-timing.c-Fix-format-security-errors.patch
index 0548040af7..f975acabad 100644
--- a/meta-oe/recipes-graphics/gtkperf/gtkperf/0002-timing.c-Fix-format-security-errors.patch
+++ b/meta-oe/recipes-graphics/gtkperf/gtkperf/0002-timing.c-Fix-format-security-errors.patch
@@ -5,6 +5,8 @@ Subject: [PATCH 2/2] timing.c: Fix format-security errors
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  src/timing.c | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
diff --git a/meta-oe/recipes-graphics/libdecor/libdecor/0001-libdecor-gtk.c-dont-skip-for-conflicting-symbols.patch b/meta-oe/recipes-graphics/libdecor/libdecor/0001-libdecor-gtk.c-dont-skip-for-conflicting-symbols.patch
index c9d63c9079..9ecbdf3b37 100644
--- a/meta-oe/recipes-graphics/libdecor/libdecor/0001-libdecor-gtk.c-dont-skip-for-conflicting-symbols.patch
+++ b/meta-oe/recipes-graphics/libdecor/libdecor/0001-libdecor-gtk.c-dont-skip-for-conflicting-symbols.patch
@@ -10,6 +10,8 @@ https://gitlab.freedesktop.org/libdecor/libdecor/-/issues/47
 https://gitlab.freedesktop.org/libdecor/libdecor/-/issues/44
 
 ---
+Upstream-Status: Pending
+
  src/plugins/gtk/libdecor-gtk.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-graphics/libforms/files/add-absolute-path-for-include-dir.patch b/meta-oe/recipes-graphics/libforms/files/add-absolute-path-for-include-dir.patch
index db400f7022..4836b46b11 100644
--- a/meta-oe/recipes-graphics/libforms/files/add-absolute-path-for-include-dir.patch
+++ b/meta-oe/recipes-graphics/libforms/files/add-absolute-path-for-include-dir.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -Naur xforms-1.2.3.orig/fdesign/Makefile.am xforms-1.2.3/fdesign/Makefile.am
 --- xforms-1.2.3.orig/fdesign/Makefile.am	2019-02-24 12:58:51.968645873 +0000
 +++ xforms-1.2.3/fdesign/Makefile.am	2019-02-24 13:00:48.500635163 +0000
diff --git a/meta-oe/recipes-graphics/libforms/files/fix-link-to-xforms-man.patch b/meta-oe/recipes-graphics/libforms/files/fix-link-to-xforms-man.patch
index c95bd18da8..9ab67b35ac 100644
--- a/meta-oe/recipes-graphics/libforms/files/fix-link-to-xforms-man.patch
+++ b/meta-oe/recipes-graphics/libforms/files/fix-link-to-xforms-man.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -Naur xforms-1.2.3.orig/lib/Makefile.am xforms-1.2.3/lib/Makefile.am
 --- xforms-1.2.3.orig/lib/Makefile.am	2019-02-24 12:53:58.340678373 +0000
 +++ xforms-1.2.3/lib/Makefile.am	2019-02-24 12:54:33.096674102 +0000
diff --git a/meta-oe/recipes-graphics/libforms/files/fix-path-fdesign_LDADD.patch b/meta-oe/recipes-graphics/libforms/files/fix-path-fdesign_LDADD.patch
index 73956dee9f..dc494281b2 100644
--- a/meta-oe/recipes-graphics/libforms/files/fix-path-fdesign_LDADD.patch
+++ b/meta-oe/recipes-graphics/libforms/files/fix-path-fdesign_LDADD.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -Naur xforms-1.2.3.orig/fdesign/Makefile.am xforms-1.2.3/fdesign/Makefile.am
 --- xforms-1.2.3.orig/fdesign/Makefile.am	2019-02-24 13:08:48.412603250 +0000
 +++ xforms-1.2.3/fdesign/Makefile.am	2019-02-24 13:09:18.412601874 +0000
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-13616.patch b/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-13616.patch
index 2db67966cf..d4166a16ab 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-13616.patch
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-13616.patch
@@ -3,6 +3,8 @@ From: Sam Lantinga <slouken@libsdl.org>
 Date: Tue, 30 Jul 2019 11:00:00 -0700
 Subject: [PATCH] Fixed bug 4538 - validate image size when loading BMP files
 ---
+Upstream-Status: Pending
+
  src/video/SDL_bmp.c | 5 +++++
  1 file changed, 5 insertions(+)
 
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-image/configure.patch b/meta-oe/recipes-graphics/libsdl/libsdl-image/configure.patch
index 5299d378eb..102cec7288 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-image/configure.patch
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-image/configure.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: SDL_image-1.2.12/configure.in
 ===================================================================
 --- SDL_image-1.2.12.orig/configure.in	2012-01-21 01:51:33.000000000 +0000
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-mixer/configure.patch b/meta-oe/recipes-graphics/libsdl/libsdl-mixer/configure.patch
index 4c9e8d094c..7330ef61aa 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-mixer/configure.patch
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-mixer/configure.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -Nurd SDL_mixer-1.2.12/configure.in SDL_mixer-1.2.12/configure.in
 --- SDL_mixer-1.2.12/configure.in	2012-01-16 00:01:05.000000000 +0200
 +++ SDL_mixer-1.2.12/configure.in	2012-12-15 04:08:04.627871456 +0200
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-net/am_foreign.patch b/meta-oe/recipes-graphics/libsdl/libsdl-net/am_foreign.patch
index fb3ff7e689..7911a2aa75 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-net/am_foreign.patch
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-net/am_foreign.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -Nurd SDL_net-1.2.8/Makefile.am SDL_net-1.2.8/Makefile.am
 --- SDL_net-1.2.8/Makefile.am	2012-01-15 18:20:10.000000000 +0200
 +++ SDL_net-1.2.8/Makefile.am	2014-08-01 21:18:52.720815807 +0300
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-net/libtool2.patch b/meta-oe/recipes-graphics/libsdl/libsdl-net/libtool2.patch
index 9718a3b94a..e491c1abce 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-net/libtool2.patch
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-net/libtool2.patch
@@ -3,6 +3,8 @@ From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
 Date: Wed, 17 Oct 2012 20:51:51 +0200
 
 ---
+Upstream-Status: Pending
+
  configure.in | 2 ++
  1 file changed, 2 insertions(+)
 
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-ttf/use.pkg-config.for.freetype2.patch b/meta-oe/recipes-graphics/libsdl/libsdl-ttf/use.pkg-config.for.freetype2.patch
index 1116c34d07..d174d7ab5c 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-ttf/use.pkg-config.for.freetype2.patch
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-ttf/use.pkg-config.for.freetype2.patch
@@ -8,6 +8,8 @@ commit 5870bd272b0b077d0826fb900b251884c1c05061
     binconfig-disabled: Add class and use
 
 ---
+Upstream-Status: Pending
+
  configure.in | 38 +++++---------------------------------
  1 file changed, 5 insertions(+), 33 deletions(-)
 
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf/automake_foreign.patch b/meta-oe/recipes-graphics/libsdl/libsdl2-ttf/automake_foreign.patch
index 962c119791..bc9371553f 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf/automake_foreign.patch
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-ttf/automake_foreign.patch
@@ -3,6 +3,8 @@ From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 9 May 2017 00:57:10 -0700
 
 ---
+Upstream-Status: Pending
+
  Makefile.am | 2 ++
  1 file changed, 2 insertions(+)
 
diff --git a/meta-oe/recipes-graphics/lxdm/lxdm/0003-check-for-libexecinfo-providing-backtrace-APIs.patch b/meta-oe/recipes-graphics/lxdm/lxdm/0003-check-for-libexecinfo-providing-backtrace-APIs.patch
index f9fd4970fb..31b12f8078 100644
--- a/meta-oe/recipes-graphics/lxdm/lxdm/0003-check-for-libexecinfo-providing-backtrace-APIs.patch
+++ b/meta-oe/recipes-graphics/lxdm/lxdm/0003-check-for-libexecinfo-providing-backtrace-APIs.patch
@@ -8,6 +8,8 @@ unlike glibc where it is bundled in
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  configure.ac | 2 ++
  1 file changed, 2 insertions(+)
 
diff --git a/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner/0001-meson.build-WORKAROUND-Remove-vulkan-dependency.patch b/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner/0001-meson.build-WORKAROUND-Remove-vulkan-dependency.patch
index 0fedfad132..02ef3cce76 100644
--- a/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner/0001-meson.build-WORKAROUND-Remove-vulkan-dependency.patch
+++ b/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner/0001-meson.build-WORKAROUND-Remove-vulkan-dependency.patch
@@ -11,6 +11,8 @@ contains vulkan.
 
 Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
 ---
+Upstream-Status: Pending
+
  meson.build | 6 ------
  1 file changed, 6 deletions(-)
 
diff --git a/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch b/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch
index 93f1a9f42e..6011f4e3ac 100644
--- a/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch
+++ b/meta-oe/recipes-graphics/surf/surf/0001-config.mk-Fix-compiler-and-linker.patch
@@ -7,6 +7,8 @@ Fix LIBS
 
 Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
+Upstream-Status: Pending
+
  config.mk | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-graphics/surf/surf/0001-config.ml-make-compatible-with-webkitgtk-2.34.0.patch b/meta-oe/recipes-graphics/surf/surf/0001-config.ml-make-compatible-with-webkitgtk-2.34.0.patch
index f31018c3de..d273d1459f 100644
--- a/meta-oe/recipes-graphics/surf/surf/0001-config.ml-make-compatible-with-webkitgtk-2.34.0.patch
+++ b/meta-oe/recipes-graphics/surf/surf/0001-config.ml-make-compatible-with-webkitgtk-2.34.0.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] config.ml: make compatible with webkitgtk 2.34.0
 
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
 ---
+Upstream-Status: Pending
+
  config.mk | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/fix-clang-private-operator.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/fix-clang-private-operator.patch
index ea7659c698..4ecc371ca4 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/files/fix-clang-private-operator.patch
+++ b/meta-oe/recipes-graphics/vk-gl-cts/files/fix-clang-private-operator.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- a/external/glslang/src/glslang/Include/PoolAlloc.h
 +++ b/external/glslang/src/glslang/Include/PoolAlloc.h
 @@ -240,8 +240,9 @@ protected:
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/fix-musl.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/fix-musl.patch
index 99cb87b301..58dc1f24dd 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/files/fix-musl.patch
+++ b/meta-oe/recipes-graphics/vk-gl-cts/files/fix-musl.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- a/framework/delibs/dethread/CMakeLists.txt
 +++ b/framework/delibs/dethread/CMakeLists.txt
 @@ -42,6 +42,7 @@ if (DE_OS_IS_UNIX)
diff --git a/meta-oe/recipes-graphics/xorg-lib/liblbxutil-1.1.0/mkg3states-1.1.patch b/meta-oe/recipes-graphics/xorg-lib/liblbxutil-1.1.0/mkg3states-1.1.patch
index f9f4a6382c..af7d208282 100644
--- a/meta-oe/recipes-graphics/xorg-lib/liblbxutil-1.1.0/mkg3states-1.1.patch
+++ b/meta-oe/recipes-graphics/xorg-lib/liblbxutil-1.1.0/mkg3states-1.1.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -uNr liblbxutil-1.1.0.orig/configure.ac liblbxutil-1.1.0/configure.ac
 --- liblbxutil-1.1.0.orig/configure.ac	2009-12-04 23:52:04.000000000 +0100
 +++ liblbxutil-1.1.0/configure.ac	2009-12-16 10:45:00.000000000 +0100
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0001-COPYING-add-GPLv2-license-file.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0001-COPYING-add-GPLv2-license-file.patch
index 2bfe85b285..6f738e7376 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0001-COPYING-add-GPLv2-license-file.patch
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0001-COPYING-add-GPLv2-license-file.patch
@@ -11,6 +11,8 @@ Signed-off-by: Yu Ke <ke.yu@intel.com>
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  COPYING | 339 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  1 file changed, 339 insertions(+)
  create mode 100644 COPYING
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0001-Don-t-install-Xsession-or-Xserver.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0001-Don-t-install-Xsession-or-Xserver.patch
index 0ed12d106f..ea7c7d6a94 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0001-Don-t-install-Xsession-or-Xserver.patch
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0001-Don-t-install-Xsession-or-Xserver.patch
@@ -10,6 +10,8 @@ be used as before.
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 
 ---
+Upstream-Status: Pending
+
  Makefile | 2 --
  1 file changed, 2 deletions(-)
 
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0002-add-setdpi-Xinit.d-script.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0002-add-setdpi-Xinit.d-script.patch
index 0be3fa5b39..b408234ecb 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0002-add-setdpi-Xinit.d-script.patch
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0002-add-setdpi-Xinit.d-script.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] add setdpi Xinit.d script
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  X11/Xinit.d/50setdpi | 92 ++++++++++++++++++++++++++++++++++++++++++++++++++++
  1 file changed, 92 insertions(+)
  create mode 100644 X11/Xinit.d/50setdpi
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0006-add-support-for-etc-X11-xserver-system.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0006-add-support-for-etc-X11-xserver-system.patch
index 53a283feae..4a9342c934 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0006-add-support-for-etc-X11-xserver-system.patch
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0006-add-support-for-etc-X11-xserver-system.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] add support for /etc/X11/xserver-system
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  X11/xserver-common | 5 +++++
  1 file changed, 5 insertions(+)
 
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0007-use-own-functions-file-instead-etc-init.d-functions.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0007-use-own-functions-file-instead-etc-init.d-functions.patch
index 94a35407af..ba35d1cf6c 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0007-use-own-functions-file-instead-etc-init.d-functions.patch
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0007-use-own-functions-file-instead-etc-init.d-functions.patch
@@ -8,6 +8,8 @@ Subject: [PATCH] use own functions file instead /etc/init.d/functions
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  Makefile             |  1 +
  X11/Xinit.d/11zaurus |  2 +-
  X11/Xinit.d/12keymap |  2 +-
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0008-xserver-common-add-dpi-and-nocursor-params-for-gta01.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0008-xserver-common-add-dpi-and-nocursor-params-for-gta01.patch
index 90d0f25843..a04e563f82 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0008-xserver-common-add-dpi-and-nocursor-params-for-gta01.patch
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0008-xserver-common-add-dpi-and-nocursor-params-for-gta01.patch
@@ -7,6 +7,8 @@ Subject: [PATCH] xserver-common: add dpi and nocursor params for gta01 and
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  X11/xserver-common | 8 ++++++--
  1 file changed, 6 insertions(+), 2 deletions(-)
 
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0009-xserver-common-add-support-for-n900-alias-nokia_rx-5.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0009-xserver-common-add-support-for-n900-alias-nokia_rx-5.patch
index 8fb69b3561..993b320154 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0009-xserver-common-add-support-for-n900-alias-nokia_rx-5.patch
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0009-xserver-common-add-support-for-n900-alias-nokia_rx-5.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] xserver-common: add support for n900 alias nokia_rx-51_board
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  X11/xserver-common | 7 +++++++
  1 file changed, 7 insertions(+)
 
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0010-xserver-common-add-support-for-nexus-S-alias-herring.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0010-xserver-common-add-support-for-nexus-S-alias-herring.patch
index d30c7bbdcb..2948cd611b 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0010-xserver-common-add-support-for-nexus-S-alias-herring.patch
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0010-xserver-common-add-support-for-nexus-S-alias-herring.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] xserver-common: add support for nexus S alias herring
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  X11/xserver-common | 3 +++
  1 file changed, 3 insertions(+)
 
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0011-xserver-common-add-support-for-nexus-one-alias-mahim.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0011-xserver-common-add-support-for-nexus-one-alias-mahim.patch
index 23e17f0988..342d49becd 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0011-xserver-common-add-support-for-nexus-one-alias-mahim.patch
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0011-xserver-common-add-support-for-nexus-one-alias-mahim.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] xserver-common: add support for nexus one alias mahimahi
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  X11/xserver-common | 3 +++
  1 file changed, 3 insertions(+)
 
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0012-xserver-common-add-support-for-gta04-alias-OpenPhoen.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0012-xserver-common-add-support-for-gta04-alias-OpenPhoen.patch
index 5e794f6b31..94f9d2ca6f 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0012-xserver-common-add-support-for-gta04-alias-OpenPhoen.patch
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0012-xserver-common-add-support-for-gta04-alias-OpenPhoen.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] xserver-common: add support for gta04 alias OpenPhoenux
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  X11/xserver-common | 8 ++++++++
  1 file changed, 8 insertions(+)
 
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0013-xserver-common-add-support-for-tuna-alias-Galaxy-Nex.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0013-xserver-common-add-support-for-tuna-alias-Galaxy-Nex.patch
index 78d2e40297..c023b583b0 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0013-xserver-common-add-support-for-tuna-alias-Galaxy-Nex.patch
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0013-xserver-common-add-support-for-tuna-alias-Galaxy-Nex.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] xserver-common: add support for tuna alias Galaxy Nexus
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  X11/xserver-common | 8 ++++++++
  1 file changed, 8 insertions(+)
 
diff --git a/meta-oe/recipes-kernel/crash/crash/0001-cross_add_configure_option.patch b/meta-oe/recipes-kernel/crash/crash/0001-cross_add_configure_option.patch
index fc5cc3ddfb..fc99ff5187 100644
--- a/meta-oe/recipes-kernel/crash/crash/0001-cross_add_configure_option.patch
+++ b/meta-oe/recipes-kernel/crash/crash/0001-cross_add_configure_option.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] cross_add_configure_option
 
 
 ---
+Upstream-Status: Pending
+
  Makefile | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
diff --git a/meta-oe/recipes-kernel/crash/crash/7001force_define_architecture.patch b/meta-oe/recipes-kernel/crash/crash/7001force_define_architecture.patch
index 0d44c7f176..b5f97228de 100644
--- a/meta-oe/recipes-kernel/crash/crash/7001force_define_architecture.patch
+++ b/meta-oe/recipes-kernel/crash/crash/7001force_define_architecture.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -uprN crash-5.1.8.org/configure.c crash-5.1.8/configure.c
 --- crash-5.1.8.org/configure.c	2011-09-17 04:01:12.000000000 +0900
 +++ crash-5.1.8/configure.c	2012-09-13 13:28:45.393344108 +0900
diff --git a/meta-oe/recipes-kernel/crash/crash/7003cross_ranlib.patch b/meta-oe/recipes-kernel/crash/crash/7003cross_ranlib.patch
index a0d87f1b9e..2d01453059 100644
--- a/meta-oe/recipes-kernel/crash/crash/7003cross_ranlib.patch
+++ b/meta-oe/recipes-kernel/crash/crash/7003cross_ranlib.patch
@@ -4,6 +4,8 @@ Date: Mon, 12 Jan 2015 11:52:35 +0800
 Subject: [PATCH] crash: add new recipe
 
 ---
+Upstream-Status: Pending
+
  Makefile | 1 +
  1 file changed, 1 insertion(+)
 
diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/userfaultfd.patch b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/userfaultfd.patch
index bed20510e8..d34c54754e 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/userfaultfd.patch
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/userfaultfd.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] vm: add some funtions to support musl libc
 
 Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
 ---
+Upstream-Status: Pending
+
  tools/testing/selftests/vm/userfaultfd.c | 298 +++++++++++++++++++++++++++++++
  1 file changed, 298 insertions(+)
 
diff --git a/meta-oe/recipes-multimedia/audiofile/files/0001-fix-negative-shift-constants.patch b/meta-oe/recipes-multimedia/audiofile/files/0001-fix-negative-shift-constants.patch
index ecb3108050..4792a15e86 100644
--- a/meta-oe/recipes-multimedia/audiofile/files/0001-fix-negative-shift-constants.patch
+++ b/meta-oe/recipes-multimedia/audiofile/files/0001-fix-negative-shift-constants.patch
@@ -14,6 +14,8 @@ Upstrem-Status: Pending
 
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 ---
+Upstream-Status: Pending
+
  libaudiofile/modules/SimpleModule.h | 2 +-
  test/FloatToInt.cpp                 | 2 +-
  test/IntToFloat.cpp                 | 2 +-
diff --git a/meta-oe/recipes-multimedia/audiofile/files/0002-fix-build-on-gcc6.patch b/meta-oe/recipes-multimedia/audiofile/files/0002-fix-build-on-gcc6.patch
index 2c66cf4d00..dea8187ccb 100644
--- a/meta-oe/recipes-multimedia/audiofile/files/0002-fix-build-on-gcc6.patch
+++ b/meta-oe/recipes-multimedia/audiofile/files/0002-fix-build-on-gcc6.patch
@@ -14,6 +14,8 @@ Upstrem-Status: Pending
 
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 ---
+Upstream-Status: Pending
+
  test/NeXT.cpp | 14 +++++++-------
  1 file changed, 7 insertions(+), 7 deletions(-)
 
diff --git a/meta-oe/recipes-multimedia/cdrkit/files/0001-define-__THROW-to-avoid-build-issue-with-musl.patch b/meta-oe/recipes-multimedia/cdrkit/files/0001-define-__THROW-to-avoid-build-issue-with-musl.patch
index b3beb069eb..95a5ddd7dd 100644
--- a/meta-oe/recipes-multimedia/cdrkit/files/0001-define-__THROW-to-avoid-build-issue-with-musl.patch
+++ b/meta-oe/recipes-multimedia/cdrkit/files/0001-define-__THROW-to-avoid-build-issue-with-musl.patch
@@ -8,6 +8,8 @@ http://autobuild.buildroot.net/results/d27/d2781e70b04a207e2e9397d888032294c7285
 
 Signed-off-by: Romain Naour <romain.naour@openwide.fr>
 ---
+Upstream-Status: Pending
+
  genisoimage/sha256.h | 4 ++++
  genisoimage/sha512.h | 4 ++++
  2 files changed, 8 insertions(+)
diff --git a/meta-oe/recipes-multimedia/cdrkit/files/0001-genisoimage-Fix-fprintf-format-errors.patch b/meta-oe/recipes-multimedia/cdrkit/files/0001-genisoimage-Fix-fprintf-format-errors.patch
index f52f71b632..1a2c1a91cf 100644
--- a/meta-oe/recipes-multimedia/cdrkit/files/0001-genisoimage-Fix-fprintf-format-errors.patch
+++ b/meta-oe/recipes-multimedia/cdrkit/files/0001-genisoimage-Fix-fprintf-format-errors.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] genisoimage: Fix fprintf format errors
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  genisoimage/genisoimage.c | 4 ++--
  genisoimage/tree.c        | 2 +-
  2 files changed, 3 insertions(+), 3 deletions(-)
diff --git a/meta-oe/recipes-multimedia/cdrkit/files/0002-Do-not-use-rcmd-on-build-with-musl.patch b/meta-oe/recipes-multimedia/cdrkit/files/0002-Do-not-use-rcmd-on-build-with-musl.patch
index 547a21c67f..47c12928b7 100644
--- a/meta-oe/recipes-multimedia/cdrkit/files/0002-Do-not-use-rcmd-on-build-with-musl.patch
+++ b/meta-oe/recipes-multimedia/cdrkit/files/0002-Do-not-use-rcmd-on-build-with-musl.patch
@@ -8,6 +8,8 @@ on musl.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  include/xconfig.h.in | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-multimedia/libmad/libmad/0004-Remove-clang-unsupported-compiler-flags.patch b/meta-oe/recipes-multimedia/libmad/libmad/0004-Remove-clang-unsupported-compiler-flags.patch
index 70723f2d08..b9a444dc32 100644
--- a/meta-oe/recipes-multimedia/libmad/libmad/0004-Remove-clang-unsupported-compiler-flags.patch
+++ b/meta-oe/recipes-multimedia/libmad/libmad/0004-Remove-clang-unsupported-compiler-flags.patch
@@ -4,6 +4,8 @@ Date: Tue, 16 Sep 2014 12:28:47 +0300
 Subject: [PATCH 4/4] Remove clang unsupported compiler flags
 
 ---
+Upstream-Status: Pending
+
  configure.ac | 12 ++++++------
  1 file changed, 6 insertions(+), 6 deletions(-)
 
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch
index 8ac8fbe19e..52f0cd3388 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch
@@ -13,6 +13,8 @@ Conflicts:
 	utils/media-ctl/Makefile.am
 
 ---
+Upstream-Status: Pending
+
  utils/media-ctl/Makefile.am | 10 +++-------
  1 file changed, 3 insertions(+), 7 deletions(-)
 
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-original-patch-mediactl-pkgconfig.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-original-patch-mediactl-pkgconfig.patch
index 52fc2d7a8d..d52475974f 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-original-patch-mediactl-pkgconfig.patch
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-original-patch-mediactl-pkgconfig.patch
@@ -4,6 +4,8 @@ Date: Sun, 1 Mar 2015 22:25:07 +0000
 Subject: [PATCH] %% original patch: mediactl-pkgconfig.patch
 
 ---
+Upstream-Status: Pending
+
  utils/media-ctl/Makefile.am | 1 +
  1 file changed, 1 insertion(+)
 
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-original-patch-export-mediactl-headers.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-original-patch-export-mediactl-headers.patch
index 39dc338350..f6fcee92ea 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-original-patch-export-mediactl-headers.patch
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-original-patch-export-mediactl-headers.patch
@@ -4,6 +4,8 @@ Date: Sun, 1 Mar 2015 22:25:07 +0000
 Subject: [PATCH] %% original patch: export-mediactl-headers.patch
 
 ---
+Upstream-Status: Pending
+
  utils/media-ctl/Makefile.am | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
diff --git a/meta-oe/recipes-multimedia/webm/libvpx/libvpx-configure-support-blank-prefix.patch b/meta-oe/recipes-multimedia/webm/libvpx/libvpx-configure-support-blank-prefix.patch
index 6ad7f2b478..e0fd4fea1b 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx/libvpx-configure-support-blank-prefix.patch
+++ b/meta-oe/recipes-multimedia/webm/libvpx/libvpx-configure-support-blank-prefix.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] Upstream: not yet
 Fix configure to accept "--prefix=" (a blank prefix).
 
 ---
+Upstream-Status: Pending
+
  build/make/configure.sh | 20 ++++++++++++++++----
  1 file changed, 16 insertions(+), 4 deletions(-)
 
diff --git a/meta-oe/recipes-multimedia/xpext/xpext/auxdir.patch b/meta-oe/recipes-multimedia/xpext/xpext/auxdir.patch
index da5841a132..ea9326946e 100644
--- a/meta-oe/recipes-multimedia/xpext/xpext/auxdir.patch
+++ b/meta-oe/recipes-multimedia/xpext/xpext/auxdir.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- configure.ac.old	2005-06-03 12:53:28.000000000 +0200
 +++ configure.ac	2005-06-03 12:54:29.000000000 +0200
 @@ -25,9 +25,9 @@
diff --git a/meta-oe/recipes-multimedia/xsp/xsp/xsp-fix-pc.patch b/meta-oe/recipes-multimedia/xsp/xsp/xsp-fix-pc.patch
index 18bc67cdd9..995f03113b 100644
--- a/meta-oe/recipes-multimedia/xsp/xsp/xsp-fix-pc.patch
+++ b/meta-oe/recipes-multimedia/xsp/xsp/xsp-fix-pc.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- Xsp/xsp.pc.in~	2009-01-07 13:06:07.000000000 +0100
 +++ Xsp/xsp.pc.in	2009-01-07 13:06:07.000000000 +0100
 @@ -6,5 +6,5 @@
diff --git a/meta-oe/recipes-navigation/libspatialite/libspatialite/libspatialite_geos.patch b/meta-oe/recipes-navigation/libspatialite/libspatialite/libspatialite_geos.patch
index 7d8d2c2e46..569ea76bb5 100644
--- a/meta-oe/recipes-navigation/libspatialite/libspatialite/libspatialite_geos.patch
+++ b/meta-oe/recipes-navigation/libspatialite/libspatialite/libspatialite_geos.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -rupN --no-dereference libspatialite-5.0.1/configure.ac libspatialite-5.0.1-new/configure.ac
 --- libspatialite-5.0.1/configure.ac	2021-03-08 08:57:19.015858195 +0100
 +++ libspatialite-5.0.1-new/configure.ac	2021-03-08 08:57:19.017858195 +0100
diff --git a/meta-oe/recipes-navigation/libspatialite/libspatialite/libspatialite_macros.patch b/meta-oe/recipes-navigation/libspatialite/libspatialite/libspatialite_macros.patch
index 9b71ab7658..6f1c165f58 100644
--- a/meta-oe/recipes-navigation/libspatialite/libspatialite/libspatialite_macros.patch
+++ b/meta-oe/recipes-navigation/libspatialite/libspatialite/libspatialite_macros.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -rupN --no-dereference libspatialite-5.0.1/configure.ac libspatialite-5.0.1-new/configure.ac
 --- libspatialite-5.0.1/configure.ac	2021-03-08 08:57:18.748858216 +0100
 +++ libspatialite-5.0.1-new/configure.ac	2021-03-08 08:57:18.751858215 +0100
diff --git a/meta-oe/recipes-navigation/libspatialite/libspatialite/libspatialite_pkgconfig.patch b/meta-oe/recipes-navigation/libspatialite/libspatialite/libspatialite_pkgconfig.patch
index 149c126768..de6e50a58d 100644
--- a/meta-oe/recipes-navigation/libspatialite/libspatialite/libspatialite_pkgconfig.patch
+++ b/meta-oe/recipes-navigation/libspatialite/libspatialite/libspatialite_pkgconfig.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -rupN libspatialite-5.0.1/spatialite.pc.in libspatialite-5.0.1-new/spatialite.pc.in
 --- libspatialite-5.0.1/spatialite.pc.in	2021-02-07 16:53:46.000000000 +0100
 +++ libspatialite-5.0.1-new/spatialite.pc.in	2021-02-10 09:54:09.647552994 +0100
diff --git a/meta-oe/recipes-navigation/orrery/orrery/0001-orrery-Fix-sprintf-format.patch b/meta-oe/recipes-navigation/orrery/orrery/0001-orrery-Fix-sprintf-format.patch
index eb6241fdd0..3d5828011a 100644
--- a/meta-oe/recipes-navigation/orrery/orrery/0001-orrery-Fix-sprintf-format.patch
+++ b/meta-oe/recipes-navigation/orrery/orrery/0001-orrery-Fix-sprintf-format.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] orrery: Fix sprintf format
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  orrery.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-navigation/orrery/orrery/use.GdkPixbuf.patch b/meta-oe/recipes-navigation/orrery/orrery/use.GdkPixbuf.patch
index 92d194de08..2abb320d83 100644
--- a/meta-oe/recipes-navigation/orrery/orrery/use.GdkPixbuf.patch
+++ b/meta-oe/recipes-navigation/orrery/orrery/use.GdkPixbuf.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 From: Benjamin Deering
 Subject: orrery crashing X
 Date: Thursday, September 2, 2010 - 5:25 pm
diff --git a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/CVE-2019-19906.patch b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/CVE-2019-19906.patch
index 33a9e3f6e6..8c95268bb5 100644
--- a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/CVE-2019-19906.patch
+++ b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/CVE-2019-19906.patch
@@ -14,6 +14,8 @@ Upstream-Stauts: Backport [https://github.com/cyrusimap/cyrus-sasl
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
+Upstream-Status: Pending
+
  lib/common.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/debian_patches_0014_avoid_pic_overwrite.diff b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/debian_patches_0014_avoid_pic_overwrite.diff
index 0479acfb09..a5f2f5dd91 100644
--- a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/debian_patches_0014_avoid_pic_overwrite.diff
+++ b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl/debian_patches_0014_avoid_pic_overwrite.diff
@@ -10,6 +10,8 @@ the non-PIC version in the current directory.  This ensures that both non-PIC
 and PIC versions are available in the correct locations.
 
 ---
+Upstream-Status: Pending
+
  lib/Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-printing/cups/cups-pk-helper/dont-localize-org.opensuse.CupsPkHelper.Mechanism.service.patch b/meta-oe/recipes-printing/cups/cups-pk-helper/dont-localize-org.opensuse.CupsPkHelper.Mechanism.service.patch
index 86c09c9f84..371ce01181 100644
--- a/meta-oe/recipes-printing/cups/cups-pk-helper/dont-localize-org.opensuse.CupsPkHelper.Mechanism.service.patch
+++ b/meta-oe/recipes-printing/cups/cups-pk-helper/dont-localize-org.opensuse.CupsPkHelper.Mechanism.service.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- a/src/meson.build	2023-01-24 09:22:59.874074134 +0100
 +++ b/src/meson.build	2023-01-24 09:27:00.494627305 +0100
 @@ -73,12 +73,12 @@
diff --git a/meta-oe/recipes-security/audit/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch b/meta-oe/recipes-security/audit/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch
index c2080e156d..23747c45f0 100644
--- a/meta-oe/recipes-security/audit/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch
+++ b/meta-oe/recipes-security/audit/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch
@@ -13,6 +13,8 @@ Fixes
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  auparse/auparse.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-security/keyutils/files/0001-Adhere-to-the-SOURCE_DATE_EPOCH-standard.patch b/meta-oe/recipes-security/keyutils/files/0001-Adhere-to-the-SOURCE_DATE_EPOCH-standard.patch
index 8984e6502f..ecc5b00967 100644
--- a/meta-oe/recipes-security/keyutils/files/0001-Adhere-to-the-SOURCE_DATE_EPOCH-standard.patch
+++ b/meta-oe/recipes-security/keyutils/files/0001-Adhere-to-the-SOURCE_DATE_EPOCH-standard.patch
@@ -9,6 +9,8 @@ otherwise fall back to the default behaviour.
 Signed-off-by: Jelle van der Waa <jelle@vdwaa.nl>
 Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
 ---
+Upstream-Status: Pending
+
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-security/nmap/files/0001-Include-time.h-header-to-pass-clang-compilation.patch b/meta-oe/recipes-security/nmap/files/0001-Include-time.h-header-to-pass-clang-compilation.patch
index f93af2d793..5ee28031b8 100644
--- a/meta-oe/recipes-security/nmap/files/0001-Include-time.h-header-to-pass-clang-compilation.patch
+++ b/meta-oe/recipes-security/nmap/files/0001-Include-time.h-header-to-pass-clang-compilation.patch
@@ -4,6 +4,8 @@ Date: Fri, 20 Sep 2019 15:02:45 -0400
 Subject: [PATCH] Include time.h header to pass clang compilation
 
 ---
+Upstream-Status: Pending
+
  nmap_error.cc       | 11 +----------
  nping/EchoServer.cc |  1 +
  osscan2.cc          |  1 +
diff --git a/meta-oe/recipes-shells/tcsh/tcsh/0001-Enable-system-malloc-on-all-linux.patch b/meta-oe/recipes-shells/tcsh/tcsh/0001-Enable-system-malloc-on-all-linux.patch
index f32d6e1500..3a3970ba95 100644
--- a/meta-oe/recipes-shells/tcsh/tcsh/0001-Enable-system-malloc-on-all-linux.patch
+++ b/meta-oe/recipes-shells/tcsh/tcsh/0001-Enable-system-malloc-on-all-linux.patch
@@ -9,6 +9,8 @@ as well. So switch to using system malloc
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  config_f.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-shells/tcsh/tcsh/0002-Add-debian-csh-scripts.patch b/meta-oe/recipes-shells/tcsh/tcsh/0002-Add-debian-csh-scripts.patch
index e4de6f7fe5..63b22075af 100644
--- a/meta-oe/recipes-shells/tcsh/tcsh/0002-Add-debian-csh-scripts.patch
+++ b/meta-oe/recipes-shells/tcsh/tcsh/0002-Add-debian-csh-scripts.patch
@@ -5,6 +5,8 @@ Subject: [PATCH 2/2] Add debian csh scripts
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  csh.cshrc  | 15 +++++++++++++++
  csh.login  |  8 ++++++++
  csh.logout |  1 +
diff --git a/meta-oe/recipes-support/anthy/anthy/2ch_t.patch b/meta-oe/recipes-support/anthy/anthy/2ch_t.patch
index bf9bdb63d7..a0d3f9c25e 100644
--- a/meta-oe/recipes-support/anthy/anthy/2ch_t.patch
+++ b/meta-oe/recipes-support/anthy/anthy/2ch_t.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 source: shamelessly stolen from debian ;-)
 purpose: add some entries particularly useful in Japanese 2channel anonymous website
          (at least that is my understanding ;-))
diff --git a/meta-oe/recipes-support/anthy/anthy/native-helpers.patch b/meta-oe/recipes-support/anthy/anthy/native-helpers.patch
index 47ce007b7f..0b2df01aba 100644
--- a/meta-oe/recipes-support/anthy/anthy/native-helpers.patch
+++ b/meta-oe/recipes-support/anthy/anthy/native-helpers.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 upstream: not applicable
 author: pH5
 comment: Stage the native anthy helpers mkfiledic, mkdepgraph, mkworddic, 
diff --git a/meta-oe/recipes-support/anthy/anthy/not_build_elc.patch b/meta-oe/recipes-support/anthy/anthy/not_build_elc.patch
index 1c5c494003..bedb5e0498 100644
--- a/meta-oe/recipes-support/anthy/anthy/not_build_elc.patch
+++ b/meta-oe/recipes-support/anthy/anthy/not_build_elc.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 upstream: not applicable
 source: stolen from debian
 
diff --git a/meta-oe/recipes-support/anthy/anthy/target-helpers.patch b/meta-oe/recipes-support/anthy/anthy/target-helpers.patch
index d22c3562a5..fc5c72c051 100644
--- a/meta-oe/recipes-support/anthy/anthy/target-helpers.patch
+++ b/meta-oe/recipes-support/anthy/anthy/target-helpers.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -Nurp anthy-9100h.org/calctrans/Makefile.am anthy-9100h/calctrans/Makefile.am
 --- anthy-9100h.org/calctrans/Makefile.am	2007-10-27 23:02:59.000000000 +0900
 +++ anthy-9100h/calctrans/Makefile.am	2014-11-11 17:14:42.152999991 +0900
diff --git a/meta-oe/recipes-support/canonical-multitouch/geis/0001-libgeis-Compare-the-first-character-of-string-to-nul.patch b/meta-oe/recipes-support/canonical-multitouch/geis/0001-libgeis-Compare-the-first-character-of-string-to-nul.patch
index 3b3acab245..4a9d25f326 100644
--- a/meta-oe/recipes-support/canonical-multitouch/geis/0001-libgeis-Compare-the-first-character-of-string-to-nul.patch
+++ b/meta-oe/recipes-support/canonical-multitouch/geis/0001-libgeis-Compare-the-first-character-of-string-to-nul.patch
@@ -13,6 +13,8 @@ fixes
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  libgeis/geis_v1.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
diff --git a/meta-oe/recipes-support/canonical-multitouch/geis/fix-indentation-for-gcc6.patch b/meta-oe/recipes-support/canonical-multitouch/geis/fix-indentation-for-gcc6.patch
index 389e1b3fd7..7f55ed9eaf 100644
--- a/meta-oe/recipes-support/canonical-multitouch/geis/fix-indentation-for-gcc6.patch
+++ b/meta-oe/recipes-support/canonical-multitouch/geis/fix-indentation-for-gcc6.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- geis-2.2.17/libgeis/geis_subscription.c.orig	2016-06-17 12:04:21.062938443 -0400
 +++ geis-2.2.17/libgeis/geis_subscription.c	2016-06-17 12:05:02.934939172 -0400
 @@ -237,9 +237,10 @@
diff --git a/meta-oe/recipes-support/ccid/ccid/0001-Add-build-rule-for-README.patch b/meta-oe/recipes-support/ccid/ccid/0001-Add-build-rule-for-README.patch
index 586ff18c32..46d30e8c16 100644
--- a/meta-oe/recipes-support/ccid/ccid/0001-Add-build-rule-for-README.patch
+++ b/meta-oe/recipes-support/ccid/ccid/0001-Add-build-rule-for-README.patch
@@ -5,6 +5,8 @@ Makefile.am: required file `./README' not found
 
 Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
 ---
+Upstream-Status: Pending
+
  Makefile.am | 1 +
  1 file changed, 1 insertion(+)
 
diff --git a/meta-oe/recipes-support/cpprest/cpprest/disable-float-tests.patch b/meta-oe/recipes-support/cpprest/cpprest/disable-float-tests.patch
index 3ff7f0dd31..b956db22fd 100644
--- a/meta-oe/recipes-support/cpprest/cpprest/disable-float-tests.patch
+++ b/meta-oe/recipes-support/cpprest/cpprest/disable-float-tests.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Description: new toolchain might have increased the float precision
 Author: Gianfranco Costamagna <locutusofborg@debian.org>
 Last-Update: 2017-10-28
diff --git a/meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch b/meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch
index 5f1f8a9f9c..961eaf7646 100644
--- a/meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch
+++ b/meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Description: Debian forbids calls to external websites.
 
 Author: Gianfranco Costamagna <locutus@debian.org>
diff --git a/meta-oe/recipes-support/daemontools/daemontools/0001-daemontools-Fix-QA-Issue.patch b/meta-oe/recipes-support/daemontools/daemontools/0001-daemontools-Fix-QA-Issue.patch
index 30e37cb1d3..139ff30f2e 100644
--- a/meta-oe/recipes-support/daemontools/daemontools/0001-daemontools-Fix-QA-Issue.patch
+++ b/meta-oe/recipes-support/daemontools/daemontools/0001-daemontools-Fix-QA-Issue.patch
@@ -9,6 +9,8 @@ ERROR: daemontools-0.76-r0 do_package_qa: QA Issue: No GNU_HASH in the elf binar
 
 Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
 ---
+Upstream-Status: Pending
+
  src/conf-ld | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-support/daemontools/daemontools/0001-error.h-include-errno.h-instead-of-extern-int.diff b/meta-oe/recipes-support/daemontools/daemontools/0001-error.h-include-errno.h-instead-of-extern-int.diff
index ce1959782a..b5eb7d8b1a 100644
--- a/meta-oe/recipes-support/daemontools/daemontools/0001-error.h-include-errno.h-instead-of-extern-int.diff
+++ b/meta-oe/recipes-support/daemontools/daemontools/0001-error.h-include-errno.h-instead-of-extern-int.diff
@@ -4,6 +4,8 @@ Date: Wed, 12 Dec 2007 13:44:15 +0000
 Subject: [PATCH] error.h: '#include <errno.h>' instead of 'extern int errno;'
 
 ---
+Upstream-Status: Pending
+
  daemontools-0.76/src/error.h |    2 +-
  1 files changed, 1 insertions(+), 1 deletions(-)
 
diff --git a/meta-oe/recipes-support/daemontools/daemontools/0002-supervise.c-.-supervise-may-be-a-symlink-if-it-s-da.diff b/meta-oe/recipes-support/daemontools/daemontools/0002-supervise.c-.-supervise-may-be-a-symlink-if-it-s-da.diff
index 73dce90726..16a0148546 100644
--- a/meta-oe/recipes-support/daemontools/daemontools/0002-supervise.c-.-supervise-may-be-a-symlink-if-it-s-da.diff
+++ b/meta-oe/recipes-support/daemontools/daemontools/0002-supervise.c-.-supervise-may-be-a-symlink-if-it-s-da.diff
@@ -4,6 +4,8 @@ Date: Sun, 24 Feb 2008 10:54:26 +0000
 Subject: [PATCH] supervise.c: ./supervise may be a symlink, if it's dangling, create link target
 
 ---
+Upstream-Status: Pending
+
  daemontools-0.76/src/supervise.c |   17 ++++++++++++++++-
  1 files changed, 16 insertions(+), 1 deletions(-)
 
diff --git a/meta-oe/recipes-support/daemontools/daemontools/cross-compile.patch b/meta-oe/recipes-support/daemontools/daemontools/cross-compile.patch
index 9c07d758ae..98d4a5e45b 100644
--- a/meta-oe/recipes-support/daemontools/daemontools/cross-compile.patch
+++ b/meta-oe/recipes-support/daemontools/daemontools/cross-compile.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 make sure it can be compiled for cross target
 
 1. never try to compile target binary by native gcc
diff --git a/meta-oe/recipes-support/daemontools/daemontools/warnings.patch b/meta-oe/recipes-support/daemontools/daemontools/warnings.patch
index 2fd18f6f1c..5c9c7114b9 100644
--- a/meta-oe/recipes-support/daemontools/daemontools/warnings.patch
+++ b/meta-oe/recipes-support/daemontools/daemontools/warnings.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Fixup misc warnings
 
 Patch by RiverRat
diff --git a/meta-oe/recipes-support/enca/enca/dont-run-tests.patch b/meta-oe/recipes-support/enca/enca/dont-run-tests.patch
index 321d1e6201..1d0170bd73 100644
--- a/meta-oe/recipes-support/enca/enca/dont-run-tests.patch
+++ b/meta-oe/recipes-support/enca/enca/dont-run-tests.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: enca-1.9/Makefile.am
 ===================================================================
 --- enca-1.9.orig/Makefile.am	2005-11-24 11:21:32.000000000 +0100
diff --git a/meta-oe/recipes-support/enca/enca/libenca-003-iconv.patch b/meta-oe/recipes-support/enca/enca/libenca-003-iconv.patch
index baf5547642..2112d8cfab 100644
--- a/meta-oe/recipes-support/enca/enca/libenca-003-iconv.patch
+++ b/meta-oe/recipes-support/enca/enca/libenca-003-iconv.patch
@@ -8,6 +8,8 @@ This patch come straight from the Buildroot source tree.
 Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
 Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 ---
+Upstream-Status: Pending
+
  m4/libiconv.m4 | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-support/enca/enca/makefile-remove-tools.patch b/meta-oe/recipes-support/enca/enca/makefile-remove-tools.patch
index 48497d68c8..756745d839 100644
--- a/meta-oe/recipes-support/enca/enca/makefile-remove-tools.patch
+++ b/meta-oe/recipes-support/enca/enca/makefile-remove-tools.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- enca-1.19/Makefile.am.orig	2006-06-29 15:34:55.000000000 +0100
 +++ enca-1.19/Makefile.am	2006-06-29 15:35:20.000000000 +0100
 @@ -1,7 +1,7 @@
diff --git a/meta-oe/recipes-support/espeak/files/0001-Fix-build-of-shared-library-on-architectures-needing.patch b/meta-oe/recipes-support/espeak/files/0001-Fix-build-of-shared-library-on-architectures-needing.patch
index 2590e15841..144c30a62f 100644
--- a/meta-oe/recipes-support/espeak/files/0001-Fix-build-of-shared-library-on-architectures-needing.patch
+++ b/meta-oe/recipes-support/espeak/files/0001-Fix-build-of-shared-library-on-architectures-needing.patch
@@ -10,6 +10,8 @@ patch doesn't affect such architectures.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
+Upstream-Status: Pending
+
  src/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-support/fbset/fbset-2.1/makefile.patch b/meta-oe/recipes-support/fbset/fbset-2.1/makefile.patch
index 82b1c61e9c..730bb7a965 100644
--- a/meta-oe/recipes-support/fbset/fbset-2.1/makefile.patch
+++ b/meta-oe/recipes-support/fbset/fbset-2.1/makefile.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- fbset-2.1/Makefile.orig	2006-05-28 04:04:27.412095480 +0200
 +++ fbset-2.1/Makefile	2006-05-28 04:14:05.379231120 +0200
 @@ -2,7 +2,7 @@
diff --git a/meta-oe/recipes-support/fftw/fftw/install-bench.patch b/meta-oe/recipes-support/fftw/fftw/install-bench.patch
index ef570b19d8..237c1c0c5c 100644
--- a/meta-oe/recipes-support/fftw/fftw/install-bench.patch
+++ b/meta-oe/recipes-support/fftw/fftw/install-bench.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- ./tests/Makefile.am.orig	2021-03-23 11:45:12.756371739 -0400
 +++ ./tests/Makefile.am	2021-03-23 19:29:19.692180793 -0400
 @@ -1,21 +1,21 @@
diff --git a/meta-oe/recipes-support/fltk/fltk/0001-Fl_Preferences.cxx-do-not-use-dlopen-in-case-glibc-s.patch b/meta-oe/recipes-support/fltk/fltk/0001-Fl_Preferences.cxx-do-not-use-dlopen-in-case-glibc-s.patch
index e6e68a0cb8..d1cbb35479 100644
--- a/meta-oe/recipes-support/fltk/fltk/0001-Fl_Preferences.cxx-do-not-use-dlopen-in-case-glibc-s.patch
+++ b/meta-oe/recipes-support/fltk/fltk/0001-Fl_Preferences.cxx-do-not-use-dlopen-in-case-glibc-s.patch
@@ -18,6 +18,8 @@ Content-Transfer-Encoding: 8bit
 
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 ---
+Upstream-Status: Pending
+
  src/Fl_Preferences.cxx | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-support/fltk/fltk/disable_test.patch b/meta-oe/recipes-support/fltk/fltk/disable_test.patch
index 1f5fd25e04..fe8be5a652 100644
--- a/meta-oe/recipes-support/fltk/fltk/disable_test.patch
+++ b/meta-oe/recipes-support/fltk/fltk/disable_test.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- a/Makefile.orig	2015-11-26 15:35:31.485357862 +0800
 +++ b/Makefile	2015-11-26 15:35:37.037357764 +0800
 @@ -18,7 +18,7 @@
diff --git a/meta-oe/recipes-support/freerdp/freerdp/winpr-makecert-Build-with-install-RPATH.patch b/meta-oe/recipes-support/freerdp/freerdp/winpr-makecert-Build-with-install-RPATH.patch
index 0f6f575d02..914f08087b 100644
--- a/meta-oe/recipes-support/freerdp/freerdp/winpr-makecert-Build-with-install-RPATH.patch
+++ b/meta-oe/recipes-support/freerdp/freerdp/winpr-makecert-Build-with-install-RPATH.patch
@@ -9,6 +9,8 @@ Update it for 2.0.0.
 Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
 Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
 ---
+Upstream-Status: Pending
+
  winpr/tools/makecert-cli/CMakeLists.txt | 3 +++
  1 file changed, 3 insertions(+)
 
diff --git a/meta-oe/recipes-support/gperftools/gperftools/ppc-musl.patch b/meta-oe/recipes-support/gperftools/gperftools/ppc-musl.patch
index d06b6af229..3034e20176 100644
--- a/meta-oe/recipes-support/gperftools/gperftools/ppc-musl.patch
+++ b/meta-oe/recipes-support/gperftools/gperftools/ppc-musl.patch
@@ -4,6 +4,8 @@ Date: Sat, 13 Mar 2021 00:42:25 -0800
 Subject: [PATCH] Compatibility fixes for musl.
 
 ---
+Upstream-Status: Pending
+
  m4/pc_from_ucontext.m4             | 4 +++-
  src/getpc.h                        | 3 +++
  src/stacktrace_powerpc-linux-inl.h | 8 ++++++--
diff --git a/meta-oe/recipes-support/gradm/gradm/0001-Makefile-Append-instead-of-overriding-LDFLAGS.patch b/meta-oe/recipes-support/gradm/gradm/0001-Makefile-Append-instead-of-overriding-LDFLAGS.patch
index 09a60127a4..5ef39ea33d 100644
--- a/meta-oe/recipes-support/gradm/gradm/0001-Makefile-Append-instead-of-overriding-LDFLAGS.patch
+++ b/meta-oe/recipes-support/gradm/gradm/0001-Makefile-Append-instead-of-overriding-LDFLAGS.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] Makefile: Append instead of overriding LDFLAGS
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-support/gsoap/gsoap/0001-Simplify-check-for-gethostbyname_r.patch b/meta-oe/recipes-support/gsoap/gsoap/0001-Simplify-check-for-gethostbyname_r.patch
index 3d12f733f0..6ae02deb24 100644
--- a/meta-oe/recipes-support/gsoap/gsoap/0001-Simplify-check-for-gethostbyname_r.patch
+++ b/meta-oe/recipes-support/gsoap/gsoap/0001-Simplify-check-for-gethostbyname_r.patch
@@ -9,6 +9,8 @@ Imported from Alpine: https://git.alpinelinux.org/aports/tree/community/gsoap/mu
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  gsoap/stdsoap2.c   |  6 ++----
  gsoap/stdsoap2.cpp | 10 ++--------
  2 files changed, 4 insertions(+), 12 deletions(-)
diff --git a/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp-0.3-beta15-autodetect-717479.patch b/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp-0.3-beta15-autodetect-717479.patch
index 1ec6a61b31..1a541e32fd 100644
--- a/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp-0.3-beta15-autodetect-717479.patch
+++ b/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp-0.3-beta15-autodetect-717479.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Auto-detect disks if none specified
 
 Refer to:
diff --git a/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp-no-nls-support.patch b/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp-no-nls-support.patch
index 8f6b9c3c4b..78de64c99d 100644
--- a/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp-no-nls-support.patch
+++ b/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp-no-nls-support.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -ru hddtemp-0.3-beta15.orig/configure.in hddtemp-0.3-beta15/configure.in
 --- hddtemp-0.3-beta15.orig/configure.in	2005-10-17 20:14:19.000000000 +0100
 +++ hddtemp-0.3-beta15/configure.in	2008-06-27 00:00:46.000000000 +0100
diff --git a/meta-oe/recipes-support/iniparser/iniparser/Add-CMake-support.patch b/meta-oe/recipes-support/iniparser/iniparser/Add-CMake-support.patch
index b666f00f70..46c1b0f7ac 100644
--- a/meta-oe/recipes-support/iniparser/iniparser/Add-CMake-support.patch
+++ b/meta-oe/recipes-support/iniparser/iniparser/Add-CMake-support.patch
@@ -4,6 +4,8 @@ Date: Thu, 13 Feb 2014 07:03:26 -0500
 Subject: Add CMake support.
 
 ---
+Upstream-Status: Pending
+
  CMakeLists.txt | 44 ++++++++++++++++++++++++++++++++++++++++++++
  1 file changed, 44 insertions(+)
  create mode 100644 CMakeLists.txt
diff --git a/meta-oe/recipes-support/libcanberra/files/0001-build-gtk-and-gtk3-version-for-canberra_gtk_play.patch b/meta-oe/recipes-support/libcanberra/files/0001-build-gtk-and-gtk3-version-for-canberra_gtk_play.patch
index 4e0984f364..89f31f7946 100644
--- a/meta-oe/recipes-support/libcanberra/files/0001-build-gtk-and-gtk3-version-for-canberra_gtk_play.patch
+++ b/meta-oe/recipes-support/libcanberra/files/0001-build-gtk-and-gtk3-version-for-canberra_gtk_play.patch
@@ -8,6 +8,8 @@ Content-Transfer-Encoding: 8bit
 
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 ---
+Upstream-Status: Pending
+
  src/Makefile.am |   25 +++++++++++++++----------
  1 files changed, 15 insertions(+), 10 deletions(-)
 
diff --git a/meta-oe/recipes-support/libcanberra/files/0001-gtk-Don-t-assume-all-GdkDisplays-are-GdkX11Displays-.patch b/meta-oe/recipes-support/libcanberra/files/0001-gtk-Don-t-assume-all-GdkDisplays-are-GdkX11Displays-.patch
index ba6fa2c643..1e45441ff9 100644
--- a/meta-oe/recipes-support/libcanberra/files/0001-gtk-Don-t-assume-all-GdkDisplays-are-GdkX11Displays-.patch
+++ b/meta-oe/recipes-support/libcanberra/files/0001-gtk-Don-t-assume-all-GdkDisplays-are-GdkX11Displays-.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] gtk: Don't assume all GdkDisplays are GdkX11Displays:
  broadway/wayland
 
 ---
+Upstream-Status: Pending
+
  src/canberra-gtk-module.c | 15 +++++++++++++++
  src/canberra-gtk.c        |  5 +++++
  2 files changed, 20 insertions(+)
diff --git a/meta-oe/recipes-support/libmimetic/libmimetic/0001-libmimetic-Removing-test-directory-from-the-Makefile.patch b/meta-oe/recipes-support/libmimetic/libmimetic/0001-libmimetic-Removing-test-directory-from-the-Makefile.patch
index 50cd4d4270..717e3f1f8b 100644
--- a/meta-oe/recipes-support/libmimetic/libmimetic/0001-libmimetic-Removing-test-directory-from-the-Makefile.patch
+++ b/meta-oe/recipes-support/libmimetic/libmimetic/0001-libmimetic-Removing-test-directory-from-the-Makefile.patch
@@ -15,6 +15,8 @@ aarch64-yoe-linux-musl.
 Signed-off-by: asmitk01-in <asmitk01@in.ibm.com>
 Change-Id: I1822b36ad4a1fa5e7b165d8cac3a6e96aca11c35
 ---
+Upstream-Status: Pending
+
  Makefile.am                  | 2 +-
  mimetic/codec/other_codecs.h | 4 ++++
  mimetic/contenttype.cxx      | 4 ++++
diff --git a/meta-oe/recipes-support/liboop/liboop/tcl_dev.patch b/meta-oe/recipes-support/liboop/liboop/tcl_dev.patch
index e00cf80141..0521aaeaff 100644
--- a/meta-oe/recipes-support/liboop/liboop/tcl_dev.patch
+++ b/meta-oe/recipes-support/liboop/liboop/tcl_dev.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- a/configure.ac
 +++ b/configure.ac
 @@ -71,7 +71,7 @@
diff --git a/meta-oe/recipes-support/libtar/files/0002-Do-not-strip-libtar.patch b/meta-oe/recipes-support/libtar/files/0002-Do-not-strip-libtar.patch
index 31c0d29e93..4929eece06 100644
--- a/meta-oe/recipes-support/libtar/files/0002-Do-not-strip-libtar.patch
+++ b/meta-oe/recipes-support/libtar/files/0002-Do-not-strip-libtar.patch
@@ -4,6 +4,8 @@ Date: Wed, 2 Nov 2016 05:43:43 -0400
 Subject: [PATCH] Do not strip libtar.
 
 ---
+Upstream-Status: Pending
+
  libtar/Makefile.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-support/libtar/files/fix_libtool_sysroot.patch b/meta-oe/recipes-support/libtar/files/fix_libtool_sysroot.patch
index 178a970299..efde754be7 100644
--- a/meta-oe/recipes-support/libtar/files/fix_libtool_sysroot.patch
+++ b/meta-oe/recipes-support/libtar/files/fix_libtool_sysroot.patch
@@ -1,4 +1,6 @@
 ---
+Upstream-Status: Pending
+
  configure.ac | 1 +
  1 file changed, 1 insertion(+)
 
diff --git a/meta-oe/recipes-support/libteam/libteam/0001-include-sys-select.h-for-fd_set-definition.patch b/meta-oe/recipes-support/libteam/libteam/0001-include-sys-select.h-for-fd_set-definition.patch
index a4a17ed85b..f0bd53ee8e 100644
--- a/meta-oe/recipes-support/libteam/libteam/0001-include-sys-select.h-for-fd_set-definition.patch
+++ b/meta-oe/recipes-support/libteam/libteam/0001-include-sys-select.h-for-fd_set-definition.patch
@@ -8,6 +8,8 @@ teamnl.c:160:2: error: unknown type name 'fd_set'; did you mean 'fpos_t'?
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  utils/teamnl.c | 1 +
  1 file changed, 1 insertion(+)
 
diff --git a/meta-oe/recipes-support/libteam/libteam/0002-teamd-Re-adjust-include-header-order.patch b/meta-oe/recipes-support/libteam/libteam/0002-teamd-Re-adjust-include-header-order.patch
index beabf63ca3..ed877a721e 100644
--- a/meta-oe/recipes-support/libteam/libteam/0002-teamd-Re-adjust-include-header-order.patch
+++ b/meta-oe/recipes-support/libteam/libteam/0002-teamd-Re-adjust-include-header-order.patch
@@ -12,6 +12,8 @@ tinet/if_ether.h:101:8: error: redefinition of 'struct ethhdr'
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  teamd/teamd_runner_lacp.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-support/libutempter/libutempter/0002-Proper-macro-path-generation.patch b/meta-oe/recipes-support/libutempter/libutempter/0002-Proper-macro-path-generation.patch
index 2a866c0796..f43f54eaab 100644
--- a/meta-oe/recipes-support/libutempter/libutempter/0002-Proper-macro-path-generation.patch
+++ b/meta-oe/recipes-support/libutempter/libutempter/0002-Proper-macro-path-generation.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] Proper macro path generation.
 
 Signed-off-by: iddinev <xidinev@gmail.com>
 ---
+Upstream-Status: Pending
+
  libutempter/iface.c | 7 +++----
  1 file changed, 3 insertions(+), 4 deletions(-)
 
diff --git a/meta-oe/recipes-support/links/files/ac-prog-cxx.patch b/meta-oe/recipes-support/links/files/ac-prog-cxx.patch
index 2dc57a5c83..0406b700d7 100644
--- a/meta-oe/recipes-support/links/files/ac-prog-cxx.patch
+++ b/meta-oe/recipes-support/links/files/ac-prog-cxx.patch
@@ -3,6 +3,8 @@ From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 30 Jul 2012 23:52:49 +0200
 
 ---
+Upstream-Status: Pending
+
  configure.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-support/lio-utils/lio-utils/0001-Makefiles-Respect-environment-variables-and-add-LDFL.patch b/meta-oe/recipes-support/lio-utils/lio-utils/0001-Makefiles-Respect-environment-variables-and-add-LDFL.patch
index 9608b7e753..86edcc2e42 100644
--- a/meta-oe/recipes-support/lio-utils/lio-utils/0001-Makefiles-Respect-environment-variables-and-add-LDFL.patch
+++ b/meta-oe/recipes-support/lio-utils/lio-utils/0001-Makefiles-Respect-environment-variables-and-add-LDFL.patch
@@ -8,6 +8,8 @@ Fixes QA errors about GNU_HASH
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  mib-modules/Makefile | 10 +++++-----
  tools/Makefile       |  2 +-
  2 files changed, 6 insertions(+), 6 deletions(-)
diff --git a/meta-oe/recipes-support/lockdev/lockdev/build.patch b/meta-oe/recipes-support/lockdev/lockdev/build.patch
index f9fe48b2a6..36daea79af 100644
--- a/meta-oe/recipes-support/lockdev/lockdev/build.patch
+++ b/meta-oe/recipes-support/lockdev/lockdev/build.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 commit 0dd47123655c52d68185f06b9da8fb0e1b925400
 Author: Ludwig Nussel <ludwig.nussel@suse.de>
 Date:   Tue Feb 9 14:56:23 2010 +0100
diff --git a/meta-oe/recipes-support/lockdev/lockdev/cross_compile.patch b/meta-oe/recipes-support/lockdev/lockdev/cross_compile.patch
index aa8b0f6923..886af121b3 100644
--- a/meta-oe/recipes-support/lockdev/lockdev/cross_compile.patch
+++ b/meta-oe/recipes-support/lockdev/lockdev/cross_compile.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- a/Makefile
 +++ b/Makefile
 @@ -15,17 +15,18 @@ shared	= ${libname}.${VER}.so
diff --git a/meta-oe/recipes-support/log4c/log4c/0001-Use-the-API-properly-in-the-example-format-security-.patch b/meta-oe/recipes-support/log4c/log4c/0001-Use-the-API-properly-in-the-example-format-security-.patch
index 9ff9d70025..405104a0fc 100644
--- a/meta-oe/recipes-support/log4c/log4c/0001-Use-the-API-properly-in-the-example-format-security-.patch
+++ b/meta-oe/recipes-support/log4c/log4c/0001-Use-the-API-properly-in-the-example-format-security-.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] Use the API properly in the example (format security error
  fixed).
 
 ---
+Upstream-Status: Pending
+
  examples/helloworld1/mylog.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-support/log4cpp/files/fix-pc.patch b/meta-oe/recipes-support/log4cpp/files/fix-pc.patch
index b8fb42e5fd..b57b5a263c 100644
--- a/meta-oe/recipes-support/log4cpp/files/fix-pc.patch
+++ b/meta-oe/recipes-support/log4cpp/files/fix-pc.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -Nurd ./log4cpp.orig/configure.in ./log4cpp/configure.in
 --- ./log4cpp.orig/configure.in	2009-09-07 16:57:46.000000000 -0400
 +++ ./log4cpp/configure.in	2016-02-23 12:57:11.567240018 -0500
diff --git a/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch b/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch
index bb582ed1ff..f46d7f7014 100644
--- a/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch
+++ b/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch
@@ -15,6 +15,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Dengke Du <dengke.du@windriver.com>
 
 ---
+Upstream-Status: Pending
+
  lib/log/log.c      | 6 ++++++
  tools/lvmcmdline.c | 6 +++---
  2 files changed, 9 insertions(+), 3 deletions(-)
diff --git a/meta-oe/recipes-support/lvm2/files/0002-Guard-use-of-mallinfo-with-__GLIBC__.patch b/meta-oe/recipes-support/lvm2/files/0002-Guard-use-of-mallinfo-with-__GLIBC__.patch
index ce8a97ab6f..1fbaf0c9ae 100644
--- a/meta-oe/recipes-support/lvm2/files/0002-Guard-use-of-mallinfo-with-__GLIBC__.patch
+++ b/meta-oe/recipes-support/lvm2/files/0002-Guard-use-of-mallinfo-with-__GLIBC__.patch
@@ -9,6 +9,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Dengke Du <dengke.du@windriver.com>
 
 ---
+Upstream-Status: Pending
+
  lib/mm/memlock.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-support/mg/mg/0001-Undefine-REGEX-for-musl-based-systems.patch b/meta-oe/recipes-support/mg/mg/0001-Undefine-REGEX-for-musl-based-systems.patch
index 9c154a1734..ce139a6387 100644
--- a/meta-oe/recipes-support/mg/mg/0001-Undefine-REGEX-for-musl-based-systems.patch
+++ b/meta-oe/recipes-support/mg/mg/0001-Undefine-REGEX-for-musl-based-systems.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] Undefine REGEX for musl based systems
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  GNUmakefile | 1 -
  Makefile    | 2 +-
  2 files changed, 1 insertion(+), 2 deletions(-)
diff --git a/meta-oe/recipes-support/mg/mg/0001-fileio-Include-sys-param.h-for-MAXNAMLEN.patch b/meta-oe/recipes-support/mg/mg/0001-fileio-Include-sys-param.h-for-MAXNAMLEN.patch
index 8e8c2b9025..4eeb1d97dc 100644
--- a/meta-oe/recipes-support/mg/mg/0001-fileio-Include-sys-param.h-for-MAXNAMLEN.patch
+++ b/meta-oe/recipes-support/mg/mg/0001-fileio-Include-sys-param.h-for-MAXNAMLEN.patch
@@ -5,6 +5,8 @@ Subject: [PATCH 1/2] fileio: Include sys/param.h for MAXNAMLEN
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  fileio.c | 1 +
  1 file changed, 1 insertion(+)
 
diff --git a/meta-oe/recipes-support/mg/mg/0002-fileio-Define-DEFFILEMODE-if-platform-is-missing.patch b/meta-oe/recipes-support/mg/mg/0002-fileio-Define-DEFFILEMODE-if-platform-is-missing.patch
index bdd7632be6..ef7811081b 100644
--- a/meta-oe/recipes-support/mg/mg/0002-fileio-Define-DEFFILEMODE-if-platform-is-missing.patch
+++ b/meta-oe/recipes-support/mg/mg/0002-fileio-Define-DEFFILEMODE-if-platform-is-missing.patch
@@ -5,6 +5,8 @@ Subject: [PATCH 2/2] fileio: Define DEFFILEMODE if platform is missing
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  fileio.c | 4 ++++
  1 file changed, 4 insertions(+)
 
diff --git a/meta-oe/recipes-support/multipath-tools/files/0001-fix-bug-of-do_compile-and-do_install.patch b/meta-oe/recipes-support/multipath-tools/files/0001-fix-bug-of-do_compile-and-do_install.patch
index 97425fe9b8..bc07d75cc1 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0001-fix-bug-of-do_compile-and-do_install.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0001-fix-bug-of-do_compile-and-do_install.patch
@@ -12,6 +12,8 @@ Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
 [OP: Drop dependencies that are already present in the 0.9.3 Makefile]
 Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
 ---
+Upstream-Status: Pending
+
  Makefile | 10 ++++++++++
  1 file changed, 10 insertions(+)
 
diff --git a/meta-oe/recipes-support/multipath-tools/files/0021-RH-fixup-udev-rules-for-redhat.patch b/meta-oe/recipes-support/multipath-tools/files/0021-RH-fixup-udev-rules-for-redhat.patch
index 0b9971dc99..395f9a9b03 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0021-RH-fixup-udev-rules-for-redhat.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0021-RH-fixup-udev-rules-for-redhat.patch
@@ -17,6 +17,8 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
 [OP: Rebase to 0.9.3]
 Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
 ---
+Upstream-Status: Pending
+
  Makefile.inc        | 2 +-
  kpartx/kpartx.rules | 2 +-
  multipath/Makefile  | 4 ++--
diff --git a/meta-oe/recipes-support/multipath-tools/files/0022-RH-Remove-the-property-blacklist-exception-builtin.patch b/meta-oe/recipes-support/multipath-tools/files/0022-RH-Remove-the-property-blacklist-exception-builtin.patch
index 0eff18b853..c15444a85d 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0022-RH-Remove-the-property-blacklist-exception-builtin.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0022-RH-Remove-the-property-blacklist-exception-builtin.patch
@@ -20,6 +20,8 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
 [OP: Rebase to 0.9.3]
 Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
 ---
+Upstream-Status: Pending
+
  libmultipath/blacklist.c | 10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)
 
diff --git a/meta-oe/recipes-support/multipath-tools/files/0032-libdmmp-Makefile-replace-perl-with-sed-in-install-ta.patch b/meta-oe/recipes-support/multipath-tools/files/0032-libdmmp-Makefile-replace-perl-with-sed-in-install-ta.patch
index 407dff507a..ec123b212b 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0032-libdmmp-Makefile-replace-perl-with-sed-in-install-ta.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0032-libdmmp-Makefile-replace-perl-with-sed-in-install-ta.patch
@@ -15,6 +15,8 @@ Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
 [OP: Rebase to 0.9.3]
 Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
 ---
+Upstream-Status: Pending
+
  libdmmp/Makefile | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
diff --git a/meta-oe/recipes-support/ne10/ne10/0001-CMakeLists.txt-Remove-mthumb-interwork.patch b/meta-oe/recipes-support/ne10/ne10/0001-CMakeLists.txt-Remove-mthumb-interwork.patch
index 9f2faaa529..6b51f992f5 100644
--- a/meta-oe/recipes-support/ne10/ne10/0001-CMakeLists.txt-Remove-mthumb-interwork.patch
+++ b/meta-oe/recipes-support/ne10/ne10/0001-CMakeLists.txt-Remove-mthumb-interwork.patch
@@ -12,6 +12,8 @@ where this option is absent
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  CMakeLists.txt | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
diff --git a/meta-oe/recipes-support/ne10/ne10/0001-Dont-specify-march-explicitly.patch b/meta-oe/recipes-support/ne10/ne10/0001-Dont-specify-march-explicitly.patch
index a8fea82dc3..cb99daf78c 100644
--- a/meta-oe/recipes-support/ne10/ne10/0001-Dont-specify-march-explicitly.patch
+++ b/meta-oe/recipes-support/ne10/ne10/0001-Dont-specify-march-explicitly.patch
@@ -15,6 +15,8 @@ Fixes
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  CMakeLists.txt | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
diff --git a/meta-oe/recipes-support/neon/neon/0001-Disable-installing-documentation.patch b/meta-oe/recipes-support/neon/neon/0001-Disable-installing-documentation.patch
index 1f63df27ac..177a71ec0a 100644
--- a/meta-oe/recipes-support/neon/neon/0001-Disable-installing-documentation.patch
+++ b/meta-oe/recipes-support/neon/neon/0001-Disable-installing-documentation.patch
@@ -7,6 +7,8 @@ It does not build
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  Makefile.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-support/nmon/nmon/0001-lmon16g.c-Adjust-system-headers.patch b/meta-oe/recipes-support/nmon/nmon/0001-lmon16g.c-Adjust-system-headers.patch
index 5a8b046039..6721d2b5e5 100644
--- a/meta-oe/recipes-support/nmon/nmon/0001-lmon16g.c-Adjust-system-headers.patch
+++ b/meta-oe/recipes-support/nmon/nmon/0001-lmon16g.c-Adjust-system-headers.patch
@@ -9,6 +9,8 @@ defines from sys/cdefs.h is used
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  lmon16m.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
diff --git a/meta-oe/recipes-support/onig/onig/0002-build-enable-serial-tests-automake-option-for-ptest.patch b/meta-oe/recipes-support/onig/onig/0002-build-enable-serial-tests-automake-option-for-ptest.patch
index a7a28536fb..096b8baa79 100644
--- a/meta-oe/recipes-support/onig/onig/0002-build-enable-serial-tests-automake-option-for-ptest.patch
+++ b/meta-oe/recipes-support/onig/onig/0002-build-enable-serial-tests-automake-option-for-ptest.patch
@@ -15,6 +15,8 @@ former being what we want.
 
 Signed-off-by: André Draszik <git@andred.net>
 ---
+Upstream-Status: Pending
+
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch b/meta-oe/recipes-support/opencv/opencv/0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch
index 1e47f8b162..a3bbefaabe 100644
--- a/meta-oe/recipes-support/opencv/opencv/0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch
+++ b/meta-oe/recipes-support/opencv/opencv/0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch
@@ -7,6 +7,8 @@ Subject: [PATCH] Temporarliy work around deprecated ffmpeg RAW function
 Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
 
 ---
+Upstream-Status: Pending
+
  modules/videoio/src/cap_ffmpeg_impl.hpp | 8 ++++++++
  1 file changed, 8 insertions(+)
 
diff --git a/meta-oe/recipes-support/opencv/opencv/0003-To-fix-errors-as-following.patch b/meta-oe/recipes-support/opencv/opencv/0003-To-fix-errors-as-following.patch
index bb47ef2bab..9df419d0b8 100644
--- a/meta-oe/recipes-support/opencv/opencv/0003-To-fix-errors-as-following.patch
+++ b/meta-oe/recipes-support/opencv/opencv/0003-To-fix-errors-as-following.patch
@@ -15,6 +15,8 @@ ts module.
 Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
 
 ---
+Upstream-Status: Pending
+
  modules/ts/include/opencv2/ts.hpp          | 4 ++--
  modules/ts/include/opencv2/ts/ocl_test.hpp | 2 +-
  modules/ts/include/opencv2/ts/ts_ext.hpp   | 2 +-
diff --git a/meta-oe/recipes-support/pcp/pcp/fix_parallel_make.patch b/meta-oe/recipes-support/pcp/pcp/fix_parallel_make.patch
index 630f51a494..9cb649a594 100644
--- a/meta-oe/recipes-support/pcp/pcp/fix_parallel_make.patch
+++ b/meta-oe/recipes-support/pcp/pcp/fix_parallel_make.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- a/qa/src/GNUlocaldefs
 +++ b/qa/src/GNUlocaldefs
 @@ -728,7 +728,7 @@ scale.o:	localconfig.h
diff --git a/meta-oe/recipes-support/pidgin/pidgin/purple-OE-branding-25.patch b/meta-oe/recipes-support/pidgin/pidgin/purple-OE-branding-25.patch
index 0a1baa9183..1c4daa9f67 100644
--- a/meta-oe/recipes-support/pidgin/pidgin/purple-OE-branding-25.patch
+++ b/meta-oe/recipes-support/pidgin/pidgin/purple-OE-branding-25.patch
@@ -3,6 +3,8 @@ From: Herrie <github.com@herrie.org>
 Date: Mon, 24 Jul 2017 21:30:16 +0200
 
 ---
+Upstream-Status: Pending
+
  libpurple/protocols/irc/irc.h | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
diff --git a/meta-oe/recipes-support/pidgin/pidgin/sanitize-configure.ac.patch b/meta-oe/recipes-support/pidgin/pidgin/sanitize-configure.ac.patch
index 84dbcdc276..cf6207423d 100644
--- a/meta-oe/recipes-support/pidgin/pidgin/sanitize-configure.ac.patch
+++ b/meta-oe/recipes-support/pidgin/pidgin/sanitize-configure.ac.patch
@@ -3,6 +3,8 @@ From: Herrie <github.com@herrie.org>
 Date: Mon, 24 Jul 2017 21:30:16 +0200
 
 ---
+Upstream-Status: Pending
+
  configure.ac | 10 +---------
  1 file changed, 1 insertion(+), 9 deletions(-)
 
diff --git a/meta-oe/recipes-support/pngcheck/pngcheck/0001-make-Respect-variables-from-environement.patch b/meta-oe/recipes-support/pngcheck/pngcheck/0001-make-Respect-variables-from-environement.patch
index 2d0ea0252c..12333cc1f1 100644
--- a/meta-oe/recipes-support/pngcheck/pngcheck/0001-make-Respect-variables-from-environement.patch
+++ b/meta-oe/recipes-support/pngcheck/pngcheck/0001-make-Respect-variables-from-environement.patch
@@ -7,6 +7,8 @@ link with shared zlib
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  Makefile.unx | 18 ++++++++----------
  1 file changed, 8 insertions(+), 10 deletions(-)
 
diff --git a/meta-oe/recipes-support/pngcheck/pngcheck/0001-png-fix-IDAT-windowsize-Fix-format-string-errors-in-.patch b/meta-oe/recipes-support/pngcheck/pngcheck/0001-png-fix-IDAT-windowsize-Fix-format-string-errors-in-.patch
index 6d4465fbed..0fc5a8e0d2 100644
--- a/meta-oe/recipes-support/pngcheck/pngcheck/0001-png-fix-IDAT-windowsize-Fix-format-string-errors-in-.patch
+++ b/meta-oe/recipes-support/pngcheck/pngcheck/0001-png-fix-IDAT-windowsize-Fix-format-string-errors-in-.patch
@@ -6,6 +6,8 @@ Subject: [PATCH 1/2] png-fix-IDAT-windowsize: Fix format string errors in
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  gpl/png-fix-IDAT-windowsize.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
diff --git a/meta-oe/recipes-support/pngcheck/pngcheck/10-pngsplit-format-strings.patch b/meta-oe/recipes-support/pngcheck/pngcheck/10-pngsplit-format-strings.patch
index f2c86689ec..2ff6d664c0 100644
--- a/meta-oe/recipes-support/pngcheck/pngcheck/10-pngsplit-format-strings.patch
+++ b/meta-oe/recipes-support/pngcheck/pngcheck/10-pngsplit-format-strings.patch
@@ -2,6 +2,8 @@ From: Jari Aalto <jari.aalto@cante.net>
 Subject: Correct fomat strings fro hardened build flags
 
 ---
+Upstream-Status: Pending
+
  gpl/pngsplit.c |   10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)
 
diff --git a/meta-oe/recipes-support/poppler/poppler/0001-cmake-Do-not-use-isystem.patch b/meta-oe/recipes-support/poppler/poppler/0001-cmake-Do-not-use-isystem.patch
index b4e3fb05e7..adbe82263f 100644
--- a/meta-oe/recipes-support/poppler/poppler/0001-cmake-Do-not-use-isystem.patch
+++ b/meta-oe/recipes-support/poppler/poppler/0001-cmake-Do-not-use-isystem.patch
@@ -30,6 +30,8 @@ issue is addressed
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  CMakeLists.txt         |  4 ++--
  glib/CMakeLists.txt    |  4 ++--
  qt5/src/CMakeLists.txt |  4 ++--
diff --git a/meta-oe/recipes-support/procmail/procmail/from-debian-to-fix-compile-errors.patch b/meta-oe/recipes-support/procmail/procmail/from-debian-to-fix-compile-errors.patch
index 8341a8ecde..c1f9ce7eca 100644
--- a/meta-oe/recipes-support/procmail/procmail/from-debian-to-fix-compile-errors.patch
+++ b/meta-oe/recipes-support/procmail/procmail/from-debian-to-fix-compile-errors.patch
@@ -5,6 +5,8 @@ Subject: [PATCH 1/3] From debian to fix compile errors
 
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
 ---
+Upstream-Status: Pending
+
  src/Makefile.0  |  7 +++----
  src/autoconf    | 64 +++++++++++++-------------------------------------------
  src/comsat.c    | 65 +++++++++++++++++++--------------------------------------
diff --git a/meta-oe/recipes-support/procmail/procmail/from-debian-to-fix-man-file.patch b/meta-oe/recipes-support/procmail/procmail/from-debian-to-fix-man-file.patch
index 7b3c643b2b..78ac6241d0 100644
--- a/meta-oe/recipes-support/procmail/procmail/from-debian-to-fix-man-file.patch
+++ b/meta-oe/recipes-support/procmail/procmail/from-debian-to-fix-man-file.patch
@@ -5,6 +5,8 @@ Subject: [PATCH 2/3] From debian to fix man file
 
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
 ---
+Upstream-Status: Pending
+
  man/procmail.man   | 24 +++++++++++++++++-------
  man/procmailrc.man |  2 +-
  2 files changed, 18 insertions(+), 8 deletions(-)
diff --git a/meta-oe/recipes-support/procmail/procmail/from-debian-to-modify-parameters.patch b/meta-oe/recipes-support/procmail/procmail/from-debian-to-modify-parameters.patch
index a94e436703..2bebccc0b2 100644
--- a/meta-oe/recipes-support/procmail/procmail/from-debian-to-modify-parameters.patch
+++ b/meta-oe/recipes-support/procmail/procmail/from-debian-to-modify-parameters.patch
@@ -5,6 +5,8 @@ Subject: [PATCH 3/3] From debian to modify parameters
 
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
 ---
+Upstream-Status: Pending
+
  Makefile | 16 ++++++++--------
  config.h | 13 +++++++------
  2 files changed, 15 insertions(+), 14 deletions(-)
diff --git a/meta-oe/recipes-support/procmail/procmail/man-file-mailstat.1-from-debian.patch b/meta-oe/recipes-support/procmail/procmail/man-file-mailstat.1-from-debian.patch
index 46d973e060..72fa27a834 100644
--- a/meta-oe/recipes-support/procmail/procmail/man-file-mailstat.1-from-debian.patch
+++ b/meta-oe/recipes-support/procmail/procmail/man-file-mailstat.1-from-debian.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] man file mailstat.1 from debian
 
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
 ---
+Upstream-Status: Pending
+
  debian/mailstat.1 | 40 ++++++++++++++++++++++++++++++++++++++++
  1 file changed, 40 insertions(+)
  create mode 100644 debian/mailstat.1
diff --git a/meta-oe/recipes-support/pxaregs/pxaregs-1.14/i2c.patch b/meta-oe/recipes-support/pxaregs/pxaregs-1.14/i2c.patch
index 36983ec479..2b5b5caa6f 100644
--- a/meta-oe/recipes-support/pxaregs/pxaregs-1.14/i2c.patch
+++ b/meta-oe/recipes-support/pxaregs/pxaregs-1.14/i2c.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: pxaregs-1.14/pxaregs.c
 ===================================================================
 --- pxaregs-1.14.orig/pxaregs.c
diff --git a/meta-oe/recipes-support/pxaregs/pxaregs-1.14/munmap.patch b/meta-oe/recipes-support/pxaregs/pxaregs-1.14/munmap.patch
index a9c4b95cf0..c0f81725d9 100644
--- a/meta-oe/recipes-support/pxaregs/pxaregs-1.14/munmap.patch
+++ b/meta-oe/recipes-support/pxaregs/pxaregs-1.14/munmap.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: pxaregs-1.14/pxaregs.c
 ===================================================================
 --- pxaregs-1.14.orig/pxaregs.c
diff --git a/meta-oe/recipes-support/pxaregs/pxaregs-1.14/serial.patch b/meta-oe/recipes-support/pxaregs/pxaregs-1.14/serial.patch
index 06853851d0..fba2e7f513 100644
--- a/meta-oe/recipes-support/pxaregs/pxaregs-1.14/serial.patch
+++ b/meta-oe/recipes-support/pxaregs/pxaregs-1.14/serial.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: pxaregs-1.14/pxaregs.c
 ===================================================================
 --- pxaregs-1.14.orig/pxaregs.c
diff --git a/meta-oe/recipes-support/pxaregs/pxaregs-1.14/usb.patch b/meta-oe/recipes-support/pxaregs/pxaregs-1.14/usb.patch
index 59f21fe3c1..91ca0a7742 100644
--- a/meta-oe/recipes-support/pxaregs/pxaregs-1.14/usb.patch
+++ b/meta-oe/recipes-support/pxaregs/pxaregs-1.14/usb.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: pxaregs-1.14/pxaregs.c
 ===================================================================
 --- pxaregs-1.14.orig/pxaregs.c
diff --git a/meta-oe/recipes-support/serial-utils/serial-forward/0001-serial_forward-Disable-default-static-linking.patch b/meta-oe/recipes-support/serial-utils/serial-forward/0001-serial_forward-Disable-default-static-linking.patch
index 7dcc67d114..a3fb678965 100644
--- a/meta-oe/recipes-support/serial-utils/serial-forward/0001-serial_forward-Disable-default-static-linking.patch
+++ b/meta-oe/recipes-support/serial-utils/serial-forward/0001-serial_forward-Disable-default-static-linking.patch
@@ -7,6 +7,8 @@ This does not work with ssp turned on with hardening flags on musl
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  tools/serial_forward/src/Makefile.am | 3 ---
  1 file changed, 3 deletions(-)
 
diff --git a/meta-oe/recipes-support/sharutils/sharutils/0001-Fix-build-with-clang.patch b/meta-oe/recipes-support/sharutils/sharutils/0001-Fix-build-with-clang.patch
index 7b627c16dd..583fe33ece 100644
--- a/meta-oe/recipes-support/sharutils/sharutils/0001-Fix-build-with-clang.patch
+++ b/meta-oe/recipes-support/sharutils/sharutils/0001-Fix-build-with-clang.patch
@@ -8,6 +8,8 @@ whereas it does support format attribute, we hard code it
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  src/shar-opts.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-support/sharutils/sharutils/0001-Fix-building-with-GCC-10.patch b/meta-oe/recipes-support/sharutils/sharutils/0001-Fix-building-with-GCC-10.patch
index 9e2ebe7564..0d9978a214 100644
--- a/meta-oe/recipes-support/sharutils/sharutils/0001-Fix-building-with-GCC-10.patch
+++ b/meta-oe/recipes-support/sharutils/sharutils/0001-Fix-building-with-GCC-10.patch
@@ -21,6 +21,8 @@ declarations.
 Signed-off-by: Petr PÃ­saÅ™ <address@hidden>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  src/shar-opts.h     | 2 +-
  src/shar-std.def    | 2 +-
  src/unshar-opts.h   | 2 +-
diff --git a/meta-oe/recipes-support/sharutils/sharutils/0002-Do-not-include-lib-md5.c-into-src-shar.c.patch b/meta-oe/recipes-support/sharutils/sharutils/0002-Do-not-include-lib-md5.c-into-src-shar.c.patch
index d4a8d6fbae..5932ddf1c0 100644
--- a/meta-oe/recipes-support/sharutils/sharutils/0002-Do-not-include-lib-md5.c-into-src-shar.c.patch
+++ b/meta-oe/recipes-support/sharutils/sharutils/0002-Do-not-include-lib-md5.c-into-src-shar.c.patch
@@ -20,6 +20,8 @@ shar.o:shar.c:(.text+0x28): first defined here
 Signed-off-by: Petr PÃ­saÅ™ <address@hidden>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  src/shar.c | 1 -
  1 file changed, 1 deletion(-)
 
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi/0001-Don-t-use-__GNUC_PREREQ.patch b/meta-oe/recipes-support/ssiapi/ssiapi/0001-Don-t-use-__GNUC_PREREQ.patch
index d9190e5bdf..5842ff1f36 100644
--- a/meta-oe/recipes-support/ssiapi/ssiapi/0001-Don-t-use-__GNUC_PREREQ.patch
+++ b/meta-oe/recipes-support/ssiapi/ssiapi/0001-Don-t-use-__GNUC_PREREQ.patch
@@ -10,6 +10,8 @@ availability first
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  lib/efi/efi.h           | 4 ++--
  lib/engine/pragma.h     | 4 ++--
  lib/log/log.h           | 4 ++--
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi/0001-Include-libgen.h.patch b/meta-oe/recipes-support/ssiapi/ssiapi/0001-Include-libgen.h.patch
index fd44571b69..b522146602 100644
--- a/meta-oe/recipes-support/ssiapi/ssiapi/0001-Include-libgen.h.patch
+++ b/meta-oe/recipes-support/ssiapi/ssiapi/0001-Include-libgen.h.patch
@@ -9,6 +9,8 @@ would be upstreams choice to make
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  tools/ssieventmonitor.cpp | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi/0001-log-Avoid-shadowing-functions-from-std-lib.patch b/meta-oe/recipes-support/ssiapi/ssiapi/0001-log-Avoid-shadowing-functions-from-std-lib.patch
index 8fdbf3e60e..c01c7e5ccd 100644
--- a/meta-oe/recipes-support/ssiapi/ssiapi/0001-log-Avoid-shadowing-functions-from-std-lib.patch
+++ b/meta-oe/recipes-support/ssiapi/ssiapi/0001-log-Avoid-shadowing-functions-from-std-lib.patch
@@ -5,6 +5,8 @@ Subject: [PATCH 1/4] log: Avoid shadowing functions from std lib
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  lib/log/log.c | 2 +-
  lib/log/log.h | 8 ++++----
  2 files changed, 5 insertions(+), 5 deletions(-)
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi/0002-Use-stangard-int-types.patch b/meta-oe/recipes-support/ssiapi/ssiapi/0002-Use-stangard-int-types.patch
index acc718d23d..390faeb77b 100644
--- a/meta-oe/recipes-support/ssiapi/ssiapi/0002-Use-stangard-int-types.patch
+++ b/meta-oe/recipes-support/ssiapi/ssiapi/0002-Use-stangard-int-types.patch
@@ -10,6 +10,8 @@ error: unknown type name '__uint8_t'
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  lib/engine/end_device.cpp | 13 +++++++------
  1 file changed, 7 insertions(+), 6 deletions(-)
 
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi/0002-boost-Backport-clang-support.patch b/meta-oe/recipes-support/ssiapi/ssiapi/0002-boost-Backport-clang-support.patch
index 2eeab54e53..aabbc04e57 100644
--- a/meta-oe/recipes-support/ssiapi/ssiapi/0002-boost-Backport-clang-support.patch
+++ b/meta-oe/recipes-support/ssiapi/ssiapi/0002-boost-Backport-clang-support.patch
@@ -7,6 +7,8 @@ backport headers from boost 1.59
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  lib/boost/config/compiler/clang.hpp           | 272 +++++++++
  lib/boost/config/stdlib/libcpp.hpp            |  80 +++
  lib/boost/cstdint.hpp                         | 542 ++++++++++++++++++
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi/0003-engine-Define-discover-const-String-path-in-base-cla.patch b/meta-oe/recipes-support/ssiapi/ssiapi/0003-engine-Define-discover-const-String-path-in-base-cla.patch
index 261358459e..e5e257b49a 100644
--- a/meta-oe/recipes-support/ssiapi/ssiapi/0003-engine-Define-discover-const-String-path-in-base-cla.patch
+++ b/meta-oe/recipes-support/ssiapi/ssiapi/0003-engine-Define-discover-const-String-path-in-base-cla.patch
@@ -11,6 +11,8 @@ Remove ununsed orom_vmd
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  lib/engine/storage_object.h | 3 +++
  lib/engine/vmd_raid_info.h  | 2 --
  2 files changed, 3 insertions(+), 2 deletions(-)
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi/0003-replace-canonicalize_file_name-with-realpath.patch b/meta-oe/recipes-support/ssiapi/ssiapi/0003-replace-canonicalize_file_name-with-realpath.patch
index 848d38b223..d70be51ee6 100644
--- a/meta-oe/recipes-support/ssiapi/ssiapi/0003-replace-canonicalize_file_name-with-realpath.patch
+++ b/meta-oe/recipes-support/ssiapi/ssiapi/0003-replace-canonicalize_file_name-with-realpath.patch
@@ -11,6 +11,8 @@ error: use of undeclared identifier 'canonicalize_file_name'
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  lib/engine/filesystem.cpp | 2 +-
  tools/ssieventmonitor.cpp | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi/0004-Do-not-override-flags-coming-from-build-environment.patch b/meta-oe/recipes-support/ssiapi/ssiapi/0004-Do-not-override-flags-coming-from-build-environment.patch
index ca2ffc56b1..56e3c658a4 100644
--- a/meta-oe/recipes-support/ssiapi/ssiapi/0004-Do-not-override-flags-coming-from-build-environment.patch
+++ b/meta-oe/recipes-support/ssiapi/ssiapi/0004-Do-not-override-flags-coming-from-build-environment.patch
@@ -8,6 +8,8 @@ without this change, the build would fail
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  configure.ac | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi/0004-include-limits.h.patch b/meta-oe/recipes-support/ssiapi/ssiapi/0004-include-limits.h.patch
index d63eb50619..005a35e5a4 100644
--- a/meta-oe/recipes-support/ssiapi/ssiapi/0004-include-limits.h.patch
+++ b/meta-oe/recipes-support/ssiapi/ssiapi/0004-include-limits.h.patch
@@ -8,6 +8,8 @@ error: use of undeclared identifier 'PATH_MAX'
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  tools/ssieventmonitor.cpp | 1 +
  1 file changed, 1 insertion(+)
 
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi/0005-enable-out-of-source-tree-builds.patch b/meta-oe/recipes-support/ssiapi/ssiapi/0005-enable-out-of-source-tree-builds.patch
index c516f65252..6dd7fc735e 100644
--- a/meta-oe/recipes-support/ssiapi/ssiapi/0005-enable-out-of-source-tree-builds.patch
+++ b/meta-oe/recipes-support/ssiapi/ssiapi/0005-enable-out-of-source-tree-builds.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] enable out of source tree builds
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  lib/efi/Makefile.am      |  2 +-
  lib/engine/Makefile.am   |  2 +-
  lib/orom/Makefile.am     |  2 +-
diff --git a/meta-oe/recipes-support/uim/uim/uim-module-manager.patch b/meta-oe/recipes-support/uim/uim/uim-module-manager.patch
index 0fafc8533e..0e2fb687b6 100644
--- a/meta-oe/recipes-support/uim/uim/uim-module-manager.patch
+++ b/meta-oe/recipes-support/uim/uim/uim-module-manager.patch
@@ -3,6 +3,8 @@ From: Bian Naimeng <biannm@cn.fujitsu.com>
 Date: Fri, 26 Jun 2015 12:57:48 +0900
 
 ---
+Upstream-Status: Pending
+
  scm/Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-support/utouch/utouch-frame/0001-include-sys-stat.h-for-fixing-build-issue-on-musl.patch b/meta-oe/recipes-support/utouch/utouch-frame/0001-include-sys-stat.h-for-fixing-build-issue-on-musl.patch
index f3c8eeb418..f0860fcd90 100644
--- a/meta-oe/recipes-support/utouch/utouch-frame/0001-include-sys-stat.h-for-fixing-build-issue-on-musl.patch
+++ b/meta-oe/recipes-support/utouch/utouch-frame/0001-include-sys-stat.h-for-fixing-build-issue-on-musl.patch
@@ -9,6 +9,8 @@ error: field has incomplete
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  tools/utouch-frame-test-mtdev.c | 1 +
  1 file changed, 1 insertion(+)
 
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/1024.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/1024.patch
index 7506d8bb26..12613f8b19 100644
--- a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/1024.patch
+++ b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/1024.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] SCons 4.2.0 no longer has env_cpp11.has_key() Check env_cpp11
 
 This fixes https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1003022
 ---
+Upstream-Status: Pending
+
  examples/broadcast_server/SConscript    | 2 +-
  examples/debug_client/SConscript        | 2 +-
  examples/debug_server/SConscript        | 2 +-
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/855.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/855.patch
index 3245d941b0..68cb645b40 100644
--- a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/855.patch
+++ b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/855.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] Fix cmake find boost with version >= 1.71
 
 For some reasons "system;thread;random;unit_test_framework" was seen as a single module, because of the quotes.
 ---
+Upstream-Status: Pending
+
  CMakeLists.txt | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/857.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/857.patch
index f221cd6999..401a614dc1 100644
--- a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/857.patch
+++ b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/857.patch
@@ -8,6 +8,8 @@ Subject: [PATCH] Update SConstruct with new Python3 syntax: - new raise
 This should fix FTBFS against new scons 3.1.2
 https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=947584
 ---
+Upstream-Status: Pending
+
  SConstruct | 45 +++++++++++++++++++++++----------------------
  1 file changed, 23 insertions(+), 22 deletions(-)
 
diff --git a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal/0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal/0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch
index 4b80c6e9f8..1997d0ffe7 100644
--- a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal/0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch
+++ b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal/0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch
@@ -4,6 +4,8 @@ Date: Mon, 12 Dec 2022 18:40:31 +0100
 Subject: [PATCH] xdg-desktop-portal.pc.in: add pc_sysrootdir dir
 
 ---
+Upstream-Status: Pending
+
  xdg-desktop-portal.pc.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-support/xmlstarlet/files/configure.ac.patch b/meta-oe/recipes-support/xmlstarlet/files/configure.ac.patch
index e55f4f3b13..7e13110a3b 100644
--- a/meta-oe/recipes-support/xmlstarlet/files/configure.ac.patch
+++ b/meta-oe/recipes-support/xmlstarlet/files/configure.ac.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 configure.ac: don't use xml-config if --with-libxml-prefix is specified to configure
 
 Same behavior for xslt-config.
diff --git a/meta-oe/recipes-support/xrdp/xrdp/0001-Added-req_distinguished_name-in-etc-xrdp-openssl.con.patch b/meta-oe/recipes-support/xrdp/xrdp/0001-Added-req_distinguished_name-in-etc-xrdp-openssl.con.patch
index 5e7fca02a5..05803266cb 100644
--- a/meta-oe/recipes-support/xrdp/xrdp/0001-Added-req_distinguished_name-in-etc-xrdp-openssl.con.patch
+++ b/meta-oe/recipes-support/xrdp/xrdp/0001-Added-req_distinguished_name-in-etc-xrdp-openssl.con.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] Added  req_distinguished_name in /etc/xrdp/openssl.conf,
 
 Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
 ---
+Upstream-Status: Pending
+
  keygen/openssl.conf | 8 ++++++++
  1 file changed, 8 insertions(+)
 
diff --git a/meta-oe/recipes-support/xrdp/xrdp/0001-Fix-the-compile-error.patch b/meta-oe/recipes-support/xrdp/xrdp/0001-Fix-the-compile-error.patch
index 82b2790856..e8b4ffa6bf 100644
--- a/meta-oe/recipes-support/xrdp/xrdp/0001-Fix-the-compile-error.patch
+++ b/meta-oe/recipes-support/xrdp/xrdp/0001-Fix-the-compile-error.patch
@@ -5,6 +5,8 @@ Fix the compile error:
 
 Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
 ---
+Upstream-Status: Pending
+
  xrdp/Makefile.am | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
diff --git a/meta-oe/recipes-support/zbar/zbar/0001-qt-Create-subdir-in-Makefile.patch b/meta-oe/recipes-support/zbar/zbar/0001-qt-Create-subdir-in-Makefile.patch
index d7ca152074..3d8c07f02b 100644
--- a/meta-oe/recipes-support/zbar/zbar/0001-qt-Create-subdir-in-Makefile.patch
+++ b/meta-oe/recipes-support/zbar/zbar/0001-qt-Create-subdir-in-Makefile.patch
@@ -17,6 +17,8 @@ make: *** [Makefile:2459: qt/moc_QZBar.cpp] Error 1
 
 Signed-off-by: Daniel Gomez <dagmcr@gmail.com>
 ---
+Upstream-Status: Pending
+
  qt/Makefile.am.inc | 1 +
  1 file changed, 1 insertion(+)
 
diff --git a/meta-oe/recipes-support/zbar/zbar/0002-zbarcam-Create-subdir-in-Makefile.patch b/meta-oe/recipes-support/zbar/zbar/0002-zbarcam-Create-subdir-in-Makefile.patch
index a1c27b8b43..9030ed88f2 100644
--- a/meta-oe/recipes-support/zbar/zbar/0002-zbarcam-Create-subdir-in-Makefile.patch
+++ b/meta-oe/recipes-support/zbar/zbar/0002-zbarcam-Create-subdir-in-Makefile.patch
@@ -20,6 +20,8 @@ make: *** [Makefile:2438: zbarcam/moc_zbarcam_qt.h] Error 1
 
 Signed-off-by: Daniel Gomez <dagmcr@gmail.com>
 ---
+Upstream-Status: Pending
+
  zbarcam/Makefile.am.inc | 1 +
  1 file changed, 1 insertion(+)
 
diff --git a/meta-oe/recipes-test/fwts/fwts/0001-Add-correct-printf-qualifier-for-off_t.patch b/meta-oe/recipes-test/fwts/fwts/0001-Add-correct-printf-qualifier-for-off_t.patch
index 0d73d73109..41eaa239d1 100644
--- a/meta-oe/recipes-test/fwts/fwts/0001-Add-correct-printf-qualifier-for-off_t.patch
+++ b/meta-oe/recipes-test/fwts/fwts/0001-Add-correct-printf-qualifier-for-off_t.patch
@@ -5,6 +5,8 @@ Subject: [PATCH 1/6] Add correct printf qualifier for off_t
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  src/bios/ebda_region/ebda_region.c | 10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)
 
diff --git a/meta-oe/recipes-test/fwts/fwts/0006-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch b/meta-oe/recipes-test/fwts/fwts/0006-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch
index b5c265ec2b..b723b87c7a 100644
--- a/meta-oe/recipes-test/fwts/fwts/0006-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch
+++ b/meta-oe/recipes-test/fwts/fwts/0006-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch
@@ -9,6 +9,8 @@ will yield the original pointer value
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  src/lib/src/fwts_acpi_tables.c | 4 ++--
  src/lib/src/fwts_mmap.c        | 2 +-
  src/lib/src/fwts_smbios.c      | 2 +-
diff --git a/meta-oe/recipes-test/testfloat/files/0001-Makefile-for-cross-compile-SoftFloat.patch b/meta-oe/recipes-test/testfloat/files/0001-Makefile-for-cross-compile-SoftFloat.patch
index 9f41bf2da0..908a352d0b 100644
--- a/meta-oe/recipes-test/testfloat/files/0001-Makefile-for-cross-compile-SoftFloat.patch
+++ b/meta-oe/recipes-test/testfloat/files/0001-Makefile-for-cross-compile-SoftFloat.patch
@@ -9,6 +9,8 @@ from Fabio Berton <fabio.berton@ossystems.com.br>.
 
 Signed-off-by: Zong Li <zongbox@gmail.com>
 ---
+Upstream-Status: Pending
+
  SoftFloat-3e/build/Linux-Cross-Compile/Makefile   | 325 ++++++++++++++++++++++
  SoftFloat-3e/build/Linux-Cross-Compile/platform.h |  52 ++++
  2 files changed, 377 insertions(+)
diff --git a/meta-oe/recipes-test/testfloat/files/0002-Makefile-for-cross-compile-TestFloat.patch b/meta-oe/recipes-test/testfloat/files/0002-Makefile-for-cross-compile-TestFloat.patch
index b7d861f8fc..c99ba71b37 100644
--- a/meta-oe/recipes-test/testfloat/files/0002-Makefile-for-cross-compile-TestFloat.patch
+++ b/meta-oe/recipes-test/testfloat/files/0002-Makefile-for-cross-compile-TestFloat.patch
@@ -9,6 +9,8 @@ from Fabio Berton <fabio.berton@ossystems.com.br>.
 
 Signed-off-by: Zong Li <zongbox@gmail.com>
 ---
+Upstream-Status: Pending
+
  TestFloat-3e/build/Linux-Cross-Compile/Makefile   | 353 ++++++++++++++++++++++
  TestFloat-3e/build/Linux-Cross-Compile/platform.h |  48 +++
  2 files changed, 401 insertions(+)
diff --git a/meta-python/recipes-devtools/gyp/gyp/0001-Fix-for-Python-3.10-compatibility.patch b/meta-python/recipes-devtools/gyp/gyp/0001-Fix-for-Python-3.10-compatibility.patch
index 1848654404..d1ac2c6b42 100644
--- a/meta-python/recipes-devtools/gyp/gyp/0001-Fix-for-Python-3.10-compatibility.patch
+++ b/meta-python/recipes-devtools/gyp/gyp/0001-Fix-for-Python-3.10-compatibility.patch
@@ -7,6 +7,8 @@ The collections.abc module replaces collections for Python 3.10
 
 Signed-off-by: Kurt Kiefer <kurt.kiefer@arthrex.com>
 ---
+Upstream-Status: Pending
+
  pylib/gyp/common.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-python/recipes-devtools/python/python-flask-xstatic/remove-pip-requires.patch b/meta-python/recipes-devtools/python/python-flask-xstatic/remove-pip-requires.patch
index a2d620ad06..ba06d670e3 100644
--- a/meta-python/recipes-devtools/python/python-flask-xstatic/remove-pip-requires.patch
+++ b/meta-python/recipes-devtools/python/python-flask-xstatic/remove-pip-requires.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- Flask-XStatic-0.0.1/setup.py.orig	2015-01-30 08:01:56.000000000 -0800
 +++ Flask-XStatic-0.0.1/setup.py	2017-04-17 21:40:32.570181626 -0700
 @@ -1,4 +1,3 @@
diff --git a/meta-python/recipes-devtools/python/python3-bleak/0001-fix-poetry-version-compatibility.patch b/meta-python/recipes-devtools/python/python3-bleak/0001-fix-poetry-version-compatibility.patch
index cc568146dd..051ebbe674 100644
--- a/meta-python/recipes-devtools/python/python3-bleak/0001-fix-poetry-version-compatibility.patch
+++ b/meta-python/recipes-devtools/python/python3-bleak/0001-fix-poetry-version-compatibility.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- a/pyproject.toml	2023-04-19 19:04:47.159474100 -0300
 +++ b/pyproject.toml	2023-05-04 08:08:12.289941765 -0300
 @@ -31,15 +31,15 @@
diff --git a/meta-python/recipes-devtools/python/python3-cmake/run-cmake-from-path.patch b/meta-python/recipes-devtools/python/python3-cmake/run-cmake-from-path.patch
index 5c38fadce0..d4d2903d5e 100644
--- a/meta-python/recipes-devtools/python/python3-cmake/run-cmake-from-path.patch
+++ b/meta-python/recipes-devtools/python/python3-cmake/run-cmake-from-path.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- cmake-3.25.2/src/cmake/__init__.py.old	2023-03-10 09:40:43.582315753 +0100
 +++ cmake-3.25.2/src/cmake/__init__.py	2023-03-10 09:41:38.030874047 +0100
 @@ -36,7 +36,7 @@
diff --git a/meta-python/recipes-devtools/python/python3-eth-utils/0001-setup-don-t-use-setuptools-markdown.patch b/meta-python/recipes-devtools/python/python3-eth-utils/0001-setup-don-t-use-setuptools-markdown.patch
index 3c3c5270a3..6584e60e1d 100644
--- a/meta-python/recipes-devtools/python/python3-eth-utils/0001-setup-don-t-use-setuptools-markdown.patch
+++ b/meta-python/recipes-devtools/python/python3-eth-utils/0001-setup-don-t-use-setuptools-markdown.patch
@@ -9,6 +9,8 @@ the dependencies.
 
 Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
 ---
+Upstream-Status: Pending
+
  setup.py | 2 --
  1 file changed, 2 deletions(-)
 
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch b/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch
index c5fdcd63d2..3de3d0f083 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch
@@ -10,6 +10,8 @@ Sourced from void linux
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
 ---
+Upstream-Status: Pending
+
  absl/base/internal/unscaledcycleclock.cc    | 4 ++--
  absl/base/internal/unscaledcycleclock.h     | 3 ++-
  absl/debugging/internal/examine_stack.cc    | 8 +++++++-
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/mips_bigendian.patch b/meta-python/recipes-devtools/python/python3-grpcio/mips_bigendian.patch
index 775afa415c..088ce33fc5 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/mips_bigendian.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/mips_bigendian.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- a/third_party/boringssl-with-bazel/src/include/openssl/base.h
 +++ b/third_party/boringssl-with-bazel/src/include/openssl/base.h
 @@ -102,10 +102,10 @@ extern "C" {
diff --git a/meta-python/recipes-devtools/python/python3-kivy/0001-add-support-for-glesv2.patch b/meta-python/recipes-devtools/python/python3-kivy/0001-add-support-for-glesv2.patch
index bb236b4195..0abc6c5c7e 100644
--- a/meta-python/recipes-devtools/python/python3-kivy/0001-add-support-for-glesv2.patch
+++ b/meta-python/recipes-devtools/python/python3-kivy/0001-add-support-for-glesv2.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- a/setup.py
 +++ b/setup.py
 @@ -695,7 +695,18 @@ def determine_gl_flags():
diff --git a/meta-python/recipes-devtools/python/python3-pylint/0001-pyproject.toml-Remove-hard-coded-dependencies.patch b/meta-python/recipes-devtools/python/python3-pylint/0001-pyproject.toml-Remove-hard-coded-dependencies.patch
index 267e4c30dd..7950e72077 100644
--- a/meta-python/recipes-devtools/python/python3-pylint/0001-pyproject.toml-Remove-hard-coded-dependencies.patch
+++ b/meta-python/recipes-devtools/python/python3-pylint/0001-pyproject.toml-Remove-hard-coded-dependencies.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] pyproject.toml: Remove hard-coded dependencies
 
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
+Upstream-Status: Pending
+
  pyproject.toml | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-python/recipes-devtools/python/python3-rlp/0001-setup-don-t-use-setuptools-markdown.patch b/meta-python/recipes-devtools/python/python3-rlp/0001-setup-don-t-use-setuptools-markdown.patch
index 643d296394..0ab012a982 100644
--- a/meta-python/recipes-devtools/python/python3-rlp/0001-setup-don-t-use-setuptools-markdown.patch
+++ b/meta-python/recipes-devtools/python/python3-rlp/0001-setup-don-t-use-setuptools-markdown.patch
@@ -9,6 +9,8 @@ dependencies.
 
 Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
 ---
+Upstream-Status: Pending
+
  setup.py | 2 --
  1 file changed, 2 deletions(-)
 
diff --git a/meta-python/recipes-devtools/python/python3-slip-dbus/9b939c0b534c1b7958fa0a3c7aedf30bca910431.patch b/meta-python/recipes-devtools/python/python3-slip-dbus/9b939c0b534c1b7958fa0a3c7aedf30bca910431.patch
index b0e9d2215f..7080047b79 100644
--- a/meta-python/recipes-devtools/python/python3-slip-dbus/9b939c0b534c1b7958fa0a3c7aedf30bca910431.patch
+++ b/meta-python/recipes-devtools/python/python3-slip-dbus/9b939c0b534c1b7958fa0a3c7aedf30bca910431.patch
@@ -9,6 +9,8 @@ the collections module in Python 3.10.
 https://docs.python.org/3.10/whatsnew/changelog.html#python-3-10-0-alpha-5
 https://bugs.python.org/issue37324
 ---
+Upstream-Status: Pending
+
  slip/dbus/polkit.py   | 6 +++---
  slip/util/hookable.py | 6 +++---
  2 files changed, 6 insertions(+), 6 deletions(-)
diff --git a/meta-python/recipes-devtools/python/python3-uinput/0001-setup-use-setuptools-instead-of-distutils.patch b/meta-python/recipes-devtools/python/python3-uinput/0001-setup-use-setuptools-instead-of-distutils.patch
index 54a3c18676..b2e1b9cd82 100644
--- a/meta-python/recipes-devtools/python/python3-uinput/0001-setup-use-setuptools-instead-of-distutils.patch
+++ b/meta-python/recipes-devtools/python/python3-uinput/0001-setup-use-setuptools-instead-of-distutils.patch
@@ -7,6 +7,8 @@ The latter is deprecated, use setuptools instead.
 
 Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
 ---
+Upstream-Status: Pending
+
  setup.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-python/recipes-devtools/python/python3-ujson/0001-setup.py-Do-not-strip-debugging-symbols.patch b/meta-python/recipes-devtools/python/python3-ujson/0001-setup.py-Do-not-strip-debugging-symbols.patch
index 42cd99a895..8ba8ada556 100644
--- a/meta-python/recipes-devtools/python/python3-ujson/0001-setup.py-Do-not-strip-debugging-symbols.patch
+++ b/meta-python/recipes-devtools/python/python3-ujson/0001-setup.py-Do-not-strip-debugging-symbols.patch
@@ -8,6 +8,8 @@ bitbake build errors related to already-stripped.
 
 Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
+Upstream-Status: Pending
+
  setup.py | 8 +-------
  1 file changed, 1 insertion(+), 7 deletions(-)
 
diff --git a/meta-python/recipes-devtools/python/python3-yappi/0001-Fix-imports-for-ptests.patch b/meta-python/recipes-devtools/python/python3-yappi/0001-Fix-imports-for-ptests.patch
index 274f6f527b..476db4b7d0 100644
--- a/meta-python/recipes-devtools/python/python3-yappi/0001-Fix-imports-for-ptests.patch
+++ b/meta-python/recipes-devtools/python/python3-yappi/0001-Fix-imports-for-ptests.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] Fix imports for tests
 
 Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
 ---
+Upstream-Status: Pending
+
  tests/test_asyncio.py              | 2 +-
  tests/test_asyncio_context_vars.py | 2 +-
  tests/test_functionality.py        | 2 +-
diff --git a/meta-python/recipes-devtools/python/python3-yappi/0002-add-3.11-to-the-setup.patch b/meta-python/recipes-devtools/python/python3-yappi/0002-add-3.11-to-the-setup.patch
index a9bf612db8..d40bd2b7cc 100644
--- a/meta-python/recipes-devtools/python/python3-yappi/0002-add-3.11-to-the-setup.patch
+++ b/meta-python/recipes-devtools/python/python3-yappi/0002-add-3.11-to-the-setup.patch
@@ -4,6 +4,8 @@ Date: Fri, 25 Nov 2022 15:58:03 +0300
 Subject: [PATCH 2/2] add 3.11 to the setup
 
 ---
+Upstream-Status: Pending
+
  setup.py | 1 +
  1 file changed, 1 insertion(+)
 
diff --git a/meta-python/recipes-extended/python-pykickstart/files/0002-pykickstart-parser.py-add-lock-for-readKickstart-and.patch b/meta-python/recipes-extended/python-pykickstart/files/0002-pykickstart-parser.py-add-lock-for-readKickstart-and.patch
index 5e0d6166fa..f5483db825 100644
--- a/meta-python/recipes-extended/python-pykickstart/files/0002-pykickstart-parser.py-add-lock-for-readKickstart-and.patch
+++ b/meta-python/recipes-extended/python-pykickstart/files/0002-pykickstart-parser.py-add-lock-for-readKickstart-and.patch
@@ -11,6 +11,8 @@ Subject: [PATCH 2/4] pykickstart/parser.py: add lock for readKickstart and
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 ---
+Upstream-Status: Pending
+
  pykickstart/load.py   |  2 +-
  pykickstart/parser.py | 18 ++++++++++++++++++
  2 files changed, 19 insertions(+), 1 deletion(-)
-- 
2.41.0


