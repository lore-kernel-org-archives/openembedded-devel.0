Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.7631.1621404076655829766
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 May 2021 23:01:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=qwM+jTy7;
 spf=pass (domain: linaro.org, ip: 209.85.221.43, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f43.google.com with SMTP id r12so12624355wrp.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 May 2021 23:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6wzZahy8IxUVpN1scpPJw1UQIz26tLiksCDunynrwL8=;
        b=qwM+jTy7HKdu2bFEH0CHuwJqvp8EbChRJsqs/jSDPhJdDb89oNmBExNNSibL3xAeMo
         nGRpOj3k2etzTfBrX3+p8KCQXnlm3klIm+XxKjda98xOzexnU9HA3bQ7NKSE53IOj/mL
         8qPC7VmRm1N8hrLLUbzihy8au2b/+d876/KTnfIUuoUeUu4OLSllgYuvehXs4LA/rAaq
         TMBtYVOSNBub0m45vQdAAexoT7Y0IKWfPh2XLS11SZRg9bHRVeLAitLPdKQCo7Tbtnfh
         My33rVs8NRrqWQudCvTrg/3NQnZS7qTH8B85UwJ8aKz7b2OMVmParf/dZIdVr6ARtuwu
         O8PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6wzZahy8IxUVpN1scpPJw1UQIz26tLiksCDunynrwL8=;
        b=c2+kAogE51xfMwqoeWF7nnoWmmskXtlG7pmF5AwFVYL23XaZmQ6d4TvqIWNPchi1fI
         QJpoIj68L+XRY1oZbM3DCpA7QajCt5+JUpYTsydHXRwyExNVcHi+oSNMnaXIyY5cL4ZO
         aUVrwZCHakgkeMJrfQ78+dx+BhU2qEVD7+Ukoyu11UoRoz6nMW2hUcp6As+zBJV9quLI
         sjr0ptoQZUpQwAvJ0VF5SZ1GKMMFhcFUEztZAYtEzbfNvmbBgbBmWSZe0m1z0HBz3RgJ
         ktGVMMeFg1NhgBPSevnoE+I1a+adidVrBNCVfIg1Fy8io7deiENEsUMnwqilvcRN+9S0
         wXrQ==
X-Gm-Message-State: AOAM530TdIAVQcwqC8jvvQc3StY+2vqK/zKLXUXWHjJJGCPKNpoONRla
	KKDdIV4rkrauKeBldP7ARmJ/0KQ7w+LDsA==
X-Google-Smtp-Source: ABdhPJy5V9KtxBikGpGWlhMPFgl0Ezwum7DpHbJ8XXzDOkGhzmZj/mgbunTZixgtzGQMXGHBy0f53Q==
X-Received: by 2002:a5d:4304:: with SMTP id h4mr12548393wrq.210.1621404074954;
        Tue, 18 May 2021 23:01:14 -0700 (PDT)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from qcom-hackbox.linaro.org.net (163-172-5-244.rev.poneytelecom.eu. [163.172.5.244])
        by smtp.gmail.com with ESMTPSA id c7sm14988846wrs.23.2021.05.18.23.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 23:01:14 -0700 (PDT)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [meta-oe][PATCH] sysbench: upgrade to 1.0.20
Date: Wed, 19 May 2021 08:00:41 +0200
Message-Id: <20210519060041.9004-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* Upstream moved to Github, let's use it for SRC_URI
* COPYING file was changed, but with no impact on license
* sysbench includes a copy of luajit project and it's compiled by
  default. However the internal copy of luajit won't cross compile
  properly, without patching it (it uses 'gcc'). So instead use the
  'system' luajit, e.g. the one package from OE (which is what most
  distro do anyways)
* Does not compile with different built folder. Lua generated files
  have things like that:
unsigned char __/__/__/__/sysbench-1_0_20/src/lua/internal/sysbench_lua[] =

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 ...{sysbench_0.4.12.bb => sysbench_1.0.20.bb} | 21 ++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-benchmark/sysbench/{sysbench_0.4.12.bb => sysbench_1.0.20.bb} (56%)

diff --git a/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb b/meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb
similarity index 56%
rename from meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb
rename to meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb
index 708c71f4f..555477ab0 100644
--- a/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb
+++ b/meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb
@@ -2,16 +2,17 @@ SUMMARY = "System performance benchmark"
 HOMEPAGE = "http://github.com/akopytov/sysbench"
 SECTION = "console/tests"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-inherit autotools
+DEPENDS = "luajit"
 
-# The project has moved from Sourceforge to Launchpad, to Github. Use the source tarball from
-# Launchpad until the next release is available from Github.
-SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+files/${BPN}_${PV}.orig.tar.gz"
+inherit autotools pkgconfig
 
-SRC_URI[md5sum] = "3a6d54fdd3fe002328e4458206392b9d"
-SRC_URI[sha256sum] = "83fa7464193e012c91254e595a89894d8e35b4a38324b52a5974777e3823ea9e"
+SRC_URI = "git://github.com/akopytov/${BPN}.git"
+
+SRCREV = "ebf1c90da05dea94648165e4f149abc20c979557"
+
+S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'largefile', d)}"
 PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
@@ -21,6 +22,12 @@ PACKAGECONFIG[mysql] = "--with-mysql \
                         --with-mysql-libs=${STAGING_LIBDIR}, \
                         --without-mysql,mysql5"
 
+# the internal luajit won't cross compile
+EXTRA_OECONF += "--with-system-luajit"
+
+# lua.h generated files are bogus when using B != S
+B = "${S}"
+
 do_configure_prepend() {
     touch ${S}/NEWS ${S}/AUTHORS
 }
-- 
2.29.2

