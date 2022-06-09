Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0DAAC43334
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 07:17:20 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web12.7559.1654759037831633918
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jun 2022 00:17:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=v9dOXXw6;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654759036; i=@fujitsu.com;
	bh=BF2Mhr1AUq3wa3O8DwYiJ4YS1GSChrPSwfcC2HBsgxA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=v9dOXXw63hOo+P3ZcuqW1dcfiNmIyVI/BmR51A+pchgmi0TQU+GQSswUOZiD5z8u0
	 IhhvackNctFRi4G7LmNIDF1qPKN1135cCcb4DdRotSjYAt8iMJRM5koUhpOLDOTvcp
	 16af8PXYHEw0mDyzIi/lkStghNjx0ISosCQ53K6W/CqOaS8oEACUvzSDf8Rncr1L8v
	 Qn/GYcTbW4/0AMszuP3GYIcCg/H8dJJWhmogofALS3mVBDGWmfiJi0XoFQL0RABHQR
	 zszqs5fiTl3g/CnPyL0eI/o7m22hGep8toc2LRSzUkjhOtubk225cBTOeHeJ/Vfxfa
	 nLG0eoUmyeJ0Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsViZ8MxSbd63sI
  kg76V6hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bZGb+ZCx5xVjz5vJqlgbGDs4uRk0NI4Amj
  xP4JIl2MXED2BSaJw39+MUM4JxgldnT+YQWpYhNQl3h88zUjiC0ioC+xdPYeZhCbWUBVovviG
  nYQW1jAT2Llh61ANgcHi4CKRPN8cZAwr4C7xO9l98FaJQQUJKY8fA/WyingIbHm6UIWiCPcJZ
  Z/Oc8GUS8ocXLmExaI8RISB1+8YIboVZI4seIjE4RdIfH68CWouJrE1XObmCcwCs5C0j4LSfs
  CRqZVjFZJRZnpGSW5iZk5uoYGBrqGhqa6ZrqGZpZ6iVW6iXqppbrlqcUluoZ6ieXFeqnFxXrF
  lbnJOSl6eaklmxiBIZxSzLZyB+PKvp96hxglOZiURHnPpS5MEuJLyk+pzEgszogvKs1JLT7EK
  MPBoSTBu3cWUE6wKDU9tSItMwcYTzBpCQ4eJRHeq3OA0rzFBYm5xZnpEKlTjLocM7+2HWAWYs
  nLz0uVEuddNxeoSACkKKM0D24ELLYvMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmXQoyhSc
  zrwRu0yugI5iAjvh1ZQHIESWJCCmpBiY2y/ggk1XHv2/izFn5V2+tSYdQKZ93/boyO53Gk4zz
  b/ev4rov/l99aXvLzaQDplPeHA+2vaS09ZKradnJcrHF11+t5xW92t1xz/vdXLsdu7gPbXEwZ
  y91nXQj7YqnhcoOs6Xma5/f9c2JXp2ldC7x3u8QLbv4WmaTT20Lb3Fqmexb9OV9+5me+Dd774
  esUu8+c7dYJ3zH4YNiUn3cSUqCrufTzBnNUxTeXmEzSDuhMompKJHV/oX9ZY0E9kTO9EeHL/9
  4Ga/leU/JSyasTuTcFOZpPXmHru2VWRfbt95O0PDj3j313yc6y5z74bz27dwtO5d+VOWbcaR+
  6zvxLo26T76tyW9Fu8pcewTa/ZVYijMSDbWYi4oTAY4A6NVoAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-18.tower-585.messagelabs.com!1654759035!72460!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6523 invoked from network); 9 Jun 2022 07:17:15 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-18.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Jun 2022 07:17:15 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 2FB92100468
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  9 Jun 2022 08:17:15 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 1681D100458
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  9 Jun 2022 08:17:15 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 9 Jun 2022 08:16:52 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-protobuf: upgrade 3.20.1 -> 4.21.1
Date: Thu, 9 Jun 2022 15:16:20 +0800
Message-ID: <1654758981-32219-4-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1654758981-32219-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1654758981-32219-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jun 2022 07:17:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97451

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-protobuf_3.20.1.bb => python3-protobuf_4.21.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_3.20.1.bb => python3-protobuf_4.21.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.20.1.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.21.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_3.20.1.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_4.21.1.bb
index 976d2aa9b..cdce531e8 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_3.20.1.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.21.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "adc31566d027f45efe3f44eeb5b1f329da43891634d61c75a5944e9be6dd42c9"
+SRC_URI[sha256sum] = "5d9b5c8270461706973c3871c6fbdd236b51dfe9dab652f1fb6a36aa88287e47"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.25.1


