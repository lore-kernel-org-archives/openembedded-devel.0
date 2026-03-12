Return-Path: <andrej.kozemcak@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1447F1067027
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 14:06:21 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22333.1773324370683095866
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 07:06:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=andrej.kozemcak@siemens.com header.s=fm1 header.b=W6CqRvUH;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1334352-2026031214060865461942cf000207c3-6y5ggy@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026031214060865461942cf000207c3
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 12 Mar 2026 15:06:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=andrej.kozemcak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=G86NLsluoiKyrcxFYHqcuo7tBgeZxHZ/q7BiTUcLYlc=;
 b=W6CqRvUHW5lrenRECppNOty193c9iuaa3j5s5igxCp+tIDW7/qiMdWoY0wIT8lLhfH7kxe
 oRXSzaw533+YNJT45IRTWSaEDQ+y1mEPjay8PTCcfbRtkqQIxedK2eG2KipN9hXtqrQjQGjm
 im1XEF/NxQQHjWnnI5AcL5BCCG/mkO792KxfKqdavN0rzuyHPsp1F+N8V423q+hY0X4SNY0W
 DUVzzX62yiEqsGBg95FRklgokACpSmew911SY23IFmcI25Aj4QTRC6IWyDIZ+sQ+sBqDZFVA
 52yb2gbqenMZpPr3AeI8SsYe7YGMxSAfLfUm9mbzT3JS4nOW0nAadVNQ==;
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [meta-networking][PATCH 4/6] networkmanager: upgrade 1.52.2 -> 1.56.0
Date: Thu, 12 Mar 2026 15:04:59 +0100
Message-ID: <20260312140501.29859-4-andrej.kozemcak@siemens.com>
In-Reply-To: <20260312140501.29859-1-andrej.kozemcak@siemens.com>
References: <20260312140501.29859-1-andrej.kozemcak@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1334352:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 14:06:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125169

Create path to fix `meson` build errors

Add missing dependencies.

Disables man page generation. The build was using xsltproc to try
downloading http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
from the network, which fails in embedded build environments.

Changelog:

v1.56.0
  https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/1.56.0/NEWS?ref_type=tags

  Changed:
  - Unify the versioning to use everywhere the scheme with the -rcX or -dev
    suffixes when appropriate. This affects, for example, the URL and filename
    of the release tarball and the version reported by nmcli and the daemon.
    As an exception, the C API will continue to use the 90+ scheme for RC versions.
  - nmcli now supports viewing and managing WireGuard peers.
  - Support reapplying the "sriov.vfs" property as long as
    "sriov.total-vfs" is not changed.
  - Support reapplying "bond-port.vlans".
  - Accept hostnames longer than 64 characters from DNS lookup.
  - Make that global-dns configuration overwrites DNS searches and
    options from connections, instead of merging all together.
  - Add support for a new rd.net.dhcp.client-id option in
    nm-initrd-generator.
  - Add gsm device-uid setting to restrict the devices the connection applies to.
  - Support configuring the HSR protocol version via the
    "hsr.protocol-version" property.
  - Fix a bug that makes broadband connections auto-connect getting
    blocked if the connection tries to reconnect when modem status is
    "disconnecting" / "disconnected".
  - Treat modem connection not having an operator code available
    as a recoverable error.
  - Add support for configuring systemd-resolved's DNSSEC option
    per-connection via the "connection.dnssec" connection property.
  - Support configuring the HSR interlink port via the
    "hsr.interlink" property.
  - Fix some connection properties not being applied to vpn connections
    (connection.mdns, connection.llmnr, connection.dns-over-tls,
    connection.mptcp-flags, ipv6.ip6-privacy)
  - Update n-acd to always compile with eBPF enabled, as support
    for eBPF is now detected at run time.
  - Add new MPTCP 'laminar' endpoint type, and set it by default alongside
    the 'subflow' one.
  - For private connections (the ones that specify a user in the
    "connection.permissions" property), verify that the user can access
    the 802.1X certificates and keys set in the connection.
  - Introduce a libnm function that can be used by VPN plugins to check
    user permissions on certificate and keys.

