Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2777EC0219B
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 03:19:52 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.31796.1738811985897649567
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Feb 2025 19:19:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TrwJdnag;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21f11b0e580so9827025ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Feb 2025 19:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738811985; x=1739416785; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MwncOlC0WEuaBBWa/XlcQKYfU8fblgXL2SLdOPEt+3s=;
        b=TrwJdnagdUwF08pvr3N8lVejyVC1Y4jPi4KeVotx3CVnoibCRE4oj0dZBFujiLHlEy
         oUffnUk18mVX441YuIpoaVzW5ZO1COHQa12W+EkJoHXvxF9GH9Ol9XnNUolmkgKxgHJ4
         kyb1MIKv2JvpiyUY5HzqMKFlRcomzyOeR7DM+mn5gpZOmCCXIBVEJJmnXOtqRQOW2U5R
         XnigdsglyCPbhU1R1HJmSIEoTEWNB0OTjbSLtfT/9ZNTlk8zhtO0Pbhaw4Nx0BJibItb
         3cLvXkeXOgXzhPyiEFULTJH8mznUHr4A8VCiH3bzFQkKOwqZvyDNjFACo5ZisEewVPBM
         Ud3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738811985; x=1739416785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MwncOlC0WEuaBBWa/XlcQKYfU8fblgXL2SLdOPEt+3s=;
        b=pMdB0BaEy7iCRwmOWYwAjDRvlCRbYJVP6txz32PT9G7GvhpCzOiGwqhK8YfUGv6Qqa
         oiVkK8UZ08WPajvGBASl1nKxY1qwoHp7fg/TF9p6J+rauZ0TmNC1KqSjAbpwKKqjohnK
         mWz6c+J9wc0zcSJTRe/G4ZDsEfpOOzVjl3oVT8xyrDy/zmoFoqhexstDyXAr8Uau6L8o
         mDPGXhH21+fB+yzkMYOC5HyHghO0B99Tp5BuCYcFmmBHLhcvEV3n7rp3kN4BEmD2Ave+
         qob39BlHcS+1iZz+2X+KxSDjpb5GO6s7eDABF4KpVPtgz7ojjQcVFp4fOz85MF+qpNOF
         p6hQ==
X-Gm-Message-State: AOJu0YxlV4hu7kwTHxHkPE5nNLvjBhyCzTpsYd5Jz4JIqEELcztq32M1
	ORKItjg6fddicRk7cCKM/IeXmgDaA3Q7Z5WVti95vtdLPZqDOwtL2PnNIIxI
X-Gm-Gg: ASbGnctrepqJtlBMuS+2PxkGv/nEzkCtOkgcXRaKsrEnwoWm1h9GabNaQKDo1yTBXNz
	0Iq8FnXSg3Ys2YYglSIxdmGFnWQzH+BstSV/iuEWNY/nOaDWPI+Xy14v1i9H4ZO8one78PcLKuM
	f6s2mH8ITF71CkeyRpYaTXvWuB+Z+ThIAFYzn+g5DiQjZXjUa8RzF803Ph6gkQARnUcpkKNXtIs
	S7DVHSvZX8mckP5ePhAaYE6QmtQj14TezT863JJ4skGS7J9Nrx2gw+oyNUag5KlsFI5XrppeIct
	ENaMvsg=
X-Google-Smtp-Source: AGHT+IHujnUtDqC2MPNgSl/pFJkHvVo2kPSgg1Uxiv40v/aRm/PbxMTVNrplBAG8uDzI4LiUaaizsA==
X-Received: by 2002:a17:902:e5d1:b0:21f:3a7b:f4eb with SMTP id d9443c01a7336-21f3a7bf984mr1948585ad.22.1738811985053;
        Wed, 05 Feb 2025 19:19:45 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::f923])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3650f435sm1632305ad.16.2025.02.05.19.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 19:19:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 3/3] python3-lief: Define LIEF_BUILD_DIR as B
Date: Wed,  5 Feb 2025 19:19:40 -0800
Message-ID: <20250206031940.2247517-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206031940.2247517-1-raj.khem@gmail.com>
References: <20250206031940.2247517-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Feb 2025 03:19:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115286

It avoids building everything in systems /tmp dir

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-lief_0.16.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-lief_0.16.2.bb b/meta-python/recipes-devtools/python/python3-lief_0.16.2.bb
index ff3010de14..07b54f7068 100644
--- a/meta-python/recipes-devtools/python/python3-lief_0.16.2.bb
+++ b/meta-python/recipes-devtools/python/python3-lief_0.16.2.bb
@@ -16,6 +16,8 @@ PV .= "+git"
 S = "${WORKDIR}/git"
 PEP517_SOURCE_PATH = "${S}/api/python"
 
+export LIEF_BUILD_DIR = "${B}"
+
 inherit python_setuptools_build_meta
 
 DEPENDS += "\

