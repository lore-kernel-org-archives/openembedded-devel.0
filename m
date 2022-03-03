Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 588C4C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 16:40:18 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web12.13053.1646325617452520135
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 08:40:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XfzfJH0E;
 spf=pass (domain: gmail.com, ip: 209.85.210.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d17so5180364pfl.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 08:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4aHxm0LQFAo0oOKBZdsf8xB3F8OrvVIoJV/zRONDKOQ=;
        b=XfzfJH0ERZLLS39KWcsevCy5jCNk9nQ2kKLzPCTO71kwmfmgmwo7G6ulKVnIde03fI
         LXOOG1CqCLfv6DX5bPZOZh7XyO4lyn4Z9FhQiGjdac9khnVOIIydqhJgs8iYpUjYExwQ
         tntQ8NFLvuzS1r3E1nBWTBCCAD+DEgEmvzqxCiZYhF9lIiwuQXne8do+sYOYd3Q/e1ez
         Tng3XaKkwJxHMIRjK+AEsAsDk6OE1MonZB2ce1ISjegInNTFu1ESswD9a8X44KDXoww1
         viAnar2y4j61z8Hm0JZw6l5GyBoPw2PyP4vxBt2N/DgIpeXPtwhcoFHxwjq5z+foBTZ3
         hbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4aHxm0LQFAo0oOKBZdsf8xB3F8OrvVIoJV/zRONDKOQ=;
        b=4kTZFuCo4+Igiok3DN4TxGQP57Rxrp5uvoB6Xn8FAsOgPrda+dwHg32jIs0rxS5v+g
         Qh5xQh0On4AIcgTG7HVTKkJVese61oWjVmXzEBKSuaMUenVR2i0kBiVi8Ly/oqF23bpb
         DG5+H7bGuWNkHkb7Gkisd/vnD183yBSof5URs2Gxt0qbruf+sIyrMDjHk0e70dQ5wF3P
         SwClTDzGrvM81r4VRMDqTUfeZSKWinEX53fQRuHqVmo+PYAuQbRkSwemOBq9Tmg5mByY
         3FVDO727N6lMs4MZgA21/hPZnYKEI2fUmCmhMaGl7wz4pVO66FNRKB0daG4iwaUU3og+
         9b1A==
X-Gm-Message-State: AOAM5312M8lN7ggQgvjKUak9kFAjFkmheZreabx28cjqXRevfl7EkE45
	3VTv9FDnHr/VT/U611DmaONHDb1gIz/xUg==
X-Google-Smtp-Source: 
 ABdhPJz0zP+QPlb3vWFNWjMxx8xQa+Q5L8oY7w0p1kedk3K/nelK+ZkjkmJ1Ur5bWvlM5L0usaOF5w==
X-Received: by 2002:a63:af06:0:b0:378:3582:a49f with SMTP id
 w6-20020a63af06000000b003783582a49fmr26244029pge.125.1646325616251;
        Thu, 03 Mar 2022 08:40:16 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 t9-20020a656089000000b00372c36604a7sm2535050pgu.13.2022.03.03.08.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 08:40:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/2] unattended-upgrades: Move to meta-python
Date: Thu,  3 Mar 2022 08:40:12 -0800
Message-Id: <20220303164013.3149208-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 16:40:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95752

It needs distutils, until its ported to use setuptools, keep it in
meta-python as it depends on distutils infra from here.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb    | 1 +
 ...unattended-upgrade-Remove-distro_info-usage-to-check.patch | 0
 .../unattended-upgrades/unattended-upgrades_2.6.bb            | 4 ++--
 3 files changed, 3 insertions(+), 2 deletions(-)
 rename {meta-oe => meta-python}/recipes-devtools/unattended-upgrades/files/0001-unattended-upgrade-Remove-distro_info-usage-to-check.patch (100%)
 rename {meta-oe => meta-python}/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb (92%)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 670361598e..b2d31282e6 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -474,6 +474,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-yarl \
     python3-zopeinterface \
     telepathy-python3 \
+    unattended-upgrades \
 "
 RDEPENDS:packagegroup-meta-python3:remove:libc-musl:powerpc64le = "python3-grpcio python3-grpcio-tools"
 
diff --git a/meta-oe/recipes-devtools/unattended-upgrades/files/0001-unattended-upgrade-Remove-distro_info-usage-to-check.patch b/meta-python/recipes-devtools/unattended-upgrades/files/0001-unattended-upgrade-Remove-distro_info-usage-to-check.patch
similarity index 100%
rename from meta-oe/recipes-devtools/unattended-upgrades/files/0001-unattended-upgrade-Remove-distro_info-usage-to-check.patch
rename to meta-python/recipes-devtools/unattended-upgrades/files/0001-unattended-upgrade-Remove-distro_info-usage-to-check.patch
diff --git a/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb b/meta-python/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb
similarity index 92%
rename from meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb
rename to meta-python/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb
index 85e5f59c7a..0629bf6db1 100644
--- a/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb
+++ b/meta-python/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb
@@ -13,8 +13,8 @@ SRCREV = "c6db6fad26a2b83ba301b52ff5dee98cef7558ca"
 
 S = "${WORKDIR}/git"
 
-inherit setuptools_build_meta
-PYPA_WHEEL = "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-0.1-*.whl"
+inherit distutils3
+#PYPA_WHEEL = "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-0.1-*.whl"
 
 DEPENDS += "apt intltool-native python3-distutils-extra-native"
 RDEPENDS:${PN} += "apt lsb-release python3-apt python3-core python3-datetime python3-email python3-fcntl python3-io python3-logging python3-stringold python3-syslog"
-- 
2.35.1


