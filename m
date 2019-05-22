Return-Path: <andrei@gherzan.ro>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0F6A07E326
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 13:14:23 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id g12so2245250wro.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 06:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.ro; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4iOO5k7MFSCYkRpEgapq3M01fRS8vhjQEa/oxScb6bE=;
	b=ETUQoYJy2D5KHWX8uI/yPbUFpQSkkK0fIQSVkWhjvJRFFYPNta93+o4IakhFasFKnn
	rp+TRBqGMDf9YLZwsNmP6Tkh+JOvFhEAmgzsDxZKYVvQg6usJChdXiQrYNpEjtTVHGSs
	4oix3jiRMzyOri1J0kEz3vVLJTP71Ds9XnH/Xy42HnUyDxbqQHALrgeX2qC8BdfBProm
	S9bP+eZAcDfZHpart3yGjp9mpVXUwvbYH6J9Soh49yQXeiohLuikYOaJl8w9Aus/SLUd
	Qnv51YGMrR1WfNL4Iakjo6pLTymFQ1meG/or61XQaNNS83Azm8D8P8WVmqE9+m0Tl2Kf
	I3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4iOO5k7MFSCYkRpEgapq3M01fRS8vhjQEa/oxScb6bE=;
	b=ZjFAYpW4jB12eLlvocOwUPXpODR7SXAvCuO3/+KCi1kMNRS+XLwGV9L1W/VpyXqfjY
	Z6Qv+8h1gke2om7bmfKcIEWmlQVmaWb8HEcxmQoPZEg2/evcybvP73KOFRjEgcgf+whW
	Dn8P62EAbUeWD0slLu3FIS7CBQxWOtQ203kf03K9Y23nLWzEXcMXk1QWmkjDeUL7Yo4F
	9alxfCfeROAg2PMvExx5Kh84uBHGrKGnd5BwfW1hmrcK+7N+mkpn5RfcGHYttioQpFBk
	9CQr3/EZDCcsT2fGTLtUHrlBsMVybsb3YQaQL+6rxRyS6REacRscQDSGfy1fox8usr/V
	fv1Q==
X-Gm-Message-State: APjAAAU/vWnlCCVJEsFWePJjziSAYtMHc/lnjRXAHBCERTsj29f8CRyI
	FbCA6hlzc/p7ILprgVwgVO2kIN1Sjho=
X-Google-Smtp-Source: APXvYqzUeOfuCjTofn986WB3UGU+MGp2HA5vYoWsudiMA3fIdxXCY2BHHffGAD+zMwMvoH7Gc29zAA==
X-Received: by 2002:adf:db81:: with SMTP id u1mr25751324wri.296.1558530864292; 
	Wed, 22 May 2019 06:14:24 -0700 (PDT)
Received: from localhost.localdomain (host90-152-4-101.ipv4.regusnet.com.
	[90.152.4.101]) by smtp.gmail.com with ESMTPSA id
	g2sm26690027wru.37.2019.05.22.06.14.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 May 2019 06:14:23 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 May 2019 14:13:45 +0100
Message-Id: <20190522131345.10392-1-andrei@gherzan.ro>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: Andrei Gherzan <andrei@gherzan.ro>
Subject: [meta-networking][PATCH] networkmanager: Update to 1.18.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 May 2019 13:14:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

One patch was dropped (0003-dlopen-failure.patch) as a similar one was
merged upstream. See:
https://github.com/NetworkManager/NetworkManager/commit/bd4957fcd78a0e64d26459e94ab3b84c91cd6f5f

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 .../networkmanager/0003-dlopen-failure.patch  | 34 -------------------
 ...ger_1.16.0.bb => networkmanager_1.18.0.bb} |  6 ++--
 2 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-dlopen-failure.patch
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.16.0.bb => networkmanager_1.18.0.bb} (96%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-dlopen-failure.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-dlopen-failure.patch
deleted file mode 100644
index e99c22710..000000000
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-dlopen-failure.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 57239fda56b68a8f3e413f7b6af5290ba0d86636 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Thu, 22 Mar 2018 18:18:06 +0100
-Subject: [PATCH] musl: dlopen is included so LD_LIBS="" instead of
- LD_LIBS="none required"
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Pending
-
-Stolen from [1] and prettyfied slightly
-
-[1] https://github.com/voidlinux/void-packages/tree/master/srcpkgs/NetworkManager/patches
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
----
- configure.ac | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/configure.ac b/configure.ac
-index 487a266..96ae4f7 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -235,6 +235,7 @@ dnl
- dnl Checks for libdl - on certain platforms its part of libc
- dnl
- AC_SEARCH_LIBS([dlopen], [dl dld], [], [ac_cv_search_dlopen=])
-+AS_IF([test "$ac_cv_search_dlopen" = "none required"],[ac_cv_search_dlopen=""])
- AC_SUBST([DL_LIBS], "$ac_cv_search_dlopen")
- 
- PKG_CHECK_MODULES(GLIB, [gio-unix-2.0 >= 2.37.6 gmodule-2.0],
--- 
-2.14.3
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.16.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.0.bb
similarity index 96%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.16.0.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.0.bb
index 9f01f1bc1..9215a8676 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.16.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.0.bb
@@ -26,15 +26,13 @@ SRC_URI = " \
     ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
     file://0001-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch \
     file://0002-Do-not-create-settings-settings-property-documentati.patch \
-    file://0003-dlopen-failure.patch \
 "
 SRC_URI_append_libc-musl = " \
     file://musl/0001-Fix-build-with-musl-systemd-specific.patch \
     file://musl/0002-Fix-build-with-musl.patch \
 "
-
-SRC_URI[md5sum] = "10abacaafb162a67d2942adf03e7e9e4"
-SRC_URI[sha256sum] = "8e962833b6ca03edda1bc57ed6614a7b8c2339531b44acef098d05f2324c5d2c"
+SRC_URI[md5sum] = "c8c27116a8083bab5d5fcca0d03e988a"
+SRC_URI[sha256sum] = "c6e8df25e5a3c7309bc17664be8971689314884cdd08afdd6b0847d29d2a8ba6"
 
 UPSTREAM_CHECK_URI = "${GNOME_MIRROR}/NetworkManager/1.16/"
 UPSTREAM_CHECK_REGEX = "NetworkManager\-(?P<pver>1\.10(\.\d+)+).tar.xz"
-- 
2.17.1


