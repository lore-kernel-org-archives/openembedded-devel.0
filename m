Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E49F1C4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 03:11:46 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web12.3921.1667877101202800439
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 19:11:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=q5Qyqn9v;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667877099; i=@fujitsu.com;
	bh=ca8/dP0WNiZvJQRjNrc3OMe9AEU32z/u5Ft877e2DMU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=q5Qyqn9vyU/Vo4aLJv2qPwhbyKqSQvBv93UV5YIdwCVm1jpPoxnF+esQr6vKiqBi4
	 6g9GOEaT+yYcNyro6onKowJlUgHIbLNJKcWddZgNyqz2jC+dsOXBN8FgkYQqd46RPe
	 5lTmxvRgU0OzvR2XmBgzOlhjjFiKkGJFBxGOygOKrqBHS39Xee+z4I4E4TXBEJ4c2X
	 bKT9ogwFFtXbSe9+tz83z4ia3X+xy1OQ/BOp/oqeZi6f+TJEwPsvzEkWI8Jgx3rLfP
	 Iuw74yzNzxqPj4vaeXQrCQw45X4rKa8e7kX5zM386FqfvqrCrlw0I/VX4wmA2UQzeo
	 2uf07NdXsD6qA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFIsWRWlGSWpSXmKPExsViZ8ORqPvqRGa
  ywYkGYYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPxum9sBTO4Ki5d383cwLiCs4uRi0NI4Amj
  xOGZF1m7GDmBnOtMEpO+G0LY+xkl2v9GgthsAgoSC7eeAasREdCXWDp7D3MXIweHsICvxLH/W
  SBhFgEVifdTV4KV8Ap4SLQ2HmAGsSWAWqc8fM8MEReUODnzCQuIzSwgIXHwxQuwMRICihKzp8
  tDlFdIzJrVxgRhq0lcPbeJeQIj3ywk3bOQdC9gZFrFaFqcWlSWWqRrppdUlJmeUZKbmJmjl1i
  lm6iXWqpbnlpcomuol1herJdaXKxXXJmbnJOil5dasokRGGwpxewFOxhnLvujd4hRkoNJSZQ3
  yzYzWYgvKT+lMiOxOCO+qDQntfgQowwHh5IEr/YxoJxgUWp6akVaZg4w8GHSEhw8SiK8748Dp
  XmLCxJzizPTIVKnGHU5Zn5tO8AsxJKXn5cqJc57CGSGAEhRRmke3AhYFF5ilJUS5mVkYGAQ4i
  lILcrNLEGVf8UozsGoJMx7CGQVT2ZeCdymV0BHMAEdUV2QBnJESSJCSqqByb639tMjpj2fHyZ
  cjtkw1aHJL2uj2IRHE1lN377zd7fZlXiv4fnOvI1zDDdr7FffnBrXveSx996V085smcEjtlXt
  5Ipl/68uFkwvNdnO0vfpkvIPC66S4/P6k6rZDDqkcuYczwj8O9nmUF+Rz4YdUcGC4ZJFpl8vv
  q+e3hjMZvtzi8jcHdFzdre8LPg5kZHhp5HVM1cr12XrPHdWqq95nvQ55N+fia/26B1e1nDW9s
  7G3X066kbbJsdfsq3/1OUtfKdhh+DfNV5JcxbmHtnZ+0BqX6ORZ47hsqPLdja/ZjXd8/MIt3A
  k3zWH5z3reFqa5myaMMG/2eifvUzziqsiCct+Fu43tzRrl54p6aRzqliJpTgj0VCLuag4EQDq
  qC36PQMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-18.tower-591.messagelabs.com!1667877098!333638!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5783 invoked from network); 8 Nov 2022 03:11:38 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-18.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Nov 2022 03:11:38 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id EE022100198
	for <openembedded-devel@lists.openembedded.org>; Tue,  8 Nov 2022 03:11:37 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id E2742100182
	for <openembedded-devel@lists.openembedded.org>; Tue,  8 Nov 2022 03:11:37 +0000 (GMT)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 8 Nov 2022 03:11:36 +0000
From: <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-termcolor: upgrade 2.0.1 -> 2.1.0
Date: Tue, 8 Nov 2022 11:11:28 +0800
Message-ID: <1667877088-29134-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Nov 2022 03:11:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99485

Changelog:
==========
Added
----------
    Support FORCE_COLOR and detect tty (#25)

Deprecated
----------
    Deprecate __ALL__, use __all__ instead (#23)

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-termcolor_2.0.1.bb => python3-termcolor_2.1.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-termcolor_2.0.1.bb => python3-termcolor_2.1.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-termcolor_2.0.1.bb b/meta-python/recipes-devtools/python/python3-termcolor_2.1.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-termcolor_2.0.1.bb
rename to meta-python/recipes-devtools/python/python3-termcolor_2.1.0.bb
index 47f7938f1..4794fc084 100644
--- a/meta-python/recipes-devtools/python/python3-termcolor_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-termcolor_2.1.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=e5f5f7c9b280511f124dba5dda3d180e"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "6b2cf769e93364a2676e1de56a7c0cff2cf5bd07f37e9cc80b0dd6320ebfe388"
+SRC_URI[sha256sum] = "b80df54667ce4f48c03fe35df194f052dc27a541ebbf2544e4d6b47b5d6949c4"
 
 DEPENDS += " \
 	${PYTHON_PN}-toml-native \
-- 
2.25.1


