Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13AFAECAAD3
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 12:41:58 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.19255.1663591313145051087
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 05:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=snauSnYT;
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
	bh=u3+VcS7EONL4hnFhpz0aVYuJQcRzMjZqLXpFVyCKkl4=; b=snauSnYTNejsI1AOpWr2fbACCV
	OMUSXhuCZpWYemFGOBhKUKP2TkHYqB2Jh0vTKrjlWBTB0tRn0YZ4sB1vuMYke4/bjgAIDESxL9aA4
	7UW/HVMPfF3cZIpcRPZwiDpkDjw565b3A6UtcRHOwIiOSZAd13Xuc/xQYdiFq2s1dX2/wAfs+KCLj
	kpmqG6Vos5WQku5Xn7eHmu7fJdo/7CsHH+0057bBPLg3+t5zsUrszi0QxkxfADWdpXqkyB38ao9jz
	RiS6CgmK1s30r6EgYn59BkYFrf4/ew0rpbBzOKdP7GPYH81fxTOb/eUesVmRsuViJSX48lv1Qh7Pu
	XSheEygA==;
Received: from lan.nucleusys.com ([92.247.61.126]:41394 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oaG6F-0000x1-Td;
	Mon, 19 Sep 2022 15:41:51 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/4] python3-joblib: Upgrade 1.1.0 -> 1.2.0
Date: Mon, 19 Sep 2022 15:41:39 +0300
Message-Id: <20220919124142.4025940-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Sep 2022 12:41:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98863

Upgrade to release 1.2.0:

- Fix a security issue where eval(pre_dispatch) could potentially
  run arbitrary code. Now only basic numerics are supported.
- Make sure that joblib works even when multiprocessing is not
  available, for instance with Pyodide.
- Avoid unnecessary warnings when workers and main process delete
  the temporary memmap folder contents concurrently.
- Fix memory alignment bug for pickles containing numpy arrays.
  This is especially important when loading the pickle with
  mmap_mode != None as the resulting numpy.memmap object would not
  be able to correct the misalignment without performing a memory
  copy. This bug would cause invalid computation and segmentation
  faults with native code that would directly access the underlying
  data buffer of a numpy array, for instance C/C++/Cython code
  compiled with older GCC versions or some old OpenBLAS written in
  platform specific assembly.
- Vendor cloudpickle 2.2.0 which adds support for PyPy 3.8+.
- Vendor loky 3.3.0 which fixes several bugs including:
  * robustly forcibly terminating worker processes in case of a
    crash
  * avoiding leaking worker processes in case of nested loky
    parallel calls
  * reliability spawn the correct number of reusable workers

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-joblib_1.1.0.bb => python3-joblib_1.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-joblib_1.1.0.bb => python3-joblib_1.2.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-joblib_1.1.0.bb b/meta-python/recipes-devtools/python/python3-joblib_1.2.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-joblib_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-joblib_1.2.0.bb
index e69cfefd1..ec02265d1 100644
--- a/meta-python/recipes-devtools/python/python3-joblib_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-joblib_1.2.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2e481820abf0a70a18011a30153df066"
 
 inherit setuptools3 pypi
 
-SRC_URI[sha256sum] = "4158fcecd13733f8be669be0683b96ebdbbd38d23559f54dca7205aea1bf1e35"
+SRC_URI[sha256sum] = "e1cee4a79e4af22881164f218d4311f60074197fb707e082e803b61f6d137018"
 
 RDEPENDS:${PN} += " \
     python3-asyncio \
-- 
2.30.2


