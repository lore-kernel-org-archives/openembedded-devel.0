Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33659.1794851702846374600
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=wTVSpAba;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36f6295304dso3148986eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851702; x=1795456502; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=csK9VpUrypcNpHTSirCoQNkmve0KYMKPk/sE+cdicr4=;
        b=wTVSpAbaKikIUtqiAqpXU65DQy/gCU8a8Foz7ZHGRc8dwSoZvnd6qOzcOpcY7Z9e8m
         4VrZa0vGSWEl93YIF/ZztpLpHEXfxjdqN68AK90OOuQEOhBlrNe6Yb9W/tVmaP1V3q+l
         9oos1VpqfTKXD5Nnl7SFFE69GTTWDL1ZUd0/mkcgw3zNPKwXsrPSx6mg8hYkXIKoN9ea
         +j9oOUyuNO63v6LUSk5qLBh7ODf0Aii0uNnpC7vgAFHdqP3nlE4UUagFxa4OsIZZ8wuv
         8880Ji+JZlGlaObTg5G8Q2aCy5TvxawJbxh6GhwULnGXNCB04KR/1WIh//cfKMhOLVg7
         nzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851702; x=1795456502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=csK9VpUrypcNpHTSirCoQNkmve0KYMKPk/sE+cdicr4=;
        b=BRhZSTep6kParXwiHCsWXfWz2VVJUadrbhbCK4MId45jpVVgR6uoLVHfTGvL854JuE
         g2P23oBawVOg54gfCOFnDLVaoqMaW8f12tX3DqfqY9JelnkJTmPTImnSCQYD1SNIo9Px
         EMbSpmZCfmRg1W6A20LMQXonAoFbmEQoeC2K7n78Z7y0F6Dcz1gF7Sny93lQkv8ebhtM
         505Ne/+jnwvxeFHdaSXpHHF9Y+ScuBLmz6SSpyWcWj7CFdDTumVTacpHmvMKnlBXnHpw
         brqgNpB9hOXcjthXEOEUUamG08IONfafnngAHDM9Cw+FJ/pYOUkT67tMngFZWxveP8Qy
         MfWQ==
X-Gm-Message-State: APuU4Z8E6gSMu2LjpXgfr9N/Uvre3ylztttxVcMloURs/T6VkvHEtp/a
	XyK7F/ImRLxTlwt3OkWdu1020ZqPDRy2s9YS4qpHBVGP47keorkuRnmxWhpHjBqt
X-Gm-Gg: AZFdTZctAi0fvo4ROHyI9vanJ/UqijattdTw3bCts3oieJddMW0d69bNsOK4YFPMKQd
	1Ahqlw0DLl1HZ8U3qPEbQ8zC8IOyOpobV7eOJqc5ZQWOJ3fWkVcR8QI4E00f9n3KCqYhCACmA3o
	VfjH9Psv5NGSD0307rt7QZ6oHUAXXjnev2BC47SsDDqKnZYkTX0wJWn0oBJe0ybLjs9fyUVKXwz
	TkrW2oUkolA58bcZ4h94kmTRdYx4AZ0Ska57C5/KRLL9CkCmqoxix+p3wgM/FTMH6oTH2VwFKfF
	/NkzyUZs+oSxJBA4Hs3SK5VxdZ+IpyeJ2Cx8AE4ENOjaAJNvhOeDo8Geas0Uc2WXgS1hlsIJ/u4
	Ojhw5QCKdY59JFAdx7GDq8sQYjxvTZOcrxUypgbHYUGD/1ru3sJHwGSR+0eZE2w1kXNbXwKVWxz
	P++PNuTjH/5xCbkYVgySnOzaBtYzMk7z52XSIfOj/mZiYwSPsKHW6ocP/pFy11A+PEJwMkkr9/k
	RAUVlj4/UfLAbYA7wWfuI2CTwH2yBPz585mTHHctG+WbDdLsP1nOVCwT6JRagBUoiM9oRkNjI3r
	td97TRLeRAlHBLzvCY36BgL2FrQrg4VCgrMoo+MfR7dbQC/5w06i+dovKGxXzAKp4LfN8uOEJ3M
	9N3kvpHBXn+JGh75mb6usAHfS0lFwTCLnOxEIJ+k33pSPGiTx4/RUW0Gh4PiuT3NZXjr/5kr8jQ
	hTyUKTJgmDeDQJoBxsssPA+hvIPfbP/z2lhrpvcNPQtmsVAdaRoLhrKfkLaCa7mv+GYLNPk7KWo
	4cKLt1NHp1a8X5C1/dVSHIOeJWYOzex3Hob22WPTLzcr2EnMK12ALWk6uiBILfOqI8c/z1SSKYa
	Q7Ai
