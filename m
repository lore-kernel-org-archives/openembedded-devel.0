Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34311.1794851688101059480
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:54:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Or1V00t1;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so4393264c88.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851687; x=1795456487; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Q41Ry9mtpiCtGy6/qEfMDSH6eqtzMJp3xUjjR/vts4=;
        b=Or1V00t1wwSmqjZO2SAW5BVzCEy2b5FWbwjQ/lyhkgouOfY4jeMrG0F/A1PGX5MXIi
         VYTKaUS/dl3ZORvwANeRhqcGUAiyg1Q70LUWpvgNPlncZipSiaTACL0lMwINTci2u64I
         LM56AjpgA1//KZsEgX3Jx6No7JKaWgUJF0e+eeuUIPt3LoyQ4sxmdTTXbjAymZyoijw+
         1kE6nO6xDMD4wNv1kPbWFLKlADpVJXsWxfnWhuCNq/zSvLqBUWoTAuZ59VPZLZW+ImT3
         pPfz7C+wwE2grHThRIEk4GxeX3nEAuZP5wvXLjzuwmWTjgQU0sMGr9HyUfH8pFD+DlKe
         Oxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851687; x=1795456487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Q41Ry9mtpiCtGy6/qEfMDSH6eqtzMJp3xUjjR/vts4=;
        b=rL6QXAihprJnHHNGoEkO/eoP8bVIWZ3LXFqxYMIBL2oJLRnnGTi6mIjZYglEeEpj+c
         1M/nN9R/0qAm9OrmgK5BhHI1XqCnbk+VeP0um7YItL6gRO2P+gu5dWn5zODhZKKi5GDM
         nr+ULjVSZ/YTs6hIkd50zBS/UxDjrhnTpi9cJdA6KrAMKmd68pZJSFqvjYwG/GKP0t42
         ebbbPZRCmxbKJOqWckdoR7xzxnXMfY+iVCdEnXddE1nkAjnclCLn+1bteklWUcJ0eM+H
         goXu2qV0VfoeubXmIP07ka8IhsqH/EuiyCrPOTV6CiRxhG1ZrfCEm3D3281ZgZYJn76r
         SPcQ==
X-Gm-Message-State: APuU4Z93a1bwgx23cJjhTKzzXgQvzRSq95dFkXgZ6Y0VBkwhkt6VWN8d
	vK1/4rWYRVCfVUHlS0iyrCJYn8adXfBP1qRAojKxvNtlV6UJRHoPmccGduXDTRln
X-Gm-Gg: AYBFou1YMFX0HH5sxX+nTL21uDHtQeZCoC/msaGw9WJx1gpq2akZKi+y/3JHIcjpona
	QHmIR71dBtZskyZ+LhGqsoGH+hs0MGwhVKes9rGIxXb2wFNd61m0grY8uW90NNv+26nwyNSr3RW
	+IWvOxauSZiAaBtFnJrmqZ6JTU5vM6StEZcQqnkELTtDAl4C6cTcEPnBrMlnZXI2uaBdovZDqgv
	/KGM0d0JmT/KO1T2NqYPmxG7+8yZg2a2ZOWh6BhWbOjiJRNwTxbVqlenu49IkmwW4wrfxoFrRg4
	ScuAVgD5TgQfKh4r4fnt1w3Bxag1KJ4OOksf9gzl3uwQwDGjiZ+49ORNfaniJxDb4dxBQoaNa5t
	Zq7TguWgAOEJhDF8yBffqPBmLdIjAnF3OfLpls30I/ZnOCM35odvkasyGgVMwEGEIaRZWHNWQb7
	gVwCXHsmj8fWgy1dR/otmdFgePXumraGwJQ/6uxSzHI631veAejsvZO+iogvS3S7QSpxq44Er40
	s3Dr1n606XHoSJ4P7n6IUjd7zDJWHiMRU7TxBXXTsMLYNFWUR46064J4opIgh8a6Ki1kVoVHFjV
	YRSZpbTfoNuG5FlVOWNxj9g94irZGOpO2KezUvwELeIXk3hKO5ANlKE0kV6djBFIv8H9fUNTXu5
	CNZ3q5kgn9ljvDOS5iEpl2YiRcHswm6a+APMpZJtG4oNj1CvLMVJfCXIoKV4C7kLTigbhXjJcyf
	EYoAKF3uc7USBkQFjsInLZ+ohtgKLwcoD1dCNUWaYlJOHdvjCYi0d4XG7lFhdk1n79LDBp196VS
	vzrtGbLLR+zxfwmzT0riU3UQtdJ7T0Xc4qTKPPanPMnEbz+l8gWOkkDx29gYOLOHpdVHBl1+l/A
	SS7F
X-Received: by 2002:a05:701b:271c:b0:1b2:43b0:4794 with SMTP id a92af1059eb24-1b5030d4941mr8470491c88.9.1794851687410;
        Mon, 16 Nov 2026 09:54:47 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 031/105] python3-filelock: upgrade 4.2.9 -> 4.2.10
Date: Mon, 16 Nov 2026 09:52:43 -0800
Message-ID: <20261116175359.342679-31-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:54:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132487
Content-Type: text/plain; charset="utf-8"

The build now requires the python-sbom hatch plugin, which only adds
SBOM metadata and isn't packaged in OE; drop it from pyproject.toml.

Changes:
- Fix contended FileLock/SoftFileLock acquisition retrying forever with
  zero-length sleeps when the clock lands exactly on the timeout
  deadline; it now raises Timeout (4.2.10).
- Add a PEP 770 CycloneDX SBOM to every wheel.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ython3-filelock_4.2.9.bb => python3-filelock_4.2.10.bb} | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_4.2.9.bb => python3-filelock_4.2.10.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_4.2.9.bb b/meta-python/recipes-devtools/python/python3-filelock_4.2.10.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-filelock_4.2.9.bb
rename to meta-python/recipes-devtools/python/python3-filelock_4.2.10.bb
index 442ac4ae82..0e10014d6a 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_4.2.9.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_4.2.10.bb
@@ -9,7 +9,7 @@ CVE_PRODUCT = "tox-dev:filelock"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "96530b7c538d4ea08493ab067247aab7948c54d8cd622cce711c97cccc5d9896"
+SRC_URI[sha256sum] = "fcc3c0cb8bfe7f4b3bb0e231c04b15dbad068cb3c2515f343d8fde4dce93bd5d"
 
 BBCLASSEXTEND = "native nativesdk"
 
@@ -20,6 +20,11 @@ DEPENDS += "\
     python3-hatch-vcs-native \
 "
 
+# python-sbom (an SBOM metadata hatch hook) isn't packaged in OE
+do_configure:prepend() {
+    sed -i -e '/python-sbom\[hatch\]/d' -e '/build.hooks.python-sbom/d' ${S}/pyproject.toml
+}
+
 RDEPENDS:${PN} += " \
     python3-core \
     python3-crypt \
