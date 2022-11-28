Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA0DC4167D
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 06:19:28 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.111525.1669616361884960553
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 22:19:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jpWmIJVx;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669616359; i=@fujitsu.com;
	bh=SgS+xH4Ku2VeKC7pbFI64my1t4eZcWYg0lKA5uoVkNg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=jpWmIJVxE0DU6LyreRTvaj7fZtjfeMqgdjSezQdWksGCaE70ec+6rpGLlRV3LRI/P
	 7vEAjm+gwm3cLijAazTxB6rDsZET2UQdKkDjUkmpvrqMqzn/UqhYF9h0zO7Hk9CkZx
	 vox48qD7EoCiQHDkVuhh018AUN5+NrUWsS6S4EcrvBUX8g/p0vWZL54wHab0+UBLIy
	 fQvtXdvm/HJS/0kW550mBubitU+8a2QVxYySAzcxCcosiw/3Zss5Uah1D5bbQKbdR6
	 1HwD4gOiQrcCnW8VHDuVv5+cXsaC4tTNkawblHKCMv+pVfrpcCjKKtEq0YQKmdSLvV
	 MPXYvvgeShEQg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8OxWfd5UEu
  ywe1JshYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aRzmtsBUu5KjY2SzYwfuXoYuTkEBJ4wCix
  r1W8i5ELyL7MJDHlWDcLhLOHUeLBj1dMIFVsAlISN+7/ZwOxRQT0JZbO3sMMYjMLqEi8+N3DD
  mILC/hIPOieBWazCKhKrHp0khHE5hVwkph2YDILiC0hoCAx5eF7sF5OAWeJNVfPs0Bc4STx7t
  oWFoh6QYmTM5+wQMyXkDj44gUzRK+ixOzLzVBzKiRmzWpjgrDVJK6e28Q8gVFwFpL2WUjaFzA
  yrWI0L04tKkst0jU00ksqykzPKMlNzMzRS6zSTdRLLdXNyy8qydA11EssL9ZLLS7WK67MTc5J
  0ctLLdnECAzelOLkuzsYO5f/0TvEKMnBpCTK+zGwJVmILyk/pTIjsTgjvqg0J7X4EKMMB4eSB
  O9ckJxgUWp6akVaZg4wkmDSEhw8SiK8i+2B0rzFBYm5xZnpEKlTjIpS4rwhIH0CIImM0jy4Nl
  j0XmKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzHsZZApPZl4J3PRXQIuZgBZvUmwCWVySiJC
  SamCyDJFtMei5Hq119LXUUqNkl1PLZ/Nff1j+8Iz3y+lV12IWT51Usavo70SF/TERunwJUvy5
  71vi3Oc3by3mWXbD2faGovdfr5oDRzRKZrTdZlC4YbHpNdeX69Nt//ja5Kk9XHbJcuulCplN3
  4XOzoxksV+wcV3Ng/P3+LnXbI2bMqs/g/X886C4UrGgZe+Fyp2ebN02NVXJV7/5gaaglNOM1B
  8+HNwbHMuLA5+5LnYxPxuzec2jZxo2KROnOyftLkvZ/X9WipTQnTt254R/X5dilX5mvcBqctj
  rhWq29deFHix85fd1/qTKCzpGnxKKO3+o29y/sYP3foZ8r1voVgN+FbHgz88WWMw8dPrKYr3T
  SizFGYmGWsxFxYkAgyoGclkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-728.messagelabs.com!1669616359!10718!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23024 invoked from network); 28 Nov 2022 06:19:19 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-15.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Nov 2022 06:19:19 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id F0A857B
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:19:18 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id E3B5873
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:19:18 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Nov 2022 06:19:17 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-grpcio: upgrade 1.50.0 -> 1.51.0
Date: Mon, 28 Nov 2022 14:18:48 +0800
Message-ID: <1669616331-13256-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1669616331-13256-1-git-send-email-wangmy@fujitsu.com>
References: <1669616331-13256-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:19:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99807

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-grpcio_1.50.0.bb => python3-grpcio_1.51.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.50.0.bb => python3-grpcio_1.51.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.50.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.51.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.50.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.51.0.bb
index a562bfb30..bd4fcc805 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.50.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.51.0.bb
@@ -12,7 +12,7 @@ SRC_URI:append:class-target = " file://ppc-boringssl-support.patch \
                                 file://mips_bigendian.patch \
                                 file://abseil-ppc-fixes.patch;patchdir=third_party/abseil-cpp \
 "
-SRC_URI[sha256sum] = "12b479839a5e753580b5e6053571de14006157f2ef9b71f38c56dc9b23b95ad6"
+SRC_URI[sha256sum] = "a103811a4b318abc9b1592cd6cc9187d34bfb2e192eb0fe113dfabb38a162284"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-protobuf \
                   ${PYTHON_PN}-setuptools \
-- 
2.25.1


