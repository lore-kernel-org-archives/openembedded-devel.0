Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B2FC4332F
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 10:25:23 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.8505.1644488722257926789
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Feb 2022 02:25:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=svMouGUo;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644488720; i=@fujitsu.com;
	bh=1Qs4/dsJGknFTcHv2LTLIOgMKI7c/xwTz8Nynm/sdyM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=svMouGUoY3s4IfeXhcmdsu4hxGBHLFdST4BEbM5bcqfLQaVSPH/vAWwvLvCtrs8Hm
	 b/MSPXbF4nU2lLmhAaOcF/lBfEkQnwkv2EtvinzpEI6+05+sEeRG1B1xci6oLS4A3k
	 ePnZp6AWfQrzA5J9r1c7BO1J5AgoK2Yng4WmAB/40oC7pVq6Ei/z7PwH1Neu+wqerE
	 JCFNBdAWv994iLbH3CTtqAr/pzw2r2/niFrdpPEt8/1A/tGMu+aZ3I9D/SBhiupcKX
	 V8B10kqE40qJ+xDgQuNcrVr31tjdriJQrsAOfr5FF34VKaJpMBk3cg/6bXVGC9aviC
	 M3Aj2kd3RipPQ==
Received: from [100.115.70.56] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 25/5E-30582-018E4026; Thu, 10 Feb 2022 10:25:20 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRWlGSWpSXmKPExsViZ8MxSZfjBUu
  SwcsORYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPbgk8sBS/5Ku7t2snewLiet4uRi0NI4Amj
  xJUth9ggnAtMEptProJyTjJKnP0+l7GLkZODTUBd4vHN12C2iIC+xNLZe5hBbGYBVYnui2vYQ
  WxhgQiJ5zsbmUBsFqD49pbrYHFeATeJRbvXg9VLCChITHn4HszmFHCXmPv2HxuILQRU83jbVz
  aIekGJkzOfsEDMl5A4+OIFVK+SxIkVH5kg7AqJ14cvQcXVJK6e28Q8gVFwFpL2WUjaFzAyrWK
  0SyrKTM8oyU3MzNE1NDDQNTQ01TUz1TW0MNJLrNJN1Est1U1OzSspSgRK6yWWF+ulFhfrFVfm
  Juek6OWllmxiBIZzSrHjth2Mp/p+6h1ilORgUhLlDTrHkiTEl5SfUpmRWJwRX1Sak1p8iFGGg
  0NJgnfeBaCcYFFqempFWmYOMLZg0hIcPEoivK9vA6V5iwsSc4sz0yFSpxgVpcR5tz4DSgiAJD
  JK8+DaYPF8iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5IwrwzIFJ7MvBK46a+AFjMBLd42nQl
  kcUkiQkqqgcmA6dDJLUmvlLYun2t3bUF4gpG09cOtnbLT/YVMf5Y/55zRoJpTuywoT3bfevV7
  P+RVT8+sKJmy8JK1W5RebLHhwubi+uCuPL6t63Pf3V15z+FBUbffxZlOUtdDPr4uz/v0fN9z1
  oRDvsy9kUltMh5/Z3Af/5Bz/hyTylvGgDDO6ImPv89wq5qZL56a+rh+9gYrnRv//N0iry4yUT
  bJWZtuEK5X/Fp6ZmnWL5/PJ1JmiPnluGa9C/la9erTgZ6vlsZPHp+8XFyzJHzzT6WXFW/v5qU
  +WLtxlpz85AtpXfMXHZKfbFdofP7Un4IPk6qPWG+pt/fPkZ177NB5y90ecftqq67Zznmpf1n0
  re2U8z1KLMUZiYZazEXFiQB5ruU7YgMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-15.tower-528.messagelabs.com!1644488712!14075!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9747 invoked from network); 10 Feb 2022 10:25:12 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Feb 2022 10:25:12 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 1085E10045F
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Feb 2022 10:25:12 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 0407E100457
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Feb 2022 10:25:12 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Thu, 10 Feb 2022 10:25:08 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 3/5] [oe] [meta-python] [PATCH] python3-oauthlib: upgrade
 3.1.1 -> 3.2.0
Date: Thu, 10 Feb 2022 18:25:37 +0800
Message-ID: <1644488739-3593-3-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1644488739-3593-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1644488739-3593-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Feb 2022 10:25:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95282

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:
===============================================================================

OAuth2.0 Client:
Add Device Authorization Flow for Web Application
Add PKCE support for Client
Fallback to none in case of wrong expires_at format.

OAuth2.0 Provider:
Add support for CORS to metadata endpoint.
Add support for CORS to token endpoint.
Remove comma after Bearer in WWW-Authenticate

OAuth2.0 Provider - OIDC:
Call save_token in Hybrid code flow
OIDC add support of refreshing ID Tokens with refresh_id_token
The RefreshTokenGrant modifiers now take the same arguments as the
AuthorizationCodeGrant modifiers (token, token_handler, request).

General:
Added Python 3.9, 3.10, 3.11
Improve Travis & Coverage

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-oauthlib_3.1.1.bb => python3-oauthlib_3.2.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-oauthlib_3.1.1.bb => python3-oauthlib_3.2.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-oauthlib_3.1.1.bb b/meta-python/recipes-devtools/python/python3-oauthlib_3.2.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-oauthlib_3.1.1.bb
rename to meta-python/recipes-devtools/python/python3-oauthlib_3.2.0.bb
index c2ec856fdb..3e5d957c4e 100644
--- a/meta-python/recipes-devtools/python/python3-oauthlib_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-oauthlib_3.2.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/idan/oauthlib"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=abd2675e944a2011aed7e505290ba482"
 
-SRC_URI[sha256sum] = "8f0215fcc533dd8dd1bee6f4c412d4f0cd7297307d43ac61666389e3bc3198a3"
+SRC_URI[sha256sum] = "23a8208d75b902797ea29fd31fa80a15ed9dc2c6c16fe73f5d346f83f6fa27a2"
 
 inherit pypi setuptools3
 
-- 
2.25.1


