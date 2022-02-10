Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 811B9C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 11:35:07 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web08.8857.1644492905097886596
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Feb 2022 03:35:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=azKULLq0;
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
	bh=m08FhOTK19Lqg88mV3sd67OOkkhH+zkTKa52uStEqsM=; b=azKULLq0JbrYwsokkQiOH3YdHF
	qBX2shkiYtg249NY/8vrNHFOVQIpMR/4NtesS41ThmtMj597vkzlCEJF7WwCzsWEBvuPElWjaH8N4
	EYYZ6oDtgI9FYlK7KTiw1IRUiUBGX7+mp66kcF9v3nk/CZ3Tb2KhvSNj2fMFWKtYYQaXD2bJGPw6G
	HgaP/8Y2lkdwrpWxYnhyFJ2TDraTPvzFw1uGLvQq/+tDj2WTJGWHSa//U2QVjcqtahWldbkOLT+je
	yGZg8zpcI4f5aw8TqJaOsZUYnqnM0GxRmIOPZmNnhUMBCsuP7QQBSzEoLzLrs4yxM2lEWjHh83IX2
	VzTS0peQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:42712 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nI7ka-000CVK-CL; Thu, 10 Feb 2022 13:35:03 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-imageio: Upgrade 2.14.1 -> 2.15.0
Date: Thu, 10 Feb 2022 13:34:52 +0200
Message-Id: <20220210113454.2022446-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
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
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Feb 2022 11:35:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95284

Upgrade to release 2.15.0:

- Fix webcam FPS settings on MacOS
- Add format_hint to v3 API
- Make tifffile read resolution metadata
- Make RTD fail on warnings during CI
- Remove link to download tracker
- Type annotations for pillow
- Contribution guidelines
- Deprecate python 3.6 support

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-imageio_2.14.1.bb => python3-imageio_2.15.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.14.1.bb => python3-imageio_2.15.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.14.1.bb b/meta-python/recipes-devtools/python/python3-imageio_2.15.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.14.1.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.15.0.bb
index 736a18262..e3462ee44 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.15.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7b9bbbb543b6af3e6b53f9b7fb68f71d"
 
-SRC_URI[sha256sum] = "709c18f800981e4286abe4bd86b6c9b5bb6e285b6b933b5ba0962ef8e7994058"
+SRC_URI[sha256sum] = "d0d7abb4e5c4044c06fc573233489c4a25582698f93ca94f7bd70b6f4ab172ec"
 
 inherit pypi setuptools3
 
-- 
2.30.2


