Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E884C5DF74
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 05:02:19 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2525.1787029329808794359
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2026 22:02:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=K9+TMExZ;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so4706808a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 22:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787029329; x=1787634129; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CYfFpYLLzTJ4xk+F8T+PIabiwSpUttaB6kMDP+qSQ1g=;
        b=K9+TMExZRoRPS2s/C808+Yw6ri5C86H0y/GJA9qZMNwQkvnURuT9EtO6whnn9saleI
         Lu3gHHu/o6yQLtLZ8Y1NRti3pRwK1BI3Lc++P/TnIU1B827p5XpvAjxKieUjHSGkMw0N
         xZ1QO1ISr3+yX4qtv6a/QTliDDiNP8Q985fv8IR1hoGGQTTOEcnydtRlbVVnC2ROxnYm
         JkOTGm/3lRaofQM1Rxgs+PMd7OQAqgzRpJQFYtdihOK7bKRD+iR4El9/S9fr8Qs+vIsL
         h6CStvZCNMwomtzj5hjUNGkmqkIICvc5vcnl+BnpNGMupsZBkZKTUS8ZO4UU+JegVeDc
         xf8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787029329; x=1787634129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CYfFpYLLzTJ4xk+F8T+PIabiwSpUttaB6kMDP+qSQ1g=;
        b=QVZwT6sChLhaR6YVqZEjik6QG+Ju1eLhTo17++KPPLK/ha6YA2uAjqYungHI1Kcq6c
         qwo/B5WH8OuqrzKNjDT9ecdGq/F3p6DwL34n533AtcvNQeVZvvr2VPrmCmTjQVusRBjP
         5Kz1D+yn0UzYUKTgnqYsyFVLkBIr/QPVJRE9p2xHE9Ejr8oai+PWW97vKDbIkw6vCQvA
         hwOzDgltfqabVZkLp8T62/e63hBFRSe1H3Bkt2s5tvH6q8/bTQcJoLKFvaLxnuGU++zi
         93ojIA6I+5bxtcccdzd4xYY31oGmQBcdk3KwhCHm8UlZIWMZKyZIMlflNytiKVH+TPTN
         CfPA==
X-Gm-Message-State: AOJu0Yx14WI74Cw/FCI51eriLJzv19GcEgN+A2PXGzeevwCUsMc4TKo0
	kPrGxsLRUb/OCwpFbYtDSodmt85/2b1Jem6+j3V8ipSEHxbC60CWBypVESElL4Hr
X-Gm-Gg: AR+sD100TJ9tRJTB5ygKfdtr3VeOw66itBuYDpOgjdy1j6o/kFBNajbFX1cY6FhWYND
	vg6uDIBx5Pa7eaE/kLCTlwsmnUgRujc6CbrIexdxM1zA00NR2ru1udzM9MHI2BPYGpZAos3wATU
	zdShffvrHu4QDE6mVhHt6OyeYJeei7jAfwB2HKcc6UfZbvtQbFfNm7Q21raoMNTJu6weiZlJOC2
	oIMXkEauv8/nbnfCGCln6VKJvNblkLx8h5pE5vj8cGSW5carhMtx5H0DPD1LRr9fKgH5Ib3UHgj
	XJNWAxcBAxK81wY9fbFV3rn4hvJn+FvXyxfGQxAwpBeVL9QyCx6eAw57Mes9Q/n1g0fK5Q9PA1x
	OVtcr3U8ZZEZ5gYma0rWXHBAqLQBidAajFhUG64EfXhr1ym6Vqe3+Gi5CQgcMNoSW1Vxojk5H5f
	tBpckMxCmlaqkI2p8ixehpgHqD1OHgx3xYoGlv+7GZE/otwTi9n3VOstQgKtPfBrWwwAGnEQyeQ
	w==
X-Received: by 2002:a17:90b:53cf:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-3933bd204d0mr33049572a91.3.1787029329000;
        Mon, 17 Aug 2026 22:02:09 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267be8e5c8sm12840095eec.16.2026.08.17.22.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 22:02:08 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 12/27] samba: fix UPSTREAM_CHECK_REGEX variable
Date: Tue, 18 Aug 2026 17:01:07 +1200
Message-ID: <20260818050123.2901739-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
References: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 05:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129211

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version samba
...
INFO: Current version: 4.23.11
INFO: Latest version: 4.19.9

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.23.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.23.11.bb b/meta-networking/recipes-connectivity/samba/samba_4.23.11.bb
index 49599f29f9..67c2646011 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.23.11.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.23.11.bb
@@ -41,7 +41,7 @@ SRC_URI:append:libc-musl = " \
 
 SRC_URI[sha256sum] = "089fdeeaf83593d8f9a16847a86b6cad2fc90f7a893eb8d9d5f509bbecadc0d4"
 
-UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.19(\.\d+)+).tar.gz"
+UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>\d+\.\d+(\.\d+)+).tar.gz"
 
 inherit systemd waf-samba cpan-base perlnative update-rc.d perl-version pkgconfig
 

