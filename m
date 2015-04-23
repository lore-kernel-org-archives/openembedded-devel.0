Return-Path: <fabio@bertux.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id AA67373D37
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 15:16:05 +0000 (UTC)
Received: by qgdy78 with SMTP id y78so9609718qgd.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 08:16:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=IRdETg9u4+SV7T4uRhY4VW+V1QeozIoYGmrknECYT6M=;
	b=KBQCo9HtIMGo1Kb+1Mba6qCYwXEJX32LcecfEsNdHeAEifXKzWzwhpxiTAMxD5vS69
	RdPfMBTJNDOMSuf7OjKzrKh6sUat+zJlQPd2XAkAlctGBVBRloXuWwKUnP1kTsUQK5Wx
	iwRxNAZaQslxgPskO50ofwmuJTL5zDAi/t9RGHdtoHBg+g0Dqfhl6GhMZ2dJt2dG+E7n
	1YK/I4NgUNRr1rolK0FODPMxJ6OR0n09UKE9q3uZ5Pl4oInfwuA//esuP7JgLX1fCcWb
	US+Tni66mIyucjQMIZfg0KN/A+YO61xYYzpXGmteFSq7Xs5vGZCnmSzhnUpTGfMBZfhI
	oLcg==
X-Gm-Message-State: ALoCoQnB2EwqTtGVhIA3TdIG0rEmUvswoSfk5PEj/gtzqXI5oU1KtgP/zy3fqb6sgoDR3Jz+JWyw
X-Received: by 10.140.25.208 with SMTP id 74mr3642806qgt.104.1429802166202;
	Thu, 23 Apr 2015 08:16:06 -0700 (PDT)
Received: from [192.168.0.103] ([201.22.227.56])
	by mx.google.com with ESMTPSA id 20sm6152325qhf.14.2015.04.23.08.16.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Apr 2015 08:16:05 -0700 (PDT)
Message-ID: <55390CB2.4070603@bertux.com>
Date: Thu, 23 Apr 2015 12:16:02 -0300
From: Fabio Berton <fabio@bertux.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <mailman.3164.1429799845.1448.openembedded-devel@lists.openembedded.org>
In-Reply-To: <mailman.3164.1429799845.1448.openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] dialog-static: blacklist
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Apr 2015 15:16:09 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi!
I fixed this adding the function below on dialog-static recipe, the 
function add --static flag to pkg-config.

do_configure_prepend(){
     sed -i 's,pkg-config,pkg-config --static,g' -i configure
}


