Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1FD4C433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 07:30:32 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web08.3112.1646811027015985349
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Mar 2022 23:30:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=U+7oU4Uq;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646811025; i=@fujitsu.com;
	bh=f+4fVPjSFySJrCB/YkwNygxU3MSaK1+EBQVBzck42eQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=U+7oU4UqyI9aHutmlcI7rHjr+aXmOcMJjbJy0b0TKoNyGCl4SBKtT/8kph9hGfuci
	 A4YSc0iuiKpMetNlfxZ/knTEKTZ5vYmpqXfiv81KCXr/OPnCTRWX7Lx6SP4qnUmaSb
	 9lHB4+xAhRKFOSjoLjWKKPzQO7e1f93hGvdsRGIIfO/9F7uaGI+Gdx0rUai9bbQXpj
	 6pfLUxnkJvMhuZXx5lZ7z+1LjZRakzchwaO/+wiYFj88E3IV54M/KvgwoAXdoGiRJa
	 bCG8/ZGqGPZ3v4WjPO5YGaC1VFjA8p+f+61VuexeuNcUjRx7exDGIfPEibIYR8W1md
	 Lr5g5MgWkG1hQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRWlGSWpSXmKPExsViZ8ORqDshXCP
  JYNl0HYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePd1G9MBS+4K/o7F7I3ML7l6mLk4hASeMIo
  cXhRMzuEc4FJ4vT9t0wQzglGiQvr7jB2MXJysAmoSzy++RrMFhHQl1g6ew8ziM0soCrRfXENO
  4gtLBAu0XngL1gNi4CKxNvZ25hAbF4Bd4krX56wgNgSAgoSUx6+B+vlFPCQePVxChuILQRUc/
  ndA0aIekGJkzMh6pkFNCVat/9mh7DlJZq3zmaGmKMkcWLFRyYIu0Li9eFLUHE1iavnNjFPYBS
  ahWTULCSjZiEZtYCReRWjVVJRZnpGSW5iZo6uoYGBrqGhqa6prpGRuV5ilW6iXmqpbnlqcYmu
  oV5iebFeanGxXnFlbnJOil5easkmRmDYpxSzPt7BuKbvp94hRkkOJiVRXplgjSQhvqT8lMqMx
  OKM+KLSnNTiQ4wyHBxKErxFYUA5waLU9NSKtMwcYAzCpCU4eJREeOtCgdK8xQWJucWZ6RCpU4
  yKUuK8Z0FmCoAkMkrz4NpgcX+JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjCvFsgUnsy8Erj
  pr4AWMwEttjNSA1lckoiQkmpgClrjtGpqv66BRe/U80I75kyT5/esWHah47P89tjPqzJO/twk
  r6/jyluntLn2eNCR60+aW9td9dSXyop9c3dmibt1dOvBs5tV/W0F/vp94zMv2vZ+2UtXswunj
  G4muWzZxzhrzRS56WlCXuw2y1WdWWxqu2xiil/rX/tani6xUHx2T3vroW1+O2ZVLv750+u33v
  4TN67fC4vc0re7yVsu8Yml9i2dxkfrO3aWLxNVOawoE7upWyJ+0U+pQ6efqRyI3ZAlEiDz5b7
  27aOa+gtunBRv2rI9uVb45IPWGdFWvJumPZ3+j3PHNeH6Y/Xhs3PTNwhZSun/mz+nZVOwvho/
  +4KluesnidmuTvm689jlDCWW4oxEQy3mouJEACvf3T12AwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-587.messagelabs.com!1646811024!5628!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5617 invoked from network); 9 Mar 2022 07:30:24 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Mar 2022 07:30:24 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 4845E100194
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  9 Mar 2022 07:30:24 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 3610A100197
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  9 Mar 2022 07:30:24 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 9 Mar 2022 07:30:21 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 5/5] [oe] [meta-python] [PATCH] python3-pymongo: upgrade 4.0.1
 -> 4.0.2
Date: Wed, 9 Mar 2022 15:30:30 +0800
Message-ID: <1646811030-14487-5-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646811030-14487-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1646811030-14487-1-git-send-email-xuhuan.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Mar 2022 07:30:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95893

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Fixed a bug pymongo.collection.Collection.bulk_write() did not apply the
collection=E2=80=99s CodecOptions to upserted_ids result (PYTHON-3075).

Fixes the High Availability and PyMongo example for initializing a replica
set (PYTHON-3041).

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-pymongo_4.0.1.bb =3D> python3-pymongo_4.0.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.0.1.bb =3D> python3-pymongo_4.0.2.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.0.1.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.0.2.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymongo_4.0.1.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_4.0.2.bb
index 8eb0833fd0..6189730b34 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.0.2.bb
@@ -8,7 +8,7 @@ HOMEPAGE =3D "http://github.com/mongodb/mongo-python-driver"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] =3D "13d0624c13a91da71fa0d960205d93b3d98344481be865ee7cc238c972d41d73"
+SRC_URI[sha256sum] =3D "3364b5c153b0de15c39cd13c5ee73a473f7337eb2d9610711f50f14a3a611413"
 
 inherit pypi setuptools3
 
-- 
2.25.1


