Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54CE2C5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:42 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24415.1786747659095972023
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:47:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PLgmwPg9;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38e08baf860so1640750a91.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747658; x=1787352458; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V0R4ExBObYGoD1Il86CnWPWmJ1yLxcr6RpTJqQpJirs=;
        b=PLgmwPg9ydPZyhqcqN/+O0fNwXf2CsUEn6jGGOxeECp0pUXmAcqNA4ttEQ3r/V/V1g
         o2XpwO7GakkX/HF+8VS7acc/dfMK2NGHCSTbs9ZFj2u9IAAzo77HVcCpEZZDm1P235lx
         63N2in87wrK+ETDs/FVIGH8cykEqwu/4N0cQXznwCzy/LarX/jw9xGp7+MADUuic6z4H
         tZOQi/EwwuVT8mIW5g6LN8SferDXysipU9jGzpuAXfgSgGlRKxLL2EPwrJkqEedSy4z6
         CceNr2eeGkbAns0HNZC7oJXqNlScEGeRIwhBJe9XFAf2hDWvDy4eUmprneq3YzJDoLa9
         3drA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747658; x=1787352458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V0R4ExBObYGoD1Il86CnWPWmJ1yLxcr6RpTJqQpJirs=;
        b=mAZQ1yJDjk0lle0Vk/Amg98/Ipv+JdOWefZ+02REOezTpJBOGK7VL4ym/AZrAhQBS5
         wFdiI9GrkzJgV0k10qUDng2PC+zt+dGau276u6R3rigiJnU5kXFNIqWtTOLs5NfzMEPX
         XW3dAxru6+5txOFKl269fHohjwlVwpmYkfvKqIHYAVgkviucud1jcIs9LU/SMb8c77x9
         mDkudtkQwhAp1KBynz9MSNl8dK6vETbwPe8g5cAJ49c2vF0QEYq5pl0kAtlxZ/65YHac
         T4N5iPPd9qFaX1DyWGiI6lNZ9nb6aPtYsr1qnRZPeJ4UEXvnFEi3mqNokmq84r6GBJwU
         v5pQ==
X-Gm-Message-State: AOJu0YyDIT4KNlnztQcMpwczLWiTP1qZtulgrdq948iFUDrT2tP5fdYD
	LwrVPhYDIXHkQ6k0DOWDA7s2vquZXpDNnicO3URMNfW/Bj1m93Fnq6lnx2reWf4N
X-Gm-Gg: AR+sD11HEvI55hrebrNvfNTgpL3n3ahgvWWogPczyfTasWIjH2tKZz9hdGNiiOzXl8X
	k1gtvzgovG4ixKVYNS+FUigFRhr7dSNeB3lRJo4sI1fE2MqXRc94rWnWGcRPBGoxENXsilOIhhZ
	ddbggU24qZh9aVOL4zxc1nJOliGVaokTbuLp1LyGJtLF1G+z+pZ6IYtT2USCAzk9FkWwQjSZXG5
	ZVUjFvLionV9w6uSCuChNundoMwqn3dDJqBSj4mvuL1yogRhOujSXM7vY4vTu1FJl5UYkwBN05r
	cpHAcayyHNywvBD/rVbAggLfRX+2Kkgw/YUYK49iS5UJFNSjAtT4l+p4LumVxqGpdK0IGvTYN1K
	g4ZeZoSkiEfmB7t4iLhPzf6T6HtSN6+1mc6MvM2X6aev9wfKNg5/oPxmRMANaMWXz8uowo2K47Q
	/DFWmUaBm9eCBO0R+uJ62YXx/Vk7cKWIkkoQ2z5snPoPWXpHJEfO7iYqwvHWJ+DWQLl761gSvaN
	DSuOdV9iKbH5r6lBy/+R5K+XUBHPWEjo0uc2G7+5935AVdDDNlT0khlaRC+9jTVhf14V2c0quDu
	1MsLLbONW+VvyLsSEKpqIltaRt4fJnPqFKGMnR1044vcYU3Epk67gOeWV6ZWZrPRgeC+92vmoqE
	GygKdN0D6/H6GZt0lt05O0FxJO6cgOWVxGPHyf35X+V39BQ==
