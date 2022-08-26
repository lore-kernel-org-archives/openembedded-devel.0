Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 121A2ECAAA3
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 02:51:53 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.32799.1661482306775713734
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 19:51:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=CYsXE9eP;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661482305; i=@fujitsu.com;
	bh=ZFXZfGUsRQ7HNPKUqbEs6guaF8YwECssGkTSFKnMsU0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=CYsXE9ePc188c8ApCzoLaKaUgivuc9YBCjCln2XahDXrJ9FSqWr8OaYCAhD6mu5P5
	 Wtoe8NXMTG+bhuAkMfKBX7y3YQRLQ8W1mEn25p8lQ7Y3Exgg95cUKoUtlOR1UklWLh
	 I5zkLbrfCZ11GEtkYvCXCb+nLd87cKXn99wEtO3cRnQCUzMINtrEXH2rOyE1LVfbJH
	 kWv4U3RaVWJU5pTF4a6dWEOC7MBhO95JY2Vu5c/FblY31GK14e/ZvZ+OSjg8Uab/fv
	 GkXbPZPwRes0OO9IuXXWBG2ulKF8qptvsZSlXj+H0jdXSEhA2XHVVL4D3k6Fp1ZeNP
	 vGH3CxpJ4+BQg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRWlGSWpSXmKPExsViZ8ORpGtpypF
  scHiZuMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnH+61OmgofcFRd6VBsYL3F1MXJxCAk8ZJS4
  vHkGYxcjJ5BzlUnixixRiMRBRom9X1ezgCTYBHQlXvxYDGaLCOhLLJ29hxnEFhYIkdiz5SMri
  M0ioCrRdeQ1E4jNK+AhsXP/L7ChEgIKElMevmeGiAtKnJz5BGwOs4CmROv23+wQtrxE89bZQD
  UcQPWKErOny0OYlRI3HqdCTFGTuHpuE/MERv5ZSAbNQjJoFpJBCxiZVzFaJxVlpmeU5CZm5ug
  aGhjoGhqa6hpbAClDvcQq3US91FLd8tTiEl0jvcTyYr3U4mK94src5JwUvbzUkk2MwEBNKVbL
  38H4d+VPvUOMkhxMSqK8+s/Yk4X4kvJTKjMSizPii0pzUosPMcpwcChJ8KqZcCQLCRalpqdWp
  GXmAKMGJi3BwaMkwistCpTmLS5IzC3OTIdInWJUlBLn/W8ElBAASWSU5sG1wSL1EqOslDAvIw
  MDgxBPQWpRbmYJqvwrRnEORiVh3lRDoCk8mXklcNNfAS1mAlostYEdZHFJIkJKqoEp94nOJfV
  rDYnBPpdcH6qn36h6sNC67eVixnmbzr+r31d+7fMW14zXac1fjz5WEbLcHWeReGVNd8A9bzmG
  0OqA6RW5q5UbzJzTP4o9OOW9+1RpelJ1k+51YXajCX76r6s2dzA3ua/Lbe5Wlp35bkX1tGVcb
  jqse03qsz7Ih734e4Pp+9pAFls/c+tC/vmimY0P4gXZ040vHz4W+vjtridSrO/Wrpi7SyTd/p
  W5VVG4hce6NY4bnB/4LJoZVvD1GMf0eb2Llsu2zJtpra5+u+hC94mXoSrSRn9X3lPZZntpVWR
  Cap0Kx911cRmLmLMELnyuvrT9Ssflmk0n3gU1ed03Y+65/6M72y87Y77I+kQlluKMREMt5qLi
  RABnJQFlTwMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-23.tower-571.messagelabs.com!1661482297!165844!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9467 invoked from network); 26 Aug 2022 02:51:37 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-23.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Aug 2022 02:51:37 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 1D1461AC
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 03:51:37 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 1197E1AB
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 03:51:37 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 26 Aug 2022 03:51:35 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-awesomeversion: Upgrade 22.6.0 ->
 22.8.0
Date: Fri, 26 Aug 2022 10:51:28 +0800
Message-ID: <1661482288-13218-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 02:51:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98452

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D
    =E2=9A=A0=EF=B8=8F Deprecate positional arguments
    Change devcontainer
    Do not allow find_first_match without ensure_strategy
    Warn instead of raise for missing ensure_strategy
    Correct spelling mistakes
    Handle KeyError
    _compare_versions takes AwesomeVersion not str

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...wesomeversion_22.6.0.bb =3D> python3-awesomeversion_22.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-awesomeversion_22.6.0.bb =3D> python3-awesomeversion_22.8.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-awesomeversion_22.6.0.bb b/meta-python/recipes-devtools/python/python3-awesomeversion_22.8.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-awesomeversion_22.6.0.bb
rename to meta-python/recipes-devtools/python/python3-awesomeversion_22.8.0.bb
index cadb6f502d..550a8c439b 100644
--- a/meta-python/recipes-devtools/python/python3-awesomeversion_22.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-awesomeversion_22.8.0.bb
@@ -4,7 +4,7 @@ SECTION =3D "devel/python"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENCE.md;md5=3D92622b5a8e216099be741d78328bae5d"
 
-SRC_URI[sha256sum] =3D "38f580bfacf1c06b674bcd0f68e0c445ebb03fcd3700c6a2c588fb9313308e0f"
+SRC_URI[sha256sum] =3D "0469a801faafb3a7a13c529edc977ea04c3bce825af9ebb602f58012bc487db5"
 
 RDEPENDS:${PN} +=3D "python3-profile python3-logging"
 
-- 
2.25.1


