Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE3DC5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 07:51:08 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.10824.1749023457868412065
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Jun 2025 00:50:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FLeRlPLe;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-442f4a3a4d6so3489025e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Jun 2025 00:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1749023456; x=1749628256; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FUoBNDxoOnvFzI577EcJaPj+BEIlKblGG/dhmzxWMWs=;
        b=FLeRlPLetgIHGBcz3KfFjLndaGvRJ5Iu1FTU++dYCfUgQUY4DT1UHv9xeJXdrfnkAd
         JVS0MG/0+nlnF97z7eqdClhA7S0UcKlBQXWgEB8LUhhgXypZZL/RN/R8PFVyejlykMCS
         BCyPq1UjBAndqKmorC3ILfS534AXsDOUx9SfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749023456; x=1749628256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FUoBNDxoOnvFzI577EcJaPj+BEIlKblGG/dhmzxWMWs=;
        b=rc/U8IK0BffWpyCQwpGJZngmDnsa3eZwM7+dLcMo5xmIO5GkouORt9E0jfZP08r62U
         ktsL+ymXe4REk+vRKfbeeqrrCz42XcfwYv6R3auh4lgL4/oMIAV3Y1aqoKkzKDwGO3w3
         /jdf5K/4floXq5CjsRWF0Br2K6agZLors7wczzi9wwxPHJGIOH+3wiW407qBFBwAy0v+
         TQpFOVjIBb7018UNXLYHGfTVdD/fB/NM4Qil7IXz7JPzl+DgQAMjBctJREFurPgzSpzR
         7ZKS4yqcddItkyktB0lLUmW89iDQCyK8k9+Ouy/BXvtpaM/Q7zwCq3XlNfU6WsEUPfk/
         ncVQ==
X-Gm-Message-State: AOJu0YzLhSsug2VUFHjn5Ofxdwe264XF1C2emDp23buDcj2TiP+/XHOh
	5x3r/nhVqbhFUuuuRnpi4EfPAOPqCY9Tlt4w0acKjKGCXdf/Nnx3urIVtVqLzRTzfXIYKBW1YqO
	1FxNaBYg=
X-Gm-Gg: ASbGncu40qxFVsJWdj+klSKRhr67Ho3CkR745hxJuqGazOZJpeFs/EUC9ef8pODj+96
	Lfpl+kf/Q7N8CFc6XshYPsTQ0mbQsGvSlyBp+8kRWODhoLfxm6oOehTg+nxNUiAPlHMZGwmNlWF
	PJrHWB4UKsPBT26j2Mv8aV4vdT6+jK3P7/UFeJMUROuipzkRxDfYG6NE5Sg9bi7OYi1T4LtfYFL
	T92auAur3CRxpcV0sPpxlRT4uzoszTLx/PQgF0qYJpJeRPfmN2ED6BGbKvWY73YF9NAfLj455jv
	7X2152GIQ0FahCl49gq2rUfM8P68EcNAxpdZyC/X83EeVIdEUs+uEZIhF06RopUHLIZw9YDltPj
	4jwHTodrCbXfarxZkLJi6WSJQsgpgfKl3t0nxQxqYGRnjLTecFCAZpdJ040U=
X-Google-Smtp-Source: AGHT+IHn/Av1pNgtvO7gb0bK4YLWjFdhMaIBOBNyi1HhmV5TD3VXeoaLPnwwh6xBIGMH7w3jZkA9AA==
X-Received: by 2002:a05:600c:1392:b0:43b:c857:e9d7 with SMTP id 5b1f17b1804b1-451efdfe205mr14302705e9.5.1749023455721;
        Wed, 04 Jun 2025 00:50:55 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0017b58d8bf04048c3.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17b5:8d8b:f040:48c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f1b0a4sm190196925e9.0.2025.06.04.00.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 00:50:55 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
Subject: [RFC PATCH] reproducibility: move known non-repro list to the new common file
Date: Wed,  4 Jun 2025 09:50:48 +0200
Message-Id: <20250604075048.2463619-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jun 2025 07:51:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117731

From: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>

Since commit [insert here merged OE-Core commit], the reproducible
test uses the known_non_repro.inc file to get the known non-reproducible
package list from each layers.

This patch moves the ad-hoc file to this new common interface.

