Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E98FC433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 20:56:21 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.14716.1641502579138818337
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jan 2022 12:56:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=D3SYARHW;
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
	bh=3t+5WL3EfrWpfCWKBAanZUxe7ie1z4bXbrhKP4/dd7Y=; b=D3SYARHWzKWYhwtYAcAYFKFBnF
	rnC9mwOKe6nHOUV2ENkfyeXj/Nu/7WBVym1loMAulPwpLI6unbcAhrxkjYlagN0hUgF9NCC+ARdmI
	76TnuBf2imYYVeU0i7jz+OLRpArSukAXBEBOwJz3Q9ZAs66z3XzD9sDphWR3wvGYaXPIFjVmrMTCa
	WfZDrt3Ag8fsFAMk8/7Hq22OU/12VM4tilXZTSyVR9CkGr8/ebwyhe0hbtZbq3kTu3B5UcB3k00Ba
	ak2DolilFW/7AmBAm4RHI9pD3qU4n6rk2GHUkkahhuqdk7SXxM2+mOuonCTdhrUi5ceDT2ATujE02
	WroXX7hA==;
Received: from lan.nucleusys.com ([92.247.61.126]:44748 helo=lootbox.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1n5ZpU-000AYs-Bg; Thu, 06 Jan 2022 22:56:18 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/4] python3-imageio: Upgrade 2.13.3 -> 2.13.5
Date: Thu,  6 Jan 2022 22:56:00 +0200
Message-Id: <20220106205600.3147781-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220106205600.3147781-1-leon.anavi@konsulko.com>
References: <20220106205600.3147781-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jan 2022 20:56:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94675

Upgrade to release 2.13.5:

- Clean up PillowPlugin destructor
- Close standard streams after webcam access

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-imageio_2.13.3.bb => python3-imageio_2.13.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.13.3.bb => python3-imageio_2.13.5.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.13.3.bb b/meta-python/recipes-devtools/python/python3-imageio_2.13.5.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.13.3.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.13.5.bb
index 38aa5f181..72d10f70f 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.13.3.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.13.5.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7b9bbbb543b6af3e6b53f9b7fb68f71d"
 
-SRC_URI[sha256sum] = "bb87b272e1e9b05d242e11f8d88d030aefa68ca95daf3accc986d0b782ae3cd5"
+SRC_URI[sha256sum] = "c7ec2be58e401b6eaa838f8eaf8368ed54b2de4a1b001fe6551644f1a30a843d"
 
 inherit pypi setuptools3
 
-- 
2.30.2


