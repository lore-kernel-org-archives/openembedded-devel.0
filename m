Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33652.1794851693189002068
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:54:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=xYuSmgmK;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso4581238eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851692; x=1795456492; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WHT72WFpvqIkPJdRlAOiRpiUGDsswSJ3dkx2iwtUvoE=;
        b=xYuSmgmKl/zWkgLXFcq3o9Kh2llW+O9fCIX/tOfcRnH05qvh7dAF6JT091dRkqD645
         AOvsxkYkUjjmFjUhOkZVOzevjDlxMcZJbxYrnP+TBsnYNaI+ZBvzinZII6/zURzOEuVb
         ReMNCbJCKP+BOnwwmk+9JhrzGH0kNx/f+Ag3BO4NA/H4N28nfzTd/dCUS8YPf55ZcsGb
         PFw1JBNBHxX9noj9XAbkNB1MRWizGsSsdNzGs32+aFyQzhak9g/lhvPzXLyeP4psUx4u
         H7+1zoidzUxj+FosiKDUhF4MrLOKHFsrXsKv5apzTnVn0NSyHQZn5FYaD7I3MIPgJRId
         ASOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851692; x=1795456492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WHT72WFpvqIkPJdRlAOiRpiUGDsswSJ3dkx2iwtUvoE=;
        b=N9ujhWrobLPYENxr/+snNW2zyVxwiJHXU+x9GYAOpts+/X35R4iXyKi8i/W0LpYrtc
         r6+FdJzYmWBLGzGlne2sIO1BWZkgugnCAc09/5KRQ1apKh54RLH1No+Qgq3fA4ERgA2n
         w6LpprgtgKUt3TjlsMT0ALru1qSDIcgSO82b5oYZoqp8jxMQ4CLoeoIhViO209qZgJ8S
         BjNqzWZkLyTWkl4PlROWa3Kz8t0Xdj4TstXY1ilIXmXIh+mwwq1N9SqRV0bb3bjRvB8Y
         yueJBI9pxsgl6hylrHhhByYFLaf2eggAA5DdMTjnX+p0rcyIMkTTCYOz4SOvapcaCQ5Q
         po+A==
X-Gm-Message-State: APuU4Z/h37OF1EoF2A+Enl8tCndcTdHyhB79L5rHsyC2GOYFORmDF9iP
	cmZRuD/L1vDOxZv1S3bTVoqgPbII9egIsmi+7qo3ab7OxYOx0orCDG1GfTHvBis1
X-Gm-Gg: AYBFou0tEo304AEwpiuq8h9y3kqqi7vsYpJzQRHYlwEIJk6oaNn4X/UNVxJZtqqwIK/
	v9ieDQuIsiAOS5QTUD5YuJnHH1lX1QBK1P2oXA9i7EQPwa+z4H4qRPfHGUxe5V73Uubx31cfJOS
	BgVXeL+1beJ5Hl1jh9m2x+DD2ttnptjZt1h/aLnKEJEPiPQ1adqwAR3j5XgzArb8Jg/95/4dhsT
	2lVCpcBjCZYREu5fllRZkrTNfR9Eu4lJCPkPV6tfTvpXs+VIL2bjZnzYRoqYQypBKRlD90RrTj+
	ZtOmJ8esQ/XjiXF1FKWSBYndM77WSZLqDtn2LXzQ4e0w0GowpvZkOcH++G+8KfzfoT1rtVITjdy
	NtmFvXOBCd4tOsD48nGCc2OJJ9MsF1zjvMl2L/EwbdL7HOnASFNkJEZZ9SJ7LuH8ooFzu5anbnw
	PuO9YZVj/cyDaX3DgUHfdDtZIV3lRFSKcJ38o65g7p1OGwQqLWS6oE0wSkI+uIw4vQnzIsLkw9K
	NU2sA5nGEDUIH+K/B+j9M1h1Omh1XSFcNIaStdSesgDalDCiTAM8oDKlrp3W+Tj8OCLDVO3qhy4
	dtvLIQS6Ke/H5Nyc/cyWDMCmAt809ihrGHTIVuXQ+p3LCqZCx3kyBagJLLaBiOsiuY8FwrdZm/9
	Ac8enPyKRyCqFIvzyn/sAjApAbXegEpYKrOFy1QGQ3J/3nVZWlqFKbJ71Fpe6BqCwRuf1Pd522r
	LAZO81GGD1sLETbLM2co3cONxAZ+FWdblcshAyTQnErcpbowRoci6STFjawAeIxNrj1U1hq9R8W
	dkpiDAUWEZUUobGKh0DTA4Yo0iwy/FsNIpVcwsTYs60aObdDpoiBTVVjbuMZb61MwNQZBgm0dI4
	/g8h
