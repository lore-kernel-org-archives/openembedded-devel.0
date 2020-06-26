Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web10.2846.1593156025733349241
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2020 00:20:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1joiel-0007HB-Ss; Fri, 26 Jun 2020 10:20:17 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.92)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1joiel-000AHf-O8; Fri, 26 Jun 2020 10:20:15 +0300
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: openembedded-devel@lists.openembedded.org
Cc: Fabio Berton <fabio.berton@ossystems.com.br>,
	Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>,
	Khem Raj <raj.khem@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Maksim Sisov <msisov@igalia.com>,
	Takuro Ashie <ashie@clear-code.com>,
	Mikko Rapeli <mikko.rapeli@bmw.de>
Subject: [meta-browser][PATCH] chromium-ozone-wayland: add build dependency to at-spi2-atk
Date: Fri, 26 Jun 2020 10:19:51 +0300
Message-Id: <20200626071951.35887-1-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
X-Rspam-Score: 3.8 (+++)
X-Rspam-Report: Action: no action
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(2.50)
 Symbol: FREEMAIL_ENVRCPT(0.00)
 Symbol: TAGGED_RCPT(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: BROKEN_CONTENT_TYPE(1.50)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: RCPT_COUNT_SEVEN(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: NEURAL_HAM(-0.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: SUSPICIOUS_RECIPS(1.50)
 Symbol: FREEMAIL_CC(0.00)
 Message-ID: 20200626071951.35887-1-mikko.rapeli@bmw.de
X-Rspam-Bar: +++
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Content-Transfer-Encoding: 8bit

Fixes configure error with poky master branch:

ERROR at //build/config/linux/pkg_config.gni:103:17: Script returned non-zero exit code.
    pkgresult = exec_script(pkg_config_script, args, "value")
                ^----------
Current dir: /home/builder/src/yocto/poky/build/tmp/work/cortexa57-poky-linux/chromium-ozone-wayland/83.0.4103.116-r0/chromium-83.0.4103.116/out/Release/
Command: python /home/builder/src/yocto/poky/build/tmp/work/cortexa57-poky-linux/chromium-ozone-wayland/83.0.4103.116-r0/chromium-83.0.4103.116/build/config/linux/pkg-config.py atk atk-bridge-2.0
Returned 1.
stderr:

Package atk-bridge-2.0 was not found in the pkg-config search path.
Perhaps you should add the directory containing `atk-bridge-2.0.pc'
to the PKG_CONFIG_PATH environment variable
No package 'atk-bridge-2.0' found
Could not run pkg-config.

See //build/config/linux/atk/BUILD.gn:19:1: whence it was called.
pkg_config("atk_base") {
^-----------------------
See //ui/views/BUILD.gn:821:22: which caused the file to be included.
        configs += [ "//build/config/linux/atk" ]
                     ^-------------------------
WARNING: exit code 1 from a shell command.
ERROR: Execution of '/home/builder/src/yocto/poky/build/tmp/work/cortexa57-poky-linux/chromium-ozone-wayland/83.0.4103.116-r0/temp/run.do_configure.35368' failed with exit code 1:
ERROR at //build/config/linux/pkg_config.gni:103:17: Script returned non-zero exit code.
    pkgresult = exec_script(pkg_config_script, args, "value")
                ^----------

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 recipes-browser/chromium/chromium-ozone-wayland_83.0.4103.116.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-browser/chromium/chromium-ozone-wayland_83.0.4103.116.bb b/recipes-browser/chromium/chromium-ozone-wayland_83.0.4103.116.bb
index de9274d..58fa0fb 100644
--- a/recipes-browser/chromium/chromium-ozone-wayland_83.0.4103.116.bb
+++ b/recipes-browser/chromium/chromium-ozone-wayland_83.0.4103.116.bb
@@ -3,6 +3,7 @@ require chromium-gn.inc
 REQUIRED_DISTRO_FEATURES = "wayland"
 
 DEPENDS += "\
+        at-spi2-atk \
         libxkbcommon \
         virtual/egl \
         wayland \
-- 
2.20.1

