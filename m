Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E19BC433F5
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 09:20:12 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web12.2079.1652347202992272187
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 02:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QS5tXXst;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652347201; i=@fujitsu.com;
	bh=ql7JIIPW6hGAN2p9mQKKRQwhsikiNGV/mw60zg1crIc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=QS5tXXst8p7igxi9WW7yL2XNtvEVP8ECVAEgxuAUMuJZj1oKyaVo92DJ11mfj5Reg
	 8rLASfC6jtFxhyC3woe48kDKWTQ2bMVDJdYVkXSLWtUqn9uDvUvR6yIh7gmO136+QK
	 UjKE689kH4rbCpE68eSowtbB2pZG4Tk08Yuy9UVrMxzH6YWL73r/Ac/NrwQMisQSXK
	 vOsg+sO1G+UwmiSt6BSX/I58UujJSFolUoE0dWIn6oqw8vElGo62VT0wEVOQyjr1bI
	 3HSPoFf9XupTpwWX6TUqyLrewvnGR4WGiIPfFDU1iKETnPp8Hzn8LezQvA6zYkLVnS
	 /XNkzERtxqpGA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRWlGSWpSXmKPExsViZ8ORqOtwsSb
  JoHGuocXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrG46QdTwQ/+iot737I0MPbwdTFycQgJPGGU
  6F39gBnCucAk0bj3CjuEc4BRonHxRLYuRk4ONgFdiRc/FrOA2CIC+hJLZ+9hBrGFBXwkXt48y
  QpiswioSrxaPwmohoODV8BD4s0LHZCwhICCxJSH78HKeQUEJU7OfAI2hllAQuLgixfMIOUSAo
  oSs6fLQ5RXSLw+fIkZwlaTuHpuE/MERr5ZSLpnIelewMi0itEqqSgzPaMkNzEzR9fQwEDX0NB
  UF0gaGeslVukm6qWW6panFpfoGuollhfrpRYX6xVX5ibnpOjlpZZsYgSGXkoxQ/UOxv+9P/UO
  MUpyMCmJ8p47X5MkxJeUn1KZkVicEV9UmpNafIhRhoNDSYJ35zmgnGBRanpqRVpmDjAOYNISH
  DxKIrzFIGne4oLE3OLMdIjUKUZFKXHeD/uAEgIgiYzSPLg2WOxdYpSVEuZlZGBgEOIpSC3KzS
  xBlX/FKM7BqCTMexrkMp7MvBK46a+AFjMBLd7vWgmyuCQRISXVwHT0uO+brhyBlhXq6n8Xv3x
  mfnfhvyzJ71btyr4yjrpqt7ad2viv5tn5w03S1QrPCq/Y1p7J4Cs5nix6nHXFzxyB5JaPvBHM
  4mYZNVZCzDu5J5/6pXtwX8dus2D9Uz/fb2tnbT2yRraSt89w87ryz1sefWG+2+n2VTl1a+RJS
  S6uhls8cU9eCWXxKvomfWs4xMs5q3+3d9K/l1+MNK322j9Tfi7wqOdr7ebidM+nYpqvVykWF/
  ntmPBwr81kMRYv6dxJ02VuxW8x/Hb4q4ujeaDY5ftu2kK+D9XX1qyKL7pzRirEcUfkGnb5id8
  69iz/FDv/RNvGu2c++b5WfKkdufPoSrlPP11merCmbHdhmqjEUpyRaKjFXFScCABmYsXtOAMA
  AA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-21.tower-585.messagelabs.com!1652347200!512408!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22623 invoked from network); 12 May 2022 09:20:00 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-21.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 May 2022 09:20:00 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 44B5D1001A1
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 10:20:00 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 292B610018C
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 10:20:00 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 12 May 2022 10:19:39 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-bitarray: upgrade 2.4.1 -> 2.5.0
Date: Thu, 12 May 2022 17:19:14 +0800
Message-ID: <1652347154-16706-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 May 2022 09:20:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97070

2022-05-04   2.5.0:
-------------------
  * add calculating of canonical Huffman codes 'util.canonical_huffman()'
    and decoding thereof 'util.canonical_decode()', see #173
  * allow creating "Huffman codes" from frequency maps with a single symbol
    in 'util.huffman_code()' and 'util.canonical_huffman()', see #172
  * allow bytes-like argument in '.frombytes()' and '.pack()' - previously,
    the arguments were limited to the 'bytes' object, see #174
  * allow bytes-like arguments in 'util.deserialize()'
  * add official pyodide support
  * add [DEFLATE decompression](../examples/puff/) example
  * optimize '.bytereverse()'
  * optimize 'delslice()' for cases like 'del a[1:17:2]' when 'a' is large
  * fix 'examples/huffman/compress.py' to handle files with 0 or 1 characters,
    see also #172
  * add 'skipIF' decorator for skipping tests
  * add test

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-bitarray_2.4.1.bb => python3-bitarray_2.5.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_2.4.1.bb => python3-bitarray_2.5.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_2.4.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_2.5.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_2.4.1.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_2.5.0.bb
index fbb89b8dd..bb80c4a04 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_2.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_2.5.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "faeca03f979e992cc76f7406af7eb9795cb111b8d8969c891a032bd7497c87da"
+SRC_URI[sha256sum] = "5abed04adcd2031f6e714993d95223bf9ae85354c640c270b2ed6f46b83573ba"
 
 inherit setuptools3 pypi
 
-- 
2.25.1


