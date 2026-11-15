Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3863.1794729013497560755
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:50:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=KfQVPpxS;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-37986eb6fa2so2504008eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729013; x=1795333813; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hg8XhqGcBR1E2FRnQzFYC0HtquhpNCH6g6E/iap/oEE=;
        b=KfQVPpxSue36zXboNYx/e7M5d9P46edYquzgUxo2xOq0qV5HdNThXOFeFgMmwD2Hsf
         +SQEL7z3ixFROm0+fPdboo6L4xdfzNhraqbFnoDGQFwpdbAkv/FTZSpp6DhEF4UHb37d
         a6NPRbp+oZMtVsZIwYkwcreLPoTyIf8Y6WxCFgrGPlb1rkdFZbfsvKnMfZvw0h5uyKqY
         mGDC+9RlHwfQUVFAs17WtGZFPXIVw4qiPIx0B17q1D1Lle8JYzyk4kDgeVX4XHYG1qf/
         xAkqp8V7fpYK5JrpXMI/LGP4s0DI47LIQsBVAj/6LPXQBoLcRtr6Hu8JdHXAHhvqrB/p
         DFiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729013; x=1795333813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hg8XhqGcBR1E2FRnQzFYC0HtquhpNCH6g6E/iap/oEE=;
        b=ga9VNKoWku9xWyLmeqCe0Ia25fbk3Z6BpCmpA98qErUu2W4Jd5o9QzBvQHymhUl+Gu
         LRYKiZYxdV8hwTG0CJqeVoPbEXMI2AS1qo0gHAftYAVIJ9xnr5LgD5+i+6IevD48o4vy
         kABe7+nH7ZH3O1Wyd+qfvV53LDpYefC1C+vkyXmMOYsmFTwFCNzCb+OVHGD0renlKcOl
         lPadjX5xC7fYXfKLW0lmCC6blL0OKMgUZY68zDGbumDdgZETPPGaEmAwWoGC4C72kfQT
         PbNZJcZLGUP2SSf73NIg9Rv76Fsl+/p7+0todgN1/VMy5HOVfKm7SVc1sgDFd9/v1F5J
         9tKA==
X-Gm-Message-State: APuU4Z/hW35LDFOajKgYS4pMfFIFZb6CGMrof7rkDcNCwjDBshX7l4mE
	qf222yxEdwkeRAruU/pu8RSw9pAKEnHWKWawp0UVEwk7TEJXSsXdfJOkMDeFlqtS
X-Gm-Gg: AYBFou0MVkDXWTHGs2IgyI6i6cbpOqSBv0Pm7YkvACl50KWnkt5pjev5MZEAW4icWCN
	TGCcY83cbWVoRH7iumxbLLlc2wTOTT9EP2XRplRaJORaaJszOwEH4IHRl0BISvdh0nvSw70B0ta
	3FCWCfafu4X5iO2A87DC1aN5XljvaA/U4KSzpBUSYd7f1Bbp3RaAlyK65lz8q2YmAGzRfxPGn1L
	40Vya3XZFmzEDiwBZhvNSk4hWeTI4C84bddAVPqZ+xqDenbivzYA6PJmI+P6oIFKFB8RYYB4NzF
	9GHvQT8rxbeo2sOwt5dMXoqZRGj5QAMtN4KhjOgOvPy5j0O9I/+89zU8jn+JMhAVX6Y8rxE6HHN
	fz+wd5tcXwraUKo28HVNGaa7yL3RO2Ex0ruwFxBUK6kWNj90MOLA2iaVx2iBogkVeCQ6qKMxfso
	6+V/VgenU0wg0Ol49hXHuHf5RCN0si6PWQKYqyIk8+gph9AM+pmk6XqvgMm/5W8OMEPlTPSJZ0l
	eke1zJkytbT5542cE5JX+jNN8AdotfG6LkIAYKhD9ewZxcrws2UbmOfEUbX3lpbi+yv4RG2BMK4
	372aJSUQUWxWjrg3zUb9iHfuL3Z4xW6DxXMUl5fFZTt/zn6wdtmWAsXdo0hSYVGSLqNqeafsrDe
	MAz1xHStCruNWnylRLwT0rEb0Bty4VBm1FkGQne6o5/PTimYleal8+rIMwmP0LGqkHsa3QwCfkn
	JM6MYRzP4oU1w1Vkj1LgJIccvlLaVQEwl/Lus0smwvjzq6FH88/Y+0AZJBvl8EXzMmTLxXxgkkm
	DZRdTzK9Pvchinnde68Khr3gcdp5PVJxejEW7ZyzcSrJwU32P59B/ca2v2P13iY8gBQ4a6jBdG7
	eyDz
