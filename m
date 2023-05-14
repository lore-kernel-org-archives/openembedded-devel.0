Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA8BAC77B7D
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 13:06:45 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.66069.1684069603090916185
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 May 2023 06:06:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kLNo4pyR;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1684069604; i=@fujitsu.com;
	bh=u8/YwPSgLutoUOjBGmQv1CigmB6orGIrIb0mRrVARAE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=kLNo4pyR0SPJZpTxmp5Gge86ACKMb0837i7p3JkuWJdJEupii9z79h4YdIAi1aZ0y
	 /EXRvDN0t8h5xE8KolOfwC45umDHHsDYFHzQSO4EjNQR9bFlNq841FZf6rB6DYAlt6
	 6R8pl4q4agCyqkQVIV3ez8oHv4b6euJfNr5UslRdPaNPy0ePFIeID3BZbIpFJalXwm
	 EXqFrxJKUeXKYwJyPCXVD4KR+zLvEoVLjuQLvTMVHPCWf2JzZaeWfo+qN8r/j35ZiE
	 zGdkIwxDUTSs05HxnQBF3opkW+TRtvo2JTjWLlP1UlUDpY3hsLX8K3Y9KYrQ/HwbmO
	 A+JgrjDlC2hVQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrALMWRWlGSWpSXmKPExsViZ8ORpPv4TkK
  KwbJ5AhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b5zh+MBb2cFY8n/2VqYNzC0cXIxSEksJFR
  YufLFewQzjQmiS//DrN0MXJysAlISEzfe5IdxBYR0JX4+GEuI4jNLKAiMWPyESYQW1ggQGLL3
  m9ANRwcLAKqEhO/CIGEeQWcJE6cnM4GYksIKEhMefieGcTmFHCW2PjhPdgYIaCaJTfWsEPUqE
  lcPbeJeQIjzwJGhlWMpsWpRWWpRbrmeklFmekZJbmJmTl6iVW6iXqppbrlqcUlukZ6ieXFeqn
  FxXrFlbnJOSl6eaklmxiBAZFSrNSzg/Hfzr96hxglOZiURHmvlcSlCPEl5adUZiQWZ8QXleak
  Fh9ilOHgUJLg1bmZkCIkWJSanlqRlpkDDE6YtAQHj5IIb9xVoDRvcUFibnFmOkTqFKOilDjvA
  ZA+AZBERmkeXBssIi4xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEubluQE0hSczrwRu+iugxU
  xAi2/tiQdZXJKIkJJqYDpq3m7ImKNt6m0jwFL181j254VBPHYPn8j3vLlTFrbH1bU4cOsr7Vj
  vONeT3pJelj1+K25asphvWfVIg7PHvJh5yZSGWpGOIMuAUx3PIt2uh1rYbuAw4t9bbdj5Ym7o
  fPHLT3Y//WoUlcqZnbR09hdHbp2Ju5MFzimFcFR86fIvPRp2Tjp3kTwj27um5V2pB4ocNunsj
  l7CdOa+4ep1VU6KWXOUXk3WOX1Xc49CVUnhvVX7b/a/+6OjtPD/dMYAiek7RR0fcypKSy08uM
  U975HKiRuaTBvMpyvOskrkm/LQ+uLuw+zSAleD5KK7y31MbvgzvfOW+XbxtkqgFzOPcfqlHVF
  Rr3SWFJQ7SmYosRRnJBpqMRcVJwIArodNBgMDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-571.messagelabs.com!1684069603!468090!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23239 invoked from network); 14 May 2023 13:06:43 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-21.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 May 2023 13:06:43 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 031EC1AE;
	Sun, 14 May 2023 14:06:43 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 28CD31AC;
	Sun, 14 May 2023 14:06:41 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymisp: upgrade 2.4.170.2 -> 2.4.171
Date: Sun, 14 May 2023 21:06:21 +0800
Message-Id: <1684069583-12337-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684069583-12337-1-git-send-email-wangmy@fujitsu.com>
References: <1684069583-12337-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 May 2023 13:06:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102578

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.4.170.2.bb => python3-pymisp_2.4.171.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.170.2.bb => python3-pymisp_2.4.171.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.170.2.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.171.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.170.2.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.171.bb
index 36191d5a64..d2d9ed1fd0 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.170.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.171.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
 SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
-SRCREV = "6a777aaf31e39cb01be1958b13355753d52f33de"
+SRCREV = "5c56fccfafa9ef335b9300499d12633368889f55"
 S = "${WORKDIR}/git"
 
 inherit python_poetry_core
-- 
2.34.1


