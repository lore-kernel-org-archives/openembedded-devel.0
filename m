Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37947.1795594113436080505
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=eGdAPFLN;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-380c28f9e35so6624022eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594113; x=1796198913; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qkPHvrZSgUjk8wLb5CmXI2RtYCBgCCGl+cseb6WUpi8=;
        b=eGdAPFLNjjesL/M7jkYFFvqS3N/Jou4/wCH8n9zIhEQ8GO7EOWpg1eyUG/Yf3mOcHW
         wXze7f0gPCl46WzjZAUILL/7QGi9uD0hfsvbNV30thyTIzIvUuWVC1SAqCUfDMnwbmOM
         9PaVgLDILWmVrr5RdZaO/ap+BbLRnWlIJd5ZwpJi1ftKZ5GTtaN06wTCrvMj10ZBTg4z
         SutMgBwa7oxZp6fxUMAFd7PlmMNFlJZbo6y+GjzjxxFwGNCAmQzig4hCFRS5E/TPFnAt
         jR0EMvpYHkV27Q5ivZyer1K2UtUZb0E8aGpGFJoQIJibdbWUlI8p4zQrUrFHEJzWe2eg
         01Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594113; x=1796198913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qkPHvrZSgUjk8wLb5CmXI2RtYCBgCCGl+cseb6WUpi8=;
        b=fiXpyxCGjC8MYUM9i4gSsjKuAPp9WISYMYfFKWAK3lAs4qrFfq+AtgudYyQmUhT6k4
         EVbq2QpwzEtR2gWJ+UQzUiame+ThnWo84+PVxK0CDOrWqSKSobRetFpgI0TwSmIGfSvx
         Vm0GyybW5rqJp+hG7dvFs1fFAIH1efga+Dc/gZ8SQXOicldtl4e3Nc/rxdDBxXoLs2wl
         5LR+qP0XrDvsvnKDZ8gQNPT+89/6P7zyMkQWVjHQ+3CDHEidB4cLAkAV98MB9ne/MDu4
         sPEfzG26/0RXERrAgBasMxAZMZQKpGDV+sFxrvx4Zd7+SBlxClZIT0u9I/Bw1/QHeFnq
         7N8Q==
X-Gm-Message-State: APuU4Z+hEoibfiZp8QklbJE2JjoWDaIqqDNXv6W7sTj8S3XpS4Zxp4kV
	r7ORrmquxqjfCi53HxzC3rXta0UKCTlNYdmD5FzZdUUf1wg9y5ZWkc05Dp7bJ9K4
X-Gm-Gg: AZFdTZfD6zi54lcRGR/7KN2pK23C5HQelGaTYZ9Z4a1ONV20bObRp/AXee/BkdCcUE4
	oOt7RczTw3sjCZdp227lPdwK3R1Xw7sw12nSJ4UY2lY5y/YgGBdT1yJ9w/HkTzSgkFlGvaKCSTE
	JboBu4aFsTBWhU/YRF8Q6aJssAkfpeXPpZa9+wQMwfajlBu9WX/iRYkZ8iuCEtX3rdIBRMUrzLf
	Ovqa6NmLk+YPJUsTPEQZMpJDUS9SDz4jxZylFySpzo/K3w0fgzYRKBz4XxVxbCXIvjSkWI9SIu6
	7WRzBX3tdv+oCQrS3PgDCsBpuskY/PgdngR6hMJQroThFQxbfYLSWvzmpYZaNj8YivpNyNlQ9if
	O0DgfQQmrzGCJ2P7pILwDIrRBM4R8UYI+DoRxUIWs3W0Ez4Od5oHaQN34E+fOGZt5m6I7DxYU0y
	L2SiN8J/v/PJOeCLe5zRjFA3ch8wZO4QeVPLMIfvbX1kM0AKdm/7ET/vCL2hS09l0eqOVrWJzac
	WPjDvygd11E7wfGi64Iv1jBbC7RHQAwwYtNsw3mIj+LHdHgRxR2NAcxg7miQcTao+UjQPXelbbk
	pVLQrajqMGJOXzDDkI6hMaA1/KdCo6heZApGMrCHPIw4yUdad89ld2saK+3784AgerddlK22ayn
	nUsvAa5gEkxY3FnKD8MI6m/rrGzhcQZq8y+QHdeOjQfrQG6pjLeFWzhtSeLxt5TU9R3vrWmjOud
	JVFXFYQRHjrFCBRAovHTjJ/ss2KKLdNrdTJFg8y0Gzan5Je8qntdiSpkepMaJtZpnMqCRlv1dkV
	PATa7Hq1e4KTKGkCzpiq7MYHQnllOQqnDuCuwE7P/kDnvn3PfVn+5w2J5jrgk5OXxvqFGGLq5JT
	peg9
