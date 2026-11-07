Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11958.1794070351046855891
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Nov 2026 08:52:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kLnHPAke;
 spf=pass (domain: konsulko.com, ip: 209.85.221.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so958355f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 08:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794070349; x=1794675149; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fwRvo27T4YdJJNaip8FrJByn6XL4bG2ukr7Qo0Qrm2E=;
        b=kLnHPAkeBjGZ92if/VhK/shKBGd88nWGeQeYfYmSM+7f9NkRUxvdWKVzG94hDlS9ac
         WTUaxZ8makd6tjprSx7UHHCJPHkhl5tV8FPqu7qJBs5bT0ai7GPSsL31SLTPIX+n7KRX
         sNgZoQ8LvAJ7bZIYW0p9bI5QXuZBc91lyCCks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070349; x=1794675149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fwRvo27T4YdJJNaip8FrJByn6XL4bG2ukr7Qo0Qrm2E=;
        b=vg3gKS5pUF8zM1OpEvL4VAUH6vjApPmac1PKoIT4zOe48QWfdcQ7xFuR4ls1NrYGyC
         DMlmC+ILLZskrFdkLKrBlyMJtbuarYm15Ly8CRFFTw2Jzak+tiYqv2eKa+VvP/igBY21
         ovUyYWA8d6akAXI4T5Ifw931snbTofmbdOAfFFWRErKtAoQwafJTDO71MecgPiHYtDZh
         p7oNfJ6MY+jsf6Ppket3ptThbiOIpW9PDL/RAISMdNnMyKUKCat5Y6aeJ2HfwJQwQrw1
         8qDYXjDVRJKo6J+SVXVpP3OmTQZPCWpIeY6xizeh4E3UQFtPsz4SsvcFbFR49+DxgYQF
         crRA==
X-Gm-Message-State: APuU4Z/H2Lc8mJKWusLjfpGmJ9AWVZppmU8WXEqUVNRgv+8wFVRCpIEi
	ydpCcRbofHfuU+GEz1IP6qZff8DHfotkmJKy7xFsKRe3H7Bv5iH+uttvas3nkTVDBAOyEa5QGmN
	Y2coU
X-Gm-Gg: AYBFou0UdvHmC5w7ujvGUZMPCP51MpWY46P4KJ+3RtNuYXTQ7y/6At/snrP8QyVQyHn
	LJnNAUcga9ybofgtSAj+/Wl1uBnjZ4Qb9M2wN8xpMIsK9YXN6xUBrfWydSpSTIo1K3VCOWEnavv
	vz2htvG3dMRaOFzuWFDb1zPoUrw4DJVcWHAPcE3mra5vNDFPTNXbWjQRQcpESPaLRNl9sMBiIta
	uWGHH0bpCuXQHoBBXikW8N87ETg8nbo3zTMGBx3ClWMgtOIa9y/wjwUmsRoMGnaN0UwCVTPYIcf
	cVk9/VZFE+uG84TqfFgY9rH2uAbNzQd/214bzog04BOykafLDY7YbQjI6p7FJCKpwSFTyCfbxg4
	Z1IcPU1GBYVarvhWOL4FUOJCyvdsfli3VxfECLeoVhDgghvf/hPnDQ6dUI+xb4uLQp1nlawOEMy
	/UeFdv5KZymAEtS0LD4Kllb/f7ADrx9iI2MymlmYt9/hJ/gv/f/3N64455Ntmk8GFlpwUX21tQ/
	qR3EL5lq4oc0y/nFf8HIr9heNCdX+NZ8kPZDYtlveOWpThXTK4lxc/zuNhadjbb7Wt1PZVYswUQ
	CVcTsEsl9aSK7MogGlaRHv0w+0CyT3jtJt7XNNbfsDaSXlr3+nQ9MqFNtZaeZmSM4yvW0Qxqy55
	lKi8NzEsV0+BY+kr6dS5CG61gwX42dU5Xm9iomwCquuskJKdOmTy7wQ==
X-Received: by 2002:a05:6000:2c05:b0:48c:4f6f:62e3 with SMTP id ffacd0b85a97d-49274bc83a9mr11833070f8f.18.1794070349274;
        Sat, 07 Nov 2026 08:52:29 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4948a99b9b0sm4127090f8f.4.2026.11.07.08.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:52:28 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 06/22] flashrom: Upgrade 1.7.0 -> 1.8.0
