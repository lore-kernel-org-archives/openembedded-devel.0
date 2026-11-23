Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48556.1795411905694129187
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=jDSg3vL8;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-38644aedba1so4172081eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411905; x=1796016705; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ctQ6sSevmWPVwKoiukR+DR+1AGHBeEX17eXSJ5oWOc=;
        b=jDSg3vL83fcCUJ18ivQPG10DHu/kBH3Nagwegdj4u/M5EtE9ZNt0Da6BoX4K4GHOCm
         EoFF94n7AVzRuaNE2/cUgrjdm2zLiGpAO3hSexbPcc+j4JfWzzBuhGetfdKVPxJFMlhb
         darVF2ntSAjTybVg2VGeya3atAexQ0rWM5aj7iBf3OG2z0XHvJsiPLLlN2K2wxULmXce
         qRMGMz8N/slNzXApzqE10wJ4HQQ44fUnpMl989ZUWHkfJl1/QNyTaneybuntD5NDK31r
         m0WtvebKhlPG4epEk5gjoGcZQnxIL3UJN4oMfSxS2YalIaZLXa73SZAJXVQ/EoSiZgxl
         tc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411905; x=1796016705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2ctQ6sSevmWPVwKoiukR+DR+1AGHBeEX17eXSJ5oWOc=;
        b=TKuq8fzz2T7oEjg/PXIS7XQQXz+osquadMaQqvbgxqXKz0MwGeRw3DeeCGfuArttxr
         vpqoglHBR/pvf6arEwvcn7YJGOv6CUZ84ldyRjFUrAd9oHf1gXlVRQNhohgw7UjOxwY6
         egGxhxDm/1EeVaKdu+9pTNcNRVsA+OSxUoLGrkIUbqzustjpOhbz4UQVtNoCNMT+EUK/
         gM/bv9CWJLVXUF53UtKVd04uFcHuQ2so5fEgrCYixTED5kd0zKQ4h+gbhh5w4jdGRdQB
         pKSquPY4EMksOq2OiUvyZ8NFNLN0jCYbCMwW6F6GzbK7O/1NB6PiXItHUSWAbWoa3p0i
         KxNA==
X-Gm-Message-State: APuU4Z/nhyExPigSA3dH8WSZOTRC+0w8egndvGFOy94mMr1BiErOioBE
	JHFMB3tJaXmP8Uge0bveUnrK6T6hXPjuQH9CmgRfplFojOL1qkqTKZMeVqS8reUsa/Y=
X-Gm-Gg: AZFdTZepOdrMEA4Yx4X+Udacb/tCQDwCGROjuwDb6xct3SDl13rSkLBIISIMMhVNWMm
	tsKCWqlex8rXNmqRIGaUadjeVlCStyK/sl56/ZNjgLIAiHhOl5dw25qwRpld3zIRThB2j8Fpuaa
	agWTeGtY+4z92EvJ/IYipq2NSzJ372s0WdI2IRaKzaGgXjXEBDhxFMIp8KAWvIKuJb1+3qiREdz
	awM2aVv1DBdsDffMo4E9XGBPC7J0XPzVYlJSQmr07XhLTNV5axFvD4MxURvlCimxNVd8XbsIAI+
	/GGY0gcrs2V/+WZWHtFljnB+sQdPp+cRUXcAC/DtwsdSJfzt6AAKh16f0YMBFg6fUGZzATcte0t
	iDD0DAWOf/vUV3hPdXgROBpazBWpUi/PcK2LcSRhwDbPTqAo0ylnb+xN4gOuFk66QcBIPpt1+X0
	tkDhEbbp3f5gl+C2lGAaxn8tU0MfHKIoap07ub4XdhLfqdfOol2SYgpGHeia2Pnfgb7JGfTPqM3
	ZJUB3lr1INCMGwRoLQdQrRq1r8fbL0A3aTqciYNOaZcpP40coqc2vwnYdHY+AOFkNqkwLjjiX9P
	bTXeqEcN7LpXXBFhfzWRcKh6FO5YSb3ft8V0KR8gMZ2frIljR2fxlUEuJC+m0+Z5rlrGUQUmDMJ
	jS95/AS5lCusW38Ay4ZbURvhLEhAnLAUBw5AyoOj4EuqYDK1FcwryD8CQdh5cB00yKeuRY+Tg6h
	u1lsEYn2i4SxnzhOJ0tQ2VpLer7u5e5KE6Gg/Fha0ObEuTqoV9QD5XhGzSA8hf44FplXKW11j2M
	FIz2th+vZsejwhj09AncAvh7VgiHA0DYgDWYCuhah5qWLqHl64145ajviJPdEqd36NJK2RZ85TI
	Zd9Y
