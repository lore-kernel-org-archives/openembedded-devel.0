Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40022C5B572
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 05:37:21 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.917.1787117831432827255
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 22:37:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hyxVn4yp;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38e347638adso826221a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 22:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787117831; x=1787722631; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gg9tRueZwD3SGXOjEnaFV0nl0w/fptTRPwc9D3n+Ipc=;
        b=hyxVn4ypOU/y3b7qgscU+oLIU4wQJINKMUsXwsAc5k/CmrQCvizbV1n9L2ouNCsasI
         pLoBsWWrLTkUYUNqqyrK7nBdGgz2qjGn7x/RLfAwWo7LE/b0dxHbmxYw4WM9WFbZ5io7
         qMyFmTcRVrDi+VEaPCEqgwNM2KastHGFRW8bFV0zIM/Y05DXus+tYnhcGmu3xyYugOah
         KBVaIgCrOhUP/9aD6EUUEER9/RxpU0nV2SdVwbjfIQ3H5kCNq2OcBHxA1os0VhAFIfgy
         QRCClvKheVMSNPNXjfHGvWquaHLKHSPASpipLeG7pNcM4NOoSgaIzgrSuDpF94QTDHVt
         3Mbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787117831; x=1787722631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gg9tRueZwD3SGXOjEnaFV0nl0w/fptTRPwc9D3n+Ipc=;
        b=c7ctJ0AWiUjT7gZfG9EZMpqDWhXsNoXl8TY83AjsEKxcrNgrj8PMyVfbYvVXHDLI5T
         3ahpf/nlDm+KPDHXWqGOaupHyYhlIXSW3B52MtskylUZB6h/G8bSKWPkZ3f1df0t2pkJ
         Xa+01EUy2QI2glrphtkN+HCa1xQIawkSVgXMf0BoP6HibFattvGs2QT5s8OXECmvXwiE
         3gqXrCawhSvxnrmA0W4jiK4UdVYJY9Aww2DrlCYDZukiFsEYSBCRX0Wx1lEUX6DHz0V+
         1QozldhvMt1s9VPJg9z2Q8dE9mtSYJaQrG2u6/lRESlG+5vRg2h3I6X/+qjWG2bzvJob
         pvfw==
X-Gm-Message-State: AOJu0YzDJAnOhkRVQAa5CICHIcdAh/P9FeGFCRDTXuy304EvNRSpZzbq
	7nhVQOsZi950U7TfRhjRQxxL5uu8Bma+k703qyp+BJ9YdBmzOwjTKrAGCryMyUpn
X-Gm-Gg: AR+sD116DnUSSZtf76ZfSx2SAxKEETmKTfXWRNvDqystLAecLuOCCJp9cVdz9M0ywhi
	aweOYwbi58xUEqyOgeMKghRikqMc6rNEjep2+IGim7qn3LCn29rIeYYqSDjDm61KYnu3GBXMxS+
	Ob9hmtkq7QJkRjbIycjXaFNEcG0NpdS1hfTJpnY2tev8CUlISWCyARqxSFJlWzs9Z9YapXBl4f6
	lz3OhFE0M4SOMhFLRYRErVG/cKGQe2XMPS6pk7+DBJtd21LVxnnUISep9RRbeu1YJ/208t9ULlH
	TwgVn4x7in/nRO6pgIxxUQI4QPlS18c2sOCw2kAgQh7TjvuzPb/0c54cIz1cRNpLRkeQTq7ofEd
	kWoEfF9fUwpZXVyXmZZ4NTxdjVg3GwuY2GRvUM1iiWlPHY6TYHf9D5naRWjyBrR9Ftmce8WosUI
	ZJAEImftM9r8rpBHgjHemwmDDuZNQE+g27CFKISgTfTrx+CNMh0l1F6WireppVcUZeIiUBfgPQB
	A==
X-Received: by 2002:a17:90b:4e8f:b0:38e:bfe:81e9 with SMTP id 98e67ed59e1d1-39580a80a58mr3951521a91.1.1787117830747;
        Tue, 18 Aug 2026 22:37:10 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416aea2429sm2830814c88.15.2026.08.18.22.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 22:37:10 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 14/25] wrk: set PV in recipe name and update SRC_URI
Date: Wed, 19 Aug 2026 17:36:18 +1200
Message-ID: <20260819053629.391864-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
References: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 05:37:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129258

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

- SRCREV is unchanged
- Add UPSTREAM_CHECK_GITTAGREGEX

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-benchmark/wrk/{wrk_git.bb => wrk_4.2.0.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-benchmark/wrk/{wrk_git.bb => wrk_4.2.0.bb} (94%)

diff --git a/meta-oe/recipes-benchmark/wrk/wrk_git.bb b/meta-oe/recipes-benchmark/wrk/wrk_4.2.0.bb
similarity index 94%
rename from meta-oe/recipes-benchmark/wrk/wrk_git.bb
rename to meta-oe/recipes-benchmark/wrk/wrk_4.2.0.bb
index b22c1e8c62..299bfbf310 100644
--- a/meta-oe/recipes-benchmark/wrk/wrk_git.bb
+++ b/meta-oe/recipes-benchmark/wrk/wrk_4.2.0.bb
@@ -8,9 +8,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1a1b7dfe4016fcf67ae4715f167a0043"
 
 DEPENDS = "luajit luajit-native openssl"
 
-SRC_URI = "git://github.com/wg/wrk.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/wg/wrk.git;protocol=https;branch=master;tag=${PV}"
 SRCREV = "a211dd5a7050b1f9e8a9870b95513060e72ac4a0"
 
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
+
 # Use system luajit and openssl instead of bundled deps/
 # luajit headers install to a versioned subdir, point include path explicitly
 # LUA_PATH must point to luajit-native's jit.* modules for bytecode compilation (-b)

