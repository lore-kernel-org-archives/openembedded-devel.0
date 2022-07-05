Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E94E8C43334
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 02:03:44 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web09.80057.1656986619801874003
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jul 2022 19:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VU/LF1Lw;
 spf=pass (domain: gmail.com, ip: 209.85.160.182,
 mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id r2so11877476qta.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jul 2022 19:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LR+Mnl9iaVSmyVpux8SDn6/nU12ZZ1pDzkHB4xWhmFA=;
        b=VU/LF1LwbJigbJBXlDT+QqAsAGDHpaS3GJtokEegT8dtQpFI2N2SFOlw34pc+SuVZM
         2Fkn6Yw5mVIovKS+XyboFpcAKNibFAq5VOWPbmd2p10mlnJaDlEdLRwRpolrfeJwOvJ8
         wiLsMhpWz4xcPNc49uip87Qx9saKrbMPbxR5oxgkGvx2H+pnvbTvdXhQR6QkghwlCojR
         yj+27YM5BA4Olyglf6jLgBAf+McBKzkXCcvEW0Zu4aoB7tpTxE0RIpdDjCrzDGLUyzdQ
         56cjzVbOli8TcwxF9oox4qaJLlxR1rj11lAtfeS1rqVYIp/1xaHU/C1Ln2gk1JG8llsk
         1naw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LR+Mnl9iaVSmyVpux8SDn6/nU12ZZ1pDzkHB4xWhmFA=;
        b=YaokRUk0bVajMGqkWxtW67ZMZRL2xli3gV2Spp7uc6ybt+ysWQeoNBdlocWKSlUGor
         o1HOVFkkjWWKAWXZpTcsm9fdQb/eKUE2ss6BK5Fyl1vSWz3dazS6xKUIdqN2PVK9BOos
         E8nHEf1TYnaxI2iHTI/RD3jpH/K6NSNg2nPGBMwej15wpBEg5V7HeAZ8BatNVryFYbnQ
         Tm3qtKgc5349LH6jcnl14OrmG6aw5GsLogWo42fBMclqShtBpVFUEVqSRgnZT/zX1Obg
         dim0OCCp8ZYFLGrMVn/OjPWR6izm6s7/7xg9T0BsSL8zbQ6aR/jig82GRp0vt/Vko/2X
         yiDQ==
X-Gm-Message-State: AJIora/sT5321S3fC7dZpetMMSoaUdWrc8yj6Hr2iT09M10tdvxxKGSm
	Z0YGmLATyjoXf88jIopaM78iRhznw88=
X-Google-Smtp-Source: 
 AGRyM1tI7IBYV6EN9FyP79vrItgSAWj6TeSnN//NAB55rySXeh6xzT8QlI6WWMNgevfO2ugMOLNAfw==
X-Received: by 2002:ad4:5ba7:0:b0:472:dea2:ee84 with SMTP id
 7-20020ad45ba7000000b00472dea2ee84mr11818153qvq.58.1656986618457;
        Mon, 04 Jul 2022 19:03:38 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:14b1:7390:8d3d:13ec:9f3e:a504])
        by smtp.gmail.com with ESMTPSA id
 br14-20020a05620a460e00b006a6ce613c7csm21725220qkb.89.2022.07.04.19.03.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 19:03:38 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 4/5] strongswan: upgrade 5.9.5 -> 5.9.6
Date: Mon,  4 Jul 2022 22:03:28 -0400
Message-Id: 
 <1cd38eed74a1e1700f83b65193e421e67bbf9aaa.1656986538.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656986538.git.akuster808@gmail.com>
References: <cover.1656986538.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Jul 2022 02:03:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97699

From: Yi Zhao <yi.zhao@windriver.com>

* Drop backport patch 0001-openssl-Don-t-unload-providers.patch