X-Received: by 2002:a17:90a:e7c1:b0:36a:8240:2477 with SMTP id 98e67ed59e1d1-3933ed1ba09mr9668315a91.19.1786747658132;
        Fri, 14 Aug 2026 15:47:38 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:47:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 098/109] networkmanager: upgrade 1.56.0 -> 1.58.0
Date: Fri, 14 Aug 2026 15:45:24 -0700
Message-ID: <20260814224539.1523174-98-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129162

Bump to the nm-1-58 stable branch. CVE-2026-10805 and the DHCPv4
out-of-bounds read fix are both already included in the 1.58.0 tag
(verified via git merge-base --is-ancestor against upstream), so no
backport patch is required.

- 0002-meson-fix-cross-compilation-issues.patch dropped: merged
  upstream verbatim as commit e5d2c7c by the same author, and is an
  ancestor of the 1.58.0 tag.
- 0001-linker-scripts-Do-not-export-_IO_stdin_used.patch kept, still
  needed, applies with offset only.
- dhclient support was removed upstream (all: drop dhclient code and
  build configuration); drop PACKAGECONFIG[dhclient] and update the
  NETWORKMANAGER_DHCP_DEFAULT comment accordingly.
- Wireless Extensions (wext) meson option is deprecated and now
  errors on -Dwext=true; drop it from PACKAGECONFIG[wifi], keeping
  only -Dwifi.
- New CLAT feature defaults to enabled in meson_options.txt and pulls
  in libbpf >= 1.3.0; add PACKAGECONFIG[clat] but leave it out of the
  default PACKAGECONFIG set so it stays disabled and avoids a new
  hard dependency.
- Package the new nm-initrd-generator.sh systemd generator directory
  under ${PN}-daemon and make bash an unconditional RDEPENDS since
  the generator script requires it regardless of the ifupdown
  PACKAGECONFIG setting.