Date: Sat,  7 Nov 2026 18:52:05 +0200
Message-ID: <20261107165221.122340-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261107165221.122340-1-leon.anavi@konsulko.com>
References: <20261107165221.122340-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 16:52:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131991
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.8.0:

- Repeated reads

--read-repeated[=<count>] [<file>]: Read the flash chip multiple
times (default: 3, minimum: 3) and use majority voting to detect
unstable connections. Deduplicates read results to minimise memory
usage. If a file is given and a strict majority is found, saves the
majority content to it. Useful for diagnosing flaky SPI wiring or
unreliable programmers.

- Bugs fixed

Internal programmer no longer exits when ECAM is unavailable On
Intel PCH100+ systems the flash enable code opens a second libpci
accessor with PCI_ACCESS_ECAM. Mapping the ECAM region requires
access to a physical range the kernel commonly reserves for a
driver (PNP0C02), which CONFIG_IO_STRICT_DEVMEM denies. libpci
reports this through its error handler, which by contract does not
return and by default terminates the process, so flashrom died
with:

pcilib: Cannot map ecam region: Operation not permitted.  before
probing anything, with no command line option to work around it.
Every kernel built with CONFIG_IO_STRICT_DEVMEM=y was affected,
which is the default in most distributions.

An ECAM initialisation failure is now caught and the 0xcf8/0xcfc
port I/O access is used instead. ECAM is still tried first, so
machines that need it keep using it.

Remove 0003-cli_classic-Initialize-time_start-time_end.patch
because the patch has been merged in the upstream.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-meson-Add-options-pciutils-ftdi-usb.patch | 10 +++---
 ...assic-Initialize-time_start-time_end.patch | 34 -------------------
 .../{flashrom_1.7.0.bb => flashrom_1.8.0.bb}  |  3 +-
 3 files changed, 6 insertions(+), 41 deletions(-)
 delete mode 100644 meta-oe/recipes-bsp/flashrom/flashrom/0003-cli_classic-Initialize-time_start-time_end.patch
 rename meta-oe/recipes-bsp/flashrom/{flashrom_1.7.0.bb => flashrom_1.8.0.bb} (81%)

diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/0002-meson-Add-options-pciutils-ftdi-usb.patch b/meta-oe/recipes-bsp/flashrom/flashrom/0002-meson-Add-options-pciutils-ftdi-usb.patch
index b1dd5d0773..c79384dd5b 100644
--- a/meta-oe/recipes-bsp/flashrom/flashrom/0002-meson-Add-options-pciutils-ftdi-usb.patch
+++ b/meta-oe/recipes-bsp/flashrom/flashrom/0002-meson-Add-options-pciutils-ftdi-usb.patch
@@ -1,4 +1,4 @@
-From 5cf5fc64c6aab35b89b8cf7f69b84b6f5100d7a6 Mon Sep 17 00:00:00 2001
+From 2f57f3797d08b435cac9cda79a7c6b7a978cdb8a Mon Sep 17 00:00:00 2001
 From: Patrick Rudolph <patrick.rudolph@9elements.com>
 Date: Tue, 15 Oct 2024 10:42:05 +0200
 Subject: [PATCH] meson: Add options pciutils, ftdi, usb
@@ -16,10 +16,10 @@ Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
  2 files changed, 6 insertions(+), 3 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 35feb33..b5bb722 100644
