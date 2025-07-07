Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1342C83F0A
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 09:07:16 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.55567.1751879233188693965
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 02:07:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lGrNtEeT;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751879237; x=1783415237;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DvRMyijldMMp+RFPVz3uwXCSLjZMFLExOj/750VXFqI=;
  b=lGrNtEeT2BVxbVLWadvje3b4saaoEhfkRLG3CXV2eJEcFizLvaScGYEh
   ZZOaXfnS40LmA6+dcWOaScJsrq6dN1LmPjbqj0LXkKc7t5HsoLf2zf9RA
   nSqb6GnfMdtIaopq10cUbfhxvVFgYn5XyxoMaeJSaHtpNYss8wvmLlg8y
   sKwasddl+x9QOivrkB36a5XfCBOpMbjwn6tLR2QCIcD5TInmwYfEeTMz7
   AtRMKbcmNpMxPYWaOWd6U1PZWzL4TIm2nfa7u8HI7KtwprJN89WbOWoP+
   WV3Af0+8I4TL9YK10RY7gPpmhIkyhDZbbl7sEgkwwo9NOoI+jdbZtgNPo
   w==;
X-CSE-ConnectionGUID: utP6ZBjaTw2rI41Yw+RjSw==
X-CSE-MsgGUID: zfXisJwdScOltBJPMsy+BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="204763765"
X-IronPort-AV: E=Sophos;i="6.16,293,1744038000"; 
   d="scan'208";a="204763765"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 18:07:16 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 6BF48186B
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:15 +0000 (UTC)
Received: from oym-m2.gw.nic.fujitsu.com (oym-m2.gw.nic.fujitsu.com [10.85.9.162])
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTP id E1D3F10000EE
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:14 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 381FFBF3C5
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 18:07:13 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6DF7D1A0074;
	Mon,  7 Jul 2025 17:07:12 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 16/35] parallel: upgrade 20250522 -> 20250622
Date: Mon,  7 Jul 2025 17:06:36 +0800
Message-ID: <20250707090656.1216-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250707090656.1216-1-wangmy@fujitsu.com>
References: <20250707090656.1216-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 09:07:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118261

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../parallel/{parallel_20250522.bb => parallel_20250622.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/parallel/{parallel_20250522.bb => parallel_20250622.bb} (93%)

diff --git a/meta-oe/recipes-extended/parallel/parallel_20250522.bb b/meta-oe/recipes-extended/parallel/parallel_20250622.bb
similarity index 93%
rename from meta-oe/recipes-extended/parallel/parallel_20250522.bb
rename to meta-oe/recipes-extended/parallel/parallel_20250622.bb
index 79ea168675..739263fe30 100644
--- a/meta-oe/recipes-extended/parallel/parallel_20250522.bb
+++ b/meta-oe/recipes-extended/parallel/parallel_20250622.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "b4b28f475f8cff8bb6ed4b03cc5a67041f18fc73fa256923b23181b56afdb2cb"
+SRC_URI[sha256sum] = "69f578cf11f1b124ba3c2b673a16641debe63aeb3d2ac4cec5ad65f8a53d489b"
 
 inherit autotools bash-completion
 
-- 
2.43.0


