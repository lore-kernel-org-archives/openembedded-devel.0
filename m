Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23117C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 23:45:47 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.3679.1645659944929516196
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 15:45:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=NYaIzl21;
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
	bh=Gg7VgSzUMfCWnlvlfI4QREUuNDC4JXF/bagPeoZnWeM=; b=NYaIzl21g1H2zIV31ElL3hEYBp
	NuvMd1PGkyFEi39g/r2hl053sbpc8jzF76Nck6Thn0ZXUUmApnMYzbD/sKOj0MSKatco8UhO4iaC0
	ouFzPMDc98Xfnvmcurj5jP45kg0vyTjEPQ0xMH6iBKZPNMCADuehfKYC27rDb2oh14HAOvR7HYpML
	C/9YSG15Wh7DRFr0ww/AY6nPQ9wnfRHdCsZG341n9PczX/l/laZIn8i5oInrxDcC5pleu96ys/oiB
	jVHPBhEgyHKlJrZjIG53LUswPPPe2P7BHXJw96RNsolt3+7NQVJuaQls1porDDU1oxUKgq2RJGbJp
	kyk9W7yA==;
Received: from lan.nucleusys.com ([92.247.61.126]:54742 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nN1Mm-0009hw-Pe; Thu, 24 Feb 2022 01:45:45 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-cmd2: Upgrade 2.3.3 -> 2.4.0
Date: Thu, 24 Feb 2022 01:45:32 +0200
Message-Id: <20220223234533.1829801-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Feb 2022 23:45:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95490

Upgrade to release 2.4.0:

- Fixed issue where tab completion was quoting argparse flags in
  some cases.
- Added broader exception handling when enabling clipboard
  functionality via pyperclip.
- Added PassThroughException to __init__.py imports.
- cmd2 now uses pyreadline3 when running any version of Python
  on Windows
- Improved memory usage in certain use cases of tables
  (e.g. nested colored tables)
- Deleted cmd2.fg and cmd2.bg which were deprecated in 2.3.0.
  Use cmd2.Fg and cmd2.Bg instead.

License-Update: Update years

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cmd2_2.3.3.bb => python3-cmd2_2.4.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_2.3.3.bb => python3-cmd2_2.4.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_2.3.3.bb b/meta-python/recipes-devtools/python/python3-cmd2_2.4.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-cmd2_2.3.3.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_2.4.0.bb
index d8a4fb5f2..bc3fedd37 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_2.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_2.4.0.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Extra features for standard library's cmd module"
 HOMEPAGE = "https://github.com/python-cmd2/cmd2"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4c527bcb481233ebcb803de975f42701"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=209e288518b0668115f58c3929af9ff1"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "750d7eb04d55c3bc2a413e191bc177856f388102de47d11f2210a35266543640"
+SRC_URI[sha256sum] = "090909ab6c8ecee40813cec759e61dd6e70c8227a1a8e96082f5f2b0d394bc77"
 
 inherit pypi setuptools3
 
-- 
2.30.2


