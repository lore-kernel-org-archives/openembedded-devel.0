Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25.1794851778959662224
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:56:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=NrA3thvV;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1143394eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851778; x=1795456578; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rPE+IA3cGwRwWfbIRsGYhQzeKyjpklVgYGNgfp+kql8=;
        b=NrA3thvVJZE4La/Go372ty4NWYdRjNVb5wHlPjG6SyfmFHcWz53K/2rbFYxAup03/g
         5EaAtY7YbuEor+jn/KxZjgUSuEa9XbiqbtaHVpwH+uoDTN4cS+b8XfbYuk0Z4Tbbxzw4
         YLLIOH/lkbgOUdiLL6342PwJBlrmMgbR68Nk7eHZgshzWjPuTukz1Tzj1N2x06AJfGQd
         xXYSNfxCU/7MS/ti/+VKVYVR4hMtk9Bx7KP5h3J/mtNjtOcy5stdFZ5qb+x5HQKPT66v
         UyhqHjAPbkhn7jC8BLnl+1P5mCn9wHCnrM8UEnTER9QMI7MlFn3e76WG1vrDezlizOuH
         Y/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851778; x=1795456578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rPE+IA3cGwRwWfbIRsGYhQzeKyjpklVgYGNgfp+kql8=;
        b=fw2VdBexShnKZra0K9MPd0Z+Rg7MuD0qSEEZywt+qFNNhHeHwro+Vp4r5/K12RECNF
         oASaeKfcuI1XF4fx6UjWKs3PK3JJhB14IF1Ktzi9UND8GsGl1bb29lGhN/UNgDPVCAFF
         SFTFirSf5n+JmSUkVZ5c3oLMdYoPXpjEPwJ29T+dzdtI+GvTEA+ULlPWkUPEPOxxc6Vk
         UXtEEt0mQan/jrXsMb2/yi9ZolfnTJfMuWLsKU/uXS76tbcx8NMZ1nGVISdhkJMfgF5M
         cKZswANipsIXEqq4si+2r69ydnRuK9DhL1UPE5TYd5VzvlRYgIRfaeqc638Psyq1BlsU
         eRRw==
X-Gm-Message-State: APuU4Z+7O/hCbjJEcGCmpSfh41dO/NzqCrfF5U1WNAgih2B/5wCl80YW
	yZ9aDSI91MYLS4RP91KUiieYjm5iWAoxmKzqW+loh4cFP46EuOjNKpnpn6B/ZcL+
X-Gm-Gg: AZFdTZdtH7dClqU8Y8MGp9/CDS4s95DmJTrCB9oglzKGy5kE3xjY7cIaC2yz2812BaX
	ztkmlg4qDAJWNrZ3zmnRTe1B7+nQ7J/tXDkAxKMrZfjR+/1Mwd86JQwHu3tuJ+dycSUBHkypN9y
	+1jWzc+RBNtrI4pXixZVHftBsHjcG0LsLM86r+0SYX9OZFARHO3D0yxwQp7rusxJ1/UgY9keMt9
	NzYEpAhxsvQ61jJWROz+GuGtIKsZViBeXOOjkCt+w9n0bjh4yzLvp7bncASv3kdSU9eCHp9ljtM
	hKjtFksoqBKqKf695ellwxux56EIETvJcEN9az8F9b+YAMYJ5fl0oFeAsSrb9ReiBpXdJf+kud9
	Rmx9niwijbctrVsBLpT2l8hyEzv2Onj3+SUZoJBpj5lfn6SyhjYWyu1BSppda9oktudh8Fl+MXZ
	V7bdOHfMMVNf1ilZcHXVcuwBq3Au7l4Vq9VpK5DKILbsK1Ec+0daMsf09n4bz4O3sjerKvVIVqj
	Hpy1zu7RpyBkiJ8Qs6A2ZCIuwuPbQaT3d0p+t6LiNSP4XKPEJ9qojoFwmRc+8DILlkhVtVFzB4t
	QUJAABYztFV3GdwfYzWD2ojPttQeQ7y/scnycaFanF4e3CvT/2sWJN7dVU41jaQ1BA1GLSkvnpk
	QVmkqN/t/pxrp06h/ojjBcduIMs2krEs7QFE6qqQKI4lDJw6/J/KKBOJfUZyT1lBVkAyu57aPPV
	lkwkMKhmjFfKhrwfApNug9qSWEu4sjLdLYm8pH9FG3XQNsTkMNpNLOP8V/ryxHgdG+n3GBTH+TW
	rTOYHhfAmIBGoSKET4+1CIL/GARlm00dWlOf8e6QQ+hcuS6FfoOYRACc5Urkd74GdQp98AIeorT
	7OX1
X-Received: by 2002:a05:693c:811a:b0:36e:9763:9268 with SMTP id 5a478bee46e88-3796695b721mr11314678eec.26.1794851778260;
        Mon, 16 Nov 2026 09:56:18 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:56:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 101/105] python3-virtualenv: upgrade 21.14.13 -> 21.15.6
Date: Mon, 16 Nov 2026 09:53:53 -0800
Message-ID: <20261116175359.342679-101-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:56:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132556
Content-Type: text/plain; charset="utf-8"

Add hatch-fancy-pypi-readme to DEPENDS, now required by the build.

Changes:
- 21.15.0: zipapp bundles dependencies for Python 3.15 and no longer
  bundles Python 3.8.
- Embedded pip upgraded to 26.3.
- Reject an empty or whitespace-only destination (an unset VENV in
  "virtualenv --clear $VENV" could delete the working directory).
- -p/--python and --try-first-with now replace configured values
  instead of merging; --app-data handling and seed wheel staging
  made more robust.
- Activation: PYTHONHOME cleared/unset (PowerShell, Nushell, csh),
  empty PATH entries removed, xonsh sets PKG_CONFIG_PATH,
  virtualenv.ini read without % interpolation.
- Fixed seeded console_scripts names such as python3-config
  overwriting the environment's python executable.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...n3-virtualenv_21.14.13.bb => python3-virtualenv_21.15.6.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_21.14.13.bb => python3-virtualenv_21.15.6.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_21.14.13.bb b/meta-python/recipes-devtools/python/python3-virtualenv_21.15.6.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-virtualenv_21.14.13.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_21.15.6.bb
index e3a3a109af..4f11ed9333 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_21.14.13.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_21.15.6.bb
@@ -4,12 +4,13 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=36ef9437b761b314fa717c786c5ca460"
 
-SRC_URI[sha256sum] = "de5307ba4b9a0001d9c8ea02832d38f63ca432880f416c1bface61c4323fd905"
+SRC_URI[sha256sum] = "c8b65c7d206ca6ef18de9352c160b3f04f66fff9f6b0ec8fd31f14688eba52c4"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
 
 DEPENDS += "\
+    python3-hatch-fancy-pypi-readme-native \
     python3-hatch-vcs-native \
 "
 
