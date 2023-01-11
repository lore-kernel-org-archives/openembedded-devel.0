Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A545C46467
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 12:29:30 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.22446.1673440165356271194
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Jan 2023 04:29:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=XPtsOo8s;
 spf=softfail (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=vpuOBUebgbAV3VunpVqV9D2Nu+xwcyuEk7emNfChTJk=; b=XPtsOo8scOgoZzwgzkJGl7zO82
	mDMVq7aDjnc+O+bp8UqzqvJ0ENpmnRl8S9BO35/Uo+9/0l6XQk0PRKVJYpFR+jadAdoUflsvVUUxe
	yQqDYURWSVJhOyAY9+3Zvr0AKFx0c2+wjMJ9pi1d8IqtULtgEjN4VFHNay9BE7lCaFhudIYb4fxnH
	+sX+RS3hi5kKMR9FXj1G1pUl/9TmdPPetlbnejjjUCWGfmCuX68v0b/VlPsJ3OyJjcXsBD43zVspJ
	1oKxSXe/q+vU4SY4vygPzLC5yXqPjF2LYDAIutcN/Uy+/oKqp4UQYMbn+RYjgMThwGgvkt/5M38n4
	hf/7uQbQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:42038 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1pFaEQ-00033h-Vu;
	Wed, 11 Jan 2023 14:29:24 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-imageio: Upgrade 2.23.0 -> 2.24.0
Date: Wed, 11 Jan 2023 14:29:13 +0200
Message-Id: <20230111122914.1175681-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 12:29:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100546

Upgrade to release 2.24.0:

- Tifffile v3
- Pin sphinx below v6

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-imageio_2.23.0.bb => python3-imageio_2.24.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.23.0.bb => python3-imageio_2.24.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.23.0.bb b/meta-python/recipes-devtools/python/python3-imageio_2.24.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.23.0.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.24.0.bb
index 99579398b..4ea45c9fd 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.23.0.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.24.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "cb635709765e527c94890b4fbb6870e59213fe182a1c8086d167eb3626073cbd"
+SRC_URI[sha256sum] = "f240f8229f4f329a1546281194b52da5d6694141a524668fed3f81b0d07782fa"
 
 inherit pypi setuptools3
 
-- 
2.30.2


