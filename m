Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 391D0C4332F
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 13:06:39 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web09.20168.1665579994019695750
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Oct 2022 06:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=k2hHxE1v;
 spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=UH/bMZj/NeuAFb2WzckIUMlht1/KZT84rRwmpw5v7XI=; b=k2hHxE1v/pL/m1vt5xn8OsnUHN
	72DJdgL82Za8cf1IFhcmWgVJ71UO4vrtcfBTta3Z5dbE2stcsjeQkvhUOkmW9knr3I7cscK4oiaCN
	oLwvUkZWG7Y0Zn3oNaZKnjZvNdywea8snZAgcjMjGUB82Lyuxgf89OF+VButPhIMG/si9NpPEVKr2
	9UQbQK1FeB3BEwd4N6dA8eYA/m4C+TNLyk19eiGsWu7v4qz7pWghUUhfFKa5kOqwyRaHxBqq2S06a
	eLdUaQFLNQY7ML1pF4GK1Puaiyy7fGm9EGSsQEuVhNggYEdqsIzPDjmk0IXPujg91SAxE3urhfsmQ
	ZLIn2jGg==;
Received: from lan.nucleusys.com ([92.247.61.126]:48086 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oibRO-0002Bt-7v;
	Wed, 12 Oct 2022 16:06:32 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-greenlet: Upgrade 1.1.3 -> 1.1.3.post0
Date: Wed, 12 Oct 2022 16:06:23 +0300
Message-Id: <20221012130624.1336826-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Oct 2022 13:06:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99144

Upgrade to release 1.1.3.post0:

- Add musllinux (Alpine) binary wheels.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-greenlet_1.1.3.bb => python3-greenlet_1.1.3.post0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-greenlet_1.1.3.bb => python3-greenlet_1.1.3.post0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_1.1.3.bb b/meta-python/recipes-devtools/python/python3-greenlet_1.1.3.post0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-greenlet_1.1.3.bb
rename to meta-python/recipes-devtools/python/python3-greenlet_1.1.3.post0.bb
index 5175212a7..342227c3f 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_1.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_1.1.3.post0.bb
@@ -4,6 +4,6 @@ LICENSE = "MIT & PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI[sha256sum] = "bcb6c6dd1d6be6d38d6db283747d07fda089ff8c559a835236560a4410340455"
+SRC_URI[sha256sum] = "f5e09dc5c6e1796969fd4b775ea1417d70e49a5df29aaa8e5d10675d9e11872c"
 
 inherit pypi setuptools3
-- 
2.30.2


