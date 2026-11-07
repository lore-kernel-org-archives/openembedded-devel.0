Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12014.1794070349109751086
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Nov 2026 08:52:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=T2lH3JHq;
 spf=pass (domain: konsulko.com, ip: 209.85.128.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so16370265e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 08:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794070347; x=1794675147; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iqtBWMikPGZIi4NQZQWVGc/Sa4VU29/cJ6JTSNyz8O0=;
        b=T2lH3JHqarEcKlT74sPuBBo4cXdSCUY4Nz301ZzhJ6LuqKdPDPcbuIpG9Aim0/2hvF
         zRY5k3gDfEiVTUsqrK+MjNXdDM1t+VILPKlUXupFPLK+MBb+CdyaXm82xZ84I8pItA+F
         i5m9nU7wTaqBESYzIfV2eXcClGGxn53qgOKE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070347; x=1794675147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iqtBWMikPGZIi4NQZQWVGc/Sa4VU29/cJ6JTSNyz8O0=;
        b=bXh6/96V9ePTn03HOZaIeq4lQyw2NSGUQkxqAV0EKiHhbrUINcdIfETfCQmbK+A0rP
         HQTic0y/DOn0TirOgXdg8SiZzNpguQr+8/lD7QX4y9QMz+P+X4xT0KJ7sGqGQBq0EU4l
         EqPO3g+NVRl0NVCASkmd742hjE4z67If3nfw3Q7vbycAGWEpNOBV+Gq9Vasx1tua4R1L
         fDuXnOw08MpV4p73/p4h6kiVMeJOIfwWhvSO9kRbO7h/rw9F9aApDW8f7awhZ/a9WrU3
         nnskC6URZDUrN0hLCaz7sZjhmBC1JomfSUkXpVJGe/HbZ3/a/coLUel5emHV7acFkUEo
         7FOQ==
X-Gm-Message-State: APuU4Z+hoeH92/IVfVtmrXSbW1BbJfC9NGebDH7nwSItUax5yshdQ794
	ZwQuo6q25mlyBwNSJO/FNvtNEszf20drolODQcuPl5XZzDdIJpEkzrHJGOWJefz2pEAUbTP94D4
	s2z2C
X-Gm-Gg: AYBFou1isWhRbjAjdzNrMEg34s4cbeL1E29DbLyPXlv3/Ax9JbEhxW8o6WHCW80T5cV
	kk8WYfg3fxj254c6xpY/H9uHQdnV0T97g88is8o0S7ZJQyRx0MTfUZdp107RyWY5K2501mrdpNG
	DLMgeJxnsL6TlYAzextZvAOkfLL0Dtp+7DxYhxS77q763FXZt8DaCdLIoeGHR1J60xg9pc7O4xU
	WnHKyNlpCigEy2zNtshoggXO1STKPG/lItfs644dV9ZlEtMRpdv/5ezlR44wziQPOcAFK6aD6F3
	wqbV64HFzBCrXmD03doq2TTx4rxM4TkYNBnFzPgqSbIticQk1FuKHljDK3FHtkMsUYwc2TmaYIp
	pXLv5B3DWsyh+tUASm2gbi+38Kd+NNs36OekXTXjPtLwpi70frbsu41QIdZm5iNz51+91lUQUWd
	IY1JlyPTu2/Z98AIAz49QzyWeV0vZK+Otyh1russt/aJFi30VWpxpXyfJjibJoJa3whxg8Wll00
	wQ1xNteMHaSF2gb9cqEztB9CIRL65Lmru5KkBb7y0ytVXzrHVvehTOBmqfAipnNMCW+PFb7oBjI
	3sD69P6P2aXdXXQ6o/3Kyy3Je4hLNSC0qaLVT6a4MGBMCw8HHrMpcqxafIpRLB3gZ+Oz5XrU+vO
	1l85Kj3VHRv76nYVY9OFtSWaybg6P+/C48vsFlK8rmwKSC2UVlksDhw==
X-Received: by 2002:a05:600c:8506:b0:4a2:5ca:767f with SMTP id 5b1f17b1804b1-4b6dc30af1emr100687045e9.4.1794070347342;
        Sat, 07 Nov 2026 08:52:27 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4948a99b9b0sm4127090f8f.4.2026.11.07.08.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:52:26 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 04/22] debootstrap: Upgrade 1.0.144 -> 1.0.145
Date: Sat,  7 Nov 2026 18:52:03 +0200
Message-ID: <20261107165221.122340-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261107165221.122340-1-leon.anavi@konsulko.com>
References: <20261107165221.122340-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 16:52:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131989
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.0.145:

- Use SHA512 if listed in Release file
- work_out_debs: On hurd-any, add seedfiles to fulfill passwd's
  dependency on systemd-tmpfiles

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../0001-support-to-override-usr-sbin-and-usr-share.patch | 5 +----
 .../0002-support-to-override-usr-bin-arch-test.patch      | 8 ++++----
 .../0003-do-not-hardcode-the-full-path-of-dpkg.patch      | 6 +++---
 .../{debootstrap_1.0.144.bb => debootstrap_1.0.145.bb}    | 2 +-
 4 files changed, 9 insertions(+), 12 deletions(-)
 rename meta-oe/recipes-devtools/debootstrap/{debootstrap_1.0.144.bb => debootstrap_1.0.145.bb} (89%)

diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap/0001-support-to-override-usr-sbin-and-usr-share.patch b/meta-oe/recipes-devtools/debootstrap/debootstrap/0001-support-to-override-usr-sbin-and-usr-share.patch
index faa66e0268..e3ab345634 100644
--- a/meta-oe/recipes-devtools/debootstrap/debootstrap/0001-support-to-override-usr-sbin-and-usr-share.patch
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap/0001-support-to-override-usr-sbin-and-usr-share.patch
@@ -1,4 +1,4 @@
-From 6c8b0a3f9c09a7a135d95ff18038bcba22e87b86 Mon Sep 17 00:00:00 2001
+From 077f72feece0736243f6a2f9aff169b00dbb685d Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 8 Apr 2021 14:06:05 +0800
 Subject: [PATCH] support to override /usr/sbin and /usr/share
@@ -34,6 +34,3 @@ index 21a9a39..649f465 100644
 -	chmod 0755 $(DESTDIR)/usr/sbin/debootstrap
 +	sed 's/@VERSION@/$(VERSION)/g' debootstrap >$(DESTDIR)$(sbindir)/debootstrap
 +	chmod 0755 $(DESTDIR)$(sbindir)/debootstrap
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap/0002-support-to-override-usr-bin-arch-test.patch b/meta-oe/recipes-devtools/debootstrap/debootstrap/0002-support-to-override-usr-bin-arch-test.patch
index daec80f614..a4b68997c5 100644
--- a/meta-oe/recipes-devtools/debootstrap/debootstrap/0002-support-to-override-usr-bin-arch-test.patch
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap/0002-support-to-override-usr-bin-arch-test.patch
@@ -1,4 +1,4 @@
-From b7a476cbcd507c03094811690d5497a7e9e15afc Mon Sep 17 00:00:00 2001
+From 7dd1762bbb80941a134b7be88c3104faeb6829c8 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 8 Apr 2021 14:08:06 +0800
 Subject: [PATCH] support to override /usr/bin/arch-test
@@ -11,10 +11,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 8 insertions(+), 4 deletions(-)
 
 diff --git a/debootstrap b/debootstrap
-index 43a7383..0cce33e 100755
+index 76f493a..20d465d 100755
 --- a/debootstrap
 +++ b/debootstrap
-@@ -51,6 +51,10 @@ INRELEASE_PATH=""
+@@ -52,6 +52,10 @@ INRELEASE_PATH=""
  
  DEF_MIRROR="http://deb.debian.org/debian"
  
@@ -25,7 +25,7 @@ index 43a7383..0cce33e 100755
  # set $CONTAINER
  detect_container
  
-@@ -666,12 +670,12 @@ fi
+@@ -679,12 +683,12 @@ fi
  
  ###########################################################################
  
diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap/0003-do-not-hardcode-the-full-path-of-dpkg.patch b/meta-oe/recipes-devtools/debootstrap/debootstrap/0003-do-not-hardcode-the-full-path-of-dpkg.patch
index 0c1a7a65a8..b782e08cc6 100644
--- a/meta-oe/recipes-devtools/debootstrap/debootstrap/0003-do-not-hardcode-the-full-path-of-dpkg.patch
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap/0003-do-not-hardcode-the-full-path-of-dpkg.patch
@@ -1,4 +1,4 @@
-From 33c4bc9540d6d9aee6d885b89d530130d50b8052 Mon Sep 17 00:00:00 2001
+From ca470a0b0c18a6a3f728c2e5f6cce986d9d28803 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 2 Jun 2021 13:34:35 +0800
 Subject: [PATCH] do not hardcode the full path of dpkg
@@ -16,10 +16,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/debootstrap b/debootstrap
-index 0cce33e..7586c58 100755
+index 20d465d..a02b28c 100755
 --- a/debootstrap
 +++ b/debootstrap
-@@ -553,7 +553,7 @@ fi
+@@ -566,7 +566,7 @@ fi
  
  if in_path dpkg && \
       dpkg --print-architecture >/dev/null 2>&1; then
diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.144.bb b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.145.bb
similarity index 89%
rename from meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.144.bb
rename to meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.145.bb
index 543d7405a4..2dce7c2450 100644
--- a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.144.bb
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.145.bb
@@ -11,7 +11,7 @@ SRC_URI  = "\
     file://0003-do-not-hardcode-the-full-path-of-dpkg.patch \
 "
 
-SRC_URI[sha256sum] = "3e1bafd4bb813cf4d6c17a0adca449ca07603263a8ea40a67257d2d60c186f9a"
+SRC_URI[sha256sum] = "7cc8f9e386ed8dfd4b062a3b9527f0f45176dfa1b065e7db270f837956516b20"
 
 S = "${UNPACKDIR}/debootstrap"
 
-- 
2.47.3

