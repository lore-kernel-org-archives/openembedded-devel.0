Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 960761061B2B
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 11:13:40 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18011.1774955619072113932
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Mar 2026 04:13:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kaLVI6pt;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-486ff201041so55004085e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 04:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774955617; x=1775560417; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8dUfnIVMbJMNZvusP+7pXo3VekKJoEK75nqQ4HZExLI=;
        b=kaLVI6ptSScNugPILy3865kxMwQB6V5OHlg/kcszXbddua5AY1/3+v6LFBzrJwft8v
         UWZJo2rSvysTdRtAGr4gKuM48XWhzyo13bz2XccvYrcTyt724ZaHcTU/+CD/fNqNTKVG
         G8kGk1om6Y2fhetYJuIzAzK6ktjSUon7OcwRFKrBeivTAvXx/OyaZzyg4KJbJWqBmkaC
         4p+d7U6EbK7cAfaFk93A+cICfgJinAAcCoESAiUVw8ObIlauo2glBb1n8tcWoBCUhMb9
         imAii2rqIJRAVWpwtOk1eno+B+q3FGP9vvUj6jrUZGOpMwnSyOifc5i8b1PXpE36mlPc
         5pyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774955617; x=1775560417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8dUfnIVMbJMNZvusP+7pXo3VekKJoEK75nqQ4HZExLI=;
        b=b99EuXX+YYI4kqDrQI54s5K1QO4BTwLa4XQK1dz8stuPJrrW1NIdj5+LiTF7+JDP+k
         7A+tLm+ue5HIWhjWuTCOqWc71P7KkzrrFCM/4iVsm0J2hFiyiE7V/dnBi2uwdBddsYmh
         7vf+elJ9VkHuRn/oo5kZAQYhPM6kVYoDrBvUahNMwjfUwwWXxP7S7rJRpYqLvvVIetqc
         9XZlD3IlbH/LTIzvZQLm/SZ3u8Q/sgxyT4n9ldYTYjvBOQ86UbDBTFbU+464GFJ1AZvT
         SD16VxSzMCn4C0GEKnu6dNdMcnafG6eYrJNdVsin7wEMND21gstxDGr/It32ReJwESPl
         pJQA==
X-Gm-Message-State: AOJu0Yx77PF3eYSuAKJbhgtOMCG/uPhKQiPkvx4poSP/j6p1LzkMsE7c
	rjwM3I042vDGZoP0dvYLE1zHKrB3B9HGBC9ZHSjkH5CulVzfSA8FBAr/9LP+rQ==
X-Gm-Gg: ATEYQzxKWnKYSwXekQhXvl+uK0D7uhcoRjAtIYFMAAHikZmNeb475Vi71WAUDYIUUZp
	A9ADr5Aq6/DkenC+rAnHwWH8l+F9T60CHLRl6/Dq1E4Z/sa2e9nVHRMvEbZzI5MUt82cwR/Leyp
	vcMU8LAXUQTPTeJ1iOnT3Dcb3fJwQ4WC5hfNh22QLvLheMVlD6RwhTuUqlbVycbY6oSCuOmCbty
	DCuusR9EoebP0tzFEe6a9IIPFuRpD0uMPOd7IDgYo/ZAJDTr/YpcwF+dORqUD/crAORY9AqaX2e
	mDueQldvOz6o2GRud6f+XmWa7oFQLmg63AMFYdT2bc8magcK6sTHk1/JMgRHieFESWheYPNkXot
	y0xpzU5lnQgVgRhfNz0rKM3AGEKOjLaXlb/E8LQn6qXiyAvf3xdi3MFXjT717ctSdZXnD8+9jKO
	Fb1lSA+U5XWzHJashsKkJj
X-Received: by 2002:a05:600c:3f0a:b0:485:4eaf:eb54 with SMTP id 5b1f17b1804b1-48727ec733dmr261260995e9.20.1774955617207;
        Tue, 31 Mar 2026 04:13:37 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c8d3684sm13009465e9.29.2026.03.31.04.13.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 04:13:36 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] dovecot: upgrade 2.4.2 -> 2.4.3
Date: Tue, 31 Mar 2026 13:13:36 +0200
Message-ID: <20260331111336.3536082-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 11:13:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125885

Drop patch which is included in this release, and add a patch that
adapts a lua api call to the lua version that is used in OE.

License-Change: the unicode license text has been updated, there should
be no material change. However while examining these changes, I noticed
that some parts of the code are covered by licenses not mentined in the
recipe. It should reflect all licenses now.

Tis version contains fixes fox CVE-2025-59028, CVE-2025-59031, CVE-2026-24031,
CVE-2026-27859, CVE-2026-27860, CVE-2026-27857, CVE-2026-27856 and CVE-2026-27855

Changelog: https://github.com/dovecot/core/blob/main/NEWS

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../0001-adapt-lua_newstate-to-new-api.patch  | 29 +++++++++++++++++++
 ...1-lib-regex-remove-LIBPCRE_LIBS-from.patch | 26 -----------------
 .../{dovecot_2.4.2.bb => dovecot_2.4.3.bb}    | 11 +++----
 3 files changed, 35 insertions(+), 31 deletions(-)
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0001-adapt-lua_newstate-to-new-api.patch
 delete mode 100644 meta-networking/recipes-support/dovecot/dovecot/0001-lib-regex-remove-LIBPCRE_LIBS-from.patch
 rename meta-networking/recipes-support/dovecot/{dovecot_2.4.2.bb => dovecot_2.4.3.bb} (89%)