Build-verified: networkmanager and its openvpn/openconnect/
fortisslvpn plugin recipes all build successfully.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...2-meson-fix-cross-compilation-issues.patch | 69 -------------------
 ...ger_1.56.0.bb => networkmanager_1.58.0.bb} | 20 +++---
 2 files changed, 12 insertions(+), 77 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-meson-fix-cross-compilation-issues.patch
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.56.0.bb => networkmanager_1.58.0.bb} (94%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-meson-fix-cross-compilation-issues.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-meson-fix-cross-compilation-issues.patch
deleted file mode 100644
index 617c614958..0000000000
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-meson-fix-cross-compilation-issues.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 49cc7ebaf3ed86b693ac80c76a28ba0db7406374 Mon Sep 17 00:00:00 2001
-From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
-Date: Mon, 9 Mar 2026 15:50:26 +0100
-Subject: [PATCH] meson: fix cross-compilation issues
-
-Strip newline from GI_TYPELIB_PATH and LD_LIBRARY_PATH
-run_command().stdout() returns the raw shell output including a trailing
-newline. When the value is used to build a colon-separated path, the newline
-gets embedded at the end of the last path component, making the directory
-invalid and causing GObject Introspection to fail with:
-
-  ImportError: Typelib file for namespace 'Gio', version '2.0' not found
-
-Use .strip() to remove leading/trailing whitespace from both env variable
-reads.
-
-Fix jansson SONAME detection for cross-compilation
-When cross-compiling, jansson's pkg-config 'libdir' variable returns a
-path relative to the sysroot (e.g., /usr/lib) without the actual sysroot
-prefix.  The host readelf binary cannot find the library at that path.
-
-Fix this by using meson.get_external_property('sys_root', '') to obtain
-the sysroot path set by the cross-compilation environment and prepend it
-to the library path before calling readelf.
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/merge_requests/2380]
-Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
----
- meson.build                       | 3 ++-
- src/libnm-client-impl/meson.build | 4 ++--
- 2 files changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 8b0334240d..75f6871dd2 100644
---- a/meson.build
-+++ b/meson.build
-@@ -296,7 +296,8 @@ config_h.set10('WITH_JANSSON', jansson_dep.found())
- jansson_msg = 'no'
- if jansson_dep.found()
-   jansson_libdir = jansson_dep.get_variable(pkgconfig: 'libdir')
--  res = run_command(find_program('eu-readelf', 'readelf'), '-d', join_paths(jansson_libdir, 'libjansson.so'), check: false)
-+  jansson_sysroot = meson.is_cross_build() ? meson.get_external_property('sys_root', '') : ''
-+  res = run_command(find_program('eu-readelf', 'readelf'), '-d', jansson_sysroot + join_paths(jansson_libdir, 'libjansson.so'), check: false)
-   jansson_soname = ''
-   foreach line: res.stdout().split('\n')
-     if line.strip().contains('SONAME')
-diff --git a/src/libnm-client-impl/meson.build b/src/libnm-client-impl/meson.build
-index 3352ebfee0..329078ab46 100644
---- a/src/libnm-client-impl/meson.build
-+++ b/src/libnm-client-impl/meson.build
-@@ -167,13 +167,13 @@ if enable_introspection
-     install: true,
-   )
- 
--  gi_typelib_path = run_command('printenv', 'GI_TYPELIB_PATH', check: false).stdout()
-+  gi_typelib_path = run_command('printenv', 'GI_TYPELIB_PATH', check: false).stdout().strip()
-   if gi_typelib_path != ''
-     gi_typelib_path = ':' + gi_typelib_path
-   endif
-   gi_typelib_path = meson.current_build_dir() + gi_typelib_path
- 
--  ld_library_path = run_command('printenv', 'LD_LIBRARY_PATH', check: false).stdout()
-+  ld_library_path = run_command('printenv', 'LD_LIBRARY_PATH', check: false).stdout().strip()
-   if ld_library_path != ''
-     ld_library_path = ':' + ld_library_path
-   endif
--- 
-2.47.3
-
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.56.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.58.0.bb
similarity index 94%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.56.0.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.58.0.bb
index a8f1a1673d..976f936b0d 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.56.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.58.0.bb
@@ -38,20 +38,19 @@ DEPENDS:append:class-target = " bash-completion"
 inherit meson gettext update-rc.d systemd gobject-introspection update-alternatives upstream-version-is-even pkgconfig
 
 SRC_URI = " \
-    git://github.com/NetworkManager/NetworkManager.git;protocol=https;branch=nm-1-56;tag=${PV} \
+    git://github.com/NetworkManager/NetworkManager.git;protocol=https;branch=nm-1-58;tag=${PV} \
     file://${BPN}.initd \
     file://enable-dhcpcd.conf \
     file://enable-iwd.conf \
-    file://0002-meson-fix-cross-compilation-issues.patch \
 "
 SRC_URI:append:libc-musl = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' file://0001-linker-scripts-Do-not-export-_IO_stdin_used.patch', '', d)}"
 
-SRCREV = "56b51b98fbb8627c4c09a483702e18fd8aee7ce1"
+SRCREV = "61302aac7f2e7411f3b42159544926484eacd37e"
 
 # ['auto', 'symlink', 'file', 'netconfig', 'resolvconf']
 NETWORKMANAGER_DNS_RC_MANAGER_DEFAULT ??= "auto"
 
-# ['dhclient', 'dhcpcd', 'internal', 'nettools']
+# ['dhcpcd', 'internal', 'nettools']
 NETWORKMANAGER_DHCP_DEFAULT ??= "internal"
 
 # The default gets detected based on whether /usr/sbin/nft or /usr/sbin/iptables is installed, with nftables preferred.
