Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37949C5B572
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 05:37:11 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.916.1787117828845456618
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 22:37:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GvxdWcPU;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso1117679a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 22:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787117828; x=1787722628; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xPFiY0rdyZUpFuqnbrZour7ZaoqZycavbDS3MP7693c=;
        b=GvxdWcPUgumGUKadVwWUJ1XhUYVbTRotYEviqvsj70vhnXFSNppfRcZ9ElHbQyUaJT
         w58uxMOiUDBaF9F6TWQrjlmlqOVrjYZ6sTdcvAB19OiZQ8ydTl54d475TzqiwR/glBlV
         pwOJunSDjDt7o/ojsjsxUib4LIo9yZMh1WDeokz3+/qVXf1l9Qi+4nG2/42s5/2AXpFK
         6s5t3MwAYP55urdBeNEOR9nuBERaXwJOZbL1qkmMBHtyjwOW17u6ghPdWsf70oVjSagD
         C8T+/SJ8ft/RS9AQPhjGIorV6lAb+pkqjm5FCif1V6hOBnc1tqoqDg8eZ0AYz1yNLjYh
         8kVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787117828; x=1787722628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xPFiY0rdyZUpFuqnbrZour7ZaoqZycavbDS3MP7693c=;
        b=nd2zqKVWCvhj7ijZVVbsBcXpqGOex/bMTDI4iwfRPSg5n1Yxzk1zW6sREMSZtYiBss
         58nNOmC5Hy98H1ad0PICBWuNHmoOyU+ofVhVkpQrD5RxIAvT00NZEbWksy8Dplp+gaRL
         Kahsb9YWYugpHI1yOaZkQMDEgW8gOfODidQ0EX3HOqbJN6PF/lS5Wny5UoWLkgykpb1r
         S657HaBBlfSA1fmyXJhgowcKHveeKyi1Xyziw7i1tWEsvQepQpGqV5zDd2tmaqB2SZnd
         m4mm94FqSEHGlqcfq0HfLH1mfTkkuRnJTlpjA64uMu95A80MWND39TC7KejgxnmLRPIu
         58ow==
X-Gm-Message-State: AOJu0YyVadZrCxVpIrNEfGfRA6AsXZvuHYoaDH+qGKD4tZx8W8r1RJYA
	OWi9UFsljFuJiZr0VpTE9Ux29+v/SzsXnrYbefG89De9BQWYiSltGZefBATKK8+I
X-Gm-Gg: AR+sD103PdJ4P2ycK4KoU/jmFuraFP/IGY0ed7qtx/ImHVNu0/fPRm4fZYeA55lqrCj
	z3vCzN/mdJhYPEZmUqXNIMVQwZ3p8Ee8ey8Yhw1+Sl8ZEH8agf+AVuWT483hzBdCVomqCeDoz8u
	sNb9Zj9E0z8rVP3zSRi+f/ZZeTBqZtxPgxln6Sfg631oArotKoggn9AuvPWMvGIBuGHadQOiVEx
	wGvdEWlQOzhSt7iRBsIfaLg8khw0BWtFYChJKWXielGOX4IIQXzy2Y6I88L/hvMZeC1cs6kcUMj
	AMhno2300kGXlVFaATRKEN5M0/kWBvYUkEFBrDiwaDBJR70s2/xYzUedthK8c4+6ug6uWzulCrK
	m4FlxVuvzkXW0M7I4rEh+nnSIM09qEzRs/bLa4arLoEC7kcsctNl79BguPKi5xhjt1WBtsfQNVj
	WqNoqkARDDncKXgT6N2kW7Asvu3Ud+Ha+cVN2Wnp0RakYaRP9Y6bkWGA0pHbUtECCmN0LtXoZdm
	g==
X-Received: by 2002:a17:90b:5606:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-39580aa7748mr4385433a91.8.1787117828032;
        Tue, 18 Aug 2026 22:37:08 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416aea2429sm2830814c88.15.2026.08.18.22.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 22:37:07 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 13/25] unixbench: set PV in recipe name and update SRC_URI
Date: Wed, 19 Aug 2026 17:36:17 +1200
Message-ID: <20260819053629.391864-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
References: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 05:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129257

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

- SRCREV is unchanged
- Add UPSTREAM_CHECK_GITTAGREGEX

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unixbench/{unixbench_git.bb => unixbench_6.0.1.bb}        | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-benchmark/unixbench/{unixbench_git.bb => unixbench_6.0.1.bb} (94%)

diff --git a/meta-oe/recipes-benchmark/unixbench/unixbench_git.bb b/meta-oe/recipes-benchmark/unixbench/unixbench_6.0.1.bb
similarity index 94%
rename from meta-oe/recipes-benchmark/unixbench/unixbench_git.bb
rename to meta-oe/recipes-benchmark/unixbench/unixbench_6.0.1.bb
index c119c1cf43..47b7eb5e80 100644
--- a/meta-oe/recipes-benchmark/unixbench/unixbench_git.bb
+++ b/meta-oe/recipes-benchmark/unixbench/unixbench_6.0.1.bb
@@ -5,11 +5,13 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = " \
-    git://github.com/kdlucas/byte-unixbench.git;protocol=https;nobranch=1 \
+    git://github.com/kdlucas/byte-unixbench.git;protocol=https;branch=master;tag=v${PV} \
     file://0001-skip-make-checks.patch \
 "
 SRCREV = "e949d4402f76b4bc9b7b114418faace882f0ef12"
 
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
+
 do_configure[noexec] = "1"
 
 RDEPENDS:${PN} += " \

