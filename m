Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1097.1794332164794662928
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 09:36:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=hJwbqJv5;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so14064635e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 09:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794332163; x=1794936963; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wgz6v/dxTlEafNcMVdgKqeL4J15jP3zzdfpYWR3p7ic=;
        b=hJwbqJv5k8C6tBIWkfhrfqn1FeHTs/aFOgSDCLnrsLbiQFXRQ7T1R+YJWtrCCPLlkv
         Kn6vVZUfpsxqO2zsokoXgNyzjwqDM/Wa5D4yZJ2btx5N6cCNJlUKZkEyo8bKZYq2xbMz
         xuYjc0368EhQMlxssj2rKsBsypPvX0OiTI0t9J6TNvrbSsxZSmmtkwdiFjwpITdpqF9O
         AlWbevkRQpoELtWyL27rMgehsIaDXgOhK/AENpdgc+/9iB16GMWxZKExdPF0h2ewvDxR
         QSKv/G1Gp46QJ+6THb2ye2cWkp48hAkOz2zKyml2OO59p8UOmHmEB99icX+cPE0eha/R
         rdEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332163; x=1794936963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wgz6v/dxTlEafNcMVdgKqeL4J15jP3zzdfpYWR3p7ic=;
        b=o7TZ8ZcITTWp7aERl4mV5eMxIXS1e72uqGZXAwAPWIGKNcbmhuyLpEOB2XOqHUaCXy
         DNCONVx9bf7Rqr9zctkzjv8bEesuRMMWB4LDxtE69l9z6xsTDFXoC2ZRIcr9yg5bOdTd
         9aimQFKTlX3oJu0TiSwPB53hIU3EBVz+KKXWNy95Ye86OLiGDVgtv5rEl1mrjU9ml50Y
         mjBxDFhmRuUIxkTj5B5BP6HeDT7PoRVIcHvCZMYIKtfMuEBm2sRcwIk+3PqtVLZ6+yfL
         xwQlcswqFAqFFieqMITKzahraywTqdj2Mfv7X3M0ExDEOfUGR35iIj4fJ3IC4a+PrUKC
         N/lg==
X-Gm-Message-State: APuU4Z9YXXNQOCpJBGkqXTI5RPcXuYKFP/iQjj+GgbNGgHHrWe5Mkv0e
	i4kEnyOGhbwDTjLVc35X7gN4PZiHb5z485Wg/aDN9/g1Ws4x9JzEqOzDLGVZqw==
X-Gm-Gg: AYBFou2vPl+Ze0NEXszwl1BrYSA2eObhS4EUyCqFTcd1lOQ8jFla6lllKZVrevYoVvx
	KC0znYG0nFo8bkcgvZU44z8cuwwGXTFzdgVI0bPUD4OZPXFz65tTjBwXoF5jf1ax7wNQVyO7OvC
	X/MGXY9sf87P1n4X2WMQE7//9ErYCslo5neVgDdw7kqiQ+3KNZmkazGTiN9iLgjJPYxgGGk8nqK
	4lPU8Tw2iPHidP9FcjlSh+ldRsGNNS3B39yjFzAgLOMlT5d5dETMkLZynplwtv8ukYu51yZDXVH
	3DGUZXUrmR166WFDCV+OToB2c8p1A8FKblHKs+BHCvLpPIJlHzcSYHNKCIQaXGaKHaVzhjShlgl
	94ONAtinJmJZ+yeCbvEAxwraYrbmwaas4bflnntbUbocn2TrLdHxQ3vX7e4UsbsM6kH4pCeLvSP
	9M03NITUNlvELqapO4Xifq6X7YZ2UfDpNPkKjjx9TatMZXrDggkyVaCLAJKXKOtd7YkLNn8S83N
	Px3Pny4XYsPmKpkZCboeupAfSWlgGuo5di635YJOPitSLHaau6r7DAdezA4jv1g8ezvedRpxNmv
	djfVPv8i/uGxhu8FAmdqdphN5ks/2HCHa5ne0KlWqB6padoluxnhzlex9m9arjGcdkvtnilizYp
	hv/U=
X-Received: by 2002:a05:600c:c4ab:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4ba08dcdba8mr1067275e9.10.1794332162937;
        Tue, 10 Nov 2026 09:36:02 -0800 (PST)
