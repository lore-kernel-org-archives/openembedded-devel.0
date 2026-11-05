Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1157.1793898743034473729
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 09:12:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=DaOV8dJV;
 spf=pass (domain: konsulko.com, ip: 209.85.128.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so19926695e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 09:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793898741; x=1794503541; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YJe3R0jQCT/KyXGee4bO8bIuQ0ShdXFgAZueHz463n4=;
        b=DaOV8dJVWr7lkZTo+Olh9/D+QXjTTz90psYRS46mGi0JPkdg48kgem4vzKfIqhvZfx
         kj9UZ7aa2uiGgfMPlFGkR/I+mMYvSihgsEfhXxKvfXkOC0X+OuRqPINTnI3FZtx/cHOD
         E81NR9kIjqLxn9Syjzu/RsMK2FbJ5aD7AP8xw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793898741; x=1794503541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YJe3R0jQCT/KyXGee4bO8bIuQ0ShdXFgAZueHz463n4=;
        b=hip26ZWc88yYzzwGFg8kM7AGiEA9PZIrtXu2Qua53CpEDQiuCGcWlnWEwuMHTzWUid
         c6zPVWfxTwZaZt++ILpDaZvuUAYC7LP600IWYJy+1/IGu/6P85rm3pIqBDGOXfiahD77
         OztDJPznN3SALta7I0fjAJPvSsPqKV0QM16t5895fPeaIcJCvZATAgUKWGj64/7tes3K
         8NjUN7QN+S7RUGLjtusC64QrVfckeEDjzILpP201zpVE6VgpKEmq7RDh7IgqXNbZdIRV
         ijc5Cq4YbhztiQUZoip7inwoBf1Nxi2lkwKjxjn38oBbG7GkRoNDhcdywUIYKyt8qEZL
         vfmA==
X-Gm-Message-State: APuU4Z8NySR2Ji8LsdWEFI0trz1Qpu+Jjx3XzFC2PA91apfTp+A9mr8o
	rC9VhDYcXU+WDyfyxv+37SfO+nb8X1R3CR4PHyGPGCAxhcsB42wRCs9otUXuMZ+8E7/KH9NOSKe
	vN168
X-Gm-Gg: AYBFou21QPklfglnnfwm6XCvbSLy18X5edhOWtAdkImJCJ+onP/mpTxNRFmWjS7MHcH
	BQijrTylmaOy/WXFvrIOn6UQbF159Et5MHuaZ98cpeuFwAVcYMTnSY5AyVAhKagukVLcLCxAoT3
	PxYJUYi3dk7gq9yQJaRv0O/nBlJR0PtY+TMF8Z2fApfhz+SF3X8czGWgxXITFSnbtR8wRcYSMq1
	aOi3LktP6Fbz0O2gYhNfQ6Z6kVpn2Hms9y60DMGcxjnrg47Pcrzl9Lwd6YIonnoH1WCEa/28TOJ
	XDtpxN1JIMGfrMDhPgJOIBRzYMhGoH8LHDK70+40vXUL3lxUfQIrNrZMlIFtKicYvMWMQtqMgHl
	CHX5TivyEmv1BEScJWx9OpjBwbMcfWgNRQ3dsCHLbFDz94zpCbnWmU4i+N/Y19dqsMmED0fTSS8
	U1e75g+S/L8IpDpocfrqx6JqE2ZLlh/iMeyObsOqmmabhLr0sbFWAwlTsp/Uw27EObbQObZWq7d
	1AQDGq+x7qPLttn2g+9veMHdMGKsCRHOC0eMzFmC7KZpJMj3FYWYE7ofUE51jZGiQPmtdKf65jF
	BVL/8y4qsDA+9K+83eBNxumbhjDMzqdeJKBDNPnM2fuBx/2/zsPoDNbIcKamVlxUBsDNRk7tang
	bpPSdaTOYx9jB9ZJiuMdNOWNFFrGeIjV2spE+WVwzwQdaEP08f69sIg==
X-Received: by 2002:a05:600d:82f2:b0:4af:c210:5b3f with SMTP id 5b1f17b1804b1-4afc2105bf0mr348291525e9.24.1793898740502;
        Thu, 05 Nov 2026 09:12:20 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4533873f0sm149901595e9.4.2026.11.05.09.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:12:19 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCHv2] opensc: add PACKAGECONFIG for ctapi
Date: Thu,  5 Nov 2026 19:12:17 +0200
Message-ID: <20261105171217.659747-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 17:12:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131925
Content-Type: text/plain; charset="utf-8"

Add a PACKAGECONFIG option for OpenSC's CT-API reader driver so it
can be enabled without modifying the recipe, e.g. from local.conf:

PACKAGECONFIG:pn-opensc = "ctapi"

Please note that OpenSC's configure allows only one reader driver:

Only one of --enable-pcsc, --enable-cryptotokenkit,
--enable-openct, --enable-ctapi can be specified!

So to use it, ctapi should replace the default pcsc rather than
being just added to it. Not enabled by default. Existing builds are
unaffected.

The patch also removes --disable-ctapi from EXTRA_OECONF.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-oe/recipes-support/opensc/opensc_0.27.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.27.1.bb b/meta-oe/recipes-support/opensc/opensc_0.27.1.bb
index 70406513ad..fdcf003842 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.27.1.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.27.1.bb
@@ -23,7 +23,6 @@ CVE_STATUS[CVE-2024-8443] = "fixed-version: this is fixed since 0.26.0"
 inherit autotools pkgconfig bash-completion
 
 EXTRA_OECONF = " \
-    --disable-ctapi \
     --disable-doc \
     --disable-static \
     --disable-strict \
@@ -39,6 +38,7 @@ PACKAGECONFIG[openct] = "--enable-openct,--disable-openct,openct"
 PACKAGECONFIG[pcsc] = "--enable-pcsc,--disable-pcsc,pcsc-lite,pcsc-lite pcsc-lite-lib"
 PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline"
 PACKAGECONFIG[notify] = "--enable-notify,--disable-notify,glib-2.0"
+PACKAGECONFIG[ctapi] = "--enable-ctapi,--disable-ctapi"
 
 FILES:${PN} += "\
     ${libdir}/opensc-pkcs11.so \
-- 
2.47.3

