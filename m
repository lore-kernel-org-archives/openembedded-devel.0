Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7132BC7EE22
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:04:38 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.103522.1683540272521667551
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Vc6bkBm1;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683540270; i=@fujitsu.com;
	bh=A4LMD598+bvjVjRhIxLgAEx9KXBvaMgJRZHSsFrMpww=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=Vc6bkBm1CQz3uVqqKvNA0mQEtb123uuNgx1K/ALyn7oJUrngm4tzOlH40QbZWTHpV
	 jY6PbGH3K6dFZbblBcWZGu/nf3wdYEm41TxynGv9XpY7jZ1LKbeFaIyeNgGo5/gofm
	 EC0d6Xs+Pa7L8fGYgnxsnuMKFOPi89swQrzcPGrTAy3Xkf2h/Jc0aZdF89148/Yo1u
	 rpK0TCgNHji1nqgDqkIEqsSGEstgfkagEtGLJCtlKuHx2P2meBqG49xILGDxpTym+j
	 x5G2JUu2nO+3TUAHiT8lCQSLZN9Ve/UtvSXUzcSVh/QduKkVnWsHldBQoFG/zuzR2d
	 DrOFGaRsmsOOw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrALMWRWlGSWpSXmKPExsViZ8ORpKt3MiL
  FYOscJYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeNZ4wnWgomcFQfuvmJtYFzA0cXIxSEksJFR
  4nXDX0YIZxqTxKe9V5i6GDk52AQkJKbvPckOYosI6Ep8/DCXEcRmFlCRmDH5CFANB4ewgLXE8
  QlqIGEWAVWJE5suMYPYvAJOElv/zwQrlxBQkJjy8D1YnFPAWeL5gSmsILYQUM2yq9uYIWrUJK
  6e28Q8gZFnASPDKkbT4tSistQiXRO9pKLM9IyS3MTMHL3EKt1EvdRS3fLU4hJdQ73E8mK91OJ
  iveLK3OScFL281JJNjMCASClmiNzBeH/nX71DjJIcTEqivKYHw1KE+JLyUyozEosz4otKc1KL
  DzHKcHAoSfC2bYtIERIsSk1PrUjLzAEGJ0xagoNHSYRX9ghQmre4IDG3ODMdInWKUVFKnFfkB
  FBCACSRUZoH1waLiEuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHntQKbwZOaVwE1/BbSYCW
  ix/+VwkMUliQgpqQYmy8WP4wx7PbJ+v1nR5l0T0Xl/9ouvDrtPBe5YXKqf/3911jXWsvtboq9
  FZ0v5d1o6XeNd8sWk48+t2YsdhT6flgrhbeEyb038tkf42LMLrcekm58GrPKJufS7+Z3GC+We
  YtnuZ8eWXrFljDjzTfvsj4NZXBIWbQWcc7JfXXgelvzx2nQ3OXvuDc/6hXU8js/vy+SZZ6fEn
  NvvNHXrV+HZXLKXXqy9M9+3b27VkzM+Cy9afzz0+IiH34YHNyclBu2azfRY72NbRuPP66EC8z
  /zdUwQ9M/ouioeXrvV1GTf9Y3O2a5CQgXm61M/Bh5flnhUwsH85Cn3mb3WCazKqT8mrJhre8P
  nc45SzLruyeEnlViKMxINtZiLihMBim1U1QMDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-587.messagelabs.com!1683540270!497702!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30233 invoked from network); 8 May 2023 10:04:30 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-17.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:04:30 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 2AD5E1D2;
	Mon,  8 May 2023 11:04:30 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 51DF71C2;
	Mon,  8 May 2023 11:04:29 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] iozone3: upgrade 492 -> 506
Date: Mon,  8 May 2023 18:04:16 +0800
Message-Id: <1683540259-25209-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683540259-25209-1-git-send-email-wangmy@fujitsu.com>
References: <1683540259-25209-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102391

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../iozone3/{iozone3_492.bb => iozone3_506.bb}                 | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-benchmark/iozone3/{iozone3_492.bb => iozone3_506.bb} (97%)

diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3_492.bb b/meta-oe/recipes-benchmark/iozone3/iozone3_506.bb
similarity index 97%
rename from meta-oe/recipes-benchmark/iozone3/iozone3_492.bb
rename to meta-oe/recipes-benchmark/iozone3/iozone3_506.bb
index ba3eaec619..3b6df0b301 100644
--- a/meta-oe/recipes-benchmark/iozone3/iozone3_492.bb
+++ b/meta-oe/recipes-benchmark/iozone3/iozone3_506.bb
@@ -11,8 +11,7 @@ SRC_URI = "http://www.iozone.org/src/current/${BPN}_${PV}.tar \
     file://0001-let-system-headers-provide-pread64.patch \
     file://copyright.txt \
 "
-SRC_URI[md5sum] = "228f54482c01d1c04c571a9414cd20e5"
-SRC_URI[sha256sum] = "322981e168f32bd39f54772b82b2906d598d958c37e954e75742e71baf58bb9b"
+SRC_URI[sha256sum] = "114ce5c071873b9a2c7ba6e73d05d5ef7e66564392acbfcdc0b3261db10fcbe7"
 
 UPSTREAM_CHECK_REGEX = "iozone3_(?P<pver>\d+).tar"
 
-- 
2.34.1


