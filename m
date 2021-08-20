Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web11.80094.1629439798049632255
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Aug 2021 23:09:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mp/HPtrk;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1629439796; i=@fujitsu.com;
	bh=a+x1IKMIW70Jld4aZRXqqLDVqJd+ReEEH3dxDatk794=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=mp/HPtrkLEuX6VnyE0zlSf5irFuh1uvUi9tYWZsmPKtHYHAjy65l9Ro/PHzUAFwKB
	 CGJ+inx6wuz/C9/rq/uVREpv0IaSokEMkoz2UvmsYEwAgW+F9ZGDr/RIgdb9nxSyn6
	 wl2C3HbfspADSN83m1Hh2aPAGL8xabXL2vM56dg8dmezX9j4laoF86Wz3aUO+7CseB
	 5NISVkj9qjUKcNYs3yMm3WZ5EWn6A9thJc6DvEdSSbngP+tozFo534t7kiL1yZV1sw
	 6131Xe3CjM/CZbymf2qHeqA+IBQwkkFPdPTJA4LFTYpFZLdXSFcIcbv9xsrUNb4MiJ
	 Oj2YTWH1NJ/tA==
Received: from [100.112.199.201] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-west-1.aws.symcld.net id ED/9B-02582-4374F116; Fri, 20 Aug 2021 06:09:56 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8MRqmvsLp9
  o8LTJ2uLi4aXMDowe5zauYAxgjGLNzEvKr0hgzVh0+h57QZd6xeoXn9gaGC8rdTFycggJzGaS
  eH/cqIuRC8g+wSjRda6dCSTBJqAmMf3WDVYQW0RAX2Lp7D3MIDazgIrEi9897CC2sICHxOyn1
  xlBbBYBVYmtUy6A1fMKOEmsmN4ANkdCQEFiysP3zBBxQYmTM5+wQMyRkDj44gUzRI2ixOzLzS
  wQdoXErFltTBMYeWchaZmFpGUBI9MqRoukosz0jJLcxMwcXUMDA11DQyNdQ0szXSNDY73EKt0
  kvdRS3fLU4hJdQ73E8mK94src5JwUvbzUkk2MwPBKKThydQdj95sPeocYJTmYlER5Vc3kE4X4
  kvJTKjMSizPii0pzUosPMcpwcChJ8Ea5AuUEi1LTUyvSMnOAoQ6TluDgURLhLXYGSvMWFyTmF
  memQ6ROMepyvPu5eBGzEEtefl6qlDhvpxtQkQBIUUZpHtwIWNxdYpSVEuZlZGBgEOIpSC3KzS
  xBlX/FKM7BqCTMuxZkCk9mXgncpldARzABHSGkKgtyREkiQkqqgamWOzZ2pc376aJ72OUXBDZ
  L6ehZzHBcc/HYnr8HH61q45rr+/tepMnabdnc89931fyba62hsXzZ51bPW/p515tfhvREnjyo
  aZcSFbjI8sDGv1LufxaWNMrf1ZppHzynrKpA8JX1HuMb+VfvpJ9LLDvYdPW7pKw+r9Uf83dz9
  7QKqferZ4o8uvTs5wSnQyfu8HLZCt46OC3/Vm1FeRX/Xc8VF0NzZp3ZwH3j6i6tFrWdhuvbF1
  0/92n20ZXK1z9/4LbY6XaMW/jSQu2nTzZ8/vRsnv76xshtr1kC7ydasDA3lHyYxD19sbyUaKZ
  sBdPU/dK1e/dfs5C59XjGFpdtxxfr/X0vKXc0+mBgYI4m68liJZbijERDLeai4kQAeVYRdjYD
  AAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-285.messagelabs.com!1629439795!2238761!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8623 invoked from network); 20 Aug 2021 06:09:55 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-11.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Aug 2021 06:09:55 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17K69tIC001538
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Aug 2021 07:09:55 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 20 Aug 2021 07:09:53 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] netplan: upgrade 0.102 -> 0.103
Date: Fri, 20 Aug 2021 14:09:36 +0800
Message-ID: <1629439776-46256-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

0001-Handle-enum-element-override.patch
removed since it is included in 0.103

Add patch to fix bug for 32bit format string bug.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-Handle-enum-element-override.patch   | 34 -------------------
 ...001-parse-nm-fix-32bit-format-string.patch | 25 ++++++++++++++
 .../{netplan_0.102.bb => netplan_0.103.bb}    | 11 +++---
 3 files changed, 30 insertions(+), 40 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/netplan/netplan/0001-Handle-enum-element-override.patch
 create mode 100644 meta-networking/recipes-connectivity/netplan/netplan/0001-parse-nm-fix-32bit-format-string.patch
 rename meta-networking/recipes-connectivity/netplan/{netplan_0.102.bb => netplan_0.103.bb} (92%)

