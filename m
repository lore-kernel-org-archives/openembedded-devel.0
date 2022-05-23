Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F54CC433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 08:10:13 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web11.25207.1653293409996506365
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 01:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vpwtEBAp;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653293408; i=@fujitsu.com;
	bh=gmCWieB0nG79//l16uDCKBJ/m+FmsCHcP/flPvXVWlk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=vpwtEBAp1aokme58t3Pt2MGKqgIBPM/k5vZK/+PlKKyzfPt3LcFaCWAYffgmbQKAK
	 NTCszuJqJn4dBm8apYN2UM0MsQaKXn9DD4c0yMZ6HYlhvg+e+jZV7S7QSdCLihV27L
	 IrDFoCAIewBBoiTxE+m2GaHGqx5Zuvv5cc8+inXo47pqRr5e4n4+39aydp4Eq4EwLq
	 LoB1cb3W/313grr2CSyn+bBFhCZMX4v9auPKcaM04drP5NaVnLrKJAS8mYLHhvYhLm
	 wKklLwnnEJAsa3eItWJdWjzzD59RDdzlS/jL83WfFt9dCphVaoZ7nmno8nBlAXyzGu
	 pcPX8sPr12Ykg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRWlGSWpSXmKPExsViZ8ORpOvr2J1
  k0PRWzeLi4aXMDowe5zauYAxgjGLNzEvKr0hgzXj2+A5zwSH2ipe397E3MH5i62Lk4hASeMgo
  seHIW1YI5yyTROee7+wQzh5GiZnrHjJ3MXJysAmoSUy/dYMVxBYR0JdYOnsPWJxZQEXixe8ed
  hBbWCBA4trf9ywgNouAqsSSD5fBbF4BJ4lJX1aA1UsIKEhMefgezOYUcJb4uWsaWK8QUM2u9m
  OsEPWCEidnPmGBmC8hcfDFC6heRYnZl5tZIOwKiRkztrFB2GoSV89tYp7AKDgLSfssJO0LGJl
  WMVomFWWmZ5TkJmbm6BoaGOgaGprqGusaWuglVukm6qWW6panFpfoGuollhfrpRYX6xVX5ibn
  pOjlpZZsYgQGcUoxs9AOxvV9P/UOMUpyMCmJ8h61604S4kvKT6nMSCzOiC8qzUktPsQow8GhJ
  MHLZw+UEyxKTU+tSMvMAUYUTFqCg0dJhJfRASjNW1yQmFucmQ6ROsVozHF4wqW9zBw7t1zeyy
  zEkpeflyolzusIUioAUppRmgc3CBbplxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ89aDTOH
  JzCuB2/cK6BQmoFN6JTpBTilJREhJNTAxWkYfX+fUEzrFvaB519r70/q6TIzjblbeyju+66LH
  uuXbRUo27n1WbfSyhvt55ctDxq0a6fOKhd/Iyh35bJe8qbxVo1t3fadrufcEs1cvDtuVZe0KO
  PyaoTxN9MOq9wy7dH7mhJh8uq/bJHLcc1Xb3ea7RcfzVWMsml9v4rVhuKLS+F05uFxVScgjtv
  6cZeGbUHfjqSFFtzb6TbA1vCVdPV3/aKn7TUYRydknWMr3JXYwXuD7XLzAInH1JwvbTV5+Uwp
  nL69ccnQnv8eXqrV7uHNeqP7mX3jDWf5B+U7rZXmRaY7+Ly5oH/WuW8Z/fO4FluKvO05w9kve
  l4g+WSS09W68+vl513gMJxhcna3EUpyRaKjFXFScCAAwBgtpbwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-25.tower-585.messagelabs.com!1653293389!138053!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27835 invoked from network); 23 May 2022 08:09:49 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-25.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 May 2022 08:09:49 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 2EF50B59
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 09:09:49 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 2190FD71
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 09:09:49 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 23 May 2022 09:09:40 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] opencl-headers: upgrade 2022.01.04 ->
 2022.05.18
Date: Mon, 23 May 2022 16:09:24 +0800
Message-ID: <1653293366-31516-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1653293366-31516-1-git-send-email-wangmy@fujitsu.com>
References: <1653293366-31516-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 May 2022 08:10:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97229

Changelog:
Add cl_ext_image_from_buffer extension definition
(https://github.com/KhronosGroup/OpenCL-Headers/pull/196)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-core/opencl/opencl-headers_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/opencl/opencl-headers_git.bb b/meta-oe/recipes-core/opencl/opencl-headers_git.bb
index 5e8e6f07f..4ecb8fc7d 100644
--- a/meta-oe/recipes-core/opencl/opencl-headers_git.bb
+++ b/meta-oe/recipes-core/opencl/opencl-headers_git.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SECTION = "base"
 
 S = "${WORKDIR}/git"
-PV = "v2022.01.04+git${SRCPV}"
-SRCREV = "59ac4dc2f282286d8db83143686cfe37ec658b84"
+PV = "2022.05.18"
+SRCREV = "def8be9d35fda35492b72f54a94515f7df8d1e9f"
 SRC_URI = "git://github.com/KhronosGroup/OpenCL-Headers.git;branch=main;protocol=https"
 
 do_configure[noexec] = "1"
-- 
2.25.1


