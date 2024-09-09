Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A57ECE581
	for <webhook@archiver.kernel.org>; Mon,  9 Sep 2024 15:04:35 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.55364.1725894268177039088
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Sep 2024 08:04:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bIwUm6Nj;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3e049185cfeso380074b6e.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Sep 2024 08:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725894267; x=1726499067; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFzm6pocBOb5YrygHBJKAJJrAa868vSMT7reO9FA+MI=;
        b=bIwUm6NjpCilnkdkgfwZTTHjHcqxwI9aITeUTpiUsrq5pGyQEZs0DP74XmiXhajuqb
         q3okg7q5H9tgA9NElYscuYXkgHyA5gt6E+zSArQ5zmrXtXlZV/Ekt29nYAZvvs8ouiAE
         RrsT+pLGEQBziO/oHi+Q7G7y6eqKXK6IXXSiNX+nszma7h2qfFsWiv18AeAMIgNMB3Fp
         2i11WPJ+i9QQ8Y8rgOlETtEeO28iUblg46yEGDXwPf4SMJqbuqCD/pKon8N26I8WmVU1
         H9A6PjM2Aj5+XoGjJQ/dk7zWZcatMOhEoYOSQQ5kxd7Nx+uiro9yi58Fm9BZMhRzXuf4
         I0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725894267; x=1726499067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FFzm6pocBOb5YrygHBJKAJJrAa868vSMT7reO9FA+MI=;
        b=dlG5jRsoPZmpREaH9/s7ihnd9yHBcF314gzjfa+bj4amEA3ncT/sRkQYAQ+eQi02mw
         nRjVBm5Xp2Rj9bj+QHUfSUPEiyh3pHNynzLP/GwmBDrj7uTRHZURAa6jgoPkzIZI0rLB
         ENaW4IskXZdf1ktLbGatCUtmgGepJXuCwovPnYcDHnY9u3dcQTasFyGGkwDZe/1oSx27
         matuCftL4W4cCCXm5JAXP4oG1t/bkild1GOoAOtBL+94wNC3kEk1hnM3GXuSRgRbiNw8
         DXs8y8K/owYg7ov5r1xN/cmRzmgoc3lbqwRqeXkIMM8VDpBDV04ZhrvRVio4FJlJMRIh
         UNeQ==
X-Gm-Message-State: AOJu0YzfQnuVyd8hisCj9tm5P19JlBlUz0V5oPWT85egrQRwW5X19qeg
	PZ4/gCdOVGvtRnLwnHxQg2PEA6ooLu5nBrvSKjV9hZMtxoUV6ZiNDcDmryoA
X-Google-Smtp-Source: AGHT+IGEXwOnl36x/qV6QxGFTXIndkhSfDbe/+72mv+3mhML6LI2DtRuJIM7jA2qD3cDMNtFh9pxNw==
X-Received: by 2002:a05:6870:4714:b0:26c:5312:a13b with SMTP id 586e51a60fabf-27b82f963demr12470550fac.30.1725894266957;
        Mon, 09 Sep 2024 08:04:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4cdb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d825ba6b4dsm4063182a12.94.2024.09.09.08.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 08:04:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-webserver][PATCH 2/3] netdata: Upgrade to 1.47.0
Date: Mon,  9 Sep 2024 08:04:22 -0700
Message-ID: <20240909150423.4157986-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909150423.4157986-1-raj.khem@gmail.com>
References: <20240909150423.4157986-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Sep 2024 15:04:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112180

Disable go plugins as we need some work to enable them.
Convert to cmake build system

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../netdata/netdata/netdata-volatiles.conf    |  5 ++++
 .../{netdata_1.44.3.bb => netdata_1.47.0.bb}  | 27 ++++++++++++-------
 2 files changed, 23 insertions(+), 9 deletions(-)
 create mode 100644 meta-webserver/recipes-webadmin/netdata/netdata/netdata-volatiles.conf
 rename meta-webserver/recipes-webadmin/netdata/{netdata_1.44.3.bb => netdata_1.47.0.bb} (66%)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata/netdata-volatiles.conf b/meta-webserver/recipes-webadmin/netdata/netdata/netdata-volatiles.conf
new file mode 100644
index 0000000000..f342542077
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/netdata/netdata/netdata-volatiles.conf
@@ -0,0 +1,5 @@
+d /run/netdata     0755 netdata netdata -
+d /var/cache/netdata     0755 netdata netdata -
+d /var/lib/netdata/cloud.d     0755 netdata netdata -
+d /var/lib/netdata/registry     0755 netdata netdata -
+d /var/log/netdata     0755 netdata netdata -
diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.44.3.bb b/meta-webserver/recipes-webadmin/netdata/netdata_1.47.0.bb
similarity index 66%
rename from meta-webserver/recipes-webadmin/netdata/netdata_1.44.3.bb
rename to meta-webserver/recipes-webadmin/netdata/netdata_1.47.0.bb
index b06a5df314..f9c203457e 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_1.44.3.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.47.0.bb
@@ -5,15 +5,15 @@ HOMEPAGE = "https://github.com/netdata/netdata/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc9b848046ef54b5eaee6071947abd24"
 
