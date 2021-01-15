Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web12.2234.1610707875143459202
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jan 2021 02:51:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1l0MhC-0005dt-TG; Fri, 15 Jan 2021 12:51:12 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.92)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1l0MhC-0003yK-Ra; Fri, 15 Jan 2021 12:51:10 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: openembedded-devel@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@bmw.de>
Subject: [PATCH][meta-filesystems][dunfell] fuse: set CVE_PRODUCT to "fuse_project:fuse"
Date: Fri, 15 Jan 2021 12:50:47 +0200
Message-Id: <20210115105049.12928-1-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Rspam-Score: 2.3 (++)
X-Rspam-Report: Action: no action
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(2.50)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: BROKEN_CONTENT_TYPE(1.50)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20210115105049.12928-1-mikko.rapeli@bmw.de
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Content-Transfer-Encoding: 8bit

Other products like "RedHat:fuse" introduce false CVE findings like:

https://nvd.nist.gov/vuln/detail/CVE-2018-10906
https://nvd.nist.gov/vuln/detail/CVE-2019-14860
https://nvd.nist.gov/vuln/detail/CVE-2020-25689

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta-filesystems/recipes-support/fuse/fuse3_3.9.2.bb | 2 ++
 meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.9.2.bb b/meta-filesystems/recipes-support/fuse/fuse3_3.9.2.bb
index 24b17fc93..23028c605 100644
--- a/meta-filesystems/recipes-support/fuse/fuse3_3.9.2.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse3_3.9.2.bb
@@ -20,6 +20,8 @@ S = "${WORKDIR}/fuse-${PV}"
 UPSTREAM_CHECK_URI = "https://github.com/libfuse/libfuse/releases"
 UPSTREAM_CHECK_REGEX = "fuse\-(?P<pver>3(\.\d+)+).tar.xz"
 
+CVE_PRODUCT = "fuse_project:fuse"
+
 inherit meson pkgconfig
 
 DEPENDS = "udev"
diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
index 95e870691..2c272d452 100644
--- a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
@@ -22,6 +22,8 @@ SRC_URI[sha256sum] = "d0e69d5d608cc22ff4843791ad097f554dd32540ddc9bed7638cc6fea7
 UPSTREAM_CHECK_URI = "https://github.com/libfuse/libfuse/releases"
 UPSTREAM_CHECK_REGEX = "fuse\-(?P<pver>2(\.\d+)+).tar.gz"
 
+CVE_PRODUCT = "fuse_project:fuse"
+
 inherit autotools pkgconfig update-rc.d systemd
 
 INITSCRIPT_NAME = "fuse"
-- 
2.20.1

