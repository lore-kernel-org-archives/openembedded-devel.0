Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1096.1794332163540036057
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 09:36:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=TrvVO15Y;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso19507345e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 09:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794332162; x=1794936962; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CruFE0B+ab44eamVfh7YVrhzAIixmDzulNVGq/yfSXI=;
        b=TrvVO15YhxjaS5oA/sqWVAiPiMxyuGbZsGiMXOLOFlLRNHbeDGzM1HnZAZxigmcDq0
         qhO8V7dvjRY5BR9C3jAC3oaSuXwMvvRaVb7uY5ijusDA9gnbgwz3amS63dfIOPBtIeIY
         8q15lXV+lyYwLz5cypvkDzx2jDZ5baixc5P9zLXY5erA+PAJ9zdJ7TNIN1GW0dLn1j9h
         HMktkN/5TsFR71GXrmmpvIcPM+CgaIHoEdzHn+xfADeFaqtP+Vja7r1F24SqgIneWuWE
         Kep27OBrUZzpPfQSN5fBx3oNYN2eJdKJFfI9ZxdIHkVLrUvnncXVH6gOvqskanogDmSo
         YbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332162; x=1794936962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CruFE0B+ab44eamVfh7YVrhzAIixmDzulNVGq/yfSXI=;
        b=sdtffH3Ux7U9WOSxLilXYfDR+0Oi5m64OsKliIakrLyEo7AwN6J+SqeKiDmkGA0c2x
         OhcnCrj02uRT2+aijRXp0Jk3wrp4XK2bPR+qBvHqUsLy+BZbPOqwmq9uWJky91NcISb5
         15vKgwSj12FYUbl6sNGx7ysAQ7MUIEkSaXR0qb3SyjlzxWTTRXU+8NIQbLTKvwEprK5E
         Ug3nbwnbYr3YflsSA0VcV0v4eYJgXXEJD5Z3V8Mj3MsbDwBjxqYIgM4+JUwpbw4IX3dO
         HHRCBXo91iyt0WX6tRzvfWQAg8esEwJGzi46M8PXwS5fIkNwRLb90/bg6KoXoLCPQHns
         cd0g==
X-Gm-Message-State: APuU4Z/7Jv2zx8NAPegSSy/P28Kko6oVneZX4Vw8GKqd3NgGYWSJnciu
	EsCpRlKadflrXpupiBxTr2G8OYbnlg+st8r57Ptc8oVWARes58/tb3o7mXII/A==
X-Gm-Gg: AYBFou1+8229o4wJuVBwJQrMtOc9GEuLhUbuBgSAzMK9oHZ2EnpK37fY3VfFZzCqJo4
	LFSnvzFl3uDcVFJVzNYW9FoU0VRK5pt9DzdTQY84ht/ZsCJ7nZvUEsvORMYtkky6aCNIitimT/b
	mSDSPblBRHDhDChMNMswxg7vBHrpvGhwI2PxKSqV4ID/hBQ6Z7jCPnPYcpIdpNj98NUCzQ4vrs1
	H3aocXMLPwH9OPgMXW5zgLIj1VNLoqwvZCXHPpufY/Xh7qg2FK+Q06LDzPnPMQeNpqYVCCF6aT4
	yEH3QwOyKA6E9eW+NIhbczASv66ljvxdzovKopMvjVqTeRBi9EIaSmjB02iVjAHF+F5ExBAO9N1
	7TPHrpGmYaPE/dQ9KBTY7H60NJSprFDudGrfDLCrdqW5t+CdHHwW+5JAlqB2xjZ1ERcgRba1p3i
	VXzh4jb+M9Us3LHWUfXjgyU/2+k2UIfjruielBuLo0r4gvwMTzxa/wDDhuG/f9wbTDIKxunk2zM
	ek6bizxxbMqyGKxyjNbREpn3JRac6yUTHeGeZk4ZzRBOyYyx10GvmFG+jXi0OhrQYfgmezUgkNV
	P2MsuduMF4S9gmdmwIUQlNDvo5INChGgKIX3JoXSUU/VUeJ5ZNf4fLqg6EkXJuIWVQQC0dmxpom
	EljmdcdQciuWCX0HU7YQGNjxv
X-Received: by 2002:a05:600c:34c7:b0:4a2:133:45e1 with SMTP id 5b1f17b1804b1-4ba0234cccemr54824815e9.24.1794332161623;
        Tue, 10 Nov 2026 09:36:01 -0800 (PST)
