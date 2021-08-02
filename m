Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.83])
 by mx.groups.io with SMTP id smtpd.web12.15438.1627874990812337864
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Aug 2021 20:29:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oByvOtId;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.83, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627874983; i=@fujitsu.com;
	bh=QmnH4OnzC7RDecrmAab4skN4tMfPnfuycbHHb4fO30k=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=oByvOtIdCY23ZHPzmzhmqsIEEB1GZ/Ujo74Pry5+tyJ4b+MIL9qgL/KvV6FSBjoCm
	 8HZyXNknm5ezf3Jqkl0RcytFFsW6dK3U37ctnoOD6Wcxa3YjJFEPSrgVzs0mcdGNtC
	 wUUFxIU7bi8Z49cJyyyK7aA4izxbZne9gDRMZb12fKq7Ua0Tgb081p/Xjae4JtsBKy
	 AZmmLhHFRIOvaeYIx3UmG33OqItYRNBBtcd6gTbhIzb0j85F2GvS0buZZeUWAJPYTn
	 iC00HS5d4Wt4V0cJI31dU2QOIpEyQQZYOYjOi2ZJPLahIJYvbmyQD0FDPbWMsYCoJU
	 LEvjJgBsP3fqQ==
Received: from [100.112.198.115] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id 9F/A8-07821-7A667016; Mon, 02 Aug 2021 03:29:43 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+EI0V2Wxp5
  o8OmCgcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnHs2G72gnNcFUvvzGJsYLzC2cXIxSEkMItJ
  YtLCw4wQzm5GiXlXzzF1MXJysAnoSpx7vJYdxBYR0JdYOnsPM4gtLOAj8excD1gNi4CKxPu9J
  8DivAIeEl++z2QFsSUEFCSmPHwPFReUODnzCQuIzSwgIXHwxQugOAdQjaLE7OnyEOUVEq8PX2
  KewMgzC0nHLCQdCxiZVjGaJxVlpmeU5CZm5ugaGhjoGhoa6RpamumameglVukm6aWW6panFpf
  oGuollhfrFVfmJuek6OWllmxiBAZRSsERhx2M919/0DvEKMnBpCTKG9LGkijEl5SfUpmRWJwR
  X1Sak1p8iFGGg0NJgtc3lT1RSLAoNT21Ii0zBxjQMGkJDh4lEYg0b3FBYm5xZjpE6hSjopQ47
  8kUoIQASCKjNA+uDRZFlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ8xaAjOfJzCuBm/4KaD
  ET0OKpGawgi0sSEVJSDUzKCl6++7yOelzJ1oiuPLNu0YY9s73mtKndXunkfLOO1WrhmQbLk/s
  brCNZU74KLKnXvDVh0/NtLXN6e+SO2S92rpKuezE1al/6L5cvt13/HFi7yHPGi2v7BM5lvLF2
  cz4llHvf79tPgX/NduXnDXbMS15U53n07KddtZbF56urdE58nqC366aBwow8hgc+z7yfWb6o1
  b7JfyXAtsGBN2oKx/drigV37BjCj9lw929q8l48VSTW1/SgmI1tLa+ApomJUXHjEja/c/Znkx
  dXTJ2oW6pRVmpb9EpjhfPnM3wvk/i3BP5htSy1mH3YonffCe/vzmF26Zxab74GzchhumymdFU
  vYIZPPM8Lw0tdkUosxRmJhlrMRcWJAGnlYnAdAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-285.messagelabs.com!1627874982!198814!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31916 invoked from network); 2 Aug 2021 03:29:42 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-11.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 2 Aug 2021 03:29:42 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1723TaQP009400
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 2 Aug 2021 04:29:42 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Mon, 2 Aug 2021 04:29:34 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-bitarray: upgrade 2.2.2 -> 2.2.3
Date: Mon, 2 Aug 2021 11:29:25 +0800
Message-ID: <1627874965-94866-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

2021-07-22   2.2.3:
-------------------
  * speedup `repeat()`, #136
  * speedup shift operations, #139
  * optimize slice assignment with negative step, e.g.: `a[::-1] = 1`
  * add tests

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-bitarray_2.2.2.bb => python3-bitarray_2.2.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_2.2.2.bb => python3-bitarray_2.2.3.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_2.2.2.bb b/meta-python/recipes-devtools/python/python3-bitarray_2.2.3.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_2.2.2.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_2.2.3.bb
index 01f474d0bb..b72ca3b560 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_2.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_2.2.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "5ed37f0482199de5a3e096405a646ab3f45dd020d234c42539b3c11ea0e2278d"
+SRC_URI[sha256sum] = "b5d707d9c4aa75e684e21ff1848b234f3d2ff41d5038db89e2465e5527f90c68"
 
 inherit setuptools3 pypi
 
-- 
2.25.1

