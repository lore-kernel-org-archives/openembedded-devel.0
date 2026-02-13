Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B321EDF178
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 15:42:34 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.74773.1770997352709097376
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Feb 2026 07:42:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d4WzMIZp;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4362507f396so1059229f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 07:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770997351; x=1771602151; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LQjbZYQZJTpimUDqsaGOgPqRU377uX2Fj/Uz5C+q+PY=;
        b=d4WzMIZp1en5V11gpxxMI0/LCgRSOUqs0Db2Ig95Edv286qa5ixalDysKnODLWMy62
         +MaIIq+XRlKmYTqQEHqSsfw93MMx+fZiOujRYBdGcnPOx8xn9SJae3h2Z8oYHTq1xTSL
         B9WDJVf7CL6/GY3Fwyuq2Lqg4FnSksTnB7aEoj26TMpn/3ED/q1GyFqYd1lVm593yv9U
         CKxQBX6EX+RElmPA3EZznhf23Zi1plyYKu1MIubcNcdl6aqhbmVAWxITNAeI1AO4iMKP
         0th1syYjyatY5L19H4damqAIlWUbWZQuBe+SATmIl8axF+l23EAn74+jOfXdBu2HD0IL
         N9fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770997351; x=1771602151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LQjbZYQZJTpimUDqsaGOgPqRU377uX2Fj/Uz5C+q+PY=;
        b=R16Dr3/uFWukDxdHHkCh+tXpDo0yf794wXCmkb+T4gOLtUuCvvLZWqlOcKlcvuNC5n
         aITzBU1TQ9rX/6LVGxwiS9oVdoQXof07/m4xoLI7WpxzAO9xlZpP2SVoiIzgcpECqtjk
         xKjXSuVp6O0wi7Gif002tL4BrIC/yTKNMs6914VFZscpL4XBYoWyDNwqkhAxAm00SUnF
         L1Kd53ULXyfuV5MUic58ty+QXTfZa/AwQNPVGg3ghfm+vUDdRBEktRDPvrB8TtULrZEr
         S6SLK9J9bb/IgVZlYec+sZbxvNy2Co+QF8ynDDxZ+wI4XLmgs0OWv/7OMk4Wq2pZd10C
         Qe/g==
X-Gm-Message-State: AOJu0Yzh/lUWv9AKREkOOZqNPXTRDy3W+qzubXfGHW20uXXho+18Vljt
	2JP2253ipA0DSg5rTC9As6bamUvNOHAt+febLuIW/2jyHk0KZEBjkRyQuC4qiA==
X-Gm-Gg: AZuq6aI38bBXmz4KY//F0ZflL8nGOXyGIXYcxWF5Cq1rG8bZaEWURAH3FDNJesBOgzY
	QNcirXM9fcO4Q1YHiHmC4SCrHRx1zitKmuGlMpD51bAU/kJPZLgbUyjoIP1mEZQNiSlvZBkOxhi
	UrCuY6ExBsZ0o3c/y5sBbIWQy9x6gyTgSgaNxKQaCKpc0IeBLv7R9NKyrgkbiuzVDIU1LiLnSNK
	YcfZON1cuCQ7lpFsZ0TF59lFGAOYQiCjFxQmBJmFL+CQaZPZD/TGby8oVYgYbZP8cwomT/uft9v
	D+/+2oNeVB9syq42raV1Aq6O9nVQnklZwlNyMlrisAjS8G/8KcvDYdng8K4nTAk5TC1rLBrPvaS
	bh0zqYu8RtgPo+s9BkEgkyk/0SZNoxYHl+yXexb5NarOTUMYfu91/vDdL/jnRvSvvuEH4pxpfkV
	Fg8NuFJZKl+HPlVVL101DR
X-Received: by 2002:a05:6000:228a:b0:437:65ff:e83 with SMTP id ffacd0b85a97d-437978dc178mr4023490f8f.20.1770997350677;
        Fri, 13 Feb 2026 07:42:30 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6c1b4sm5807957f8f.14.2026.02.13.07.42.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 07:42:30 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 1/5] ez-ipupdate: patch CVE-2003-0887
Date: Fri, 13 Feb 2026 16:42:25 +0100
Message-ID: <20260213154229.1329476-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 15:42:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124390

Details: https://nvd.nist.gov/vuln/detail/CVE-2003-0887

The vulnerability is about the default (example) configurations,
which place cache files into the /tmp folder, that is world-writeable.
The recommendation would be to place them to a more secure folder.

The recipe however does not install these example configurations,
and as such it is not vulnerable either.

Just to make sure, patch these folders to a non-tmp folder
(and also install that folder, empty).

