Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C4DC5DF7E
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 05:02:09 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2523.1787029326898099800
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2026 22:02:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=R5jabNxz;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so53022415ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 22:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787029326; x=1787634126; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/V/L8eo1knBI7suw6FzV54nXvmJbohBOCrLC29ejtZA=;
        b=R5jabNxzr57Itb4o2XjXAOD0E9qwWgIqmbIESE3ROKIdAcQFQpRgSZEYi1DV5RUdSQ
         evDOvfCfI1ld9TAaWwup9OhIpXiJNMPnQequA/6Bdxv6RZ7vLXj59NxYL3DUHUHEOE0x
         55nhe8vqcUS6nfbAP8dkzrfvSYXeIygLYvCOcXKc6bUHPIGpuz67a4RRVZgE4JXmnAby
         j+sl5h1kYuBP6i4sZYEAvyD1iDh3a007Ra/jOQ8x8EiWuX/NYtKbdEYj75qUVH/WiLja
         ni9Yzpo426rd37ZYVbXuniLjFvTgFP20HQbx9eAy7dvm7sWRUybUmOglIK7jttxBXzJD
         ihAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787029326; x=1787634126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/V/L8eo1knBI7suw6FzV54nXvmJbohBOCrLC29ejtZA=;
        b=boY1p6eAuuoi1DEIGc6Z+NK5lSlEbL9rojFztzkQVZFrdxj2Llo6vydjcj0oJYxwoq
         C07qhhtTSWM9ADNPuiU0iNJGaxoux+SwU9d/skhPu5FDwbbLB1933haOsm4y2fb2NIDw
         ooVyaG3Xl8FvzDDqLybzjNtxSchHQ/+4xDjKGyTWMGveRXyBNIkU4xEFO67ZmafI0ASI
         FeLEI+g5Dltc7MAss6GcLGrKuqLHWSFKCU34noJfXA7NslhEsp8c7tHLgaksRufWkU2H
         B/Kv6cBQV50llDxCHpYz853l2rWSFUAT9z96pp1JdFCHH6pV54qQHX3/WMOd1toaKS4A
         IKyw==
X-Gm-Message-State: AOJu0Yz43hsdvGdduz84oYgr0Mx9EJI9Dtf08A3zLmv8iK4WTGJHFeMR
	/cYNcAs5AAVuGT/2XbAT3H83pjTX/yFj4yuGjrfmYGR/ur2NhV77URJdos6yZpOW
X-Gm-Gg: AR+sD120hiJ0j0hmNz1B9Itji2V1XsrR1Ns+dbZTwIQSahNhFo031wmvpVdmBCGrDbb
	C+ea4OS/y81wS417lEN+JJPrDuqWWOmrSqNOX5uQVasA7vcGndGQbK4yOiHrQ4GulN+3rk5SymP
	IPJaGAw4CIziX7vDfXc9ZsfahRsdVi/bxq7VQe5nXmRmm7zZOYYKdjXIGvtpNzRDrkrXTYImU+N
	QAuKia8prwWa2Zpxv/mg69PMI/PEMUKHnQmfhVlwwLiNySiwBiKMmIYbICvXc35lGK1dxyrxeQf
	uoUDdu/7ZIJ7U93sa3H+vrQ10kBcKjApoQe4WmDqfYqzVMmVIc2T53qP5wAAjzdEDJG7I0itrH4
	PwgtEorWuCXagBoyceWejrsuErIN/KiDeGO1SFhdptHFtcl5Wp0+CQhSaVGFifczHfNgeQAOleg
	nfxbz+kqXNdCCH+o4fOUY7FSyYKjLCz4VPY96V2KZM/xxNn7tDC8I6npC0YjO3YAWQZxrcjyUk1
	g==
X-Received: by 2002:a17:90b:4a4b:b0:38e:bfe:81e9 with SMTP id 98e67ed59e1d1-3933b6ea12fmr29054818a91.1.1787029326237;
        Mon, 17 Aug 2026 22:02:06 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267be8e5c8sm12840095eec.16.2026.08.17.22.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 22:02:05 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 11/27] restinio: add UPSTREAM_CHECK variables
Date: Tue, 18 Aug 2026 17:01:06 +1200
Message-ID: <20260818050123.2901739-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
References: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 05:02:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129210

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version restinio
...
INFO: Current version: 0.7.9.1
INFO: Latest version:

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-connectivity/restinio/restinio_0.7.9.1.bb          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-connectivity/restinio/restinio_0.7.9.1.bb b/meta-networking/recipes-connectivity/restinio/restinio_0.7.9.1.bb
index 193e9de81a..ea44be5169 100644
--- a/meta-networking/recipes-connectivity/restinio/restinio_0.7.9.1.bb
+++ b/meta-networking/recipes-connectivity/restinio/restinio_0.7.9.1.bb
@@ -11,6 +11,9 @@ DEPENDS = "asio fmt llhttp expected-lite"
 SRC_URI = "https://github.com/Stiffstream/restinio/releases/download/v${PV}/${BP}.tar.bz2"
 SRC_URI[sha256sum] = "4a0429e2ea4ece200228226f0c628ecf9ac111cb6a6b12ad857de84c0576bf80"
 
+UPSTREAM_CHECK_URI = "https://github.com/Stiffstream/restinio/tags"
+UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
+
 S = "${UNPACKDIR}/${BP}/dev"
 
 inherit cmake

