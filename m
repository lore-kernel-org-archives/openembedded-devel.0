Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90DA3C433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 16:30:12 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.13186.1648139411581518749
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 09:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eRXtFk7o;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id gb19so5162075pjb.1
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 09:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3vAtIfHjzNdN2y5fUFe0IHeMUtdYo/JWUHvN+W/c9sM=;
        b=eRXtFk7ozbzov3ylZpWQzxzoPC/alX2/kEtbbMy38VMTPs2VXa8tGXkmHfqqIS6Dg7
         5zB11PdSk0bVft+SIlDDcOPFgfhwGZrc+hANtAl5Mg+UBiK9NwR90rMz1a0U5AtVudOi
         91IMw3NxCMX+Uc9POQfsRCX66uOZpe6EcwK82vMUb3lWR1/fWUxRXgJbyhihwkOXhs8G
         7tZFcLz1+xJzTin4vq2d/9WUOOycKlKm84NIGu+aW1pqG2TuSISUhUxNsznjhSieqtDj
         nWv4jvvwbuy974rlPu8DnGIuGMGPF8CeG7Ff1O4VxFIBuKZYekyYSA04XRJonnOGIDcY
         4z+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3vAtIfHjzNdN2y5fUFe0IHeMUtdYo/JWUHvN+W/c9sM=;
        b=bIdaana2EZrzDuwN6lR8GAFKMNStmS802j0spoi+NeS1W371pb26fvYODyQ6bwg5VJ
         3ZuDqkqY38YKWbAeYlByt34EGL9cX+L9gc8Omco/p3Fl2txEGgjybSUTRoOb9tYPB8p9
         kF2Ezj5MNSI6bT6TbV+LO1YhOMv+5OUmkRwqGcXUvz5L8GfDQL37sqshtT6p3lN1pZ9M
         cJ8ka9cHKMt7hrQcn3lCsXqYIzVgROpUrG63DYsKxGysncgWMIRGFUkKSHQujjEdqW/6
         g+6IIze4sbh5PjmqvUiK6OxtfSRgCayi+MALkuL9pwpd/L4UIE112cd85kd0gxg1HvVE
         +Bow==
X-Gm-Message-State: AOAM530DBs//lvD7sekLJJa7C3JxxsGfPdtYWwFfHnx4LbfikKVpgcfO
	QmEEYjILrHT+3oguHGeOthi8lmgMb8E=
X-Google-Smtp-Source: 
 ABdhPJziO348oSlU3xae2rufNZw5qWB+mU2zPWdEfGG3RcLn2+XHdVmuOy6bjjcTY3xs05VVn96BlA==
X-Received: by 2002:a17:902:ca94:b0:154:b606:dd83 with SMTP id
 v20-20020a170902ca9400b00154b606dd83mr6617965pld.167.1648139410791;
        Thu, 24 Mar 2022 09:30:10 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 a38-20020a056a001d2600b004f72acd4dadsm3995447pfx.81.2022.03.24.09.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Mar 2022 09:30:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH] geary: Fix build failures with latest vala
Date: Thu, 24 Mar 2022 09:30:08 -0700
Message-Id: <20220324163008.37725-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Mar 2022 16:30:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96200

Backport needed patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...orkaround-missing-generic-type-argum.patch | 27 ++++++++++++
 ...y-issues-with-initializer-of-constan.patch | 42 +++++++++++++++++++
 .../recipes-connectivity/geary/geary_40.0.bb  |  2 +
 3 files changed, 71 insertions(+)
 create mode 100644 meta-gnome/recipes-connectivity/geary/geary/0001-Util.Cache.Lru-Workaround-missing-generic-type-argum.patch
 create mode 100644 meta-gnome/recipes-connectivity/geary/geary/0002-Fix-accessibility-issues-with-initializer-of-constan.patch