On 04/23/2015 11:37 AM, 
openembedded-devel-request@lists.openembedded.org wrote:
> Send Openembedded-devel mailing list submissions to
> 	openembedded-devel@lists.openembedded.org
>
> To subscribe or unsubscribe via the World Wide Web, visit
> 	http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> or, via email, send a message with subject or body 'help' to
> 	openembedded-devel-request@lists.openembedded.org
>
> You can reach the person managing the list at
> 	openembedded-devel-owner@lists.openembedded.org
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of Openembedded-devel digest..."
>
>
> Today's Topics:
>
>     1. Re: [meta-oe][PATCH V5] bluez collection: add (moved from
>        oe-core) (Iorga, Cristian)
>     2. Re: [meta-qt5][PATCH]] qtwebchannel md5 error (Martin Jansa)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Thu, 23 Apr 2015 14:31:59 +0000
> From: "Iorga, Cristian" <cristian.iorga@intel.com>
> To: "openembedded-devel@lists.openembedded.org"
> 	<openembedded-devel@lists.openembedded.org>
> Subject: Re: [oe] [meta-oe][PATCH V5] bluez collection: add (moved
> 	from	oe-core)
> Message-ID:
> 	<969F26A8BAB325438E7EB80D3C3134FB2F4B4E48@irsmsx105.ger.corp.intel.com>
> 	
> Content-Type: text/plain; charset="us-ascii"
>
> In v5:
>
> 1. Updated support for systemd;
> 2. Updated commit message.
>
> Regards,
> Cristian
>
> -----Original Message-----
> From: Iorga, Cristian
> Sent: Thursday, April 23, 2015 5:30 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Iorga, Cristian
> Subject: [meta-oe][PATCH V5] bluez collection: add (moved from oe-core)
>
> BlueZ 4.x Bluetooth stack has been removed from oe-core.
> However, it is still supported, so add it to recipes-connectivity in meta-oe.
>
> In order to use it in oe-core/poky/YP, 'bluez5' backfill distro feature needs to be disabled via:
> DISTRO_FEATURES_BACKFILL_CONSIDERED = "bluez5" .
> 'bluetooth' distro feature needs to be present also.
>
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>   .../obsolete_automake_macros.patch                 |  14 +++
>   .../bluez/bluez-hcidump_2.5.bb                     |  22 +++++
>   .../bluez/bluez4-4.101/bluetooth.conf              |  16 +++
>   .../bluez/bluez4-4.101/fix-udev-paths.patch        |  37 +++++++
>   .../bluez/bluez4-4.101/fix_encrypt_collision.patch | 110 +++++++++++++++++++++
>   .../bluez/bluez4-4.101/install-test-script.patch   |  26 +++++
>   ...ork-fix-network-Connect-method-parameters.patch |  30 ++++++
>   .../bluez4-4.101/obsolete_automake_macros.patch    |  14 +++
>   .../bluez/bluez4-4.101/sbc_mmx.patch               |  24 +++++
>   ...pygobject-instead-ofgobject-introspection.patch |  27 +++++
>   meta-oe/recipes-connectivity/bluez/bluez4.inc      |  48 +++++++++
>   meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb |  47 +++++++++
>   .../bluez/gst-plugin-bluetooth_4.101.bb            |  39 ++++++++
>   13 files changed, 454 insertions(+)
>   create mode 100644 meta-oe/recipes-connectivity/bluez/bluez-hcidump-2.5/obsolete_automake_macros.patch
>   create mode 100644 meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb
>   create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/bluetooth.conf
>   create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/fix-udev-paths.patch
>   create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/fix_encrypt_collision.patch
>   create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/install-test-script.patch
>   create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/network-fix-network-Connect-method-parameters.patch
>   create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/obsolete_automake_macros.patch
>   create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/sbc_mmx.patch
>   create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/use-legacy-pygobject-instead-ofgobject-introspection.patch
>   create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4.inc
>   create mode 100644 meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb
>   create mode 100644 meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb
>
> diff --git a/meta-oe/recipes-connectivity/bluez/bluez-hcidump-2.5/obsolete_automake_macros.patch b/meta-oe/recipes-connectivity/bluez/bluez-hcidump-2.5/obsolete_automake_macros.patch
> new file mode 100644
> index 0000000..0c77f1a
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/bluez/bluez-hcidump-2.5/obsolete_auto
> +++ make_macros.patch
> @@ -0,0 +1,14 @@
> +Upstream-Status: Pending [package obsolete/not maintained by upstream]
> +
> +Signed-off-by: Marko Lindqvist <cazfi74@gmail.com> diff -Nurd
> +bluez-hcidump-2.5/configure.ac bluez-hcidump-2.5/configure.ac
> +--- bluez-hcidump-2.5/configure.ac	2012-11-30 10:29:41.000000000 +0200
> ++++ bluez-hcidump-2.5/configure.ac	2013-01-12 10:02:10.609511463 +0200
> +@@ -2,7 +2,7 @@
> + AC_INIT(bluez-hcidump, 2.5)
> +
> + AM_INIT_AUTOMAKE([foreign subdir-objects])
> +-AM_CONFIG_HEADER(config.h)
> ++AC_CONFIG_HEADERS(config.h)
> +
> + m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
> diff --git a/meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb b/meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb
> new file mode 100644
> index 0000000..3950630
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb
> @@ -0,0 +1,22 @@
> +SUMMARY = "Linux Bluetooth Stack HCI Debugger Tool"
> +DESCRIPTION = "The hcidump tool reads raw HCI data coming from and
> +going to a Bluetooth device \ and displays the commands, events and data in a human-readable form."
> +
> +SECTION = "console"
> +# hcidump was integrated into bluez5
> +DEPENDS = "bluez4"
> +RCONFLICTS_${PN} = "bluez5"
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
> +                    file://src/hcidump.c;beginline=1;endline=23;md5=3bee3a162dff43a5be7470710b99fbcf"
> +PR = "r1"
> +
> +SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/bluez-hcidump-${PV}.tar.gz \
> +           file://obsolete_automake_macros.patch \ "
> +
> +SRC_URI[md5sum] = "2eab54bbd2b59a2ed4274ebb9390cf18"
> +SRC_URI[sha256sum] = "9b7c52b375081883738cf049ecabc103b97d094b19c6544fb241267905d88881"
> +S = "${WORKDIR}/bluez-hcidump-${PV}"
> +
> +inherit autotools
> diff --git a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/bluetooth.conf b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/bluetooth.conf
> new file mode 100644
> index 0000000..ca5e9e4
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/bluetooth.conf
> @@ -0,0 +1,16 @@
> +<!-- This configuration file specifies the required security policies
> +     for Bluetooth core daemon to work. -->
> +
> +<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
> + "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
> +<busconfig>
> +
> +  <!-- ../system.conf have denied everything, so we just punch some
> + holes -->
> +
> +  <policy context="default">
> +    <allow own="org.bluez"/>
> +    <allow send_destination="org.bluez"/>
> +    <allow send_interface="org.bluez.Agent"/>
> +  </policy>
> +
> +</busconfig>
> diff --git a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/fix-udev-paths.patch b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/fix-udev-paths.patch
> new file mode 100644
> index 0000000..8089914
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/fix-udev-paths.pat
> +++ ch
> @@ -0,0 +1,37 @@
> +Add udevdir/udevrulesdir options
> +
> +Upstream-Status: Inappropriate [configuration]
> +Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> +
> +Index: bluez-4.101/Makefile.am
> +===================================================================
> +--- bluez-4.101.orig/Makefile.am
> ++++ bluez-4.101/Makefile.am
> +@@ -395,7 +395,7 @@ EXTRA_DIST += audio/bluetooth.conf  include
> +Makefile.tools
> +
> + if DATAFILES
> +-rulesdir = @UDEV_DIR@/rules.d
> ++rulesdir = @UDEV_RULES_DIR@
> +
> + udev_files =
> +
> +Index: bluez-4.101/configure.ac
> +===================================================================
> +--- bluez-4.101.orig/configure.ac
> ++++ bluez-4.101/configure.ac
> +@@ -61,4 +61,14 @@ if (test -n "${path_systemdunit}"); then  fi
> +AM_CONDITIONAL(SYSTEMD, test -n "${path_systemdunit}")
> +
> ++AC_ARG_WITH([udevdir],
> ++    AS_HELP_STRING([--with-udevdir=DIR], [udev directory]),
> ++    [], [with_udevdir=/lib/udev/])
> ++AC_SUBST([UDEV_DIR], [$with_udevdir])
> ++
> ++AC_ARG_WITH([udevrulesdir],
> ++    AS_HELP_STRING([--with-udevrulesdir=DIR], [udev rules directory]),
> ++    [], [with_udevrulesdir=/lib/udev/rules.d])
> ++AC_SUBST([UDEV_RULES_DIR], [$with_udevrulesdir])
> ++
> + AC_OUTPUT(Makefile doc/version.xml src/bluetoothd.8
> + src/bluetooth.service bluez.pc)
> diff --git a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/fix_encrypt_collision.patch b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/fix_encrypt_collision.patch
> new file mode 100644
> index 0000000..1bc390f
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/fix_encrypt_collis
> +++ ion.patch
> @@ -0,0 +1,110 @@
> +Avoid namepspace collision with encrypt function from libc
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Index: bluez-4.101/test/l2test.c
> +===================================================================
> +--- bluez-4.101.orig/test/l2test.c
> ++++ bluez-4.101/test/l2test.c
> +@@ -107,7 +107,7 @@ static char *filename = NULL;  static int rfcmode =
> +0;  static int master = 0;  static int auth = 0; -static int encrypt =
> +0;
> ++static int encryption_request = 0;
> + static int secure = 0;
> + static int socktype = SOCK_SEQPACKET;
> + static int linger = 0;
> +@@ -340,7 +340,7 @@ static int do_connect(char *svr)
> + 		opt |= L2CAP_LM_MASTER;
> + 	if (auth)
> + 		opt |= L2CAP_LM_AUTH;
> +-	if (encrypt)
> ++	if (encryption_request)
> + 		opt |= L2CAP_LM_ENCRYPT;
> + 	if (secure)
> + 		opt |= L2CAP_LM_SECURE;
> +@@ -475,7 +475,7 @@ static void do_listen(void (*handler)(in
> + 		opt |= L2CAP_LM_MASTER;
> + 	if (auth)
> + 		opt |= L2CAP_LM_AUTH;
> +-	if (encrypt)
> ++	if (encryption_request)
> + 		opt |= L2CAP_LM_ENCRYPT;
> + 	if (secure)
> + 		opt |= L2CAP_LM_SECURE;
> +@@ -1407,7 +1407,7 @@ int main(int argc, char *argv[])
> + 			break;
> +
> + 		case 'E':
> +-			encrypt = 1;
> ++			encryption_request = 1;
> + 			break;
> +
> + 		case 'S':
> +Index: bluez-4.101/test/rctest.c
> +===================================================================
> +--- bluez-4.101.orig/test/rctest.c
> ++++ bluez-4.101/test/rctest.c
> +@@ -79,7 +79,7 @@ static char *filename = NULL;
> +
> + static int master = 0;
> + static int auth = 0;
> +-static int encrypt = 0;
> ++static int encryption_request = 0;
> + static int secure = 0;
> + static int socktype = SOCK_STREAM;
> + static int linger = 0;
> +@@ -200,7 +200,7 @@ static int do_connect(const char *svr)
> + 		opt |= RFCOMM_LM_MASTER;
> + 	if (auth)
> + 		opt |= RFCOMM_LM_AUTH;
> +-	if (encrypt)
> ++	if (encryption_request)
> + 		opt |= RFCOMM_LM_ENCRYPT;
> + 	if (secure)
> + 		opt |= RFCOMM_LM_SECURE;
> +@@ -291,7 +291,7 @@ static void do_listen(void (*handler)(in
> + 		opt |= RFCOMM_LM_MASTER;
> + 	if (auth)
> + 		opt |= RFCOMM_LM_AUTH;
> +-	if (encrypt)
> ++	if (encryption_request)
> + 		opt |= RFCOMM_LM_ENCRYPT;
> + 	if (secure)
> + 		opt |= RFCOMM_LM_SECURE;
> +@@ -701,7 +701,7 @@ int main(int argc, char *argv[])
> + 			break;
> +
> + 		case 'E':
> +-			encrypt = 1;
> ++			encryption_request = 1;
> + 			break;
> +
> + 		case 'S':
> +Index: bluez-4.101/src/textfile.h
> +===================================================================
> +--- bluez-4.101.orig/src/textfile.h
> ++++ bluez-4.101/src/textfile.h
> +@@ -24,6 +24,8 @@
> + #ifndef __TEXTFILE_H
> + #define __TEXTFILE_H
> +
> ++#include <sys/types.h>
> ++
> + int create_dirs(const char *filename, const mode_t mode);  int
> +create_file(const char *filename, const mode_t mode);  int
> +create_name(char *buf, size_t size, const char *path,
> +Index: bluez-4.101/test/attest.c
> +===================================================================
> +--- bluez-4.101.orig/test/attest.c
> ++++ bluez-4.101/test/attest.c
> +@@ -34,6 +34,7 @@
> + #include <termios.h>
> + #include <sys/ioctl.h>
> + #include <sys/socket.h>
> ++#include <sys/select.h>
> +
> + #include <bluetooth/bluetooth.h>
> + #include <bluetooth/rfcomm.h>
> diff --git a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/install-test-script.patch b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/install-test-script.patch
> new file mode 100644
> index 0000000..23f7d99
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/install-test-scrip
> +++ t.patch
> @@ -0,0 +1,26 @@
> +Upstream-Status: Inappropriate
> +
> +Install the bluez's test scripts
> +
> +Signed-off-by: Zhong Hongbo <hongbo.zhong@windriver.com> diff -Nurd
> +bluez-4.101.orig/Makefile.tools bluez-4.101/Makefile.tools
> +--- bluez-4.101.orig/Makefile.tools	2013-11-19 15:49:07.688838000 +0800
> ++++ bluez-4.101/Makefile.tools	2013-11-19 15:50:09.256837848 +0800
> +@@ -227,6 +227,17 @@
> + 		test/service-spp.xml test/service-opp.xml test/service-ftp.xml \
> + 		test/simple-player test/test-nap
> +
> ++bluez4_testdir = $(libdir)/bluez4/test/ dist_bluez4_test_SCRIPTS =
> ++test/sap-client test/hsplay test/hsmicro \
> ++		test/monitor-bluetooth test/list-devices \
> ++		test/test-discovery test/test-manager test/test-adapter \
> ++		test/test-device test/test-service test/test-serial \
> ++		test/test-telephony test/test-network test/simple-agent \
> ++		test/simple-service test/simple-endpoint test/test-audio \
> ++		test/test-input test/test-sap-server test/test-oob \
> ++		test/test-attrib test/test-proximity test/test-thermometer \
> ++		test/test-serial-proxy test/test-health test/test-health-sink \
> ++		test/simple-player test/test-nap
> + if HIDD
> + bin_PROGRAMS += compat/hidd
> +
> diff --git a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/network-fix-network-Connect-method-parameters.patch b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/network-fix-network-Connect-method-parameters.patch
> new file mode 100644
> index 0000000..37f9199
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/network-fix-networ
> +++ k-Connect-method-parameters.patch
> @@ -0,0 +1,30 @@
> +Upstream-Status: Backport
> +Signed-off-by: Peter A. Bigot <pab@pabigot.com>
> +
> +From 57170b311f1468330f4a9961dc0b3ac45f97bc13 Mon Sep 17 00:00:00 2001
> +From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> +Date: Sat, 30 Jun 2012 00:39:05 -0300
> +Subject: [PATCH] network: fix network Connect() method parameters
> +
> +---
> + network/connection.c |    4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/network/connection.c b/network/connection.c index
> +544ec3a..59423a9 100644
> +--- a/network/connection.c
> ++++ b/network/connection.c
> +@@ -554,7 +554,9 @@ static void path_unregister(void *data)
> +
> + static const GDBusMethodTable connection_methods[] = {
> + 	{ GDBUS_ASYNC_METHOD("Connect",
> +-			NULL, NULL, connection_connect) },
> ++				GDBUS_ARGS({"uuid", "s"}),
> ++				GDBUS_ARGS({"interface", "s"}),
> ++				connection_connect) },
> + 	{ GDBUS_METHOD("Disconnect",
> + 			NULL, NULL, connection_disconnect) },
> + 	{ GDBUS_METHOD("GetProperties",
> +--
> +1.7.9.5
> +
> diff --git a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/obsolete_automake_macros.patch b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/obsolete_automake_macros.patch
> new file mode 100644
> index 0000000..1068f24
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/obsolete_automake_
> +++ macros.patch
> @@ -0,0 +1,14 @@
> +Upstream-Status: Backport
> +
> +Signed-off-by: Marko Lindqvist <cazfi74@gmail.com> diff -Nurd
> +bluez-4.101/configure.ac bluez-4.101/configure.ac
> +--- bluez-4.101/configure.ac	2012-06-22 19:36:49.000000000 +0300
> ++++ bluez-4.101/configure.ac	2013-01-07 06:13:18.385888966 +0200
> +@@ -2,7 +2,7 @@
> + AC_INIT(bluez, 4.101)
> +
> + AM_INIT_AUTOMAKE([foreign subdir-objects color-tests])
> +-AM_CONFIG_HEADER(config.h)
> ++AC_CONFIG_HEADERS(config.h)
> +
> + m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
> diff --git a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/sbc_mmx.patch b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/sbc_mmx.patch
> new file mode 100644
> index 0000000..98fab45
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/sbc_mmx.patch
> @@ -0,0 +1,24 @@
> +on x86 and x86_64 gcc 4.7 complains
> +
> +sbc/sbc_primitives_mmx.c: In function 'sbc_calc_scalefactors_mmx':
> +sbc/sbc_primitives_mmx.c:294:4: warning: asm operand 2 probably doesn't
> +match constraints [enabled by default]
> +sbc/sbc_primitives_mmx.c:294:4: error: impossible constraint in 'asm'
> +
> +This patch is taken from
> +https://bugs.launchpad.net/ubuntu/+source/bluez/+bug/911871
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Pending
> +Index: bluez-4.98/sbc/sbc_primitives_mmx.c
> +===================================================================
> +--- bluez-4.98.orig/sbc/sbc_primitives_mmx.c	2011-12-21 14:53:54.000000000 -0800
> ++++ bluez-4.98/sbc/sbc_primitives_mmx.c	2012-02-24 10:07:03.422073800 -0800
> +@@ -318,7 +318,7 @@
> + 				"movl          %k0, 4(%3)\n"
> + 			: "+r" (blk)
> + 			: "r" (&sb_sample_f[0][ch][sb]),
> +-				"i" ((char *) &sb_sample_f[1][0][0] -
> ++				"r" ((char *) &sb_sample_f[1][0][0] -
> + 					(char *) &sb_sample_f[0][0][0]),
> + 				"r" (&scale_factor[ch][sb]),
> + 				"r" (&consts),
> diff --git a/meta-oe/recipes-connectivity/bluez/bluez4-4.101/use-legacy-pygobject-instead-ofgobject-introspection.patch b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/use-legacy-pygobject-instead-ofgobject-introspection.patch
> new file mode 100644
> index 0000000..37037f5
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/bluez/bluez4-4.101/use-legacy-pygobje
> +++ ct-instead-ofgobject-introspection.patch
> @@ -0,0 +1,27 @@
> +Upstream-Status: Inappropriate
> +
> +use legacy pygobject instead of gobject-introspection
> +
> +Signed-off-by: Zhong Hongbo <hongbo.zhong@windriver.com>
> +---
> +diff -Nurd bluez-4.101.orig/test/simple-agent bluez-4.101/test/simple-agent
> +--- bluez-4.101.orig/test/simple-agent	2013-11-13 17:14:08.138118159 +0800
> ++++ bluez-4.101/test/simple-agent	2013-11-13 17:14:29.034118107 +0800
> +@@ -2,7 +2,7 @@
> +
> + from __future__ import absolute_import, print_function,
> + unicode_literals
> +
> +-from gi.repository import GObject
> ++import gobject
> +
> + import sys
> + import dbus
> +@@ -122,7 +122,7 @@
> + 	path = "/test/agent"
> + 	agent = Agent(bus, path)
> +
> +-	mainloop = GObject.MainLoop()
> ++	mainloop = gobject.MainLoop()
> +
> + 	if len(args) > 1:
> + 		if len(args) > 2:
> diff --git a/meta-oe/recipes-connectivity/bluez/bluez4.inc b/meta-oe/recipes-connectivity/bluez/bluez4.inc
> new file mode 100644
> index 0000000..80886c2
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/bluez/bluez4.inc
> @@ -0,0 +1,48 @@
> +SUMMARY = "Linux Bluetooth Stack Userland V4"
> +DESCRIPTION = "Linux Bluetooth stack V4 userland components.  These include a system configurations, daemons, tools and system libraries."
> +HOMEPAGE = "http://www.bluez.org"
> +SECTION = "libs"
> +LICENSE = "GPLv2+ & LGPLv2.1+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
> +                    file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
> +                    file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e \
> +                    file://sbc/sbc.c;beginline=1;endline=25;md5=1a40781ed30d50d8639323a184aeb191"
> +DEPENDS = "udev libusb dbus-glib glib-2.0 libcheck readline libsndfile1"
> +RDEPENDS_${PN}-dev = "bluez-hcidump"
> +
> +PACKAGECONFIG ??= "\
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}\
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'pie', 'pie', '', d)}\
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd','systemd', '',
> +d)} \ "
> +PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
> +PACKAGECONFIG[pie] = "--enable-pie,--disable-pie,"
> +PACKAGECONFIG[systemd] = "--with-systemdunitdir=${systemd_unitdir}/system/,--with-systemdunitdir="
> +
> +ASNEEDED = ""
> +
> +SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.gz"
> +S = "${WORKDIR}/bluez-${PV}"
> +
> +inherit autotools-brokensep pkgconfig systemd
> +
> +EXTRA_OECONF = "\
> +    --disable-gstreamer \
> +    --enable-usb \
> +    --enable-tools \
> +    --enable-bccmd \
> +    --enable-hid2hci \
> +    --enable-dfutool \
> +    --disable-hidd \
> +    --disable-pand \
> +    --disable-dund \
> +    --disable-cups \
> +    --enable-test \
> +    --enable-datafiles \
> +    --with-udevdir=`pkg-config --variable=udevdir udev` \
> +    --with-udevrulesdir=`pkg-config --variable=udevdir udev`/rules.d \
> +"
> +
> +SYSTEMD_SERVICE_${PN} = "bluetooth.service"
> +
> +EXCLUDE_FROM_WORLD = "1"
> diff --git a/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb b/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb
> new file mode 100644
> index 0000000..07740e1
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb
> @@ -0,0 +1,47 @@
> +require bluez4.inc
> +
> +PR = "r11"
> +
> +SRC_URI += "file://bluetooth.conf \
> +            file://sbc_mmx.patch \
> +            file://fix-udev-paths.patch \
> +            file://obsolete_automake_macros.patch \
> +            file://network-fix-network-Connect-method-parameters.patch \
> +            file://install-test-script.patch \
> +            file://use-legacy-pygobject-instead-ofgobject-introspection.patch \
> +            file://fix_encrypt_collision.patch \ "
> +
> +SRC_URI[md5sum] = "fb42cb7038c380eb0e2fa208987c96ad"
> +SRC_URI[sha256sum] = "59738410ade9f0e61a13c0f77d9aaffaafe49ba9418107e4ad75fe52846f7487"
> +
> +RCONFLICTS_${PN} = "bluez5"
> +
> +do_install_append() {
> +    install -m 0644 ${S}/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
> +    install -m 0644 ${S}/network/network.conf ${D}/${sysconfdir}/bluetooth/
> +    install -m 0644 ${S}/input/input.conf ${D}/${sysconfdir}/bluetooth/
> +    # at_console doesn't really work with the current state of OE, so punch some more holes so people can actually use BT
> +    install -m 0644 ${WORKDIR}/bluetooth.conf
> +${D}/${sysconfdir}/dbus-1/system.d/
> +}
> +
> +RDEPENDS_${PN}-dev = "bluez-hcidump"
> +RDEPENDS_${PN}-testtools += "python python-dbus python-pygobject"
> +
> +ALLOW_EMPTY_libasound-module-bluez = "1"
> +PACKAGES =+ "libasound-module-bluez ${PN}-testtools"
> +
> +FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so ${datadir}/alsa"
> +FILES_${PN} += "${libdir}/bluetooth/plugins ${libdir}/bluetooth/plugins/*.so ${base_libdir}/udev/ ${nonarch_base_libdir}/udev/ ${systemd_unitdir}/ ${datadir}/dbus-1"
> +FILES_${PN}-dev += "\
> +    ${libdir}/bluetooth/plugins/*.la \
> +    ${libdir}/alsa-lib/*.la \
> +"
> +
> +FILES_${PN}-testtools = "${libdir}/bluez4/test/*"
> +
> +FILES_${PN}-dbg += "\
> +    ${libdir}/bluetooth/plugins/.debug \
> +    ${libdir}/*/.debug \
> +    */udev/.debug \
> +"
> diff --git a/meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb b/meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb
> new file mode 100644
> index 0000000..6a16520
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb
> @@ -0,0 +1,39 @@
> +require bluez4.inc
> +require recipes-multimedia/gstreamer/gst-plugins-package.inc
> +
> +PR = "r1"
> +
> +SRC_URI[md5sum] = "fb42cb7038c380eb0e2fa208987c96ad"
> +SRC_URI[sha256sum] = "59738410ade9f0e61a13c0f77d9aaffaafe49ba9418107e4ad75fe52846f7487"
> +
> +DEPENDS = "bluez4 gst-plugins-base"
> +
> +EXTRA_OECONF = "\
> +    --enable-gstreamer \
> +"
> +
> +# clean unwanted files
> +do_install_append() {
> +    rm -rf ${D}${bindir}
> +    rm -rf ${D}${sbindir}
> +    rm -f  ${D}${libdir}/lib*
> +    rm -rf ${D}${libdir}/pkgconfig
> +    rm -rf ${D}${sysconfdir}
> +    rm -rf ${D}${base_libdir}
> +    rm -rf ${D}${libdir}/bluetooth
> +    rm -rf ${D}${localstatedir}
> +    rm -rf ${D}${libdir}/alsa-lib
> +    rm -rf ${D}${datadir}
> +    rm -rf ${D}${includedir}
> +    rm -rf ${D}${nonarch_base_libdir}
> +}
> +
> +FILES_${PN} = "${libdir}/gstreamer-0.10/lib*.so"
> +FILES_${PN}-dev += "\
> +    ${libdir}/gstreamer-0.10/*.la \
> +"
> +
> +FILES_${PN}-dbg += "\
> +    ${libdir}/*/.debug \
> +"
> +
> --
> 2.1.0
>
>
>
> ------------------------------
>
> Message: 2
> Date: Thu, 23 Apr 2015 16:37:37 +0200
> From: Martin Jansa <martin.jansa@gmail.com>
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-qt5][PATCH]] qtwebchannel md5 error
> Message-ID: <20150423143737.GA2336@jama>
> Content-Type: text/plain; charset=iso-8859-1
>
> On Thu, Apr 23, 2015 at 04:03:49PM +0200, Andreas M?ller wrote:
>> On Thu, Apr 23, 2015 at 2:24 PM, Rui Sebastiao <ruisebastiao@gmail.com> wrote:
>>> ---
>>>   recipes-qt/qt5/qtwebchannel.inc | 5 ++++-
>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/recipes-qt/qt5/qtwebchannel.inc b/recipes-qt/qt5/qtwebchannel.inc
>>> index 3cd22cf..3ed5808 100644
>>> --- a/recipes-qt/qt5/qtwebchannel.inc
>>> +++ b/recipes-qt/qt5/qtwebchannel.inc
>>> @@ -4,4 +4,7 @@ DEPENDS += "qtdeclarative qtwebsockets"
>>>
>>>   # There are no LGPLv3-only licensed files in this component.
>>>   # There are no GPLv2 licensed files in this component.
>>> -LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
>>> +LIC_FILES_CHKSUM = "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
>>> +                    file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
>>> +                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
>>> +                   "
>>> --
>>> 1.9.1
>>>
>>> --
>> * Missing signed off
>> * subject contains ']]'
> Did you test this with 5.4.1 as well as git recipe? I wonder if it
> should be only in 5.4.1.bb.
>
> Right now I'm testing it with newer git revision (for 5.4.2) and I'm
> sorry for introducing this issue last week, thanks for the patch.
>
>> Andreas
>> -- 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


