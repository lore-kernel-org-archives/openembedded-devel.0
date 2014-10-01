Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 0DCEB65F77
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2014 08:19:25 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id cc10so927350wib.17
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Oct 2014 01:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=x+EG5dJf7cDeXbFxyIu0dZZXiYcmkEaIgMP4E31Ld8U=;
	b=Y16c02WnN5QOXkoDvnJTYrleBXbFzMFg8APX1qXkv1ndfNN1ijp6THHNgPTt8d/NcR
	8DmJjN0ogkEzHTVVbCLWxK43tgc//MO8mDoDadRwDMZ2R2iGI7uan7fhM73lrZ3BtS0V
	byXf8tPg9WeUyPmr8/yNGCSTZCIvLpUgvMk6diq6bBQ5yQU49KZQ8MA+uSk9UAcnHk2a
	2nHI8KRuVIeLceukIDHwRvSu0+REHVnPbkSeyVKGOaE9WG5Si86qCf1YnzYRilItBdhC
	ZS26EPGrOv5xHJ5jURae/sUMad9f7gq9m/9hPUUrmqIHxtcFIWYttO+1vaOOD3ypZRaw
	Binw==
X-Received: by 10.194.24.169 with SMTP id v9mr19834467wjf.114.1412151566332;
	Wed, 01 Oct 2014 01:19:26 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-251.hsi05.unitymediagroup.de. [176.198.252.251])
	by mx.google.com with ESMTPSA id kx2sm340789wjb.6.2014.10.01.01.19.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Oct 2014 01:19:25 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Oct 2014 10:19:03 +0200
Message-Id: <1412151555-19865-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1412151555-19865-1-git-send-email-schnitzeltony@googlemail.com>
References: <1412151555-19865-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-oe 03/15] networkmanager update to 0.9.8.10
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Oct 2014 08:19:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* use nss as default crypto engine to get out of blacklist due to missing gcrypt

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...ger.service-remove-reference-to-NetworkMa.patch | 32 ----------------------
 ...nager_0.9.8.0.bb => networkmanager_0.9.8.10.bb} | 11 +++-----
 2 files changed, 4 insertions(+), 39 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-NetworkManager.service-remove-reference-to-NetworkMa.patch
 rename meta-oe/recipes-connectivity/networkmanager/{networkmanager_0.9.8.0.bb => networkmanager_0.9.8.10.bb} (87%)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-NetworkManager.service-remove-reference-to-NetworkMa.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-NetworkManager.service-remove-reference-to-NetworkMa.patch
deleted file mode 100644
index bbcd021..0000000
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-NetworkManager.service-remove-reference-to-NetworkMa.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 1137846f778dc9f3be0c89cb2df18d3a37f844d7 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Fri, 19 Apr 2013 18:34:09 +0200
-Subject: [PATCH] NetworkManager.service: remove reference to
- NetworkManager-wait-online.service
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-* NetworkManager-wait-online.service crashes
-* NetworkManager works fine without NetworkManager-wait-online
-
-Upstream-Status: Inappropriate [config]
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- data/NetworkManager.service.in |    1 -
- 1 files changed, 0 insertions(+), 1 deletions(-)
-
-diff --git a/data/NetworkManager.service.in b/data/NetworkManager.service.in
-index 16b53b6..a2e913c 100644
---- a/data/NetworkManager.service.in
-+++ b/data/NetworkManager.service.in
-@@ -18,5 +18,4 @@ KillMode=process
- [Install]
- WantedBy=multi-user.target
- Alias=dbus-org.freedesktop.NetworkManager.service
--Also=NetworkManager-wait-online.service
- 
--- 
-1.7.4.4
-
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.10.bb
similarity index 87%
rename from meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb
rename to meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.10.bb
index bdda59c..0792e8e 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.10.bb
@@ -4,20 +4,17 @@ SECTION = "net/misc"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b"
 
-DEPENDS = "libnl dbus dbus-glib udev wireless-tools gnutls util-linux ppp"
-
-PNBLACKLIST[networkmanager] = "BROKEN: needs to detect gcrypt from pkg-config (error: gnutls explicitly requested but gcrypt not found on system)"
+DEPENDS = "libnl dbus dbus-glib udev wireless-tools nss util-linux ppp"
 
 inherit gnome gettext systemd
 
 SRC_URI = " \
     ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
     file://0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch \
-    file://0002-NetworkManager.service-remove-reference-to-NetworkMa.patch \
     file://0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch \
 "
-SRC_URI[md5sum] = "38d28f6bd9220d85dfff47210706195c"
-SRC_URI[sha256sum] = "c366bcded6354d8186ad93c05d26d6a20bc550aa0391f974704e7a60e9f6096b"
+SRC_URI[md5sum] = "aad2558887e25417c52eb2deaade2f85"
+SRC_URI[sha256sum] = "064d27223d3824859df12e1fb25b787fec1c68bbc864dc52a0289b9211c4c972"
 
 
 S = "${WORKDIR}/NetworkManager-${PV}"
@@ -28,7 +25,7 @@ EXTRA_OECONF = " \
     --disable-ifnet \
     --disable-ifcfg-suse \
     --with-netconfig \
-    --with-crypto=gnutls \
+    --with-crypto=nss \
     --disable-more-warnings \
     --with-dhclient=${base_sbindir}/dhclient \
     --with-iptables=${sbindir}/iptables \
-- 
1.8.3.1


