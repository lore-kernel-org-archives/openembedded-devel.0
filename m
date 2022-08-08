Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1368AC25B08
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 14:25:19 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web12.26242.1659968711232821746
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RAvwD4tp;
 spf=pass (domain: gmail.com, ip: 209.85.214.175,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id x23so8706021pll.7
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0sBxPiwAONBPcBBObMtS3BDX5DtvObXZeOafqZgYvDM=;
        b=RAvwD4tpx7/40MRE8WIFVE8DAXkeD7q9ht6yTOVudc+nbsjNeQfTjXtXy8mKjSSHjw
         12/tipfrUhLp+RIJR/G0mS8W8QBJ44KB8VKn9a+Sscx65wtJGcHfIzqXJlg4dPQaVFBa
         3XjBcIT8rnhLYQ6cUcUEqaIn6uhCS+n2+oxK/hWb3RCPSgwwq3iQT6JX664wqx6wT3Dz
         xG6TGKLlJg6JJRwok8I/iclqmcFJDQsa0uTb5jLBkEeu0AV+/IUAd2b8kC4kvAKZlBOB
         7umVTr3iTSgCegbyQlnpQnB2/WzGcck7Y1hVcJqGQ4mdSxE2CazfL+GEpyPCHXcigvoj
         Ph3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0sBxPiwAONBPcBBObMtS3BDX5DtvObXZeOafqZgYvDM=;
        b=3yyMka/gMv4jr5aWKbePBwRfoyUk3oroLSKN/i0hkm37aKkGQJWQ+/ip7+7/gTR9P0
         iBKW+khMxvhve0BkD1ipdbVZgMgB0FrmnTgJmEUF8LdKELgn7yo76WkEw9QUqVRJVH7f
         SSnPrBIshB50iBDhn8Fzty8rrkE7vlriyNfTdiq+4BSYA7h839TQAY7Xq61k7pA3RbN5
         eygqbBux+NWqmqu7Cs/V7vSM6KAQg02fXt6FMUogbFfjjlbSKIEQ1qbxEIamH1hVXSRV
         Qqrg+4FQ7McaFEGoER9GfMtA467k0ye7PTpTaXeSXNB5cYMGI8OVcPiQdyUsuGzJ7pJJ
         e5mA==
X-Gm-Message-State: ACgBeo2rG9L4eWiU/GqGZp5B1VHt56ZESXchuKrSUi4GucNWGk7e58/E
	N886t0NyB1t2rXSGKWBTUk8yhX9E+50=
X-Google-Smtp-Source: 
 AA6agR4cYdsXnE9e14dDKpkqo5jRMt9M3TeP316kTxyWKyNA9c8Mg1hnT9zz4nnqZci3pngfoVu+dQ==
X-Received: by 2002:a17:902:f688:b0:16f:4b4:fc18 with SMTP id
 l8-20020a170902f68800b0016f04b4fc18mr18405853plg.49.1659968710125;
        Mon, 08 Aug 2022 07:25:10 -0700 (PDT)
Received: from keaua.caveonetworks.com (c-67-181-203-136.hsd1.ca.comcast.net.
 [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 u8-20020a1709026e0800b0016f1204cde8sm8757492plk.301.2022.08.08.07.25.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 07:25:09 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 08/13] postgresql: Fix the buildpaths issue
Date: Mon,  8 Aug 2022 07:22:47 -0700
Message-Id: 
 <fe7250a321829e9ea96a185ae31e6c6307dfa25d.1659968069.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659968069.git.akuster808@gmail.com>
References: <cover.1659968069.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Aug 2022 14:25:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98168

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  WARNING: postgresql-14.4-r0 do_package_qa: QA Issue: File /usr/bin/postgres in package postgresql contains reference to TMPDIR
  File /usr/bin/pg_config in package postgresql contains reference to TMPDIR [buildpaths]
  WARNING: postgresql-14.4-r0 do_package_qa: QA Issue: File /usr/include/pg_config.h in package libpq-dev contains reference to TMPDIR [buildpaths]
  WARNING: postgresql-14.4-r0 do_package_qa: QA Issue: File /usr/include/postgresql/server/pg_config.h in package postgresql-server-dev contains reference to TMPDIR
  File /usr/lib/postgresql/pgxs/src/Makefile.global in package postgresql-server-dev contains reference to TMPDIR [buildpaths]
  WARNING: postgresql-14.4-r0 do_package_qa: QA Issue: File /usr/lib/libpgcommon.a in package postgresql-staticdev contains reference to TMPDIR
  File /usr/lib/libpgcommon_shlib.a in package postgresql-staticdev contains reference to TMPDIR [buildpaths]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 59eff6269c4f4c150d976054d585872c92f20207)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...-config_info.c-not-expose-build-info.patch | 110 ++++++++++++++++++
 meta-oe/recipes-dbs/postgresql/postgresql.inc |   8 ++
 .../recipes-dbs/postgresql/postgresql_14.4.bb |   1 +
 3 files changed, 119 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/postgresql/files/0001-config_info.c-not-expose-build-info.patch

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-config_info.c-not-expose-build-info.patch b/meta-oe/recipes-dbs/postgresql/files/0001-config_info.c-not-expose-build-info.patch
new file mode 100644
index 0000000000..101a748776
--- /dev/null
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-config_info.c-not-expose-build-info.patch
@@ -0,0 +1,110 @@
+From b92eebe8b0760fee7bd55c6c22318620c2c07579 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Mon, 1 Aug 2022 15:44:38 +0800
+Subject: [PATCH] config_info.c: not expose build info
+
+Don't collect the build information to fix the buildpaths issue.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ configure.ac             |  2 +-
+ src/common/config_info.c | 68 ----------------------------------------
+ 2 files changed, 1 insertion(+), 69 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0eb595b..508487b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -23,7 +23,7 @@ AC_COPYRIGHT([Copyright (c) 1996-2021, PostgreSQL Global Development Group])
+ AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
+ AC_CONFIG_AUX_DIR(config)
+ AC_PREFIX_DEFAULT(/usr/local/pgsql)
+-AC_DEFINE_UNQUOTED(CONFIGURE_ARGS, ["$ac_configure_args"], [Saved arguments from configure])
++AC_DEFINE_UNQUOTED(CONFIGURE_ARGS, ["ac_configure_args"], [Saved arguments from configure])
+ 
+ [PG_MAJORVERSION=`expr "$PACKAGE_VERSION" : '\([0-9][0-9]*\)'`]
+ [PG_MINORVERSION=`expr "$PACKAGE_VERSION" : '.*\.\([0-9][0-9]*\)'`]
+diff --git a/src/common/config_info.c b/src/common/config_info.c
+index e72e729..b482c20 100644
+--- a/src/common/config_info.c
++++ b/src/common/config_info.c
+@@ -123,74 +123,6 @@ get_configdata(const char *my_exec_path, size_t *configdata_len)
+ 	configdata[i].setting = pstrdup(path);
+ 	i++;
+ 
+-	configdata[i].name = pstrdup("CONFIGURE");
+-	configdata[i].setting = pstrdup(CONFIGURE_ARGS);
+-	i++;
+-
+-	configdata[i].name = pstrdup("CC");
+-#ifdef VAL_CC
+-	configdata[i].setting = pstrdup(VAL_CC);
+-#else
+-	configdata[i].setting = pstrdup(_("not recorded"));
+-#endif
+-	i++;
+-
+-	configdata[i].name = pstrdup("CPPFLAGS");
+-#ifdef VAL_CPPFLAGS
+-	configdata[i].setting = pstrdup(VAL_CPPFLAGS);
+-#else
+-	configdata[i].setting = pstrdup(_("not recorded"));
+-#endif
+-	i++;
+-
+-	configdata[i].name = pstrdup("CFLAGS");
+-#ifdef VAL_CFLAGS
+-	configdata[i].setting = pstrdup(VAL_CFLAGS);
+-#else
+-	configdata[i].setting = pstrdup(_("not recorded"));
+-#endif
+-	i++;
+-
+-	configdata[i].name = pstrdup("CFLAGS_SL");
+-#ifdef VAL_CFLAGS_SL
+-	configdata[i].setting = pstrdup(VAL_CFLAGS_SL);
+-#else
+-	configdata[i].setting = pstrdup(_("not recorded"));
+-#endif
+-	i++;
+-
+-	configdata[i].name = pstrdup("LDFLAGS");
+-#ifdef VAL_LDFLAGS
+-	configdata[i].setting = pstrdup(VAL_LDFLAGS);
+-#else
+-	configdata[i].setting = pstrdup(_("not recorded"));
+-#endif
+-	i++;
+-
+-	configdata[i].name = pstrdup("LDFLAGS_EX");
+-#ifdef VAL_LDFLAGS_EX
+-	configdata[i].setting = pstrdup(VAL_LDFLAGS_EX);
+-#else
+-	configdata[i].setting = pstrdup(_("not recorded"));
+-#endif
+-	i++;
+-
+-	configdata[i].name = pstrdup("LDFLAGS_SL");
+-#ifdef VAL_LDFLAGS_SL
+-	configdata[i].setting = pstrdup(VAL_LDFLAGS_SL);
+-#else
+-	configdata[i].setting = pstrdup(_("not recorded"));
+-#endif
+-	i++;
+-
+-	configdata[i].name = pstrdup("LIBS");
+-#ifdef VAL_LIBS
+-	configdata[i].setting = pstrdup(VAL_LIBS);
+-#else
+-	configdata[i].setting = pstrdup(_("not recorded"));
+-#endif
+-	i++;
+-
+ 	configdata[i].name = pstrdup("VERSION");
+ 	configdata[i].setting = pstrdup("PostgreSQL " PG_VERSION);
+ 	i++;
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index 00c0107469..bef33e6bb4 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -215,6 +215,14 @@ do_install:append() {
     install -m 0644 ${WORKDIR}/postgresql.service ${D}${systemd_unitdir}/system
     sed -i -e 's,@BINDIR@,${bindir},g' \
         ${D}${systemd_unitdir}/system/postgresql.service
+    # Remove the build path
+    if [ -f ${D}${libdir}/${BPN}/pgxs/src/Makefile.global ]; then
+        sed -i -e 's#${RECIPE_SYSROOT}##g' \
+               -e 's#${RECIPE_SYSROOT_NATIVE}##g' \
+               -e 's#${WORKDIR}##g' \
+               -e 's#${TMPDIR}##g' \
+             ${D}${libdir}/${BPN}/pgxs/src/Makefile.global
+    fi
 }
 
 SSTATE_SCAN_FILES += "Makefile.global"
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_14.4.bb b/meta-oe/recipes-dbs/postgresql/postgresql_14.4.bb
index 64e83b2cde..1daab22f92 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_14.4.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_14.4.bb
@@ -8,6 +8,7 @@ SRC_URI += "\
    file://0001-Improve-reproducibility.patch \
    file://0001-configure.ac-bypass-autoconf-2.69-version-check.patch \
    file://remove_duplicate.patch \
+   file://0001-config_info.c-not-expose-build-info.patch \
 "
 
 SRC_URI[sha256sum] = "c23b6237c5231c791511bdc79098617d6852e9e3bdf360efd8b5d15a1a3d8f6a"
-- 
2.25.1


