Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF22AC3F6B0
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 15:35:55 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.30283.1660750549315167910
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:35:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=SRoW69OQ;
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
	bh=LuPWnXdnHKMU7NUui287W1xlrcw6ITlHvbkv3I5vIn0=; b=SRoW69OQXFJomZW+1UlSsmuvfL
	w8jzCYPszXxIjuOUXOYDLgXzTV37sqEgDAhXQXrPyqVAlD+xT1qRamGkopJfdwBq3ePdR9DtMibih
	IY5KbwdG1rk/NIu/CXEDW+/10B+L8hHGtO1PN7i5Mo8PjxoM8on5gwT5UNAnwafhn9YJgxx4n6FRB
	5S7Q6mS5DfaQOESxdoxB3RadNwNYX9mbZaQ8tZKdbvc+ided1dGk+sbw7RkgDMWhKDanGEk+zJc0G
	05gbbcoqXZgnYbVspPKEMFdpHe7rJIRxgSe8uSRJvAQlHZa6UY072nzcWo3o47qjSW0eK54yadaqa
	BFzCNQtA==;
Received: from lan.nucleusys.com ([92.247.61.126]:46664 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oOL6i-0001XJ-AF;
	Wed, 17 Aug 2022 18:35:47 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-cytoolz: Upgrade 0.11.2 -> 0.12.0
Date: Wed, 17 Aug 2022 18:35:34 +0300
Message-Id: <20220817153538.3853497-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 15:35:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98306

Upgrade to release 0.12.0:

- Update to toolz 0.12.0
- Build wheels automatically with cibuildwheel!
- Support newer Python versions
- Improve import times
- Use versioneer.py to manage versions

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-cytoolz_0.11.2.bb => python3-cytoolz_0.12.0.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cytoolz_0.11.2.bb => python3-cytoolz_0.12.0.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-cytoolz_0.11.2.bb b/meta-python/recipes-devtools/python/python3-cytoolz_0.12.0.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-cytoolz_0.11.2.bb
rename to meta-python/recipes-devtools/python/python3-cytoolz_0.12.0.bb
index 14f597c28..b6977b029 100644
--- a/meta-python/recipes-devtools/python/python3-cytoolz_0.11.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cytoolz_0.12.0.bb
@@ -5,8 +5,9 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=efbcddfa5610ca0c07ecfa274a82b373"
 
-SRC_URI[sha256sum] = "ea23663153806edddce7e4153d1d407d62357c05120a4e8485bddf1bd5ab22b4"
+SRC_URI[sha256sum] = "c105b05f85e03fbcd60244375968e62e44fe798c15a3531c922d531018d22412"
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} += "python3-toolz"
+DEPENDS += "${PYTHON_PN}-cython-native"
+RDEPENDS:${PN} += "${PYTHON_PN}-toolz"
-- 
2.30.2