v1.54.0
  https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/1.54.0/NEWS?ref_type=tags

  Changed:
  - Add support for configuring per-device IPv4 forwarding via the
    "ipv4.forwarding" connection property.
  - Add a new "prefix-delegation" setting containing a "subnet-id"
    property that specifies the subnet to choose on the downstream
    interface when using IPv6 prefix delegation.
  - Support OCI baremetal in nm-cloud-setup
  - When activating a WireGuard connection to an IPv6 endpoint, now
    NetworkManager creates firewall rules to ensure that the incoming
    packets are not dropped by kernel reverse path filtering.
  - Add support for configuring the loopback interface in nmtui.
  - Most of the properties of ovs-bridge and ovs-port connections can
    now be reapplied at runtime without bringing the connection down.
  - Add a new "sriov.preserve-on-down" property that controls whether
    NetworkManager preserves the SR-IOV parameters set on the device
    when the connection is deactivated, or whether it resets them to
    their default value.
  - Introduce a new "ovs-dpdk.lsc-interrupt" property to configure the
    Link State Change (LSC) detection mode for OVS DPDK interfaces.
  - The initrd-generator now can parse the NVMe Boot Firmware Table
    (NBFT) to configure networking during early boot.
  - Add systemd services to provide networking in the initrd.

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 ...2-meson-fix-cross-compilation-issues.patch | 69 +++++++++++++++++++
 ...ger_1.52.2.bb => networkmanager_1.56.0.bb} | 13 ++--
 2 files changed, 77 insertions(+), 5 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-meson-fix-cross-compilation-issues.patch
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.52.2.bb => networkmanager_1.56.0.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-meson-fix-cross-compilation-issues.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-meson-fix-cross-compilation-issues.patch
new file mode 100644
index 0000000000..617c614958
--- /dev/null
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-meson-fix-cross-compilation-issues.patch
@@ -0,0 +1,69 @@
+From 49cc7ebaf3ed86b693ac80c76a28ba0db7406374 Mon Sep 17 00:00:00 2001
+From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
+Date: Mon, 9 Mar 2026 15:50:26 +0100
+Subject: [PATCH] meson: fix cross-compilation issues
+
+Strip newline from GI_TYPELIB_PATH and LD_LIBRARY_PATH
+run_command().stdout() returns the raw shell output including a trailing
+newline. When the value is used to build a colon-separated path, the newline
+gets embedded at the end of the last path component, making the directory
+invalid and causing GObject Introspection to fail with:
+
+  ImportError: Typelib file for namespace 'Gio', version '2.0' not found
+
+Use .strip() to remove leading/trailing whitespace from both env variable
+reads.
+
+Fix jansson SONAME detection for cross-compilation
+When cross-compiling, jansson's pkg-config 'libdir' variable returns a
+path relative to the sysroot (e.g., /usr/lib) without the actual sysroot
+prefix.  The host readelf binary cannot find the library at that path.
+
+Fix this by using meson.get_external_property('sys_root', '') to obtain
+the sysroot path set by the cross-compilation environment and prepend it
+to the library path before calling readelf.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/merge_requests/2380]
+Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
+---
+ meson.build                       | 3 ++-
+ src/libnm-client-impl/meson.build | 4 ++--
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 8b0334240d..75f6871dd2 100644
+--- a/meson.build
++++ b/meson.build
+@@ -296,7 +296,8 @@ config_h.set10('WITH_JANSSON', jansson_dep.found())
+ jansson_msg = 'no'
+ if jansson_dep.found()
+   jansson_libdir = jansson_dep.get_variable(pkgconfig: 'libdir')
+-  res = run_command(find_program('eu-readelf', 'readelf'), '-d', join_paths(jansson_libdir, 'libjansson.so'), check: false)
++  jansson_sysroot = meson.is_cross_build() ? meson.get_external_property('sys_root', '') : ''
++  res = run_command(find_program('eu-readelf', 'readelf'), '-d', jansson_sysroot + join_paths(jansson_libdir, 'libjansson.so'), check: false)
+   jansson_soname = ''
+   foreach line: res.stdout().split('\n')
+     if line.strip().contains('SONAME')
+diff --git a/src/libnm-client-impl/meson.build b/src/libnm-client-impl/meson.build
+index 3352ebfee0..329078ab46 100644
+--- a/src/libnm-client-impl/meson.build
++++ b/src/libnm-client-impl/meson.build
+@@ -167,13 +167,13 @@ if enable_introspection
+     install: true,
+   )
+ 
+-  gi_typelib_path = run_command('printenv', 'GI_TYPELIB_PATH', check: false).stdout()
++  gi_typelib_path = run_command('printenv', 'GI_TYPELIB_PATH', check: false).stdout().strip()
+   if gi_typelib_path != ''
+     gi_typelib_path = ':' + gi_typelib_path
+   endif
+   gi_typelib_path = meson.current_build_dir() + gi_typelib_path
+ 
+-  ld_library_path = run_command('printenv', 'LD_LIBRARY_PATH', check: false).stdout()
++  ld_library_path = run_command('printenv', 'LD_LIBRARY_PATH', check: false).stdout().strip()
+   if ld_library_path != ''
+     ld_library_path = ':' + ld_library_path
+   endif
+-- 
+2.47.3
+
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.52.2.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.56.0.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.52.2.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.56.0.bb
index cafc6ce3f2..de163fe00e 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.52.2.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.56.0.bb
@@ -38,14 +38,15 @@ DEPENDS:append:class-target = " bash-completion"
 inherit meson gettext update-rc.d systemd gobject-introspection update-alternatives upstream-version-is-even pkgconfig
 
 SRC_URI = " \
-    git://github.com/NetworkManager/NetworkManager.git;protocol=https;branch=nm-1-52;tag=${PV} \
+    git://github.com/NetworkManager/NetworkManager.git;protocol=https;branch=nm-1-56;tag=${PV} \
     file://${BPN}.initd \
     file://enable-dhcpcd.conf \
     file://enable-iwd.conf \
+    file://0002-meson-fix-cross-compilation-issues.patch \
 "
 SRC_URI:append:libc-musl = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' file://0001-linker-scripts-Do-not-export-_IO_stdin_used.patch', '', d)}"
 
