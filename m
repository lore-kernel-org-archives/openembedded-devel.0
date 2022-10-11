Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8587C4321E
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 10:00:29 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web09.5544.1665482419731129954
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Oct 2022 03:00:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=RDsbMpR/;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=FZlpf0Tg+R0Ycdl4Gwi2FGs5uZdWZ05R1GliWzqgmwg=; b=RDsbMpR/75dz+DpaYta13RpkL0
	p7Pkgkodn1QxspR5n46XX/VqoIuG2Zmq6oOzPE+u+aFYqTeakfuIcyRW8ncyOHQ8oJroRJNEHntEv
	AKPqRHKhySNqmB/MNbyU8hrOmXh+L50gAsse8bXDzCOcHy//FWaesY0x81ofKcolYPsL6unI1hIeJ
	nBcobzW+bWWTugH7E3LoI4BO7mpJVLQeYW/lEKbCSH6ofIPTXFO0gUEsCCMroBAQ9oqcMm9/DPrYk
	oqmr78Y7ypjug9zA2X7JnbGuPW+MOvg5cLYJ//ny7XTFYRgBXoJMev+IdXvEV0UBhunPZL4g6ysEd
	EeXz+d+w==;
Received: from lan.nucleusys.com ([92.247.61.126]:37698 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oiC3x-0001Wm-R4;
	Tue, 11 Oct 2022 13:00:18 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-sentry-sdk: Upgrade 1.5.12 -> 1.9.10
Date: Tue, 11 Oct 2022 13:00:04 +0300
Message-Id: <20221011100004.409112-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
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
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Oct 2022 10:00:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99137

Upgrade to release 1.9.10:

- Added newer Celery versions to test suite
- Django 4.x support
- Cancel old CI runs when new one is started.
- Increase max string size for desc
- Pin Sanic version for CI
- Fix for partial signals in old Django and old Python versions.
- Convert profile output to the sample format
- Dynamically adjust profiler sleep time

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ry-sdk_1.5.12.bb => python3-sentry-sdk_1.9.10.bb} | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.5.12.bb => python3-sentry-sdk_1.9.10.bb} (57%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.12.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.9.10.bb
similarity index 57%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.12.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.9.10.bb
index 36e48f97a..c09a01b2a 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.12.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.9.10.bb
@@ -5,9 +5,17 @@ HOMEPAGE = "https://github.com/getsentry/sentry-python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
 
-RDEPENDS:${PN} += "python3-urllib3"
+RDEPENDS:${PN} += "\
+	${PYTHON_PN}-urllib3 \
+	${PYTHON_PN}-core \
+	${PYTHON_PN}-json \
+	${PYTHON_PN}-logging \
+	${PYTHON_PN}-threading \
+	${PYTHON_PN}-compression \
+	${PYTHON_PN}-datetime \
+"
 
-SRC_URI[sha256sum] = "259535ba66933eacf85ab46524188c84dcb4c39f40348455ce15e2c0aca68863"
+SRC_URI[sha256sum] = "4fbace9a763285b608c06f01a807b51acb35f6059da6a01236654e08b0ee81ff"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.30.2


