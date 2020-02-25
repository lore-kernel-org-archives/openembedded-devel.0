Return-Path: <jonathan.richardson@broadcom.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 7D18361541
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 22:19:15 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id t14so397302plr.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 14:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=dxyIciFWIyo16AukeudikBajpwycWnj4zpNt96u2GkA=;
	b=XdVLcXtNfRIyEvym4QFCdPco8bJkGQzlitHR6vvGsuKwbsCBm4i9RAP7XA5ft4ydVb
	l/d/OIkEwvht4ri2sFUS8v1EAuS0JIYYs6AOEoSROumkkSB9s1BLSPO6gKsA4qC/8SJ/
	vQdMXLGIuAl41tA8H6RtxSZaLFQNgJYAkw6zE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dxyIciFWIyo16AukeudikBajpwycWnj4zpNt96u2GkA=;
	b=R3/G40Wlb5oENgPLNimJExIbQb5kWTEBi8L2RHZUuCn+nd8/6ZkDw3nbY/JkOaTUfS
	wyxql5AoMtISaTHztwClaKmOxYm1U72ztLgxu5s31VdxbITgBLt/F6C3ZAQyyQo/jbgX
	fLY9hMMjVblmWBCzx6IDegqPNlqrUH0Ld++eG+F+ydcWF+PkLoiGUNDsnndto8PxQF1W
	ZRQQE4EXtUYmfVSC2cK7qWmLRhYCfyv97VMYY+nEaUhnZoj1vCqbds64WfZnGtgrkqDi
	NmDvEV2LtnmZzwRlNRaZT1v2hJJ6eAeBt4iuSb45Kfbq7yXQIKeOv4NfKlnFsiMLqPWY
	Uijg==
X-Gm-Message-State: APjAAAU4EK+HK7UbplVtmkdZTHg/K0iFHVCja/MDHmj/lueU0Edo0Xxm
	7bVwFHGczNBhghSK4UDYTs3rthKzXF8pQBjvv3W5MQDOcdqpKtSMMVJZb2dXY6SXR9hIYJB/IsE
	v+ZOu711139F3z3M+4ITWbAFzgfAzsdi6eGsUOFzApoCZnvDQIRKv/g+gMRqvtWF+wqNEUjsgyT
	JK5OpB+i3R0DGDhFiSf6Ry3tTH2TEBk7A=
X-Google-Smtp-Source: APXvYqyGyExPbyaLNcZIc3OHeMIVW4ffnCwQMJwXGLVgqhf7AH80XD//aeimQOwhsS9jgqEWYW0onw==
X-Received: by 2002:a17:902:b40d:: with SMTP id
	x13mr744819plr.122.1582669155911; 
	Tue, 25 Feb 2020 14:19:15 -0800 (PST)
Received: from lbrmn-lnxub108.ric.broadcom.com ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id a19sm115486pju.11.2020.02.25.14.19.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 14:19:15 -0800 (PST)
From: Jonathan Richardson <jonathan.richardson@broadcom.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Feb 2020 14:19:04 -0800
Message-Id: <20200225221904.97152-1-jonathan.richardson@broadcom.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH 1/1] open-lldp: Add initial version 1.0.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Feb 2020 22:19:15 -0000

Open-LLDP provides a Link Layer Discovery Protocol agent that supports
DCB (Data Center Bridging). The tc utility from iproute is needed to
manipulate  traffic control settings in the kernel.

Signed-off-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
---
 ...tion-to-disable-installation-of-syst.patch | 57 +++++++++++++++++++
 .../openlldp/openlldp_1.0.1.bb                | 37 ++++++++++++
 2 files changed, 94 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/openlldp/files/0001-autotools-Add-option-to-disable-installation-of-syst.patch
 create mode 100644 meta-networking/recipes-protocols/openlldp/openlldp_1.0.1.bb

