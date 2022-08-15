Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADD78C00140
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 06:39:49 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.13658.1660545584863229650
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Aug 2022 23:39:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=iRXlYTYs;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660545582; i=@fujitsu.com;
	bh=gqY7UYZh/xTD0kCu8rEiMezyM60thgb6JKMsU1ZIqkE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=iRXlYTYsjIXQ5ilZaiYOQwBxGisFkFosjtTL3acxlrX0Om50wbh5i7WX1DLp7swg1
	 LzSEvXJOuc05KnaA/vFfPKVwJHg80xtH09LdGrRHavXM6o54Hcg1BBU+gjZoWV1da7
	 fleuJZp+0sG+IJ2VAwXFtSlRfDHHCET15iSZWfCVagsEbYf+XYDal1k+PMr+uwnXrv
	 NIxJX7Pze6d+g+MjlZOGpmLggLmo7/pltT9yMlyzrDW3qvJo2517RaGLHEcxEwzVbG
	 fdww1A8ydLIzYFwV6idiEmYtaKIpHG6Boj3SECoC9nePaQYgNykQDLb8LLgq/08CuS
	 7Sg4Jcc6Tu7DQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRWlGSWpSXmKPExsViZ8MxSVfv1c8
  kg569HBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8akhSeZC2ZyVFz/8IutgXEbexcjF4eQwBNG
  iXcdd1ggnOtMEt9uPGKCcPYwSvTeP8XWxcjJwSagJjH91g1WEFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAu8Svlk4WEJtFQFVi0aV5YPW8Ao4Sny9OAauREFCQmPLwPVgvp4CTxJzGRWDzhYBq5m
  75zg5RLyhxcuYTFoj5EhIHX7xghuhVlJh9uZkFwq6QmDFjGxuErSZx9dwm5gmMgrOQtM9C0r6
  AkWkVo01SUWZ6RkluYmaOrqGBga6hoamupbmuobGlXmKVbqJeaqluXn5RSYauoV5iebFeanGx
  XnFlbnJOil5easkmRmAopxQndu9gXL3vl94hRkkOJiVR3msXfyYJ8SXlp1RmJBZnxBeV5qQWH
  2KU4eBQkuAtfQ6UEyxKTU+tSMvMAcYVTFqCg0dJhLfvBVCat7ggMbc4Mx0idYpRl+PqlSt7mY
  VY8vLzUqXEeeueARUJgBRllObBjYDF+CVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrwPQFb
  xZOaVwG16BXQEE9ARene/gxxRkoiQkmpgevWnrrb2qokA285SrhNefHbymhpZm5j+OOs5TnnY
  sSrYqrc+ZsKWmaIV6X/EFO3y9i2oZbRRCus68vlu6MGyTbFHzVb7nXms9d+sn2VWzVJvZqlJR
  8X3Gh7c/vjwb/eXmm25s/Y6v5l9la/9UMex61d2nJ/6JXvmirpyk2tXnC9xCDPvmBndpd2o0N
  nXv3XN8msap/6YmfFbpupsbjm/cU9H+8yGLZUxizZufNCwcMXTC8oZjFf/H2DX6PWM222bs+D
  tYR77U4G+EUu53gc8/jJxk/P2FFXhRWJP4q7tV5k36aBf/gbhrPjJP19OiL+dpCCcEHhGo5bX
  5O/Bx3zt7l8Xfpn9bv3B81L5e/95n1FiKc5INNRiLipOBABoHahYbAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-745.messagelabs.com!1660545581!127127!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4400 invoked from network); 15 Aug 2022 06:39:42 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Aug 2022 06:39:42 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 8CEBB1000CE
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:39:41 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 808FF1000C2
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:39:41 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 15 Aug 2022 07:39:40 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] nlohmann-json: upgrade 3.10.5 -> 3.11.2
Date: Mon, 15 Aug 2022 14:39:20 +0800
Message-ID: <1660545563-1580-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1660545563-1580-1-git-send-email-wangmy@fujitsu.com>
References: <1660545563-1580-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Aug 2022 06:39:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98250

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{nlohmann-json_3.10.5.bb => nlohmann-json_3.11.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nlohmann-json/{nlohmann-json_3.10.5.bb => nlohmann-json_3.11.2.bb} (93%)

diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.5.bb b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb
similarity index 93%
rename from meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.5.bb
rename to meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb
index 0cf6fd36bc..502262820a 100644
--- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.5.bb
+++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb
@@ -9,7 +9,7 @@ CVE_PRODUCT = "json-for-modern-cpp"
 SRC_URI = "git://github.com/nlohmann/json.git;nobranch=1;protocol=https \
            "
 
-SRCREV = "4f8fba14066156b73f1189a2b8bd568bde5284c5"
+SRCREV = "bc889afb4c5bf1c0d8ee29ef35eaaf4c8bef8a5d"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


