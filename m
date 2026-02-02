Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C695E7FDE2
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 21:14:20 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1620.1770066853642726136
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 13:14:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YF11Fu4x;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4359228b7c6so3455861f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 13:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770066852; x=1770671652; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8TQCHtpp/lJy4VIY+X3m8ncuplulYBk6oLEKGjpM/M=;
        b=YF11Fu4xVYWTfdGiQxkFGIZqhsWqo27VLfqiq+ayPIkAVF/5ZwTDWCiC3J7HkJoxp0
         L803qVDnBPTtzw8l1cQxDFPou/oHBKHb85pqg6ctKNaHR3LXVaV2Y35NWwRGS5IABRaE
         uMjmvb6jv/2yEsuiVPqlUDyvVJicmtNLEWCxm0dBxLpms0UN4SBeytQHG/NtiqZWAmPg
         NbDX8nYQx1OT9bejLgsdmtGaPNV557g+3wtDeOdio6J8LPLflZ9RMUBWSgMxqjD6jntd
         2J8HMSZ5KkdfnMxg0KD5h7YqZHl5WTy2f3MO0qB+/nrLAA8ovA/mmpYiL0vTPHIgDiSY
         7AFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770066852; x=1770671652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i8TQCHtpp/lJy4VIY+X3m8ncuplulYBk6oLEKGjpM/M=;
        b=k4iKzLsUA9MiH6gI2aPdkj0KcYBUw8IIVKos+dKXJshWIpLskO3mchDjnkiWq6P6V2
         YwaYRNhMvJ+zqgk6SQpVUxBDy+mFl7hIcapi+J79WSgZU3hUNBwXfB2r2eRObQXanjTh
         KjCym2b1MLk251sIH5RPnP6vHIQclUlOlo47HnHvWeStjiPariPV+s3O/yLQrtXIhyQ9
         2bg0ybz+Y97Alqc5xkBlffOV1wNGOK1eoXLJwfIzuauhZENwTuKGmYjy8215vlzEEUMU
         oRjvGxOKxfJOt1n9G1SMWYdbeQZKq1qtgld7thkEOSWy0QFXDhqhxezLfqfQzGm9rzGF
         q+qQ==
X-Gm-Message-State: AOJu0YzkdAKYJA7/xUq3P8shag+4EuII9+Zp7ZGvc5abl0NgQtXQ/Noy
	YAsX2bI632k6DUv+4JQepRRX8SqJy//zJdbr78uyJgpwygEDLCx6biK8ZlMImQ==
X-Gm-Gg: AZuq6aJBmPfGkG1sI3shNcStU3lpzXvLLbJm/ZSglGYBo84N2g13QNgphe0iAOybyFk
	8zRqKnFD93dTNbgLQPq8WMH7etcBEZreaAW5XHrl3aGHj82FTHG0XIoUX6HUOYjgcRRMT9DIHwG
	IypXx+Mdn3pkkPjweOck8DaGsfc4dhZGhcFBc2LpH2HILcnkLjt05kmQKqu/hPKYVgScBbLQjlC
	Hsuf6/PR8y7RK5uvJ956DkSR1VXIAAbLeizgzIrkGAYk2V4wdb4KIo8ePdyuDnpfde6Sg+G2mX3
	FV9vGay4pLRuUPpE0lMxxhw32Erm4o3pxTdBbN6kf13CH3lZ2oL7jDYNttdl5Uj8RCQxVlXqnw4
	yBjDIImy8w1ec6cv8KeIULF5NcO+peYyPnrR3OKDPN9JyZ3EB9Rj5z+us4Z1rijFmAbXVlr6TmE
	x0eOxayp1E
X-Received: by 2002:a05:6000:1a8f:b0:435:a52a:6351 with SMTP id ffacd0b85a97d-435f3a95478mr18762333f8f.28.1770066851760;
        Mon, 02 Feb 2026 13:14:11 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce64sm48756747f8f.26.2026.02.02.13.14.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 13:14:11 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][whinlatter][PATCH 14/15] ez-ipupdate: patch CVE-2003-0887
Date: Mon,  2 Feb 2026 22:14:00 +0100
Message-ID: <20260202211401.1287664-14-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202211401.1287664-1-skandigraun@gmail.com>
References: <20260202211401.1287664-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 21:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124087

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