X-Received: by 2002:a05:693c:8855:b0:381:c15:1b60 with SMTP id 5a478bee46e88-3810c15228cmr174964eec.32.1794851692439;
        Mon, 16 Nov 2026 09:54:52 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 035/105] python3-gnupg: upgrade 0.5.6 -> 0.5.7
Date: Mon, 16 Nov 2026 09:52:47 -0800
Message-ID: <20261116175359.342679-35-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:54:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132491
Content-Type: text/plain; charset="utf-8"

The sdist is now named python_gnupg; drop the explicit S. Add a patch
relaxing the setuptools<75 cap.

Changes:
- Add quick_sign_key(), hidden recipients for encrypt_file(), and
  allow paths in verify_file().
- Allow passing an encoding to the GPG initializer via a keyword
  parameter (#277).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...l-Relax-the-setuptools-version-bound.patch | 24 +++++++++++++++++++
 ...-gnupg_0.5.6.bb => python3-gnupg_0.5.7.bb} |  4 ++--
 2 files changed, 26 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-gnupg/0001-pyproject.toml-Relax-the-setuptools-version-bound.patch
 rename meta-python/recipes-devtools/python/{python3-gnupg_0.5.6.bb => python3-gnupg_0.5.7.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-gnupg/0001-pyproject.toml-Relax-the-setuptools-version-bound.patch b/meta-python/recipes-devtools/python/python3-gnupg/0001-pyproject.toml-Relax-the-setuptools-version-bound.patch
new file mode 100644
index 0000000000..8f67fc995d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-gnupg/0001-pyproject.toml-Relax-the-setuptools-version-bound.patch
@@ -0,0 +1,24 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 15 Nov 2026 23:26:55 -0800
+Subject: [PATCH] pyproject.toml: Relax the setuptools version bound
+
+setuptools is capped below 75 upstream; build with the setuptools
+version that OE ships.
+
+Upstream-Status: Inappropriate [OE-specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ pyproject.toml |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,5 +1,5 @@
+ [build-system]
+ requires = [
+-    "setuptools >= 68,<75",
++    "setuptools >= 68",
+ ]
+ build-backend = 'setuptools.build_meta'
diff --git a/meta-python/recipes-devtools/python/python3-gnupg_0.5.6.bb b/meta-python/recipes-devtools/python/python3-gnupg_0.5.7.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-gnupg_0.5.6.bb
rename to meta-python/recipes-devtools/python/python3-gnupg_0.5.7.bb
index e32afd1fbd..00e40951e1 100644
--- a/meta-python/recipes-devtools/python/python3-gnupg_0.5.6.bb
+++ b/meta-python/recipes-devtools/python/python3-gnupg_0.5.7.bb
@@ -5,13 +5,13 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dabe659eadd6d97325b1582e41cfc11"
 
 PYPI_PACKAGE = "python-gnupg"
 
-SRC_URI[sha256sum] = "5743e96212d38923fc19083812dc127907e44dbd3bcf0db4d657e291d3c21eac"
+SRC_URI += "file://0001-pyproject.toml-Relax-the-setuptools-version-bound.patch"
+SRC_URI[sha256sum] = "73ea46219f992b361eb1ce54cb0968101670654454916a3ee5df8bb9bf0cc8cc"
 
 CVE_PRODUCT = "python:python-gnupg"
 
 inherit pypi python_setuptools_build_meta
 
-S = "${UNPACKDIR}/python-gnupg-${PV}"
 
 DEPENDS += "python3-wheel-native"
 
