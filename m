Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DE83ECAAD5
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 09:50:10 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.3387.1662630607743266996
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Sep 2022 02:50:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=LEiVFa3e;
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
	bh=0mKqt7oS3lCXKPt5Jzi5Abo6HPw8GVG1QgLpNCHUlyE=; b=LEiVFa3eVBDZW/POtqKF72Ltze
	EBbPIGP/kW1TDazRw7fNeKzhxZDfpGjDrE0jvwGL9b5mrvRwouUzjp5i59NPLeeCYX/OY0RbtpQs5
	qiphbulnFu4grV/azdOv1XUHAb45+EAQaarsKkRrXTwJ8A98EiAqs/aTZStti+14Vr+G8umAOaUI2
	nlDljtGl2Dv74nF3twuZb8P4DvVp5pdRLBHnPnrr1wGFn5xFJiba4NhqJgWPRV837lyFGbi+xACOq
	ybmiZkHeRDDgBPXJD90e/V2hSXRkkDV3n/Kr3uFd1NaNY7yPYTEGKIZF+FraNbzdmLEuDinV2wc6H
	GfnkGa/w==;
Received: from lan.nucleusys.com ([92.247.61.126]:39282 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oWEB1-000B0Z-KP;
	Thu, 08 Sep 2022 12:50:05 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-haversine: Upgrade 2.6.0 -> 2.7.0
Date: Thu,  8 Sep 2022 12:49:49 +0300
Message-Id: <20220908094951.594032-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Sep 2022 09:50:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98717

Upgrade to release 2.7.0:

- Official support of python 3.10, 3.11 and 3.12

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-haversine_2.6.0.bb => python3-haversine_2.7.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-haversine_2.6.0.bb => python3-haversine_2.7.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-haversine_2.6.0.bb b/meta-python/recipes-devtools/python/python3-haversine_2.7.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-haversine_2.6.0.bb
rename to meta-python/recipes-devtools/python/python3-haversine_2.7.0.bb
index 65779187a..bfe36b0b8 100644
--- a/meta-python/recipes-devtools/python/python3-haversine_2.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-haversine_2.7.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Calculate the distance between 2 points on Earth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-SRC_URI[sha256sum] = "eb7c308ba721e86662c1d50427cb9b06f9e7eb9984803d9ec200582425cc4fb7"
+SRC_URI[sha256sum] = "9dd62c95bff9c43eb898604625e80db68b8b9e91a5111338f55ebcf470dd5a3d"
 
 inherit pypi setuptools3
 
-- 
2.30.2


