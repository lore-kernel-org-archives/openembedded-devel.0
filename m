Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
 by mx.groups.io with SMTP id smtpd.web12.4667.1596025359297749126
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2020 05:22:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=T24Xla8R;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.65, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f65.google.com with SMTP id s9so12916198lfs.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2020 05:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3lEEJVRuzrR9jA2ZmPFRwujoT5tNDN+U863siQs4SSs=;
        b=T24Xla8R2+GsGhngwXjCgseKEuy0hHCb+5ZUQnxn/1knQlT/dOxz01NSl6H3D4CnBi
         npdLTU8odLwn6HQ70pS/LF6Rg6a9WAijiSppAtOZJ5+VkTBYbyL/28wswonDUHypDVVQ
         1+mhSLGhYAqL1S/RQ7qImw0IhhXtIpxNLE7iVt6xggwEfuTZhx2b8qQBOxJx947pj0xC
         0Y+tBwhcK5OjrQwed1HhQIJQjIG8E0YFEUT2rhs3zJslgH6r4nSHMb11q0IqEhFwqQ38
         qP/p8F+YbRTVYLcsIDmmc0sASxRjJV1phydfXBNP3AN1nNegxeedXDRlY0UnRHrIH2nw
         U3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3lEEJVRuzrR9jA2ZmPFRwujoT5tNDN+U863siQs4SSs=;
        b=j88wsmQLDTFFNXli2vhFEeygJL0Qu1o91YsplQZXFeP8uDAx3Mju4KF0mmbpqblLte
         4pp4oLXT8J7i35fgSAtQVTssUZfzm2FPt4YkqFOVtBuID1yNboLMRyxwL5Y11sr13FQ6
         gpWRd0A0acpiSEX4RacxM+1UveTO7lkqEFgDMeVj+pamcOwlNAN2LCVPiwF7GpOV9zCp
         7NUjtk9GkFwu1DHVqx4xtymXxjgpdQTFFr7U9Sej88nYv9ph/Z0A6maFjsjQXLcmgGXL
         VLqAGGCL75rmSwJrZw0Y4/rASLQlMLG1MA7LUzxRiMzsQQNvUUWVw6+HjjVbGPTUud12
         TdvA==
X-Gm-Message-State: AOAM530D1ot4OHXRJ2L/VT5BJn/4MlyGyCL92GHhbCzKfQzQyhAGr95o
	ZEoBw+Ro4xJg7oJy7ISaxpmhitQth2Q=
X-Google-Smtp-Source: ABdhPJy67wEPfmJlfmsJ18NCUCpyMAlPQGXY18whL/wNifFi8gEgrqyG0TbZAgpIh3hcoMAvaQGO5A==
X-Received: by 2002:a19:7111:: with SMTP id m17mr17484207lfc.156.1596025356738;
        Wed, 29 Jul 2020 05:22:36 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id r1sm423146lff.55.2020.07.29.05.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 05:22:35 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] dhcpcd: update to 9.1.4
Date: Wed, 29 Jul 2020 14:22:32 +0200
Message-Id: <20200729122232.3342488-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License checksum changed due to modified copyright years.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../dhcpcd/{dhcpcd_8.1.6.bb => dhcpcd_9.1.4.bb}          | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-connectivity/dhcpcd/{dhcpcd_8.1.6.bb => dhcpcd_9.1.4.bb} (69%)

diff --git a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.1.6.bb b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_9.1.4.bb
similarity index 69%
rename from meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.1.6.bb
rename to meta-networking/recipes-connectivity/dhcpcd/dhcpcd_9.1.4.bb
index 1cb2af500..defd3420f 100644
--- a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.1.6.bb
+++ b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_9.1.4.bb
@@ -1,19 +1,20 @@
 SECTION = "console/network"
 SUMMARY = "dhcpcd - a DHCP client"
-DESCRIPTION = "dhcpcd runs on your machine and silently configures your computer to work on the attached networks without trouble and mostly without configuration."
+DESCRIPTION = "dhcpcd runs on your machine and silently configures your \
+               computer to work on the attached networks without trouble \
+               and mostly without configuration."
 
 HOMEPAGE = "http://roy.marples.name/projects/dhcpcd/"
 
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0531457992a97ecebc6975914a874a9d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9674cc803c5d71306941e6e8b5c002f2"
 
 UPSTREAM_CHECK_URI = "https://roy.marples.name/downloads/dhcpcd/"
 
 SRC_URI = "http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch"
 
-SRC_URI[md5sum] = "e1eea03388d12c9ad21ecd7c135fdf8b"
-SRC_URI[sha256sum] = "6c2934a3e1e67a5cfd5bb15b1efa71f65c00314ac1ccb5c50da8eae3a0b8147f"
+SRC_URI[sha256sum] = "5fe133e5497d8af6d26bd6e6b8dd48ab12d124d6cc4cefe6de6536ff97f76820"
 
 inherit pkgconfig autotools-brokensep
 
-- 
2.25.1

