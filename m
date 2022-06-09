Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08232C43334
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 07:20:11 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.7743.1654759201430465323
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jun 2022 00:20:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YsNOquFf;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654759199; i=@fujitsu.com;
	bh=gto879lHeMbY0GTKKYmulM/Y81Jdz24AFchxVWknoso=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=YsNOquFf4YTLLKA64J2PkW+MR9loSgXnCuq5IjtadxNmN6G0Kn51/seDhiQh/JpjT
	 8vmkCuOdpen66JPbcQggPUFG6V6XoAkb5fmHn0FXpcOBhpvQj+nLEyKz4H5M4G5QiE
	 doBFAzi/MeM/1qndC99x4OXxILKGijJQyyPwyOwZAow1WXBofGEjnxZXP0dRK68NpK
	 3yxuWNQJGg/4FQQixOBQttpjMCsu34Q63OLSljnWU0SbAQiYw6+eONv7CKUOPFd5AL
	 JW91g3zNg/wAFAE9ZwOF5j/bRqCGOrg1DLg8169o21fod8/vdCtYr888tvbaCre0tR
	 fzel4jCftqFkQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8ORpCs/f2G
  SwZOdbBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bXpYvYCk5xVUz/3cvUwHiKs4uRi0NI4CGj
  xJxDh9i7GDmBnLNMEv/vc0Ak9jNK/J+9mBkkwSagK/Hix2IWEFtEQF9i6ew9YHFhAW+JjW8Os
  IHYLAIqEr1L57GC2LwCHhILX70Bi0sIKEhMefieGSIuKHFy5hOwOcwCEhIHX7wAinMA1ShKzJ
  4uD1FeIfH68CVmCFtN4uq5TcwTGPlmIemehaR7ASPTKkabpKLM9IyS3MTMHF1DAwNdQ0NTIG2
  sa2Gil1ilm6iXWqqbl19UkqFrqJdYXqyXWlysV1yZm5yTopeXWrKJERh+KcXpITsYz+z7pXeI
  UZKDSUmU91zqwiQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErx7ZwHlBItS01Mr0jJzgLEAk5bg4
  FES4b06ByjNW1yQmFucmQ6ROsWoyzHza9sBZiGWvPy8VClx3nVzgYoEQIoySvPgRsDi8hKjrJ
  QwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd6lIFN4MvNK4Da9AjqCCeiIX1cWgBxRkoiQkmpgavu
  /+uNi2avn/X7L3mB6skT7rN6247ITznK5HVDftGRVaRfznK2+QteXC9/IvDWDi32baw+r6bJt
  i5zWrjhbqHfQ7GvWXyGGvTu6y13j58xff1rA9Ig+Wz3Ppuk1z3RsU8Pmxrw+ePb/3rgXC+Uu2
  syuiT5y6r649b+Ylam7z36aNf+31JGG1QtKNv05uOKxUdLaxB/sHBO3HZ5yIGTrDqXX80Rca3
  4t3id3v6lC0vr3IQFG5nOfxD877v6pxNU46/Ef/6eTy0N9jKZNFfiQ9OrLOuuuph9RW7tKVDm
  VuqT2Bp3/1pIdNFsjNerW1BjdK1X30qSf9T1Z0GrguEKvf5WndOO6P8fmr1qQr1YwW5BXiaU4
  I9FQi7moOBEAi6LZCkYDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-21.tower-732.messagelabs.com!1654759198!75023!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31145 invoked from network); 9 Jun 2022 07:19:59 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-21.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Jun 2022 07:19:59 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 822A7B5E
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  9 Jun 2022 08:19:58 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 74CC9251
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  9 Jun 2022 08:19:58 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 9 Jun 2022 08:19:37 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-alembic: upgrade 1.7.7 -> 1.8.0
Date: Thu, 9 Jun 2022 15:19:29 +0800
Message-ID: <1654759169-11065-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jun 2022 07:20:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97454

Changelog:
===========
*Alembic 1.8 now supports Python 3.7 and above.
*The "Pylons" environment template has been removed as of Alembic 1.8. This
 template was based on the very old pre-Pyramid Pylons web framework which
 has been long superseded by Pyramid.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-alembic_1.7.7.bb => python3-alembic_1.8.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.7.7.bb => python3-alembic_1.8.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.7.7.bb b/meta-python/recipes-devtools/python/python3-alembic_1.8.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-alembic_1.7.7.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.8.0.bb
index 6b7ac4a99..3b12439cb 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.7.7.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.8.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f5a8522010db1a393833988dbe2c7f0b"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "4961248173ead7ce8a21efb3de378f13b8398e6630fab0eb258dc74a8af24c58"
+SRC_URI[sha256sum] = "a2d4d90da70b30e70352cd9455e35873a255a31402a438fe24815758d7a0e5e1"
 
 PYPI_PACKAGE = "alembic"
 
-- 
2.25.1


