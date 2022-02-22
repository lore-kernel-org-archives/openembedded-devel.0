Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0519EC433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 09:03:40 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.10641.1645520613826332639
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 01:03:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=sXkYQpK/;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645520611; i=@fujitsu.com;
	bh=aKC9Fo0eoJm/xcs9db1uVWI5xAeFB+CxLBTuB0KgMjU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=sXkYQpK/1fg+9vOow6CW+l4ztF6Y5Igt5aypi+mfJfI7NsV2SJnBj9MrsgU4oJQgp
	 xzi3jmSgef8yM2M74JA46p57eYG0qsxsj8a7QqkK//OhbYbP4wpxTz5h3bxtefZTcY
	 VzByg2ZZ73NQQx4pzmo3e+qpX5yAl2NWROTFw4HvzAHCjxDRQx627McubhywywqfO6
	 uckE69lFlIFwKeEj0m6R9fSPjVXVivHZibkinw18IeBNbB1puxbnzAyuSTxsHUsSFM
	 vkjLskX6W/FrnpDMIMR7e3rD8YWB/ZpnDWeTj8jXaMhSxxQO0wFtdLbuMM+c+C3frv
	 0yCfUR7ViNTUg==
Received: from [100.115.35.240] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-2.aws.ess.symcld.net id 61/27-14616-3E6A4126;
 Tue, 22 Feb 2022 09:03:31 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8MxSffxMpE
  kg8MLJCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1owXT+sKvgtULPot28A4mb+LkYtDSOAJo8T8
  xQsYIZwLTBIfV99ngnBOMkpsbznJ3MXIycEmoC7x+OZrRhBbREBfYunsPWBxZgFVie6La9i7G
  Dk4hAW8JP5/UQQJswCF+xr3g5XwCrhJnPlzBsyWEFCQmPLwPVRcUOLkzCcsEGM0JVq3/2aHsO
  UlmrfOhqpXkjix4iMThF0h8frwJai4msTVc5uYJzAKzEIyahaSUbOQjFrAyLyK0TqpKDM9oyQ
  3MTNH19DAQNfQ0FTX2FLXyMBAL7FKN1EvtVS3PLW4RNdIL7G8WC+1uFivuDI3OSdFLy+1ZBMj
  MIRTitVP7GB8uvKn3iFGSQ4mJVHer1NEkoT4kvJTKjMSizPii0pzUosPMcpwcChJ8FYvAsoJF
  qWmp1akZeYA4wkmLcHBoyTCm7QEKM1bXJCYW5yZDpE6xagoJc77fSlQQgAkkVGaB9cGi+FLjL
  JSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR514JM4cnMK4Gb/gpoMRPQ4ilZQiCLSxIRUlINTA3
  /a3d3f4/aLZmTuYx55wP+2VZ3tB7xKV56/6HQSF35Q8Sa69Jv9Zj+5bjP0nkg+nfaKbHCjcHs
  MpqbXBiVWi7auihWNwmXZ5d9X78wQubHmvajE38tXcVgEfZ3Wmvfx7di8hEOAY8mHf7z3O1dv
  Lhrg5/AJTVJPXOH93J/MqPnsF7qCFxUuHLG95vbJXL8WUOjPLTeVoav4F77PSv3k6fZ+9UzGA
  s6n718NfPBrCWX9U/qVahERh5XnVBy59BsR+3oY6u49n57kST/qTia63Bhr5JNz41XiU2HpkS
  WlEuYCp4xP6/s4Lx8itzNJaK/z5e9UXPY2ZfM+V6gIlMzq6VUaY0b546YHL7fdSI+SizFGYmG
  WsxFxYkAaukGvFwDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-17.tower-565.messagelabs.com!1645520611!6446!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25435 invoked from network); 22 Feb 2022 09:03:31 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-17.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Feb 2022 09:03:31 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id F191110044C
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 09:03:30 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id E4885100354
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 09:03:30 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 22 Feb 2022 09:03:09 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-alembic upgrade 1.7.5 -> 1.7.6
Date: Tue, 22 Feb 2022 17:03:45 +0800
Message-ID: <1645520625-1084-1-git-send-email-xuhuan.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Feb 2022 09:03:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95442

From: Xu Huan <xuhuan.fnst@fujitsu.com>

License-Update:
year updated to 2022

changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Add a new command alembic ensure_version, which will ensure that the Alembic
version table is present in the target database, but does not alter its
contents. Pull request courtesy Kai Mueller.

Fixed regression where usage of a with_variant() datatype in conjunction
with the existing_type option of op.alter_column() under batch mode would
lead to an internal exception.

Implemented support for recognizing and rendering SQLAlchemy =E2=80=9Cvariant=E2=80=9D types
going forward into SQLAlchemy 2.0, where the architecture of =E2=80=9Cvariant=E2=80=9D
datatypes will be changing.

Added a rule to the MySQL impl so that the translation between JSON / LONGTEXT
is accommodated by autogenerate, treating LONGTEXT from the server as
equivalent to an existing JSON in the model.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-alembic_1.7.5.bb =3D> python3-alembic_1.7.6.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.7.5.bb =3D> python3-alembic_1.7.6.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.7.5.bb b/meta-python/recipes-devtools/python/python3-alembic_1.7.6.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-alembic_1.7.5.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.7.6.bb
index 131d5d43a0..822b3c02b8 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.7.5.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.7.6.bb
@@ -1,10 +1,10 @@
 DESCRIPTION =3D "A database migration tool for SQLAlchemy"
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc4ece55266dcdd02ce165b1ee0e490bb"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df5a8522010db1a393833988dbe2c7f0b"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] =3D "7c328694a2e68f03ee971e63c3bd885846470373a5b532cf2c9f1601c413b153"
+SRC_URI[sha256sum] =3D "6c0c05e9768a896d804387e20b299880fe01bc56484246b0dffe8075d6d3d847"
 
 PYPI_PACKAGE =3D "alembic"
 
-- 
2.25.1