Some more discussion about the vulnerability:
https://bugzilla.suse.com/show_bug.cgi?id=48161

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit dd81ffdb685bd9c2ce1b27d0e5ff3f8e5551e3ad)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../ez-ipupdate/ez-ipupdate_3.0.11b7.bb       |   7 +
 .../ez-ipupdate/files/CVE-2003-0887.patch     | 158 ++++++++++++++++++
 2 files changed, 165 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/ez-ipupdate/files/CVE-2003-0887.patch

diff --git a/meta-networking/recipes-connectivity/ez-ipupdate/ez-ipupdate_3.0.11b7.bb b/meta-networking/recipes-connectivity/ez-ipupdate/ez-ipupdate_3.0.11b7.bb
index 8648f2e0e6..4287bf7d3d 100644
--- a/meta-networking/recipes-connectivity/ez-ipupdate/ez-ipupdate_3.0.11b7.bb
+++ b/meta-networking/recipes-connectivity/ez-ipupdate/ez-ipupdate_3.0.11b7.bb
@@ -9,8 +9,15 @@ SRC_URI = "http://sourceforge.net/projects/ez-ipupdate/files/${BPN}/${PV}/${BPN}
     file://cache_file.c.patch \
     file://conf_file.c.patch \
     file://wformat.patch \
+    file://CVE-2003-0887.patch \
     "
 SRC_URI[md5sum] = "525be4550b4461fdf105aed8e753b020"
 SRC_URI[sha256sum] = "a15ec0dc0b78ec7578360987c68e43a67bc8d3591cbf528a323588830ae22c20"
 
 inherit autotools pkgconfig
