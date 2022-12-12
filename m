Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8498DC4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:39:18 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.37738.1670830748398984620
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Dec 2022 23:39:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WusDP/5n;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670830753; i=@fujitsu.com;
	bh=/0rBRTJeghviHs9McdvoSBS2ivPc7F202jbeJZTCjuc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=WusDP/5nmvzIuSnlEi/UpUcI5gaYiKR6PUtFThLEFs7rgR5WIF/rIQVlMGiKe5r7q
	 znNY40XMTjZeQA5l/6BM5GQrSQwpk9/j0t0MKiURxoeHbowNP0tJs9uMHygjKm6/II
	 n1dqD2ltg4Rkc7tLp/EdeezXLTulK2ssboWsFytXlo2oXzwwt0fiiCtcgmHij/bNsm
	 2CTHJS52o/szEExOjXbqrWOelTzMS11tCPW58QwfOfUkqjIXkB3gkbQMmq4HMany/R
	 X3x4C1GXSIRfVSrJklCiMBtpWQ1cyOU2g3xubbZJzF2e2gnlnc0O+7zD3cchCYhwA/
	 5IJr20ckqv3Tw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRWlGSWpSXmKPExsViZ8MxSXfhrWn
  JBos6BCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oz9U/+xFfRyV+zatYq9gXEiVxcjF4eQwBNG
  iU/XGxghnOtMEtfPfmSGcPYwSkyfsY2pi5GTg01ASuLG/f9sILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGGBAImpmxeC1bAIqEos33qYFcTmFXCUeDZzKVhcQkBBYsrD92C9nAJOEg+bf4H1CgHVfJ
  /ZxAJRLyhxcuYTFoj5EhIHX7xghuhVlJh9uZkFwq6QmDWrjQnCVpO4em4T8wRGwVlI2mchaV/
  AyLSK0bw4tagstUjX0FgvqSgzPaMkNzEzRy+xSjdRL7VUNy+/qCRD11AvsbxYL7W4WK+4Mjc5
  J0UvL7VkEyMwgFOKUyV2MDYs/6N3iFGSg0lJlLfyyrRkIb6k/JTKjMTijPii0pzU4kOMMhwcS
  hK8B28C5QSLUtNTK9Iyc4DRBJOW4OBREuFVAUaUEG9xQWJucWY6ROoUoy7HzK9tB5iFWPLy81
  KlxHmFQWYIgBRllObBjYBF9iVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwry8IKt4MvNK4Da
  9AjqCCeiIqJdTQY4oSURISTUwOR/X8jwuUMa+uWxt5LZnB1046uXel8zPuKrkeott3tM1oW8F
  V75rvNm/TLx1v+Vjmfj0DSHfNs7vmFHv07Tm0BTbDdH3eMIcs06rPdt00zd06uHpJS0Xg48LV
  8oyrpYQYj7R+jgm50nZ/Z/zBMxv/stu8K54ky7/d23okctMmYcuJUskfd27oTZ6Rlf2w12Vq1
  UvCl7JTlk+XeCl/7Qz4WfPTE1bsFtsv1ngTeafl9Xs1/mf/2Eeeff2/3/zbgh+vnxx8oRZvef
  Lwlq1VhXnnzfzESwIayxoSGliztQNFNkivuF5ysEPvJeXLzzV5NtYpfy6ZyvHgS8MzvzyEXXp
  q75F7C07utlYoD6ds73WXYmlOCPRUIu5qDgRAI6S5+NnAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-732.messagelabs.com!1670830752!223330!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28474 invoked from network); 12 Dec 2022 07:39:13 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-21.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Dec 2022 07:39:13 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id AF64D1000D5
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:39:12 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A263E1000D2
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:39:12 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 12 Dec 2022 07:39:11 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pytest-xdist: upgrade 3.0.2 -> 3.1.0
Date: Mon, 12 Dec 2022 15:38:36 +0800
Message-ID: <1670830717-3138-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670830717-3138-1-git-send-email-wangmy@fujitsu.com>
References: <1670830717-3138-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100053

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========

Features
---------
    #789: Users can now set a default distribution mode in their configuration file:

Removals
--------
    #842: Python 3.6 is no longer supported.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-pytest-xdist_3.0.2.bb => python3-pytest-xdist_3.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-xdist_3.0.2.bb => python3-pytest-xdist_3.1.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-xdist_3.0.2.bb b/meta-python/recipes-devtools/python/python3-pytest-xdist_3.1.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pytest-xdist_3.0.2.bb
rename to meta-python/recipes-devtools/python/python3-pytest-xdist_3.1.0.bb
index 402490571..1651ec34b 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-xdist_3.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-xdist_3.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pytest-dev/pytest-xdist"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=772fcdaca14b378878d05c7d857e6c3e"
 
-SRC_URI[sha256sum] = "688da9b814370e891ba5de650c9327d1a9d861721a524eb917e620eec3e90291"
+SRC_URI[sha256sum] = "40fdb8f3544921c5dfcd486ac080ce22870e71d82ced6d2e78fa97c2addd480c"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