-DEPENDS += "json-c libuv libyaml util-linux zlib "
+DEPENDS += "json-c libuv libyaml util-linux zlib lz4"
 
 SRC_URI = "\
     https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BPN}-v${PV}.tar.gz \
     file://netdata.conf \
     file://netdata.service \
+    file://netdata-volatiles.conf \
 "
-
-SRC_URI[sha256sum] = "50df30a9aaf60d550eb8e607230d982827e04194f7df3eba0e83ff7919270ad2"
+SRC_URI[sha256sum] = "6735222ffcff941508b92c8edddc26fbcd719b15880be4911d77fbfd9dbd9a1d"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/tags"
 UPSTREAM_CHECK_REGEX = "${BPN}/releases/tag/v(?P<pver>\d+(?:\.\d+)*)"
@@ -23,7 +23,7 @@ S = "${WORKDIR}/${BPN}-v${PV}"
 # Stop sending anonymous statistics to Google Analytics
 NETDATA_ANONYMOUS ??= "enabled"
 
-inherit pkgconfig autotools-brokensep useradd systemd
+inherit pkgconfig cmake useradd systemd
 
 LIBS:toolchain-clang:x86 = "-latomic"
 LIBS:riscv64 = "-latomic"
@@ -40,23 +40,32 @@ SYSTEMD_AUTO_ENABLE:${PN} = "enable"
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM:${PN} = "--system --no-create-home --home-dir ${localstatedir}/run/netdata --user-group netdata"
 
-PACKAGECONFIG ??= "openssl"
-PACKAGECONFIG[cloud] = "--enable-cloud, --disable-cloud,"
-PACKAGECONFIG[lz4] = "--enable-lz4, --disable-lz4, lz4"
-PACKAGECONFIG[openssl] = "--enable-openssl, --disable-openssl, openssl"
+PACKAGECONFIG ??= "openssl freeipmi ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG[brotli] = ",,brotli"
+PACKAGECONFIG[cloud] = "-DENABLE_CLOUD=ON,-DENABLE_CLOUD=OFF,"
+PACKAGECONFIG[openssl] = "-DENABLE_OPENSSL=ON,-DENABLE_OPENSSL=OFF,openssl"
+PACKAGECONFIG[freeipmi] = "-DENABLE_PLUGIN_FREEIPMI=ON,-DENABLE_PLUGIN_FREEIPMI=OFF,freeipmi"
+PACKAGECONFIG[nfacct] = "-DENABLE_PLUGIN_NFACCT=ON,-DENABLE_PLUGIN_NFACCT=OFF,libmnl"
+# needs meta-virtualization
+PACKAGECONFIG[xenstat] = "-DENABLE_PLUGIN_XENSTAT=ON,-DENABLE_PLUGIN_XENSTAT=OFF,xen-tools"
+PACKAGECONFIG[cups] = "-DENABLE_PLUGIN_CUPS=ON,-DENABLE_PLUGIN_CUPS=OFF,cups"
+PACKAGECONFIG[systemd] = "-DENABLE_PLUGIN_SYSTEMD_JOURNAL=ON,-DENABLE_PLUGIN_SYSTEMD_JOURNAL=OFF,systemd"
 
 # ebpf doesn't compile (or detect) the cross compilation well
-EXTRA_OECONF += "--disable-ebpf"
+EXTRA_OECMAKE += "-DENABLE_PLUGIN_EBPF=OFF -DENABLE_PLUGIN_GO=OFF \
+                  -DENABLE_ACLK=OFF -DENABLE_EXPORTER_PROMETHEUS_REMOTE_WRITE=OFF -DCMAKE_INSTALL_PREFIX='${base_prefix}'"
 
 do_install:append() {
     #set S UID for plugins
     chmod 4755 ${D}${libexecdir}/netdata/plugins.d/apps.plugin
+    rm -rf ${D}/${localstatedir}/
 
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         # Install systemd unit files
         install -d ${D}${systemd_unitdir}/system
         install -m 0644 ${UNPACKDIR}/netdata.service ${D}${systemd_unitdir}/system
         sed -i -e 's,@@datadir,${datadir_native},g' ${D}${systemd_unitdir}/system/netdata.service
+        install -Dm 0644 ${UNPACKDIR}/netdata-volatiles.conf ${D}${sysconfdir}/tmpfiles.d/netdata.conf
     fi
 
     # Install default netdata.conf

