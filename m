Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25501C3ABA0
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 17:53:24 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.119305.1726422798038386892
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Sep 2024 10:53:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NHDY09f8;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-378e5d4a80eso1189719f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 10:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726422796; x=1727027596; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWEPefkAS1bf9Cr6tJ+pFls/UG8b1bLaEK2FOL+w/4o=;
        b=NHDY09f8JtLDPk74szn6XNGQok5JZVGzAocBPo3PFRs/RSvkmfBjf3rJoBb2IN9xOH
         0xFPII/2Y5zG2vxMXi2GW19+l5F8vmPIsRCowNyVx7a3dZGZYO0Hj1RI4zPtkVXwRMw7
         lrhNQ3XII8FlH62Y1kTPwEwwkZVNYfvnClJbLnbw7IuQBLfvl0M0dpdJuwH+2cbwsBlJ
         JdNwF/zzQ2aX5kGCTDXO0CQpb6pRkaid9Cjbz72Qkrpf9WznFhSbeK4THywfvoZK2/jt
         GslVGJHU3OsA5BDiW3j4ofU254ar7/jsYWA01NWe8FZY3ECssrjVjSuqLg6g3f7xBYBR
         6iiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726422796; x=1727027596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VWEPefkAS1bf9Cr6tJ+pFls/UG8b1bLaEK2FOL+w/4o=;
        b=oLp6XiixloHh2HWG6AIZAde7ydHorR13uOxLjy7IKxLX9dnc8t4T/LTZnlQzFfmi7H
         3SLjKvpk69nIyzNKc9AN254W1UXA4W07wPxNUiSFyC84BQQZRk2DsK6kTxdgNqv4hDk/
         yKPNl7tjNwkBD7Le5ybnBLzgAyRtXNBQMBqUutXZ6OrfRYBdjSFoZ/cMC0UlnY1KL0Ci
         VT8/GWzIzeYLsvlP+ElCmRmma2iVan388BH25S8ChxQXynBawU1CxrBAmScJ3fXHOFg4
         OTNMjFVgiicj+a7ENdSgSK9FUmBeYfpMf+ZZKRWWIK+jOSduUlGf5j7+xI/SpWlH0IYt
         dKeg==
X-Gm-Message-State: AOJu0YzSZNR2+XX9BAwdw0tllR9rO3xGAkdAMMmTs1RZMoWEsP4tcXap
	/u5V/MkjRGm7Ck2nqQva73VivlSLo1GLxk/aVgZeaHzLJKL2LJR18luBxg==
X-Google-Smtp-Source: AGHT+IFWSNNIyQPhSlHkgOfvfS6lZ9IhVg2uwwqbkFq03kh5LQc/vViqKApv1+o2G55QohFJIj440Q==
X-Received: by 2002:adf:cd8e:0:b0:366:eade:bfbb with SMTP id ffacd0b85a97d-378c2d4c76dmr7572523f8f.46.1726422795347;
        Sun, 15 Sep 2024 10:53:15 -0700 (PDT)
Received: from localhost.localdomain (ptr-fij45qxtdobqrxrcewr.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:6021:e9a4:5aa0:257b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42da242736bsm53897005e9.40.2024.09.15.10.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 10:53:15 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [PATCH 1/1] netdata: enable Go-based plugins
Date: Sun, 15 Sep 2024 19:53:05 +0200
Message-Id: <20240915175305.3390769-2-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240915175305.3390769-1-jan.vermaete@gmail.com>
References: <20240915175305.3390769-1-jan.vermaete@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 17:53:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112310

Default enabled because netdata is transforming the plugins from Python to Go rapidly.

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../recipes-webadmin/netdata/netdata_1.47.1.bb  | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.47.1.bb b/meta-webserver/recipes-webadmin/netdata/netdata_1.47.1.bb
index e134c06b0..7d922dbca 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_1.47.1.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.47.1.bb
@@ -7,6 +7,17 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fc9b848046ef54b5eaee6071947abd24"
 
 DEPENDS += "json-c libuv libyaml util-linux zlib lz4"
 
+GO_ROOT = "${STAGING_LIBDIR}/go"
+export GO_ROOT
+#export GOPROXY = "https://proxy.golang.org,direct"
+
+# Workaround for network access issue during compile step
+# this needs to be fixed in the recipes buildsystem to move
+# this such that it can be accomplished during do_fetch task
+do_compile[network] = "1"
+
+INSANE_SKIP:${PN} += "already-stripped buildpaths"
+
 SRC_URI = "\
     https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BPN}-v${PV}.tar.gz \
     file://netdata.conf \
@@ -42,7 +53,7 @@ SYSTEMD_AUTO_ENABLE:${PN} = "enable"
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM:${PN} = "--system --no-create-home --home-dir ${localstatedir}/run/netdata --user-group netdata"
 
-PACKAGECONFIG ??= "openssl freeipmi ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG ??= "openssl freeipmi ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} go"
 PACKAGECONFIG[brotli] = ",,brotli"
 PACKAGECONFIG[cloud] = "-DENABLE_CLOUD=ON,-DENABLE_CLOUD=OFF,"
 PACKAGECONFIG[openssl] = "-DENABLE_OPENSSL=ON,-DENABLE_OPENSSL=OFF,openssl"
@@ -53,8 +64,10 @@ PACKAGECONFIG[xenstat] = "-DENABLE_PLUGIN_XENSTAT=ON,-DENABLE_PLUGIN_XENSTAT=OFF
 PACKAGECONFIG[cups] = "-DENABLE_PLUGIN_CUPS=ON,-DENABLE_PLUGIN_CUPS=OFF,cups"
 PACKAGECONFIG[systemd] = "-DENABLE_PLUGIN_SYSTEMD_JOURNAL=ON,-DENABLE_PLUGIN_SYSTEMD_JOURNAL=OFF,systemd"
 
+PACKAGECONFIG[go] = "-DENABLE_PLUGIN_GO=ON,-DENABLE_PLUGIN_GO=OFF,go-native"
+
 # ebpf doesn't compile (or detect) the cross compilation well
-EXTRA_OECMAKE += "-DENABLE_PLUGIN_EBPF=OFF -DENABLE_PLUGIN_GO=OFF \
+EXTRA_OECMAKE += "-DENABLE_PLUGIN_EBPF=OFF \
                   -DENABLE_ACLK=OFF -DENABLE_EXPORTER_PROMETHEUS_REMOTE_WRITE=OFF -DCMAKE_INSTALL_PREFIX='${base_prefix}'"
 
 do_install:append() {
-- 
2.39.2


