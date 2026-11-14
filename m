Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3149.1794685071179012560
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 11:37:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=w0DC4Gca;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso482139eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 11:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794685070; x=1795289870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UqU9bvWUzFEihHJLReN8Ra/gdYiUI1tSVTQtCQkZ4wk=;
        b=w0DC4GcaoTdHdeJA2Xj8MGk1AfXsH0GaVw7Zk6GDEgxKUxavCC7lPeJCUBSCRx5vT1
         0PDBhAHr6HJlnjg3DqchJ7m7x5t680BfifDf3qwXte+8cO1DgSVKw4epWXVrRqGDsbmW
         EIpsMK52/NDIQzuX4dENs9hpUG88Om33y9RZTi4PVS2eDL+rO/rpcahAOkjvs2x1LY18
         1pt+xrHqzmTYfQ8xOXCuk7HkCiQZYjo+/eESSYIxngaZnbcV7kvA4M3OiDl2iroFhF6k
         mQzuJ/dZgYI+AX/S7t5zrRwb6VeLK+erx9nFDQj7FlFUDnWwEjG53X1ybX11GCIT8SiK
         9WuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794685070; x=1795289870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UqU9bvWUzFEihHJLReN8Ra/gdYiUI1tSVTQtCQkZ4wk=;
        b=ULijD65uVkd1G7Ibw+ZfWMmi9sQ5tUjTqtNRZYz1k2ykf+HQqPPGYA8J7jy0w8/ih+
         jLjUK/jTxYyIjezK5LhLHQsm6KE0EjPD45WLrR6YvcT5py+G6t+F3zAWv9Wo2EganCFS
         VnG85ndraodE4h6eNYab2HSG3XCIWotVpfk/zgr2JlonPJC7XrGccy9oTZ2a2pGGe6WA
         +9So+aaqjcI23FHDr3t2hJANIuo4qdU5kp/OOnOZqS5sExpDmRQpDii1KSdETA4OX264
         BOOTHPL4zhrZ2gTX8GOpfLA7K4TrO6eTwFqJZVQj33rqqFu2pAdNi4cwtDhDQE/5mlPT
         JjkQ==
X-Gm-Message-State: APuU4Z/5laePzxpbDUQNBq7wkkDAfWPqsuKgY2O8MPONLUaOI45jANy7
	4jdWousvEH5k3vZCRBlch7Ajp2HJD9DPhjT7XUqg4yDwQmPSDbzChD7ybId9v6ko
X-Gm-Gg: AYBFou030qoUqOeuUIjcVEgoZeG6jyWTq83Pzbr11vCY+p4r/qqlORdeRwqeWDqfLPj
	KWDW7obbTbW59bE5ficAemMf+7UHCp3MyUPZnqvg7UYmD/YL0uUen7EXOHosCJbG1V/5PLXM9nb
	b7Ou6t0ZB1/Pguho3FWVMTBQD8JaAZgSTzu1hvc7jHE/GneMC5i9bdbLikaKx6VMmW3c//0lMU3
	JaYAJYKMDIH+M5Z3Wl8sIZfkWkNlStvU4A1aHxsc3kTiBed4t9D06f3RuI2moBBw0Nj2AkaoLwy
	MXblN3uUUGhCZfymDDsoVJpQGw435hkV/0T7S5i7UAhaf3RYmecvPBvH0P7MHHPhThGORwQFBIi
	QgtDyou5Pb61NvaEdfINdNcjsHaGwki0KSyMJpCfyGN0+pg83/wCKWucAp8pUTkC0dlZ5JJo3ic
	DA+oZarY8T//Lbi6O9D4gce+li1zzEuW8iC5bMqf5Yo5TrLL3FPpIUPX362wLonBO+sClOOA3H9
	SF8YML0fd+MvdbBFcA0tWzWx78voKVZxOELlkTzwejkcEd7OerUk35gOdJShBH3h/zfNb06N8E1
	GcqskJ6ckZfbAE6vythDa3wYFrG3UtNBYIronQfP8kVxJTvy4nV52BCvyqL5slmwBKwDJ9Vbah8
	O3Qw5Mo1dTROmtm+21ApPYCnuUqFEXAxCr2Qb98Jw1zChAxr+TTfBs9BgHENU/gBi+jo6DDLerX
	VZyJLwkzX+zOasbnoggdiE7wdtw/84uAMCu7JWdVdbB4K4LCMYJZ3gFL7hN9uQmuHyu5UX6Fgub
	N1hvvxy8TcyUCJMN9maGvSFkSLUBtFtYTxpm+bz5MdjpNamWCUgCwsOtFG4+Gj1tmM7QnvxYA1l
	1rsWDIlxmVXJkKS7NKA0kewqLQ==
X-Received: by 2002:a05:693c:4150:10b0:36a:1f8:a5a4 with SMTP id 5a478bee46e88-3796731697fmr6943212eec.38.1794685070503;
        Sat, 14 Nov 2026 11:37:50 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm16855164eec.4.2026.11.14.11.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:37:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 12/13] ot-br-posix: Do not error on sign-compare with musl and clang
Date: Sat, 14 Nov 2026 11:37:32 -0800
Message-ID: <20261114193733.1743149-12-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114193733.1743149-1-khem.raj@oss.qualcomm.com>
References: <20261114193733.1743149-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 19:37:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132269
Content-Type: text/plain; charset="utf-8"

musl's CMSG_NXTHDR compares a size_t with a ptrdiff_t, which clang
reports under -Wextra when the macro is expanded in openthread's posix
platform code, and -Werror turns it into:

  infra_if.cpp:275:31: fatal error: comparison of integers of different signs: '__size_t' (aka 'unsigned long') and '__ptrdiff_t' (aka 'long') [-Wsign-compare]

This used to be handled by meta-clang's nonclangable.conf. Do the same
as oe-core's seatd recipe.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-connectivity/openthread/ot-br-posix_git.bb          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
index 59e1dae2a3..5006b253fe 100644
--- a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
+++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
@@ -27,6 +27,8 @@ inherit pkgconfig cmake systemd
 # Use -std=c++20 for fixing
 # recipe-sysroot/usr/include/c++/15.1.0/ciso646:46:4: error: #warning "<ciso646> is deprecated in C++17, use <version> to detect implementation-specific macros" [-Werror=cpp]
 CXXFLAGS += "-std=c++20 -Wno-error=attributes"
+# musl CMSG_NXTHDR mixes size_t and ptrdiff_t
+CXXFLAGS:append:libc-musl:toolchain-clang = " -Wno-error=sign-compare"
 LDFLAGS:append:riscv32 = " -latomic"

 EXTRA_OECMAKE = "-DBUILD_TESTING=OFF \
