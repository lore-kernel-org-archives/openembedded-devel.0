Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A7C9C07E9D
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 13:03:04 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.10786.1664283780399391175
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 06:03:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=rodkQjz5;
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
	bh=/XCDHscSauD0d05BmuWmU96d+I7llXIq6peJ0nqWCV0=; b=rodkQjz55VSQokDaF5YbQsu0M0
	0+33leRlf3XKhShQrBzRVVwaHr5ARTGOOt21rf5QAzDYqcfrTVZbwcNGAZG5oxGzFItdGGxsoFPY2
	WZvsWNNcqY7dT67aRJ2MbYnwC/JCbjVMVShn0/pt8D4v8OJjKa+gFM2vxcxL1qN/VvpE95iJFouBw
	KXC6BESQ05kuFHgFyfzJr6o53VRBIqm5oyIzL7WHVa7KF2h2eYcotQAy+SxDQOoUR5jyhW6v8wY7+
	zt34Yw+/tKJan/xVr/vXLvc3/F3P0FZRaE0X0rfWq5DBwK6abTip+Rg84xflFta20kH2J9Qbhe9Fx
	0/9u+JxQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:39898 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1odAFf-0003Fp-C0;
	Tue, 27 Sep 2022 16:02:59 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-pytz-deprecation-shim: Runtime
 dependencies
Date: Tue, 27 Sep 2022 16:02:49 +0300
Message-Id: <20220927130250.2221578-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Sep 2022 13:03:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98991

Add zoneinfo as a runtime dependency.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-pytz-deprecation-shim_0.1.0.post0.bb       | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pytz-deprecation-shim_0.1.0.post0.bb b/meta-python/recipes-devtools/python/python3-pytz-deprecation-shim_0.1.0.post0.bb
index d116c3bd4..022cf39ac 100644
--- a/meta-python/recipes-devtools/python/python3-pytz-deprecation-shim_0.1.0.post0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytz-deprecation-shim_0.1.0.post0.bb
@@ -9,3 +9,7 @@ PYPI_PACKAGE = "pytz_deprecation_shim"
 PYPI_SRC_URI = "https://files.pythonhosted.org/packages/94/f0/909f94fea74759654390a3e1a9e4e185b6cd9aa810e533e3586f39da3097/${PYPI_PACKAGE}-${PV}.tar.gz"
 
 inherit pypi python_setuptools_build_meta
+
+RDEPENDS:${PN} += "\
+        ${PYTHON_PN}-zoneinfo \
+"
-- 
2.30.2


