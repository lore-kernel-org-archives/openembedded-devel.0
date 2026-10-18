Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D07CCF2C9
	for <webhook@archiver.kernel.org>; Sun, 18 Oct 2026 05:56:19 +0000 (UTC)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9804.1792302976698168881
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Oct 2026 22:56:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Uy/T6aOp;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-30b6dad2382so3147681eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Oct 2026 22:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302976; x=1792907776; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SUOc2kfkMUUKhHAOb4MRSn5g+GoGcEoTODzsud9OYIY=;
        b=Uy/T6aOp8ldJ8SKhBuHMT1k5DQG0fC3u4wmO1v4rpdTYcAEt3AqVa01nrNZRKCznNq
         rTPow0vHH5MSUkFk3gnzSLVqDNrG/lA/TKFm5s85EOdXH7H4OjYP3SWFoW+Uer9axTML
         Fs1mvTIOGXJ4HEPCTd5TwWBryi19REaSwGhfUrRffbX0Fta49/OfAxmRPEGI30G2rekO
         Y864AJTQq4E9YCOUkAXQEzU35IvAdTCHag3lnSGwqBlkxwJfk9spFUlge+APc+egQG+l
         ue4SJz2B/o2sxILcYNSogMk3I8srEr76uONPusI6KWlH/QvcoRMagA81D7F6CK4AvPdj
         6pzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302976; x=1792907776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SUOc2kfkMUUKhHAOb4MRSn5g+GoGcEoTODzsud9OYIY=;
        b=eY7Kmzbfpanj1nf7DiUAR4+5/cEip/RKvfyGWU407osByZYcpX901zDaQ95xhIO7cS
         ddaEjYRbJwubHGK2ycGGnUSVeGTN4uSo3+GXj5Ve7tjKefjGGKnZ72yyhEsN7JYUNZEM
         1T3rbX1/kVmNFMOofgpPEA1wH3N8dmS50hN1u/b1qk0+fXV1kzgHNePb5tIdt/ILsz4P
         3zXT6G2tp6lUoy0hpSJ+bgZ180Z6X6h3r356HI90Z9e5Vs4NmqpjEw2kfQJ88Omj9bdJ
         RkFfqmYUjzpv7+j6JMo8QLLZqcFrwVd7pW4xLSCZvLBC1h/Uw4j9k+FxVIwtzxrcV+f3
         qDbA==
X-Gm-Message-State: AFq9FYJ7j/Ztbk1+dXtyzi5wYk1ngQJE4u4qtXM5hb+wtRFVluP7Kh3s
	SfUWKRbWf1NPy7OoqBbZbfQWkn0kM22NLkNPE4WSJyibnb4szaxu7ADacXLQKIYK/YY=
X-Gm-Gg: AYBFou0OXOIcPmO2L92WcNpToUhHWZtb1RpELc/plt0oqz825UVftj80d2lGvGvCGOf
	VFBiDOdmmXF9+M5S/Anmo4xRHWnLBUROL5MPSHpTspskjTT/jSNj7ZrtvKU9PETkuYWisP0FmRe
	407xyaSLnG1+T72ntJEGW7/MyuNIJoax4nQaOD0Aquut3rg2sqX0Lhdfm/NcUC4Erk/x2TB247i
	mapNPQGVPVl4plBzQ0EzbRLsapmGS0h3E4lqTsN33M//wxsVUUPD8ntoHpMneYdPyYcbOkLR1FJ
	/194L98fJHpjPtTgudo8zlIsALzDLlBfBxZk1qNHvnveHsPL4FYa2rYggV0rv7321oX+GxdJLrW
	3I5EygBw0MVDMHrvAuiKaKfBnw/2yq6CwcNK2s8HqGxgFyprv/7ZTzAIVVHUBxsbm2LmQ0g5j7z
	nknnIKZcArvcO5H0AdQPZeoV8A6afIsn2UHbu9V++IhD6kDbESaptQXmzQNGvKzW1yoVvo6pL52
	lVBIv7C96X8H5yI8uzn08lwk8oY5m6qPUu5UXWNfHt5AuyB2foetlTVIXeIgl5/7EBDuQqMaYMM
	oeOYrJ5mdE7ILzm2PZAjniwjC6Go9BFn6QiAOMwu/U91IlokjBo3wzDOXYAALPIcXzjE1xsekcL
	+T0EfTWWfG+IAxjDa8BJTz+repL+EBqlPIE20zPG+2AI8zxRkEm1PEnWPBYNDgioj4ZqWYm0N/E
	Nql3LtxbNF8bObwL3BvkwsVzHZvL5xHX+jGHjDgxPrGschvjc=
X-Received: by 2002:a05:7301:428c:b0:359:525f:74cb with SMTP id 5a478bee46e88-361a195b342mr5496596eec.24.1792302975923;
        Sat, 17 Oct 2026 22:56:15 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b684dsm20883415eec.10.2026.10.17.22.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:56:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 05/11] wrk2: Mark incompatible with riscv32
Date: Sat, 17 Oct 2026 22:55:32 -0700
Message-ID: <20261018055605.179605-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018055605.179605-1-khem.raj@oss.qualcomm.com>
References: <20261018055605.179605-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Oct 2026 05:56:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131087

It depends on luajit, which does not support riscv32.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-benchmark/wrk2/wrk2_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/wrk2/wrk2_git.bb b/meta-oe/recipes-benchmark/wrk2/wrk2_git.bb
index 38d1aa0e7f..d928ed9c4a 100644
--- a/meta-oe/recipes-benchmark/wrk2/wrk2_git.bb
+++ b/meta-oe/recipes-benchmark/wrk2/wrk2_git.bb
@@ -45,4 +45,6 @@ do_install() {
     install -m 0755 wrk ${D}${bindir}/wrk2
     install -d ${D}${datadir}/wrk2
     install -m 0644 src/wrk.lua ${D}${datadir}/wrk2/wrk.lua
-}
\ No newline at end of file
+}
+
+COMPATIBLE_HOST:riscv32 = "null"