Return-Path: <alex.kiernan@gmail.com>
Received: from [192.168.5.15] (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea9eesm122994405e9.11.2026.11.10.09.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:36:00 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 10 Nov 2026 17:35:36 +0000
Subject: [PATCH meta-oe 07/10] android-tools: add PACKAGECONFIG
 auth-unless-debuggable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-android-tools-adbd-v1-7-cc2176f381c3@gmail.com>
References: <20261110-android-tools-adbd-v1-0-cc2176f381c3@gmail.com>
In-Reply-To: <20261110-android-tools-adbd-v1-0-cc2176f381c3@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 17:36:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132104

Debian's adbd never asks a host for a key on Linux. With
auth-unless-debuggable a host must authenticate unless the build is
debuggable, checked for each connection so that a debuggable state that
appears while adbd runs applies at once. It needs debuggable-prop to mean
anything.

AI-Generated: Claude Opus 5.5 (Claude Code)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 ...ally-require-authorization-unless-the-bui.patch | 138 +++++++++++++++++++++
 .../android-tools/android-tools_35.0.2.bb          |   8 +-
 2 files changed, 145 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0022-adbd-optionally-require-authorization-unless-the-bui.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0022-adbd-optionally-require-authorization-unless-the-bui.patch
new file mode 100644
index 000000000000..e4115348fd31
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/0022-adbd-optionally-require-authorization-unless-the-bui.patch
@@ -0,0 +1,138 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Fri, 6 Nov 2026 09:38:18 +0000
+Subject: [PATCH] adbd: optionally require authorization unless the build is
+ debuggable
+
+On a Linux build adbd accepts every connection without a key check:
+Debian's "don't require authorization on Linux" sets auth_required to
+false unconditionally, because there is no property service to relax it
+on development builds the way Android does.
+
+When make is given ADBD_AUTH_UNLESS_DEBUGGABLE=1, leave auth_required alone
+and decide per connection instead: a host must authenticate unless
+__android_log_is_debuggable() says the build is debuggable. Deciding per
+connection rather than once at startup lets a debuggable state that
+appears while adbd runs (LIBLOG_DEBUGGABLE_PROP_FILES re-reads its files)
+take effect without a restart. The TLS client-certificate checks make
+the same decision.
+
+Without the define nothing changes.
+
+Upstream-Status: Pending
+
+AI-Generated: Claude Opus 5.5 (Claude Code)
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ debian/system/adbd.mk                |  4 ++++
+ packages/modules/adb/adb.cpp         |  2 +-
+ packages/modules/adb/adb_auth.h      |  4 ++++
+ packages/modules/adb/daemon/auth.cpp | 17 +++++++++++++++--
+ packages/modules/adb/daemon/main.cpp |  2 +-
+ 5 files changed, 25 insertions(+), 4 deletions(-)
+
+diff --git a/debian/system/adbd.mk b/debian/system/adbd.mk
+index a3f88f169b9b..5e2c5ccaea30 100644
+--- a/debian/system/adbd.mk
++++ b/debian/system/adbd.mk
+@@ -109,6 +109,10 @@ LDFLAGS += -lsystemd
+ CPPFLAGS += -DHAVE_SYSTEMD
+ endif
+ 
++ifeq ($(ADBD_AUTH_UNLESS_DEBUGGABLE),1)
++CPPFLAGS += -DADBD_AUTH_UNLESS_DEBUGGABLE
++endif
++
+ STATIC_LIBS = \
+   debian/out/system/libadb.a \
+   debian/out/system/libcrypto_utils.a \
+diff --git a/packages/modules/adb/adb.cpp b/packages/modules/adb/adb.cpp
+index 78bbfb6df48f..6e753484971c 100644
+--- a/packages/modules/adb/adb.cpp
++++ b/packages/modules/adb/adb.cpp
+@@ -392,7 +392,7 @@ static void handle_new_connection(atransport* t, apacket* p) {
+         // we'll just not verify the client's certificate. This should be the
+         // first packet the client receives to indicate the new protocol.
+         send_tls_request(t);
+-    } else if (!auth_required) {
++    } else if (!adbd_connection_auth_required()) {
+         LOG(INFO) << "authentication not required";
+         handle_online(t);
+         send_connect(t);
+diff --git a/packages/modules/adb/adb_auth.h b/packages/modules/adb/adb_auth.h
+index 38312211f3ad..e23ad2b089c7 100644
+--- a/packages/modules/adb/adb_auth.h
++++ b/packages/modules/adb/adb_auth.h
+@@ -51,6 +51,10 @@ void adb_auth_tls_handshake(atransport* t);
+ extern bool auth_required;
+ extern bool socket_access_allowed;
+ 
++// Whether a connection made now must authenticate. auth_required is decided
++// once at startup; this can also depend on state that changes while adbd runs.
++bool adbd_connection_auth_required();
++
+ void adbd_auth_init();
+ void adbd_auth_verified(atransport *t);
+ 
+diff --git a/packages/modules/adb/daemon/auth.cpp b/packages/modules/adb/daemon/auth.cpp
+index 7df15aedd58a..2bb0fa65aad5 100644
+--- a/packages/modules/adb/daemon/auth.cpp
++++ b/packages/modules/adb/daemon/auth.cpp
+@@ -37,6 +37,7 @@
+ #include <adb/tls/adb_ca_list.h>
+ #include <adbd_auth.h>
+ #include <android-base/file.h>
++#include <log/log_properties.h>
+ #include <android-base/no_destructor.h>
+ #include <android-base/strings.h>
+ #include <crypto_utils/android_pubkey.h>
+@@ -157,6 +158,18 @@ static uint32_t transport_auth_id = 0;
+ bool auth_required = true;
+ bool socket_access_allowed = true;
+ 
++bool adbd_connection_auth_required() {
++#if !defined(__ANDROID__) && defined(ADBD_AUTH_UNLESS_DEBUGGABLE)
++    // Off Android there is no property service to relax auth_required at
++    // startup, and whether the build is debuggable can change while adbd runs
++    // (see LIBLOG_DEBUGGABLE_PROP_FILES), so decide per connection: a
++    // debuggable build accepts any host, and anything else authenticates.
++    return auth_required && !__android_log_is_debuggable();
++#else
++    return auth_required;
++#endif
++}
++
+ static void* transport_to_callback_arg(atransport* transport) {
+     uint32_t id = transport_auth_id++;
+     (*transports)[id] = transport->weak();
+@@ -196,7 +209,7 @@ static void IteratePublicKeys(std::function<bool(std::string_view public_key)> f
+ }
+ 
+ bssl::UniquePtr<STACK_OF(X509_NAME)> adbd_tls_client_ca_list() {
+-    if (!auth_required) {
++    if (!adbd_connection_auth_required()) {
+         return nullptr;
+     }
+ 
+@@ -390,7 +403,7 @@ void adbd_notify_framework_connected_key(atransport* t) {
+ }
+ 
+ int adbd_tls_verify_cert(X509_STORE_CTX* ctx, std::string* auth_key) {
+-    if (!auth_required) {
++    if (!adbd_connection_auth_required()) {
+         // Any key will do.
+         LOG(INFO) << __func__ << ": auth not required";
+         return 1;
+diff --git a/packages/modules/adb/daemon/main.cpp b/packages/modules/adb/daemon/main.cpp
+index a5b1d6b3e0eb..d309e235b947 100644
+--- a/packages/modules/adb/daemon/main.cpp
++++ b/packages/modules/adb/daemon/main.cpp
+@@ -313,7 +313,7 @@ int adbd_main(int server_port) {
+         auth_required = android::base::GetBoolProperty("ro.adb.secure", false);
+ #endif
+     }
+-#else
++#elif !defined(ADBD_AUTH_UNLESS_DEBUGGABLE)
+     auth_required = false;
+ #endif
+ 
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
index d3d60b514721..1a939b503601 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
@@ -66,6 +66,7 @@ SRC_URI = "https://deb.debian.org/debian/pool/main/a/android-platform-tools/andr
            file://0019-adb-daemon-exit-after-adb-root-unroot-so-an-init-sup.patch \
            file://0020-adbd-signal-readiness-once-functionfs-is-serviced.patch \
            file://0021-liblog-optionally-read-ro.debuggable-from-build.prop.patch \
+           file://0022-adbd-optionally-require-authorization-unless-the-bui.patch \
            "
 
 SRC_URI[orig.md5sum] = "352376965cdef7bd7505d8fefdd43d50"
@@ -221,7 +222,8 @@ do_compile() {
 
     for tool in ${TOOLS_TO_BUILD}; do
         oe_runmake -f ${S}/debian/system/${tool}.mk -C ${S} \
-            ${@'HAVE_SYSTEMD=1' if bb.utils.contains('PACKAGECONFIG', 'systemd', True, False, d) else ''}
+            ${@'HAVE_SYSTEMD=1' if bb.utils.contains('PACKAGECONFIG', 'systemd', True, False, d) else ''} \
+            ${@'ADBD_AUTH_UNLESS_DEBUGGABLE=1' if bb.utils.contains('PACKAGECONFIG', 'auth-unless-debuggable', True, False, d) else ''}
     done
 }
 
@@ -277,4 +279,8 @@ PACKAGECONFIG[fs-config] = ""
 # build.prop format), so `adb root` is refused unless one of them sets
 # ro.debuggable=1. Off by default: every build is debuggable.
 PACKAGECONFIG[debuggable-prop] = ""
+# Require hosts to authenticate unless the build is debuggable, decided per
+# connection. Off by default, as in Debian: no host is asked for a key. Only
+# meaningful with debuggable-prop, without which every build is debuggable.
+PACKAGECONFIG[auth-unless-debuggable] = ""
 PACKAGECONFIG[systemd] = ",,systemd"

-- 
2.43.0