X-Received: by 2002:a05:693c:8843:b0:386:b429:fe0 with SMTP id 5a478bee46e88-386b429175cmr1247880eec.16.1795411905008;
        Sun, 22 Nov 2026 21:31:45 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 15/16] python3-cachecontrol: upgrade 0.14.4 -> 0.15.0
Date: Sun, 22 Nov 2026 21:29:45 -0800
Message-ID: <20261123052953.3658549-89-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132876
Content-Type: text/plain; charset="utf-8"

- Honor explicit expiration on cached permanent redirects
- Parse Cache-Control directive names case-insensitively
- Preserve username/password case in cache keys and CRLF bytes in
  cached chunked bodies
- Close discarded cached responses and SeparateBodyFileCache files
- Handle malformed Date headers; treat invalid Expires as expired
- Document security considerations

Drop the uv_build bound patch; upstream allows uv_build < 0.14 now,
which covers the 0.13.8 recipe.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...oml-Relax-the-uv_build-version-bound.patch | 23 -------------------
 ...14.4.bb => python3-cachecontrol_0.15.0.bb} |  3 +--
 2 files changed, 1 insertion(+), 25 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-cachecontrol/0001-pyproject.toml-Relax-the-uv_build-version-bound.patch
 rename meta-python/recipes-devtools/python/{python3-cachecontrol_0.14.4.bb => python3-cachecontrol_0.15.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-cachecontrol/0001-pyproject.toml-Relax-the-uv_build-version-bound.patch b/meta-python/recipes-devtools/python/python3-cachecontrol/0001-pyproject.toml-Relax-the-uv_build-version-bound.patch
deleted file mode 100644
index c492528341..0000000000
--- a/meta-python/recipes-devtools/python/python3-cachecontrol/0001-pyproject.toml-Relax-the-uv_build-version-bound.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 15 Nov 2026 23:07:01 -0800
-Subject: [PATCH] pyproject.toml: Relax the uv_build version bound
-
-uv_build is pinned to a narrow range upstream; build with the uv_build
-version that OE ships.
-
-Upstream-Status: Inappropriate [OE-specific]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- pyproject.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -1,5 +1,5 @@
- [build-system]
--requires = ["uv_build>=0.9.6,<0.10.0"]
-+requires = ["uv_build>=0.9.6"]
- build-backend = "uv_build"
- 
- [tool.uv.build-backend]
diff --git a/meta-python/recipes-devtools/python/python3-cachecontrol_0.14.4.bb b/meta-python/recipes-devtools/python/python3-cachecontrol_0.15.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-cachecontrol_0.14.4.bb
rename to meta-python/recipes-devtools/python/python3-cachecontrol_0.15.0.bb
index 9b5ff0817d..c9bf84dc2d 100644
--- a/meta-python/recipes-devtools/python/python3-cachecontrol_0.14.4.bb
+++ b/meta-python/recipes-devtools/python/python3-cachecontrol_0.15.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://pypi.org/project/CacheControl/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=6572692148079ebbbd800be4b9f36c6d"
 
-SRC_URI += "file://0001-pyproject.toml-Relax-the-uv_build-version-bound.patch"
-SRC_URI[sha256sum] = "e6220afafa4c22a47dd0badb319f84475d79108100d04e26e8542ef7d3ab05a1"
+SRC_URI[sha256sum] = "52157b539eb64d85c8c793660e86cf05cf95fad7b98c8ef6846e4a0ddffdb193"
 
 inherit pypi python_uv_build
 
