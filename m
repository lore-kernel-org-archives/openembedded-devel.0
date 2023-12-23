Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F38EC3DA6E
	for <webhook@archiver.kernel.org>; Sat, 23 Dec 2023 17:12:02 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.10642.1703351518055478851
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Dec 2023 09:11:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XPPfx3ox;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40d4103aed7so29057135e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Dec 2023 09:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703351516; x=1703956316; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zr80sCbfHVcQcSQyXH/ML0u/ZIJ+FNcjJJvgYKmiaHk=;
        b=XPPfx3oxjKnB6CbtUiFyXI5Vz5qHRfGB/0hjADIki8nu4BHmvLvgFpA6g0piiTwF39
         IZ1qtv5R6i0bdu++rgDLmMty3zzJ0SW9FXzfPqvTQHLpflsjrIF3Uq4Mcq72zwMa/EVg
         gHtX/3BTPQDFgbJjGHYlc36P73GlvKZyPxfLoIQ8ufY10xd2q718fsuTtIwpWUbituW1
         0u+BzEf8hM+dIFeZOwdJPGGuzqUNJZgTA6Bz5iAgCVeYQCmluIux+LvYgPMO1lzbqIzs
         J3apS4XDXgybO7c0TLWAZSaxs8G7VzWHySz6dEjFhTh2apkhVPVYjF1Xl+WroMeUcrpp
         ZD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703351516; x=1703956316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zr80sCbfHVcQcSQyXH/ML0u/ZIJ+FNcjJJvgYKmiaHk=;
        b=qKtRoxGFIn4lo1m+BwK+6dK4+eE+V7EFFay0UVVcp/JbTUKHIgphXhXP5QlURnVhj3
         mfh5Cg97uAqUwMB1lQ35dFViI2fV2Ve+FeSlafkXGfoy9ISV5SGP61+mYqGDoTlkl+E8
         v6ehzA/gDaFJoQvWSMwwNeDSyj8XCGD3w4VhuhREZW9mz9rLARCsVxSdQ1CTBW95UbF3
         SN6NXSS+V74peWn6jj51ICT+vVBuE6W8rB9s9rAwL0ICRypcBDVecndDannmn6OBWDb8
         uNBb9C+HIA8//t8uLVrVn3qBsOPHX52JFSgyENQ3sOxzgCV8Es5f65iff/DnsHzAuEs5
         7swA==
X-Gm-Message-State: AOJu0YyWpMKwybqoEbsA3uIluijyYDJ/+l7fGcgaH0byI7REzqAHxr37
	0GAz1H5j8SfPuWp5GK4tdQLY+kzB9L4=
X-Google-Smtp-Source: AGHT+IEAmK7mlEgTHXHVMs3AUk4vXI/bhJi5scGJltspn+J63lUVokJduBnCF5MyFW4SGFvcJuJ/Eg==
X-Received: by 2002:a05:600c:2e08:b0:40b:5e59:ccb9 with SMTP id o8-20020a05600c2e0800b0040b5e59ccb9mr1866435wmf.154.1703351515897;
        Sat, 23 Dec 2023 09:11:55 -0800 (PST)
Received: from localhost.localdomain (ptr-fij45qwd7v2f3indc16.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:da:7827:fe07:6d2a])
        by smtp.gmail.com with ESMTPSA id bd6-20020a05600c1f0600b0040d5335079dsm457072wmb.47.2023.12.23.09.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Dec 2023 09:11:55 -0800 (PST)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-webserver][PATCH 1/1] netdata: version bump 1.43.2 -> 1.44.1
Date: Sat, 23 Dec 2023 18:11:42 +0100
Message-Id: <20231223171142.2369168-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Dec 2023 17:12:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107774

* package size increased with 3%
* fixed a few oelint_adv issues

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 ...error-when-using-disable-dbengine-16.patch | 53 +++++++++++++++++++
 .../{netdata_1.43.2.bb => netdata_1.44.1.bb}  | 25 ++++++---
 2 files changed, 71 insertions(+), 7 deletions(-)
 create mode 100644 meta-webserver/recipes-webadmin/netdata/netdata/0001-Fix-compilation-error-when-using-disable-dbengine-16.patch
 rename meta-webserver/recipes-webadmin/netdata/{netdata_1.43.2.bb => netdata_1.44.1.bb} (81%)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata/0001-Fix-compilation-error-when-using-disable-dbengine-16.patch b/meta-webserver/recipes-webadmin/netdata/netdata/0001-Fix-compilation-error-when-using-disable-dbengine-16.patch