* Backport a patch to fix the build error:
src/libstrongswan/utils/enum.c: In function 'enum_flags_to_string':
src/libstrongswan/utils/enum.c:100:9: error: format not a string literal and no format arguments [-Werror=format-security]
  100 |         if (snprintf(buf, len, e->names[0]) >= len)
      |         ^~

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 689e8422b836d804d9ab102cb3de0a4f6e1f24c8)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0001-enum-Fix-compiler-warning.patch      | 31 +++++++
 .../0001-openssl-Don-t-unload-providers.patch | 92 -------------------
 ...trongswan_5.9.5.bb => strongswan_5.9.6.bb} |  4 +-
 3 files changed, 33 insertions(+), 94 deletions(-)
 create mode 100644 meta-networking/recipes-support/strongswan/files/0001-enum-Fix-compiler-warning.patch
 delete mode 100644 meta-networking/recipes-support/strongswan/files/0001-openssl-Don-t-unload-providers.patch
 rename meta-networking/recipes-support/strongswan/{strongswan_5.9.5.bb => strongswan_5.9.6.bb} (98%)

diff --git a/meta-networking/recipes-support/strongswan/files/0001-enum-Fix-compiler-warning.patch b/meta-networking/recipes-support/strongswan/files/0001-enum-Fix-compiler-warning.patch
new file mode 100644
index 0000000000..e730fe1cd0
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/files/0001-enum-Fix-compiler-warning.patch
@@ -0,0 +1,31 @@
+From d23c0ea81e630af3cfda89aeeb52146c0c84c960 Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Mon, 2 May 2022 09:31:49 +0200
+Subject: [PATCH] enum: Fix compiler warning
+
+Closes strongswan/strongswan#1025
+
+Upstream-Status: Backport
+[https://github.com/strongswan/strongswan/commit/d23c0ea81e630af3cfda89aeeb52146c0c84c960]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/libstrongswan/utils/enum.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libstrongswan/utils/enum.c b/src/libstrongswan/utils/enum.c
+index 79da450f0c..1e77489f6f 100644
+--- a/src/libstrongswan/utils/enum.c
++++ b/src/libstrongswan/utils/enum.c
+@@ -97,7 +97,7 @@ char *enum_flags_to_string(enum_name_t *e, u_int val, char *buf, size_t len)
+ 		return buf;
+ 	}
+ 
+-	if (snprintf(buf, len, e->names[0]) >= len)
++	if (snprintf(buf, len, "%s", e->names[0]) >= len)
+ 	{
+ 		return NULL;
+ 	}
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/strongswan/files/0001-openssl-Don-t-unload-providers.patch b/meta-networking/recipes-support/strongswan/files/0001-openssl-Don-t-unload-providers.patch
deleted file mode 100644
index 7da48cd2cf..0000000000
--- a/meta-networking/recipes-support/strongswan/files/0001-openssl-Don-t-unload-providers.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From 3eecd40cec6415fc033f8d9141ab652047e71524 Mon Sep 17 00:00:00 2001
-From: Tobias Brunner <tobias@strongswan.org>
-Date: Wed, 23 Feb 2022 17:29:02 +0100
-Subject: [PATCH] openssl: Don't unload providers
-
-There is a conflict between atexit() handlers registered by OpenSSL and
-some executables (e.g. swanctl or pki) to deinitialize libstrongswan.
-Because plugins are usually loaded after atexit() has been called, the
-handler registered by OpenSSL will run before our handler.  So when the
-latter destroys the plugins it's a bad idea to try to access any OpenSSL
-objects as they might already be invalid.
-
-Fixes: f556fce16b60 ("openssl: Load "legacy" provider in OpenSSL 3 for algorithms like MD4, DES etc.")
-Closes strongswan/strongswan#921
-
-Upstream-Status: Backport
-[https://github.com/strongswan/strongswan/commit/3eecd40cec6415fc033f8d9141ab652047e71524]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- .../plugins/openssl/openssl_plugin.c          | 27 +++----------------
- 1 file changed, 3 insertions(+), 24 deletions(-)
-
-diff --git a/src/libstrongswan/plugins/openssl/openssl_plugin.c b/src/libstrongswan/plugins/openssl/openssl_plugin.c
-index 6b4923649..1491d5cf8 100644
---- a/src/libstrongswan/plugins/openssl/openssl_plugin.c
-+++ b/src/libstrongswan/plugins/openssl/openssl_plugin.c
-@@ -16,7 +16,6 @@
- 
- #include <library.h>
- #include <utils/debug.h>
--#include <collections/array.h>
- #include <threading/thread.h>
- #include <threading/mutex.h>
- #include <threading/thread_value.h>
-@@ -74,13 +73,6 @@ struct private_openssl_plugin_t {
- 	 * public functions
- 	 */
- 	openssl_plugin_t public;
--
--#if OPENSSL_VERSION_NUMBER >= 0x30000000L
--	/**
--	 * Loaded providers
--	 */
--	array_t *providers;
--#endif
- };
- 
- /**
-@@ -887,15 +879,6 @@ METHOD(plugin_t, get_features, int,
- METHOD(plugin_t, destroy, void,
- 	private_openssl_plugin_t *this)
- {
--#if OPENSSL_VERSION_NUMBER >= 0x30000000L
--	OSSL_PROVIDER *provider;
--	while (array_remove(this->providers, ARRAY_TAIL, &provider))
--	{
--		OSSL_PROVIDER_unload(provider);
--	}
--	array_destroy(this->providers);
--#endif /* OPENSSL_VERSION_NUMBER */
--
- /* OpenSSL 1.1.0 cleans up itself at exit and while OPENSSL_cleanup() exists we
-  * can't call it as we couldn't re-initialize the library (as required by the
-  * unit tests and the Android app) */
-@@ -1009,20 +992,16 @@ plugin_t *openssl_plugin_create()
- 			DBG1(DBG_LIB, "unable to load OpenSSL FIPS provider");
- 			return NULL;
- 		}
--		array_insert_create(&this->providers, ARRAY_TAIL, fips);
- 		/* explicitly load the base provider containing encoding functions */
--		array_insert_create(&this->providers, ARRAY_TAIL,
--							OSSL_PROVIDER_load(NULL, "base"));
-+		OSSL_PROVIDER_load(NULL, "base");
- 	}
- 	else if (lib->settings->get_bool(lib->settings, "%s.plugins.openssl.load_legacy",
- 									 TRUE, lib->ns))
- 	{
- 		/* load the legacy provider for algorithms like MD4, DES, BF etc. */
--		array_insert_create(&this->providers, ARRAY_TAIL,
--							OSSL_PROVIDER_load(NULL, "legacy"));
-+		OSSL_PROVIDER_load(NULL, "legacy");
- 		/* explicitly load the default provider, as mentioned by crypto(7) */
--		array_insert_create(&this->providers, ARRAY_TAIL,
--							OSSL_PROVIDER_load(NULL, "default"));
-+		OSSL_PROVIDER_load(NULL, "default");
- 	}
- 	ossl_provider_names_t data = {};
- 	OSSL_PROVIDER_do_all(NULL, concat_ossl_providers, &data);
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.5.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.6.bb
similarity index 98%
rename from meta-networking/recipes-support/strongswan/strongswan_5.9.5.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.9.6.bb
index cfb7b41fa4..1b82dceac2 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.5.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.6.bb
@@ -9,10 +9,10 @@ DEPENDS = "flex-native flex bison-native"
 DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss', '', d)}"
 
 SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
-           file://0001-openssl-Don-t-unload-providers.patch \
+           file://0001-enum-Fix-compiler-warning.patch \
            "
 
-SRC_URI[sha256sum] = "983e4ef4a4c6c9d69f5fe6707c7fe0b2b9a9291943bbf4e008faab6bf91c0bdd"
+SRC_URI[sha256sum] = "91d0978ac448912759b85452d8ff0d578aafd4507aaf4f1c1719f9d0c7318ab7"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.25.1


