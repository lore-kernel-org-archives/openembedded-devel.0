Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A28ADC53210
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 10:27:30 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.9803.1672914446346167856
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Jan 2023 02:27:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=avyzJtdF;
 spf=softfail (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=1WBQN+9vTow2vDSy3sEItzkmYn56Ox0R5DtQL+JCqu0=; b=avyzJtdFqU1aqnGbne9P1NChxi
	EveU3tw6KsKcSV/yudwi3WESku/WZi8XbYNJCX0uTWWpTm+QNSRxBGyC2A7+0gfT1RX34mKQ7toJa
	4o4eUIyCJ4ftjr5G+OYDQbMD9RPWkkB7mxVbsIZx7bTS15C+IKjH2dY58kJEmdO0yooZ/oya+hIxk
	VF+poQud12a06Pvr+ZPifK6kc4+oHn4/1jULapP+phLdyTUs1m7FHBQazSASWmfUiraOqWMt0b2GG
	+FdK0o6MpBueNcRF5yQr3VA6sMrrLJODdS4ba/rWzHCPtwET0pDimer5zjNpANbDJ+IDyybFxWOs7
	4nuWIv3g==;
Received: from lan.nucleusys.com ([92.247.61.126]:57110 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1pDNTo-000BqI-J0;
	Thu, 05 Jan 2023 12:27:24 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-cantools: Upgrade 37.2.0 -> 38.0.0
Date: Thu,  5 Jan 2023 12:27:10 +0200
Message-Id: <20230105102710.166099-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230105102710.166099-1-leon.anavi@konsulko.com>
References: <20230105102710.166099-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Jan 2023 10:27:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100412

Upgrade to release 38.0.0:

- Major bump due to minimum required Python version being raised
  to 3.8
- do no longer use the ncurses module in the dump subparser
- Fix 'Assertation' NameError typo in test_database
- Add missing crccheck dependency to setup.py
- Bugfix in handling more than one node mapped attribute per signal
- A few bug fixes
- Typing improvements
- Use tox
- Fix CI
- Ensure that only Decimal types are stored in the Signal.decimal
  attribute
- cantools library import lib from a relative path (unified)
- Test on python 3.11, build docs again

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-cantools_37.2.0.bb => python3-cantools_38.0.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_37.2.0.bb => python3-cantools_38.0.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_37.2.0.bb b/meta-python/recipes-devtools/python/python3-cantools_38.0.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-cantools_37.2.0.bb
rename to meta-python/recipes-devtools/python/python3-cantools_38.0.0.bb
index 7d159340c..96e193d4f 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_37.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_38.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "bbb0e802af02a1dc792c32d10b61b51deaefc1c8e9c776b50d2d2e194b702fac"
+SRC_URI[sha256sum] = "b7d5465aba357ce4c103a7d38c9e01a6f12d8265090b4147b3cc1fa4c3adb993"
 
 PYPI_PACKAGE = "cantools"
 
-- 
2.30.2


