Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28521C07E9D
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 09:35:53 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web08.8707.1664271342974140280
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 02:35:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uBbulf+3;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1664271341; i=@fujitsu.com;
	bh=lyeLBeDZUyL0Jg0ltYjtn/Q7VN08fgIlxEllwQCC9u4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=uBbulf+3/O4r1aZ99g9e29pfgvxrEPbosIoILMdwK8o4iwSvMrl8IOzss0Iw7dhnF
	 mmOqf1Pey7gKP4YSDM/AcLXCjT5F9P0+n/KDEUAtAwRYTaGTr9cwm5MISEFk9ZZ6db
	 zbLHXPxnnQsTrGgTnJk/uUu4XDUlAqdxkpALcB9/Osfpie2OwxmvTxAonw4klat0O0
	 w6NofE01rvUWHo0MZJS132U8XqCfDcaKCaj53uqo8Y8Y7DhyOHs0ehO52eT8huCch5
	 03/DQ4x6oasSC5QUprhW1h0dVTHFR/ALvzmCCLBPSEtRgmbkt2ZrJE28KbqAC56saG
	 XB4kaNdDu07zw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8MxSffNYaN
  kg1fbDCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oyN7/6zFxwWrNh38CBjA+Mu/i5GLg4hgSeM
  Erfvb2GDcK4zSTxftJ+xi5ETyDnAKLHzkj+IzSagK/Hix2IWEFtEQF9i6ew9zF2MHBzCAp4Sm
  zv5QMIsAqoSW1Y9ZAaxeQXcJfavfw1mSwgoSEx5+B4qLihxcuYTsDHMAhISB1+8ABsjIaAoMX
  u6PER5hUTj9ENMELaaxNVzm5gnMPLNQtI9C0n3AkamVYzWSUWZ6RkluYmZObqGBga6hoamusY
  WuoZG5nqJVbqJeqmluuWpxSW6RnqJ5cV6qcXFesWVuck5KXp5qSWbGIGhl1KsVr+D8cXKn3qH
  GCU5mJREee0XGSUL8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuBNPgSUEyxKTU+tSMvMAcYBTFqCg
  0dJhHcHSJq3uCAxtzgzHSJ1ilGXY+bXtgPMQix5+XmpUuK8pluAigRAijJK8+BGwGLyEqOslD
  AvIwMDgxBPQWpRbmYJqvwrRnEORiVhXiGQVTyZeSVwm14BHcEEdIQdnz7IESWJCCmpBibBtbr
  zVE8FmRzrPvT85+OvLxrXFLne2SGhqnhw0XJ2lQZddaurN3ed2/woX3jGtYVmy/53zvn8fPJp
  Q2uRCqnIxw8OPY50zQ6e/PBpc92mRw/X/HoRPouPSY69eMeU7yYJpbdFz3ts1LjLm2HoYWtyb
  EdQoqKcwZTj33hDxPzfa5WZF0w45/Mn4JCoXM7aZ5oN7oJbw69JfVdzrde8xR65elmhYqGUAf
  eaTXOPCifwP/qpyrjM2/3+zqwXcWK3JcvPVs4t3W4/YXWVfedhTfFbDjwNVy8aCR25abfV5sr
  O6utdCa/ex+Y2qSoYL68O3LZ3SsuL+jn6h94W1M9JP3jKQ8PmSdmKfx/ebvJa6+6ixFKckWio
  xVxUnAgAlmd09UQDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-571.messagelabs.com!1664271340!391705!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27611 invoked from network); 27 Sep 2022 09:35:40 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-12.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2022 09:35:40 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 7FAAD1000C1
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:35:40 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 72D7A100078
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:35:40 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 27 Sep 2022 10:35:36 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pyjwt: upgrade 2.4.0 -> 2.5.0
Date: Tue, 27 Sep 2022 17:35:22 +0800
Message-ID: <1664271322-2533-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Sep 2022 09:35:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98986

Changelog:
==========
 Bump actions/checkout from 2 to 3
 Bump codecov/codecov-action from 1 to 3
 Bump actions/setup-python from 2 to 3
 adding support for compressed payloads
 Revert "adding support for compressed payloads"
 Add to_jwk static method to ECAlgorithm
 Remove redundant wheel dep from pyproject.toml
 Adjust expected exceptions in option merging tests for PyPy3
 Do not fail when an unusable key occurs
 Fixes for pyright on strict mode
 Bump actions/setup-python from 3 to 4
 [pre-commit.ci] pre-commit autoupdate
 docs: fix simple typo, iinstance -> isinstance
 Expose get_algorithm_by_name as new method
 Remove support for python3.6
 [pre-commit.ci] pre-commit autoupdate
 Emit a deprecation warning for unsupported kwargs
 Fix typo: priot -> prior
 Fix for headers disorder issue
 Update audience typing
 Improve PyJWKSet error accuracy
 Add type hints to jwt/help.py and add missing types dependency
 Add cacheing functionality for JWK set
 [pre-commit.ci] pre-commit autoupdate
 Mypy as pre-commit check + api_jws typing
 [pre-commit.ci] pre-commit autoupdate
 Bump version to 2.5.0

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../python/{python3-pyjwt_2.4.0.bb => python3-pyjwt_2.5.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyjwt_2.4.0.bb => python3-pyjwt_2.5.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.4.0.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.5.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pyjwt_2.4.0.bb
rename to meta-python/recipes-devtools/python/python3-pyjwt_2.5.0.bb
index a540e36515..f587e5c0de 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.5.0.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://github.com/jpadilla/pyjwt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e4b56d2c9973d8cf54655555be06e551"
 
-SRC_URI[sha256sum] = "d42908208c699b3b973cbeb01a969ba6a96c821eefb1c5bfe4c390c01d67abba"
+SRC_URI[sha256sum] = "e77ab89480905d86998442ac5788f35333fa85f65047a534adc38edf3c88fc3b"
 
 PYPI_PACKAGE = "PyJWT"
 inherit pypi setuptools3
-- 
2.25.1


