Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F44C369C2
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 06:21:54 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.44204.1746426111269713895
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 May 2025 23:21:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DOw8BpLy;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7398d65476eso3155177b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 May 2025 23:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746426110; x=1747030910; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EOrNLcf7+1zBj1ANNlI+E5GZwhA8DZ7VjBNYUt15WEA=;
        b=DOw8BpLyjkQQgDYTE6W3PAyaplDgYCb4yuBPkvuRNfslHIozPxoF08uvS81CHRZ78z
         JCV1d9ph0uHSY5RpjIqcBeklXW/T3BXo8FgCUVGo0exdxbElbUCaqFi0g9NYrkxpy4Na
         /G/NwbL+yAMW20Cw6QN+w2D1SZOGvwsWfvxXk50k3iG7N1o5pFuwu7pbNNt4hbwPiIGb
         zCR7yTmZ2Vsne7mu13/hUxs3kDarrdoDwcXSB0485O/Viwfp4qCCfnAg+TyCVokFHm/E
         gwuZnquK2FBNu/TMgdPKmqZdfoO4NUx5Xvz2ALl6tvv6h6uWMnI0gMkX6yG7mQyXofS3
         2q6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746426110; x=1747030910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOrNLcf7+1zBj1ANNlI+E5GZwhA8DZ7VjBNYUt15WEA=;
        b=Cgjn2RMoneti7b6P2gB/0PCDFieQlPOdncJLCe7Txao5fNQ1EeobcGDAh+FyXNhrva
         u1lXvqaB81Fw56o1LbTaDugIhDgUPeuu05y0MXO/TrK7fFMGxWmcdbzfthViUD60B5kc
         ++dbNe92LDCmcpsM0ckCWtmLEMJNH9KBs7WuzjxiNWS+kuCt6zZy8oWZScoT0WKzinPK
         /vYrcud+GoYPkFTiRObquyFQltw/5hSaSx/uLgUM85uJBUY3vV45dTIGOpO7EiifLwXr
         c//2utyvkJnBA+rfxF06FJ8iBSwlURK/UPxD9XpjCPS7HIgwdC86jFElpS8vWHGR27s/
         PnAA==
X-Gm-Message-State: AOJu0Yzym+lS080hKcBeET8nBV5lJ8cFIc7bosRzyZgkp+DVH3bhpiKT
	OMMnVwV2lnYmtIYMsP3zat4vG81HTm++INXpxKrC52ZCOJdqeQ8oMUsBhI65
X-Gm-Gg: ASbGncvVeFkgF5p14BaQArfGFeEW3Uz+IiRcJNjHk9I3CjJbBU1OmfFZ1t4hEYwWa/K
	jas2RYQlzD/PwHEwJ1SXtI6EGOFzBEfzLeuhDr/8sm9QLXG/e5PgaXt6PfIEuh7al742LDOzVaK
	AzTag8OLF9iKK5vhKwAZF/ADq0l33aOCZ11UtdnUZmgKebzFj2rbOUv6HW1uvojdd7PSYrDezpc
	9DDpiZP3s/4z+6q0oubC7soWCOlQ079AwCLIYmXs+xg6nTxD3gpGrfCHtO47eBmKept83ak84Wi
	c6bQoMWyBwNnKWUwDaGWV1IvkD5hYk89
X-Google-Smtp-Source: AGHT+IHohpl+JPorJWq65CY5LXCshTXgJ2eVXfEjtn/yuULAIXJpX9yDweY7z3pMBDREPSTdnsBcYg==
X-Received: by 2002:aa7:8542:0:b0:727:39a4:30cc with SMTP id d2e1a72fcca58-7404917164dmr19142344b3a.1.1746426110358;
        Sun, 04 May 2025 23:21:50 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058d7b1cdsm5952352b3a.25.2025.05.04.23.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 23:21:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 7/7] pcp: Upgrade to 6.3.7 release
Date: Sun,  4 May 2025 23:21:42 -0700
Message-ID: <20250505062142.3478500-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250505062142.3478500-1-raj.khem@gmail.com>
References: <20250505062142.3478500-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 06:21:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117296

