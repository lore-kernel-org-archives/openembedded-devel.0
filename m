Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D24AAC5DF6A
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:10:09 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27811.1786651805555334332
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:10:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AFlgmbyS;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cbee3777e1cso120192a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651805; x=1787256605; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pqJoqLZYfjztKOXlhMOMVPJn2xYbOZVaywvuuLBfd3g=;
        b=AFlgmbySIIiGR4Qz17E2otY6p7z81CVWP/IVJmShwG3lSeqRJ4aA4mbE1h+RI/KpBB
         eP47y1+tj3iM2+KQ0eC7+XjzC9bLMa76fU9h5BsShEYX4SGc6h3OCI8KMVprCrEO++X0
         iJ1EPO4+4OSzEVtvpbTlfrrW1N3mRYDcrDupAHABda1M76g6rjZsFwsGBBUCeFgUpG05
         UMkHWA4XKDGEzrha3iNvP9D+Tr/BEMcST8rDybOLPxxOi9aA4+wYMfsk4uQCQW4+g9Ie
         otw73Q5EYdSr6xTqijjClcyS+PNM1VOdVsESuKeakVpMxMHvp593Jgdpzfkc244CgD5x
         kPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651805; x=1787256605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pqJoqLZYfjztKOXlhMOMVPJn2xYbOZVaywvuuLBfd3g=;
        b=JDlToG6OklIIDj+jTEOvOsrrko4HSOGg2GG7rpanITPy4s1PzSrfAs7v1eh2v+ApwX
         s/AMFuk5NsjOW5aNuZbfaPI4kBgnyn5N5wdxz5LuCZ0O6Elvo4U3MwyhvNpI99u6RwQt
         tp6Z/Wwi+yCfEMBf0oyKibUe9zOn4b6/eIn3sbT564ko2fOjVD7lHEviEAe1N/GvqC7I
         8xWyL2L+SpIeOlJxjFk2rLzfVhtfZB8WKajoTNdzrstPNc+E7n9oJLXRQW0LK+mRBhje
         /Oj1usZEia1CNtvxN0pq+G3fjQmE/d1szYa+5MotFAWIEag2JqflPNUrxOtBBrx7IwS+
         l/pA==
X-Gm-Message-State: AOJu0YxgtET2r4nDBgcc1MYfReRCLTY7MtfmcwcmDan3A+tX4cVuQPfX
	Epao5XZ0/ZU+0ZJneXgyxaw/B4GMQS1r8ZlK1RE0mxNGl3zS4LIzGuzAs1Gvm2hL
X-Gm-Gg: AR+sD1217TIRExd1H0rmQzXXse7IOnlzs3VzTQnM/OE4Qd9Mzlx+vjmAvfPIg2XI9Rv
	DfPhuAgnWCcAIXgdsB/srODhMfvqWVMmOYF9qtdJ4pgrLHSD4SF7zEsDdbN7Lm3/zcF/L+H3TP2
	IIjWQm3KIFjsitCDzJzHuCMTlP++jL/GuC8W8QqRrVbkaDNtvMZ+tFFJmuW8kvD8NnO8vQoD3Ou
	fssFdrz1gu+lAs+BbexmVMRVDmS12lGu4Bqx8Nv6ih8aUb9PI4NTR8ZjLC8up5WlSZNFuA019Xb
	zOicC2FOE/LMQgSMhAxjl8DwRd0BwpzxSH768QdNcB0CpCvmFzfgvdtzENS9sD0iwVufAjBxfGQ
	zkXLyieLkKmo5qE3ZHJmoJsqbjff+jWWYIrekZepjDTIKOCZGaCkCW4606kP8DpUEYLUocAy0jN
	P5BrBbJ/Bfj4dmqj+lo/iZdpVa4v+tzsMND7+pJEuECbeHKcNNiamco60CWN14aJ1gHBp5h7a48
	59FhX6c75woGE5Y3EFT0k4GS4e6SBpC1Btwz3hCVtrv/CPsuwIXKO57egOdBf/XJwQr2U4AdASq
	EDVQtjS8cDSa3E3oNXnmZVE5jaMu8Vb8Qp/T3AFLl5TuwYWwRb3WLnjsYk9K4W58OQv4L57MH1L
	ogqanEvICXUmSLgT660WK3OFBUk+koqNCF6jECcGswYVNxg==
X-Received: by 2002:a05:6a21:3a47:b0:3b4:71c1:ab29 with SMTP id adf61e73a8af0-3cc71afe863mr448790637.16.1786651804801;
        Thu, 13 Aug 2026 13:10:04 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:10:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 48/80] python3-py-cpuinfo: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:08:02 -0700
Message-ID: <20260813200834.1302829-48-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:10:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128992

setuptools3.bbclass and python_setuptools_build_meta.bbclass no longer
add python3-wheel-native to DEPENDS by default, following oe-core
commit e546c697b7 ("classes/setuptools3: remove wheel dependency"),
since setuptools >= 70.1.0 no longer needs the external wheel package
to build a wheel.

This recipe's pyproject.toml/setup.py still declares wheel as a build
requirement, so pyproject-build's --no-isolation dependency check now
fails:

  ERROR Unmet dependencies (checked against .../recipe-sysroot-native/usr/bin/nativepython3):
  	wheel
  		wanted: any
  		found: not installed

Add python3-wheel-native to DEPENDS directly to satisfy it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb b/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb
index 8aef266e37..db0e2a96d8 100644
--- a/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb
@@ -10,6 +10,8 @@ SRC_URI[sha256sum] = "3cdbbf3fac90dc6f118bfd64384f309edeadd902d7c8fb17f02ffa1fc3
 
 inherit ptest-python-pytest pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 SRC_URI += " \
             file://0001-test_cli.py-disable.patch \
            "

