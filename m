Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B0A2C433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 16:32:08 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.34318.1641832325375694032
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jan 2022 08:32:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=R6YHznFe;
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
	bh=1SyxCCiIy7+FRiSwuOpclS5vFNK6pfAEyHjwGK+YSWY=; b=R6YHznFeYANLZNKRgo4inHGzth
	sD5Je++n0a5LQiboFr2SqodFqpq8XTM4IKT1UqwfNXjlUXC6bs2S2q9ZhbbX6PDRvTGCgCxhVCg21
	3yIllxlzuJk9dJjxi2tFECbov9vY+C9hMpplFqrLeUfAPi4ahddQgjXlzStTH+Zm9s90uOf/1MFwL
	WeRYZ3hbBe56zfbCs2DfmO5Jn3Jn4YCyK1HZuIHWLqETHkWlrwfZaCnwRzfh5XerYiLhBPoIb8WAW
	w7GWr7SFe25ZUVgHWrBQxL+03vk1UfNet4ZC4ylRyUEyI/NlwK44rPvgQaTZzXfdiXfsApiBUWcXS
	ReVldtVg==;
Received: from lan.nucleusys.com ([92.247.61.126]:51272 helo=lootbox.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1n6xcH-0009ij-HW; Mon, 10 Jan 2022 18:32:05 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-huey: Upgrade 2.4.2 -> 2.4.3
Date: Mon, 10 Jan 2022 18:31:46 +0200
Message-Id: <20220110163146.40024-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220110163146.40024-1-leon.anavi@konsulko.com>
References: <20220110163146.40024-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jan 2022 16:32:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94720

Upgrade to release 2.4.3:

- Fix compatibility issue with new redis-py

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-huey_2.4.2.bb => python3-huey_2.4.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-huey_2.4.2.bb => python3-huey_2.4.3.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-huey_2.4.2.bb b/meta-python/recipes-devtools/python/python3-huey_2.4.3.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-huey_2.4.2.bb
rename to meta-python/recipes-devtools/python/python3-huey_2.4.3.bb
index 865e9ff77..f8f4062a6 100644
--- a/meta-python/recipes-devtools/python/python3-huey_2.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-huey_2.4.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4"
 
 PYPI_PACKAGE = "huey"
 
-SRC_URI[sha256sum] = "20683288e27e851f786b38465784c5d0e7e2b93b8791cc826898f9555a320cb4"
+SRC_URI[sha256sum] = "4fa2f6055d581778c3bcf93fc8c9ce87aecc2a345d5ff35bd955da152c02ef37"
 
 RDEPENDS:${PN} += " \
 	python3-datetime \
-- 
2.30.2


