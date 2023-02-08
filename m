Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC82C636D3
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 08:09:05 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.3764.1675843743915763337
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Feb 2023 00:09:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PkXaxWwn;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1675843741; i=@fujitsu.com;
	bh=dMR6uissBwPHczdflalLn5hUEE9Ga0B9C6p6V2pwTUc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=PkXaxWwn/H253Iy+8zIw/oQvD9Khc5b92nyVRAAQOIFVEH7fB8SxcP+BTPiMP+6rG
	 YLAHHb17LNcscnVaHN3yaSzukDyK2b0D4y20BnRc0GoQhPDhMpgix0UIgUPYQ8cZIX
	 1ubZtvuixDWa5+q6CEMBUIDa2mfI0/r+18z0PGg6e7TbG9+64xL+2cf2hyHFLlwqv2
	 yqckOuleI+74wCdywfu9nJlQc06UBqhpelJOxPZjBJCqgB4/V0AyQCLb2ZUgp8zI2N
	 iFxfqpvyIaPCC0K3x1tlq8jhQojOyUWXtAurPoMv97XtAI8vT6MX1m4cEob4goWz0x
	 39KR/hwWu3R5Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8MxSXduxON
  kg993VS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oxN3++xFMziq1jy8xNrA+NTni5GLg4hgSeM
  EhuWN7JDODeYJF61TmeFcPYwSjRufgnkcHKwCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAjMWXJLLAaFqD4xKaNYHFeASeJtztnM4HYEgIKElMevgfr5RRwlrjUdxZsvhBQzcSLEP
  N5BQQlTs58wgIxX0Li4IsXzBC9ihKzLzezQNiVEq0ffkHZahJXz21insAoOAtJ+ywk7QsYmVY
  xmhenFpWlFukamuslFWWmZ5TkJmbm6CVW6SbqpZbq5uUXlWToGuollhfrpRYX6xVX5ibnpOjl
  pZZsYgQGcEpx0p0djDv7/uodYpTkYFIS5fUUe5wsxJeUn1KZkVicEV9UmpNafIhRhoNDSYI3I
  hwoJ1iUmp5akZaZA4wmmLQEB4+SCG9kKFCat7ggMbc4Mx0idYpRUUqc91EYUEIAJJFRmgfXBo
  vgS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeQNApvBk5pXATX8FtJgJaHGI6kOQxSWJCCm
  pBiaB78WXBNQazaQkz1xS3S6U/K9lO3/I3uqIj34fHllEnddLnJV3vvt8RF7V5Lm6Cg/UrFdb
  OL2v18joXbwuJ8BpFpfBHr2SZw9PL3d/yxZwxXhx+qaoVvm0fElPP+11yz4UJMzu81CaKVBvY
  Xhd6ssGzXtCPsu+X9LNPnPjUltk5CLnuu+/j2k6FtqccdrWHjH1m/CRP39TNrXKsG2ccbvJ1n
  53r8KpA+pbihpjdSqr1KT+XFF7ds9UcOLrFsPDj/+eEf8iu+6SVFeqec+3hhkR7MKJ0dsWZXv
  mmpSsTe5wUP54csLsoKjiCJ9ZtZse/hH6qu8q9Y8zzs5ystCnWXM16lQXpmcmncicJF+ZqMRS
  nJFoqMVcVJwIAJd6oHZbAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-732.messagelabs.com!1675843741!394866!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25874 invoked from network); 8 Feb 2023 08:09:01 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Feb 2023 08:09:01 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 131C11000D5
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:09:01 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 0735B1000D2
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:09:01 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Feb 2023 08:08:59 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-bitarray: upgrade 2.6.2 -> 2.7.0
Date: Wed, 8 Feb 2023 16:08:36 +0800
Message-ID: <1675843716-11186-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1675843716-11186-1-git-send-email-wangmy@fujitsu.com>
References: <1675843716-11186-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 08:09:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100972

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
  * add 'util.sc_encode()' and 'util.sc_decode()' for
    [compression of sparse bitarrays](sparse_compression.rst)
  * add 'util.any_and()'
  * add 'util.intervals()'
  * move functionality of the following utility functions entirely to C:
    'hex2ba()', 'base2ba()', 'deserialize()', 'vl_decode()', 'zeros()'
  * improve error checking for unpickling
  * add [distance metrics](../examples/distance.py) example:
    dice, hamming, jaccard, kulczynski1, rogerstanimoto, russellrao,
    sokalmichener, sokalsneath, yule
  * add example [sparse bitarray](../examples/sparse) implementations

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bitarray_2.6.2.bb => python3-bitarray_2.7.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_2.6.2.bb => python3-bitarray_2.7.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_2.6.2.bb b/meta-python/recipes-devtools/python/python3-bitarray_2.7.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_2.6.2.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_2.7.0.bb
index 1b225c3fa..269ac83ad 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_2.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_2.7.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "90bac83ba6c37ab5048b43e07eba7d0de12f301ad6641633656fa269618a7301"
+SRC_URI[sha256sum] = "00bb723cf7059e30b328b6568b3b75c0f652ec9228d959d54e997852a31a31a2"
 
 inherit setuptools3 pypi
 
-- 
2.34.1


