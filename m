Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C06C48BE8
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:49 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.2679.1649137134707856854
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 22:38:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TxhTQ1hJ;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649137132; i=@fujitsu.com;
	bh=AoDevcdjEMbz29nu1GqWhf9xiAf5kZuttXFs+KIL+Ts=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=TxhTQ1hJWtb2cMICR8Jyou7CFc49ZPb0fJMNBRdU4bl3MehqrlL5SkpoA/xW67tK1
	 AVwwEHeX3ONF0YtuZrQX+Ok4YxOkm7o4M4vq5eZVcCoxTCcu3ttyCmoR6ZjSwLUs0C
	 NKhTExyOdWIoxUTGgsoUCDuIF/3ILyNAoJMnskJYrfTV6LK7iRp5XuC/4mcLgJ/Dtj
	 FYdnv+f0r7p0oSFXiFKNN5763Jn6LdDVtQKzNGPMJS+DJ4xj62sfWcD9+701Kxourh
	 Qdrzyf+S2dgoQbmPIcY8VMxrcmb5dOZizVGDbRWJgzsEWT6ttj/bYGSbknaYpR6VU2
	 yjpb6yHV26/gw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8MxSffNVe8
  kg1UdYhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bahRsYC9ZxVXReD29g3M3ZxcjFISTwhFHi
  etdExi5GTiDnApPEugv5EIndjBJ3VixmA0mwCahJTL91gxXEFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAjsbl9GguIzQIUP9F+hQnE5hVwkljxoxPMlhBQkJjy8D1YL6eAs0R7ewMbxGInicmP1z
  BC1AtKnJz5hAVivoTEwRcvmCF6FSVmX25mgbArJGbNaoOaqSZx9dwm5gmMgrOQtM9C0r6AkWk
  Vo3VSUWZ6RkluYmaOrqGBga6hoamusbmuoZmRXmKVbqJeaqlueWpxiS6QW16sl1pcrFdcmZuc
  k6KXl1qyiREYxCnFqot2MO5f9VPvEKMkB5OSKO8ZV+8kIb6k/JTKjMTijPii0pzU4kOMMhwcS
  hK8J88C5QSLUtNTK9Iyc4ARBZOW4OBREuE9chEozVtckJhbnJkOkTrFqCglznvzClBCACSRUZ
  oH1waL4kuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHl5QKbwZOaVwE1/BbSYCWjxuzOeIIt
  LEhFSUg1MBfM49AXMdV66rLKKiuQXDbn/i+NYs8Hcu9Y3FD5a3TRaFmrAkBu85629REdnwfRA
  w+q5dt3nHi7aYsdqsK2oazWz5ZJu9YrVXhqcyY09NyZLpnV+UtxkyFqx/ePUxuSimdG9OpN2/
  Ze/mVGrdyg3PX/fxaKXd+Y0+O3P2GW2csfkDbNtzA1X39VZ4yC1UeKoyLqri4zmTDXy5mLzt1
  Spl25Q3so3s++ztIlTjKrWQ/e6+8LHbjPL77ISuChs6r5VZeYG9a9Ldu/wYDw/9VMlx+wcvn3
  NfPF32EqfxV1xF/0qEVYVJDzhUJ54pLPiNC9rNrMVv13fd6/SOfxryrWMicc6BbPUlgnv3mMt
  rafEUpyRaKjFXFScCACmD1MtXQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-548.messagelabs.com!1649137132!93340!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28027 invoked from network); 5 Apr 2022 05:38:52 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-11.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Apr 2022 05:38:52 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id F2B7D100047
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Apr 2022 06:38:51 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id E5FB4100440
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Apr 2022 06:38:51 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 5 Apr 2022 06:38:43 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-bitarray: upgrade 2.4.0 -> 2.4.1
Date: Sat, 2 Apr 2022 20:35:05 +0800
Message-ID: <1648902907-19815-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648902907-19815-1-git-send-email-wangmy@fujitsu.com>
References: <1648902907-19815-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96404

Changelog:
==========
  * improve 'resize()', see #167
  * optimize 'copy_n()' by avoiding loops, #171
  * '.bytereverse()' no longer sets unused bits to zero

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bitarray_2.4.0.bb => python3-bitarray_2.4.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_2.4.0.bb => python3-bitarray_2.4.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_2.4.0.bb b/meta-python/recipes-devtools/python/python3-bitarray_2.4.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_2.4.0.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_2.4.1.bb
index 39d1618cb1..fbb89b8dd7 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_2.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_2.4.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "f1203e902d51df31917d77eeba9c3fe78d032873a2ad78c737e26420f0080e58"
+SRC_URI[sha256sum] = "faeca03f979e992cc76f7406af7eb9795cb111b8d8969c891a032bd7497c87da"
 
 inherit setuptools3 pypi
 
-- 
2.25.1


