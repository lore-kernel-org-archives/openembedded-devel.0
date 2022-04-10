Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A4DC38A2B
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:07 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.4013.1649840184513720303
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 01:56:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=EibnPaUp;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649840182; i=@fujitsu.com;
	bh=2cpDLInlIQhxy3q6nOb1pF4fp4Use2H0Fmxr1HTu7gE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=EibnPaUpvJTrCVpxu05TFXA0HbN2dsby5A+TfS0bU0LtKTA1KKDishpRpNhUTb4DB
	 6s60Px/TvlkyM6IX5Hke1mY1z0faB7vA5XYZt1gSxAp7O/2dp4QgxmjChOhudFP5bX
	 wHY/7tUsffBWIWjA96peiw1F2ETytLykZfftYJnrKM7BF9jlalYUtozRFICFrqqCbI
	 6gL6Grax1HqbVx4KdH5y16iQMoBUi1xPs7KA7z7/Ksnt/rgl4Gz5HALO5VoYwJfDeh
	 ypeanOC6APAWaxTqFoY/oCr/yXQlwjkkCFQ1OqIouFvVdgHNbQ36uAycBi9jNAEGL0
	 VROAwQs1jCy0w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MRoms2ISz
  J4OxnDouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaNptXhBE2fFt6c32RoYWzm6GLk4hARmM0lM
  2jKPEcLZwygxed4Opi5GTg42ATWJ6bdusILYIgL6Ektn72EGsZkFVCRe/O5hB7GFBewkZr5+w
  wZiswioSry4+AXI5uDgFXCSuL+FBSQsIaAgMeXhe7BWXgFBiZMzn7BAjJGQOPjiBTNEjaLE7M
  vNUPUVErNmtTFNYOSdhaRlFpKWBYxMqxitkooy0zNKchMzc3QNDQx0DQ1Ndc10Dc0s9RKrdBP
  1Ukt1y1OLS3QN9RLLi/VSi4v1iitzk3NS9PJSSzYxAgMspZht5Q7GlX0/9Q4xSnIwKYnyenSF
  JQnxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4D3QA5QTLEpNT61Iy8wBBjtMWoKDR0mE90UvUJq3u
  CAxtzgzHSJ1ilFRSpy3uR8oIQCSyCjNg2uDRdglRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSs
  K8c0Cm8GTmlcBNfwW0mAlo8bdVoSCLSxIRUlINTGptRu+yygKCFKc33Voidq34XO80/bBLTnc
  eb/2i/zwmxkKXq8b+ukH7nemZ5UnZm6Quf99dWBOof+YM6/xzF5LVOV1/Fp7tVy2tv+TfVzn3
  wPSi3edzVm148+leUMiLmxOffLH/Y+C3YerK5Jyf13Ut6kSO7HC5svnhvWgWQYYc97yNRhumT
  7xas26Gr0/R3AtPDN9eD7kRLXfqjJZmk5rcmfZ1t9NatTP+qfdZBD60M9uwOM+1X35rT2BL6d
  Pkrv587ZtxHHdZDr518NHxOuOUtGzpzomrPpgtYDzI0Gjk0ndq6fqJjiueZ1ts8OTbfzDp+YT
  z5nceqdb+e87EvmKOfnh67RzHQof53LflLiixFGckGmoxFxUnAgC6iKTlKwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-591.messagelabs.com!1649840181!148591!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9334 invoked from network); 13 Apr 2022 08:56:22 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-10.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Apr 2022 08:56:22 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23D8uJFw015656
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 09:56:21 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 13 Apr 2022 09:56:17 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] octave: upgrade 6.4.0 -> 7.1.0
Date: Sun, 10 Apr 2022 23:52:53 +0800
Message-ID: <1649605974-12443-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96613

Changelog from 6.4.0 to 7.1.0:
https://www.gnu.org/software/octave/news.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../octave/{octave_6.4.0.bb => octave_7.1.0.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/octave/{octave_6.4.0.bb => octave_7.1.0.bb} (93%)

diff --git a/meta-oe/recipes-devtools/octave/octave_6.4.0.bb b/meta-oe/recipes-devtools/octave/octave_7.1.0.bb
similarity index 93%
rename from meta-oe/recipes-devtools/octave/octave_6.4.0.bb
rename to meta-oe/recipes-devtools/octave/octave_7.1.0.bb
index a5b00ece8a..c9982a7bb2 100644
--- a/meta-oe/recipes-devtools/octave/octave_6.4.0.bb
+++ b/meta-oe/recipes-devtools/octave/octave_7.1.0.bb
@@ -32,7 +32,7 @@ SRC_URI = " \
     ${GNU_MIRROR}/octave/${BPN}-${PV}.tar.gz \
     file://fix-blas-library-integer-size.patch \
 "
-SRC_URI[sha256sum] = "b48f33d4fceaf394cfbea73a8c850000936d83a41739a24f7568b5b0a7b39acd"
+SRC_URI[sha256sum] = "d4a9d81f3f67b4a6e07cb7a80dcb10ad5e9176fcc30762c70a81580a64b8b0b6"
 
 # Note: Qt5Help is required for gui -> qttools(-native) must be build with
 # clang in PACKAGECONFIG
-- 
2.25.1