+index 876ecd9..5d656c9 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -140,9 +140,9 @@ systems_serial     = [ 'linux', 'openbsd', 'freebsd', 'dragonfly', 'netbsd', 'da
+@@ -134,9 +134,9 @@ systems_serial     = [ 'linux', 'openbsd', 'freebsd', 'dragonfly', 'netbsd', 'da
  
  cpus_port_io = [ 'x86', 'x86_64' ]
  
@@ -33,10 +33,10 @@ index 35feb33..b5bb722 100644
  group_serial = get_option('programmer').contains('group_serial')
  group_jlink  = get_option('programmer').contains('group_jlink')
 diff --git a/meson_options.txt b/meson_options.txt
-index 2829cd1..0e9d769 100644
+index bb09014..7cbf7bc 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
-@@ -26,6 +26,9 @@ option('ni845x_search_path', type : 'string', value : 'C:\Program Files (x86)\Na
+@@ -23,6 +23,9 @@ option('ni845x_search_path', type : 'string', value : 'C:\Program Files (x86)\Na
  option('delay_minimum_sleep_us', type : 'integer', min : 0, value : 100,
         description : 'Minimum time in microseconds to suspend execution for (rather than polling) when a delay is required.'
                     + ' Larger values may perform better on machines with low timer resolution, at the cost of increased power.')
diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/0003-cli_classic-Initialize-time_start-time_end.patch b/meta-oe/recipes-bsp/flashrom/flashrom/0003-cli_classic-Initialize-time_start-time_end.patch
deleted file mode 100644
index 34539ada96..0000000000
--- a/meta-oe/recipes-bsp/flashrom/flashrom/0003-cli_classic-Initialize-time_start-time_end.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 23 Jun 2026 00:00:00 +0000
-Subject: [PATCH] cli_classic: Initialize time_start/time_end
-
-clang's -Wsometimes-uninitialized (promoted to an error via -Werror)
-flags that time_start may be used uninitialized at the function's "out:"
-label. Several early "goto out" paths execute before time(&time_start)
-runs, and the cleanup code calls difftime(time_end, time_start)
-unconditionally. Initialize both time_t variables at declaration so the
-value passed to difftime is always well defined.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- cli_classic.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cli_classic.c b/cli_classic.c
-index 1234567..89abcde 100644
---- a/cli_classic.c
-+++ b/cli_classic.c
-@@ -1055,7 +1055,7 @@ int main(int argc, char *argv[])
- 	int ret = 0;
- 	int all_matched_count = 0;
- 	const char **all_matched_names = NULL;
--	time_t time_start, time_end;
-+	time_t time_start = 0, time_end = 0;
-
- 	struct flashctx *context = NULL; /* holds the active detected chip and other info */
- 	ret = flashrom_create_context(&context);
---
-2.43.0
diff --git a/meta-oe/recipes-bsp/flashrom/flashrom_1.7.0.bb b/meta-oe/recipes-bsp/flashrom/flashrom_1.8.0.bb
similarity index 81%
rename from meta-oe/recipes-bsp/flashrom/flashrom_1.7.0.bb
rename to meta-oe/recipes-bsp/flashrom/flashrom_1.8.0.bb
index bc9645f97a..25e3180ba0 100644
--- a/meta-oe/recipes-bsp/flashrom/flashrom_1.7.0.bb
+++ b/meta-oe/recipes-bsp/flashrom/flashrom_1.8.0.bb
@@ -5,10 +5,9 @@ HOMEPAGE = "http://flashrom.org"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=c0d58714ca15beeaed5b44a38116e133"
 SRC_URI = "https://download.flashrom.org/releases/flashrom-v${PV}.tar.xz \
            file://0002-meson-Add-options-pciutils-ftdi-usb.patch \
-           file://0003-cli_classic-Initialize-time_start-time_end.patch \
            "
 
-SRC_URI[sha256sum] = "4328ace9833f7efe7c334bdd73482cde8286819826cc00149e83fba96bf3ab4f"
+SRC_URI[sha256sum] = "654c9c61745c250cd3b5ccd0e56fc43ee76980f92a5e078420420639d66975a2"
 
 S = "${UNPACKDIR}/flashrom-v${PV}"
 
-- 
2.47.3

