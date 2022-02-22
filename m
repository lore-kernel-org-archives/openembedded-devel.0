Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A26F9C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 12:12:12 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.11951.1645531929883324607
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 04:12:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=Cfsm+Dw7;
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
	bh=8IKUWc2GaD6W7c4VbrqGBCTwj8o88oFupxkFqw3t9ng=; b=Cfsm+Dw72SoR3ILSJ07d1rT9+8
	LXNl+8ZlxPBGRYl5ZXE/zQiLftipIQEtGnLr4bnplg7eJpwnQSRFaffSkD6y5vz7orGKUtOkEZmJC
	FhBMjEqkE6OCVuTH6cGOsi+iwh4V+H0TaNAyXYo0WudnL6v8EvvDj3ZmWUOTyzZU7W9zTbukfQP4h
	Wfg8YIm6Iudeojbp+39PPXdqyP00KiU9MUoj2chJN3iiTdPIu5jkGV/75YXw/nHuwocVgmY+kCpVp
	V4veR9CP7qvd25e/RqcrThPiW5i6QB5SDLBga8dq3HSoxH35P9QvGEJvMMqAA0Ua7LmxukPyqweUB
	g5/C566g==;
Received: from lan.nucleusys.com ([92.247.61.126]:49814 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nMU3v-0006GM-0V; Tue, 22 Feb 2022 14:12:07 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-distro: Upgrade 1.6.0 -> 1.7.0
Date: Tue, 22 Feb 2022 14:11:57 +0200
Message-Id: <20220222121158.3510277-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Feb 2022 12:12:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95443

Upgrade to release 1.7.0:

- Dropped support for EOL Pythons 2.7, 3.4 and 3.5
- Dropped support for LSB and uname back-ends when --root-dir is
  specified
- Moved distro.py to src/distro/distro.py
- Documented that distro.version() can return an empty string on
  rolling releases
- Documented support for Python 3.10
- Added official support for Rocky Linux distribution
- Added a shebang to distro.py to allow standalone execution
- Added support for AIX platforms
- Added compliance for PEP-561
- Fixed include_uname parameter oversight
- Fixed crash when uname -rs output is empty
- Fixed Amazon Linux identifier in distro.id() documentation
- Fixed OpenSuse >= 15 support
- Fixed encoding issues when opening distro release files
- Fixed linux_distribution regression

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-distro_1.6.0.bb => python3-distro_1.7.0.bb} | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-distro_1.6.0.bb => python3-distro_1.7.0.bb} (56%)

diff --git a/meta-python/recipes-devtools/python/python3-distro_1.6.0.bb b/meta-python/recipes-devtools/python/python3-distro_1.7.0.bb
similarity index 56%
rename from meta-python/recipes-devtools/python/python3-distro_1.6.0.bb
rename to meta-python/recipes-devtools/python/python3-distro_1.7.0.bb
index 8aa225567..f069234d1 100644
--- a/meta-python/recipes-devtools/python/python3-distro_1.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-distro_1.7.0.bb
@@ -5,8 +5,15 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
 PYPI_PACKAGE = "distro"
 
-SRC_URI[sha256sum] = "83f5e5a09f9c5f68f60173de572930effbcc0287bb84fdc4426cb4168c088424"
+SRC_URI[sha256sum] = "151aeccf60c216402932b52e40ee477a939f8d58898927378a02abbe852c1c39"
 
 inherit pypi setuptools3
 
+RDEPENDS:${PN} = "\
+	${PYTHON_PN}-core \
+	${PYTHON_PN}-json \
+	${PYTHON_PN}-logging \
+	${PYTHON_PN}-shell \
+"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


