Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A48DC55175
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 21:45:56 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13608.1785620755168548030
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 14:45:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ojB8phow;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cfff5f88dbso24424835ad.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 14:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785620754; x=1786225554; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OsJb01AIB7kEF/VlThD8q+1+/TXgCSaLnc95sXW6HkI=;
        b=ojB8phowc+97XAgOEobzFKt7Q3vgDGAGweFKNJkD7qDPKX+7/PQ9OU8pcvFgvQ+lDP
         jO/FU/lNG9WB4TMfQsbclERjAVcWi+Q2jKhWX5ffIoaBMq1NG4tGw9fxxdCGL0i3Uf8/
         34xW34zrufR27UUUK9VVgBivZR+hWsWmQVteB0628QiUWgx3qXnDv7K6zZdN+MToKXlg
         8i2Tvdn4EI8bqYum4MDIvT88LbQmWktzLj2JLI6RIxJaMrG9Ww1IsyIayAnZ1KMs4p45
         uY5PLITMKpcfwYyqI8BYuMAD5sQh8ff7kuvvroKdpeEf5zMt083cgEuX8Xn8glsVlgQu
         69KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785620754; x=1786225554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OsJb01AIB7kEF/VlThD8q+1+/TXgCSaLnc95sXW6HkI=;
        b=NbLwQ9RuAGVN+g5rVO/1YYPp0f/szAXwPVgnNf1xjuRTKG9M6WE4+7sNPufoSYhAOP
         3dhIWsV3SBbCH6+Kobiqe9AG3PugK+pH0+6an8/vKx0RrCCicy1VID2zts2fz/aarNPH
         sTD6qQ5ESnkaCXlJs6AXbYxgrN+FV7i7tA+AD2Gi6xBbmxt30UC7DwCjwHTFG/1mhwL9
         K9UtSNAsGuLTpeY6NF/UTcbpkhoIinKzCPWuI/SL4ATipy8SVCdjkucikslp+8ehBKnG
         pcyUc9ARZOloND3NSGgKfkxhDdYqvlWVz101cSCafNEyDY4d96cR6lbKl+VU+I7jCHho
         l2/A==
X-Gm-Message-State: AOJu0Yw4DofGFegFWEXA68EAUSYI18xjQby5VTd7LAQuBU5ThZo6xyrJ
	of+p82gba17xc9/p6GobXserY/eara9GRTdhI7L3I6s1FznXj86QNlynogM5phrr
X-Gm-Gg: AR+sD10oZSaevP+R4dRD+hznvIeshkXIkK5N/sUmcilXLHFY0p9A26NFa1uxllI8XI4
	/0lhFW5kPwHHz1rO/wc+UowcFwt5iF1xnqkP3d8wZkjwXodINc9gq0JAMuPgm3tHRRvA9yN1rmu
	xUnYMLWBD0ZuiKQ/wbvFWWsKjyABXFlnOiBrVtwtFVp2ZFbkaRizHpbuhX56TJqgxmtjTMj7/Zw
	bsIC2U7Akc0DQ7SpcgWQNijJBNb+Iui6HZFqv6QarLK0Rg2TJzAXj/QgLWvRGEqI1pP/NdtRR36
	ap5d//Gian76+7wN1oLRi/EBjnxyJFrd+Gi0M21qjvZPDvFQgwbLRAen3hIL/MNTijcsJezIO5X
	jWuTKOn9mW+lx2E+1WaDb7vNeP32BMlSSzVKKhwPeDiBO7O2ucedvYj8WdRO/Jk/B7qnYQ73gf+
	FR1pm3zg7WfrJgC+Ir1h+uvL8lot8HplLRm8FbvSseXQ0uifMBZD0a2XXSNdcATo9uCfNAHda+q
	Bd1QBqky85TvCdbWvFgqywL9xKtB45HhPJnoT1KTtfCP+LBJ9SY3LwT55m8UqCtg3aLXQh7hw1N
	sYCoKEGgqfrVkby9Ng61GOnX94Nt0IkV0sn5Ck8xpX4Ud1t6j+R8tOhMef6Tu7aRRlb1sSYWRnh
	eWg==
