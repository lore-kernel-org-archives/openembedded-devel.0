Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33635.1794851669983607687
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:54:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Y0ERlP6E;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1139261eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851669; x=1795456469; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=48d5KGDgIxtP1oOO6kLkdnHNtcKxW/ilxeglqdiiBSU=;
        b=Y0ERlP6EenT6lqL9EAJVhRyXhHboQAmcmReeN5yZrS8Pn94sE1OCJ7adSvv6hH+DKB
         CiNamaPeulhpgMTWf1Ko9lVnsBgnjPJVPkWTZDcGDdwE7pxnCxQoL8YftyMeDi+TU4ec
         YvDW73MFatz43z8SS999P/29IoOStmfXzNI7zXjElH4tDpy2D5hqRbzBn7pHJNmqG+HG
         DkSbNufKuglStHWM8N1BkzKHmN/QgrACBUxD+n8PdeZmS/ibkNMKI+A2fyxaaJIoqdWY
         6SHY8pXLSuNzcF1uh+F/dcoRSXUcJIOBpVXGEP3wA2N6NXlC5rtFQhxjwS3Ng4I8Ntay
         cPgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851669; x=1795456469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=48d5KGDgIxtP1oOO6kLkdnHNtcKxW/ilxeglqdiiBSU=;
        b=RXcD/jECpVkbmh+LYqYwMC9gMj3z2u4C/c3pAW/oaQDhREnIlNxLp4y/fPPqmuk7vE
         BC2WlPEQ6gYKKWCcbdpi5CEWiByJbWD4cEZtx3CkjzkqVClukrV3DPFjokAYYffAFUiW
         aD2wIM8p5Sj587FsKvEaZPOZDXvgrMABpAtvpDsVGh4foQ0VUKJI20Js/zg+HrHKmx1F
         YDq4lllQPPr2oGnrJXDdqQ2iEmlJ3r2whJoHOqJsT7FZrJ6OymfnHGD5OkDhl/WcIx0y
         xd089dmmUTWbMKTBS/IHWeNJ0Q2sJyAwCVKEzf6NuJaDUvrbgMcSa3HM8nSVlonxDxfi
         MQdw==
X-Gm-Message-State: APuU4Z/yCyD0sJO2Vmg0o6R/Hm0TffgNXNvyhkl0jFTgqSBDC+X1Szi1
	yzWMSBVhcaQ8C3DH+kS9NdWdK+d8YyqkSnXwOWeKe9bBhY0nKuVJVorqg2iWqpaL
X-Gm-Gg: AYBFou1DjJzZjcGMj6DFD9Y3bbo/Ku7zozB3fp+a1sQEtScA5a0d8QnoB0UJ+w5iA5r
	s/JrBRJwuauNzzGb6shGK0YDkiA2mI5LpikODqeVhhQJ0cCiP/552UPMeH34kZOjbwQtRYUsRL0
	ICrtxkEglzRyam52G98NG9vpZPFvFcSvhK7xNutUaePMNnGvz1VaItUoWHwz03yjuCOSQP1R12M
	279y4kqxS1/OlaucqYWL1/2t1kllVAlrBmy8bNMqfxomo/sW+TCcaVlQ7K7ZBFgzklRLE4pAYY1
	di7H13knqwM6eJSCohINctEMlo7KaqwGw24WmBlLz9tSYm+CgF+lrrDFLaCwdrCLtte9jhXg19L
	8b7I3Errsdas0678Joh86vGoIX5L+f6n9n7tNRZ7IrNYJBiMziNcTzloaNcm47UgyKjHUMxMkh3
	5Wk7GEs6iLhsog+R4HdOxtB2l1BeQfMci+B4a8pM9qE0R+7ONm9Asvw9+N6+YUOecQaZbr3qxYo
	HQRJCOF0zUPFfWQtmwRT2Rzq7JQbugvTX7OG8bAc+TOWf9sOqqrTsori2wASOihudZpqHE8DQBC
	XZhsIehBbLxrmABi9mIkWA03UQEKOtklFTKI/4jpG+OwbnFGCje2NaqQ0gXchaeJhR7Yrkkb7eE
	0iifqv4JwCH5wsU7ImGktDBTMJgC9vqUPNfffUVfrnF8rIPo2Yi13Q5ww8gjL3eNGQ0qE6bjAHh
	0IfD7kUBy/ZSqaYChvg4TEDaNJrBbJfBdIScQJSo60GmkT2SYI5rWqlZDWPdFogJ7+7p/pv/Yre
	dp+EBD3sQy5iYMs3L8aIcRbyXnE6UKEyGn5fU35eHcPSNYzfqoBWpHr6e2h/8WisWtMyGGOQHur
	ZWvj
