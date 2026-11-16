Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34289.1794851655922246705
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:54:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=FACBR7XY;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3712b6d9843so3058251eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851655; x=1795456455; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WM85JSSpk4tSn0733AW/paZhBEnarKx0aBlxAWM1Uuo=;
        b=FACBR7XYj70HntvAFcSHVHD1zLBb64QLHHzrVEQvuNjoHAD1l9r/99QamLjTFpjEl8
         BbLkXOFUDeoVIXf5iELFK9az7jFACFrYapDJPfjq5KeDCCC/yiDDhdxXcmpyessSWtiX
         Hh0fFSLrPSKlJhcz78t0MAncI35pmQolxnIMJI0ff77v1XKdKCr/C5i43VT6Z8hDtw5F
         t/bKbNL2R198mP1PCVmNFfhPeeKSVePkquGEabN7opxq6eCUA+lCKC83hvhySE0Azxfd
         TfBz8KE9/WkDO6sdfv96kw9AmewXkHvAMjqOpmxCvVOOgFu/2BUTN425Xex+AIJwyGZz
         TtIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851655; x=1795456455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WM85JSSpk4tSn0733AW/paZhBEnarKx0aBlxAWM1Uuo=;
        b=hwdE9vRCec+BY8V0qGJm7W0Hcm7a4xmvLreLZ/07Lxc/Y+YROM4bS8v3adYfV/klfC
         6zk1U/cY9yptofbphrJfQMuVK/ua/VAMtzK0u64utiuOAzSDIqp4gvkjdZaRXd+utvrM
         lQm36lutFCF6ItxCsM05PrOF5gNqpmOWXGbnKVqLk83amA0oRY4x0S/+HLyGdFLfyseR
         7NO+2bK+Xu+OIatxGEZf3PuQ3X1UkBipwpbsHczHWyHA3cm6+DlQD+uf/KmQ0OS33wdx
         TIXWd8zckgBNQHU2FaJe0HnJY2H17tsc/4XnEBaNS4/Xkw3P85npo0cbaIadwmqYPQrk
         +C+g==
X-Gm-Message-State: APuU4Z9voE/1V3hCy6DUS9Q/EtdvhUL2F3piBv+g63Z1iUdBU4ulHhtE
	1DBE6kCOBKd1PdRUfs5zzMrWJkHbBVR4af6SkghdM1UIhEv6zz89BajBRPufgBOX
X-Gm-Gg: AYBFou0oUbyn3aFT/U8o3gz8eRIsRE7Hk7gDUvx62ccSMAeeBq2Sj+Euk8zy4ykCiJx
	iwc+8epS2fkKE59wzAYt1l70HcdLkRowZTmxn4ayJTxmMCRFtc7yFQYkUwXOv8FTmpGZScBwY9g
	Rj1elBFUn+RJe9baCpvAfPq4zW1kMV60x2wo2DVaSjLt4O5xVTLU4tSPl9dhwl6OGWecJmhWO+s
	sPj1Db4DcDlXNV5VE9QHwBqcP3Zbp7teaIkPkaemeiF1e+P+EFDw5a0HySN9CfA+2S/9Ov03Hh6
	uVsFQn2rThNqeYH7JaiBf/Ugy4t9o8kFfNv7rnnnC+2PL60hyPGUb5j5vGigwJbBnjnoQ6jV2SD
	fChX1q9yuj8f1rOQoWmStpDnPWaGN+DQ+zq6s75/UM45ImAXQdb9txnrSfTE4Qh1QL81jVM1Ej7
	vT4mYBUCOm5tk09LpnqSfYnG8UEG5CnDypKKuNWMg/CvFJMqIsI4loPHIb1LkJOw1nTQ2DxCAKD
	iTYSbDkXFB/UdJXcGI9VaBuTuX7V5xuqyQg3GrxqlmWT8N4bXOA+C58irttQW4IAiLRnknSDyvo
	xeigJIDHcFEPFdsewgLwu7noO5FUoSV6xTLrkq114kmjj5mAoYlytPOdu1j82OsAZOpjMEMvXBq
	CPWYtuBudx80/ui99FD8zaqk1ZYRmxl0ZQBihrP+R+5f8A+72o1LBbNtWEP7K3doMniDP/8dbP4
	iA784ngEqvq/7sJ6mle2fQfVDE5vlfhoKpHa/cOgtRJSEukuGNfoaTe1e12KUe67OoDOSmbEn90
	Ri/MCF/XEHa52AU8ueuJRRijke4g3m5K2FI74cTh76E76B3M2W72kjo0RvPh9O5YbCCE32sSJhZ
	IYup