Return-Path: <alex.kiernan@gmail.com>
Received: from [192.168.5.15] (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea9eesm122994405e9.11.2026.11.10.09.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:36:01 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 10 Nov 2026 17:35:37 +0000
Subject: [PATCH meta-oe 08/10] android-tools: add ADBD_AUTH_KEY_PATHS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-android-tools-adbd-v1-8-cc2176f381c3@gmail.com>
References: <20261110-android-tools-adbd-v1-0-cc2176f381c3@gmail.com>
In-Reply-To: <20261110-android-tools-adbd-v1-0-cc2176f381c3@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 17:36:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132105

adbd looks for trusted host keys only in Android's /adb_keys and
/data/misc/adb/adb_keys, so a Linux adbd that requires authorization has
nowhere sensible to be given one. ADBD_AUTH_KEY_PATHS, colon-separated,
replaces that list.

AI-Generated: Claude Opus 5.5 (Claude Code)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 ...h-optionally-take-the-trusted-key-paths-a.patch | 72 ++++++++++++++++++++++
 .../android-tools/android-tools_35.0.2.bb          |  7 ++-
 2 files changed, 78 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0023-libadbd_auth-optionally-take-the-trusted-key-paths-a.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0023-libadbd_auth-optionally-take-the-trusted-key-paths-a.patch
new file mode 100644
index 000000000000..581ecc85ce09
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/0023-libadbd_auth-optionally-take-the-trusted-key-paths-a.patch
@@ -0,0 +1,72 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Fri, 6 Nov 2026 09:38:18 +0000
+Subject: [PATCH] libadbd_auth: optionally take the trusted-key paths at build
+ time
+
+libadbd_auth reads trusted host keys from /adb_keys and
+/data/misc/adb/adb_keys, which are Android's locations and rarely exist
+on a Linux system - so a Linux adbd that requires authorization has
+nowhere to be given a key.
+
+When ADBD_AUTH_KEY_PATHS is passed to make - a colon-separated list -
+read keys from those files instead. They are still read on every attempt, so a key
+file that appears after adbd started is picked up.
+
+Without the define nothing changes.
+
+Upstream-Status: Pending
+
+AI-Generated: Claude Opus 5.5 (Claude Code)
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ debian/system/adbd.mk                         |  4 ++++
+ .../native/libs/adbd_auth/adbd_auth.cpp       | 19 ++++++++++++++++---
+ 2 files changed, 20 insertions(+), 3 deletions(-)
+
+diff --git a/debian/system/adbd.mk b/debian/system/adbd.mk
+index 5e2c5ccaea30..dc82b998e77a 100644
+--- a/debian/system/adbd.mk
++++ b/debian/system/adbd.mk
+@@ -113,6 +113,10 @@ ifeq ($(ADBD_AUTH_UNLESS_DEBUGGABLE),1)
+ CPPFLAGS += -DADBD_AUTH_UNLESS_DEBUGGABLE
+ endif
+ 
++ifneq ($(ADBD_AUTH_KEY_PATHS),)
++CPPFLAGS += -DADBD_AUTH_KEY_PATHS='"$(ADBD_AUTH_KEY_PATHS)"'
++endif
++
+ STATIC_LIBS = \
+   debian/out/system/libadb.a \
+   debian/out/system/libcrypto_utils.a \
+diff --git a/frameworks/native/libs/adbd_auth/adbd_auth.cpp b/frameworks/native/libs/adbd_auth/adbd_auth.cpp
+index 78896ed553c4..9b76c17b1b39 100644
+--- a/frameworks/native/libs/adbd_auth/adbd_auth.cpp
++++ b/frameworks/native/libs/adbd_auth/adbd_auth.cpp
+@@ -390,10 +390,23 @@ public:
+         }
+     }
+ 
+-    static constexpr const char* key_paths[] = {"/adb_keys", "/data/misc/adb/adb_keys"};
++#if defined(ADBD_AUTH_KEY_PATHS)
++    // A colon-separated list, for systems where AOSP's locations mean nothing.
++    // Read on every attempt, so a file that appears after adbd started counts.
++    static std::vector<std::string> KeyPaths() {
++        return android::base::Split(ADBD_AUTH_KEY_PATHS, ":");
++    }
++#else
++    static std::vector<std::string> KeyPaths() {
++        return {"/adb_keys", "/data/misc/adb/adb_keys"};
++    }
++#endif
+     void IteratePublicKeys(bool (*callback)(void*, const char*, size_t), void* opaque) {
+-        for (const auto& path : key_paths) {
+-            if (access(path, R_OK) == 0) {
++        for (const auto& path : KeyPaths()) {
++            if (path.empty()) {
++                continue;
++            }
++            if (access(path.c_str(), R_OK) == 0) {
+                 LOG(INFO) << "adbd_auth: loading keys from " << path;
+                 std::string content;
+                 if (!android::base::ReadFileToString(path, &content)) {
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
index 1a939b503601..b17d92d6e9bb 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
@@ -67,6 +67,7 @@ SRC_URI = "https://deb.debian.org/debian/pool/main/a/android-platform-tools/andr
            file://0020-adbd-signal-readiness-once-functionfs-is-serviced.patch \
            file://0021-liblog-optionally-read-ro.debuggable-from-build.prop.patch \
            file://0022-adbd-optionally-require-authorization-unless-the-bui.patch \
+           file://0023-libadbd_auth-optionally-take-the-trusted-key-paths-a.patch \
            "
 
 SRC_URI[orig.md5sum] = "352376965cdef7bd7505d8fefdd43d50"
@@ -223,7 +224,8 @@ do_compile() {
     for tool in ${TOOLS_TO_BUILD}; do
         oe_runmake -f ${S}/debian/system/${tool}.mk -C ${S} \
             ${@'HAVE_SYSTEMD=1' if bb.utils.contains('PACKAGECONFIG', 'systemd', True, False, d) else ''} \
-            ${@'ADBD_AUTH_UNLESS_DEBUGGABLE=1' if bb.utils.contains('PACKAGECONFIG', 'auth-unless-debuggable', True, False, d) else ''}
+            ${@'ADBD_AUTH_UNLESS_DEBUGGABLE=1' if bb.utils.contains('PACKAGECONFIG', 'auth-unless-debuggable', True, False, d) else ''} \
+            ${@'ADBD_AUTH_KEY_PATHS=' + d.getVar('ADBD_AUTH_KEY_PATHS') if d.getVar('ADBD_AUTH_KEY_PATHS') else ''}
     done
 }
 
@@ -271,6 +273,9 @@ BBCLASSEXTEND = "native"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 ADB_DEBUGGABLE_PROP_FILES ?= "${sysconfdir}/build.prop"
+# Where adbd reads trusted host keys, colon-separated. Empty keeps Android's
+# /adb_keys and /data/misc/adb/adb_keys.
+ADBD_AUTH_KEY_PATHS ?= ""
 # Apply Android's fs_config ownership/mode tables to files pushed by adbd to
 # /system, /vendor and /oem. Off by default: the tables describe Android
 # partition images and are meaningless on a generic Linux rootfs.

-- 
2.43.0

