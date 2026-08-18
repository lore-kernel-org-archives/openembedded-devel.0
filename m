Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B51EC5DF7E
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 05:02:59 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2356.1787029372814830315
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2026 22:02:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KElf4GJ4;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-382ef647e20so4047364a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 22:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787029372; x=1787634172; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZVhSa8AdiO5YHU8MA3zN9ywa6E1AictzpB/LKZXTTh0=;
        b=KElf4GJ4SmTNpFy6S9jv44PJlsGcbkgwMcIIM3pZrp24++tx7byEXcgQfSqG4s7ilG
         m+rXObXh2i31BWj1GzyvchcFfdn99e0pcM0j3wgoIMa2iFKMavTlAKXY3Do7VtKJOgzQ
         5//xiDSVaoPPcM78Gl0TChjJ7YrzOmoi03psnwleGu/ydvnTKQDCcjQYTcvHQrcVemDL
         /vkfmGWC3Rvo6eanyi8sOiRJ8/BKn0CcIZjPST3HMuZBwdpHz6bW19rFM/9XhtYzHoPo
         5mdwFVibea71iy1nB35Fm/92/I2c9y6EUuz2pevrFX+KlpNcOvhID4bmlquTvsuYrBp1
         Gueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787029372; x=1787634172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZVhSa8AdiO5YHU8MA3zN9ywa6E1AictzpB/LKZXTTh0=;
        b=mTkrGXClK3zjwpFpa+6AwHc9FlqKvgoXlKVZE7qvIu1O5Dwj2RP0n9GeA5IWJ8hMDw
         Absrw/Ws9h6eN8lc1BumztnNYx02G8YlfCmVQlhmk1KG0s3jVOGueyjx1p9yFDigtPbC
         +tqkBB483PfLeYUUxuoBO1W34rD3P5Rcr5VrovFHZHazQVRBZBgo7r/Huc4J1V6mCqIv
         e9bhvtW3O2pBhRv+U7Uz2xclRJiw1O0QiaMoF9DIG3jeHvph8+DFgWNCHC7ZBNE+EqXt
         Xcdjy9AyfmFioVwXkBzv7P38rBFCaVVyk8BUqVeIaS1hD1aBO5CZxqQz5YLEv3XBwMLm
         +LYQ==
X-Gm-Message-State: AOJu0YzGkeNIi4jANnj+7eWGBBib7qoxZvmaUdiKYRqP51ftjNgLBq8k
	2T6IOpQhsiQapGPlWdoN/UzttF6/lGTvhoC/FpcKVMkQ4m33C0COgqFY7R7XQrk9
X-Gm-Gg: AR+sD11dMojPArH1M/nbi9naR4ygNlnXY4KCYlt4Nhgnm3a2zO5O7x/c69LfdnokHrF
	Qj2ZrNjhD11LebEORV4oyHdQgQ4xAJKQlH2bdybhwWTJEzYJi+ueZEIyO5L7i+v783fHBh8NFUu
	K+bnbDAcl8RrrG/wwbUCE7k0218BHsxDz/C20427nIbdRCo7zb85RnOhJFwjFpLsgzw1g7nxI3A
	oTjaavzyetzIQ9ihFfYtpQK+fIlTt7NgNm6ZcTErcqRFoxD6TMVjajcXwzBM6+A6jAVu80e7005
	LUF/GNc8pZ6/CyYnxx4cgo9IYQUDkeUwp5x6nje1DRO7/JsWWSYj0jJrRpaWSunCavKQASjvzck
	FxdjGb70wZaQaj+ERvFNuDt2sgEQtMargZnEqzXGTxYyxVgTcIVJRRHsWBDrv42tCQS99wn8nlm
	pgqZzB9aErFxihQle6Qo+PSURerxXJWejg4q90jaJ2Ru3+A08NXxI+4GRNH0uJ0i7ioRq+8oGVP
	Q==
X-Received: by 2002:a17:90b:524b:b0:37f:bfa2:1887 with SMTP id 98e67ed59e1d1-3933cb3f7d3mr33417347a91.8.1787029372061;
        Mon, 17 Aug 2026 22:02:52 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267be8e5c8sm12840095eec.16.2026.08.17.22.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 22:02:50 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 26/27] tinyproxy: add UPSTREAM_CHECK_REGEX variable
Date: Tue, 18 Aug 2026 17:01:21 +1200
Message-ID: <20260818050123.2901739-26-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
References: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 05:02:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129225

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version tinyproxy
...
INFO: Current version: 1.11.3
INFO: Latest version:

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
index 56e3296066..2555d2132d 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz
 SRC_URI[sha256sum] = "9bcf46db1a2375ff3e3d27a41982f1efec4706cce8899ff9f33323a8218f7592"
 
 UPSTREAM_CHECK_URI = "https://github.com/tinyproxy/tinyproxy/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"
 
 EXTRA_OECONF += " \
 	--enable-filter \