X-Received: by 2002:a05:7301:4241:b0:36c:a0d7:e4ea with SMTP id 5a478bee46e88-37963a4f060mr10247148eec.1.1794851654961;
        Mon, 16 Nov 2026 09:54:14 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 009/105] python3-cachecontrol: upgrade 0.14.3 -> 0.14.4
Date: Mon, 16 Nov 2026 09:52:21 -0800
Message-ID: <20261116175359.342679-9-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:54:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132465
Content-Type: text/plain; charset="utf-8"

Upstream moved from flit_core to uv_build; inherit python_uv_build and
relax its narrow uv_build version bound.

Changes:
- Maintenance release: CI adds Python 3.14, a typo fix, and dependency
  bumps of GitHub Actions; no functional changes listed.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...oml-Relax-the-uv_build-version-bound.patch | 23 +++++++++++++++++++
 ...14.3.bb => python3-cachecontrol_0.14.4.bb} |  5 ++--
 2 files changed, 26 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-cachecontrol/0001-pyproject.toml-Relax-the-uv_build-version-bound.patch
 rename meta-python/recipes-devtools/python/{python3-cachecontrol_0.14.3.bb => python3-cachecontrol_0.14.4.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-cachecontrol/0001-pyproject.toml-Relax-the-uv_build-version-bound.patch b/meta-python/recipes-devtools/python/python3-cachecontrol/0001-pyproject.toml-Relax-the-uv_build-version-bound.patch
new file mode 100644
index 0000000000..c492528341
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cachecontrol/0001-pyproject.toml-Relax-the-uv_build-version-bound.patch
@@ -0,0 +1,23 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 15 Nov 2026 23:07:01 -0800
+Subject: [PATCH] pyproject.toml: Relax the uv_build version bound
+
+uv_build is pinned to a narrow range upstream; build with the uv_build
+version that OE ships.
+
+Upstream-Status: Inappropriate [OE-specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,5 +1,5 @@
+ [build-system]
+-requires = ["uv_build>=0.9.6,<0.10.0"]
++requires = ["uv_build>=0.9.6"]
+ build-backend = "uv_build"
+ 
+ [tool.uv.build-backend]
diff --git a/meta-python/recipes-devtools/python/python3-cachecontrol_0.14.3.bb b/meta-python/recipes-devtools/python/python3-cachecontrol_0.14.4.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-cachecontrol_0.14.3.bb
rename to meta-python/recipes-devtools/python/python3-cachecontrol_0.14.4.bb
index b32b6fe34b..9b5ff0817d 100644
--- a/meta-python/recipes-devtools/python/python3-cachecontrol_0.14.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cachecontrol_0.14.4.bb
@@ -3,9 +3,10 @@ HOMEPAGE = "https://pypi.org/project/CacheControl/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=6572692148079ebbbd800be4b9f36c6d"
 
-SRC_URI[sha256sum] = "73e7efec4b06b20d9267b441c1f733664f989fb8688391b670ca812d70795d11"
+SRC_URI += "file://0001-pyproject.toml-Relax-the-uv_build-version-bound.patch"
+SRC_URI[sha256sum] = "e6220afafa4c22a47dd0badb319f84475d79108100d04e26e8542ef7d3ab05a1"
 
-inherit pypi python_flit_core
+inherit pypi python_uv_build
 
 RDEPENDS:${PN} += "\
     python3-crypt \