* Fix packaging scripts needing bash separately
* Fix packaging QA errors about staticlibs and dev-so
* Add a patch to use native pmcpp during target build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...cp-native_6.0.5.bb => pcp-native_6.3.7.bb} |  3 +-
 meta-oe/recipes-support/pcp/pcp.inc           |  6 ++--
 ...1-bind2-Use-pmcpp-from-native-builds.patch | 30 ++++++++++++++++
 ...ndency-order-of-header-and-sourcefil.patch | 11 ++----
 .../pcp/{pcp_6.0.5.bb => pcp_6.3.7.bb}        | 36 ++++++++++++++-----
 5 files changed, 65 insertions(+), 21 deletions(-)
 rename meta-oe/recipes-support/pcp/{pcp-native_6.0.5.bb => pcp-native_6.3.7.bb} (93%)
 create mode 100644 meta-oe/recipes-support/pcp/pcp/0001-bind2-Use-pmcpp-from-native-builds.patch
 rename meta-oe/recipes-support/pcp/{pcp_6.0.5.bb => pcp_6.3.7.bb} (89%)

diff --git a/meta-oe/recipes-support/pcp/pcp-native_6.0.5.bb b/meta-oe/recipes-support/pcp/pcp-native_6.3.7.bb
similarity index 93%
rename from meta-oe/recipes-support/pcp/pcp-native_6.0.5.bb
rename to meta-oe/recipes-support/pcp/pcp-native_6.3.7.bb
index 2f37b099b4..806ef668e2 100644
--- a/meta-oe/recipes-support/pcp/pcp-native_6.0.5.bb
+++ b/meta-oe/recipes-support/pcp/pcp-native_6.3.7.bb
@@ -44,5 +44,6 @@ do_install () {
     PCP_LIBADM_DIR=${D}/${libdir} \
     PCP_LIB_DIR=${D}/${libdir} \
     PCP_MAN_DIR=${D}/${mandir} \
-    PCP_DOC_DIR=${D}/${docdir} 
+    PCP_DOC_DIR=${D}/${docdir} \
+    PCP_SYSTEMDUNIT_DIR=${D}${systemd_system_unitdir}
 }
diff --git a/meta-oe/recipes-support/pcp/pcp.inc b/meta-oe/recipes-support/pcp/pcp.inc
index 5ed2d220f0..4ab4f5502f 100644
--- a/meta-oe/recipes-support/pcp/pcp.inc
+++ b/meta-oe/recipes-support/pcp/pcp.inc
@@ -7,13 +7,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=37ab75b580d5aad4ada04260efa3702f \
                     "
 COMPATIBLE_HOST:libc-musl = "null"
 
-SRC_URI = "git://github.com/performancecopilot/pcp;branch=main;protocol=https \
+SRC_URI = "git://github.com/performancecopilot/pcp;branch=stable;protocol=https \
            file://0001-configure-Limit-the-header-search-to-sysroot.patch \
            file://0001-htop-Change-dependency-order-of-header-and-sourcefil.patch \
            file://config.linux \
 	   "
 
-SRCREV = "c13558fd0df54438cbb87cf303dc279cb58816c2"
+SRCREV = "d8d97b79ee47d9dfb076a3242564ed3cae04eba9"
 
 S = "${WORKDIR}/git"
 
@@ -39,5 +39,3 @@ EXTRA_OECONF:append = "\
 PACKAGECONFIG[qt5] = "--with-qt=yes --with-qt3d=yes,--with-qt=no --with-qt3d=no,qtbase qt3d"
 
 PACKAGECONFIG ?= ""