@@ -81,9 +80,13 @@ PACKAGECONFIG ??= "readline nss ifupdown dnsmasq nmcli \
 
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'vala', 'vala', '', d)}
 
+# systemdsystemunitdir and systemdsystemgeneratordir both default to an empty
+# string, which makes meson.build assert that systemd was found so it can
+# resolve them from systemd.pc. Both have to be turned off explicitly, not just
+# the unit dir, otherwise configure fails when systemd is not available.
 PACKAGECONFIG[systemd] = "\
     -Dsystemdsystemunitdir=${systemd_unitdir}/system -Dsession_tracking=systemd,\
-    -Dsystemdsystemunitdir=no -Dsystemd_journal=false -Dsession_tracking=no\
+    -Dsystemdsystemunitdir=no -Dsystemdsystemgeneratordir=no -Dsystemd_journal=false -Dsession_tracking=no\
 "
 PACKAGECONFIG[polkit] = "-Dpolkit=true,-Dpolkit=false,polkit"
 PACKAGECONFIG[bluez5] = "-Dbluez5_dun=true,-Dbluez5_dun=false,bluez5"
@@ -96,7 +99,7 @@ PACKAGECONFIG[nss] = "-Dcrypto=nss,,nss"
 PACKAGECONFIG[resolvconf] = "-Dresolvconf=${base_sbindir}/resolvconf,-Dresolvconf=no,,resolvconf"
 PACKAGECONFIG[gnutls] = "-Dcrypto=gnutls,,gnutls"
 PACKAGECONFIG[crypto-null] = "-Dcrypto=null"
-PACKAGECONFIG[wifi] = "-Dwext=true -Dwifi=true,-Dwext=false -Dwifi=false"
+PACKAGECONFIG[wifi] = "-Dwifi=true,-Dwifi=false"
 PACKAGECONFIG[iwd] = "-Diwd=true,-Diwd=false"
 PACKAGECONFIG[ifupdown] = "-Difupdown=true,-Difupdown=false"
 PACKAGECONFIG[cloud-setup] = "-Dnm_cloud_setup=true,-Dnm_cloud_setup=false,jansson"
@@ -109,13 +112,13 @@ PACKAGECONFIG[audit] = "-Dlibaudit=yes,-Dlibaudit=no,audit"
 PACKAGECONFIG[selinux] = "-Dselinux=true,-Dselinux=false,libselinux"
 PACKAGECONFIG[vala] = "-Dvapi=true,-Dvapi=false"
 PACKAGECONFIG[dhcpcd] = "-Ddhcpcd=${base_sbindir}/dhcpcd,-Ddhcpcd=no,,dhcpcd"
-PACKAGECONFIG[dhclient] = "-Ddhclient=yes,-Ddhclient=no,,dhcp"
 PACKAGECONFIG[concheck] = "-Dconcheck=true,-Dconcheck=false"
 PACKAGECONFIG[adsl] = ",,"
 PACKAGECONFIG[wwan] = ",,"
 # The following PACKAGECONFIG is used to determine whether NM is managing /etc/resolv.conf itself or not
 PACKAGECONFIG[man-resolv-conf] = ",,"
 PACKAGECONFIG[nbft] = "-Dnbft=true,-Dnbft=false"
+PACKAGECONFIG[clat] = "-Dclat=true,-Dclat=false,libbpf"
 
 
 PACKAGES =+ " \
@@ -252,9 +255,10 @@ FILES:${PN}-daemon += " \
     ${sysconfdir}/resolv-conf.NetworkManager \
     ${sysconfdir}/sysconfig/network-scripts \
     ${systemd_system_unitdir} \
+    ${systemd_unitdir}/system-generators \
 "
 RDEPENDS:${PN}-daemon += "\
-    ${@bb.utils.contains('PACKAGECONFIG', 'ifupdown', 'bash', '', d)} \
+    bash \
 "
 RRECOMMENDS:${PN}-daemon += "\
     ${NETWORKMANAGER_FIREWALL_DEFAULT} \

