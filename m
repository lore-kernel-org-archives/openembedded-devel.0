Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 099EBC54EBD
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 04:54:09 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.38993.1673153644915200721
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Jan 2023 20:54:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GcISlMWu;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id v13-20020a17090a6b0d00b00219c3be9830so5987645pjj.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Jan 2023 20:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAcAI3sx7I4XGUpBYE9y+PzCnBUTh+Vssxtf/WHpK3k=;
        b=GcISlMWuf4r1ajcNd8KABDrbTiW6/wm3lYcLLxUnCZU6rDCEhUZ3W4+x/kVotovUvP
         tzLicbaU/ZZNdiqXgwbuG2jVvkeaPUyfDfit6FO5wFs47HjCU/fDo2M/AwehhgDfpNXn
         7aHZNJH69OT2WOwrQarK2lQsVDeyYnJfM9Y64TZ6kFh/K36V/1O9BiJOj5U2NhLCA0Jf
         u5eXpnl6MHdzFcvKj+H9qpKqRbpRnH53ffLtvt3Y0iSc1diSeDEs+E+l2FiIHKWuJcI1
         7wiEX+ZMxk0B0ztIVfNVX7m+lVlwwkh4jyk+ZSOEb2jtHcbqtwu0P4kh0GRS2LNXTsis
         UR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oAcAI3sx7I4XGUpBYE9y+PzCnBUTh+Vssxtf/WHpK3k=;
        b=pLq+ngRc9gvuIN2SCKiuITnBVPPZPCjn22tIGG6joU3EWZaR/DAHl9N89sE/tEkUOb
         hzESu4j3Mk7Zi0O/ekijsUhHLwAjtdh5sk7zhA6H41ZnzpAwyzr5YwX24QVQvEfcqIAJ
         8TLSwB0J/9AcF7Yng3OqJ25V9ewMeWVzKUdpMVpnXLaj1x9IZKlFtCR4lfJYyi5kDPit
         eYBWepyoeeyZh0IK93B3G+1rZdyc0femrKq376RwA2B+BKPw+rhre33hKkT87Ap7xznH
         ab4Zemf0hVbTiq20bH9YaTZedwiGrR4hqHNDLJDktFcuLDNlBXAO6p0lvtkS4UTsy4lK
         HeLA==
X-Gm-Message-State: AFqh2kopd9HwSP0NjrEOzN+KEdGlUzOF4bpYEJWArxKaZ7sgztRe49MX
	DJ1lWHZ2MncGXnf+G8fG4kxsU6RiSiG3UA==
X-Google-Smtp-Source: AMrXdXsXzf3OHZwrdLv4B052RDACzm5IPSOW7fxpLEFX/rV6j4voZ4k59FIkrob7UE/FbLeAQftGKg==
X-Received: by 2002:a17:902:c9cc:b0:193:1d37:a3c1 with SMTP id q12-20020a170902c9cc00b001931d37a3c1mr4055740pld.47.1673153646503;
        Sat, 07 Jan 2023 20:54:06 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::ee35])
        by smtp.gmail.com with ESMTPSA id k15-20020a170902c40f00b0019276616e9fsm3498835plk.183.2023.01.07.20.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 20:54:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/4] packagegroup-meta-oe: Ensure sysbench is included in limited arches
Date: Sat,  7 Jan 2023 20:54:01 -0800
Message-Id: <20230108045401.1559499-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230108045401.1559499-1-raj.khem@gmail.com>
References: <20230108045401.1559499-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 04:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100438

Due to limited arch support in LuaJIT it can not be enabled univesally

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-oe.bb | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 7166b67423..65eaf6a88f 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -77,14 +77,16 @@ RDEPENDS:packagegroup-meta-oe-benchmarks = "\
     qperf \
     s-suite \
     stressapptest \
-    sysbench \
     tinymembench \
     tiobench \
     whetstone \
 "
-RDEPENDS:packagegroup-meta-oe-benchmarks:append:armv7a = " cpuburn-arm"
-RDEPENDS:packagegroup-meta-oe-benchmarks:append:armv7ve = " cpuburn-arm"
-RDEPENDS:packagegroup-meta-oe-benchmarks:append:aarch64 = " cpuburn-arm"
+RDEPENDS:packagegroup-meta-oe-benchmarks:append:armv7a = " cpuburn-arm sysbench"
+RDEPENDS:packagegroup-meta-oe-benchmarks:append:armv7ve = " cpuburn-arm sysbench"
+RDEPENDS:packagegroup-meta-oe-benchmarks:append:aarch64 = " cpuburn-arm sysbench"
+RDEPENDS:packagegroup-meta-oe-benchmarks:append:x86 = " sysbench"
+RDEPENDS:packagegroup-meta-oe-benchmarks:append:x86-64 = " sysbench"
+RDEPENDS:packagegroup-meta-oe-benchmarks:append:mips = " sysbench"
 
 RDEPENDS:packagegroup-meta-oe-benchmarks:remove:mipsarch = "libhugetlbfs"
 RDEPENDS:packagegroup-meta-oe-benchmarks:remove:mips64 = "tinymembench"
-- 
2.39.0


