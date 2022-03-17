Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F9FFC433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 13:46:26 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.10269.1647524784738090351
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Mar 2022 06:46:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=KwhqP4WR;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647524782; i=@fujitsu.com;
	bh=jkABnpfCgm/rKpH+HE1J+E7HWR1/iXpLWl1+Rsf6KTY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=KwhqP4WRfgIqG321CZjOTk6x0xtxabEswU6kA3qy+svE0LpeiIMmqVV5k7R5JCUaJ
	 r/U+MqOx1VvkfJo1aiHyc9fvKTIrbRnq2r2QQPwEuTUF158atwW6MbzoEqDm2IQJpn
	 KxpgxX1r+JBqy5aIFTvY1ItoO6+h/TAQhPecNrRlRhcwelY0S89+IZMeQDE/R/zSZe
	 FjuYbs4wpOdtltnYRW7eHK7JzE59JG6h924UG89z4cr/0XhGGoOVBpEG3xQ0RtNSFo
	 OR2Aa43Ok409cmPdjgpoXcy6Oo2UaleBFhXZQwsION60gpB/ZZFZvx/EmhRqjl3eJN
	 4xig1fdxt6E3A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRWlGSWpSXmKPExsViZ8MxSXedtXG
  SwdazYhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bSf1fZC+ZxVfx+9ZKpgfEgZxcjF4eQwBNG
  iZN7DjFCOBeYJK73fGLuYuQEck4ySvx7yA1iswmoSzy++ZoRxBYR0JdYOnsPWA2zgKpE98U17
  CC2sECMxIJnk8BqWIDit2esZgKxeQXcJaYs2sgCYksIKEhMefgerJdTwENicedrJohd7hIt/7
  exQdQLSpyc+YQFYr6ExMEXL5ghepUkTqz4yARhV0i8PnwJKq4mcfXcJuYJjIKzkLTPQtK+gJF
  pFaNtUlFmekZJbmJmjq6hgYGuoaGprpmZrqWZXmKVbqJeaqlucmpeSVEiUFYvsbxYL7W4WK+4
  Mjc5J0UvL7VkEyMwlFOKnRJ2MD7q+6l3iFGSg0lJlPeounGSEF9SfkplRmJxRnxRaU5q8SFGG
  Q4OJQleRkugnGBRanpqRVpmDjCuYNISHDxKIrzhOkBp3uKCxNzizHSI1ClGRSlx3moroIQASC
  KjNA+uDRbLlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ80qDTOHJzCuBm/4KaDET0OJGASO
  QxSWJCCmpBqZbxhPDnpjpzi6MEjsouNWZu6q87LfA/F6tbzPZ3prcT6z4sitra+Uph69P3crn
  986eqVLdp+Rc/GAC29ylzzYfv3msuuX+6/qXXec3zmcKMvosW2HSmSizNO2HngJnykk/pqKaY
  zOTJt+94rZwiv27Joavm+ccy1P96bU9rPDUTNmkutyuKEGXVffq/8UxrJgkKO3Tevja1a8nrm
  43MuK9rF60JOrZfYmaJYqBu3/fDnCKOlfJn15Zlil96tdKf5m/l6w2bkqJ1Npk9jTuieH8o9t
  XsC86P/UJm1l/8Cx35caVff/ivoh+i520snCz1Y61NyrK5f8evb83aMeP+yFhU9wWrXuUbCV9
  ee4Xf4cZSizFGYmGWsxFxYkAvxoSJGADAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-545.messagelabs.com!1647524782!15525!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12053 invoked from network); 17 Mar 2022 13:46:22 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-2.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Mar 2022 13:46:22 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id C2F19100464
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Mar 2022 13:46:21 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id AF20310045F
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Mar 2022 13:46:21 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 17 Mar 2022 13:46:17 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 2/3] [oe] [meta-python] [PATCH] python3-sqlalchemy: upgrade
 1.4.31 -> 1.4.32
Date: Thu, 17 Mar 2022 21:46:46 +0800
Message-ID: <1647524807-17685-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647524807-17685-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1647524807-17685-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Mar 2022 13:46:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96035

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog see https://docs.sqlalchemy.org/en/14/changelog/changelog_14.html#change-1.4.32

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...ython3-sqlalchemy_1.4.31.bb => python3-sqlalchemy_1.4.32.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.31.bb => python3-sqlalchemy_1.4.32.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.31.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.32.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.31.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.32.bb
index 510bb7d9e4..93a49df53a 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.31.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.32.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f4001d1ca15b69d096fa1b4fd1bdce79"
 
-SRC_URI[sha256sum] = "582b59d1e5780a447aada22b461e50b404a9dc05768da1d87368ad8190468418"
+SRC_URI[sha256sum] = "6fdd2dc5931daab778c2b65b03df6ae68376e028a3098eb624d0909d999885bc"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.25.1


