Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.6066.1587043088956237550
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2020 06:18:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Jadsr1ZN;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=866; q=dns/txt; s=axis-central1;
  t=1587043089; x=1618579089;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jSoFWHCwQoxQHao/2ZIXa5CUjMsvYau8+5yrp2/xyE4=;
  b=Jadsr1ZNEd8BWZkSvtYvkGRUgUt55GuOusTjqQcudjEZR6nUVxOdqt4Y
   81DZG+g4OlH2ixnHyBY9sZFM++1oEiV8YcbmCofI0qgZ+wECgEH4q8Wxv
   SUC0VZzfeztRZDFqDqc4kM0Mx96rOM8jW92vNltm1IFpE4CDu5EguUQR3
   w+u7EMXXU0MWQ8TpeIBJNNCFXkOcJqspwGH6IUpjmiUR4sE1UGleu5fGg
   5gWo09yStnVJCQsBhXwYKPofDr4ipQWAjaqQFIZ/fM8UI9Rdre/EbVl+Y
   sHs7PlZCveWhfesVtSUkbstMK+lU1cmeAlRZ5R/C8x3cLtf0lVWe21ryX
   A==;
IronPort-SDR: I93zqorvktJfeGuq7eGU9n9qyn+mtSB+SZ505dZPR7w31C3DPX3XqsGQQl67irVNZvpGkBm/Te
 lVPAmqlwksgsc1MN2nAWQo57wCj/Axad5Pe3FvN7Xk6madQ+q050RVk5kymLBAEu8K7quDutBg
 mxNWomkiZEUkzlnc1TfH6zDFUl44R8nN5I0dE417ZpdvCgIT8CarHnha3nNiLcxKiosFJhC06u
 pL2C0XR7Bd70GWIWY+xLqEamNSIcXEqU474k/0IrVhvx5lFNicXJbILEdxT8sB6ujgAEVpvxUF
 Vx0=
X-IronPort-AV: E=Sophos;i="5.72,391,1580770800"; 
   d="scan'208";a="7696582"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] dlt-daemon: Make it support usrmerge
Date: Thu, 16 Apr 2020 15:18:04 +0200
Message-ID: <20200416131804.22764-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.4.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.4.bb
index ef4fb6a76..35c638bc7 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.4.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.4.bb
@@ -41,6 +41,8 @@ PACKAGECONFIG[dlt-console] = "-DWITH_DLT_CONSOLE=ON,-DWITH_DLT_CONSOLE=OFF,,dlt-
 
 inherit autotools gettext cmake systemd
 
+EXTRA_OECMAKE += "-DSYSTEMD_UNITDIR=${systemd_system_unitdir}"
+
 PACKAGES += "${PN}-systemd"
 SYSTEMD_PACKAGES = "${PN} ${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = " ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'dlt.service', '', d)} \
-- 
2.21.1

