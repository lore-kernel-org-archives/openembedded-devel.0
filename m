Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD3CCCA481
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 02:14:28 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.19894.1656555264259545986
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jun 2022 19:14:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=aIZFY5i9;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656555262; i=@fujitsu.com;
	bh=jjyVEnKTqVSHRRjO3z5/HWqHvFEDxvo3CzwgLd/eldE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=aIZFY5i9jkbK8guJ/hC+J5twGCuN321WyV5Hcd0OP0cSFasy0G+11R/KSQ0GGqqXn
	 bLSPKGKKJgaIlDhZnDkCSurc6NW3F0aPoBBhyyl9DKpTLNYMmciaIurlvTs5oHEvSi
	 CGDrRBv1/9pSR/UN2nadx3dmKRAyiBKj2Yh1UuNianrU16BBQnFbYJDuzvKbYDgHsH
	 iUO4p6u3hLeZuBAsj4gbSPBn26fizY0m+8qDxWKUw61U2j2C0cwu4LHtecKL7K29bF
	 a16An1xukuCXpohKPjV5vEJoRvZLQ+Yyg+ldulo3XbtUDr5NEkYs+/1X8bZQJjz2P8
	 CiC1BCeAwcuGg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8ORpPuXbW+
  SwaVJVhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8btda3sBZv4Ky6/2sXewHiTt4uRi0NI4CGj
  xM6zRxi7GDmBnCtMEt/aqiESJxkllt1exQaSYBNQl3h88zVYkYiAvsTS2XuYQWxmAVWJ7otr2
  LsYOTiEBcIlNuxnBTFZgMKLW41AKngF3CXW9jWDdUoIKEhMefieGaSEU8BD4s0xFYit7hKzfl
  9mgSgXlDg58wkLxHAJiYMvXjBDtCpJnFjxkQnCrpB4ffgSVFxN4uq5TcwTGAVnIWmfhaR9ASP
  TKkarpKLM9IyS3MTMHF1DAwNdQ0NTXVNdI1NTvcQq3US91FLd8tTiEl1DvcTyYr3U4mK94src
  5JwUvbzUkk2MwPBNKWb9v4Oxu++n3iFGSQ4mJVHep9P2JAnxJeWnVGYkFmfEF5XmpBYfYpTh4
  FCS4F3PsDdJSLAoNT21Ii0zBxhLMGkJDh4lEd4b34FaeYsLEnOLM9MhUqcYdTlmfm07wCzEkp
  eflyolzruSBWiGAEhRRmke3AhYXF9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMzLAEwSQjy
  ZeSVwm14BHcEEdMTOaWBHlCQipKQamGSP9n/SqJN5qm16ksflR0XjzNDP6b8ORWTbbsySX7la
  8UhDqPFJ/n/CZ55OX8ozW+D5GekdHF+DaxqXnKm1+CU/mS1QRFufa19x9BLXpb/nLd5YyXutY
  2vDjvhPT87eYRI83tt/uf1x9ZfeRKM3izoiJ1/2vRk37WubW55pB0PLKiZ+R3aZXpafSS84ir
  c1M5jaF8wMVT9/cvPaa5dzo48Zrz10kEsg3Wn53v5/Key5972+SS49/botLMwyYPHzhTuuMjJ
  tPxhWw7Inrtwm0XiP+55knYtMgUcjUzZVN7n72FuFsdxYH3Vts/25w4LZ0RfmcXsVLDnRUvfP
  eteek8c2pZtGKPY/f/7LfHXrBiWW4oxEQy3mouJEAGt24SBmAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-14.tower-591.messagelabs.com!1656555261!91275!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20965 invoked from network); 30 Jun 2022 02:14:21 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-14.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Jun 2022 02:14:21 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 879AE1AE
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 03:14:21 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 7C4551AB
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 03:14:21 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 30 Jun 2022 03:14:19 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-charset-normalizer: upgrade 2.0.12
 -> 2.1.0
Date: Thu, 30 Jun 2022 10:14:02 +0800
Message-ID: <1656555244-20637-3-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1656555244-20637-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1656555244-20637-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jun 2022 02:14:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97625

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
==========
Added
--------
    Output the Unicode table version when running the CLI with --version (PR #194)

Changed
--------
    Re-use decoded buffer for single byte character sets
    Fixing some performance bottlenecks

Fixed
--------
    Workaround potential bug in cpython with Zero Width No-Break Space located in Arabic Presentation Forms-B, Unicode 1.1 not acknowledged as space (PR #175)
    CLI default threshold aligned with the API threshold from @oleksandr-kuzmenko (PR #181)

Removed
--------
    Support for Python 3.5 (PR #192)

Deprecated
--------
    Use of backport unicodedata from unicodedata2 as Python is quickly catching up, scheduled for removal in 3.0 (PR #194)

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...normalizer_2.0.12.bb => python3-charset-normalizer_2.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-charset-normalizer_2.0.12.bb => python3-charset-normalizer_2.1.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer_2.0.12.bb b/meta-python/recipes-devtools/python/python3-charset-normalizer_2.1.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-charset-normalizer_2.0.12.bb
rename to meta-python/recipes-devtools/python/python3-charset-normalizer_2.1.0.bb
index 47b8579a1..7c3d3ffc1 100644
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer_2.0.12.bb
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer_2.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ousret/charset_normalizer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0974a390827087287db39928f7c524b5"
 
-SRC_URI[sha256sum] = "2857e29ff0d34db842cd7ca3230549d1a697f96ee6d3fb071cfa6c7393832597"
+SRC_URI[sha256sum] = "575e708016ff3a5e3681541cb9d79312c416835686d054a23accb873b254f413"
 
 inherit pypi setuptools3
 
-- 
2.25.1