X-Received: by 2002:a05:693c:88d5:10b0:386:9e9c:867 with SMTP id 5a478bee46e88-3869e9c2df2mr12809710eec.10.1795594112484;
        Wed, 25 Nov 2026 00:08:32 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 40/55] rasdaemon: upgrade 0.8.5 -> 1.0.0
Date: Wed, 25 Nov 2026 00:06:56 -0800
Message-ID: <20261125080732.2419614-46-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133043
Content-Type: text/plain; charset="utf-8"

Upstream changes (ChangeLog):
- The build system moved from autotools to Meson, with automatic
  dependency and architecture detection.
- New modular database layer with SQLite, MySQL/MariaDB and
  PostgreSQL backends.
- ras-mc-ctl was rewritten from Perl to Python 3 (SQLAlchemy based),
  with new database query, DIMM status, label and memory-layout
  commands.
- More CXL, ARM and non-standard CPER decoders, memory-sparing events,
  PCIe eDPC support and BMC SEL reporting.
- Self-registering modules and event consumers, plus many resource
  cleanup and error-handling fixes.

Switch the recipe to meson and map the PACKAGECONFIG options to meson
features, adding the new ones (cxl, erst, memory-failure, pcie-edpc,
mysql, postgresql, more ns-decoders, ...). The defaults stay the same.
Use -Denable-arch=auto so only the target architecture's events are
built; upstream defaults to all. The non-standard option is gone, it is
now implied by the ns-decode options.

rasdaemon still uses argp, which musl lacks, and meson does not look
it up, so keep argp-standalone and -largp for musl.
ras-mc-ctl needs python3 and python3-sqlalchemy instead of perl and the
DBI modules. Upstream now installs rasdaemon.service (and
ras-mc-ctl.service), so drop the local copy.

Since perl is no longer needed and python3-sqlalchemy comes from
meta-python, move the recipe from dynamic-layers/perl-layer to
dynamic-layers/meta-python, and move its packagegroup-meta-oe entry
along with it. Nothing else lived in the perl-layer dynamic layer
bbappend, so remove that file. Add an upstream version check.

Add UPSTREAM_CHECK_GITTAGREGEX matching release tags only, skipping
the v0.9.9x pre-releases.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../packagegroup-meta-oe.bbappend             |  1 +
 .../recipes-support/rasdaemon/files/init      |  0
 .../rasdaemon/rasdaemon_1.0.0.bb              | 65 +++++++++++++++++++
 .../packagegroup-meta-oe.bbappend             |  1 -
 .../rasdaemon/files/rasdaemon.service         | 12 ----
 .../rasdaemon/rasdaemon_0.8.5.bb              | 50 --------------
 6 files changed, 66 insertions(+), 63 deletions(-)
 rename meta-oe/dynamic-layers/{perl-layer => meta-python}/recipes-support/rasdaemon/files/init (100%)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-support/rasdaemon/rasdaemon_1.0.0.bb
 delete mode 100644 meta-oe/dynamic-layers/perl-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
 delete mode 100644 meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/rasdaemon.service
 delete mode 100644 meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.5.bb

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend b/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
index 7fff849ecd..807117334f 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
+++ b/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
@@ -12,6 +12,7 @@ RDEPENDS:packagegroup-meta-oe-extended += "\
 "
 RDEPENDS:packagegroup-meta-oe-support += "\
     nvmetcli \
+    rasdaemon \
     smem \
 "
 RDEPENDS:packagegroup-meta-oe-extended:remove:libc-musl = "lcdproc"