X-Received: by 2002:a05:7301:1285:b0:375:dc5b:4400 with SMTP id 5a478bee46e88-379633723abmr15566276eec.1.1794851702107;
        Mon, 16 Nov 2026 09:55:02 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 042/105] python3-iso3166: upgrade 2.1.1 -> 3.0.0
Date: Mon, 16 Nov 2026 09:52:54 -0800
Message-ID: <20261116175359.342679-42-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132498
Content-Type: text/plain; charset="utf-8"

Upstream builds with uv_build now; inherit python_uv_build and relax its
narrow uv_build version bound.

Changes:
- Build backend changed to uv_build, with project metadata moved into
  pyproject.toml (build-time dependency change; no setuptools).
- Country data: "Nauru" renamed to "Naoero" (effective 2026-08-26).
- Test matrix updated for current Python 3 versions; no code API
  changes listed.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...oml-Relax-the-uv_build-version-bound.patch | 25 +++++++++++++++++++
 ...3166_2.1.1.bb => python3-iso3166_3.0.0.bb} |  5 ++--
 2 files changed, 28 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-iso3166/0001-pyproject.toml-Relax-the-uv_build-version-bound.patch
 rename meta-python/recipes-devtools/python/{python3-iso3166_2.1.1.bb => python3-iso3166_3.0.0.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-iso3166/0001-pyproject.toml-Relax-the-uv_build-version-bound.patch b/meta-python/recipes-devtools/python/python3-iso3166/0001-pyproject.toml-Relax-the-uv_build-version-bound.patch
new file mode 100644
index 0000000000..7dd900c346
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-iso3166/0001-pyproject.toml-Relax-the-uv_build-version-bound.patch
@@ -0,0 +1,25 @@
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
+@@ -45,7 +45,7 @@
+ ]
+ 
+ [build-system]
+-requires = ["uv_build>=0.12.5,<0.13.0"]
++requires = ["uv_build>=0.12.5"]
+ build-backend = "uv_build"
+ 
+ [tool.uv]
diff --git a/meta-python/recipes-devtools/python/python3-iso3166_2.1.1.bb b/meta-python/recipes-devtools/python/python3-iso3166_3.0.0.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-iso3166_2.1.1.bb
rename to meta-python/recipes-devtools/python/python3-iso3166_3.0.0.bb
index 876a224d90..f8f786b460 100644
--- a/meta-python/recipes-devtools/python/python3-iso3166_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-iso3166_3.0.0.bb
@@ -3,9 +3,10 @@ HOMEPAGE = "https://pypi.org/project/iso3166/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5e2f4edc7e7408a82e4a1d05f229b695"
 
-SRC_URI[sha256sum] = "fcd551b8dda66b44e9f9e6d6bbbee3a1145a22447c0a556e5d0fb1ad1e491719"
+SRC_URI += "file://0001-pyproject.toml-Relax-the-uv_build-version-bound.patch"
+SRC_URI[sha256sum] = "e567b55d169211d4d499c73307350da15df5d38248e60bae559609570c42ef55"
 
-inherit pypi python_setuptools_build_meta ptest-python-pytest
+inherit pypi python_uv_build ptest-python-pytest
 
 DEPENDS += "python3-wheel-native"
 
