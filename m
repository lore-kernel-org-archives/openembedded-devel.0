Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8234.1795739778781036887
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:36:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=0zO3JR/U;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f066274caeso35446645ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739778; x=1796344578; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ogS6TY+if6UebRqhpLWb7AjbwZsGZMAGIr8dZOBi8SM=;
        b=0zO3JR/UnipeoMX3u9st+mOtpTxbri8DG+2LvXmFZ+5NqYeSG4kjb4BPnzYwvUwMqB
         PMteZ/PiQwC74WGdx5v2Fko2xc0FHo5O7lRLRiHUnMLo+ytujqPAVW+8fPK128RXwjWD
         Ufv1Gf/ehK8Du9bTYRfbfLq3XoKqR15ZMTF1jQdQb6mMW5sxe57UFHfLuxIectymYQRP
         UI6cLL+QY5VZ73Wh4mdJFDWRVyn8mdxuAY4IWchrWUZZFY0wvjqMintlNQImJjUZ5+8v
         jwtshhnovdbzBla01WKluFD/1OHxPiLwuD85fcuXAoZxU1F/2iJYMmjqL4mfJqH/Qf67
         A+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739778; x=1796344578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ogS6TY+if6UebRqhpLWb7AjbwZsGZMAGIr8dZOBi8SM=;
        b=cowmGLNKsXlK0rAfjVZs8iJ/nreWIsOys3aP5VCJHhuc7KvEc9ITndLjR5Hccn16B4
         WXKx7ONYV/q7XUUsl0L4VWlp6s9hBobX7U+qAkJctuiMMxTU67DCFIaE92oaRnAxqkXh
         GKeEFqwpSfihh41O2wFGMVQVh1IN1XxSB1Wqkzx/7Fw+dD4qErmvv+iAg22NhmLb6lJ1
         E85bon4kP51HXdh7Lk9ziq8KEPNo6h4HNNpquGpo2+R71xomwux1zRfTYitxWLWQv4uG
         kqx5gaCfGGFSE26Bsm7SRt/DjmfKhwIXfoNcmTzC1PgzsiJFxSxowbp2Hvl1Yi80N4wZ
         /SxQ==
X-Gm-Message-State: APuU4Z+s7UnXv43bu48QOlQ9DSR5XEZ/i0f++sLcyLZQTz1oAOvWMu8Y
	3NbnGyaatn6UxhSGfE9jLErLvo5SxReqTKxKv1rOSHq66DuOFG7v1mG4FZJHk4WT
X-Gm-Gg: AZFdTZeSZsUaizPNBMRLmjAHVgSodmsr95rkrmnCvSmOOpywvcuyKroiZ0ofdw+JsdY
	4s/KtxVrwDXAYb5qcqNMMhdErobehCDMTbhxfImkXu3UWTulu8H2mC91zm8Za0qMxdGnxIcAeHB
	NLuaUbIR5ooeZOGtn2GYQ8aUfkoapAsEOaWq4HfC33KnwMP1c0Xqbba3SHOfhXz22v6W1TKRCsy
	7UEGPi/S80fZcl2ITBpeMkig8hRYFc3mL8icTsTnGP7kC65OD5sNGbctgtwBw/LOXeKsbM/Akfw
	NW+g/T8lhF2nobu1Xg6Cymo49H9JMvfQ6Y6YJJrnMMAUHxBVAgQN1mIz6qZlm2uOiiCM1Wk6IDg
	lb7FCr/etvvDkozdVr2jr/MSxml7oozZMqSCtm+v7nUL8iNxJeW6zBJ56x4Bx2N7H+n7blWTaZA
	H3qC5Lc+nOJu82f7RdfqbhfJlaQN8Dq2ZGpwfFTSgRJETXRf1qXfit/GaVcCvMEJDzJuJY2Qma0
	CfaM8tMsTIulM1qOv8BznChDGHk2aRR5kGSM3znMdRu6uEAJeWdiZnQag0JdVwQjmvEOYdYk7lh
	u6IDKl685yXYk/ZhnS5vOl6JQOuLoc8scEsXnWrImsh/q74Go4rZpG4HrFNYbp/L9z5caPkpJiU
	V0v9teZdckatQWb1pVUTEyLBSBaxfJeero2ZAd6m6k+7KzHlxyLWXacy8x/hCfZhc5VXiMqWlAn
	0Q2GkGOPFOn12Sf4bDffBreiGJu5D5UcYJNqo4YgE3IpYr8Ufcsw0So9bYOg1h4Y/JQf/1uXaHg
	eH/r2m1rNdEX5Fggn4aRmxqJUmQJGdrH45f8yTFmv6Vzhv/odsKqXEr1ynaxvZ6/EGRPfDQXmOP
	TGxY
X-Received: by 2002:a17:902:f645:b0:2ef:dc42:10a9 with SMTP id d9443c01a7336-2f03ef3d32dmr238138905ad.7.1795739778137;
        Thu, 26 Nov 2026 16:36:18 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0fe9e36f9sm10410875ad.55.2026.11.26.16.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:36:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 12/39] fluentbit: upgrade 5.2.0 -> 5.2.1
Date: Thu, 26 Nov 2026 16:35:16 -0800
Message-ID: <20261127003543.2167775-13-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
References: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:36:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133182
Content-Type: text/plain; charset="utf-8"

Bug-fix and hardening release:
- in_tail, out_file, in_blob, out_s3 and others: harden file operations
  against symlink traversal.
- in_forward: validate complete compressed payloads.
- aws: mitigate accidental downgrade to plaintext payloads.
- out_kafka: fix unbounded data races.
- parser: add a static CRI parser backend (about 9 MB/s faster than the
  regex one); in_mqtt completes the QoS 2 handshake.

All patches still apply unchanged. Anchor UPSTREAM_CHECK_GITTAGREGEX so
only release tags match.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../fluentbit/{fluentbit_5.2.0.bb => fluentbit_5.2.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/fluentbit/{fluentbit_5.2.0.bb => fluentbit_5.2.1.bb} (98%)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_5.2.0.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_5.2.1.bb
similarity index 98%
rename from meta-oe/recipes-extended/fluentbit/fluentbit_5.2.0.bb
rename to meta-oe/recipes-extended/fluentbit/fluentbit_5.2.1.bb
index 3b3ca5e25f..fecf42fda7 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_5.2.0.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_5.2.1.bb
@@ -17,7 +17,7 @@ DEPENDS = "\
 "
 DEPENDS:append:libc-musl = " fts"
 
-SRCREV = "e0149076aeff009d35fd495e55379cb78f1eb53f"
+SRCREV = "d83ce705c6abae6526dfdeecbc736aa199eda339"
 SRC_URI = "\
     git://github.com/fluent/fluent-bit.git;branch=master;protocol=https;tag=v${PV} \
     file://0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch \
@@ -30,7 +30,7 @@ SRC_URI:append:libc-musl = "\
 "
 
 # prefix tag with "v" to avoid upgrade to random tags like "20220215"
-UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 
 
 PACKAGECONFIG ??= "\
