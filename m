Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37963.1795594138941398002
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=lVX7uT39;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3863db981d4so7617210eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594138; x=1796198938; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S4TanQFeqM+m1Rgg4bfH9KbKjn51LfnbT0uDRcr2v9I=;
        b=lVX7uT39uNYF3oSeO7CmnivniQxDfNVumSsNkcOPVD/X3RQ6Mq+AHQj/dDdT8EFM7y
         3NXG8GGDn+7vq0dfXJDP1NAJj8zXfWCX1uYydpSjoERiV7MNn7cl7gNBjH+fF5SrDDxp
         xytW9eI6uecnmr+3VFXjyQX+QKQnXpH6QqrkJ06I7kLGOsFfDQCa47I/hShWQfTXRVQ8
         3VJZUdOzmNW8B5u4lse6AKY0j4u5S0O33cBOzVw3Kw3WJJrVthr9l3N2T40JytpgZYOF
         GSYG74KSTIPGzPoTxicHuJJed8GQ+7oSPdFRc5fdfJyNINgNqWGZO6RJPYAD61Jp+ZMm
         7ORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594138; x=1796198938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S4TanQFeqM+m1Rgg4bfH9KbKjn51LfnbT0uDRcr2v9I=;
        b=QyzmzPLkkRCHnvSoodWN25ZUCU9IBooczxy2nWIs59++2G38yDMO9q82wCvtbcQfey
         0i7jii84Nxw68NpHAgCB0Q4fSqs6tvKUzRNhzQmczO5btPpLU8f+v7C3xinn65NjjhHR
         2dpRy7DqiZBqw8TDz06C3uzLv5nPDXmqpEoynWq6uoELB3Kk6PPGgpggRu0vjkm6phyL
         H3X5o2T9daEqUGiYe13YBgSWTBmetitpP0D1TfOH6KzAxZRzqB14mCowq+1MGq4bIvZT
         8XOMkK2RZJ3GkgLpYW8oU3I/zzWbiNbWDgmQtwJTunjV38rYAj1Pq38IV15EInwEPoYk
         cSgA==
X-Gm-Message-State: APuU4Z991oPxscEdzDr4K0qzrRUinuXM0OOqtwnkwLq5ALeapplHtubW
	y1q44oiS4coWcFuyAexUnBQzco6xLdeigzm210t+H7EXtU0Cr2z50WR8YZhRvhTx
X-Gm-Gg: AZFdTZdk/N7YTPlizS6ypef6U795rcon2cuPPw+YAqI6fzeIheuN/MufUKAwAHLsqlo
	JkBsQ8jo7BOjk5An7u1s5TxQxUkAEw+BEUmIUZQOf/zEwd3ptMERSantDbgshmJZ92Dv9yLtNes
	daSS2LqN/oXB/fE0YIm98leXsjMVSvSqRUoXevuoRLmgDST/UgSHkGvcWLK5ZtaVo0zMgZ+0zSB
	+BCZdOj3UegCtMm2bI2lrKeekP2nXVzYdem//JO/aK8weuB9cUt8vIsMkzFgh4miYJTA1w6myZI
	lJ+LZbyvZlD1W1GgPesQ4MjARNlP4dvOuOlziSE6olbFGH28rewx8iVoMjyvIsjKuDC3ZylXtdq
	Oy4gboJzQHhojii1u4EdjVeqPSxC1cFeBa0N+5eun5FNKePec/fB5//pSsbUgGUsVAjy706fxzu
	gLfkBoESxTuNJivBEF4+K4BXkrctT6fCysHLhmN6VrxTpYFgdp7CyrvxFIc9/Uv90VH1CC15GDh
	hijaWN5YZ1op7G6ljGtyiuL2Njish9dqx2iwnZm1VCb70RgsBMr3v6+vDuqIBHh+Q0k6tDLCjOs
	DnJzL8YkQ08+PnZF5dm4oflQzjyjwLvJp3VMsOY0fy8v2261YRr+vxas8o4+4LUnR2pc/9PeuBa
	d8pmzzMknAXr/eO7Dexa3isJo2hb9PvYH143i+hf9R6bbutQcO7uD62RtrMYcbA0QF4bJffgaj+
	39YFvl/sKnnw6zVM8P4v8Kiav1WbB56PE3c2mBLHtun3DrYHNlBVC72VYOrfiWd/XtbQSZtp5TN
	/ixa2ICQrfwizdSOr1yS9VQxJPitQchJ47UCsOlxteMHjoO02tlwVgWiEOuW5wPcgDbYBdiS+Df
	Jg1S8vBgRpGhQlxDehl7BjJslg==
