Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C83C4332F
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 06:53:02 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web11.14347.1669186376171198917
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Nov 2022 22:52:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JTQkIL6K;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669186374; i=@fujitsu.com;
	bh=HNevQoyr9csnV3HDk5w+YISzv3EIWIDpPatzdRjH3iI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=JTQkIL6KCO6DwE01ECgbHL9/JLxdmPl/n1tU881D3nyoxCyDf/CKbiIcSIW+t5daG
	 XYgzgeuveFmyMDM5Y2U+9kdQziEVutYZUmCrYxAlMf1KiQL/K7AtwrVztoW3Q5Er2Y
	 ovL52YhU6fGka/ntCQGtqOiQramYNjTVxJHC+HaLQHND8vOy6yjCQbBgTHabp+jrAC
	 LdCSmYCQwxW8yKPELiyGd+6ErmLBI2JnzFod6R5DLAVp9bZExoFbdmhWED5kIwsAKq
	 sbxVk+p8JV6Grkdn6jRSlwkaAy/pxtD80EznImA18rq4rNZRiZJR0fOt2muNrzJuBT
	 iuGe9cxdORuiA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPIsWRWlGSWpSXmKPExsViZ8OxWdftcG2
  ywZ8+TouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePNwdyCb5wVzXe+sTQwzufsYuTiEBJ4yCix
  8EEvUxcjJ5BzmUmi+WEeROIAo8SXSz+ZQRJsAgoSC7eeYQWxRQT0JZbO3gMWFxYIkPjd1gLWz
  CKgKrFi2XX2LkYODl4Bd4nLP8xAwhJArVMevgcr5xUQlDg58wkLiM0sICFx8MULZpByCQFFid
  nT5SHKKyRmzWpjgrDVJK6e28Q8gZFvFpLuWUi6FzAyrWI0K04tKkst0jW00EsqykzPKMlNzMz
  RS6zSTdRLLdUtTy0u0TXUSywv1kstLtYrrsxNzknRy0st2cQIDLeUYpYHOxh3LPujd4hRkoNJ
  SZRXa3NtshBfUn5KZUZicUZ8UWlOavEhRhkODiUJXp0NQDnBotT01Iq0zBxg6MOkJTh4lER4f
  xwASvMWFyTmFmemQ6ROMSpKifP+AkkIgCQySvPg2mDxdolRVkqYl5GBgUGIpyC1KDezBFX+Fa
  M4B6OSMG/XIaApPJl5JXDTXwEtZgJarGZRBbK4JBEhJdXAlPPfaMVJ0Slcv1nDmW3UFsuw+10
  26pp1p5eFj3nRI5VO/+6WhZ/bmfl/L5k7/zffyscb+KIEdZ7tvct/eeUKi3dlgZs+v/sYMqde
  d5eeLffuI6+25e1i5Kj7xOy67+3U2yvuhi7hlnh5w/at3NLrogeYpA+ZLm3d/nqa9V+3exM4l
  J1bBEP+SdpdKrngsf27hT3/yi0CNVk+a3+6cjcsO35c7Oy6kBWNj9NNpk+b56CePT9gt2HYpY
  TZAhdv7TwYzHd2tvLWe79PW62xjuEU3uLv/PyUvSLPWblzM1MD/5RtvMG3Zl2QI+fOW5Ozr8g
  I1DcGZe9epOI7r1cy3TieIcTFOuZ0TtaZncX3ZmyXfKbEUpyRaKjFXFScCABGI2XvMgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-585.messagelabs.com!1669186373!36346!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7110 invoked from network); 23 Nov 2022 06:52:54 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-5.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Nov 2022 06:52:54 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id C8625152
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Nov 2022 06:52:53 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id BB4D973
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Nov 2022 06:52:53 +0000 (GMT)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 23 Nov 2022 06:52:52 +0000
From: <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-sqlalchemy: upgrade 1.4.43 -> 1.4.44
Date: Wed, 23 Nov 2022 14:52:50 +0800
Message-ID: <1669186370-2942-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Nov 2022 06:53:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99694

Changelog:
https://docs.sqlalchemy.org/en/20/changelog/changelog_14.html#change-1.4.44

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ython3-sqlalchemy_1.4.43.bb => python3-sqlalchemy_1.4.44.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.43.bb => python3-sqlalchemy_1.4.44.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.43.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.44.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.43.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.44.bb
index 46132cfba..1c318e6ce 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.43.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.44.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f4001d1ca15b69d096fa1b4fd1bdce79"
 
-SRC_URI[sha256sum] = "c628697aad7a141da8fc3fd81b4874a711cc84af172e1b1e7bbfadf760446496"
+SRC_URI[sha256sum] = "2dda5f96719ae89b3ec0f1b79698d86eb9aecb1d54e990abb3fdd92c04b46a90"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.25.1


