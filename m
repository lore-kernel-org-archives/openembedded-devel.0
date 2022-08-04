Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2667DC25B06
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 05:47:53 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.1632.1659592070255875576
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Aug 2022 22:47:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xD34JhyL;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659592068; i=@fujitsu.com;
	bh=0LfYk1dWgIRBB6t4CB4vouEmg+hEVM2+P74woGXAY+M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=xD34JhyLoB8ZyZ5g7mlt/2wWq/ufDfJVmqrknKzr8iX9ACeLinpYqsR7T/OBNeSwr
	 H00D+kd5OB2khKTXyiAElrbRpDK/UP9f7kReMOqB4UvoW1av4F16zQ7MAntIFo4v2Q
	 8XpZkXVJDd9ii/fiAmz6St2fIi5gTqSVaK2FSfric3bBMvFKahx346f/hQzn+ide9H
	 IOBx5ZZZEsdaruq5aU25NGsFpPPACIZhLwVU/EOgfkK/ISy2aJye090bWwBoNd04FE
	 iznolGFCsJbuC12YtsoboTI57XbEPQoYVnoErtsi+bku42OR9TPQhhGvAeRfgmzHqP
	 bEjCkbwUUASGQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORqNsS+zr
  J4PgsFouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPBtn62gs/cFe2zEhoYr3B1MXJxCAk8YZR4
  cW0BO4RznUli8aW/TBDOCUaJqbdXs3YxcnKwCahLPL75mhHEFhHQl1g6ew8ziM0soCrRfXENO
  4gtLOAv0bp+HhuIzSKgIvHv5kGgXg4OXgE3iUvNBSBhCQEFiSkP34O1cgq4S/RNm8MCYgsBlR
  zpagIbzysgKHFy5hMWiPESEgdfvGCG6FWSOLHiIxOEXSHx+vAlqLiaxNVzm5gnMArOQtI+C0n
  7AkamVYzWSUWZ6RkluYmZObqGBga6hoamusYmukaGFnqJVbqJeqmluuWpxSW6RnqJ5cV6qcXF
  esWVuck5KXp5qSWbGIFBnFKsdGsH44ZVP/UOMUpyMCmJ8rZHvU4S4kvKT6nMSCzOiC8qzUktP
  sQow8GhJMFbEA2UEyxKTU+tSMvMAUYUTFqCg0dJhPdBBFCat7ggMbc4Mx0idYpRl2Pm17YDzE
  Isefl5qVLivJExQEUCIEUZpXlwI2DRfYlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO8lkCt
  5MvNK4Da9AjqCCegIHa4XIEeUJCKkpBqY6u0OSDZ0Mx2I/cTKd6NjV8zmE1P7z707YnL7QX6s
  cfC9TdY+S2dcP3WfZ8F+sUPsa2T298+dkCXD87g5fGa7BFP8wYP5xaU5rgc0/ITs1i7SWvZxb
  YuaDtvhNhPhAK+bQbGLbjaFnU531Fb/6HiHLaqGK9t2gZtx1ITzaxsMLmneFC2pfSaseyR/2e
  m621t91EvtT775f/m7kp0XGxv35K1srhXy9wPD8t0UOaJlprrs2dHEd/No/kF3uxxunlLvX3L
  MX1i4vMydCjY0xUTufzrh3u7lHo7nZ107eOBOyc2LbySWSSlJ5s5Zv2K2bK+MZPqHLe+zG/h/
  NKt5B0hsP/KiqWjDpcvpem1fDl9TYinOSDTUYi4qTgQA8toXUGkDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-18.tower-565.messagelabs.com!1659592067!457596!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8409 invoked from network); 4 Aug 2022 05:47:48 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-18.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 4 Aug 2022 05:47:48 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id C0608100191
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  4 Aug 2022 06:47:47 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id B47F6100190
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  4 Aug 2022 06:47:47 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 4 Aug 2022 06:47:45 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pycodestyle: upgrade 2.8.0 ->
 2.9.0
Date: Thu, 4 Aug 2022 13:48:49 +0800
Message-ID: <1659592133-4137-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1659592133-4137-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1659592133-4137-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Aug 2022 05:47:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98125

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
==========
    E221, E222, E223, E224: add support for := operator. PR #1032.
    Drop python 2.7 / 3.5.
    E262: consider non-breaking spaces (\xa0) as whitespace. PR #1035.
    Improve performance of _is_binary_operator. PR #1052.
    E275: requires whitespace around keywords. PR #1063.
    Add support for python 3.11. PR #1070.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...ython3-pycodestyle_2.8.0.bb => python3-pycodestyle_2.9.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pycodestyle_2.8.0.bb => python3-pycodestyle_2.9.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pycodestyle_2.8.0.bb b/meta-python/recipes-devtools/python/python3-pycodestyle_2.9.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pycodestyle_2.8.0.bb
rename to meta-python/recipes-devtools/python/python3-pycodestyle_2.9.0.bb
index 31720e2aab..b383828f0f 100644
--- a/meta-python/recipes-devtools/python/python3-pycodestyle_2.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pycodestyle_2.9.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a8546d0e77f416fb05a26acd89c8b3bd"
 
-SRC_URI[sha256sum] = "eddd5847ef438ea1c7870ca7eb78a9d47ce0cdb4851a5523949f2601d0cbbe7f"
+SRC_URI[sha256sum] = "beaba44501f89d785be791c9462553f06958a221d166c64e1f107320f839acc2"
 
 inherit pypi setuptools3
 
-- 
2.25.1


