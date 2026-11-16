Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34323.1794851705947302460
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=qyPbxef5;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso4581498eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851705; x=1795456505; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rY/T6Ww/acVQg/0it1ivTBjCyGe8NAQCDN1e5j9o9uU=;
        b=qyPbxef55vIfQzAt+kohUyyiu8raff28wEu/bGSip7u7SyQyyycG6Uy7/piOoyaG8t
         ZG+Vzgxkqq1xmKxyLU6SaQfrd5l6GB6iiu1qaRzH04FKAqeaV0/Xshdp1zuD9Wke/3wd
         Q/tLmK8mtKpemPmj2Qzy58+no3sLVdM8QaoU2FNE35IH+CCfhZ5W1MxSGbMyCwIct8Ac
         yITG8NK4umIw2ManF0An+JEUTYN/89O94j5LMCYtrBaCoA30iAKRsr9MkodcMmCkMBnL
         xq29hXcTDu0y0siaiZhuJNS+hvOZRt+MJ31pOf3hgWmgfsYo2ps12J4xRioFefr8atQl
         v5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851705; x=1795456505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rY/T6Ww/acVQg/0it1ivTBjCyGe8NAQCDN1e5j9o9uU=;
        b=YQZqnwTX/kNsmfOnX08Pmaq7BXSdmXAGO1fPKPtmAgb5NfvsCq/c9OaULwluWhD1cv
         Dzc2HvfNj/fS/gMU8DCw0ZaDWvkSRj3l8REXEkpDxnKt896ImmKMTbVufnH22S0Oppj7
         XZtxedgTjn1Xv6lrJEmGuj9htJPOA3rtuU9HpyDYIA4sMHuCBZSWOZtsl35480OGL8Yr
         G//cMGOwZCQYyQivEhXUleHyaO8vGfR4nWBna9RiuYj0veJ/TXOz53dLk+iY3++TCUwW
         FkokwlpIliK765/+8V5IaNhKQzzKfZxWUl7W0t+toUw57X7+bU1Kgp6jioI6ReGY5ZC1
         UktA==
X-Gm-Message-State: APuU4Z8SGRawUfByD0gd96Eia+T3AeFIu5uLbx3TkHQkPGqJ9sNA6a2O
	EveQnRuKa2MUhrYP9whkxwyAEXpyIMUgvWc0ciA4yBS4jjANr3xE9Uf8nmf/SRYx
X-Gm-Gg: AZFdTZdVv+5SevEjFplDjJot8rvVtWpH7EZ4OCrfU8ja64BlvfREUQA0HFvl5dOnGNC
	2DePFK0m/a0Wycs/+/BOQ0StHygUaywEQ3zAl0tJwc0xqm9Nb4PnHq/O9va8F3v87n0n+z3vg/A
	S1Sqb0VmqzKfGHAIHzHkq9vjQ5z23qPfPHBCi01fAfM7kw4frgfT10d6CN1X815AJ49yDFSy/i6
	5qyAhevXAv6ic5451Vhsj2VMfRVY3OB2hGEjAzhOj6SNEcMoYbNDUm7eVLqlo6nVUPPV6NrFX2r
	sHnE15u8ItXe4+/kpxjc3PeWw/VWN/S32bgo6G4tcTnHPDDqAyeI9taSzTh5xqeQo/XetjBxW2r
	H0HiMC4BtaRm/GM7lWHl8UqFxWV4M55EVoNG5auwcGexAqLDRntH/pNufPLzGJpZOZcrRXsi2G4
	t+xxei/7oO8KmBWDdTfquWB+MUZSt7K1Bx80exYC5NkvN9OoyF1e/ZSNP2P4UIC90XfvW7ahIdL
	Gp94FYs3lXsSUGkT88GMNNemR3tI509ARb9zUUzRfOiw1kR3lalVfkurPydfJfCiSr6N19zuoND
	n7wJI7LvvB6gR/QPwhN4kcKHIp5Ym1ZjZULhplekElA5x7Q7zMvEyRsNhC5Sd/kU0NPdVRl/ibu
	rRetqzAH0E/LT9LapDV2gxdljIGMlQ12sRtvysknB9fB1RfZ6PPaFbUJ6z3mPX/JvkMRTpZtSwK
	KjzBLAMGpPzNBSlIZTokG71VdAFWg92IpDaXXrPbGApLJ5eoPIn432J6MoWD6jS1sn+h5YnFIVu
	eCub5z2nqejtNwO7LhWW67uxtfL2Xg+lDpIYfM4Bo5XGvhAmHE5YaFVZlEreGwzzotuhwPEIfpk
	1Y0gmg==
X-Received: by 2002:a05:7300:b187:b0:37a:7dfc:7d17 with SMTP id 5a478bee46e88-37a7e0bc1c6mr7957725eec.13.1794851705195;
        Mon, 16 Nov 2026 09:55:05 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 044/105] python3-janus: upgrade 2.0.0 -> 2.1.1
Date: Mon, 16 Nov 2026 09:52:56 -0800
Message-ID: <20261116175359.342679-44-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132500
Content-Type: text/plain; charset="utf-8"

Upstream builds with uv_build now; inherit python_uv_build and relax its
narrow uv_build version bound.

Changes:
- Drop support for Python 3.9 and 3.10; add Python 3.11-3.15 support
  (2.1.0).
- Build backend changed from setuptools to uv_build.
- Bound the PriorityQueue type variable to items supporting rich
  comparison (2.1.1).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...oml-Relax-the-uv_build-version-bound.patch | 23 +++++++++++++++++++
 ...-janus_2.0.0.bb => python3-janus_2.1.1.bb} |  5 ++--
 2 files changed, 26 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-janus/0001-pyproject.toml-Relax-the-uv_build-version-bound.patch
 rename meta-python/recipes-devtools/python/{python3-janus_2.0.0.bb => python3-janus_2.1.1.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-janus/0001-pyproject.toml-Relax-the-uv_build-version-bound.patch b/meta-python/recipes-devtools/python/python3-janus/0001-pyproject.toml-Relax-the-uv_build-version-bound.patch
new file mode 100644
index 0000000000..dcd6a265ba
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-janus/0001-pyproject.toml-Relax-the-uv_build-version-bound.patch
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
+-requires = ["uv_build>=0.13.8,<0.14"]
++requires = ["uv_build>=0.13"]
+ build-backend = "uv_build"
+ 
+ [project]
diff --git a/meta-python/recipes-devtools/python/python3-janus_2.0.0.bb b/meta-python/recipes-devtools/python/python3-janus_2.1.1.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-janus_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-janus_2.1.1.bb
index 1dae961971..9ec041fc14 100644
--- a/meta-python/recipes-devtools/python/python3-janus_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-janus_2.1.1.bb
@@ -3,9 +3,10 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=23878c357ebb4c8ce1109be365043349"
 
-SRC_URI[sha256sum] = "0970f38e0e725400496c834a368a67ee551dc3b5ad0a257e132f5b46f2e77770"
+SRC_URI += "file://0001-pyproject.toml-Relax-the-uv_build-version-bound.patch"
+SRC_URI[sha256sum] = "da6197870a8c634fed91698b5fd9725c33b83cb693baabf264320d7773e53659"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_uv_build
 
 DEPENDS += "python3-wheel-native"
 
