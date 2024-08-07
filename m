Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E16C52D6F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 12:47:59 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.32599.1723034874207779922
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Aug 2024 05:47:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dudxv40C;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3683f56b9bdso1183109f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 05:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723034872; x=1723639672; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k9I7HfdzKu+vAOR2Rub+nYi6LHylv0HpU4uGG2DDifg=;
        b=dudxv40CvhaVDVbHaxeDgzkzfuGxMssqIOTo2Ku8Le8OVzDdSfCfr12U0+BjlFAWMV
         GJLabzrceU9WPps0k63fPdCr4AMkUULSdHWuCs+h0qtse3Xpu9wUBF8swLSRpLuSqoPM
         7S8ofVhLePqeQl35ld9hwkyhmGVbo96mrxyepTH1/KJRbUEU5twOZr6UMaGhwb2yDaAk
         El97TVQOWl/O2ioiVsfiRvKSBm4a9C7SpFqzvWdGfD6FryNPXyhoUsa6P5GFzRjldlbZ
         O6tsXsn9GuJHEZZFC2zCnI1+415OHxRfRrOWFjAHOR3jApdMMijv0+kvWXjCPw0h7jdb
         Z1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723034872; x=1723639672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k9I7HfdzKu+vAOR2Rub+nYi6LHylv0HpU4uGG2DDifg=;
        b=Nj7OWHGRb/mzU97032bb5NcMWURWW+eZlyWBk5V7ipPfQex4AlwjvWh3j1Zl3b9qpf
         EsN6bbdx+oK+jSrAoJ8sZUkC7BOqk4r+zwRRgR/bc2Umic+1sXzpplj3yRk/QQOrCxoV
         RWXyCtCtEj7GJJqh0zeQe/gnR/zw5xs0seIYocG85TQwa6Un4+D2QpuWysg/TXsIpONP
         WihfT+KWH3gfoNf2WkiwNkb5MyEAeGvYDSiovp0ydxYg/NYdKxBlyOgVv8x9MFQzGBGz
         0GuJwyiSDx1e0aX0lyPHA+Gc409yp1tWDc56XguqqcpeGZvPNFOJUx0xqIQKBz2NmQRm
         TVdg==
X-Gm-Message-State: AOJu0Yw4EdpKqIY8VQZ8IBDqkhVr7dcjLXwGEKkHmW/hYE/bwv0MwsM0
	pXjiNYOuMksyztaeL+ognE2A5dqnuckHMddoyVyCdXgY6D365BIE8GS87eDu
X-Google-Smtp-Source: AGHT+IFHLeqYBe3jNq/pMfgUvscKfLkxtL/QDxo8OVF6jfR2SxsUfjifPYtbmHYoOdpi5/j6TSJWbw==
X-Received: by 2002:a5d:46c5:0:b0:366:f8e7:d898 with SMTP id ffacd0b85a97d-36bbc1775ccmr9804791f8f.50.1723034871965;
        Wed, 07 Aug 2024 05:47:51 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd05ad0csm16075642f8f.79.2024.08.07.05.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 05:47:51 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-daemon: switch to PEP-517 build backend
Date: Wed,  7 Aug 2024 15:47:48 +0300
Message-Id: <20240807124748.126211-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 12:47:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111629

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-daemon-3.0.1-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../python/python3-daemon_3.0.1.bb             | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-daemon_3.0.1.bb b/meta-python/recipes-devtools/python/python3-daemon_3.0.1.bb
index 715d3bf12..4cdbff0ee 100644
--- a/meta-python/recipes-devtools/python/python3-daemon_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-daemon_3.0.1.bb
@@ -1,18 +1,18 @@
 DESCRIPTION = "Library to implement a well-behaved Unix daemon process"
 HOMEPAGE = "https://pagure.io/python-daemon/"
 SECTION = "devel/python"
-
-DEPENDS += "python3-docutils-native"
-RDEPENDS:${PN} = "python3-docutils \
-                  python3-lockfile (>= 0.10) \
-                  python3-resource \
-"
-
 LICENSE = "Apache-2.0 & GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://README;md5=a3a94c615dc969a70525f1eebbacf235"
 
-inherit pypi setuptools3
+PYPI_PACKAGE = "python-daemon"
+
+inherit pypi python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "6c57452372f7eaff40934a1c03ad1826bf5e793558e87fef49131e6464b4dae5"
 
-PYPI_PACKAGE = "python-daemon"
+DEPENDS += "python3-docutils-native"
+
+RDEPENDS:${PN} = "python3-docutils \
+                  python3-lockfile (>= 0.10) \
+                  python3-resource \
+"
-- 
2.25.1


