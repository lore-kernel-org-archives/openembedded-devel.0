Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.1674.1628233231525104775
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Aug 2021 00:00:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com header.s=170520fj header.b=PP4mx9pS;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1628233219; i=@fujitsu.com;
	bh=EECJ1GuOd6SB7Na9OdpwVfrVtBen/E6GFu+NWZFzQs4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=PP4mx9pSRwR5a08B0fRcliAMeOiFAw+BdqMupgPBJbckp+Q7cHhzrkTEX+mLB8x+N
	 wbEHwvcm5iDl2nYXxk4egosSDLjoF5XCSMW537PdKGfXbfQbVFDADCVtvl+Sn3M1s8
	 1A8AGQf19Fkqvkg8KvMhBlnixb7P8TRbMx+8Z9MPYXSS6nAxvGSjgF9tTdvVP5xCG0
	 IYz8NMhNPz6CKU5eaQbPYP3+y6dwrY9B8Q+lDUY4zW5k5gNF5zYsj9lhOdCt/HvtvN
	 LKYULmcpMMGkFF/xPevhBVQGCgnV/eXClghgvZ0nxWKO6VHHx2QXKAYKUwur+md+Pi
	 jPmPhOzD9nAsQ==
Received: from [100.113.1.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id 06/9A-16478-30EDC016; Fri, 06 Aug 2021 07:00:19 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MRost0jyf
  RYNNuCYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePFjRssBW/4K1avfMfUwNjJ18XIxSEkMItJ
  Ysb9DewQzm5GiZv7ZrJ0MXJysAnoSpx7vJYdxBYR0JdYOnsPM4gtLOAjMf3udEYQm0VARWLXi
  wYwm1fAQ+J8yzSwGgkBBYkpD98zQ8QFJU7OfAI2k1lAVaL7yFMmCFteonnrbKAaDqB6RYnZ0+
  UhWiskXh++xDyBkXcWku5ZSLpnIelewMi8itEyqSgzPaMkNzEzR9fQwEDX0NBYF0iaGuolVuk
  m6qWW6ian5pUUJQJl9RLLi/WKK3OTc1L08lJLNjECAy+lkGH6DsY1bz7oHWKU5GBSEuVtPseT
  KMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCN+4OUE6wKDU9tSItMwcYBTBpCQ4eJRHerltAad7ig
  sTc4sx0iNQpRl2Odz8XL2IWYsnLz0uVEuflBJkhAFKUUZoHNwIWkZcYZaWEeRkZGBiEeApSi3
  IzS1DlXzGKczAqCfNOAFnFk5lXArfpFdARTEBHXIjlBDmiJBEhJdXAFDC/JDG+/WByyJfTbzR
  urXh5mal71fWHRV1C05ZtSmR+HDklIfTamfwNRs/stDVXnvil/fOC87+ZsapXuUIcUxkzd6wT
  nXrk0/rjB1o//ed4MtXBSIPV9IRYW/p8neqeOzozTFOvmB/b9cWpkmuxda6/89LpK6MWS57+/
  eZ14tUl1aLJPEo3TNe3Bt3hTBPgZ2tltWWNW/6D4fXs2tLrYjZcWe5/dQ7VZ+WoGKjv5kmw+p
  I9Vcep4ylfvpCk50X/6kU9klxn9ewvbON61eKwVHUbi3LYLZ4vuzo7+dftYHxuNzEpVMh7X/e
  B4J/FJo57j+bFZol9+TzdT1P7tfCxFRY5d6VkivpczogyBdQpsRRnJBpqMRcVJwIAE55CGkMD
  AAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-232.messagelabs.com!1628233217!778450!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30168 invoked from network); 6 Aug 2021 07:00:18 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-12.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 6 Aug 2021 07:00:18 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17670HPQ002086
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 6 Aug 2021 08:00:17 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 6 Aug 2021 08:00:15 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH]python3-ipython: upgrade 7.25.0 -> 7.26.0
Date: Fri, 6 Aug 2021 15:00:09 +0800
Message-ID: <1628233209-40351-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: quoted-printable

IPython 7.26 is a minor release that fixes a couple of issues, updates in API and Copyright/Licenses issues around various part of the codebase.

We=E2=80=99ll highlight this issue <https://github.com/ipython/ipython/issues/13039> pointing out we were including and refereeing to code from Stack Overflow which was CC-BY-SA, hence incompatible with the BSD license of IPython. This lead us to a rewriting of the corresponding logic which in our case was done in a more efficient way (in our case we were searching string prefixes instead of full strings).

You will notice also a number of documentation improvements and cleanup.
Of particular interest are the following Pull-requests:
The IPython directive now uses Sphinx logging for warnings. PR #13030.
Add expiry days option to pastebin magic and change http protocol to https. PR #13056
Make Ipython.utils.timing work with jupyterlite PR #13050.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-ipython_7.25.0.bb =3D> python3-ipython_7.26.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_7.25.0.bb =3D> python3-ipython_7.26.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_7.25.0.bb b/meta-python/recipes-devtools/python/python3-ipython_7.26.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-ipython_7.25.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_7.26.0.bb
index 5e5261fa51..4c1d4ebd70 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_7.25.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_7.26.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING.rst;md5=3D59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE =3D "ipython"
 
-SRC_URI[sha256sum] =3D "54bbd1fe3882457aaf28ae060a5ccdef97f212a741754e420028d4ec5c2291dc"
+SRC_URI[sha256sum] =3D "0cff04bb042800129348701f7bd68a430a844e8fb193979c08f6c99f28bb735e"
 
 RDEPENDS:${PN} =3D "\
     ${PYTHON_PN}-setuptools \
-- 
2.25.1

