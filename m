Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0312CC433F5
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 03:42:41 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.6357.1648784559120108677
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 20:42:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=M90FrT/h;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648784557; i=@fujitsu.com;
	bh=Rp8XqgtXLym0jqqJ45ohvG4zZvhExVna1rh7/MyvnyA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=M90FrT/hpDWX1iDY9f/4EzNAczVi54qGqAga4ORddKtJLMZd4WoeFY+vTFtQoqfW/
	 Fcu2hueQvoc21cxPOL6TE2ICzuWKiJ22N/at7VnGZBcG+cbXhsY42kkd7tWK0WfJ1U
	 SY5Qju7pJNVVV5zovGyzhtAF13Fr8ILfyh7SA35MBuYgh6fLW38iM/L174OcI4QkXe
	 QxGBXOJ5LupFfZ41FLdRgMx/KLndlzuVazJKe2o/Mmsmb1V0ZL9azn3jTpaQPmbzEn
	 aCkDqit2vL/8t9yMuuHRZ4L3sQsVa9JHnUPB3iScS3emPsTAu3v0QVf8QFv1iJ7RUj
	 tU4tmDmWQuWOA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRWlGSWpSXmKPExsViZ8MxSXdNiVu
  SQdt8E4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPe6ciCe5wVnet3sjQwNnJ2MXJxCAk8YZT4
  8+QnG4RzgUni7K4DrBDOfkaJg+2TgRxODjYBXYkXPxazgNgiAvoSS2fvYQaxhQX8JO6fesMOY
  rMIqEj8vbkDrJ5XwEPi3LIjbCC2hICCxJSH75kh4oISJ2c+AZvDLCAhcfDFC6A4B1CNosTs6f
  IQ5RUSrw9fYoaw1SSuntvEPIGRbxaS7llIuhcwMq1itE4qykzPKMlNzMzRNTQw0DU0NNU1ttQ
  1MjDQS6zSTdRLLdUtTy0u0TXSSywv1kstLtYrrsxNzknRy0st2cQIDL6UYvUTOxifrvypd4hR
  koNJSZTX4ZBrkhBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3o4ctyQhwaLU9NSKtMwcYCTApCU4e
  JREeIOLgdK8xQWJucWZ6RCpU4yKUuK8kiAJAZBERmkeXBss+i4xykoJ8zIyMDAI8RSkFuVmlq
  DKv2IU52BUEuYtBZnCk5lXAjf9FdBiJqDF+jdcQRaXJCKkpBqYBI9tlGWWCH/dzL2Cd4HspcN
  M316X6ASFmi14z/xL7GMhs+HjHsNNMov5rvYLXHkmrPc8anfAe54+pXOH/H6V2b9/E5YcG5R/
  tn2u3Alfs6BlS772fp0yx7XDp9xcwCzfMGLdizynczlntjc/2fJhK9eiFvZ3M5QVp1ufnu/kc
  lsmrVjv+ZtqpZMM5zrCi/M5ni7zMHawb13Vnqd2+fAPfQMumSt/Yi4Y811YeztTSLyxaYOStY
  HDz7wrkXkPLnLN833r3T495+ShNJOAYBnRez+6tk26LeTr9/aFvOo+QYfQRvPPerX7dgcwrdD
  qr8w1kfJSbViYqSx6cLfsKqZ581tvuW2IkqudYSHSf0SJpTgj0VCLuag4EQC0dUbXOQMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-565.messagelabs.com!1648784556!240348!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 559 invoked from network); 1 Apr 2022 03:42:36 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Apr 2022 03:42:36 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 809B6100354
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  1 Apr 2022 04:42:36 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 73D831000F6
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  1 Apr 2022 04:42:36 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 1 Apr 2022 04:42:15 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-kiwisolver: upgrade 1.4.0 -> 1.4.2
Date: Fri, 1 Apr 2022 11:42:04 +0800
Message-ID: <1648784524-10262-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Apr 2022 03:42:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96315

Changelog:
=========
This allows to buil with setuptools >= 61.2

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...{python3-kiwisolver_1.4.0.bb => python3-kiwisolver_1.4.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-kiwisolver_1.4.0.bb => python3-kiwisolver_1.4.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.0.bb b/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-kiwisolver_1.4.0.bb
rename to meta-python/recipes-devtools/python/python3-kiwisolver_1.4.2.bb
index ab1ad717b4..48ff7df52d 100644
--- a/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/nucleic/kiwi"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f137eeae9cf8004d06830f6ab25b2d52"
 
-SRC_URI[sha256sum] = "7508b01e211178a85d21f1f87029846b77b2404a4c68cbd14748d4d4142fa3b8"
+SRC_URI[sha256sum] = "7f606d91b8a8816be476513a77fd30abe66227039bd6f8b406c348cb0247dcc9"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