Co-Developed-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
---
RFC: This is the application/example of
[PATCH] reproducible: allow each layer to define its known non-repro packages
https://lists.openembedded.org/g/openembedded-core/message/217827
---
 .../{non-repro-meta-filesystems.inc => known_non_repro.inc}     | 2 +-
 .../include/{non-repro-meta-gnome.inc => known_non_repro.inc}   | 2 +-
 .../{non-repro-meta-initramfs.inc => known_non_repro.inc}       | 2 +-
 .../{non-repro-meta-multimedia.inc => known_non_repro.inc}      | 2 +-
 .../{non-repro-meta-networking.inc => known_non_repro.inc}      | 2 +-
 .../conf/include/{non-repro-meta-oe.inc => known_non_repro.inc} | 2 +-
 .../include/{non-repro-meta-perl.inc => known_non_repro.inc}    | 2 +-
 .../include/{non-repro-meta-python.inc => known_non_repro.inc}  | 2 +-
 .../{non-repro-meta-webserver.inc => known_non_repro.inc}       | 2 +-
 .../include/{non-repro-meta-xfce.inc => known_non_repro.inc}    | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)
 rename meta-filesystems/conf/include/{non-repro-meta-filesystems.inc => known_non_repro.inc} (78%)
 rename meta-gnome/conf/include/{non-repro-meta-gnome.inc => known_non_repro.inc} (86%)
 rename meta-initramfs/conf/include/{non-repro-meta-initramfs.inc => known_non_repro.inc} (73%)
 rename meta-multimedia/conf/include/{non-repro-meta-multimedia.inc => known_non_repro.inc} (89%)
 rename meta-networking/conf/include/{non-repro-meta-networking.inc => known_non_repro.inc} (95%)
 rename meta-oe/conf/include/{non-repro-meta-oe.inc => known_non_repro.inc} (98%)
 rename meta-perl/conf/include/{non-repro-meta-perl.inc => known_non_repro.inc} (86%)
 rename meta-python/conf/include/{non-repro-meta-python.inc => known_non_repro.inc} (95%)
 rename meta-webserver/conf/include/{non-repro-meta-webserver.inc => known_non_repro.inc} (80%)
 rename meta-xfce/conf/include/{non-repro-meta-xfce.inc => known_non_repro.inc} (80%)

diff --git a/meta-filesystems/conf/include/non-repro-meta-filesystems.inc b/meta-filesystems/conf/include/known_non_repro.inc
similarity index 78%
rename from meta-filesystems/conf/include/non-repro-meta-filesystems.inc
rename to meta-filesystems/conf/include/known_non_repro.inc
index 509907d889..bf0d08fdc0 100644
--- a/meta-filesystems/conf/include/non-repro-meta-filesystems.inc
+++ b/meta-filesystems/conf/include/known_non_repro.inc
@@ -1,6 +1,6 @@
 # List of known non-reproducible package of the meta-filesystems layer
 # Please keep this list sorted
-KNOWN_NON_REPRO_META_FILESYSTEMS = " \
+KNOWN_NON_REPRO_PACKAGES_LIST += " \
     e2tools-ptest \
     xfsprogs-doc \
 "
diff --git a/meta-gnome/conf/include/non-repro-meta-gnome.inc b/meta-gnome/conf/include/known_non_repro.inc
similarity index 86%
rename from meta-gnome/conf/include/non-repro-meta-gnome.inc
rename to meta-gnome/conf/include/known_non_repro.inc
index 553bc32cc6..46701a8905 100755
--- a/meta-gnome/conf/include/non-repro-meta-gnome.inc
+++ b/meta-gnome/conf/include/known_non_repro.inc
@@ -1,6 +1,6 @@
 # List of known non-reproducible package of the meta-gnome layer
 # Please keep this list sorted
-KNOWN_NON_REPRO_META_GNOME = " \
+KNOWN_NON_REPRO_PACKAGES_LIST += " \
     geary \
     geary-dbg \
     gegl-dev \
diff --git a/meta-initramfs/conf/include/non-repro-meta-initramfs.inc b/meta-initramfs/conf/include/known_non_repro.inc
similarity index 73%
rename from meta-initramfs/conf/include/non-repro-meta-initramfs.inc
rename to meta-initramfs/conf/include/known_non_repro.inc
index c05f59d1a2..6395d20fc1 100755
--- a/meta-initramfs/conf/include/non-repro-meta-initramfs.inc
+++ b/meta-initramfs/conf/include/known_non_repro.inc
@@ -1,3 +1,3 @@
 # List of known non-reproducible package of the meta-initramfs layer
 # Please keep this list sorted
-KNOWN_NON_REPRO_META_INITRAMFS = ""
+KNOWN_NON_REPRO_PACKAGES_LIST += ""
diff --git a/meta-multimedia/conf/include/non-repro-meta-multimedia.inc b/meta-multimedia/conf/include/known_non_repro.inc
similarity index 89%
rename from meta-multimedia/conf/include/non-repro-meta-multimedia.inc
rename to meta-multimedia/conf/include/known_non_repro.inc
index b02de42eb9..524c3c80dd 100755
--- a/meta-multimedia/conf/include/non-repro-meta-multimedia.inc
+++ b/meta-multimedia/conf/include/known_non_repro.inc
@@ -1,6 +1,6 @@
 # List of known non-reproducible package of the meta-multimedia layer
 # Please keep this list sorted
-KNOWN_NON_REPRO_META_MULTIMEDIA = " \
+KNOWN_NON_REPRO_PACKAGES_LIST += " \
     crossguid \
     libcamera \
     libcamera-dbg \
