Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A603C4321E
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 06:14:18 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.111396.1669616056550929030
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 22:14:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rzzK2w0J;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669616054; i=@fujitsu.com;
	bh=SbZnWV93Rhr/MVdL35GmzKd7XaV9eUUIYP4uaydUZsw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=rzzK2w0JTSglLUmCcVQYGzcwk8KMw3eKjZ8OmSSbBreZ6LNGAXRg040PfyGBpC1CM
	 xi87X+DaROxjDXS1r5NpbVoX1r2f4kjLFsAdjOv9DF0U9tEWYW7dbYbmt4PxAErvCd
	 GFmxutyfBoEmJr/11GgOGd4/s7dmXBGLiPDF4VWnQze4XkMw5oe8OEYqq4Y/hSwWwo
	 dIICGH3Igc6CSRyly655Nio9tM/xlvpDdN50gxBk3L4IdR9rESAzzAwguy349ZxPf6
	 mKaADAbKGLy0sWj39MUHEOUKhlpngDDcxicUdaA1iqvfFsbhTYfd9LJSx1/ERJNCL3
	 BkKqgSRnpatYw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8ORpLs1sCX
  ZoGm3scXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmtG/x7mgk6di4/N2lgbGd1xdjJwcQgIPGSUe
  dhp2MXIB2ZeZJG6+PMIM4exhlNh25AM7SBWbgJTEjfv/2UBsEQF9iaWz9zCD2MwCKhIvfveA1
  QgL+Ek8nf2aBcRmEVCV2L91O5jNK+Akcf3OIrAaCQEFiSkP34P1cgo4S9zee5QV4goniebXh6
  HqBSVOznzCAjFfQuLgixfMEL2KErMvN7NA2BUSs2a1MUHYahJXz21insAoOAtJ+ywk7QsYmVY
  xmhWnFpWlFula6iUVZaZnlOQmZuboJVbpJuqllurm5ReVZOga6iWWF+ulFhfrFVfmJuek6OWl
  lmxiBIZuSnF67g7GS8v+6B1ilORgUhLlXXipKVmILyk/pTIjsTgjvqg0J7X4EKMMB4eSBO96z
  5ZkIcGi1PTUirTMHGAcwaQlOHiURHgX2wOleYsLEnOLM9MhUqcYdTlmfm07wCzEkpeflyolzn
  vOH6hIAKQoozQPbgQspi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEubdBjKFJzOvBG7TK6A
  jmICO2KTYBHJESSJCSqqBKehShMNf72NXF1/MXnrzhblBBkPEO/GYetdF6Woznu8yVD7ner35
  tdvCNXEuQh5qbhfmLE3ee0pFfn/uIetjjBFzwyptekP+3ON6ILfGM+vtPg3+RDt77dT3gW0vc
  xeGrNm/6wfrwQbev8mfKytyjzzIkGX5kHRpwQ31U+mN66RyjUt/PNC9e7lY40CcvmBdluGF6d
  P/vVxQoqp+OGfRJ+vTu/ufNC9tTLLoYTHYsfb5UbdF06+t+nX38IqoHYc3P+JJmKy9jl+4vi7
  t6z+Rpg1a7torPPQdDzVlXjcWi/RiCNY+t/OB7a6iI8GHBL87ng9be2d1C19b15PP4ucf96e8
  OjPnaOvzHKWQpO/+mkosxRmJhlrMRcWJAI8pYPVkAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-732.messagelabs.com!1669616053!128854!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22630 invoked from network); 28 Nov 2022 06:14:13 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-20.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Nov 2022 06:14:13 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 539381AC
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:14:13 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 488757B
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:14:13 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Nov 2022 06:14:11 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-dateparser: upgrade 1.1.0 -> 1.1.4
Date: Mon, 28 Nov 2022 14:13:42 +0800
Message-ID: <1669616024-13194-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1669616024-13194-1-git-send-email-wangmy@fujitsu.com>
References: <1669616024-13194-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:14:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99803

From: Wang Mingyu <wangmy@fujitsu.com>

Improvements:

    Improved support for languages such as Slovak, Indonesian, Hindi, German, and Japanese (#1064, #1094, #986, #1071, #1068)
    Recursively create a model home (#996)
    Replace regex sub with simple string replace (#1095)
    Add Python 3.10, 3.11 support (#1096)
    Drop support for Python 3.5, 3.6 versions (#1097)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-dateparser_1.1.0.bb => python3-dateparser_1.1.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dateparser_1.1.0.bb => python3-dateparser_1.1.4.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-dateparser_1.1.0.bb b/meta-python/recipes-devtools/python/python3-dateparser_1.1.4.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-dateparser_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-dateparser_1.1.4.bb
index 5b661a086..74d7b50f0 100644
--- a/meta-python/recipes-devtools/python/python3-dateparser_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dateparser_1.1.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/scrapinghub/dateparser"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3d3ed25571191e7aa3f55d0a6efe0051"
 
-SRC_URI[sha256sum] = "faa2b97f51f3b5ff1ba2f17be90de2b733fb6191f89b4058787473e8202f3044"
+SRC_URI[sha256sum] = "73ec6e44a133c54076ecf9f9dc0fbe3dd4831f154f977ff06f53114d57c5425e"
 
 PYPI_PACKAGE = "dateparser"
 
-- 
2.25.1