+
+do_install:append(){
+    install -m 0744 -d ${D}${localstatedir}/lib/ez-ipupdate
+}
+
+FILES:${PN} += "${localstatedir}/lib/ez-ipupdate"
diff --git a/meta-networking/recipes-connectivity/ez-ipupdate/files/CVE-2003-0887.patch b/meta-networking/recipes-connectivity/ez-ipupdate/files/CVE-2003-0887.patch
new file mode 100644
index 0000000000..53aa355008
--- /dev/null
+++ b/meta-networking/recipes-connectivity/ez-ipupdate/files/CVE-2003-0887.patch
@@ -0,0 +1,158 @@
+From cd8fa738b0ed3b5fb89ac00068fdc2e20c1b6169 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Mon, 2 Feb 2026 14:03:01 +0100
+Subject: [PATCH] CVE-2003-0887
+
+The vulnerability is about exmaple config files placing cache files
+into a world-writable directory (/tmp) instead of something more
+secure.
+
+This patch changes this path to /var/lib/ez-ipupdate, which is
+not world-writable by default.
+
+CVE: CVE-2003-0887
+Upstream-Status: Inactive-Upstream [lastcommit: 2002]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ example-dhs.conf       | 2 +-
+ example-dyndns.conf    | 2 +-
+ example-dyns.conf      | 2 +-
+ example-easydns.conf   | 2 +-
+ example-gnudip.conf    | 2 +-
+ example-heipv6tb.conf  | 2 +-
+ example-justlinux.conf | 2 +-
+ example-ods.conf       | 2 +-
+ example-pgpow.conf     | 2 +-
+ example-tzo.conf       | 2 +-
+ 10 files changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/example-dhs.conf b/example-dhs.conf
+index 3fe9a04..f976ae5 100755
+--- a/example-dhs.conf
++++ b/example-dhs.conf
+@@ -11,7 +11,7 @@ host=mydomain.whatever.com
+ interface=eth1
+ 
+ # if you use run-as ensure the user has permission to write this file
+-cache-file=/tmp/ez-ipupdate.cache
++cache-file=/var/lib/ez-ipupdate/ez-ipupdate.cache
+ 
+ # uncomment this once you have everything working how you want and you are
+ # ready to have ez-ipupdate running in the background all the time. to stop it
+diff --git a/example-dyndns.conf b/example-dyndns.conf
+index f539dec..84b4807 100755
+--- a/example-dyndns.conf
++++ b/example-dyndns.conf
+@@ -19,7 +19,7 @@ max-interval=2073600
+ #cache-file=/etc/ez-ipupdate.cache.eth1
+ 
+ # for the mean time we'll just use a cache file in the temp directory
+-cache-file=/tmp/ez-ipupdate.cache
++cache-file=/var/lib/ez-ipupdate/ez-ipupdate.cache
+ 
+ # uncomment this once you have everything working how you want and you are
+ # ready to have ez-ipupdate running in the background all the time. to stop it
+diff --git a/example-dyns.conf b/example-dyns.conf
+index 868768d..856a4d7 100644
+--- a/example-dyns.conf
++++ b/example-dyns.conf
+@@ -11,7 +11,7 @@ host=myhost
+ #interface=eth1
+ 
+ # if you use run-as ensure the user has permission to write this file
+-#cache-file=/tmp/ez-ipupdate.cache
++#cache-file=/var/lib/ez-ipupdate/ez-ipupdate.cache
+ 
+ # uncomment this once you have everything working how you want and you are
+ # ready to have ez-ipupdate running in the background all the time. to stop it
+diff --git a/example-easydns.conf b/example-easydns.conf
+index 0ff20da..15d9b78 100755
+--- a/example-easydns.conf
++++ b/example-easydns.conf
+@@ -11,7 +11,7 @@ host=mydomain.whatever.com
+ interface=eth1
+ 
+ # if you use run-as ensure the user has permission to write this file
+-cache-file=/tmp/ez-ipupdate.cache
++cache-file=/var/lib/ez-ipupdate/ez-ipupdate.cache
+ 
+ # uncomment this once you have everything working how you want and you are
+ # ready to have ez-ipupdate running in the background all the time. to stop it
+diff --git a/example-gnudip.conf b/example-gnudip.conf
+index 3b2fb63..d09df1f 100755
+--- a/example-gnudip.conf
++++ b/example-gnudip.conf
+@@ -15,7 +15,7 @@ max-interval=2073600
+ #address=0.0.0.0
+ 
+ # if you use run-as ensure the user has permission to write this file
+-cache-file=/tmp/ez-ipupdate.cache
++cache-file=/var/lib/ez-ipupdate/ez-ipupdate.cache
+ 
+ # uncomment this once you have everything working how you want and you are
+ # ready to have ez-ipupdate running in the background all the time. to stop it
+diff --git a/example-heipv6tb.conf b/example-heipv6tb.conf
+index e31aa9c..3ebc822 100644
+--- a/example-heipv6tb.conf
++++ b/example-heipv6tb.conf
+@@ -18,7 +18,7 @@ max-interval=2073600
+ #cache-file=/etc/ez-ipupdate.cache.eth1
+ 
+ # for the mean time we'll just use a cache file in the temp directory
+-cache-file=/tmp/ez-ipupdate.cache
++cache-file=/var/lib/ez-ipupdate/ez-ipupdate.cache
+ 
+ # uncomment this once you have everything working how you want and you are
+ # ready to have ez-ipupdate running in the background all the time. to stop it
+diff --git a/example-justlinux.conf b/example-justlinux.conf
+index 0afeb2c..28b3327 100755
+--- a/example-justlinux.conf
++++ b/example-justlinux.conf
+@@ -11,7 +11,7 @@ host=mydomain.penguinpowered.com
+ interface=eth1
+ 
+ # if you use run-as ensure the user has permission to write this file
+-cache-file=/tmp/ez-ipupdate.cache
++cache-file=/var/lib/ez-ipupdate/ez-ipupdate.cache
+ 
+ # uncomment this once you have everything working how you want and you are
+ # ready to have ez-ipupdate running in the background all the time. to stop it
+diff --git a/example-ods.conf b/example-ods.conf
+index d0ff889..7b16f2c 100755
+--- a/example-ods.conf
++++ b/example-ods.conf
+@@ -11,7 +11,7 @@ host=mydomain.ods.org
+ interface=eth1
+ 
+ # if you use run-as ensure the user has permission to write this file
+-cache-file=/tmp/ez-ipupdate.cache
++cache-file=/var/lib/ez-ipupdate/ez-ipupdate.cache
+ 
+ # uncomment this once you have everything working how you want and you are
+ # ready to have ez-ipupdate running in the background all the time. to stop it
+diff --git a/example-pgpow.conf b/example-pgpow.conf
+index 29a92d6..81e351b 100755
+--- a/example-pgpow.conf
++++ b/example-pgpow.conf
+@@ -11,7 +11,7 @@ host=mydomain.penguinpowered.com
+ interface=eth1
+ 
+ # if you use run-as ensure the user has permission to write this file
+-cache-file=/tmp/ez-ipupdate.cache
++cache-file=/var/lib/ez-ipupdate/ez-ipupdate.cache
+ 
+ # uncomment this once you have everything working how you want and you are
+ # ready to have ez-ipupdate running in the background all the time. to stop it
+diff --git a/example-tzo.conf b/example-tzo.conf
+index 2a71db3..10b8dc4 100755
+--- a/example-tzo.conf
++++ b/example-tzo.conf
+@@ -15,7 +15,7 @@ max-interval=2073600
+ interface=eth1
+ 
+ # if you use run-as ensure the user has permission to write this file
+-cache-file=/tmp/ez-ipupdate.cache
++cache-file=/var/lib/ez-ipupdate/ez-ipupdate.cache
+ 
+ # uncomment this once you have everything working how you want and you are
+ # ready to have ez-ipupdate running in the background all the time. to stop it

