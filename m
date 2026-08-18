Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41523C5DF74
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 05:02:39 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2537.1787029350257626405
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2026 22:02:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=P/EBbyJt;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c998fd549a8so3166499a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 22:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787029350; x=1787634150; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rbv+De195kM58EjwJhHNjXVzwc2a/378LhruWbaIWRs=;
        b=P/EBbyJtYcV23tuSkFGQmKV0j+WV6q2LxaSMg9Trr4rEd2wf8U8CNaVYbgjU8jhNx0
         r4cDV6cWrejf35hy1zxSD39aX+2jXINYr/obzAPFP0uNe+yQLSMfhkpE07Y1RJsODdH5
         NuuiYuzep3Eo7XVqHdSTHSMe7NNviCfB+rhJZMtTI5qSKo4+Gdjq/3uNutZ9qyLKSXX6
         KiZCVEOrTG1ISVV96DcDt+wzxv/dYJzn8F2+yqgqEHof+FFMRK2VMFCm2yteJdBm3xEy
         cDu2S/usX7zToxM7/Pw4Mk+2pd3NhgPizuZ1yBPzvX02DLNdtgHX7L9NY8lk8kTnyIg2
         r5+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787029350; x=1787634150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rbv+De195kM58EjwJhHNjXVzwc2a/378LhruWbaIWRs=;
        b=eMU0nRjEAuxjY3Fl9NzvUfnTolwgS2AS+li5DQBIpFXmvdbyd8Rg5oZbJvVKGNbAoU
         UshVyxwDcYbQMuqrHQe4FIn1MTWkPgPlHxlD3+HITJVdF8pw7Ly61H+jE1akjsh64MKT
         lEZdcRGNgCliOkOYbUtaYARZNOplIsBqQ7Nmg+8d+1TBlcWK7YkdL1+Xx6UzA5uSgil1
         NYAi9sfeE+BScd5kQXLskMN71OARLek7uNGwsPjGihuycm4qCRbZlBCz0lVRvD9i1pgU
         2cMlT6sUBWuOdmsVxvhhQqz86zRYWS/fuoas4SpV5ekBqJQMsJwhkGj47K7S1BuIG7v9
         lvWw==
X-Gm-Message-State: AOJu0YweXeQpl444UoldpaTQQZgXn2u8+Uw0bCAQ5HwzST+w2I9CUutY
	QPGbcLBOYP37q75yibrf75uD+KEBZR+Ejs+8rVN4YqQeeqglzpysOTwaah/BLQ==
X-Gm-Gg: AR+sD13AygANmr/k+qDRJ+m5Au9UQ8H7xHqdNKNDz0wVGWrJvMPCA+YzHhT/0UmAnRA
	X3LZjXcXk5feaPGVtsNWKi+q7h0cBcFE20zeHPnVd914swMn8OW4Nm+QslLm0QIPr/bsPIilvI/
	E7khO63KBrXCETEBtQoMhh4W5Hs34wTfK3tb+DSGcGsscftEdiJqbNNKwJCyN/ex+Yc/ZIy9CRq
	+FjJd3IAbA5ZRgN79IGE7yI8FjKvxIANbnfDjyHmYEbZKwPawkXM0FjdCqcPLohSbEE3rW33id4
	nO4yYaozCInw0X6IiropbORijOWB03VRYPz54M/AtgEGpFB2WpW+wCiMmjudFcjqeTFN0RLkymS
	jtUrkcDinvPgPagRCI3hKUNARyqoU7j4pNd/OvzawhM5JhM0PRnDPvE0gsdaRiwG7NJD5D803oK
	mTOTx3A4ei8Q3FZfd8+O0B/OSX31kwqlbxCILgQr0ze8ARFFUnHeMy2qPIzBhTGssUkQjXitmf2
	w==
X-Received: by 2002:a17:90b:2e8f:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-3933cb718fcmr33070858a91.9.1787029349615;
        Mon, 17 Aug 2026 22:02:29 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267be8e5c8sm12840095eec.16.2026.08.17.22.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 22:02:27 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 19/27] libnetfilter-cthelper: add UPSTREAM_CHECK variables
Date: Tue, 18 Aug 2026 17:01:14 +1200
Message-ID: <20260818050123.2901739-19-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
References: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 05:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129218

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version libnetfilter-cthelper
...
INFO: Current version: 1.0.1
INFO: Latest version:

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-filter/libnetfilter/libnetfilter-cthelper_1.0.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-cthelper_1.0.1.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-cthelper_1.0.1.bb
index 9a0d6cabbd..6c637f4445 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-cthelper_1.0.1.bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-cthelper_1.0.1.bb
@@ -15,3 +15,6 @@ SRC_URI[sha256sum] = "14073d5487233897355d3ff04ddc1c8d03cc5ba8d2356236aa88161a9f
 S = "${UNPACKDIR}/libnetfilter_cthelper-${PV}"
 
 inherit autotools pkgconfig
+
+UPSTREAM_CHECK_URI = "https://www.netfilter.org/pub/libnetfilter_cthelper/"
+UPSTREAM_CHECK_REGEX = "libnetfilter_cthelper-(?P<pver>\d+(\.\d+)+)\.tar\.bz2"

