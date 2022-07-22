Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6663C43334
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 01:35:32 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.3144.1658453725709222751
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jul 2022 18:35:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=Im6ZS4lp;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658453723; i=@fujitsu.com;
	bh=Fck8B6G5zWxrk0rFbVyxpcMJKQnIVYOwy/IkuhfHV50=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=Im6ZS4lpxSLn6ZLC28I/96+mo7oa+Qbpd2/RObvGFOlgDzFjqyvrYoerXLaaRqWMq
	 LjTp2c7dj1VlLMdJvOoHuLsOqWeVzUVajH/4q1ZI6w/TvwLJIMrl6dsMIsXfZJRsV8
	 bBv/1ISobMREM1aZSyEX3fkviukSUAZq7usybli7OqAaKJT0Mh6Izh7pE/SVpNrjur
	 34h4vjSCt0y84iAYtjCXr5OF/4QnZZqWSEBq5DZzBpsgSeb5OlMQh8hAWf8KpPEJ1L
	 OKcYd8pn3ux/fOOpNxC2kxk5Rmzvw0wMvJMWIknB7gYYsXP1OQHai8Bt6itX/4yKpi
	 VY8p+s13Pk4WQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRWlGSWpSXmKPExsViZ8ORpHvr380
  kg/7pFhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bi9Z/YCm4IVHy4cpi9gfE5XxcjF4eQwENG
  ib77C1ghnCtMEo9617NAOAcYJWaeb2buYuTkYBPQlXjxYzELiC0ioC+xdPYesLiwgLfEpdunm
  EBsFgFViY+ff7CB2LwCHhIrtrWCxSUEFCSmPHzPDBEXlDg58wnYHGYBTYnW7b/ZIWx5ieats4
  FqOIDqFSVmT5eHaK2QeH34EjOErSZx9dwm5gmM/LOQTJqFZNIsJJMWMDKvYrRNKspMzyjJTcz
  M0TU0MNA1NDQF0sa6hiZGeolVuol6qaW6eflFJRm6hnqJ5cV6qcXFesWVuck5KXp5qSWbGIEh
  m1Kc3reDceO+X3qHGCU5mJREefdNupkkxJeUn1KZkVicEV9UmpNafIhRhoNDSYK34C9QTrAoN
  T21Ii0zBxg/MGkJDh4lEV6LL0Bp3uKCxNzizHSI1ClGS46ps//tZ+ZYDiZnfm07wCzEkpefly
  olzrvkK1CDAEhDRmke3DhYjF9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMwr/xtoCk9mXgn
  c1ldABzEBHWRufgPkoJJEhJRUA9NCydsuZ0xm3Vm0XdX8jEf4WZ6jN8z2ip8oaZ+vY8uZlT+P
  21s5VLTw1rU9oXdm+L/sP6szkTXi7PPFk7lP9ZjO15tkcTHYIvrK0ovCr6u9LhyV4t+rt9zum
  PYt59/ezq8nuE5jqLLN1FaY23p9qcrEeQ0+UyNj1i18JLg742KhhW9+tC+nXG3StAzFOyvr77
  r0PXI/ut79f2XfRp/Dgf+FJ3EsFggKum+swyuePofruM+COd7vPWJnFfrq66SJxi7bd/q2VP6
  TI507vmW1ndK5/SZsk/CPMMHjC010CtZuLfjMn7L0z41/Lo/XXnlh8F1ibofL83cRW70OXIzd
  s2vrjhDvq+t6Hhy7zJ2Y02SvxFKckWioxVxUnAgA5Ad0m2wDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-732.messagelabs.com!1658453722!460815!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23042 invoked from network); 22 Jul 2022 01:35:22 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-7.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Jul 2022 01:35:22 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 58EFD1B5
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 02:35:22 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 4DA7D1B2
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 02:35:22 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 22 Jul 2022 02:35:20 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-alembic: upgrade 1.8.0 -> 1.8.1
Date: Fri, 22 Jul 2022 09:35:12 +0800
Message-ID: <1658453712-23978-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Jul 2022 01:35:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97924

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[bug] [sqlite]
--------------
Fixed bug where the SQLite implementation of Operations.rename_table() would
render an explicit schema name for both the old and new table name, which while
is the standard ALTER syntax, is not accepted by SQLite=E2=80=99s syntax which doesn=E2=80=99t
support a rename across schemas. In particular, the syntax issue would prevent
batch mode from working for SQLite databases that made use of attached databases
(which are treated as =E2=80=9Cschemas=E2=80=9D in SQLAlchemy).

[bug] [batch]
-------------
Added an error raise for the condition where Operations.batch_alter_table() is
used in --sql mode, where the operation requires table reflection, as is the
case when running against SQLite without giving it a fixed Table object.
Previously the operation would fail with an internal error. To get a
=E2=80=9Cmove and copy=E2=80=9D batch operation as a SQL script without connecting to a
database, a Table object should be passed to the
Operations.batch_alter_table.copy_from parameter so that reflection may be
skipped.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-alembic_1.8.0.bb =3D> python3-alembic_1.8.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.8.0.bb =3D> python3-alembic_1.8.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.8.0.bb b/meta-python/recipes-devtools/python/python3-alembic_1.8.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-alembic_1.8.0.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.8.1.bb
index 3b12439cbc..3e31158835 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.8.1.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df5a8522010db1a393833988dbe2c7f0b"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] =3D "a2d4d90da70b30e70352cd9455e35873a255a31402a438fe24815758d7a0e5e1"
+SRC_URI[sha256sum] =3D "cd0b5e45b14b706426b833f06369b9a6d5ee03f826ec3238723ce8caaf6e5ffa"
 
 PYPI_PACKAGE =3D "alembic"
 
-- 
2.25.1


