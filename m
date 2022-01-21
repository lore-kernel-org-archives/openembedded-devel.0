Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA83C433F5
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 13:05:49 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.11638.1642770346733223440
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 05:05:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=qJDmktC5;
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
	bh=J2rdiyWP4ZaHDCI9xc149l14WVJktQQShvNS/k5Usz0=; b=qJDmktC5MODLKuo8rav+PbQNfq
	i/DD9MxogQiFHxN+K0zGwyiaK7mcT0dE6rSW+jmzNfQ8gd+X2UoU1EqWPa5SY//fgiwtFWC+aR4/o
	BPXNeDLoh8kd/H6QkhvOsaQUASQ0shVOU8hkOVHiHBWBCjOmOSVNgPtHs/la9+Bx8TzzAiT+dwZpW
	qQlEFoLzvAk8bDGovON2r/T69ZuNxrM3vqDMNYUE9fcUpglA4ERn9DSWRjcPMLvIJGz7F6nJI2nK8
	Zn5iXfu2QMJ0dO8MWnNFOZV/98C47V9WfB79IDxDCXj9V76mCrVro22XI+lgErMjzX1KTOBptkb6U
	Xf5Y0W6Q==;
Received: from lan.nucleusys.com ([92.247.61.126]:50940 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nAtbv-0003GN-P4; Fri, 21 Jan 2022 15:05:45 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] imageio: Upgrade 2.13.5 -> 2.14.0
Date: Fri, 21 Jan 2022 15:05:30 +0200
Message-Id: <20220121130533.3973579-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220121130533.3973579-1-leon.anavi@konsulko.com>
References: <20220121130533.3973579-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jan 2022 13:05:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94967

Upgrade to release 2.14.0:

- Handle pillow9 GIFs
- Allow mode=None when writing with pillow
- Add repo to PYTHONPATH in should_release?
- Reorganize commit tags
- Reduce release frequency to weekly

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-imageio_2.13.5.bb => python3-imageio_2.14.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.13.5.bb => python3-imageio_2.14.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.13.5.bb b/meta-python/recipes-devtools/python/python3-imageio_2.14.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.13.5.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.14.0.bb
index 72d10f70f..f0ac37026 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.14.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7b9bbbb543b6af3e6b53f9b7fb68f71d"
 
-SRC_URI[sha256sum] = "c7ec2be58e401b6eaa838f8eaf8368ed54b2de4a1b001fe6551644f1a30a843d"
+SRC_URI[sha256sum] = "1a612b46c24805115701ed7c4e1f2d7feb53bb615d52bfef9713a6836e997bb1"
 
 inherit pypi setuptools3
 
-- 
2.30.2


