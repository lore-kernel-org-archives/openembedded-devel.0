Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E118C433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 17:47:47 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web08.9995.1641577665196039829
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jan 2022 09:47:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=RLcN2AYO;
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
	bh=AjS0sKYcYnnDSJ5ei3n+rbCUnMU3+NPQZw67mmHdJ10=; b=RLcN2AYOHA5z1AepCFhX07kDgA
	gBJrB8drYrbi1HYcYBjICn0j26XCamg2WU+ruFaj7rEFUgVi13KKMM6CFYOqkuoNpey1JYzDJXFC0
	BZ5lkzx1CUt7C8W+6TfNLPx1kjAnd4KbAJU/adZAszMy702awGESypqhCP5LFSKNcu3ihgXx0EZAv
	iTyzoL9o0W5KLSuNWAXVLBJt5Olck9k9+3f1mWrE1hCLtFRcigKTyw9L9t/qFZGM0uxwY58c1Um5F
	/kIEmJ3pmB42ZdBtD1fgquGS1Wp1OLG8+Brox2ZV/3nCZoNVJk3FUx1lc16R8X0peYdQ0ykY8pfzz
	bsfDaMcA==;
Received: from lan.nucleusys.com ([92.247.61.126]:48914 helo=lootbox.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1n5tMc-0000YW-FU; Fri, 07 Jan 2022 19:47:44 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-psutil: Upgrade 5.8.0 -> 5.9.0
Date: Fri,  7 Jan 2022 19:47:26 +0200
Message-Id: <20220107174730.3326962-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jan 2022 17:47:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94692

Upgrade to release 5.9.0:

- [Linux]: cpu_freq() is slow on systems with many CPUs. Read
  current frequency values for all CPUs from /proc/cpuinfo instead
  of opening many files in /sys fs. (patch by marxin)
- NoSuchProcess message now specifies if the PID has been reused.
- error classes (NoSuchProcess, AccessDenied, etc.) now have a
  better formatted and separated __repr__ and __str__
  implementations.
- [BSD]: add support for MidnightBSD.
- [Linux]: disk_partitions(): convert /dev/root device (an alias
  used on some Linux distros) to real root device path.
- PSUTIL_DEBUG mode now prints file name and line number of the
  debug messages coming from C extension modules.
- rewrite HISTORY.rst to use hyperlinks pointing to psutil API doc.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-psutil_5.8.0.bb => python3-psutil_5.9.0.bb}      | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-psutil_5.8.0.bb => python3-psutil_5.9.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-psutil_5.8.0.bb b/meta-python/recipes-devtools/python/python3-psutil_5.9.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-psutil_5.8.0.bb
rename to meta-python/recipes-devtools/python/python3-psutil_5.9.0.bb
index 7186d3c97..cf3e0b39c 100644
--- a/meta-python/recipes-devtools/python/python3-psutil_5.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-psutil_5.9.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "A cross-platform process and system utilities module for Python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e35fd9f271d19d5f742f20a9d1f8bb8b"
 
-SRC_URI[sha256sum] = "0c9ccb99ab76025f2f0bbecf341d4656e9c1351db8cc8a03ccd62e318ab4b5c6"
+SRC_URI[sha256sum] = "869842dbd66bb80c3217158e629d6fceaecc3a3166d3d1faee515b05dd26ca25"
 
 inherit pypi setuptools3
 
@@ -19,6 +19,8 @@ RDEPENDS:${PN} += " \
     ${PYTHON_PN}-threading \
     ${PYTHON_PN}-xml \
     ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-ctypes \
+    ${PYTHON_PN}-resource \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