diff --git a/meta-networking/recipes-protocols/openlldp/files/0001-autotools-Add-option-to-disable-installation-of-syst.patch b/meta-networking/recipes-protocols/openlldp/files/0001-autotools-Add-option-to-disable-installation-of-syst.patch
new file mode 100644
index 000000000..86c9f4463
--- /dev/null
+++ b/meta-networking/recipes-protocols/openlldp/files/0001-autotools-Add-option-to-disable-installation-of-syst.patch
@@ -0,0 +1,57 @@
+From 1c1e01b2414ca5b3cf5a21b6e6389f9ca82fd7e9 Mon Sep 17 00:00:00 2001
+From: Jonathan Richardson <jonathan.richardson@broadcom.com>
+Date: Fri, 6 Apr 2018 10:49:04 -0700
+Subject: [PATCH 1/1] autotools: Add option to disable installation of systemd
+ conf files
+
+Add option to configure.ac to enable or disable install of systemd conf
+files. If --with-systemdsystemunitdir is passed to configure then the
+files will be installed to the provided directory. If the option isn't
+provided then the value is determined from the systemd pkgconfig file,
+if found in PKG_CONFIG_PATH.
+
+This change is required because Makefile.am always installed the files
+to a hard coded path that couldn't be changed.
+---
+ Makefile.am  | 3 ++-
+ configure.ac | 9 +++++++++
+ 2 files changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 551d4c7..5491c61 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -133,8 +133,9 @@ install-data-hook:	installdirs-local
+ pkgconfigdir = ${libdir}/pkgconfig
+ pkgconfig_DATA = lldpad.pc liblldp_clif.pc
+ 
+-systemdsystemunitdir = $(prefix)/lib/systemd/system
++if HAVE_SYSTEMD
+ dist_systemdsystemunit_DATA = lldpad.service lldpad.socket
++endif
+ 
+ bashcompletiondir = $(sysconfdir)/bash_completion.d
+ dist_bashcompletion_DATA = contrib/bash_completion/lldpad contrib/bash_completion/lldptool
+diff --git a/configure.ac b/configure.ac
+index 0667446..f75f433 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -95,6 +95,15 @@ AC_TYPE_UINT16_T
+ AC_TYPE_UINT32_T
+ AC_TYPE_UINT8_T
+ 
++# Support for systemd unit files.
++AC_ARG_WITH([systemdsystemunitdir],
++        AS_HELP_STRING([--with-systemdsystemunitdir=DIR], [Directory for systemd service files]),
++        [], [with_systemdsystemunitdir=$($PKG_CONFIG --variable=systemdsystemunitdir systemd)])
++if test "x$with_systemdsystemunitdir" != xno; then
++        AC_SUBST([systemdsystemunitdir], [$with_systemdsystemunitdir])
++fi
++AM_CONDITIONAL(HAVE_SYSTEMD, [test -n "$with_systemdsystemunitdir" -a "x$with_systemdsystemunitdir" != xno ])
++
+ AC_CONFIG_FILES([Makefile include/version.h lldpad.spec lldpad.pc liblldp_clif.pc])
+ AC_CONFIG_MACRO_DIR([m4])
+ AC_OUTPUT
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-protocols/openlldp/openlldp_1.0.1.bb b/meta-networking/recipes-protocols/openlldp/openlldp_1.0.1.bb
new file mode 100644
index 000000000..7fa3429cc
--- /dev/null
+++ b/meta-networking/recipes-protocols/openlldp/openlldp_1.0.1.bb
@@ -0,0 +1,37 @@
+SUMMARY = "Open-LLDP"
+DESCRIPTION = "Link Layer Discovery Protocol for Linux that includes support for DCBX"
+HOMEPAGE = "http://open-lldp.org/start"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8c2bc283e65df398ced5f5b747e78162"
+
+S = "${WORKDIR}/git"
+
+inherit pkgconfig autotools
+inherit ${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager', 'systemd', 'systemd', '', d)}
+
+DEPENDS = "libnl libconfig readline"
+
+SRCREV = "36d729de7ce5b56cf061d94d610cf0510154820c"
+SRC_URI = "git://github.com/intel/openlldp.git;protocol=https;branch=master"
+SRC_URI += "file://0001-autotools-Add-option-to-disable-installation-of-syst.patch"
+
+# Even though .ac allows disabling -Werror, Makefile.am adds it to AM_CFLAGS
+# causing it to always be enabled. There are warnings so disable it.
+TARGET_CFLAGS += "-Wno-error"
+
+# configure.ac generates version.h from include/version.h.in but autotools puts
+# build artefacts in $B, not $S and the header can't be found. To avoid
+# inheriting autotools-brokensep and messing up the source dir just tell Makefile
+# where it is.
+TARGET_CFLAGS += "-I ${B}/include"
+
+# Enable install of systemd conf files.
+EXTRA_OECONF += "${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager', 'systemd', '--with-systemdsystemunitdir=${systemd_system_unitdir}', '', d)}"
+
+SYSTEMD_SERVICE_${PN} = "lldpad.service lldpad.socket"
+
+# To enable service at boot set to enable in local.conf.
+SYSTEMD_AUTO_ENABLE ?= "disable"
+
+RRECOMMENDS_${PN} = "iproute2-tc"
-- 
2.17.1