X-Received: by 2002:a05:7300:d946:b0:36e:2626:4ace with SMTP id 5a478bee46e88-3796365edc4mr7827520eec.5.1794729012786;
        Sat, 14 Nov 2026 23:50:12 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:50:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 32/96] linuxconsole: upgrade 1.7.1 -> 1.8.1
Date: Sat, 14 Nov 2026 23:48:10 -0800
Message-ID: <20261115074918.2932593-32-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:50:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132302
Content-Type: text/plain; charset="utf-8"

Drop 0001-utils-Use-name-of-the-first-prerequisite-in-rule.patch, the
Makefile no longer passes headers to the compiler.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...me-of-the-first-prerequisite-in-rule.patch | 37 -------------------
 ...console_1.7.1.bb => linuxconsole_1.8.1.bb} |  3 +-
 2 files changed, 1 insertion(+), 39 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/linuxconsole/linuxconsole/0001-utils-Use-name-of-the-first-prerequisite-in-rule.patch
 rename meta-oe/recipes-extended/linuxconsole/{linuxconsole_1.7.1.bb => linuxconsole_1.8.1.bb} (95%)

diff --git a/meta-oe/recipes-extended/linuxconsole/linuxconsole/0001-utils-Use-name-of-the-first-prerequisite-in-rule.patch b/meta-oe/recipes-extended/linuxconsole/linuxconsole/0001-utils-Use-name-of-the-first-prerequisite-in-rule.patch
deleted file mode 100644
index bbfed0fd82..0000000000
--- a/meta-oe/recipes-extended/linuxconsole/linuxconsole/0001-utils-Use-name-of-the-first-prerequisite-in-rule.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 25f54c3359a0fa34890030662e9b02e0a9745f4f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 13 Apr 2022 20:57:38 -0700
-Subject: [PATCH] utils: Use name of the first prerequisite in rule
-
-Use $< instead of $^ because the latter will specify both pre-requisite
-inputattach.c serio-ids.h files on same compiler cmdline and clang does
-not like that and errors out like below
-
-clang-14: error: cannot specify -o when generating multiple output files
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- utils/Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/utils/Makefile b/utils/Makefile
-index 1fc51ab..a7434a9 100644
---- a/utils/Makefile
-+++ b/utils/Makefile
-@@ -46,10 +46,10 @@ endif
- evdev-joystick: evdev-joystick.c
- 
- inputattach: inputattach.c serio-ids.h
--	$(CC) $(CFLAGS) $(CPPFLAGS) -funsigned-char $^ $(LDFLAGS) $(SYSTEMDFLAGS) -lm -o $@
-+	$(CC) $(CFLAGS) $(CPPFLAGS) -funsigned-char $< $(LDFLAGS) $(SYSTEMDFLAGS) -lm -o $@
- 
- ffcfstress: ffcfstress.c bitmaskros.h
--	$(CC) $(CFLAGS) $(CPPFLAGS) -funsigned-char $^ $(LDFLAGS) -lm -o $@
-+	$(CC) $(CFLAGS) $(CPPFLAGS) -funsigned-char $< $(LDFLAGS) -lm -o $@
- 
- ffmvforce.o: ffmvforce.c
- 	$(CC) $(CFLAGS) $(CPPFLAGS) -c $^ -o $@ `$(PKG_CONFIG) --cflags sdl2`
--- 
-2.35.2
-
diff --git a/meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.1.bb b/meta-oe/recipes-extended/linuxconsole/linuxconsole_1.8.1.bb
similarity index 95%
rename from meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.1.bb
rename to meta-oe/recipes-extended/linuxconsole/linuxconsole_1.8.1.bb
index 7ad8549420..24b2c58b6a 100644
--- a/meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.1.bb
+++ b/meta-oe/recipes-extended/linuxconsole/linuxconsole_1.8.1.bb
@@ -12,14 +12,13 @@ DEPENDS = "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 
 SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/linuxconsole/linuxconsoletools-${PV}.tar.bz2 \
-    file://0001-utils-Use-name-of-the-first-prerequisite-in-rule.patch \
     file://51-these-are-not-joysticks-rm.rules \
     file://60-joystick.rules \
     file://inputattachctl \
     file://inputattach.service \
 "
 
-SRC_URI[sha256sum] = "bd4d4b7e37da02fc67e47ddf20b6f1243c0a7af7b02b918d5e72138ea8727547"
+SRC_URI[sha256sum] = "4da29745c782b7db18f5f37c49e77bf163121dd3761e2fc7636fa0cbf35c2456"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/linuxconsole/files/"
 UPSTREAM_CHECK_REGEX = "linuxconsoletools-(?P<pver>\d+(\.\d+)+)\.tar"
 
