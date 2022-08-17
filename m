Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D20EEC3F6B0
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 15:36:05 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.30128.1660750557275695766
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=cu4wwYgL;
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
	bh=1Tows/i1TIEr+KeVE/IyaDK8Cv46LX4ZhPo5F3Sfuz0=; b=cu4wwYgLRm2Ks43CPFGYEaf+SU
	C+FrV/ni5lKRijZ+2CoXFvoCeFkl8k/yudNlgDmQFk82QKEPR9H0uzuhGitqfMxvgWDuqYdpVvgNz
	nSPVNAAQvaMWRdoPBkEhjXN3vvGnvDnCujEN2/ApVwJbwMXbwsuexvgGQLtg1HoPQ5B1f2u5iKJuR
	BCfxPDwrRV3MNz9jf4myT2tZ655RWIzHHrpVJBmajb34KifODaF74eVlSB842MRFG1l00UWdyxLjW
	chEItlEJUlVnbEOYp/3xkLsvyTYKD88VybzfDJWEz+VrJgFHO5ZsZ7NF1rbBxLVUvLhbWLPsg55Q9
	RhvZeNtg==;
Received: from lan.nucleusys.com ([92.247.61.126]:46664 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oOL6r-0001XJ-K5;
	Wed, 17 Aug 2022 18:35:57 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-term: Upgrade 2.3 -> 2.4
Date: Wed, 17 Aug 2022 18:35:38 +0300
Message-Id: <20220817153538.3853497-5-leon.anavi@konsulko.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/98310

Upgrade to release 2.4:

- Add Python 3.8-3.10 to tox.ini. Remove old Python versions.
- Replace deprecated python setup.py test in tox.ini.
- Remove deprecated test_suite from setup.py.
- Move metadata to setup.cfg and add a pyproject.toml file.
- Include tests in sdist but not in wheel.
- Fix escape sequence warning in byte string literal.
- Open /dev/tty in binary mode under both Python 2 and 3.
- Officially change opentty's bufsize argument default from 1 to
  -1. Under Python 3, 1 has effectively meant -1 all along but
  Python 3.8 now issues a warning.
- Add readto, getfgcolor, getbgcolor, islightmode, and isdarkmode.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-term_2.3.bb => python3-term_2.4.bb}  | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-term_2.3.bb => python3-term_2.4.bb} (54%)

diff --git a/meta-python/recipes-devtools/python/python3-term_2.3.bb b/meta-python/recipes-devtools/python/python3-term_2.4.bb
similarity index 54%
rename from meta-python/recipes-devtools/python/python3-term_2.3.bb
rename to meta-python/recipes-devtools/python/python3-term_2.4.bb
index 6b62eb02c..bc6a4c3df 100644
--- a/meta-python/recipes-devtools/python/python3-term_2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-term_2.4.bb
@@ -3,9 +3,10 @@ SECTION = "devel/python"
 LICENSE = "Python-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d90e2d280a4836c607520383d1639be1"
 
-SRC_URI[md5sum] = "ab0c1bce381b1109fe4390c56aa06237"
-SRC_URI[sha256sum] = "3dcc8c212e04700784e5c1c5b601916ba0549ae6025b35b64fd62144899e7180"
-
-PYPI_PACKAGE_EXT = "zip"
+SRC_URI[sha256sum] = "2cca4cf5f83035ca12627c4bbeff2891ad4711666247a790fd8200d73f38c3f0"
 
 inherit pypi setuptools3
+
+RDEPENDS:${PN} = "\
+    ${PYTHON_PN}-io \
+"
-- 
2.30.2