X-Received: by 2002:a17:902:f542:b0:2ce:88d7:a233 with SMTP id d9443c01a7336-2d052428c82mr43673845ad.33.1785620754516;
        Sat, 01 Aug 2026 14:45:54 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm19105102eec.1.2026.08.01.14.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:45:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 26/31] fwupd: Only enable hsi on x86
Date: Sat,  1 Aug 2026 14:45:21 -0700
Message-ID: <20260801214526.788343-26-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
References: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 21:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128643

fwupd 2.1.7 fails to configure on every non-x86 machine:

  ../sources/fwupd-2.1.7/meson.build:288:68: ERROR: Feature hsi cannot be enabled

HSI (Host Security ID) has always been implemented for x86 only, but the way
meson.build enforces that changed in 2.1.x. 2.0.19 had:

  hsi = get_option('hsi').disable_auto_if(host_machine.system() != 'linux').disable_auto_if(
    host_cpu != 'x86' and host_cpu != 'x86_64'
  ).allowed()

while 2.1.7 has:

  hsi = get_option('hsi').require(host_machine.system() == 'linux').require(
    host_cpu in ['x86', 'x86_64']
  ).allowed()

disable_auto_if() only downgrades features that are set to 'auto', so passing
-Dhsi=enabled on e.g. aarch64 used to go through silently. require() is an
assertion, so the same option is now a hard error.

The recipe lists hsi unconditionally in the default PACKAGECONFIG and therefore
always passes -Dhsi=enabled. Restrict that to the architectures whose meson
cpu_family is x86 or x86_64. Non-x86 now gets -Dhsi=disabled, and require() on
an explicitly disabled feature is a no-op rather than an error.

PACKAGECONFIG[hsi] is left alone so it can still be requested explicitly.

Verified on qemuarm64 (do_configure now succeeds, meson reports "hsi: disabled",
recipe builds through to packaging) and on qemux86-64 (hsi remains in
PACKAGECONFIG, so the feature is unchanged where it is supported).

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-bsp/fwupd/fwupd_2.1.7.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_2.1.7.bb b/meta-oe/recipes-bsp/fwupd/fwupd_2.1.7.bb
index 3a30b5d1ee..c144a52156 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_2.1.7.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_2.1.7.bb
@@ -40,8 +40,8 @@ PACKAGECONFIG ??= "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
     ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'bluetooth polkit', d)} \
+    ${@bb.utils.contains_any('TARGET_ARCH', 'i386 i486 i586 i686 x86_64', 'hsi', '', d)} \
     gnutls \
-    hsi \
     plugin_modem_manager \
 "

@@ -49,6 +49,10 @@ PACKAGECONFIG[bluetooth] = "-Dbluez=enabled,-Dbluez=disabled"
 PACKAGECONFIG[firmware-packager] = "-Dfirmware-packager=true,-Dfirmware-packager=false"
 PACKAGECONFIG[fish-completion] = "-Dfish_completion=true,-Dfish_completion=false"
 PACKAGECONFIG[gnutls] = "-Dgnutls=enabled,-Dgnutls=disabled,gnutls"
+# HSI is only implemented for x86. Since 2.1.x meson.build gates it with
+# .require() rather than .disable_auto_if(), so asking for it anywhere else is a
+# hard error ("Feature hsi cannot be enabled") instead of being quietly ignored,
+# hence the architecture check on the default above.
 PACKAGECONFIG[hsi] = "-Dhsi=enabled,-Dhsi=disabled"
 PACKAGECONFIG[libdrm] = "-Dlibdrm=enabled,-Dlibdrm=disabled,libdrm"
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false"

