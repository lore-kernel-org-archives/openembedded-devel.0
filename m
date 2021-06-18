Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.5])
 by mx.groups.io with SMTP id smtpd.web09.2614.1623982730982265012
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Jun 2021 19:18:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=aeteHaF1;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.5, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623982728; i=@fujitsu.com;
	bh=6V1VzDBFRJVzQ/fla0mgFD4ckmbXCRGJ9J5GmEsycHM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=aeteHaF1qLTWfKh8Ns4+3RTclvLUWSiO+va1tm50IOvHLAiGHi7/wcCd5i8ao+zqm
	 DzOsG/yV9NShVXgAlVSe0tRTxfkw7JuX5pLQkfSL0KlGlNgo1Wj4Xn9KnuCk6vZhUs
	 HYpRL4LtnrXoKeZOpMgcQcHij2xeyGgQdh1WcLefP1FVzj7H+UVfxT+a0e59dPaDcO
	 Y1wHSx5+whL74e5w8GPea6gBWQ9RMOYVgWyT+fn3N7lKKdtmWshIQwPAJ2poo6XVD0
	 NlSA0nblZ5okMiaYGl/qPbPp8DrRKzZA1p66T1JOVasxKNMPdi5K58qgPMNuItw1iE
	 yIs1MZYw2vyug==
Received: from [100.113.3.92] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-central-1.aws.symcld.net id 91/62-16595-7820CC06; Fri, 18 Jun 2021 02:18:47 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYotvOdCb
  B4NtPTYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPHt2XMBbs5Ky4+OsPWwPiYo4uRi0NIYDaT
  xMJnD5kgnD2MEstOHmPsYuTkYBPQlTj3eC07iC0ioC+xdPYe5i5GDg5hAS+Ju48FQcIsAqoS7
  S9XsYLYvAIeEi+fPWUBsSUEFCSmPHzPDBEXlDg58wlYnFlAQuLgixdgYyQEFCVmT5eHKK+QmD
  FjG9sERp5ZSDpmIelYwMi0itEyqSgzPaMkNzEzR9fQwEDX0NBYF0gaG+glVukm6qWW6ian5pU
  UJQJl9RLLi/WKK3OTc1L08lJLNjECwyilkKFpB+O7Vx/0DjFKcjApifJavTydIMSXlJ9SmZFY
  nBFfVJqTWnyIUYaDQ0mCV+U/UE6wKDU9tSItMwcY0jBpCQ4eJRHeNwxnEoR4iwsSc4sz0yFSp
  xgVpcR5P4IkBEASGaV5cG2wOLrEKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZg3DWQKT2ZeCd
  z0V0CLmYAWtwmdAllckoiQkmpgmp4u9VilLIOFSfeR/66LGiJtXQKh3x9fTrb8oSErHBfMn/3
  AofiL8D6RlKNfvs88p+ojnzvfpbO5uKP68YPTb0JF+Sat2BT4XzLntX6E/yzJW2bvDv9oFI92
  Ptk2Y89BNR1jJYb/mb7J3Hbz7253XvNuy7TmSQ3F+o03rsZzdb8sjPj/2eSJ8IIfATuXHLE5H
  VZt0/2aP5Jt0WLnmNZpsWe5ovUeLs+Y3NhQpXR96W3917cMl56RruaQP6zjIrnycSET44Vjk9
  IOnck4cP1RVli6X8mkd5FtYtaHzz5d6/xi7u3kt4KKpVZ/VL7z1xXM/v76xYHsN6cLXkrJvuz
  01zXfu7mL/Zt/VPJBU5cFSizFGYmGWsxFxYkA38Nnzh4DAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-226.messagelabs.com!1623982727!2943!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21425 invoked from network); 18 Jun 2021 02:18:47 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-11.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Jun 2021 02:18:47 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15I2IkNw006051
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Jun 2021 03:18:46 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 18 Jun 2021 03:18:45 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-absl: upgrade 0.12.0 -> 0.13.0
Date: Fri, 18 Jun 2021 19:17:57 +0800
Message-ID: <1624015077-18514-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../python/{python3-absl_0.12.0.bb => python3-absl_0.13.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-absl_0.12.0.bb => python3-absl_0.13.0.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-absl_0.12.0.bb b/meta-python/recipes-devtools/python/python3-absl_0.13.0.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-absl_0.12.0.bb
rename to meta-python/recipes-devtools/python/python3-absl_0.13.0.bb
index 2ecf10caa1..2ebd358e5a 100644
--- a/meta-python/recipes-devtools/python/python3-absl_0.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-absl_0.13.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "cfc383e2c647698666a7c5d8ef83a675"
-SRC_URI[sha256sum] = "b44f68984a5ceb2607d135a615999b93924c771238a63920d17d3387b0d229d5"
+SRC_URI[md5sum] = "afb3ffb4b59d53575e8eb073c3a52803"
+SRC_URI[sha256sum] = "6953272383486044699fd0e9f00aad167a27e08ce19aae66c6c4b10e7e767793"
 
 PYPI_PACKAGE = "absl-py"
 
-- 
2.25.1