-SRCREV = "57a409441bef013f636ac8e72836c19ecb27c1b9"
+SRCREV = "56b51b98fbb8627c4c09a483702e18fd8aee7ce1"
 
 
 # ['auto', 'symlink', 'file', 'netconfig', 'resolvconf']
@@ -68,6 +69,7 @@ EXTRA_OEMESON = "\
     -Dconfig_dhcp_default=${NETWORKMANAGER_DHCP_DEFAULT} \
     -Diptables=${sbindir}/iptables \
     -Dnft=${sbindir}/nft \
+    -Dman=false \
 "
 
 # stolen from https://github.com/void-linux/void-packages/blob/master/srcpkgs/NetworkManager/template
@@ -80,7 +82,7 @@ CFLAGS:append:libc-musl = " \
 # networkmanager-1.52.0/src/nmcli/agent.c:88:29: error: incompatible function pointer types assigning to 'rl_hook_func_t *' (aka 'int (*)(void)') from 'int (const char *, int)' [-Wincompatible-function-pointer-types]
 #   88 |             rl_startup_hook = set_deftext;
 #      |                             ^ ~~~~~~~~~~~
- 
+
 CFLAGS:append:toolchain-clang = " -Wno-error=incompatible-function-pointer-types"
 
 PACKAGECONFIG ??= "readline nss ifupdown dnsmasq nmcli \
@@ -111,13 +113,13 @@ PACKAGECONFIG[crypto-null] = "-Dcrypto=null"
 PACKAGECONFIG[wifi] = "-Dwext=true -Dwifi=true,-Dwext=false -Dwifi=false"
 PACKAGECONFIG[iwd] = "-Diwd=true,-Diwd=false"
 PACKAGECONFIG[ifupdown] = "-Difupdown=true,-Difupdown=false"
-PACKAGECONFIG[cloud-setup] = "-Dnm_cloud_setup=true,-Dnm_cloud_setup=false"
+PACKAGECONFIG[cloud-setup] = "-Dnm_cloud_setup=true,-Dnm_cloud_setup=false,jansson"
 PACKAGECONFIG[nmcli] = "-Dnmcli=true,-Dnmcli=false"
 PACKAGECONFIG[nmtui] = "-Dnmtui=true,-Dnmtui=false,libnewt"
 PACKAGECONFIG[readline] = "-Dreadline=libreadline,,readline"
 PACKAGECONFIG[libedit] = "-Dreadline=libedit,,libedit"
 PACKAGECONFIG[ovs] = "-Dovs=true,-Dovs=false,jansson"
-PACKAGECONFIG[audit] = "-Dlibaudit=yes,-Dlibaudit=no"
+PACKAGECONFIG[audit] = "-Dlibaudit=yes,-Dlibaudit=no,audit"
 PACKAGECONFIG[selinux] = "-Dselinux=true,-Dselinux=false,libselinux"
 PACKAGECONFIG[vala] = "-Dvapi=true,-Dvapi=false"
 PACKAGECONFIG[dhcpcd] = "-Ddhcpcd=${base_sbindir}/dhcpcd,-Ddhcpcd=no,,dhcpcd"
@@ -127,6 +129,7 @@ PACKAGECONFIG[adsl] = ",,"
 PACKAGECONFIG[wwan] = ",,"
 # The following PACKAGECONFIG is used to determine whether NM is managing /etc/resolv.conf itself or not
 PACKAGECONFIG[man-resolv-conf] = ",,"
+PACKAGECONFIG[nbft] = "-Dnbft=true,-Dnbft=false"
 
 
 PACKAGES =+ " \
-- 
2.47.3


