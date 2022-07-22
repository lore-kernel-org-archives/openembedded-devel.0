Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6BAAC43334
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 01:37:32 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web10.3224.1658453845425125937
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jul 2022 18:37:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=onBu7voy;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658453843; i=@fujitsu.com;
	bh=YTGsVqdBqrkH8M/lLz7+tjQlEWGL2n8A93LjQ3uirHc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=onBu7voyk7QR6s0dQXXvvuox8HuxAPm47XCLKQTVorls+e21IsktZH5tO5Su9KKIc
	 pN7gJmnl+D2GgoZxlUE8AzInKxrR+XlEnOkkRADhVbw3/xecnfGzKJKTfTCJMEc5Ps
	 mV4SnN+UcUFwm5421zy0rI4p+sqkV1E7lfTauw2XIErbiSy6Bv5vm3vEzmEEFnvEKt
	 efo3yyCxeTE0F8rsg7xek5fIBSN2PDc5vnUW69tBzTGTWnHBcEfiZKWt8Gvm7YTEMS
	 YMzMmyUy1FJM+X8hGH0v1gxAUPGwVvXrrPqgLe/QjCzyDdCJwGd8CRWBrN9p6PRs9S
	 Uypt+Tikdehow==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRWlGSWpSXmKPExsViZ8OxWTf4/80
  kg3PfxS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oyVk+awFjzjqvjatZWtgfE9ZxcjF4eQwANG
  iZcX+tkgnMtMEscO7WCBcE4ySvycdRvI4eRgE1CXeHzzNSOILSKgL7F09h5mEJtZQFWi++Iad
  hBbWMBbomnlfbA4C1D8UN8NMJtXwF3i1+NPYDUSAgoSUx6+h4oLSpyc+YQFYo6mROv23+wQtr
  xE89bZzBD1ShInVnxkgrArJF4fvgQVV5O4em4T8wRGgVlIRs1CMmoWklELGJlXMVolFWWmZ5T
  kJmbm6BoaGOgaGprqGuoaGZrrJVbpJuqlluqWpxaX6BrqJZYX66UWF+sVV+Ym56To5aWWbGIE
  hnFKMePNHYytfT/1DjFKcjApifLum3QzSYgvKT+lMiOxOCO+qDQntfgQowwHh5IEb8FfoJxgU
  Wp6akVaZg4wpmDSEhw8SiK8Fl+A0rzFBYm5xZnpEKlTjJYcU2f/28/MsRxMzvzadoBZiCUvPy
  9VSpx3yVegBgGQhozSPLhxsLi/xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYV/430BSezLw
  SuK2vgA5iAjrI3PwGyEEliQgpqQamVQZ/Enj+Tp/W/eT3C1+fu5zvqnjcXn574yC+ovzcmmeB
  tgtNHi9b0cDRIK3avq2+buezO04NcTGrVl8xYfiQ/vXW/k2bDEJnZny++6Z+XZlBqOHebb9ym
  qZarGdYmJv1eMv6raEnNlypdriY+JDjgFGl0NLKLYrzVr5cfLfF/cD5498dJgqv+HnQrnta0e
  F/JpdvPGy99MGm97Xz9BtPfZO62dSOX//3X40x5A3rk6mZk2RPN8/QvMrGdjJp/vcD79RD4lP
  33Z8XGb1AtMVFsriauUTO7s3qM6I759zIW7+9/sTep4ummFy79nGi/9YDJ3Q5Q+duD+F4lG64
  t0whaOIHt6X1Yn1HI8USLs1Sk7ujxFKckWioxVxUnAgAHXa1xHYDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-585.messagelabs.com!1658453843!307324!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7123 invoked from network); 22 Jul 2022 01:37:23 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-4.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Jul 2022 01:37:23 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 05F767B
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 02:37:23 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id ED8C375
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 02:37:22 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 22 Jul 2022 02:37:21 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-iso3166: upgrade 2.0.2 -> 2.1.1
Date: Fri, 22 Jul 2022 09:37:12 +0800
Message-ID: <1658453833-26074-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Jul 2022 01:37:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97929

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog from 2.0.2 to 2.1.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* Move install metadata from "setup.py" to "setup.cfg"
* Add py.typed to source distribution
* "Turkey" changed to "T=C3=BCrkiye"

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-iso3166_2.0.2.bb =3D> python3-iso3166_2.1.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-iso3166_2.0.2.bb =3D> python3-iso3166_2.1.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-iso3166_2.0.2.bb b/meta-python/recipes-devtools/python/python3-iso3166_2.1.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-iso3166_2.0.2.bb
rename to meta-python/recipes-devtools/python/python3-iso3166_2.1.1.bb
index e578b8aeff..b32cfe5956 100644
--- a/meta-python/recipes-devtools/python/python3-iso3166_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-iso3166_2.1.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "https://pypi.org/project/iso3166/"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D5e2f4edc7e7408a82e4a1d05f229b695"
 
-SRC_URI[sha256sum] =3D "04d02cfcfc18a6f8a9a4edb4d0a55e2e4fc575626c29d702f750de415e88d372"
+SRC_URI[sha256sum] =3D "fcd551b8dda66b44e9f9e6d6bbbee3a1145a22447c0a556e5d0fb1ad1e491719"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.25.1


