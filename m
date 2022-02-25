Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9419C4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 13:23:41 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.6277.1645795419629498254
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 05:23:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=X35TcidZ;
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
	bh=9eUFC25dbgeYp+KNj5Yfsu6dILb0f147cV15VNNb97E=; b=X35TcidZ4E88z/GbVyiPOJRJE+
	NpdVKiQbWrg9omW8+zOh1eIjZS13mfENBOTz3jOhk3Dj1OJgqnOtHbjTy36tqdERYnAloDUnt4wrg
	gyCGz9lbleTAnZtjPByVJrpqasSSzTTyE7tdvfqRqv7lvyaPpMl2JGru41b3lT3Gi6A6Xwu9Zfq+x
	Mv3ov0IR2bRhG8xc4xBjCkjoseluvtjvczJdWYzD3aTyhP8x4S/K1emsNNFHi2jwaHj0S3w5rc/z2
	QIPUxp3/ydp2I8Y2Zhv6762mptIQyHIJgd+tlZ+4AOfldn8cjL4Waa3E4dTwXiLxCKJ2+yNieLZtH
	NaD/7UEw==;
Received: from lan.nucleusys.com ([92.247.61.126]:56822 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nNac0-0009rs-MP; Fri, 25 Feb 2022 15:23:39 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-transitions: Upgrade 0.8.10 ->
 0.8.11
Date: Fri, 25 Feb 2022 15:23:27 +0200
Message-Id: <20220225132328.2469153-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225132328.2469153-1-leon.anavi@konsulko.com>
References: <20220225132328.2469153-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Feb 2022 13:23:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95520

Upgrade to release 0.8.11:

- Rewrote an async test and replaced setDaemon with daemon property
  assignment for thread handling

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-transitions_0.8.10.bb => python3-transitions_0.8.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-transitions_0.8.10.bb => python3-transitions_0.8.11.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-transitions_0.8.10.bb b/meta-python/recipes-devtools/python/python3-transitions_0.8.11.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-transitions_0.8.10.bb
rename to meta-python/recipes-devtools/python/python3-transitions_0.8.11.bb
index 46292987b..14189424a 100644
--- a/meta-python/recipes-devtools/python/python3-transitions_0.8.10.bb
+++ b/meta-python/recipes-devtools/python/python3-transitions_0.8.11.bb
@@ -4,6 +4,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=baac7be1f4c17620df74188e23da6d47"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "b0385975a842e885c1a55c719d2f90164471665794d39d51f9eb3f11e1d9c8ac"
+SRC_URI[sha256sum] = "7b20d32906ea4d60ee6f6c1f5dc9c9f178802425c5b155213eb0f25c277f04e4"
 
 RDEPENDS:${PN} += "python3-six python3-logging"
-- 
2.30.2


