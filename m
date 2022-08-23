Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FE70C3F6B0
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 11:02:21 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.30624.1661252534836102957
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 04:02:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=vZ7ObF33;
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
	bh=AKIyIEaAPGof6f3BAMZu5SMeipGlUOAPyQWRQv12niI=; b=vZ7ObF33sxywjdxyrp3oSwmeUg
	BFrWQCa3+5WAN5weQxgGib4Ej6CbVWyslB+qaEIQQ6vA9r/VTzlD+2eP4j2kHX3G01O35R9+G8Vgb
	1iCTEz1yRVlqNgoDW+ttaUY7W+CgjN4zPh9Er9aqfokF7+99ePneJARi/i4op9nbZ+JLip6QiUdsD
	AS/lChIQqS5ZM/QPPTsS6sWTOCTN8MSCB6gUNJSgW+rFqVQomZOI9T4NYSft/DLxeUpfKhwSiVNHO
	z+BJ98/o6fOEy7CtxzKl6aXu7V3KG8UnhLyAVqeZZ0dheq/nGDpeOs901yV9GCFEJBWLr8SSjdPeR
	xFqO6NTQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:60034 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oQRfi-0000ni-W9;
	Tue, 23 Aug 2022 14:02:12 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/4] python3-awesomeversion: Upgrade 22.6.0 ->
 22.8.0
Date: Tue, 23 Aug 2022 14:02:01 +0300
Message-Id: <20220823110204.2685251-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Aug 2022 11:02:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98388

Upgrade to release 22.8.0:

- Change devcontainer
- Do not allow find_first_match without ensure_strategy
- Warn instead of raise for missing ensure_strategy
- Correct spelling mistakes
- Handle KeyError
- _compare_versions takes AwesomeVersion not str

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...wesomeversion_22.6.0.bb => python3-awesomeversion_22.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-awesomeversion_22.6.0.bb => python3-awesomeversion_22.8.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-awesomeversion_22.6.0.bb b/meta-python/recipes-devtools/python/python3-awesomeversion_22.8.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-awesomeversion_22.6.0.bb
rename to meta-python/recipes-devtools/python/python3-awesomeversion_22.8.0.bb
index cadb6f502..550a8c439 100644
--- a/meta-python/recipes-devtools/python/python3-awesomeversion_22.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-awesomeversion_22.8.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE.md;md5=92622b5a8e216099be741d78328bae5d"
 
-SRC_URI[sha256sum] = "38f580bfacf1c06b674bcd0f68e0c445ebb03fcd3700c6a2c588fb9313308e0f"
+SRC_URI[sha256sum] = "0469a801faafb3a7a13c529edc977ea04c3bce825af9ebb602f58012bc487db5"
 
 RDEPENDS:${PN} += "python3-profile python3-logging"
 
-- 
2.30.2


