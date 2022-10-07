Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E6DC433FE
	for <webhook@archiver.kernel.org>; Fri,  7 Oct 2022 09:47:13 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.2622.1665136026531625900
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Oct 2022 02:47:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=nXqmB03j;
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
	bh=tOTQErW3sr+SZOfnRC8XVLVEZp9vR9l4fAjcJuTrCHc=; b=nXqmB03jku4+GV/JeIuADX6d/d
	eWNyEne/zLmY79u6sW/23pHmX7BsHZ/XYmXhD91gxTrLJErbPDd8KfydFB498JEZNudnZASTGcdxe
	yrmNfFHq5rwoZ4x49fUFY32adX/yPdUJrYhlsjq0o1CKtDDXtHVFUIn+X7MZe5YZYJOMXwURf9qJk
	aVJB002ZS8g0u8U50XKJkkHZGuMNl9G8pWm1WyiWN0TjiRi9BdfMFGeuQbnxpJ5dOqYvXVia3wpyd
	Y9dXmiacUUQBONQY5kYyZZpN84B37iS9hcCLAxkCXb3z2zW7JF1I1KutmHypatGofG2IJZBkeLzuX
	pI/Tbc5w==;
Received: from lan.nucleusys.com ([92.247.61.126]:59576 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1ogjwg-0008m2-L5;
	Fri, 07 Oct 2022 12:47:04 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-imageio: Upgrade 2.22.0 -> 2.22.1
Date: Fri,  7 Oct 2022 12:46:49 +0300
Message-Id: <20221007094649.3896430-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221007094649.3896430-1-leon.anavi@konsulko.com>
References: <20221007094649.3896430-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Oct 2022 09:47:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99086

Upgrade to release 2.22.1:

- Raise ImportError when iio-ffmpeg is missing
- EXR spec
- Remove stale funding platform

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-imageio_2.22.0.bb => python3-imageio_2.22.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.22.0.bb => python3-imageio_2.22.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.22.0.bb b/meta-python/recipes-devtools/python/python3-imageio_2.22.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.22.0.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.22.1.bb
index 6bc7b60f9..9e187bb13 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.22.0.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.22.1.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "a332d127ec387b2d3dca967fd065a90f1c1a4ba2343570b03fe2cebb6ed064ea"
+SRC_URI[sha256sum] = "465ec35f919d538906d3023b61ccec766d8e7575fe55fcbd7669ece55afb97ca"
 
 inherit pypi setuptools3
 
-- 
2.30.2


