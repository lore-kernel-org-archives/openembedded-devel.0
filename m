Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web12.1307.1586386894367344196
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Apr 2020 16:01:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@broadcom.com header.s=google header.b=hb7AykiK;
 spf=pass (domain: broadcom.com, ip: 209.85.215.194, mailfrom: jonathan.richardson@broadcom.com)
Received: by mail-pg1-f194.google.com with SMTP id g32so4029617pgb.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Apr 2020 16:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f4Zy12ylImzyX3BxVr8cTHc50InQpLOwjfW3mL5Upz4=;
        b=hb7AykiK26jVvM2Xjz6m9C5I8iXLbvuI4PkqXWkRVS1G2qN+gb6Lauf1RH/OWuQtjs
         wgm2CaEK+C13VYwnxTNu89wfywyZyeC0G19swNfpSbvuswS9O7D55ddb5uOReN+0dCJj
         i4Sth0sgCzX9Axyc5YbieJrDYceRdjJ3WlGM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f4Zy12ylImzyX3BxVr8cTHc50InQpLOwjfW3mL5Upz4=;
        b=tYZGcUty8xuypijSzG9VZMgBbpCK1m7Z31vzRcW86oZFCOZCcM+cnheQWS9ia0VPan
         fD7Flsl9yWaNrFOlsDDihrEWjF6Xm70NfoZlbnVCOcjHaUTMLFnkBActAzkLQRLFgP/a
         87uUgzw5MKx2YNtSy2y/rVn6kGLu8HU9jdZujNcOY7LCLKj8S7+rwJImuc9tfRzqI+Fg
         xOzDkLMLNJmlwqjQJu9fdYvTQV27j4bdSlQHCUaJy4smPtS7f+jjJGvPyD94+YEMLgfn
         eNVPtLcXfxBLkRzmgMx2aXQtoCD5wGFbJqA+AFm4+jeOznBfvPIUHa3rz5CWe67n9/xw
         VeHA==
X-Gm-Message-State: AGi0PuY8WN3Lt+grUVi1FsPlK/L+QBM9KsfaI3cXa/TlA3F7oHQXjQqy
	6N808er+gXkgLWDJXI/Twf9fiNeCvLPpNzwlBlK5XGJEiJ7VskI1mLAVMYynlzL0UG3Um3GO+h8
	R4+hA+YFFJigqsUx+RjhlOJGOppCBkGTaO1h3Tf7uP/8vIndYg4k4MlTrfaGZ7VgsWUCwJHOIe8
	x7DBjoKmiUCcceexLnw4VYINn9Plt86pmCig==
X-Google-Smtp-Source: APiQypK1wj6tZSOi9mZ6vOaiIlCV6rkQgcqCor6g6ZHZAT13fZvjYeSHOmTJQ3oMcIenS5CjqwMyxw==
X-Received: by 2002:aa7:98c9:: with SMTP id e9mr9837075pfm.204.1586386893182;
        Wed, 08 Apr 2020 16:01:33 -0700 (PDT)
Return-Path: <jonathan.richardson@broadcom.com>
Received: from lbrmn-lnxub108.ric.broadcom.net ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id f4sm563613pjm.9.2020.04.08.16.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 16:01:32 -0700 (PDT)
From: "Jonathan Richardson" <jonathan.richardson@broadcom.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jonathan Richardson <jonathan.richardson@broadcom.com>
Subject: [meta-oe][PATCH 1/1] nvmetcli: Add initial version 0.7
Date: Wed,  8 Apr 2020 16:01:20 -0700
Message-Id: <20200408230120.21914-1-jonathan.richardson@broadcom.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add recipe for NVM-Express target user space configuration utility. It
contains a command line interface to the NVMe over Fabrics nvmet in
the Linux kernel.  It allows configuring the nvmet interactively as well
as saving/restoring the configuration to/from a json file.

Signed-off-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
---
 .../recipes-support/nvmetcli/nvmetcli_0.7.bb  | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 meta-networking/recipes-support/nvmetcli/nvmetcli_0.7.bb

diff --git a/meta-networking/recipes-support/nvmetcli/nvmetcli_0.7.bb b/meta-networking/recipes-support/nvmetcli/nvmetcli_0.7.bb
new file mode 100644
index 000000000..31f55e358
--- /dev/null
+++ b/meta-networking/recipes-support/nvmetcli/nvmetcli_0.7.bb
@@ -0,0 +1,39 @@
+SUMMARY = "NVM-Express target user space configuration utility."
+DESCRIPTION = "This package contains the command line interface to the NVMe \
+over Fabrics nvmet in the Linux kernel.  It allows configuring the nvmet \
+interactively as well as saving / restoring the configuration to / from a json \
+file."
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+inherit systemd setuptools3
+
+# nvmet service will start and stop the NVMe Target configuration on boot and
+# shutdown from a saved NVMe Target configuration in the /etc/nvmet/config.json
+# file. This file is not installed by default since the configuration will vary
+# on real systems. Example configuration files are provided by including the
+# nvmetcli-examples package.
+SYSTEMD_SERVICE_${PN} = "nvmet.service"
+
+SYSTEMD_AUTO_ENABLE ?= "disable"
+
+RDEPENDS_${PN} += "python3 python3-six python3-pyparsing python3-configshell-fb"
+
+SRCREV = "0a6b088db2dc2e5de11e6f23f1e890e4b54fee64"
+SRC_URI = "git://git.infradead.org/users/hch/nvmetcli.git;branch=master"
+
+S = "${WORKDIR}/git"
+
+do_install_append() {
+    # Install example configuration scripts.
+    install -d ${D}${datadir}/nvmet
+    cp -fr ${S}/examples ${D}${datadir}/nvmet/
+
+    # Install systemd service file.
+    install -d ${D}${systemd_unitdir}/system
+    cp -fr ${S}/nvmet.service ${D}${systemd_unitdir}/system
+}
+
+# Examples package contains example json files used to configure nvmet.
+PACKAGES += "${PN}-examples"
+FILES_${PN}-examples = "${datadir}/nvmet/examples/*"
-- 
2.20.1

