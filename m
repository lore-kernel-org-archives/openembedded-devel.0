Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CD1FC47BD1
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 09:43:07 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86608.1767692586828812948
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jan 2026 01:43:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=HjSEZSh0;
 spf=pass (domain: konsulko.com, ip: 209.85.218.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b7355f6ef12so154895066b.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 01:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1767692585; x=1768297385; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9prUsdhVBPC2cEFk2gkLYHsxl0sgUBYbfv0YQtyYc8=;
        b=HjSEZSh0LAYUNXHluL4OxoVOCk+zGZV/DxO2A3HTfuvq/SKP8muaR95/MTQDtaPdF+
         p2wyEYxqscUG86TYYP6kC9IKBaDeRq7VPJvjA6179RcPGfhyce319LGQIYIjBBCvroR6
         3W89kL2TUKckxia3ZbTgGFhIzjnZzgNm+fluM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767692585; x=1768297385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k9prUsdhVBPC2cEFk2gkLYHsxl0sgUBYbfv0YQtyYc8=;
        b=jEn8RpknbNsCVwPYf2b1HsWe6CEfH2elVEzsvRldqsZxBULTMwpl0LcUEasOsGey7K
         x2ipjY0CD6m6LyMrOTnt7ckwIID0gwrczLlkP/r51I7DGZrAC870J3O+iuY1EFG3bSbF
         rlFjTnNoDd+VIRr66ipPNPHSV63T6yTTaUDd4soM+Va90m+A/Ktts1s37Cc5oQfKMtkV
         3Hb1MYDJgkfNn47Kur7WQSiZDWCrc0o1k8N/gU4tek6yZDJAxQC5e/KhEkoq9k9rDkHV
         3YMEZLbJ63/TNUWWa31DnV58KyQ7tZUxSKVrKzw9Jarr0CzKy0gcnylGWF9VALAVDQ2M
         qWDg==
X-Gm-Message-State: AOJu0YyNSFB0h8BNY9zicURJC6v1rXYlHw96ZeRuuMzQZXbSvVgDYJgd
	BjL5U/xMODqS3mwN4Y0tlsGSD1V4wKx7IqGXLi4MZ0q6JlopF9nG1O8cwa7/1kJqZs8tOvuykH+
	gTCou
X-Gm-Gg: AY/fxX5yY6osQT1sCTwCBjASx3EZv21DWsq5dhHrBMjTFgK9ida8xrxpB9kPXdpkt49
	+eudGzzB6wI7/M1d0syjvlG8/uQtQH7wBwCgutn1ixbCKjxdqLJq0ibW/97NMntA6bzpmNtzQAy
	QdFIlYeGDOIjRc/lS7VBIml0uQX53e3MWc62hKMm+kJMtuo5GTF7NFyKC15XQCTaFtck5tcNC8X
	oDwDfLwvJF9yo6EC8kGuTxusqjLDIpYjxYmJKrJZjovqc59vItK8x3N5u8EMZ7JSlZZC4k1Zd0v
	sEoyjm9+w9ECjViforQST671rwlgDzhDQWsNqPk1pZihzG4vTXiez6n8SUZ7XvRPHhdNkgnEV/t
	JBAp53BE4cueki7agP+m1DI91TZ/6JFIp4/0OdYBqJbvC6Qeyv74XBJtXiZObDEWsyhdoQvtYBX
	qIAlT9qO6ALJzfsaOjQ5puvNt3
X-Google-Smtp-Source: AGHT+IH2YhPDDNFFZ1DeHZ2cuTYuScp/vn24swtg0vKXCb7Wh6pzvoLv/wFhsop22PEBrAvrh0fLVg==
X-Received: by 2002:a17:907:a42:b0:b72:8489:7e65 with SMTP id a640c23a62f3a-b8426be63f7mr302546066b.31.1767692584850;
        Tue, 06 Jan 2026 01:43:04 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a5118e1sm176006966b.54.2026.01.06.01.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:43:04 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-networkx: Upgrade 3.6 -> 3.6.1
Date: Tue,  6 Jan 2026 11:42:58 +0200
Message-ID: <20260106094259.36870-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260106094259.36870-1-leon.anavi@konsulko.com>
References: <20260106094259.36870-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 09:43:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123173

Upgrade to release 3.6.1:

API Changes

- Add spectral bipartition community finding and greedy bipartition
  using node swaps

Enhancements

- Nodelists for from_biadjacency_matrix
- Add spectral bipartition community finding and greedy bipartition
  using node swaps
- Fix draw_networkx_nodes with list node_shape and add regression
  test

Bug Fixes

- Fix: allow graph subclasses to have additional arguments

Documentation

- DOC: Improve benchmarking readme
- DOC: More details re: RC releases in the release process devdocs
- DOC: clarify difference between G.nodes/G.nodes() and
  G.edges/G.edges() in tutorial
- DOC: Add blurb to contributor guide about drawing tests
- DOC: Fix underline lens in docstrings
- Rolling back shortest paths links

Maintenance

- MAINT: Replace string literal with comment
- Bump actions/checkout from 5 to 6 in the actions group
- pin python 3.14 to be version 3.14.0 until dataclasses are fixed
- Blocklist Python 3.14.1

Other

- TST: add tests for unsupported graph types in MST algorithms
- TST: clean up isomorphism tests

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-networkx_3.6.bb => python3-networkx_3.6.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-networkx_3.6.bb => python3-networkx_3.6.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-networkx_3.6.bb b/meta-python/recipes-devtools/python/python3-networkx_3.6.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-networkx_3.6.bb
rename to meta-python/recipes-devtools/python/python3-networkx_3.6.1.bb
index e49645db76..fe08ae9968 100644
--- a/meta-python/recipes-devtools/python/python3-networkx_3.6.bb
+++ b/meta-python/recipes-devtools/python/python3-networkx_3.6.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://networkx.github.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f7592b173aee2da0e062f9cfa0378e9d"
 
-SRC_URI[sha256sum] = "285276002ad1f7f7da0f7b42f004bcba70d381e936559166363707fdad3d72ad"
+SRC_URI[sha256sum] = "26b7c357accc0c8cde558ad486283728b65b6a95d85ee1cd66bafab4c8168509"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3