X-Received: by 2002:a05:7022:ea8b:b0:1b2:60ab:1e9d with SMTP id a92af1059eb24-1b503179d36mr10365820c88.37.1794851669333;
        Mon, 16 Nov 2026 09:54:29 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 016/105] python3-crc32c: upgrade 2.3 -> 2.9.post0
Date: Mon, 16 Nov 2026 09:52:28 -0800
Message-ID: <20261116175359.342679-16-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132472
Content-Type: text/plain; charset="utf-8"

Inherit python_setuptools_build_meta, and drop the setup.cfg "platform"
hack: the custom build_ext option is gone and the C code picks the
implementation itself.

License-Update: crc32c_adler.c moved to src/crc32c/ext/; header
unchanged.

Changes:
- 2.5: package now PEP 561 typed with sources under src/; GIL is
  released during hashing (gil_release_mode argument); Python 2.7
  support dropped.
- 2.6: add CRC32CHash class modelled on hashlib objects; 2.7: free-
  threaded build and sub-interpreter support, CRC32C_SKIP_HW_PROBE.
- 2.7: import no longer fails with CRC32C_SW_MODE=none and no HW
  support; a RuntimeWarning is issued and checksums raise RuntimeError.
- 2.7.1.post0: project metadata moved to pyproject.toml (setuptools
  backend). 2.8: add crc32c.cli command line tool.
- 2.9: drop Python < 3.8, add crc32c.__version__. 2.9.post0: RISC-V
  wheels. 2.4.1: fix big-endian signed-char platforms.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...on3-crc32c_2.3.bb => python3-crc32c_2.9.post0.bb} | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-crc32c_2.3.bb => python3-crc32c_2.9.post0.bb} (57%)

diff --git a/meta-python/recipes-devtools/python/python3-crc32c_2.3.bb b/meta-python/recipes-devtools/python/python3-crc32c_2.9.post0.bb
similarity index 57%
rename from meta-python/recipes-devtools/python/python3-crc32c_2.3.bb
rename to meta-python/recipes-devtools/python/python3-crc32c_2.9.post0.bb
index d3328733a1..0207c46b1e 100644
--- a/meta-python/recipes-devtools/python/python3-crc32c_2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-crc32c_2.9.post0.bb
@@ -6,17 +6,11 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE;md5=4fbd65380cdd255951079008b364516c \
     file://LICENSE.google-crc32c;md5=e9ed01b5e5ac9eae23fc2bb33701220c \
     file://LICENSE.slice-by-8;md5=6b3bc7709d6b2db6646ec2467310ff6b \
-    file://crc32c_adler.c;beginline=9;endline=24;md5=9c8bd2afd2d340fd37c038759cd4eff8 \
+    file://src/crc32c/ext/crc32c_adler.c;beginline=9;endline=24;md5=9c8bd2afd2d340fd37c038759cd4eff8 \
 "
 
-SRC_URI[sha256sum] = "17ce6c596ad0d53df52dcd72defb66984aeabd98fbefea7ba848a6b6bdece36a"
+SRC_URI[sha256sum] = "6a089e0340de8438e836a09e613c6b541675d0f3aa92b3fe34295aaba62f014f"
 
-inherit pypi setuptools3
-
-do_compile:prepend() {
-    if ! grep 'platform =' setup.cfg; then
-        printf "[build_ext]\nplatform = ${TARGET_ARCH}" >> setup.cfg
-    fi
-}
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += "python3-core"
