Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23230.1794814540711595109
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 23:35:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=tM7QHHdM;
 spf=pass (domain: konsulko.com, ip: 209.85.128.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so7757595e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 23:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794814539; x=1795419339; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vG3DiHlEL2CzyUwoYio99yhbqlOMtxdePcqiQBH7M9w=;
        b=tM7QHHdMI1+lQn1BhIbHD0C4uORtGAMeDlyKb6iPwgaVwiKHqPCRlE3Z1Rg0dV+yxN
         fydR+pn4V2qW2rKE1O2n4XbkCCod1JYG/bq1m1Xty2zHajBseuw/8eubgWh9z0Hon6u9
         u+Q+EDMKgVsouQEK3puM9jD7e+aQ1kFFdUUE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814539; x=1795419339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vG3DiHlEL2CzyUwoYio99yhbqlOMtxdePcqiQBH7M9w=;
        b=bU71jfvjpXQzGsQzZ0XmS4EQKUyJVS7hWBQ1/+ScFNnsRkMxH1SRlEu4BYj5VrFGHg
         L6XhGcuOqG40S5Szmd57vHWm65cPi0NlvjftCXke0uaca/4Rk/AUB7tMJ6WuEK2S41ve
         bRlazj/+EoFRUA6jH380+h/2S/LWlkrO0qYryUlaRc3xBaXMnFWYJ5lbZ5lHMGtDJBiU
         cFjfNpmRrFL+tcV4OrbYAdy3IbykeBfUkRKaZtKwz5rWBK8FxOowZ6FlcJ/BROqjwDX+
         TmZnYce1EGr/QaNnPItPoPS/RfIWlgn17cFOm0eVOOYWdIbzEXZMWRUsDkuDd41L6cY7
         V/Pw==
X-Gm-Message-State: APuU4Z8GhCCHLbmrAJZIwoKJ/EItcm5hr0ol3R8rniF94IcMK76rCZqi
	gvG5wFCVDF84wccW75Fe/KWkIiKPG0Dp7wkYV80SHxMdAE0FFS5uiKQrzaU6CG98BewdCKThxz1
	81G4X
X-Gm-Gg: AYBFou3Fq1qrmj+HHp2nrwoe3YboGEdx5ynC2amD/dIMvNWCJEO738hxbG5PT86iRBS
	gyZaQ91fphiCElfldM0+JfhIkP00b6oInrvgB2JRqzsDO+zZnbTX4F+djdmsGNQeHhbeJx+agnR
	omAPK9blcsoLB5Qx1nZ2q+Wx6pi1zk8Wx3F3IcXYPorS7G5xGNQhr5/DjD1QEGNXhpGamoMn+W6
	fP8nPWqQuYuji66cJ/FkFlOw4HBpWPfIyuL318rXhJ35OpD96xgt7SjEebZSMQBhV49Wf4c4e+N
	tQhnHxxxWuJDvajD87ZCOfE7GH5yn6eeEDjsuC8EqViWaSBC0oKTmmWRkNmV/Xtu5RlZGLS4O7U
	VLHKT4eXVYW1JK6lxFmWw7a49bXkvt0SkS8xqCeWe7ijYc9ikkAw87tfqV9NxAHgdnMa6ntpASj
	NJHVDpvZYu6sw0/4FFNKv6m+mXX4Prcqf8rcWGAY/ooqIYSimjfRyrdotqG/SZNcPenqVIYAVQH
	w9zalCYVPqQWqyaER5s/elnjCUX5KOSuXPMyXumCUVhM2sHToza1BETBBDbf+eJbHX3akiLsCNN
	1Ja1S/7elst8w2tXY8tocW8jbBO+PWuo7t/hKmfNZLd25XR1vQtAY/xvJBpK3cI4/bT2CTIdTc/
	TZWhpl18wOqM15DRe0NWj6Dv4FDM68+EGT2icIG/momnIxqYMXv9A9A==
X-Received: by 2002:a05:600c:1f90:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4bb55ab281bmr197380385e9.21.1794814538971;
        Sun, 15 Nov 2026 23:35:38 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm289781975e9.10.2026.11.15.23.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:35:38 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 06/24] python3-jsonpatch: Upgrade 1.44 -> 1.47
Date: Mon, 16 Nov 2026 09:35:13 +0200
Message-ID: <20261116073532.880420-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116073532.880420-1-leon.anavi@konsulko.com>
References: <20261116073532.880420-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 07:35:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132434
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.47:

- Drop support for Python 3.10
- Remove the AUTHORS file
- Use the wording of LICENSE in the source file headers
- Update the Read the Docs build and the documentation theme
- Fix the flake8 warnings and make the lint check strict
- Don't show the e-mail address in the copyright line of the docs
- Clean up leftovers and inconsistencies found in a project audit
- Add support for Python 3.15

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-jsonpatch_1.44.bb => python3-jsonpatch_1.47.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jsonpatch_1.44.bb => python3-jsonpatch_1.47.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-jsonpatch_1.44.bb b/meta-python/recipes-devtools/python/python3-jsonpatch_1.47.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-jsonpatch_1.44.bb
rename to meta-python/recipes-devtools/python/python3-jsonpatch_1.47.bb
index 91991086ac..6cf5f0cb67 100644
--- a/meta-python/recipes-devtools/python/python3-jsonpatch_1.44.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonpatch_1.47.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4f81c84f9a053e31fe9402a2a4e78864"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "88fc1d9728168b4a9be27bb00de469dfb3cd28e8e5b568b24efb2ac583cba7b9"
+SRC_URI[sha256sum] = "5ed650b7517789e0f43428aa7b09442c0b90de0a0fd17a53fd0ebf55205c601e"
 
 RDEPENDS:${PN} += " \
     python3-json \
-- 
2.47.3

