Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55612C43602
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:27 +0000 (UTC)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14742.1782634343688104421
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iuAdG5RS;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-30ca1b4b278so4369798eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634343; x=1783239143; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dz3LLksmW5DuS2rLiNMs2aRYmkrdW6mh732irWsTDgM=;
        b=iuAdG5RSr0umZjlp+vJ3k5ffvYOi0aF4kG1EeIZZ6oTnZ6CDe+3PfcjwDcwR1N80aD
         u9lCuJD7rVSyQRS4O0pvG4cQv18vlfjdg0aLGDGHCDKq2vcXEfaMSKNofIFJGahLVpjW
         8UtMahmAoeheSFcAQDJygwhjuhpFG4a2IHtCDASjh8gRglQiIN07lxkxZIpTwCuvjYRJ
         06DS9EcUmDTq8eF7JzokTJobdmRDpqCQOXDj8aY3Lq3bjPnAjKPrsW6XcpXfwNsPr4lN
         BHeR/oPZKc6gNOtotyUo1P5FWzkbMksvwwp0kpjjzTDO0ei5jyVnFvMVLCYdiSB0ggb9
         +fKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634343; x=1783239143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dz3LLksmW5DuS2rLiNMs2aRYmkrdW6mh732irWsTDgM=;
        b=mAENF0dNuhmk46IWC0nixtRD7yIu0hZrjjh5j8rOyoz8fHQyxpneGDZvKTCpavc0VO
         7ypjP34s4bVGq5th3XSMAQzhmeLDZFr42rPeTuLVGTkEU6WjMpVr9cOQtJXkAweLrd8r
         0uE65A/FPlLzHyhli6D2JReWM3bkhBV6zJBEKPnOqoyWvHu2Z1bWTb4PxHARQ9RuwBPQ
         3b34k8e4QE/lfLtcMwdDpBrMaYnETEM4da80tjaQufuh23DnxeIfq4x8mwM9d8Dlj2VI
         VIxuVcG/jhJa+wmFp50vap8ZrnUDlRG4vRm/wnmGNRbU6chzSKMVLeMccVII7JZgZV06
         iwCw==
X-Gm-Message-State: AOJu0YyuKD83uc87sa+iorEJS1ITASRRCiBq/f6/RSeSk6znh92QEDFn
	CIEE790m7eMHbVImY+9yjD9IJ/WvWOtgEbilphBeFeG5ggvgmsqobQxjaU2xtgChr8oFyQ==
X-Gm-Gg: AfdE7cneLi9BmQ3xl+D3rUcwLbZtILUjAxRZWOxIiYjvs+u5APfItxzzx1uj/PiZqCs
	r6iFFrHGc0yzOf1dCOd9PQcjK6n+9qRQcWXfYBS+f4M5I5Z4KkQoc9bthEWLVT4gpuQXelhT3dQ
	KczFkLRm1bAi5lZLoS75ijv6o0S8iMLRa+TWasWNl6nce18ZweBzb1zrdKKeNp4WPOYju0fi1dz
	ZgSmxHHcLYvILHm/juqMzkyOccy8I1Y8rDd+S6lqx3A1v6cOfdIgR4+8HdiOZuMLQYN/EGh7rd5
	npwJJ7e9Em3Im41hroUwIcvItTh6V85bbQcfAfNzuiCSBXDra40eXnA4IlFJTpl0pfIu3muo0W6
	dTcp9klKLSWD2nD8um1yXOMPOOkyiKwUDSt+ggae6xq/IZR692FE+mmOtKFCEwhW1m2EgI/t46/
	+SMEqDqmp02jpbi8HOaniwSfarqeh1vKsfAcxm/kv/K0D+Ss4JyokrNDd/jqhozIHLqPRu+tKJh
	g9hopXCdLEbqFiFy5+XIyiYxtDo+EtfcvKEhW6ANnEAYE9NUqH1n3kOtp/6G4cV/xjsWYUqVcXD
	Bnf1ikuyGjSMmKZO78Q3FrX2hm9quw==
X-Received: by 2002:a05:7301:60c:b0:30a:e52f:9bcf with SMTP id 5a478bee46e88-30c84e05682mr12108733eec.10.1782634342913;
        Sun, 28 Jun 2026 01:12:22 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 063/128] nspr: upgrade 4.38.2 -> 4.39
Date: Sun, 28 Jun 2026 01:10:14 -0700
Message-ID: <20260628081122.178348-63-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127873

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/nspr/{nspr_4.38.2.bb => nspr_4.39.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nspr/{nspr_4.38.2.bb => nspr_4.39.bb} (98%)

diff --git a/meta-oe/recipes-support/nspr/nspr_4.38.2.bb b/meta-oe/recipes-support/nspr/nspr_4.39.bb
similarity index 98%
rename from meta-oe/recipes-support/nspr/nspr_4.38.2.bb
rename to meta-oe/recipes-support/nspr/nspr_4.39.bb
index 0d37a42f61..f28d5aaaf7 100644
--- a/meta-oe/recipes-support/nspr/nspr_4.38.2.bb
+++ b/meta-oe/recipes-support/nspr/nspr_4.39.bb
@@ -23,7 +23,7 @@ CACHED_CONFIGUREVARS:append:libc-musl = " CFLAGS='${CFLAGS} -D_PR_POLL_AVAILABLE
 UPSTREAM_CHECK_URI = "http://ftp.mozilla.org/pub/nspr/releases/"
 UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+)/"
 
-SRC_URI[sha256sum] = "e4092faeab77bdc9b32db1113e4215948ee768e26c4666db3b5a60b35f2c9105"
+SRC_URI[sha256sum] = "bbd02ee87a55676063a63e5bc819e0227de2666b47307b2a0134414cdf42368e"
 
 CVE_PRODUCT = "netscape_portable_runtime"
 

