Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1710C433F5
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 10:27:57 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.7172.1637317675480962852
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Nov 2021 02:27:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=G9l4AZal;
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
	bh=z37pnl8bOSNKNhJUKiGr8PcjsctpAHqdQ4kqft2sX2U=; b=G9l4AZalRHdj1xUeLmveWfJckc
	qDzcY+yDeH7iMv5iWlo4jr49XfkTO/cwRuWU57FvzMRCzvec2xZOTu5Nd2bW+OVAobTf/tDOEtPWY
	an9uRGUIyO14A+Lwl8Af8/b3mJXGXCnSE2DZJBQsn24YfMe5zhOcuVItS0mFUx0QNWQ3jpaG4RlDP
	LMksO3UoomMmbiKxY99ZTxZdQsTXqRBZTCargkOpb1xFEsJkVuWhbt1yAVrm1uNEqPyaYt5hQS0ta
	5sI77i2mHzOpBMs2qKCA7Yfz/EF0JwiwtBS51Fytz5twFfKPAigKuVV11HAcmBBjUGTr4/owLFqA3
	kXYmiyjg==;
Received: from lan.nucleusys.com ([92.247.61.126]:34090
 helo=lootbox.konsulko.bg)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mnzFP-0008o5-JA; Fri, 19 Nov 2021 12:27:47 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-prompt-toolkit: Upgrade 3.0.21 ->
 3.0.22
Date: Fri, 19 Nov 2021 12:27:36 +0200
Message-Id: <20211119102740.2676-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OutGoing-Spam-Status: No, score=-0.5
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
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Nov 2021 10:27:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94058

Upgrade to release 3.0.22:

- Fix stopping of telnet server (capture cancellation exception).

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...rompt-toolkit_3.0.21.bb => python3-prompt-toolkit_3.0.22.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.21.bb => python3-prompt-toolkit_3.0.22.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.21.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.22.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.21.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.22.bb
index e0d379d03..e8cc87697 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.21.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.22.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://python-prompt-toolkit.readthedocs.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
 
-SRC_URI[sha256sum] = "27f13ff4e4850fe8f860b77414c7880f67c6158076a7b099062cc8570f1562e5"
+SRC_URI[sha256sum] = "449f333dd120bd01f5d296a8ce1452114ba3a71fae7288d2f0ae2c918764fa72"
 
 inherit pypi setuptools3
 
-- 
2.20.1


