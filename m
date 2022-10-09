Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F92C433FE
	for <webhook@archiver.kernel.org>; Sun,  9 Oct 2022 00:37:36 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.9662.1665275842836355626
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Oct 2022 17:37:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YP3Wg1JT;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665275841; i=@fujitsu.com;
	bh=i/05zNJy+IFtBe9XBMz/H47XTaEyp0A6X46POxbJAnw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=YP3Wg1JTtv9b+TdOKyJB2f3/cvpndwVVBsctsJi81KLFSI/kqYqRVZEvCp4s1O9Cy
	 g/IWtXiJcChlUZJri5N31qSKZSHzhnxBTvdRG0xFW+kIuHh+xIOP3RBHczJ53V7UkZ
	 j2A7r0enoEuAruO4860pFertRY74UB+BLYOuCp05akm/YlrTaBf8ATYg5INZFywxNU
	 h744BiCEMV5n6Ru69e2NPwxEybv/7RUcfBNWSiVgtxUCGGeN2yIWMI/zeCTarKD7jP
	 Gw3eoVqZZqakjPg3OYijjpUDGtQL4LWSkSpA/I/Z+cGXRSDgPVEJtYqaXQZidMJRlI
	 fb/qelYXn9Ikg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8OxWfeAuFO
  ywayruhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bJg3tZCvazVZzqmcrewPiNtYuRi0NI4AGj
  xPsbK9kgnMtMElPmvmeHcHYzSpxd9A4ow8nBJqAmMf3WDVYQW0RAX2Lp7D3MIDazgIrEi9897
  CC2sECAxKdVX8FqWIDiTSvng9XwCjhJ/Gg9CFYjIaAgMeXhe7A4p4CzxMM1+8HqhYBq2nc9ZY
  eoF5Q4OfMJC8R8CYmDL14wQ/QqSsy+3MwCYVdIzJrVxgRhq0lcPbeJeQKj4Cwk7bOQtC9gZFr
  FaJ1UlJmeUZKbmJmja2hgoGtoaKprbKlrZGisl1ilm6iXWqpbnlpcomukl1herJdaXKxXXJmb
  nJOil5dasokRGMgpxepXdzBuXvVT7xCjJAeTkijv060OyUJ8SfkplRmJxRnxRaU5qcWHGGU4O
  JQkeJ3YnZKFBItS01Mr0jJzgFEFk5bg4FES4Q3755gsxFtckJhbnJkOkTrFqMsx82vbAWYhlr
  z8vFQpcd5YYaAZAiBFGaV5cCNgEX6JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvBwGgKTy
  ZeSVwm14BHcEEdITVQzuQI0oSEVJSDUxVqyI/TGwQ1w0TWfeqYnf0jr17MpyVrefwPFPfFvLz
  Z/u09W1npkuoZ8ySdPP68T1DpftbidDEvW7ruGeujGqSeD3hhditwF2Cr25NdFXYtrhJwZhzz
  caHF16F59XPq774u9zn3q5kkZsBe4WYdiw9bNaVPoslc74w93rpRSlSGRZlzY+ulC6tu157Z4
  m0h6p+jfRCsWn/jh4yD9ty/HPrtGiT/j8TF504fzymYNvWFjGvTa86FH9+3nwv5MuO+41V84S
  XPS5Z5DH70BxL1zzuyerbF5i6Ll/Cu0hepOpM6+5ZXOdkb0zRqnSb+yKQa75Pt/XB2MbzyX+V
  Dpqb5OtP4ij/f+jNnpnd62O/H7f/pMRSnJFoqMVcVJwIAKMkueFrAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-565.messagelabs.com!1665275840!119810!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7433 invoked from network); 9 Oct 2022 00:37:20 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-22.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Oct 2022 00:37:20 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 739817B
	for <openembedded-devel@lists.openembedded.org>;
 Sun,  9 Oct 2022 01:37:20 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 669807C
	for <openembedded-devel@lists.openembedded.org>;
 Sun,  9 Oct 2022 01:37:20 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sun, 9 Oct 2022 01:37:18 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] opencl-headers: upgrade 2022.09.23 ->
 2022.09.30
Date: Sun, 9 Oct 2022 08:36:56 +0800
Message-ID: <1665275818-29173-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1665275818-29173-1-git-send-email-wangmy@fujitsu.com>
References: <1665275818-29173-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Oct 2022 00:37:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99106

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-core/opencl/opencl-headers_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/opencl/opencl-headers_git.bb b/meta-oe/recipes-core/opencl/opencl-headers_git.bb
index 8ad7d9d10b..8bbee5cc25 100644
--- a/meta-oe/recipes-core/opencl/opencl-headers_git.bb
+++ b/meta-oe/recipes-core/opencl/opencl-headers_git.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SECTION = "base"
 
 S = "${WORKDIR}/git"
-PV = "2022.09.23"
-SRCREV = "5e2f8c66476bcf60eb8c2921807e34efb30294ee"
+PV = "2022.09.30"
+SRCREV = "a51354a85f41d203e755124ad51ae3425933df45"
 SRC_URI = "git://github.com/KhronosGroup/OpenCL-Headers.git;branch=main;protocol=https"
 
 do_configure[noexec] = "1"
-- 
2.25.1


