Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B96C43334
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 07:57:51 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web12.7772.1654761461851744644
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jun 2022 00:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pI0ofagD;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654761459; i=@fujitsu.com;
	bh=gjuvu5Uhr4l9sTKOn/fAyuZlEE43O++2wy5kzxQ6j/k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=pI0ofagDAXy2bPfqo1fca2bJck/bLSlF5j8/5p6dlRHNN9db2NxQEQOkod/Q5yAce
	 eLxmEVMd/V+zli/rckNxxAgAyZ8oFNe8+LtAMqOXuYGZHwRX2Ic3yKsXZ2HfRiP3cG
	 lsyV+6PpvLw4PmS4aE8dK2d3R2nq4V7Qa/CL/D+42gtY2A1MoVioyGTKT5lFpb4TJR
	 OkSz3Y1h22sI8Fh9cBsu5uES966lOJtwNadThVFJ9QI43phOzLgCgKNJX0EJ6yO6Cx
	 RdQnj0R28xoZdt+gzcZ6Pt9oZPvhwPfrT4G0gpa99y1sBC7tSZwnGiFDXFvxPo1bBM
	 9UUKGHUE9r+yg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8OxWffz8oV
  JBrPPc1lcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBlrzjxiLHjBWdFxcgpzA+NPji5GLg4hgUeM
  Eq+/zGbpYuQEcs4ySSzaJQ2R2M0osXbZa2aQBJuAmsT0WzdYQWwRAX2JpbP3gMWZBVQkXvzuY
  QexhQU8JRrWvGcDsVmA4g1LFoPZvAJOEvcf/QFbICGgIDHl4XuwXk4BZ4mTZ6exQyx2ktg06Q
  AjRL2gxMmZT1gg5ktIHHzxghmiV1Fi9uVmqDkVEjNmbGODsNUkrp7bxDyBUXAWkvZZSNoXMDK
  tYrROKspMzyjJTczM0TU0MNA1NDTVNbYAMi31Eqt0E/VSS3XLU4tLdI30EsuL9VKLi/WKK3OT
  c1L08lJLNjECwzilWC13B+OUlT/1DjFKcjApifKeXLgwSYgvKT+lMiOxOCO+qDQntfgQowwHh
  5IE71pgZAgJFqWmp1akZeYAYwomLcHBoyTCa7sMKM1bXJCYW5yZDpE6xajLMfNr2wFmIZa8/L
  xUKXHeGSAzBECKMkrz4EbA4vsSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFeHpApPJl5JXC
  bXgEdwQR0xK8rC0COKElESEk1MM15ZNAv/XHfqf6q2jnZwmuLVz747v34ykf/36fW7p3w0Nds
  ZlyN6Mmth88aT2ZtyirUDL7a9qnZe+bROelR7f5uC/VCfm2bKXBy3p8umXt928Ntf666n7Ml4
  Ffe+vy5EyRONb7i4+nsPdfP6Hxyd7L/ZYMZC5s67mQqtOfdq/jkZLVk6rkf8qLrVAWZzrz7fk
  VMcMZdwVX2TgcFLWUnOzqud2Zh+5k9/fR3i2fVDzKcXPveLlqxxzbvX9fxr+tOve7I+eYSqS9
  fzNu5gOvKE/fG/q020lUFMmk16zX7je0F12XybT2mtGt37XnByrpLL//tbN99OCLTclHG3Ekv
  Dtr1SfvEHs73X+vtoiN8sESJpTgj0VCLuag4EQBe5zOIagMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-571.messagelabs.com!1654761458!76309!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24649 invoked from network); 9 Jun 2022 07:57:39 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-17.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Jun 2022 07:57:39 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id AD8B72CA3
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  9 Jun 2022 08:57:38 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 8DAB6817
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  9 Jun 2022 08:57:38 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 9 Jun 2022 08:57:24 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-twine: upgrade 4.0.0 -> 4.0.1
Date: Thu, 9 Jun 2022 15:57:01 +0800
Message-ID: <1654761421-29641-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1654761421-29641-1-git-send-email-wangmy@fujitsu.com>
References: <1654761421-29641-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jun 2022 07:57:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97458

Bugfixes
==========
    Improve logging when keyring fails. (#890)
    Reconfgure root logger to show all log messages. (#896)


Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-twine_4.0.0.bb => python3-twine_4.0.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-twine_4.0.0.bb => python3-twine_4.0.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-twine_4.0.0.bb b/meta-python/recipes-devtools/python/python3-twine_4.0.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-twine_4.0.0.bb
rename to meta-python/recipes-devtools/python/python3-twine_4.0.1.bb
index 08252e837..0178dde73 100644
--- a/meta-python/recipes-devtools/python/python3-twine_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twine_4.0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://twine.readthedocs.io/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3d1106b253a8d50dd82a4202a045b4c"
 
-SRC_URI[sha256sum] = "817aa0c0bdc02a5ebe32051e168e23c71a0608334e624c793011f120dbbc05b7"
+SRC_URI[sha256sum] = "96b1cf12f7ae611a4a40b6ae8e9570215daff0611828f5fe1f37a16255ab24a0"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


