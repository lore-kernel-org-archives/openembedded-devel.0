Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F8B4C7EE2D
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 08:10:01 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.85508.1677485395397076349
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 00:09:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NQmId2/R;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677485393; i=@fujitsu.com;
	bh=ZPvUpERQsMbSiyThgIG1m6gsjMu7B13MA5xAKDJyHvU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=NQmId2/RhPmJWOUyfmCCbPSLwxjTG5NY0XMZQYJFBWia92rARZ+FZuWMgCJ3DqQXk
	 evOYdWKu9dxMB2tGMRmoUNPBXlV1Jw29z+OpvekXmZBFzp2YLiZUujuhrm9DtykO2F
	 2IIInMLkcJlOzIC3FGx0/SF3ei5mi4nrM280LVY3dAZACNn5jsaYu9TDbnhVZXIHcO
	 8Cf32Zk9WilgbInbnbNWGtYux/IwOc/AO6Oe6oaV6F6qwvBXjwl73y5dfeJxTgsHqR
	 Hof3VTe9SgHgn/qlyh7H8EKikp8rW385ACsBXw5riBIuJVTf7e/cyPLuPntVTc3/Qt
	 hcndCYGnDm7ng==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORqBuY+if
  ZYMYUNouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePShq8sBZc4K14u3svUwPiRo4uRi0NI4Amj
  xMKmFhYI5waTRHffBzYIZy+jxPqeg0xdjJwcbAJSEjfu/2cDsUUE9CWWzt7DDGIzC6hIvPjdw
  w5iCwv4SGz8u5gVxGYRUJV42P8brJdXwEli1cYLYPUSAgoSUx6+B7M5BZwl3iyeBlYvBFTTcr
  +ZHaJeUOLkzCcsEPMlJA6+eAHVqygx+3IzC4RdKdH64ReUrSZx9dwm5gmMgrOQtM9C0r6AkWk
  Vo1lxalFZapGuuV5SUWZ6RkluYmaOXmKVbqJeaqluXn5RSYauoV5iebFeanGxXnFlbnJOil5e
  askmRmD4phSncu5gXNn3V+8QoyQHk5Io7yKnP8lCfEn5KZUZicUZ8UWlOanFhxhlODiUJHgPJ
  gHlBItS01Mr0jJzgLEEk5bg4FES4WU2AkrzFhck5hZnpkOkTjEqSonz8iUCJQRAEhmleXBtsP
  i9xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYNyoBaApPZl4J3PRXQIuZgBZvf/gDZHFJIkJ
  KqoGJK5JxpoyO880fFg+5FVLf7S+v8g578cr09cYQwyfVB4P1E/UcfftXHdy383fILzYp/ZJU
  +9+qWlyJ7VlfK0tVn6fMtf6whr15Ae8h+eDjH+TLgt7KdroxBF5ffr88Juri+z/Pp7cVttpFH
  it+aBF0bpV0muq0+ldnLFb+OvFjX7rY7mNf/mVfe6X6sMazdUlOevt6+1ih1hcJCyxFs6a5Hi
  rlXHzPR32q6My+Fsa2qpPSEc7T/YKVTOM0jzWeiVHecOVviJfF4feRy9ZNlAn4Uyq71+7klu6
  rlx85bmDffHp+d7upXeGft3d+cy5YrexQl3Fv6QyhOFuZjz/ltPsOaq0VKFwXp/lkQ6tZyyol
  luKMREMt5qLiRAB4hPMqWgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-728.messagelabs.com!1677485392!192616!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5330 invoked from network); 27 Feb 2023 08:09:53 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-14.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Feb 2023 08:09:53 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 7816F10018D
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:09:52 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 5DB2D100182
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:09:52 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Feb 2023 08:09:51 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-ipython: upgrade 8.9.0 -> 8.10.0
Date: Mon, 27 Feb 2023 16:09:38 +0800
Message-ID: <1677485381-11595-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677485381-11595-1-git-send-email-wangmy@fujitsu.com>
References: <1677485381-11595-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:10:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101279

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://ipython.readthedocs.io/en/stable/whatsnew/version8.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_8.9.0.bb => python3-ipython_8.10.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_8.9.0.bb => python3-ipython_8.10.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_8.9.0.bb b/meta-python/recipes-devtools/python/python3-ipython_8.10.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-ipython_8.9.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_8.10.0.bb
index fc5075bbf..d4b3012e4 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_8.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_8.10.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE = "ipython"
 
-SRC_URI[sha256sum] = "71618e82e6d59487bea059626e7c79fb4a5b760d1510d02fab1160db6fdfa1f7"
+SRC_URI[sha256sum] = "b13a1d6c1f5818bd388db53b7107d17454129a70de2b87481d555daede5eb49e"
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-setuptools \
-- 
2.34.1


