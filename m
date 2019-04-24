Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 94DBF7D67C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 19:01:27 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id z6so109087wmi.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 12:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=exaq402l63SqXPJjqtxXzJ4Cc2Rs+ndBVlUpgmeY55Q=;
	b=cg8wG0uHCwPkdl+1jVtQL9tg/Y5qWbjPxJzH7JWEyaytIRNSszM0oB3iZgyahnpuLn
	l7/UEiRmnKOMvou9jOxgKgFkepwen/zQz6xsq9R64USlU0mH6gYHAdrvnPp3DXHMIAW4
	yeFS0Re4Q/2qqdF5pd9iRnNK+VYD3UJbYrrbvvLMKIjhKoNMY7AxsZmrkmwE72q+sJQm
	9NI0hF5K3cnBGmHKco8hOGkBfn6SV9s6hQCBxvskdLdIrntvAr4wE1dpEJPwTlJxFuyD
	4PlFpfhyNlh/rWDYyBmGQaJ/39B99RIi0Vmwa2riIqZj4WsuvJ51o/oUZUgeZSYS6iGl
	lKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=exaq402l63SqXPJjqtxXzJ4Cc2Rs+ndBVlUpgmeY55Q=;
	b=Ncnq0svfoJZb2xcOM/0GtbYGwRHKrCzboRo47bR4rW6H/L0TlCvhBGkQQ1bSZ/T6Rn
	2H3xcFHlOi31eNpKbgFC/uwx9yKLkexzWVR4RQyiJ+haQk0S9fDWWIjEqsz0B5X6T2wo
	N1GoDxyfUWEQUA5R5x9/fuJtBm5LrRxRJzu9XgQA5mIMxjHF7BTYUo1YjFkObrxasP25
	a6QpwOhCWwqApwUFLDmmzJIzqyErgzwgCjlVdh0a2t3hv12HblQ6PVCg9QHmmHSMlxVa
	wHFoCOPaeDERPb1WeTWhTahkqt+vixM84qZPDBSY0ldVHXE0Rag1OfREWTGxTeODO8ds
	NcRw==
X-Gm-Message-State: APjAAAV71/x4bHwkiEiG1pQxFcdHTRZpZ95rb8BFndCgcUc/WBQKe7Lu
	7vHTksGnnDFhU29D3yhUkKu6oOxf
X-Google-Smtp-Source: APXvYqw6z65qI38koYQPUpoARSxIqzTNhkPkUmn+h3XPYPg5/1pmlhgzHze9swteg2Q8sE4kI9i7yA==
X-Received: by 2002:a1c:a7c5:: with SMTP id q188mr424173wme.126.1556132487828; 
	Wed, 24 Apr 2019 12:01:27 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	v190sm20405918wme.18.2019.04.24.12.01.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 24 Apr 2019 12:01:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Apr 2019 19:00:38 +0000
Message-Id: <20190424190038.19593-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] ne10: set NE10_TARGET_ARCH with an override instead of anonymous python
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
X-List-Received-Date: Wed, 24 Apr 2019 19:01:27 -0000

* set COMPATIBLE_MACHINE to (^$) to prevent building it for any other
  architectures than armv7a and aarch64
* with new arm tune files it's easy to have armv7a in OVERRIDES even
  when there isn't armv7a in TUNE_FEATURES:
  meta/conf/machine/include/tune-cortexa9.inc:7
     "${@bb.utils.contains('TUNE_FEATURES', 'cortexa9', 'armv7a:', '',d)}"
  in cases like this COMPATIBLE_MACHINE was satisfied thanks to the
  armv7a OVERRIDE, but then the anonymous python was failing with:
  ne10 was skipped: Incompatible with archs other than armv7 and aarch64

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/ne10/ne10_1.2.1.bb | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
index 3afdff7786..4e8986de18 100644
--- a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
+++ b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
@@ -15,22 +15,15 @@ PV .= "gitr+${SRCPV}"
 
 inherit cmake
 
-NE10_TARGET_ARCH = ""
-EXTRA_OECMAKE = '-DGNULINUX_PLATFORM=ON -DNE10_BUILD_SHARED=ON -DNE10_LINUX_TARGET_ARCH="${NE10_TARGET_ARCH}"'
-
+# Incompatible with archs other than armv7 and aarch64
+COMPATIBLE_MACHINE = "(^$)"
 COMPATIBLE_MACHINE_aarch64 = "(.*)"
 COMPATIBLE_MACHINE_armv7a = "(.*)"
+NE10_TARGET_ARCH = ""
+NE10_TARGET_ARCH_aarch64 = "aarch64"
+NE10_TARGET_ARCH_armv7a = "armv7"
 
-python () {
-    if any(t.startswith('armv7') for t in d.getVar('TUNE_FEATURES').split()):
-        d.setVar('NE10_TARGET_ARCH', 'armv7')
-        bb.debug(2, 'Building Ne10 for armv7')
-    elif any(t.startswith('aarch64') for t in d.getVar('TUNE_FEATURES').split()):
-        d.setVar('NE10_TARGET_ARCH', 'aarch64')
-        bb.debug(2, 'Building Ne10 for aarch64')
-    else:
-        raise bb.parse.SkipRecipe("Incompatible with archs other than armv7 and aarch64")
-}
+EXTRA_OECMAKE = '-DGNULINUX_PLATFORM=ON -DNE10_BUILD_SHARED=ON -DNE10_LINUX_TARGET_ARCH="${NE10_TARGET_ARCH}"'
 
 do_install() {
     install -d ${D}${libdir}
-- 
2.17.1


