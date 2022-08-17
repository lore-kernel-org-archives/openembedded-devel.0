Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D20A7C25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 15:36:05 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.30126.1660750555293803764
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=Nj1lIQiC;
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
	bh=xkB3voTCEWUBZTYCFpALXxtF2rmtkizN33i76ZFa1FE=; b=Nj1lIQiCl/KqgAk+sf6kVUUi/N
	Z8iLbJMaZSotEG0dAxnHjstq9HAYG7oC086FGQ3QTDRjljnL43u7FGiOrOykFE3/BZubi2j0f3vkv
	rqzUIWax5z2po4SwhM9LkITlj+ifdeaSDF/yFRQlTGNRyod4Qtc2q+PGrJbYAKY93wJsLxodoNHvp
	ccqdkrm+gYthOq+EX58tMratKTzLVNQnHbG8exBu6IiXeKfYiFWXPTBzAMFyVjW2QZSDtZzAFfsqQ
	ssrzhjdNx//Mw/rKMpwB6COeJlIjGy1kzpdh0xQ01IsCHoFvbbG99w9cBPOM41LiwchCkBlF3wCRd
	bSjjb4hQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:46664 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oOL6p-0001XJ-6T;
	Wed, 17 Aug 2022 18:35:54 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-yarl: Upgrade 1.7.2 -> 1.8.1
Date: Wed, 17 Aug 2022 18:35:37 +0300
Message-Id: <20220817153538.3853497-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220817153538.3853497-1-leon.anavi@konsulko.com>
References: <20220817153538.3853497-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 15:36:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98309

Upgrade to release 1.8.1:

- Added URL.raw_suffix, URL.suffix, URL.raw_suffixes, URL.suffixes,
  URL.with_suffix
- Fixed broken internal references to :meth:`~URL.human_repr`
- Fixed broken external references to :doc:`multidict:index` docs

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-yarl_1.7.2.bb => python3-yarl_1.8.1.bb}    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-yarl_1.7.2.bb => python3-yarl_1.8.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.7.2.bb b/meta-python/recipes-devtools/python/python3-yarl_1.8.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-yarl_1.7.2.bb
rename to meta-python/recipes-devtools/python/python3-yarl_1.8.1.bb
index 0867d1cb5..66ee46b44 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.8.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/aio-libs/yarl/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e581798a7b985311f29fa3e163ea27ae"
 
-SRC_URI[sha256sum] = "45399b46d60c253327a460e99856752009fcee5f5d3c80b2f7c0cae1c38d56dd"
+SRC_URI[sha256sum] = "af887845b8c2e060eb5605ff72b6f2dd2aab7a761379373fd89d314f4752abbf"
 
 SRC_URI += "file://run-ptest"
 
@@ -14,6 +14,7 @@ inherit pypi ptest setuptools3
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-multidict \
     ${PYTHON_PN}-idna \
+    ${PYTHON_PN}-io \
 "
 
 RDEPENDS:${PN}-ptest += " \
-- 
2.30.2