X-Received: by 2002:a05:7300:f401:b0:385:e4d9:e0e7 with SMTP id 5a478bee46e88-385e4d9e3f5mr14106586eec.5.1795594138168;
        Wed, 25 Nov 2026 00:08:58 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 06/14] python3-mypy: upgrade 1.17.0 -> 2.4.1
Date: Wed, 25 Nov 2026 00:07:17 -0800
Message-ID: <20261125080732.2419614-67-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:09:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133064
Content-Type: text/plain; charset="utf-8"

Major release series:
- 2.0 enables --local-partial-types and --strict-bytes by default,
  changes --allow-redefinition behaviour and drops Python 3.9 targets
- the Rust based native parser (ast-serialize) is the default since
  2.4; the old parser stays available with --no-native-parser
- parallel checking is no longer experimental; PEP 661 sentinels,
  closed TypedDicts (PEP 728) and full PEP 696 support were added
- Python 3.15 support; the mypyc runtime moved to the librt package

mypy now imports librt and ast_serialize at module level and lists
both in build-system.requires, so add python3-librt and
python3-ast-serialize to DEPENDS (native) and RDEPENDS. mypyc compiled
code of other packages (e.g. pytokens) imports librt only when it uses
librt primitives explicitly, so their RDEPENDS are unchanged. The
bundled mypyc/lib-rt/base64 code is BSD-2-Clause, so LICENSE gains it.

License-Update: BSD-2-Clause license of mypyc/lib-rt/base64 appended

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...{python3-mypy_1.17.0.bb => python3-mypy_2.4.1.bb} | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-mypy_1.17.0.bb => python3-mypy_2.4.1.bb} (55%)

diff --git a/meta-python/recipes-devtools/python/python3-mypy_1.17.0.bb b/meta-python/recipes-devtools/python/python3-mypy_2.4.1.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python3-mypy_1.17.0.bb
rename to meta-python/recipes-devtools/python/python3-mypy_2.4.1.bb
index 07b6213102..f7d182fd6a 100644
--- a/meta-python/recipes-devtools/python/python3-mypy_1.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-mypy_2.4.1.bb
@@ -1,15 +1,17 @@
-SUMMARY = "Optional static typing for Python 3 and 2 (PEP 484)"
+SUMMARY = "Optional static typing for Python"
 HOMEPAGE = "https://github.com/python/mypy"
-LICENSE = "MIT AND Python-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8d62fd8f8648cb018e52857347e340b9"
+LICENSE = "MIT AND Python-2.0 AND BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=572a4af76db6990f02b2d82f387ea10f"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "e5d7ccc08ba089c06e2f5629c660388ef1fee708444f1dee0b9203fa031dee03"
+SRC_URI[sha256sum] = "63b590965691e540a335fa74dadf31a7069142f6b72e234689bbd244edf55623"
 
 BBCLASSEXTEND = "native nativesdk"
 
 DEPENDS += " \
+    python3-ast-serialize-native \
+    python3-librt-native \
     python3-mypy-extensions-native \
     python3-types-psutil-native \
     python3-types-setuptools-native \
@@ -18,6 +20,8 @@ DEPENDS += " \
 "
 
 RDEPENDS:${PN} += " \
+    python3-ast-serialize \
+    python3-librt \
     python3-modules \
     python3-mypy-extensions \
     python3-pathspec \
