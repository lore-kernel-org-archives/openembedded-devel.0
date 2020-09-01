Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web12.8335.1598999781110881179
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2020 15:36:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GwGxEvrt;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id u128so1676596pfb.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2020 15:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ko1VthjcyfR79xW/YsbT5XZVkRTYNPqjxLhhaYQtREk=;
        b=GwGxEvrtwYBTKbFflo04VUxy4k5wnRHwGy90Y1emX09IGiC4303SeYyyKOGB4uJsLO
         aJEgTyyOOjpt0NEaTvnfQdPpHaaNY7gyPuNVW0/ZMP3v/KVDa4FQ8JQ0h0KfTZXLrZ2p
         vBs7/wJ/y9/C8Z8zemURfktQ6U43rdBVfKjRdVaLZuRbbVfdcGw7lIpP7izyp1hso5kC
         ktSPinvB9XoL5nSSJQfEN3OrU/LUSKVlpF5EdnFbHAUSAR6J9vQxqYlK/ekXWKij2GrS
         X5xjYnIiUKC/CRXROUVDiMM9y6VbhMLwfh1/1iNqa0wW2FYvVRHXdhUJYDqyezC7fzf+
         hdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ko1VthjcyfR79xW/YsbT5XZVkRTYNPqjxLhhaYQtREk=;
        b=VtgAmRKjMDMXjQ1UcsUcyGvl7N26mR7A9t16uKQDNHrzAtIEBSb5Ok45awMLKHWIhP
         kGbP4y43lp3+PyMQFp487i4Diu5y1NBX0GA/ueJ6OOTffmXsJFGZ9TPHTZ/X4Iezm9IL
         8aAQe5wDC3HlmAGBN7qaOADOxg/IbyYQQBfmcHWp3/0QVNFpdYmF0oGDQs3mmqEls/RP
         GIHvl0fLx1OzfxOJ5Rzy8GNlU6NjRx3tBbEDPnvDUUwR0pM7dISsvVfGhNTPWHbLvZDv
         5WnwZGwl2/k4Izv3SP63iMj0tP3IXuVab3/dyE/asCPKj1gjs377EEkwJZNxpI/nrIDI
         YKcA==
X-Gm-Message-State: AOAM530oCoXFRtiH/XdDZ4JSLxErs9hWTkqMTfobR89GFSMIsmpq3yzM
	vvePzW69knOnDlpmp7a7EqOnEwOIndPOJg==
X-Google-Smtp-Source: ABdhPJzM1t5dqugMarhSJYXERFCasWBfgECSQfa//HEZ7eX2IBqQ2WJygldnNPq2ApGb7npVhenvtQ==
X-Received: by 2002:a65:68d6:: with SMTP id k22mr3250903pgt.136.1598999780191;
        Tue, 01 Sep 2020 15:36:20 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id q34sm3157964pgl.28.2020.09.01.15.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 15:36:19 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 05/10] quagga,pimd: Use update-alternatives for pimd
Date: Tue,  1 Sep 2020 15:36:07 -0700
Message-Id: <20200901223612.1386026-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200901223612.1386026-1-raj.khem@gmail.com>
References: <20200901223612.1386026-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pimd is provided by both quagga and pimd, prefer quagga over pimd when
both are in image

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-protocols/quagga/quagga.inc | 6 +++++-
 meta-networking/recipes-support/pimd/pimd_2.3.2.bb  | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index 70c32b7a4e..11b7d576a0 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -40,7 +40,7 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG[cap] = "--enable-capabilities,--disable-capabilities,libcap"
 PACKAGECONFIG[pam] = "--with-libpam, --without-libpam, libpam"
 
-inherit autotools update-rc.d useradd systemd pkgconfig multilib_header
+inherit autotools update-rc.d useradd systemd pkgconfig multilib_header update-alternatives
 
 CFLAGS += "-fcommon"
 
@@ -237,3 +237,7 @@ pkg_prerm_${PN}-ripngd () {
 pkg_prerm_${PN}-isisd () {
     ${sysconfdir}/init.d/quagga stop isisd
 }
+
+ALTERNATIVE_${PN} = "pimd"
+ALTERNATIVE_LINK_NAME[pimd] = "${sbindir}/pimd"
+
diff --git a/meta-networking/recipes-support/pimd/pimd_2.3.2.bb b/meta-networking/recipes-support/pimd/pimd_2.3.2.bb
index 2faa7cb1ce..df9e85d7de 100644
--- a/meta-networking/recipes-support/pimd/pimd_2.3.2.bb
+++ b/meta-networking/recipes-support/pimd/pimd_2.3.2.bb
@@ -12,9 +12,13 @@ SRC_URI[sha256sum] = "c77a9812751f114490a28a6839b16aac8b020c8d9fd6aa22bf3880c054
 
 EXTRA_OECONF_append_libc-musl = " --embedded-libc"
 
-inherit autotools-brokensep
+inherit autotools-brokensep update-alternatives
 
 do_configure() {
     oe_runconf
 }
 
+ALTERNATIVE_PRIORITY = "100"
+
+ALTERNATIVE_${PN} = "pimd"
+ALTERNATIVE_LINK_NAME[pimd] = "${sbindir}/pimd"
-- 
2.28.0

