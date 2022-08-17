Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA3FC32771
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 15:35:55 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.30285.1660750552829374973
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:35:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=tsiGaAps;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=SHvs4ihm6ZY/YA+R0EtXmUPaBAKhqTX/Yai6hfay98k=; b=tsiGaApsX0FcrHJ1t8WI7+l5tD
	JFGVSrQWCskulyBML5JX86VD0tvnfV+k3xi3okcJlz+NG8NDyol2WaoDL8iTdxPwxFQekINnIIjRi
	mRD06/7T2JqZw1Jy4y5pbOEqSli0usJYLj2SqW784RMXELenWMx/rtu7SUtaRG8arJBgXyUvzJtWy
	KNjPdJmQMeTKtRa1v+FQPXrkTn2PRHqla5pK5WRjarvBujD7p2BBnqn9nrq/Hu2vLy2TuKg/Re4is
	wxEbFy9iYaSAtAC0yy3vJjduwyqg/aeOvHsBeqvuTAZ37lW44SlSBE1WFmT0GFPF9Xo3r4N6DCZSX
	zal7iMsg==;
Received: from lan.nucleusys.com ([92.247.61.126]:46664 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oOL6n-0001XJ-2L;
	Wed, 17 Aug 2022 18:35:52 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-pyperf: Upgrade 2.3.0 -> 2.4.1
Date: Wed, 17 Aug 2022 18:35:36 +0300
Message-Id: <20220817153538.3853497-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220817153538.3853497-1-leon.anavi@konsulko.com>
References: <20220817153538.3853497-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id:
 leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 15:35:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98308

Upgrade to release 2.4.1:

- Reject --tracemalloc in pyperf command
- Support reporting geometric mean by benchmark tags
- Add pyston as an implementation with a jit
- Add support for profiling benchmarks

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pyperf_2.3.0.bb => python3-pyperf_2.4.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyperf_2.3.0.bb => python3-pyperf_2.4.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-pyperf_2.3.0.bb b/meta-python/recipes-devtools/python/python3-pyperf_2.4.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-pyperf_2.3.0.bb
rename to meta-python/recipes-devtools/python/python3-pyperf_2.4.1.bb
index 5172b0a05..cb8282566 100644
--- a/meta-python/recipes-devtools/python/python3-pyperf_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyperf_2.4.1.bb
@@ -13,11 +13,11 @@ Features: \
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=78bc2e6e87c8c61272937b879e6dc2f8"
 
-SRC_URI[sha256sum] = "8a85dd42e067131d5b26b71472336da7f7f4b87ff9c97350d89f5ff0de9adedc"
+SRC_URI[sha256sum] = "38cf5e90c56f906a8320ce82a50bfa92c902b93affd72e4dc81580115f355853"
 
 DEPENDS += "${PYTHON_PN}-six-native"
 
 PYPI_PACKAGE = "pyperf"
 inherit pypi setuptools3
 
-RDEPENDS:${PN} += "${PYTHON_PN}-misc"
+RDEPENDS:${PN} += "${PYTHON_PN}-misc ${PYTHON_PN}-statistics"
-- 
2.30.2


