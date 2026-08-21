Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9175C5DF8F
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 04:36:09 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.691.1787286963946342713
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2026 21:36:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YVj/r2uZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84f3ab8750cso403116b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 21:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787286963; x=1787891763; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rJVWpRb+UDFQ+i25KsdYNqlohksM/Nu8A88LcAfXBEk=;
        b=YVj/r2uZUwVTBI9Yk6qQ3ZjOa8i923Zs/uMxtbrhKDO5Cz9lzty4xtOBytbYSCPod5
         jZjP3HlB5tQPoONGlA3JDVEArtXGM3Kxo7XZJiD/jJsCtgABLZCIWPqqH/bbyW9cxBFL
         w5QLVTvMlhdLlTD4ap5t+crmyYYBtgjmwdSSwV9/rSrlp4GHqrJPjG744Ck4AcHgPRVC
         nl6SeVithTeY6JbMuGJiygFFlU0fHV3KVIMXYQYRg0uQZ6rYksNsQGJj0Q5YQdvK3byF
         cSJ3EFJ0x5CSUGhSIlmywyRXT+fwwf8VhnyiimUiY6mYJ0DTsSmgFQbFKvTn1922ik7e
         cQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787286963; x=1787891763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rJVWpRb+UDFQ+i25KsdYNqlohksM/Nu8A88LcAfXBEk=;
        b=BCTzWOLRzyYP7z5Jdpm51q2vxpS4nsX1vuWNDEqAD7EFGU+yUY+7Fj86JiK99eAzWb
         x4+OukLrm7e1pjzdOKD/3cQ8M16bg3M3K3Olje6Jp0WPkIuTHk3jXDF+Zshbplh4beBm
         zKPawyWcr3WLPdbiREd1D946sBKd4zyHvLW14uZBUD2+cqblecQ+burhnlcItot+DVlI
         VPQGQ40M1qOQQ1qIGYQVHm6KanC6Y4PbvSA2r46knyM/PQ1wAg6EYAe7WE4aooYrFqyW
         l2fHklOCQ46dXMHFYvz5HIRiT7OFyRSvhTAld5JeOnRxW934dIz7LouOEmAFSDKBcSj0
         z3JA==
X-Gm-Message-State: AOJu0YzeXqpDBg7+vsaaE2NQE85Y5hlAnicJIWe1kQRT/gY3yLd7tgOB
	u+1FIDLvJ42ilGxXvzTBINvtrqDXma4+fmd2P+C8R0dtYXI4zAcOyGYbZ++3xA==
X-Gm-Gg: AR+sD10ZXeOve/Qm93w4mwXzY2q8CzqE3Kk4UdzgJHaXH4TqGZDBByDpmyIOpxAwTC8
	FxYEeL3l/g78tjT3+VagPtHBae5pKs41jougu3ClVe+w77l4G1FcewSxY/sf2dc4AM6pEUn4Kjc
	l2bMAnHKEGWniReS99pHW/lc8i0fCxg4jww9PqSa8rKhpft1LE5+Ssf1pG9yFzCTruX6kCju/Sa
	wA5xxN+QaOBoZTxbIHnkWVUCJBZumREM87ajKwpj29WL8PdCG6RqB4riSRW6MRj0rQUaYdPUgvh
	5TlJOCb3kvq7z2O8cX6FGvKo8oJ+jtFtROalz3aJfz6jp1IsF9Hfpmi1A5x9muAWxbnDWIPXmmk
	m3qRBusDMXK5iLENEBS8/nN2oFhHUJLBkPLcw3u5ZHPvbE0dx7LGZnGTEUenvjsM11GjWRPgen6
	7YxZLr+8aSbo0Fqjav1VvPNjqAVewBNOfr6QbwDu86aa1Ndbw8WndpJ/38IBtxufrheuXAsLKGz
	6AMuRFXijUZVkg483o=
X-Received: by 2002:a05:6a21:3a46:b0:3bf:63af:855 with SMTP id adf61e73a8af0-3cd2fddf03emr6644341637.1.1787286962989;
        Thu, 20 Aug 2026 21:36:02 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([161.29.95.207])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef6ec40sm23626097eec.7.2026.08.20.21.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 21:36:02 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 12/15] onig: fix UPSTREAM_CHECK_REGEX
Date: Fri, 21 Aug 2026 16:35:21 +1200
Message-ID: <20260821043525.448011-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821043525.448011-1-ankur.tyagi85@gmail.com>
References: <20260821043525.448011-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 04:36:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129407

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version onig
...
INFO: Current version: 6.9.10
INFO: Latest version: 11.28

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/onig/onig_6.9.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/onig/onig_6.9.10.bb b/meta-oe/recipes-support/onig/onig_6.9.10.bb
index d7419b4ace..36f943e816 100644
--- a/meta-oe/recipes-support/onig/onig_6.9.10.bb
+++ b/meta-oe/recipes-support/onig/onig_6.9.10.bb
@@ -17,7 +17,7 @@ SRC_URI = "\
 SRC_URI[sha256sum] = "2a5cfc5ae259e4e97f86b68dfffc152cdaffe94e2060b770cb827238d769fc05"
 
 UPSTREAM_CHECK_URI = "https://github.com/kkos/oniguruma/releases/"
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
 
 BINCONFIG = "${bindir}/onig-config"
 

