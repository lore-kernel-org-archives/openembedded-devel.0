Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 604D0C7EE2D
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:24:58 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.103897.1683541491476750364
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hc24ztht;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683541489; i=@fujitsu.com;
	bh=l0cHEMGTuLcdGxwxuCPBTqI6PwqfuNypkbTy4S62NpA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=hc24zthtg0suX1RK3L5Z27qHMMQIeE+exe0pTyBY083skm2B8a4Hm1hQiXtZ641zW
	 wV69YpTN/bxyi8aGkPwUcd4FUUdc71NGp7KtRZYogOwy0qDLXsEvOL7GHLkV59lpr7
	 6C2rseUfBHrd4Teis1XFJZULTkApYZh1hJg+gnw+j19YTe6fx3jUrugn0Q8C9pGitp
	 Gt10OJeGy6AbZWaJ/vZR45l0O2Cmvh6woZQm1Zp25ervGz6j4V8SnqsxBw7PTd8SvE
	 YMg5KvzJv5MLN/cqrcnG0RqScpbPziWI4MCcXU5MkLTh/zSA4WDqTVHZI1FfTQQEJ7
	 kdsgRqTM1ty4w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrELMWRWlGSWpSXmKPExsViZ8ORpPvxbES
  Kwd7ZwhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bPc4tYCvq4Kp7/WcjewLiEs4uRi0NIYCOj
  xIN1B9khnGlMEqebt7N2MXJysAlISEzfe5IdxBYR0JX4+GEuI4jNLKAiMWPyESYQW1jAV2L/q
  yNgcRYBVYm2v6uZQWxeASeJjdP+gfVKCChITHn4HizOKeAssbVvK1i9EFDNreZeZogaNYmr5z
  YxT2DkWcDIsIrRrDi1qCy1SNfQSC+pKDM9oyQ3MTNHL7FKN1EvtVS3PLW4RNdQL7G8WC+1uFi
  vuDI3OSdFLy+1ZBMjMChSilnu7mA8tOuv3iFGSQ4mJVFe04NhKUJ8SfkplRmJxRnxRaU5qcWH
  GGU4OJQkeF1OR6QICRalpqdWpGXmAAMUJi3BwaMkwit7BCjNW1yQmFucmQ6ROsWoKCXOu/UMU
  EIAJJFRmgfXBouKS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEedOAMSbEk5lXAjf9FdBiJq
  DF/pfDQRaXJCKkpBqYVCwutRy4veORnfn1lzu/rA49GO8ce0twrdXBq5u5rs3/8SRmGmOZ4b3
  fp/f0nZLyfb68ptaZkT3qt6Te/5nVfAdTtVTiYxhz112/YL4rcM2Eg6Y/q+tTNNjm/yu82n51
  8l5f6w8cBw6W3Q+fH5c3v1Y+vPqD7PGWZ66PrmUzsUs4F0W/4WLRvzrxnNph3aYHF9bsuMu5U
  n3NJtPEAw9d5+7ousW6YKPkfF6Z7IebF95bsHC73d5jWcmPe1UVj7S3fM2Zd8L+bpfYg88XL9
  5bsTvo62EX9R6N7i3ZCyoeBUdz3OCL2j+rW+H6n9P9xVyWD32f/gwWvucX/L9f/da6A6w+ctz
  Vzpsz++q2+m6R61BiKc5INNRiLipOBABd+OeZBQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-587.messagelabs.com!1683541489!499854!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13489 invoked from network); 8 May 2023 10:24:49 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-19.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:24:49 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id E59481D4;
	Mon,  8 May 2023 11:24:48 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 185C31D2;
	Mon,  8 May 2023 11:24:47 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-termcolor: upgrade 2.2.0 -> 2.3.0
Date: Mon,  8 May 2023 18:24:34 +0800
Message-Id: <1683541475-25799-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683541475-25799-1-git-send-email-wangmy@fujitsu.com>
References: <1683541475-25799-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:24:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102430

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Add no_color and force_color parameters to override env vars
Add support for Python 3.12

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-termcolor_2.2.0.bb => python3-termcolor_2.3.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-termcolor_2.2.0.bb => python3-termcolor_2.3.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-termcolor_2.2.0.bb b/meta-python/recipes-devtools/python/python3-termcolor_2.3.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-termcolor_2.2.0.bb
rename to meta-python/recipes-devtools/python/python3-termcolor_2.3.0.bb
index 05c39c2c53..bbaefc7ec2 100644
--- a/meta-python/recipes-devtools/python/python3-termcolor_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-termcolor_2.3.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=e5f5f7c9b280511f124dba5dda3d180e"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "dfc8ac3f350788f23b2947b3e6cfa5a53b630b612e6cd8965a015a776020b99a"
+SRC_URI[sha256sum] = "b5b08f68937f138fe92f6c089b99f1e2da0ae56c52b78bf7075fd95420fd9a5a"
 
 DEPENDS += " \
 	${PYTHON_PN}-toml-native \
-- 
2.34.1