new file mode 100644
index 000000000..09b2db0fc
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/netdata/netdata/0001-Fix-compilation-error-when-using-disable-dbengine-16.patch
@@ -0,0 +1,53 @@
+From db1825667e186be17401b7497a29b77d8027d2e7 Mon Sep 17 00:00:00 2001
+From: Stelios Fragkakis <52996999+stelfrag@users.noreply.github.com>
+Date: Thu, 21 Dec 2023 08:48:44 +0200
+Subject: [PATCH 1/1] Fix compilation error when using --disable-dbengine
+ (#16645)
+
+Upstream-Status: Backport [https://github.com/netdata/netdata/commit/db1825667e186be17401b7497a29b77d8027d2e7]
+
+---
+ daemon/global_statistics.c | 2 ++
+ daemon/main.c              | 2 +-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/daemon/global_statistics.c b/daemon/global_statistics.c
+index 8392a3c88..6e286b18a 100644
+--- a/daemon/global_statistics.c
++++ b/daemon/global_statistics.c
+@@ -857,6 +857,7 @@ static void global_statistics_charts(void) {
+ 
+     // ----------------------------------------------------------------
+ 
++#ifdef ENABLE_DBENGINE
+     if (tier_page_type[0] == PAGE_GORILLA_METRICS)
+     {
+         static RRDSET *st_tier0_gorilla_pages = NULL;
+@@ -918,6 +919,7 @@ static void global_statistics_charts(void) {
+ 
+         rrdset_done(st_tier0_compression_info);
+     }
++#endif
+ }
+ 
+ // ----------------------------------------------------------------------------
+diff --git a/daemon/main.c b/daemon/main.c
+index fc15f0c9d..7c7452c4a 100644
+--- a/daemon/main.c
++++ b/daemon/main.c
+@@ -1502,11 +1502,11 @@ int main(int argc, char **argv) {
+ #ifdef ENABLE_DBENGINE
+                         char* createdataset_string = "createdataset=";
+                         char* stresstest_string = "stresstest=";
+-#endif
+ 
+                         if(strcmp(optarg, "pgd-tests") == 0) {
+                             return pgd_test(argc, argv);
+                         }
++#endif
+ 
+                         if(strcmp(optarg, "sqlite-meta-recover") == 0) {
+                             sql_init_database(DB_CHECK_RECOVER, 0);
+-- 
+2.39.2
+
diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.43.2.bb b/meta-webserver/recipes-webadmin/netdata/netdata_1.44.1.bb
similarity index 81%
rename from meta-webserver/recipes-webadmin/netdata/netdata_1.43.2.bb
rename to meta-webserver/recipes-webadmin/netdata/netdata_1.44.1.bb
index c56da3744..dda8ddc7a 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_1.43.2.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.44.1.bb
@@ -1,21 +1,32 @@
 SUMMARY = "Real-time performance monitoring"
-DESCRIPTION = "Netdata is high-fidelity infrastructure monitoring and troubleshooting. \
-               Open-source, free, preconfigured, opinionated, and always real-time."
+DESCRIPTION = "\
+    Netdata is high-fidelity infrastructure monitoring and troubleshooting. \
+    Open-source, free, preconfigured, opinionated, and always real-time. \
+"
 HOMEPAGE = "https://github.com/netdata/netdata/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc9b848046ef54b5eaee6071947abd24"
 
-DEPENDS += "libuv util-linux zlib libyaml json-c"
+DEPENDS += "\
+    json-c \
+    libuv \
+    libyaml \
+    util-linux \
+    zlib \
+"
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BPN}-v${PV}.tar.gz \
+SRC_URI = "\
+    https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BPN}-v${PV}.tar.gz \
+    file://0001-Fix-compilation-error-when-using-disable-dbengine-16.patch \
 "
-SRC_URI[sha256sum] = "d4a7ea2717ac7c8f04865f18e13aeaa0a36784156059f1b5ced75a44f74afc4d"
+
+SRC_URI[sha256sum] = "77e94acf7085c23ab20b2d0d2d4d2bc5a289f121fc7aac5d0daffb960041fd95"
 
 # default netdata.conf for netdata configuration
-SRC_URI += "file://netdata.conf"
+SRC_URI:append = " file://netdata.conf"
 
 # file for providing systemd service support
-SRC_URI += "file://netdata.service"
+SRC_URI:append = " file://netdata.service"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/tags"
 UPSTREAM_CHECK_REGEX = "${BPN}/releases/tag/v(?P<pver>\d+(?:\.\d+)*)"
-- 
2.39.2