diff --git a/meta-gnome/recipes-connectivity/geary/geary/0001-Util.Cache.Lru-Workaround-missing-generic-type-argum.patch b/meta-gnome/recipes-connectivity/geary/geary/0001-Util.Cache.Lru-Workaround-missing-generic-type-argum.patch
new file mode 100644
index 0000000000..22af4f5bea
--- /dev/null
+++ b/meta-gnome/recipes-connectivity/geary/geary/0001-Util.Cache.Lru-Workaround-missing-generic-type-argum.patch
@@ -0,0 +1,27 @@
+From 166198735e9f4fbe91557df1351b3481bcf79e78 Mon Sep 17 00:00:00 2001
+From: Rico Tzschichholz <ricotz@ubuntu.com>
+Date: Sun, 30 Jan 2022 19:54:11 +0100
+Subject: [PATCH 1/2] Util.Cache.Lru: Workaround missing generic type argument
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/geary/-/commit/0f75e7a84a39492d0748cec2ba6028e08cae3644]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/client/util/util-cache.vala | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/client/util/util-cache.vala b/src/client/util/util-cache.vala
+index f054e32e..ecc275e8 100644
+--- a/src/client/util/util-cache.vala
++++ b/src/client/util/util-cache.vala
+@@ -12,7 +12,7 @@ public class Util.Cache.Lru<T> : Geary.BaseObject {
+     private class CacheEntry<T> {
+ 
+ 
+-        public static int lru_compare(CacheEntry<T> a, CacheEntry<T> b) {
++        public static int lru_compare(CacheEntry a, CacheEntry b) {
+             if (a.key == b.key) {
+                 return 0;
+             }
+-- 
+2.35.1
+
diff --git a/meta-gnome/recipes-connectivity/geary/geary/0002-Fix-accessibility-issues-with-initializer-of-constan.patch b/meta-gnome/recipes-connectivity/geary/geary/0002-Fix-accessibility-issues-with-initializer-of-constan.patch
new file mode 100644
index 0000000000..76315f3a0e
--- /dev/null
+++ b/meta-gnome/recipes-connectivity/geary/geary/0002-Fix-accessibility-issues-with-initializer-of-constan.patch
@@ -0,0 +1,42 @@
+From 64b56e75a54a9fa3f37c7686be97a5c8818413a4 Mon Sep 17 00:00:00 2001
+From: Rico Tzschichholz <ricotz@ubuntu.com>
+Date: Tue, 30 Nov 2021 15:31:31 +0100
+Subject: [PATCH 2/2] Fix accessibility issues with initializer of constants
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/geary/-/commit/9bd4c82952a0a2c3308c5cc86c0b85650c1fb484]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/client/application/application-client.vala | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/src/client/application/application-client.vala b/src/client/application/application-client.vala
+index 6ce19ce2..e6ba8533 100644
+--- a/src/client/application/application-client.vala
++++ b/src/client/application/application-client.vala
+@@ -8,16 +8,16 @@
+ 
+ // Defined by CMake build script.
+ extern const string GETTEXT_PACKAGE;
+-extern const string _APP_ID;
+-extern const string _BUILD_ROOT_DIR;
+-extern const string _GSETTINGS_DIR;
+-extern const string _INSTALL_PREFIX;
+-extern const string _NAME_SUFFIX;
++public extern const string _APP_ID;
++public extern const string _BUILD_ROOT_DIR;
++public extern const string _GSETTINGS_DIR;
++public extern const string _INSTALL_PREFIX;
++public extern const string _NAME_SUFFIX;
+ extern const string _PLUGINS_DIR;
+ extern const string _PROFILE;
+ extern const string _REVNO;
+-extern const string _SOURCE_ROOT_DIR;
+-extern const string _VERSION;
++public extern const string _SOURCE_ROOT_DIR;
++public extern const string _VERSION;
+ extern const string _WEB_EXTENSIONS_DIR;
+ 
+ 
+-- 
+2.35.1
+
diff --git a/meta-gnome/recipes-connectivity/geary/geary_40.0.bb b/meta-gnome/recipes-connectivity/geary/geary_40.0.bb
index 9b671eeab4..501b27a544 100644
--- a/meta-gnome/recipes-connectivity/geary/geary_40.0.bb
+++ b/meta-gnome/recipes-connectivity/geary/geary_40.0.bb
@@ -34,6 +34,8 @@ inherit meson pkgconfig mime-xdg gtk-icon-cache gobject-introspection vala featu
 
 SRC_URI = " \
 	git://github.com/GNOME/geary.git;nobranch=1;protocol=https \
+        file://0001-Util.Cache.Lru-Workaround-missing-generic-type-argum.patch \
+        file://0002-Fix-accessibility-issues-with-initializer-of-constan.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.35.1