diff --git a/meta-networking/recipes-support/dovecot/dovecot/0001-adapt-lua_newstate-to-new-api.patch b/meta-networking/recipes-support/dovecot/dovecot/0001-adapt-lua_newstate-to-new-api.patch
new file mode 100644
index 0000000000..363361fcd5
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0001-adapt-lua_newstate-to-new-api.patch
@@ -0,0 +1,29 @@
+From 5efcbab91b510f5a2495369b729248e8bf8a5d63 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Tue, 31 Mar 2026 11:05:52 +0000
+Subject: [PATCH] adapt lua_newstate to new api
+
+lua_newstate() in lua 5.5 has gained a new, third argument, which made
+it not backwards compatible. This change adapts this call to the lua version
+used in OE.
+
+Upstream-Status: Pending
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/lib-lua/dlua-script.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/lib-lua/dlua-script.c b/src/lib-lua/dlua-script.c
+index 20f91ad..789d603 100644
+--- a/src/lib-lua/dlua-script.c
++++ b/src/lib-lua/dlua-script.c
+@@ -253,7 +253,7 @@ static struct dlua_script *dlua_create_script(const char *name,
+ 	/* lua API says that lua_newstate will return NULL only if it's out of
+ 	   memory. this cannot really happen with our allocator as it will
+ 	   call i_fatal_status anyways if it runs out of memory */
+-	script->L = lua_newstate(dlua_alloc, script);
++	script->L = lua_newstate(dlua_alloc, script, luaL_makeseed(NULL));
+ 	i_assert(script->L != NULL);
+ 	script->ref = 1;
+ 	lua_atpanic(script->L, dlua_atpanic);
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0001-lib-regex-remove-LIBPCRE_LIBS-from.patch b/meta-networking/recipes-support/dovecot/dovecot/0001-lib-regex-remove-LIBPCRE_LIBS-from.patch
deleted file mode 100644
index b872587a88..0000000000
--- a/meta-networking/recipes-support/dovecot/dovecot/0001-lib-regex-remove-LIBPCRE_LIBS-from.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From fd3d65c65c778cf0a2fba6487c8d0eb30b6780b7 Mon Sep 17 00:00:00 2001
-From: Aki Tuomi <aki.tuomi@open-xchange.com>
-Date: Fri, 31 Oct 2025 12:53:33 +0200
-Subject: [PATCH] lib-regex: Remove LIBPCRE_LIBS from test dependencies
-
-Was accidentically added in 49ae6e798310e5c4b96709db435a3714ea6468a8
-
-Upstream-Status: Backport [https://github.com/dovecot/core/commit/fd3d65c65c778cf0a2fba6487c8d0eb30b6780b7]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- src/lib-regex/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/lib-regex/Makefile.am b/src/lib-regex/Makefile.am
-index 60f43d9779..9d26d27fa1 100644
---- a/src/lib-regex/Makefile.am
-+++ b/src/lib-regex/Makefile.am
-@@ -34,7 +34,7 @@ test_regex_LDADD = libdregex.la \
- 		   ../lib-test/libtest.la \
- 		   ../lib/liblib.la \
- 		   $(LIBPCRE_LIBS)
--test_regex_DEPENDENCIES = libdregex.la $(LIBPCRE_LIBS)
-+test_regex_DEPENDENCIES = libdregex.la
- 
- check-local:
- 	for bin in $(test_programs); do \
diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.4.2.bb b/meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb
similarity index 89%
rename from meta-networking/recipes-support/dovecot/dovecot_2.4.2.bb
rename to meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb
index e94306dd32..a8930979ea 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.4.2.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb
@@ -6,17 +6,17 @@ in mind. Dovecot is an excellent choice for both small and large \
 installations. It's fast, simple to set up, requires no special \
 administration and it uses very little memory."
 SECTION = "mail"
-LICENSE = "LGPL-2.1-only & MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2956560272e5b31d9d64f03111732048"
+LICENSE = "LGPL-2.1-only & MIT & Unicode-3.0 & BSD-3-Clause & PD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=cb805cc6bdb95ba8fc2398a55fd50877"
 
-SRC_URI = "http://dovecot.org/releases/2.4/dovecot-${PV}.tar.gz \
+SRC_URI = "https://dovecot.org/releases/2.4/dovecot-${PV}.tar.gz \
            file://0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch \
            file://dovecot.service \
            file://dovecot.socket \
            file://0001-m4-Check-for-libunwind-instead-of-libunwind-generic.patch \
-           file://0001-lib-regex-remove-LIBPCRE_LIBS-from.patch \
+           file://0001-adapt-lua_newstate-to-new-api.patch \
            "
-SRC_URI[sha256sum] = "2cd62e4d22b9fc1c80bd38649739950f0dbda34fbc3e62624fb6842264e93c6e"
+SRC_URI[sha256sum] = "e0b30330fe51e47ecfcf641bc16041184d91bdd0ac3db789b7cef54e3a75ac9b"
 
 DEPENDS = "openssl xz zlib bzip2 libcap icu libtirpc bison-native"
 CFLAGS += "-I${STAGING_INCDIR}/tirpc"
@@ -29,6 +29,7 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ldap pam systemd', d)}
 PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,"
 PACKAGECONFIG[systemd] = "--with-systemd,--without-systemd,systemd,"
 PACKAGECONFIG[ldap] = "--with-ldap=plugin,--without-ldap,openldap,"
+PACKAGECONFIG[lua] = "--with-lua=yes, --without-lua, lua"
 PACKAGECONFIG[lz4] = "--with-lz4,--without-lz4,lz4,"
 
 # From native build in armv7a-hf/eglibc

