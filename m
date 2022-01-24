Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F4E6C433EF
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 15:16:04 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.4896.1643037362005825573
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jan 2022 07:16:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=YS/d5FOy;
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
	bh=fbjeWAAsWuDxCeyNQrz+37K+6yhMMlHB6DPCYYJIJBE=; b=YS/d5FOySjJRVSzl72OVN5I3Pq
	K8rl0aFNzAVdISQgL3e5fDpLKBD3DvXk4VZIzd3hhGn11bElZkuhspC3Xi3RfH7eYw8kLhN/n+A6Y
	C9MSJWhM5CfrDgDEFNirC6veceVSG0B17VeKXfL/RezHHDFIsOKu08LPNJ4xI/5VAnt/Tsf/IKgZP
	XyIPjTeDLA/f9a1thTJfuj9Way4CC03Grd/vtx3pyUibsPZBuUNpnd0QUv3AvdK7Wii183MaQMxR+
	hcQZkGuQNz0y0EHY2YfgwQM9Wr/tFVhW3tdQbBREYzv92sWN3SAD+BgjiUEuAEur9ZslEmAuG58sx
	MnZf7MJw==;
Received: from lan.nucleusys.com ([92.247.61.126]:54618 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nC14r-0009G6-JM; Mon, 24 Jan 2022 17:16:01 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-aenum: Upgrade 3.1.6 -> 3.1.8
Date: Mon, 24 Jan 2022 17:15:43 +0200
Message-Id: <20220124151544.876177-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220124151544.876177-1-leon.anavi@konsulko.com>
References: <20220124151544.876177-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Jan 2022 15:16:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95037

Upgrade to release 3.1.8.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-aenum_3.1.6.bb => python3-aenum_3.1.8.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aenum_3.1.6.bb => python3-aenum_3.1.8.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-aenum_3.1.6.bb b/meta-python/recipes-devtools/python/python3-aenum_3.1.8.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-aenum_3.1.6.bb
rename to meta-python/recipes-devtools/python/python3-aenum_3.1.8.bb
index 1d9bd32fb..86217c5fc 100644
--- a/meta-python/recipes-devtools/python/python3-aenum_3.1.6.bb
+++ b/meta-python/recipes-devtools/python/python3-aenum_3.1.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/aenum/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://aenum/LICENSE;md5=c6a85477543f8b8591b9c1f82abebbe9"
 
-SRC_URI[sha256sum] = "3ba2c25dd03fbf3992353595be18152e2fb6042f47b526ea66cd5838bb9f1fb6"
+SRC_URI[sha256sum] = "8dbe15f446eb8264b788dfeca163fb0a043d408d212152397dc11377b851e4ae"
 
 inherit pypi setuptools3
 
-- 
2.30.2


