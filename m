Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7467CAC5AA
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 13:59:37 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.17303.1758290376376948563
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Sep 2025 06:59:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tmu37mkt;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b046f6fb230so408325166b.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 06:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758290375; x=1758895175; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LnTVmg7EkCE0MhPRUldIoIAUfY5yRtQWdmTp6bM/uu4=;
        b=Tmu37mktQt/0uou0wziEA7X55B6aVnGFmlAbpYp0AYrxFkZkopdhzLWWxKouVfRDNL
         3qskR+d0n+eqyeHr0L3fSfU4aOWJ5ywFDowGmpC27+rYFuw4IyEo4Xyku6YY1H9wN9A/
         rnyYENmUllm7OcLr9pSVl0XRa9GugGJ3A/3yrgkPoiE3eWMLgVJM7h0Mf/m97Eaw8cfB
         XEvCbBDQnL+7+TaYunlRSow5Ff+fyef+8TvLkZDbReD5FXGmpaF8kir3QUabCzsSJ1bN
         mVjkN/d1WlQgr1OykBYhk1wMK702OrlqVUhnH12xozEP6nBJxkW88n5DhdDMoSceqeQg
         iyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758290375; x=1758895175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LnTVmg7EkCE0MhPRUldIoIAUfY5yRtQWdmTp6bM/uu4=;
        b=FiVaPIRwztaRmcZ/PY2hK/I0J2yH8W/QXHcV9JytatHpajno/tQGStxSWyRjm15G9I
         OaQZpoUEBfW0IbFxG28Sm+6hEkXaU8J70LP6Qp/L8ZcOlYw3yaXt2x1bjgCQgwwEj+vw
         viCbOoIYp2NJkZXrEqqEBF69GF1wcfDk5HWyzNQLBKoLexQoAGjq96XkeGZEKJL2VXAF
         1QO1rvNznvuAN4emE3NwFCZ6Htt3Aa+rHVx2JK+W2lqP4RXXB7YKQse5zpQdYoPl2+sl
         9fvXdoKuZgAgtW2Jru7wcAHioMgWjB0aEONHEnOM5+zD8f5+EMKyG9dTl+v7aW5AJupH
         QvxQ==
X-Gm-Message-State: AOJu0Ywlt/QeREsQIcK4Lyxp6LekeSUTikiGIq/wOUsGH2I6rY+hbnVu
	douQbrsarAOBDsxXpp5iVGKv2ykoCrvyrBSi+1o0123zAblaXGfYeaxOx5o3nQ==
X-Gm-Gg: ASbGnctjEwl1xxCU3Y8sElOwOziaakOO3mb/A++F2Y92SmN0n9y8vsxgZticQUB2L7O
	zALauydHGHHEaiCPHSHaMc22NaVNVSJZSXo1xHAyH3+GjkSzeYlOMUbl3I05T4nm9WCDD0XB5Kc
	VsbrMOZLu4xNEYn3ltAGXHNryUgENmSe4lA2BA32UTUhYzJYgjoivGokpjHUqpfuf/oZ358mHrN
	kHR1Wro6WQ6zVjcNVYpwRuQrhbBQtjkX8WbtLYMopDxdjGkXgd7PbcGL4djDJOzgO+OSRksvhzH
	ySvNVsHuKtZZM9gZNosfrK+Hd2v+ebnnrSNbgCoHskXidFH8P317xvw0lYAxTKopynyK65kxke+
	AGxoqo7Q0yzhhKCcWt2oE
X-Google-Smtp-Source: AGHT+IEvO6W8cu+IGeZZwFtt1ibFkgsN8jo0Ef91tHwCgzZadnLadAQ9QbtBqZLx7yrGKvGxqzMCRQ==
X-Received: by 2002:a17:906:eeca:b0:b04:f5a:8c31 with SMTP id a640c23a62f3a-b24906008ccmr358364866b.32.1758290374404;
        Fri, 19 Sep 2025 06:59:34 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fd262993asm442209166b.94.2025.09.19.06.59.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 06:59:34 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 1/9] cmark: upgrade 0.30.2 -> 0.30.3
Date: Fri, 19 Sep 2025 15:59:23 +0200
Message-ID: <20250919135933.916848-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 13:59:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119598

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
  * Fix quadratic complexity bug with repeated '![[]()'.
    Resolves CVE-2023-22486. Add new pathological test.

  * Allow declarations with no space, as per spec

  * Set 'enumi*' counter correctly in LaTeX output

  * Allow '<!DOCTYPE' to be case-insensitive.
    existing spec.)

  * Fixed HTML comment scanning. Need to handle this case: '<!--> and -->'.
    Since the scanner finds the longest match, we had to
    move some of the logic outside of the scanner.

  * Fix quadratic parsing issue with repeated '<!--' (this was not
    introduced by the previous fix, and not in a released version of cmark).
    Resolves CVE-2023-22484. Add new pathological test.

  * Update HTML comment scanner to accord with commonmark/commonmark-spec#713

  * Pathological tests: half the number of repetitions, and the timeout.
    This reduces the time needed for the pathological tests.

  * Shrink 'struct cmark_node' (#446). The 'internal_offset' member is
    only used for headings and can be moved to 'struct cmark_heading'.
    This reduces the size of 'struct cmark_node' from 112 to 104 bytes on
    64-bit systems.

  * Add '-Wstrict-prototypes' and fix offending functions.

  * Fix quadratic behavior involving 'get_containing_block' (#431).
    Instead of searching for the containing block, update the tight list
    status when entering a child of a list item or exiting a list.

  * Fix 'pathological_tests.py'
    - Use a multiprocessing.Queue to actually get results from spawned
      tests processes.
    - Fix the 'allowed_failures' test.
    - Truncate actual output when printed.
    - Prepare for testing pathological behavior of the Commonmark renderer.

  * Fix source position bug with backticks

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 69aea3d8f7d84b4214948c0553fe1744f254bbf6)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-support/cmark/{cmark_0.30.2.bb => cmark_0.30.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/cmark/{cmark_0.30.2.bb => cmark_0.30.3.bb} (89%)

diff --git a/meta-oe/recipes-support/cmark/cmark_0.30.2.bb b/meta-oe/recipes-support/cmark/cmark_0.30.3.bb
similarity index 89%
rename from meta-oe/recipes-support/cmark/cmark_0.30.2.bb
rename to meta-oe/recipes-support/cmark/cmark_0.30.3.bb
index 6d6d3e5850..6697dfe07f 100644
--- a/meta-oe/recipes-support/cmark/cmark_0.30.2.bb
+++ b/meta-oe/recipes-support/cmark/cmark_0.30.3.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=81f9cae6293cc0345a9144b78152ab62"
 
 SRC_URI = "git://github.com/commonmark/cmark.git;branch=master;protocol=https"
-SRCREV = "a8da5a2f252b96eca60ae8bada1a9ba059a38401"
+SRCREV = "5ba25ff40eba44c811f79ab6a792baf945b8307c"
 S = "${WORKDIR}/git"
 
 inherit cmake lib_package

