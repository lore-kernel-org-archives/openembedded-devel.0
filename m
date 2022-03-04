Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C79C433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 08:50:33 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.5086.1646383829737528693
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 00:50:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pXAyNTG0;
 spf=pass (domain: gmail.com, ip: 209.85.210.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d187so7063858pfa.10
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 00:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3qoMOjz7mlaECD/vmGFpUUcAW04EUjXFD41XsgOOurM=;
        b=pXAyNTG01vQRTHW+rIbvyThPB9iBe27fVlUkdGosAnAhvqSexmg5ZZdSKcDOcgUlj0
         byZRPidVkB099Eh9Bhh4Byva1nHIN8s9guKWgSsK//QiF6NEPusAM/dGh/U3gqXYrJK4
         dThy0jkuoOkhCcKxjpCKxzmSp1u9JwA37UkHiirKSWTPV6kksGMbtJnrcJk/ki1uT/zT
         yjK6TQIjO+TSdN4xAORWuthdv8N8OTLt1d8oSapK0Ab7l6Castoe99OqSbBHoTv1/qkK
         goBcO7P+c5QrW7F3NOrfIrEA558M82WngudnoxnEuUF3wWMs2A+y2rbrfjpXup8RSF3U
         3RDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3qoMOjz7mlaECD/vmGFpUUcAW04EUjXFD41XsgOOurM=;
        b=AuLxsIzUiUx/FWRfzu2RcgcFbwefUzIMSyyfcgM7BjGCljwkQIE4BzBnUOPorbGuqt
         MZ96lpcnZEV4G2Ppw0SH4uNSbuX99asYXQzG4S/PnroQnZeWk4oqWWz2KRdlUeRGXtGD
         5muXE/OcMebyF3LZXnd7seWwHrWvtPX0UKUcsmwpJ7sgA6LkMDI6oPiEkt8vDdf0WWyr
         1BX4oB5/3pIKG0VqVNli07LnGp8jLKilI1BtpSK2VXJoPZN9YRAqdpO74EMrv8b2CPvk
         2cpFbDM2l0xoVKnMNk6uYCUQHwBQlFwdsyTG1qYv9Y9h1AiKTMjz31s1J5KPUpa3ONqG
         Q74w==
X-Gm-Message-State: AOAM5307zBLjosoPyhhuOmJKSMf8e3bKWCVl66R/ciXfvnTWkVCWB3dR
	T3MgDx5/nNzrLSPsQj9qZaF/dRz15kLh8A==
X-Google-Smtp-Source: 
 ABdhPJwwomiGA5RyjnuObbwOlX0hQOJ5GhKue5nR5gSekkuE6AY5ExnvEj9l23DYl+wRCBA71iEb5g==
X-Received: by 2002:a05:6a00:a06:b0:4f6:aa23:edaa with SMTP id
 p6-20020a056a000a0600b004f6aa23edaamr4171982pfh.8.1646383829088;
        Fri, 04 Mar 2022 00:50:29 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 k12-20020a635a4c000000b0037852b86236sm3912283pgm.75.2022.03.04.00.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 00:50:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-webserver][PATCH 09/10] recipes: Update LICENSE variable to use
 SPDX license identifiers
Date: Fri,  4 Mar 2022 00:50:17 -0800
Message-Id: <20220304085018.1255075-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220304085018.1255075-1-raj.khem@gmail.com>
References: <20220304085018.1255075-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Mar 2022 08:50:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95776

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-webserver/recipes-httpd/cherokee/cherokee_git.bb     | 2 +-
 meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb   | 2 +-
 meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.3.bb | 2 +-
 meta-webserver/recipes-webadmin/cockpit/cockpit_220.bb    | 2 +-
 meta-webserver/recipes-webadmin/netdata/netdata_1.33.1.bb | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb b/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb
index 16733c6621..7100ef4341 100644
--- a/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb
+++ b/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb
@@ -2,7 +2,7 @@ SUMMARY = "Cherokee Web Server fast and secure"
 SUMMARY:cget = "Small downloader based in the Cherokee client library"
 HOMEPAGE = "http://www.cherokee-project.com/"
 SECTION = "network"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "unzip-native libpcre openssl mysql5 ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb
index f13f144fcc..2e848eaf56 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Lightweight secure web server"
 HOMEPAGE = "http://www.hiawatha-webserver.org"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "libxml2 libxslt virtual/crypt"
 
diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.3.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.3.bb
index dca476cede..7ccc05ec3e 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.3.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.3.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Web-based MySQL administration interface"
 HOMEPAGE = "http://www.phpmyadmin.net"
 # Main code is GPLv2, vendor/tecnickcom/tcpdf is under LGPLv3, js/jquery is under MIT
-LICENSE = "GPLv2 & LGPLv3 & MIT"
+LICENSE = "GPL-2.0-only & LGPL-3.0-only & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://vendor/tecnickcom/tcpdf/LICENSE.TXT;md5=dd6470bbcd3436ca317f82d34abaf688 \
                     file://js/vendor/jquery/MIT-LICENSE.txt;md5=de877aa6d744cc160ff41c26a8e4811f \
diff --git a/meta-webserver/recipes-webadmin/cockpit/cockpit_220.bb b/meta-webserver/recipes-webadmin/cockpit/cockpit_220.bb
index 7c3c17cd78..58dbad31b1 100644
--- a/meta-webserver/recipes-webadmin/cockpit/cockpit_220.bb
+++ b/meta-webserver/recipes-webadmin/cockpit/cockpit_220.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Admin interface for Linux machines"
 DESCRIPTION = "Cockpit makes it easy to administer your GNU/Linux servers via a web browser"
 
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI += " \
diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.33.1.bb b/meta-webserver/recipes-webadmin/netdata/netdata_1.33.1.bb
index 3336b43c56..012efc0682 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_1.33.1.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.33.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Real-time performance monitoring"
 DESCRIPTION = "Netdata is high-fidelity infrastructure monitoring and troubleshooting. \
                Open-source, free, preconfigured, opinionated, and always real-time."
 HOMEPAGE = "https://github.com/netdata/netdata/"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc9b848046ef54b5eaee6071947abd24"
 
 DEPENDS += "libuv util-linux zlib"
-- 
2.35.1