-
-PARALLEL_MAKE = ""
diff --git a/meta-oe/recipes-support/pcp/pcp/0001-bind2-Use-pmcpp-from-native-builds.patch b/meta-oe/recipes-support/pcp/pcp/0001-bind2-Use-pmcpp-from-native-builds.patch
new file mode 100644
index 0000000000..32b9252542
--- /dev/null
+++ b/meta-oe/recipes-support/pcp/pcp/0001-bind2-Use-pmcpp-from-native-builds.patch
@@ -0,0 +1,30 @@
+From 4c79ea13b8456155e1acd6a53a2586b6c2c32e05 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 3 May 2025 14:27:30 -0700
+Subject: [PATCH] bind2: Use pmcpp from native builds
+
+This is needed for cross compiling. Fixes
+| ./mk.rewrite
+| ./mk.rewrite: line 41: ../../pmcpp/pmcpp.static: No such file or directory
+| Error: pmcpp failed
+| make[3]: *** [GNUmakefile:54: rewrite.conf] Error 1
+
+Upstream-Status: Inappropriate [Cross-compiling specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/pmdas/bind2/mk.rewrite | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/pmdas/bind2/mk.rewrite b/src/pmdas/bind2/mk.rewrite
+index 36e8dc1e61..142a75a824 100755
+--- a/src/pmdas/bind2/mk.rewrite
++++ b/src/pmdas/bind2/mk.rewrite
+@@ -38,7 +38,7 @@ inlist == 1		{ print }' \
+     -e 's/[ 	][ 	]*\([0-9][0-9]*\)/ { pmid -> BIND2.0.\1 }/' \
+ ) >$tmp.tmp
+ 
+-if PCP_CONF=../../include/pcp.conf ../../pmcpp/pmcpp.static -P <$tmp.tmp >>rewrite.conf
++if PCP_CONF=../../include/pcp.conf pmcpp -P <$tmp.tmp >>rewrite.conf
+ then
+     :
+ else
diff --git a/meta-oe/recipes-support/pcp/pcp/0001-htop-Change-dependency-order-of-header-and-sourcefil.patch b/meta-oe/recipes-support/pcp/pcp/0001-htop-Change-dependency-order-of-header-and-sourcefil.patch
index 009dfe2d04..2915d48f04 100644
--- a/meta-oe/recipes-support/pcp/pcp/0001-htop-Change-dependency-order-of-header-and-sourcefil.patch
+++ b/meta-oe/recipes-support/pcp/pcp/0001-htop-Change-dependency-order-of-header-and-sourcefil.patch
@@ -16,14 +16,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/pcp/htop/GNUmakefile | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/src/pcp/htop/GNUmakefile b/src/pcp/htop/GNUmakefile
-index 6b7c0c5..5153c63 100644
 --- a/src/pcp/htop/GNUmakefile
 +++ b/src/pcp/htop/GNUmakefile
-@@ -186,8 +186,8 @@ CFGMETERS = $(patsubst %,pcp/meters/%,$(METERS))
- CFGCOLUMNS = $(patsubst %,pcp/columns/%,$(COLUMNS))
+@@ -210,8 +210,8 @@ CFGCOLUMNS = $(patsubst %,pcp/columns/%,
+ CFGSCREENS = $(patsubst %,pcp/screens/%,$(SCREENS))
  
- CFGXFILES = $(CFGMETERS) $(CFGCOLUMNS)
+ CFGXFILES = $(CFGMETERS) $(CFGCOLUMNS) $(CFGSCREENS)
 -TOPXFILES = $(TOPCFILES) $(TOPHFILES) $(DOCFILES)
 -SUBXFILES = $(SUBCFILES) $(SUBHFILES)
 +TOPXFILES = $(TOPHFILES) $(TOPCFILES) $(DOCFILES)
@@ -31,6 +29,3 @@ index 6b7c0c5..5153c63 100644
  CFILES = $(TOPCFILES) $(SUBCFILES)
  HFILES = $(TOPHFILES) $(SUBHFILES)
  LDIRT = $(TOPXFILES) $(SUBXFILES) $(CFGXFILES) \
--- 
-2.41.0
-
diff --git a/meta-oe/recipes-support/pcp/pcp_6.0.5.bb b/meta-oe/recipes-support/pcp/pcp_6.3.7.bb
similarity index 89%
rename from meta-oe/recipes-support/pcp/pcp_6.0.5.bb
rename to meta-oe/recipes-support/pcp/pcp_6.3.7.bb
index ce8957714e..c390b9eec2 100644
--- a/meta-oe/recipes-support/pcp/pcp_6.0.5.bb
+++ b/meta-oe/recipes-support/pcp/pcp_6.3.7.bb
@@ -13,12 +13,16 @@ DEPENDS += "perl-native bison-native flex-native python3-native python3-setuptoo
 SRC_URI += "file://0001-Remove-unsuitble-part-for-cross-compile.patch \
             file://pass-options-to-AR.patch \
             file://fix_parallel_make.patch \
+			file://0001-bind2-Use-pmcpp-from-native-builds.patch \
            "
 
 export PCP_DIR = "${RECIPE_SYSROOT_NATIVE}"
 #export PCP_RUN_DIR = "${RECIPE_SYSROOT_NATIVE}"
-EXTRA_OEMAKE = "CC="${CC}" LD="${LD}""
-inherit useradd systemd features_check python3targetconfig
+EXTRA_OEMAKE = '\
+	CC="${CC}" LD="${LD}" CROSS_COMPILING="yes" \
+    PCP_SYSTEMDUNIT_DIR=${systemd_system_unitdir} \
+'
+inherit useradd systemd features_check python3targetconfig gtk-icon-cache
 
 # Needs libx11
 REQUIRED_DISTRO_FEATURES = "x11"
@@ -48,6 +52,7 @@ USERADD_PARAM:${PN}-testsuite = "--system --home ${localstatedir}/lib/pcp/testsu
                        --user-group pcpqa"
 
 RDEPENDS:${PN} += "perl"
+RDEPENDS:${PN}-xsos += "${PN} bash"
 RDEPENDS:${PN}-testsuite += "${PN} bash perl"
 RDEPENDS:python3-${PN} += "${PN} python3"
 
@@ -69,6 +74,7 @@ do_compile:prepend() {
 		${S}/src/include/builddefs
 	sed -i -e "s,TOPDIR)/python3-pcp.list,TOPDIR)/python3-pcp.list --install-lib=${PYTHON_SITEPACKAGES_DIR},g" ${S}/src/python/GNUmakefile
 	export PYTHON=python3
+	export PATH=${PATH}:${RECIPE_SYSROOT_NATIVE}${libexecdir}/pcp/bin
 	#export PYTHON3=${STAGING_BINDIR_NATIVE}/python3-native/python3
 }
 
@@ -85,10 +91,6 @@ do_install () {
 	rm -rf ${D}${localstatedir}/lib/pcp/pmcd
 	rm -rf ${D}${localstatedir}/lib/pcp/tmp
 	rm -rf ${D}${localstatedir}/run
-	mv ${D}${docdir}/C* ${D}${docdir}/pcp-doc/
-	mv ${D}${docdir}/I* ${D}${docdir}/pcp-doc/
-	mv ${D}${docdir}/R* ${D}${docdir}/pcp-doc/
-	mv ${D}${docdir}/V* ${D}${docdir}/pcp-doc/
 	sed -i "s#PCP_AWK_PROG=.*#PCP_AWK_PROG=awk#" ${D}/${sysconfdir}/pcp.conf
 	sed -i "s#PCP_SORT_PROG=.*#PCP_SORT_PROG=sort#" ${D}/${sysconfdir}/pcp.conf
 	sed -i "s#PCP_ECHO_PROG=.*#PCP_ECHO_PROG=echo#" ${D}/${sysconfdir}/pcp.conf
@@ -99,7 +101,8 @@ do_install () {
 		-e 's#${TMPDIR}##g' ${D}${includedir}/pcp/builddefs
 }
 
-PACKAGES += " ${PN}-export-zabbix-agent ${PN}-testsuite \
+PACKAGE_BEFORE_PN = "${PN}-xsos"
+PACKAGES =+ " ${PN}-export-zabbix-agent ${PN}-testsuite \
 	libpcp-gui2  libpcp-gui2-dev \
 	libpcp-import1 libpcp-archive1 \
 	libpcp-mmv1 libpcp-mmv1-dev \
@@ -109,7 +112,7 @@ PACKAGES += " ${PN}-export-zabbix-agent ${PN}-testsuite \
 	libpcp3 libpcp3-dev python3-${PN}\
 "
 FILES:libpcp-gui2 = "${libdir}/libpcp_gui.so.2 \
-"	
+"
 FILES:libpcp-archive1 = "${libdir}/libpcp_archive.so.1 \
 "	
 FILES:libpcp-gui2-dev = " \
@@ -118,6 +121,8 @@ FILES:libpcp-gui2-dev = " \
 	${includedir}/pmafm.h \
 	${includedir}/pmtime.h \
 "
+INSANE_SKIP:libpcp-gui2-dev = "staticdev"
+
 FILES:libpcp-mmv1 = " \
 	${libdir}/libpcp_mmv.so.1 \
 "
@@ -130,6 +135,8 @@ FILES:libpcp-mmv1-dev = " \
 	${datadir}/man/man3/mmv_* \
 	${datadir}/man/man5/mmv.5.gz \
 "
+INSANE_SKIP:libpcp-mmv1-dev = "staticdev"
+
 FILES:libpcp-import1 = " \
 	${libdir}/libpcp_import.so.1 \
 "
@@ -145,6 +152,8 @@ FILES:libpcp-pmda3-dev = " \
 	${datadir}/man/man3/PMDA.3.gz \
 	${datadir}/man/man3/pmda* \
 "
+INSANE_SKIP:libpcp-pmda3-dev = "staticdev"
+
 FILES:libpcp-trace2 = " \
 	${libdir}/libpcp_trace.so.2 \
 "
@@ -155,6 +164,8 @@ FILES:libpcp-trace2-dev = " \
 	${libdir}/libpcp_trace.so \
 	${datadir}/man/man3/pmtrace* \
 "
+INSANE_SKIP:libpcp-trace2-dev = "staticdev"
+
 FILES:libpcp-web1 = " \
 	${libdir}/libpcp_web.so.1 \
 "
@@ -166,10 +177,15 @@ FILES:libpcp-web1-dev = " \
 	${datadir}/man/man3/pmhttp* \
 	${datadir}/man/man3/pmjson* \
 "
+INSANE_SKIP:libpcp-web1-dev = "staticdev"
+
 FILES:libpcp3 = " \
 	${libdir}/libpcp.so.3 \
 "
 
+FILES:${PN}-xsos = " \
+	${libexecdir}/pcp/bin/pcp-xsos \
+"
 FILES:${PN} = " \
 	${sysconfdir}/pcp \
 	${sysconfdir}/cron.d \
@@ -179,6 +195,7 @@ FILES:${PN} = " \
 	${datadir}/bash-completion \
 	${datadir}/pcp-gui \
 	${datadir}/zsh \
+	${datadir}/icons \
 	${systemd_system_unitdir}/ \
 	${libdir}/pcp/ \
 	${libdir}/sysusers.d/pcp.conf \
@@ -192,6 +209,7 @@ FILES:${PN} = " \
 	${localstatedir}/lib/pcp/pmdas/ \
 	${localstatedir}/lib/pcp/pmns \
 	${libdir}/libpcp_fault.so.3 \
+	${nonarch_libdir}/tmpfiles.d/pcp-reboot-init.conf \
 "
 
 FILES:${PN}-export-zabbix-agent += " \
@@ -200,6 +218,8 @@ FILES:${PN}-export-zabbix-agent += " \
 	${mandir}/man3/zbxpcp.3.gz \
 	${libdir}/zabbix \
 "
+INSANE_SKIP:${PN}-export-zabbix-agent = "dev-so"
+
 FILES:${PN}-testsuite = "${localstatedir}/lib/pcp/testsuite/ ${libdir}/sysusers.d/pcp-testsuite.conf"
 FILES:python3-${PN} = "${PYTHON_SITEPACKAGES_DIR}"
 FILES:${PN}-dev += " \