diff --git a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/init b/meta-oe/dynamic-layers/meta-python/recipes-support/rasdaemon/files/init
similarity index 100%
rename from meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/init
rename to meta-oe/dynamic-layers/meta-python/recipes-support/rasdaemon/files/init
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-support/rasdaemon/rasdaemon_1.0.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-support/rasdaemon/rasdaemon_1.0.0.bb
new file mode 100644
index 0000000000..86eced84a1
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-support/rasdaemon/rasdaemon_1.0.0.bb
@@ -0,0 +1,65 @@
+DESCRIPTION = "Tools to provide a way to get Platform Reliability, Availability and Serviceability (RAS) reports made via the Kernel tracing events"
+HOMEPAGE = "https://github.com/mchehab/rasdaemon"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d3070efe0afa3dc41608bd82c00bb0dc"
+
+SRC_URI = "git://github.com/mchehab/rasdaemon.git;branch=master;protocol=https;tag=v${PV} \
+           file://init"
+
+SRCREV = "83379997794e3ed6f613b91b188c754bc642de5d"
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+\.\d+\.[0-8]?\d)$"
+
+DEPENDS = "libtraceevent"
+DEPENDS:append:libc-musl = " argp-standalone"
+LDFLAGS:append:libc-musl = " -largp"
+RDEPENDS:${PN} = "python3-core python3-crypt python3-datetime python3-io python3-json \
+	python3-logging python3-netclient python3-sqlalchemy"
+
+inherit meson pkgconfig update-rc.d systemd
+
+EXTRA_OEMESON = "-Denable-arch=auto"
+
+PACKAGECONFIG ??= "sqlite3 mce aer extlog devlink diskerror"
+PACKAGECONFIG[sqlite3] = "-Dsqlite3=enabled,-Dsqlite3=disabled,sqlite3,python3-sqlite3"
+PACKAGECONFIG[mysql] = "-Dmysql=enabled,-Dmysql=disabled,mariadb"
+PACKAGECONFIG[postgresql] = "-Dpostgresql=enabled,-Dpostgresql=disabled,postgresql"
+PACKAGECONFIG[mce] = "-Dmce=enabled,-Dmce=disabled"
+PACKAGECONFIG[erst] = "-Derst=enabled,-Derst=disabled"
+PACKAGECONFIG[aer] = "-Daer=enabled,-Daer=disabled,pciutils"
+PACKAGECONFIG[pcie-edpc] = "-Dpcie-edpc=enabled,-Dpcie-edpc=disabled,pciutils"
+PACKAGECONFIG[extlog] = "-Dextlog=enabled,-Dextlog=disabled"
+PACKAGECONFIG[devlink] = "-Ddevlink=enabled,-Ddevlink=disabled"
+PACKAGECONFIG[diskerror] = "-Ddiskerror=enabled,-Ddiskerror=disabled"
+PACKAGECONFIG[cxl] = "-Dcxl=enabled,-Dcxl=disabled"
+PACKAGECONFIG[memory-failure] = "-Dmemory-failure=enabled,-Dmemory-failure=disabled"
+PACKAGECONFIG[memory-ce-pfa] = "-Dmemory-ce-pfa=enabled,-Dmemory-ce-pfa=disabled"
+PACKAGECONFIG[memory-row-ce-pfa] = "-Dmemory-row-ce-pfa=enabled,-Dmemory-row-ce-pfa=disabled"
+PACKAGECONFIG[cpu-fault-isolation] = "-Dcpu-fault-isolation=enabled,-Dcpu-fault-isolation=disabled"
+PACKAGECONFIG[signal] = "-Dsignal=enabled,-Dsignal=disabled"
+PACKAGECONFIG[abrt-report] = "-Dabrt-report=enabled,-Dabrt-report=disabled"
+PACKAGECONFIG[bmc-generic] = "-Dbmc-generic=enabled,-Dbmc-generic=disabled"
+PACKAGECONFIG[openbmc-unified-sel] = "-Dopenbmc-unified-sel=enabled,-Dopenbmc-unified-sel=disabled"
+PACKAGECONFIG[ampere-oem-sel] = "-Dampere-oem-sel=enabled,-Dampere-oem-sel=disabled"
+PACKAGECONFIG[arm] = "-Darm=enabled,-Darm=disabled"
+PACKAGECONFIG[reri] = "-Dreri=enabled,-Dreri=disabled"
+PACKAGECONFIG[amp-ns-decode] = "-Damp-ns-decode=enabled,-Damp-ns-decode=disabled"
+PACKAGECONFIG[hisi-ns-decode] = "-Dhisi-ns-decode=enabled,-Dhisi-ns-decode=disabled"
+PACKAGECONFIG[jaguar-ns-decode] = "-Djaguar-ns-decode=enabled,-Djaguar-ns-decode=disabled"
+PACKAGECONFIG[nvidia-ns-decode] = "-Dnvidia-ns-decode=enabled,-Dnvidia-ns-decode=disabled"
+PACKAGECONFIG[yitian-ns-decode] = "-Dyitian-ns-decode=enabled,-Dyitian-ns-decode=disabled"
+
+do_install:append() {
+	install -d ${D}${sysconfdir}/init.d
+	install -m 755 ${UNPACKDIR}/init ${D}${sysconfdir}/init.d/rasdaemon
+}
+
+FILES:${PN} += "${datadir} \
+		${PYTHON_SITEPACKAGES_DIR} \
+		${systemd_system_unitdir}"
+
+SYSTEMD_SERVICE:${PN} = "rasdaemon.service"
+SYSTEMD_AUTO_ENABLE = "enable"
+
+INITSCRIPT_PACKAGES = "${PN}"
+INITSCRIPT_NAME:${PN} = "rasdaemon"
+INITSCRIPT_PARAMS:${PN} = "defaults 89"
diff --git a/meta-oe/dynamic-layers/perl-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend b/meta-oe/dynamic-layers/perl-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
deleted file mode 100644
index 5c48fd5c03..0000000000
--- a/meta-oe/dynamic-layers/perl-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-RDEPENDS:packagegroup-meta-oe-support += "rasdaemon"
diff --git a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/rasdaemon.service b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/rasdaemon.service
deleted file mode 100644
index 4fbf23142a..0000000000
--- a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/rasdaemon.service
+++ /dev/null
@@ -1,12 +0,0 @@
-[Unit]
-Description=RAS daemon to log the RAS events
-After=syslog.target
-
-[Service]
-ExecStart=/usr/sbin/rasdaemon -f -r
-ExecStartPost=/usr/sbin/rasdaemon --enable
-ExecStop=/usr/sbin/rasdaemon --disable
-Restart=on-abort
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.5.bb b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.5.bb
deleted file mode 100644
index 750a6ea227..0000000000
--- a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.5.bb
+++ /dev/null
@@ -1,50 +0,0 @@
-DESCRIPTION = "Tools to provide a way to get Platform Reliability, Availability and Serviceability (RAS) reports made via the Kernel tracing events"
-HOMEPAGE = "https://github.com/mchehab/rasdaemon"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d3070efe0afa3dc41608bd82c00bb0dc"
-
-SRC_URI = "git://github.com/mchehab/rasdaemon.git;branch=master;protocol=https;tag=v${PV} \
-           file://rasdaemon.service \
-           file://init"
-
-SRCREV = "769593be915b4f00a9a7d56569df99bc0cff249a"
-
-DEPENDS = "libtraceevent pciutils"
-RDEPENDS:${BPN} = "perl perl-module-file-basename perl-module-file-find perl-module-file-spec perl-module-getopt-long \
-	perl-module-posix perl-module-file-glob libdbi-perl libdbd-sqlite-perl"
-
-inherit autotools pkgconfig update-rc.d systemd
-
-PACKAGECONFIG ??= "sqlite3 mce aer extlog devlink diskerror"
-PACKAGECONFIG[sqlite3] = "--enable-sqlite3,--disable-sqlite3,sqlite3"
-PACKAGECONFIG[mce] = "--enable-mce,--disable-mce"
-PACKAGECONFIG[aer] = "--enable-aer,--disable-aer"
-PACKAGECONFIG[extlog] = "--enable-extlog,--disable-extlog"
-PACKAGECONFIG[devlink] = "--enable-devlink,--disable-devlink"
-PACKAGECONFIG[diskerror] = "--enable-diskerror,--disable-diskerror"
-PACKAGECONFIG[arm] = "--enable-arm,--disable-arm"
-PACKAGECONFIG[hisi-ns-decode] = "--enable-hisi-ns-decode,--disable-hisi-ns-decode"
-PACKAGECONFIG[non-standard] = "--enable-non-standard,--disable-non-standard"
-PACKAGECONFIG[abrt-report] = "--enable-abrt-report,--disable-abrt-report"
-
-DEPENDS:append:libc-musl = " argp-standalone"
-LDFLAGS:append:libc-musl = " -largp"
-
-do_install:append() {
-	install -d ${D}${sysconfdir}/init.d
-	install -m 755 ${UNPACKDIR}/init ${D}${sysconfdir}/init.d/rasdaemon
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${UNPACKDIR}/rasdaemon.service ${D}${systemd_unitdir}/system
-}
-
-FILES:${PN} += "${sbindir}/rasdaemon \
-		${sysconfdir}/init.d \
-		${datadir} \
-		${systemd_unitdir}/system/rasdaemon.service"
-
-SYSTEMD_SERVICE:${PN} = "rasdaemon.service"
-SYSTEMD_AUTO_ENABLE = "enable"
-
-INITSCRIPT_PACKAGES = "${PN}"
-INITSCRIPT_NAME:${PN} = "rasdaemon"
-INITSCRIPT_PARAMS:${PN} = "defaults 89"
