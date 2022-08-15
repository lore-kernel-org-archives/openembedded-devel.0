Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3E97C00140
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 06:49:29 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.13700.1660546168422916827
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Aug 2022 23:49:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=DLV6HrUy;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660546165; i=@fujitsu.com;
	bh=kXugLS3ramQHqzuLMj5Swv0RSN6d1KY191Wphn0a85I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=DLV6HrUyAkytfjNpuQPhru/TTjpi4gf+YbovjEubbFC8TzkX8utFgfaiH1cMLUdWc
	 ZvrJtDvzYtEHIsyOZ0Jnqv/abH3EQl6cXdsIzBOLhoP0USFMOYOOO7znOWUnyJpY6K
	 UeoOMXf7zK+L/XBFZnnlqb9Z8IPpQN5Q1CcFKU77+EG5ZwkwdNOFKxnZV01rP7cw9y
	 hyigGulG+n8halm1S/WazjGVYiRwWiEKcnvUV5pnyLHc6ZUcoEHWf/j14cjc6nBVwH
	 FL6aszCLGGRvTic/p7Q5BLTsy8phT0gAbPmbz++wNOIb/tcJWfl1KrjQ/AxbwOOkSC
	 rQndA6sN2/F2g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8ORqFv65me
  SwfyHbBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bxrTuYCr5wVvzc/4+9gfEDRxcjF4eQwBNG
  id+XlzJDONeZJBaffcjUxcgJ5OxhlFh8OR/EZhNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jATqJt5l8WEJtFQFXi8c0rYDW8Ao4SfyYdBeuVEFCQmPLwPVRcUOLkzCcsEHM0JVq3/2
  aHsOUlmrfOZoaoV5SYfbmZBcKukJgxYxsbhK0mcfXcJuYJjAKzkIyahWTULCSjFjAyr2K0SSr
  KTM8oyU3MzNE1NDDQNTQ01bW00DUyNtZLrNJN1Est1c3LLyrJ0DXUSywv1kstLtYrrsxNzknR
  y0st2cQIDOSU4qSXOxjP7/uld4hRkoNJSZT32sWfSUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQke
  E1fAeUEi1LTUyvSMnOAUQWTluDgURLh7XsBlOYtLkjMLc5Mh0idYtTlmPm17QCzEEtefl6qlD
  iv6WugIgGQoozSPLgRsAi/xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYtxxkCk9mXgncpld
  ARzABHaF39zvIESWJCCmpBiYll7Xt8brTn647P/fnjtxG8+1mje8mvi+9m+Zg1d4QkS/87Dnj
  flNZBbnm5qg1SdO3qq58KPWQIyNCTbaPR7Y2tujTUXNv5R+zp+2zC/dgfuvNJ63Q55sacXOtT
  mwm++c0ZqXrd9Mnn943XSm3Q+j4jbV9MWrL9q87u3pB2TL1Wa9vq184tvbmV5Wn7Vde3bp09P
  xOgW8HLJY8zNQStWR5/rb8k8iFTodZ8ksiV+R+fP6k3jJ0/syFWtMbCjbdOdh85ZBhyJxHbId
  imiI4wzwEPs+XF9By3RNiwTv9ydqAZmEd06lb5n6yVXoQ3fbQnHtZ3tvmj3fD19zvmOhwJMic
  s+HBwv9WFx//eXA0ZXGFEktxRqKhFnNRcSIAWrgxpWsDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-745.messagelabs.com!1660546164!445912!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3257 invoked from network); 15 Aug 2022 06:49:25 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-6.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Aug 2022 06:49:25 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 81605100192
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:49:24 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 75A8D100043
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:49:24 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 15 Aug 2022 07:49:23 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] smarty: upgrade 4.1.1 -> 4.2.0
Date: Mon, 15 Aug 2022 14:49:04 +0800
Message-ID: <1660546148-1668-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Aug 2022 06:49:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98254

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 add local testrunners for all supported PHP versions using docker.
 Fix PHP 8.1 htmlspecialchars deprecation
 Do not use obsolete smarty properties '_dir_perms', '_file_perms', 'p=E2=80=A6
 Update to HTML5-syntax in debug template
 Merge branch 'fix-issue-549-v3' of github.com:AnrDaemon/smarty into A=E2=80=A6
 Fixed second param of unescape modifier

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/smarty/{smarty_4.1.1.bb =3D> smarty_4.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/smarty/{smarty_4.1.1.bb =3D> smarty_4.2.0.bb} (94%)

diff --git a/meta-oe/recipes-support/smarty/smarty_4.1.1.bb b/meta-oe/recipes-support/smarty/smarty_4.2.0.bb
similarity index 94%
rename from meta-oe/recipes-support/smarty/smarty_4.1.1.bb
rename to meta-oe/recipes-support/smarty/smarty_4.2.0.bb
index df441e8db2..2cd96a255d 100644
--- a/meta-oe/recipes-support/smarty/smarty_4.1.1.bb
+++ b/meta-oe/recipes-support/smarty/smarty_4.2.0.bb
@@ -9,7 +9,7 @@ DEPENDS +=3D "php"
 
 SRC_URI =3D "git://github.com/smarty-php/smarty.git;protocol=3Dhttps;branch=3Dmaster"
 
-SRCREV =3D "71036be8be02bf93735c47b0b745f722efbc729f"
+SRCREV =3D "97aeb14c6fc2fb733938809926e2f9d6c581a70d"
 
 S =3D "${WORKDIR}/git"
 
-- 
2.25.1