diff --git a/meta-networking/recipes-connectivity/netplan/netplan/0001-Handle-enum-element-override.patch b/meta-networking/recipes-connectivity/netplan/netplan/0001-Handle-enum-element-override.patch
deleted file mode 100644
index dfc6f90c4c..0000000000
--- a/meta-networking/recipes-connectivity/netplan/netplan/0001-Handle-enum-element-override.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 6d284f1ff81494a5fca91a399b92b218ea1a9ea8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 8 Jun 2021 08:53:30 -0700
-Subject: [PATCH] Handle enum element override
-
-NETPLAN_DEF_TYPE_VIRTUAL and NETPLAN_DEF_TYPE_BRIDGE point
-to same value in enum, however here they are assigned individually
-which results in overriding the initialization of the objects
-
-Fixes
-src/netplan.h:85:33: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
-    [NETPLAN_DEF_TYPE_BRIDGE] = "bridges",
-                                ^~~~~~~~~
-Upstream-Status: Submitted [https://github.com/canonical/netplan/pull/213]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/netplan.h | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/src/netplan.h b/src/netplan.h
-index d2c538b..26574f8 100644
---- a/src/netplan.h
-+++ b/src/netplan.h
-@@ -81,7 +81,6 @@ static const char* const netplan_def_type_to_str[NETPLAN_DEF_TYPE_MAX_] = {
-     [NETPLAN_DEF_TYPE_ETHERNET] = "ethernets",
-     [NETPLAN_DEF_TYPE_WIFI] = "wifis",
-     [NETPLAN_DEF_TYPE_MODEM] = "modems",
--    [NETPLAN_DEF_TYPE_VIRTUAL] = NULL,
-     [NETPLAN_DEF_TYPE_BRIDGE] = "bridges",
-     [NETPLAN_DEF_TYPE_BOND] = "bonds",
-     [NETPLAN_DEF_TYPE_VLAN] = "vlans",
--- 
-2.32.0
-
diff --git a/meta-networking/recipes-connectivity/netplan/netplan/0001-parse-nm-fix-32bit-format-string.patch b/meta-networking/recipes-connectivity/netplan/netplan/0001-parse-nm-fix-32bit-format-string.patch
new file mode 100644
index 0000000000..72f04a15ad
--- /dev/null
+++ b/meta-networking/recipes-connectivity/netplan/netplan/0001-parse-nm-fix-32bit-format-string.patch
@@ -0,0 +1,25 @@
+From 2f0ff65eaa93f18d9edb5d03329b00d8e5e73869 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Lukas=20M=C3=A4rdian?= <lukas.maerdian@canonical.com>
+Date: Wed, 4 Aug 2021 15:55:00 +0200
+Subject: [PATCH] parse-nm: fix 32bit format string
+
+---
+ src/parse-nm.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/parse-nm.c b/src/parse-nm.c
+index 9b09e34..bf998b7 100644
+--- a/src/parse-nm.c
++++ b/src/parse-nm.c
+@@ -136,7 +136,7 @@ static void
+ handle_bridge_uint(GKeyFile* kf, const gchar* key, NetplanNetDefinition* nd, char** dataptr) {
+     if (g_key_file_get_uint64(kf, "bridge", key, NULL)) {
+         nd->custom_bridging = TRUE;
+-        *dataptr = g_strdup_printf("%lu", g_key_file_get_uint64(kf, "bridge", key, NULL));
++        *dataptr = g_strdup_printf("%"G_GUINT64_FORMAT, g_key_file_get_uint64(kf, "bridge", key, NULL));
+         _kf_clear_key(kf, "bridge", key);
+     }
+ }
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/netplan/netplan_0.102.bb b/meta-networking/recipes-connectivity/netplan/netplan_0.103.bb
similarity index 92%
rename from meta-networking/recipes-connectivity/netplan/netplan_0.102.bb
rename to meta-networking/recipes-connectivity/netplan/netplan_0.103.bb
index 6c624ce4e9..682a6b611d 100644
--- a/meta-networking/recipes-connectivity/netplan/netplan_0.102.bb
+++ b/meta-networking/recipes-connectivity/netplan/netplan_0.103.bb
@@ -11,13 +11,12 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 S = "${WORKDIR}/git"
-SRCREV = "62701436991e42606c4e9e8dbdcdc5067d64f69b"
-PV = "0.102+git${SRCPV}"
+SRCREV = "51c872d856db80281ea810ebc02e05c09d5310fa"
+PV = "0.103"
+
+SRC_URI = "git://github.com/CanonicalLtd/netplan.git;branch=main \
+           file://0001-parse-nm-fix-32bit-format-string.patch"
 
-SRC_URI = " \
-        git://github.com/CanonicalLtd/netplan.git \
-        file://0001-Handle-enum-element-override.patch \
-"
 SRC_URI:append:libc-musl = " file://0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch"
 
 DEPENDS = "glib-2.0 libyaml ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
-- 
2.25.1

