Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76DA6C87FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 08:19:48 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.30288.1753863586190677296
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 01:19:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dcHS44YP;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753863586; x=1785399586;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0axUqZnG4e3ZjMFIdgmaD55z+CAolmUbsw64x5RAvEE=;
  b=dcHS44YPe0e+GpX6k2xU027ql2k2NgiZ1hSzF18gsIc2tYQhCLWr0aeK
   bcjTlf5tFVuzGnpd/BYjJmvSxkRZA9jvi3LCjTJR+KwoTf0epoTK5Gz2p
   Pc6rbEPLJi/nYGFopzaLAd4307WV5aYaiO+iKlgX7MWgOufClrX22VQnJ
   55BNUG2VNBKpiFXxLEESnDnqLdoGPdbduuLBdTV6vIll7uGQm68W31Jq2
   BHBVRKFh7QRXHuKlzpkMRh7KJCZWaLWKjfSlv1kaAna+LkeB327xF2Eo+
   pg6aGT9BGD+98KO17y9wtfh/xNuusuARlPRwmbLP8MfCQQ/prmrverwk1
   g==;
X-CSE-ConnectionGUID: JCORnBxLQu+HVfYDWuSvSw==
X-CSE-MsgGUID: GbFBe9EwRJehqdF8HmxnOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="207884126"
X-IronPort-AV: E=Sophos;i="6.16,350,1744038000"; 
   d="scan'208";a="207884126"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 17:19:45 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 527E18203CB
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 08:19:44 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id B9EB68320FC
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 08:19:43 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A70351A000B;
	Wed, 30 Jul 2025 16:19:40 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [meta-oe] [PATCH] uftrace: fix issue that actually not install
Date: Wed, 30 Jul 2025 16:19:37 +0800
Message-ID: <20250730081937.1572-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 08:19:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118765

1. "oe_runmake DESTDIR=${D} install" will actually install to ${D},
"oe_runmake DESTDIR=${D}" will skip install, ${D} is empty

2. fix issue that:
| ERROR: uftrace-0.18-r0 do_package: QA Issue: File '/usr/lib/libelf.so' from
| uftrace was already stripped, this will prevent future debugging! [already-stripped]

we have set to use sysroot libelf in do_configure with "--with-elfutils=${STAGING_EXECPREFIXDIR}",
here remove uftrace build libelf

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta-oe/recipes-devtools/uftrace/uftrace_0.18.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.18.bb b/meta-oe/recipes-devtools/uftrace/uftrace_0.18.bb
index 7ba2dcadc9..6764557f37 100644
--- a/meta-oe/recipes-devtools/uftrace/uftrace_0.18.bb
+++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.18.bb
@@ -41,7 +41,8 @@ do_compile() {
 }
 
 do_install() {
-    oe_runmake DESTDIR=${D}
+    oe_runmake DESTDIR=${D} install
+    rm -f ${D}/usr/lib/libelf.so*
 }
 
 FILES_SOLIBSDEV = ""
-- 
2.43.0


