Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5C62EB28F1
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 08:21:00 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7171.1770366053673533068
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Feb 2026 00:20:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=acpuJU+R;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4358fb60802so1192933f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Feb 2026 00:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770366052; x=1770970852; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P55m+3gSiDogebLbT2XGX4OuMtjTmeL2/AzaVlfQM+A=;
        b=acpuJU+RNdnqRCdtL1PtUlwOJvz+GxWRnZJb4Ds9KCW16b5r4sjT+Z1o+1ZrA2ZSwT
         NhZqvPfvdPhmAg0c8vJl7JHRXT2bt34+epuuM21Z4WuE8pzCyJ3dtdIrd4jLNWqJXrML
         qqp8skAi54qu0FSIr3OapPvVxk1N3XfK+p38ad38mPagsY98edpc6sUY6inKrSwSWdW5
         1/+CfamQUMkWNRPoqF9LpQfWBb+fXYr1c99iauu03dJnwEEeZRqPQr4QpI/rGngD38Wm
         WE/WABef1Etwh0+0BLCgk8/WP+ZYYuew5oB72N502A3TlhO6w8m/R/PH1VL1uznrA2hm
         1j9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770366052; x=1770970852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P55m+3gSiDogebLbT2XGX4OuMtjTmeL2/AzaVlfQM+A=;
        b=LA8TbqPBIiPVqv0wgzGVxgFyDrJuGOb9PMC8Nk2A84jLsb7POxDBVIz2CjUZMhujjT
         PzlEqQu+DksjdcwJO0DFb+16U/3/H7p1ctRo9DXiKe0uGPZCGaoLWDoHaqvPFQh1e40e
         XBp7O7mMw4FFTpuMc1CDehGs8NRjKpXhk99EejXDZKQuJHyCexbx95gTd9e7Ah3QDRfD
         h7KIaOMYe0djzAkn/pyvnfen6MTPNRH3WiwQ90KMxHBYttVvtkJSgy96zqV3Di0wiLKZ
         L0sdD0T/7UtHcDSUNYuJo/9vheHdSlGYO1Npu0EgTxBbZuEbi5bDgV0j3EwukUqIC89E
         Qerg==
X-Gm-Message-State: AOJu0Yya+y1kXadI6R7zXtmue3HKMyo5YGfYStqZ72YCD4EfucI6UieO
	If86An4NtpiOnX8VIcpnOjztgIbbCdtE/ZV4dswW9EEo5b6qPPxkets89TwRWg==
X-Gm-Gg: AZuq6aIS5KXjtOodvKbtCD2up+kmUcTpXzqBerxqeosToTF7R7Ix7KZtFpHUj79/jxw
	YonOVX2z5MizHR6tKHsVifyGI5Sl32h/eASiu5/NW+rgr5qVmEm+1OCB6xDu2raptF5ga7p04kX
	14X4Q9XJ2jUdXOdKOV76vHNcP9a6eLLzjrBuGzzkDiZXyHw6Lgfa7yU+uBReRYILEBiLBJWcvfv
	MYU2ufMl98//FbLNLj+nTl9wNEuRBfqfdLN9BPQ4ugNTQ+3vlXDEfpuvc0JY/FYN3x+cTXJBCwb
	ci/71Hr6pzpOj7l15VBtBwexOGgRRclh+uVvveL7JK6/FQOcvISKtrHb2U32hhrZScFWXhboLdt
	m8n7lxWKnkUx23tLmHtqk4z0mhUZPvqodh4HXBMlwYE4gMxHeh9zRIybu47tWt99zzgJJHcWHgt
	r8bAsH9M6n
X-Received: by 2002:a05:6000:240e:b0:435:a43b:2dde with SMTP id ffacd0b85a97d-4362933ecd8mr3274210f8f.15.1770366051689;
        Fri, 06 Feb 2026 00:20:51 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362975ac28sm4332200f8f.42.2026.02.06.00.20.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 00:20:51 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][scarthgap][PATCH 5/8] ez-ipupdate: patch CVE-2003-0887
Date: Fri,  6 Feb 2026 09:20:45 +0100
Message-ID: <20260206082048.1442403-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206082048.1442403-1-skandigraun@gmail.com>
References: <20260206082048.1442403-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Feb 2026 08:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124234

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
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 0080dd79731efa1cca150730c5ac39bad82f7095)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../ez-ipupdate/ez-ipupdate_3.0.11b7.bb       |   7 +
 .../ez-ipupdate/files/CVE-2003-0887.patch     | 158 ++++++++++++++++++
 2 files changed, 165 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/ez-ipupdate/files/CVE-2003-0887.patch

diff --git a/meta-networking/recipes-connectivity/ez-ipupdate/ez-ipupdate_3.0.11b7.bb b/meta-networking/recipes-connectivity/ez-ipupdate/ez-ipupdate_3.0.11b7.bb
index 42ecf9bac4..7a392b2c23 100644
--- a/meta-networking/recipes-connectivity/ez-ipupdate/ez-ipupdate_3.0.11b7.bb
+++ b/meta-networking/recipes-connectivity/ez-ipupdate/ez-ipupdate_3.0.11b7.bb
@@ -10,8 +10,15 @@ SRC_URI = "http://sourceforge.net/projects/ez-ipupdate/files/${BPN}/${PV}/${BPN}
            file://conf_file.c.patch \
            file://wformat.patch \
            file://0001-ez-ipupdate-Include-time.h-for-time-API-prototype.patch \
+           file://CVE-2003-0887.patch \
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

