Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D526BC4332F
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 10:52:52 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web08.39417.1666003961813952118
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Oct 2022 03:52:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=bW2dl329;
 spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=8bYRU635lUfI8y9tfXPgkxbK32XWn8e9fY+khjsYTCc=; b=bW2dl329KKUA2SrHKQQOfl9URS
	bgqmu5jH3cXWaEc+whoGs44opnUGKDqWJv51NJASqMU5fyjhm5mVImBY7VxrBb65to+iM0EO4ZPwk
	Hp5Esy5dGz39Q4T9Tbo6O2at00NLxYWE5ZUQubvljHyH0cibDPTMyUMt7VtYlww8KiYHItVd6wsDw
	fXiIzUA0u7ec/98TLU8BJ3xQErQjpnLfxEQ+fxYzObq8W0Jf1L2rUciWqYFNqMXZNC1Q4+GyXRqS/
	FpC36JCF/7/kNUV2TbCGZXhrNhcI1GLzUS0NFaT82UdShQb2+CPdQ7mXcONxm4AqzNm2WqQYnJDPD
	JBChy16Q==;
Received: from lan.nucleusys.com ([92.247.61.126]:55420 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1okNjv-00021z-CS;
	Mon, 17 Oct 2022 13:52:39 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-imageio: Upgrade 2.22.1 -> 2.22.2
Date: Mon, 17 Oct 2022 13:52:25 +0300
Message-Id: <20221017105226.3623929-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Oct 2022 10:52:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99191

Upgrade to release 2.22.2:

- Make legacy FormatManager skip uninstalled plugins
- Remove unneeded image_mode references
- Remove xcode reference (dead link)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-imageio_2.22.1.bb => python3-imageio_2.22.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.22.1.bb => python3-imageio_2.22.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.22.1.bb b/meta-python/recipes-devtools/python/python3-imageio_2.22.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.22.1.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.22.2.bb
index 9e187bb13..272ec4b61 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.22.1.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.22.2.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "465ec35f919d538906d3023b61ccec766d8e7575fe55fcbd7669ece55afb97ca"
+SRC_URI[sha256sum] = "db7010cd10712518819a4187baf61b05988361ea20c23e829918727b27acb977"
 
 inherit pypi setuptools3
 
-- 
2.30.2