diff --git a/meta-networking/conf/include/non-repro-meta-networking.inc b/meta-networking/conf/include/known_non_repro.inc
similarity index 95%
rename from meta-networking/conf/include/non-repro-meta-networking.inc
rename to meta-networking/conf/include/known_non_repro.inc
index 16240df059..68d293ff7f 100755
--- a/meta-networking/conf/include/non-repro-meta-networking.inc
+++ b/meta-networking/conf/include/known_non_repro.inc
@@ -1,6 +1,6 @@
 # List of known non-reproducible package of the meta-networking layer
 # Please keep this list sorted
-KNOWN_NON_REPRO_META_NETWORKING = " \
+KNOWN_NON_REPRO_PACKAGES_LIST += " \
     babeld \
     babeld-dbg \
     dhcp-relay-staticdev \
diff --git a/meta-oe/conf/include/non-repro-meta-oe.inc b/meta-oe/conf/include/known_non_repro.inc
similarity index 98%
rename from meta-oe/conf/include/non-repro-meta-oe.inc
rename to meta-oe/conf/include/known_non_repro.inc
index ae4fb1d194..e621259466 100755
--- a/meta-oe/conf/include/non-repro-meta-oe.inc
+++ b/meta-oe/conf/include/known_non_repro.inc
@@ -1,6 +1,6 @@
 # List of known non-reproducible package of the meta-oe layer
 # Please keep this list sorted
-KNOWN_NON_REPRO_META_OE = " \
+KNOWN_NON_REPRO_PACKAGES_LIST += " \
     apitrace \
     apitrace-dbg \
     asio-dbg \
diff --git a/meta-perl/conf/include/non-repro-meta-perl.inc b/meta-perl/conf/include/known_non_repro.inc
similarity index 86%
rename from meta-perl/conf/include/non-repro-meta-perl.inc
rename to meta-perl/conf/include/known_non_repro.inc
index 9082691f67..81da990ba8 100755
--- a/meta-perl/conf/include/non-repro-meta-perl.inc
+++ b/meta-perl/conf/include/known_non_repro.inc
@@ -1,6 +1,6 @@
 # List of known non-reproducible package of the meta-perl layer
 # Please keep this list sorted
-KNOWN_NON_REPRO_META_PERL = " \
+KNOWN_NON_REPRO_PACKAGES_LIST += " \
     libencode-perl-src \
     libhtml-tree-perl \
     libhtml-tree-perl-doc \
diff --git a/meta-python/conf/include/non-repro-meta-python.inc b/meta-python/conf/include/known_non_repro.inc
similarity index 95%
rename from meta-python/conf/include/non-repro-meta-python.inc
rename to meta-python/conf/include/known_non_repro.inc
index 03d3fefba5..71cc6efd43 100755
--- a/meta-python/conf/include/non-repro-meta-python.inc
+++ b/meta-python/conf/include/known_non_repro.inc
@@ -1,6 +1,6 @@
 # List of known non-reproducible package of the meta-python layer
 # Please keep this list sorted
-KNOWN_NON_REPRO_META_PYTHON = " \
+KNOWN_NON_REPRO_PACKAGES_LIST += " \
     python3-evdev \
     python3-evdev-dbg \
     python3-evdev-src \
diff --git a/meta-webserver/conf/include/non-repro-meta-webserver.inc b/meta-webserver/conf/include/known_non_repro.inc
similarity index 80%
rename from meta-webserver/conf/include/non-repro-meta-webserver.inc
rename to meta-webserver/conf/include/known_non_repro.inc
index ee998ea961..f7461e83d1 100755
--- a/meta-webserver/conf/include/non-repro-meta-webserver.inc
+++ b/meta-webserver/conf/include/known_non_repro.inc
@@ -1,6 +1,6 @@
 # List of known non-reproducible package of the meta-webserver layer
 # Please keep this list sorted
-KNOWN_NON_REPRO_META_WEBSERVER = " \
+KNOWN_NON_REPRO_PACKAGES_LIST += " \
     netdata \
     netdata-dbg \
     php-phar \
diff --git a/meta-xfce/conf/include/non-repro-meta-xfce.inc b/meta-xfce/conf/include/known_non_repro.inc
similarity index 80%
rename from meta-xfce/conf/include/non-repro-meta-xfce.inc
rename to meta-xfce/conf/include/known_non_repro.inc
index aad6b0c24d..b227b29cd5 100755
--- a/meta-xfce/conf/include/non-repro-meta-xfce.inc
+++ b/meta-xfce/conf/include/known_non_repro.inc
@@ -1,6 +1,6 @@
 # List of known non-reproducible package of the meta-xfce layer
 # Please keep this list sorted
-KNOWN_NON_REPRO_META_XFCE = " \
+KNOWN_NON_REPRO_PACKAGES_LIST += " \
     catfish \
     libsamba-util0 \
     samba-dbg \

