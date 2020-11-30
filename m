Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.60178.1606745352523925113
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Nov 2020 06:09:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MY5dXA6m;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id a6so5100433wmc.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Nov 2020 06:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J4k6f/1q6MLchDeYmnzUkMcAy9tZRUpdzf5swQ7zT90=;
        b=MY5dXA6mPjd2wlV0eWs4U6BjAwXdT1tpdDW2sLFXnVuO8LOiCqIg0GQRIMM0POUByq
         MReq68dgg8GBjS/GN74qixgECMppwn3TxJ/jXW0F001I5Oy+X+GBJNtaD/nb3PBubXRA
         Nxg5rc1iwZ+2M4BoAeVrmO31RGU9IFhWlk+zl+TX9BTnGHEdWBr2PHYF8lXwpKRIXD7y
         P/5QoJOtKj6xYfZupv+ZBOAfoITfmmWm5cZaYfc9Zf9b5Rh3b82fHPsJfgrMVsqytNSw
         ZSc3UU10mcPXzxcxtWBAHAMzsw0cnqdg63EKhGnYRZkfmLqcdssFFR5KIzYq8G47SFX6
         iRwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J4k6f/1q6MLchDeYmnzUkMcAy9tZRUpdzf5swQ7zT90=;
        b=sD4wCRWmEAEv2B93j2sXCkfNnN9SOUrj7jt68ekQv0NlTSdg52ZqkxWMxGNcD10Cmt
         InWIND8LQLhrcVHn9wQSqZdWWi7Vqpg2P8auq/fJ0Fon7unixDcHMrgUkRKR99fqaxSp
         zvqaShT3Ui8JoctXzvpFusccbsGcx5VXGgDdimZ775qnmvQL5d4yBWo+rCMCY8VrHtuV
         2heLW7uiDj1nFgWoiNCaL63EExLVQT7twqsipAKXwvd7PhmKuV8HF2dBc7vtXUriheJ9
         CXKpfH5EIzgwDQtUndO/Z8mBTbAtr8KARJCrAUCrsDbRC8ct0ynmDCLQoQpjGLYxrPZ0
         7oxA==
X-Gm-Message-State: AOAM532TenaEFYtPafcLQga/+KjyiVCDTpi+0KMytXytV05IkMF450Y0
	EswuZEdZsInISD1owMN56KPmOSw4/W+P8Q==
X-Google-Smtp-Source: ABdhPJw8KDiFrfRk/a5l86cW2INMJDrV81eBIUN/xKaxmZjwFGkJDERE1veLwoHFA/Kd9q7gXISyOA==
X-Received: by 2002:a1c:9d16:: with SMTP id g22mr5156803wme.140.1606745350662;
        Mon, 30 Nov 2020 06:09:10 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id e1sm32305481wra.22.2020.11.30.06.09.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 06:09:09 -0800 (PST)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] dbus-broker: rdepend on dbus-common
Date: Mon, 30 Nov 2020 14:09:06 +0000
Message-Id: <20201130140907.288760-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

The dbus package in oe-core was split, and the common configuration
files that are also required by dbus-broker are now shipped in
dbus-common, to avoid having to pull in the entire dbus-daemon.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta-oe/recipes-core/dbus/dbus-broker_23.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-core/dbus/dbus-broker_23.bb b/meta-oe/recipes-core/dbus/dbus-broker_23.bb
index c622e4857..97b093843 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_23.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_23.bb
@@ -17,6 +17,8 @@ DEPENDS = "expat systemd"
 DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'libselinux', '', d)}"
 DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'audit', '', d)}"
 
+RDEPENDS_${PN} += "dbus-common"
+
 REQUIRED_DISTRO_FEATURES = "systemd"
 
 SYSTEMD_SERVICE_${PN} = "${BPN}.service"
-- 
2.27.0

