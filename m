Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C7FCEBF92
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 09:09:49 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8412.1763456980053732984
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 01:09:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WUPZy0xa;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1763456980; x=1794992980;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y+npci+eluBthm9ITT9rugURRY9/DcimuHQNryEkypY=;
  b=WUPZy0xajsE4vADhQ94+2qaagR6LkQUp+WZKiJMTrxpj1WyI+qC6KecV
   iPdyQKXJVeUy3z2e6fqlzbwwRRAJWitFPmGhPJlKBKeVBwFIA9sW+7R72
   uJKqnpb/Mdnqy2YWGyjkYFp1fwTL/fSqYsAToJoqrA36A1FuwP72Ja19y
   6U+q7kSSXGb9ModVRqDmM50EZ7epNDBfaFdLny2WTAJ/ilOxsIoUapcWH
   JAMj5/OafP3XljSrKSa/8GSzoMFQW6VDLUPGEpwfdsJoNut0C0iYnfoij
   9VWfuvwaN+ZLYNJeg9lFyJnjjCeiqPv3fhVMhf90IadHpVZv6ixX2fTcP
   Q==;
X-CSE-ConnectionGUID: AOjjuRHSQLem4X5+oeWIDA==
X-CSE-MsgGUID: 7eUJTtGYSNukH/xImJAw1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="208179147"
X-IronPort-AV: E=Sophos;i="6.19,314,1754924400"; 
   d="scan'208";a="208179147"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 18:09:38 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id A32941C0009A
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:38 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 54EC010000FA
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id C97E1140027A;
	Tue, 18 Nov 2025 09:09:35 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 27/29] qcbor: upgrade 1.5.3 -> 1.6
Date: Tue, 18 Nov 2025 17:08:44 +0800
Message-ID: <20251118090846.1484-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251118090846.1484-1-wangmy@fujitsu.com>
References: <20251118090846.1484-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121838

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-extended/qcbor/{qcbor_1.5.3.bb => qcbor_1.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/qcbor/{qcbor_1.5.3.bb => qcbor_1.6.bb} (93%)

diff --git a/meta-oe/recipes-extended/qcbor/qcbor_1.5.3.bb b/meta-oe/recipes-extended/qcbor/qcbor_1.6.bb
similarity index 93%
rename from meta-oe/recipes-extended/qcbor/qcbor_1.5.3.bb
rename to meta-oe/recipes-extended/qcbor/qcbor_1.6.bb
index 014aa1776e..ca96199ea0 100644
--- a/meta-oe/recipes-extended/qcbor/qcbor_1.5.3.bb
+++ b/meta-oe/recipes-extended/qcbor/qcbor_1.6.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9abe2371333f4ab0e62402a486f308a5"
 
 SRC_URI = "git://github.com/laurencelundblade/QCBOR;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "4ace4620d549f22c1163c5b00d3ae0c0dae1d207"
+SRCREV = "590a23daf65af068cee81555c597063150e23539"
 
 
 inherit pkgconfig
-- 
2.43.0


