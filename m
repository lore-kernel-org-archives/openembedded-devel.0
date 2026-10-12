Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DD8CA9ED2
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 10:31:17 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10369.1791801071598258658
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 03:31:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SAOwzc9D;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso590671a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 03:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791801071; x=1792405871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fo+a5ma5JbI5yOIloXrompCxLZmovGRwzSQNJ+PM8Yg=;
        b=SAOwzc9DKYzntAErI+4mRO7Jkv4lE2oTpkyRUYh49y4E/58YSijV2hAEmf+JEZmT1p
         pRTEVzhNhFJFtydvG/ieBBW8wdQGDXJON43OnX1x7546HqDDA7NBSLrFnXMHzvgSUN2O
         0AB2fPA65ROmV6qA7iRenISde3X3lFvjXqKXUJN7DeiLfDUp336oFq9jZea7VDksrmqK
         YGTo9p69yS9wZ6VPDJb7H2VHw1VNiZIkQe0hbHPgdA4Nk+1S+kpT+TbTd6JNETwJ4tk1
         5Ul8ge+ZKApGrsmW+aQz/dt0tALKzx+injDEbe0Iukgy4nDKndZ0Lhw3kRgH85UO1Los
         sUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791801071; x=1792405871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fo+a5ma5JbI5yOIloXrompCxLZmovGRwzSQNJ+PM8Yg=;
        b=SLc1LB+N1mSqbphVUWrzYIHB5kcoTDZ+pNWpBTZZaDbjB4af5itIGa5S3KzkI/Z+lp
         GDS//9Mx9CYcrY6uEWyQfiqud7PR+1qqYDqPkzYQLAsdrSr7GmwvyFXtv+7HQvgxZeLt
         C4XhFmAY+QlPoiCckwSQSe3ew5lgwD0snmH36IRhE5lX7oZfrW7WD5Nh+QPWpd/duo4p
         4c8pY7mRdK026HBsET/yEbzjJMMmpFDwmXjbHFnBVcMOtCAD7NtXyHfs6Wd011KNX1Xt
         ojv0xk4oAc4W/td9+WR1qtSYd9utHuL7S+kI3EEFqSigBavH0Whog67YMaJlYWq+RaH+
         DVzQ==
X-Gm-Message-State: AFq9FYJwy+lxAvZnEOLtsGsNd9jraqqSe5EVtjGVqOyT7BeDD1Ds+8/1
	BGpuD0Ux2FaLdCvGNyhLAXTw82o3C0ByA1DCPAw9xaApBnmAtAKABugpiuD2G1cmYZo=
X-Gm-Gg: AYBFou08zttiOvUVsKGOLJcbh6EoqCM5QcIexeNH02j57rFURdT/h9gzDoIWRH583OF
	ohJhes8k0dLCcnz85lqt8jeELA/qButp+TJsEKIipYKFVLedJogayJotSNiNJLzUqLlQbigJd2D
	8pHimyobb6BKT8Ynn+PPpIw5vupe+COJRs3sjvhstNDeyjlg804/gqerfGHJMUJuW/54FsmdAqh
	Ytt39H7RtrCwfjHmlKDqOMbNk5Hup2lAFpuP14wCPotiLRY0fNPVmKa0+iuLkyzJAkwDJTdQvcb
	QRCHxtP2wWEbWsTn5vX+i54QqdPZnohlWIU5vZEy7tA0HDGS/6D0pBNIx/gBTXTuinTnbnlSOA3
	IKLuXIRc4vpCcr/eqkJU7q9lI25mpXY6J6xg6pWRiauZNimniwQeJan509pUf+Sy//bvpKjehRl
	kubVjII6fFxz3pnDA89rDgZnfh8hbopgQXoKa8pkM6O3GVxgPPYVc7HUUt7cU86tXZAOY0xvKpP
	wAZRawF9UGMZZw8F5mUZ/fkBun+z6FCunzEGYVNpA==
X-Received: by 2002:a17:90b:3145:b0:3a0:22bd:6ef6 with SMTP id 98e67ed59e1d1-3ab3a3665f0mr7040124a91.2.1791801070851;
        Mon, 12 Oct 2026 03:31:10 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38fc9e52sm15929891a91.13.2026.10.12.03.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:31:10 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 2/2] 7zip: upgrade 26.03 -> 26.04
Date: Mon, 12 Oct 2026 23:31:01 +1300
Message-ID: <20261012103101.2969383-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012103101.2969383-1-ankur.tyagi85@gmail.com>
References: <20261012103101.2969383-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 10:31:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130761

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/ip7z/7zip/releases/tag/26.04

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-extended/7zip/{7zip_26.03.bb => 7zip_26.04.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/7zip/{7zip_26.03.bb => 7zip_26.04.bb} (98%)

diff --git a/meta-oe/recipes-extended/7zip/7zip_26.03.bb b/meta-oe/recipes-extended/7zip/7zip_26.04.bb
similarity index 98%
rename from meta-oe/recipes-extended/7zip/7zip_26.03.bb
rename to meta-oe/recipes-extended/7zip/7zip_26.04.bb
index ca50aed8eaf..49437b807d2 100644
--- a/meta-oe/recipes-extended/7zip/7zip_26.03.bb
+++ b/meta-oe/recipes-extended/7zip/7zip_26.04.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/ip7z/7zip.git;protocol=https;branch=main;tag=${PV} \
            file://0001-Remove-treating-warning-as-errors.patch \
            file://7z_wrapper.sh \
            "
-SRCREV = "0766b733fe3e06dd2a7f9a3cfbf2108ac73abd17"
+SRCREV = "9128b80e3a471108678e2b3ec3c985861c8d7b0f"
 
 UPSTREAM_CHECK_URI = "https://github.com/ip7z/7zip/releases/latest"
 

