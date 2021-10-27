Return-Path: <zangrc.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA03CC433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 05:24:31 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.116])
 by mx.groups.io with SMTP id smtpd.web09.7737.1635312270253490036
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 22:24:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=E4A+t1jv;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.116,
 mailfrom: zangrc.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1635312268; i=@fujitsu.com;
	bh=L+08I8uQrMJLWCijvhpBBYNxV3zuxWG/je+2rnS1FrM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=E4A+t1jvrq/3dQwHSM2CIUbB08MTUVmkbJagXJ4m/Io/Dhk4szb0CWoEont0DtOUK
	 SOfbHfgxvQo6a6J9nA5cIPYdi8AHJKLswGXSMdOZTaHTb3U49F7ATI797frGLWOPJu
	 4wTRUwD20N8Yn9gYsfwaM4pcmVbHayLSVjuQ7n5+gHEnAKkrsQEj0JIeMwBX6IUqyq
	 Avzy9QEJxpCODkirsHxpkmG29WmNEQ72XXygPtMw4FgOvSe4jcY2qm3IAze9/SxGjN
	 C8i2302+McP/azitAytewdHZKgNsKaImcoKmDSOAK2oxPAJEXTR1UynMfk05dAVovu
	 vr3UfSfeeJvbg==
Received: from [100.113.6.252] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-central-1.aws.symcld.net id F2/4B-25178-B82E8716;
 Wed, 27 Oct 2021 05:24:27 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MxVbf7UUW
  iQfssaYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePIrg0sBV+5Kg5c38PcwNjN1cXIxSEkMJtJ
  4vSU3ewQzglGiWOvXrJ0MXJysAnoSHS86AazRQT0JZbO3sMMYgsLeEpc/N/KBGKzCKhKfJk9g
  bGLkYODV8BDYu0xfZCwhICCxJSH78HKeQUEJU7OfAI2hllAQuLgixfMEDWKEtt3nmGBsCskXh
  ++xDyBkWcWkpZZSFoWMDKtYrRMKspMzyjJTczM0TU0MNA1NDTWNdU1MjHUS6zSTdJLLdVNTs0
  rKUoEyuollhfrFVfmJuek6OWllmxiBAZSSiHrxx2Mh15/0DvEKMnBpCTK67utIlGILyk/pTIj
  sTgjvqg0J7X4EKMMB4eSBG/SPaCcYFFqempFWmYOMKhh0hIcPEoivAYPgNK8xQWJucWZ6RCpU
  4y6HO9+Ll7ELMSSl5+XKiXOe+8mUJEASFFGaR7cCFiEXWKUlRLmZWRgYBDiKUgtys0sQZV/xS
  jOwagkzPsPZBVPZl4J3KZXQEcwAR3BrAR2REkiQkqqgcnerfjP++X2rDkHDiu68frlflgzm7/
  xS0qS5QXd7hNP5iW4zWhwOuo8r8/ycO0UNr/1Hl6Xjb+p+h/5XceUv+WZ4rt5jI8Yt4i0FUuW
  OkZvXrhDv+7ji5aevjId2fi4uoou+ZU3axwmSNQ9zBbw3i8zy9ng1ZZV+hZGzeV92wo1bW7LC
  s1Z8yXl7vqXlg5y9xv5D55n8HNmn35RKidej3+V5EKN0O5QI0sbhXPbKoI+TnM8MGuD8Sft+z
  p70tNYnvheCLnqmTyfRdyQJ9s65ZPyneOZr9U+JhxLfaBn/o+rQzPgh6RtxovPN5/vjf03sTx
  d8MnzCtXbbI8epC5UuO1W0PbRPUdycVxHxKZ9SizFGYmGWsxFxYkAHWtuqysDAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-16.tower-248.messagelabs.com!1635312267!630733!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32699 invoked from network); 27 Oct 2021 05:24:27 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-16.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Oct 2021 05:24:27 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 19R5OQ3A011829
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Oct 2021 06:24:27 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Wed, 27 Oct 2021 06:24:25 +0100
From: Zang Ruochen <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pyjwt: upgrade 2.2.0 -> 2.3.0
Date: Thu, 28 Oct 2021 01:24:21 +0800
Message-ID: <1635355461-112133-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Oct 2021 05:24:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93617

`v2.3.0 <https://github.com/jpadilla/pyjwt/compare/2.2.0...2.3.0>`__
Fixed
~~~~~
- Revert "Remove arbitrary kwargs." `#701 <https://github.com/jpadilla/pyjwt/pull/701>`__
Added
~~~~~
- Add exception chaining `#702 <https://github.com/jpadilla/pyjwt/pull/702>`__

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../python/{python3-pyjwt_2.2.0.bb => python3-pyjwt_2.3.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyjwt_2.2.0.bb => python3-pyjwt_2.3.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.2.0.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.3.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pyjwt_2.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pyjwt_2.3.0.bb
index 761d55d8e..19ba30780 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.3.0.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://github.com/jpadilla/pyjwt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=68626705a7b513ca8d5f44a3e200ed0c"
 
-SRC_URI[sha256sum] = "a0b9a3b4e5ca5517cac9f1a6e9cd30bf1aa80be74fcdf4e28eded582ecfcfbae"
+SRC_URI[sha256sum] = "b888b4d56f06f6dcd777210c334e69c737be74755d3e5e9ee3fe67dc18a0ee41"
 
 PYPI_PACKAGE = "PyJWT"
 inherit pypi setuptools3
-- 
2.25.1


