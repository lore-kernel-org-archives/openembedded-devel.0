Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A22EAC433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 09:17:51 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web09.8615.1648113470591868838
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 02:17:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=In1t7lsm;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648113468; i=@fujitsu.com;
	bh=Jv7ydpBSx5doS821XsVXATtjGWZZB8i9KDS30FNx5so=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=In1t7lsmmaWzCe55QCibQdNOjzfw2ocsNrLLzMPRdMvDfw4/dgYTjsKDcyeTN5aog
	 IIVss3R8zJhKahmi+KBCJU9g5CrwIWeibnMLFBsIc+l6xQNRUpfYIFslB3Mrl4bBla
	 2bKI9Gr4tmIoU94Sc1sE+iZ0We5DKsapMXBlhq2n9iR8042Y+iYYwHK2ACFprrYAXn
	 BdLmviPU5ZAk7/jnXsmPTBMEHclyKQihu+VFR0T3iNwxXr3K/6u77KXO+U7YKFHVDq
	 t4VXzOAODHeLlNoZ3L37jlhqpadt2rTgLeCyC2dAmkIFRL9BkSKZkIwvzuzDOeEvXg
	 LD5SjpjrzQR5Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRWlGSWpSXmKPExsViZ8ORqGtjbpN
  ksPksj8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnHowXH2gtnCFWuu7WFtYJwm2MXIxSEk8IRR
  ouPpJHYI5wKTxOLb71ghnJOMEmun7GPsYuTkYBNQl3h88zWYLSKgL7F09h5mEJtZQFWi++Iad
  hBbWCBc4tLdJrAaFqD4jp39TCA2r4C7xO0L59lAbAkBBYkpD98zQ8QFJU7OfMICMUdTonX7b3
  YIW16ieetsZoh6JYkTKz4yQdgVEq8PX4KKq0lcPbeJeQKjwCwko2YhGTULyagFjMyrGO2SijL
  TM0pyEzNzdA0NDHQNDU11zUx1DS2M9BKrdBP1Ukt1k1PzSooSgdJ6ieXFeqnFxXrFlbnJOSl6
  eaklmxiB4ZxS7LhtB+Opvp96hxglOZiURHk/G9skCfEl5adUZiQWZ8QXleakFh9ilOHgUJLg3
  WUElBMsSk1PrUjLzAHGFkxagoNHSYS3xhAozVtckJhbnJkOkTrFqCglzhtrBpQQAElklObBtc
  Hi+RKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd5SkCk8mXklcNNfAS1mAlr8/KclyOKSRIS
  UVAOTy5/gpT0TVSMDWtPi+41vBrwsrwirf7EsQcBuw4fpZ71iX8YeuJ7ocSPVh01Y47eCVtbX
  8tYPS7/NNNUSsT62u6y370nyQuZ1S8LipDk9fkz/YpR07q6y7Rp+i+PH2Y/WHejfvKfI/6/lq
  4mMS9I8NsU+3f9Bx6jy2VPhru5l047nvpdze5d0SvZ50cIlK9cKpjOGfPbbtejE4vNHMw9M1n
  2ZK5Vg+dP5F1/zira0vkqRyvWKticbNPXetuc0yOSnROycElKxrqO7J5bPRSDz36G1/8ILWqS
  vJJx853OjRcfDWkV9j9QDZs6Z7LW8N1YWf/P68+cCwywZ0brHn0+d5uv97fzircS5f0XvKyqV
  WIozEg21mIuKEwGDp0CMYgMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-545.messagelabs.com!1648113467!159320!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19444 invoked from network); 24 Mar 2022 09:17:48 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 24 Mar 2022 09:17:48 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id B60A61001A2
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 09:17:47 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 9D1F41001A0
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 09:17:47 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 24 Mar 2022 09:17:27 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 1/5] [oe] [meta-python] [PATCH] python3-alembic: upgrade 1.7.6
 -> 1.7.7
Date: Thu, 24 Mar 2022 17:17:56 +0800
Message-ID: <1648113480-29846-1-git-send-email-xuhuan.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Mar 2022 09:17:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96186

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-[bug] [operations]

Fixed issue where using Operations.create_table() in conjunction with a
CheckConstraint that referred to table-bound Column objects rather than string
expressions would be added to the parent table potentially multiple times,
resulting in an incorrect DDL sequence. Pull request courtesy Nicolas CANIART.

-[bug] [environment]

The logging.fileConfig() line in env.py templates, which is used to setup Python
logging for the migration run, is now conditional on Config.config_file_name not
being None. Otherwise, the line is skipped as there is no default logging
configuration present.

-[bug] [mssql]

Fixed bug where an Operations.alter_column() operation would change a =E2=80=9CNOT NULL=E2=80=9D
column to =E2=80=9CNULL=E2=80=9D by emitting an ALTER COLUMN statement that did not specify
=E2=80=9CNOT NULL=E2=80=9D. (In the absence of =E2=80=9CNOT NULL=E2=80=9D T-SQL was implicitly assuming =E2=80=9CNULL=E2=80=9D).
An Operations.alter_column() operation that specifies
Operations.alter_column.type should also specify include either
Operations.alter_column.nullable or Operations.alter_column.existing_nullable to
inform Alembic as to whether the emitted DDL should include =E2=80=9CNULL=E2=80=9D or =E2=80=9CNOT NULL=E2=80=9D;
a warning is now emitted if this is missing under this scenario.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-alembic_1.7.6.bb =3D> python3-alembic_1.7.7.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.7.6.bb =3D> python3-alembic_1.7.7.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.7.6.bb b/meta-python/recipes-devtools/python/python3-alembic_1.7.7.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-alembic_1.7.6.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.7.7.bb
index 822b3c02b8..6b7ac4a99c 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.7.6.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.7.7.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df5a8522010db1a393833988dbe2c7f0b"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] =3D "6c0c05e9768a896d804387e20b299880fe01bc56484246b0dffe8075d6d3d847"
+SRC_URI[sha256sum] =3D "4961248173ead7ce8a21efb3de378f13b8398e6630fab0eb258dc74a8af24c58"
 
 PYPI_PACKAGE =3D "alembic"
 
-- 
2.25.1


