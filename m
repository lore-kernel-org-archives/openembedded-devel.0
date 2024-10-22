Return-Path: <s.zhmylev@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93E67D2CDF7
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 15:55:06 +0000 (UTC)
Received: from mta-03.yadro.com (mta-03.yadro.com [89.207.88.253])
 by mx.groups.io with SMTP id smtpd.web10.22120.1729612503215267976
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:55:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-04 header.b=Bul5p3kp;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-03 header.b=qKGVLwGU;
 spf=pass (domain: yadro.com, ip: 89.207.88.253, mailfrom: s.zhmylev@yadro.com)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-03.yadro.com 51A7FE0005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1729612501; bh=kqiLqlaYmpRAZMRA8rP9Sj3elP986kxWD4qSnIz2VzQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=Bul5p3kptZe+QmR0hx5URE47tXdtiK8ISLtho/U1gkW8bMgN3TXAqp+WlpADsXYA9
	 6Rt44bd+6lilRWd7Is23BXkkOzhR+jnmSWilcG+weLux8n2o27vfHfTMLYrfOwP20L
	 9S7X1lJpMdzQans1q9q3EJ4BPhZ5PZVB5KAC6lDHVkpEpoq3JZpT0nArWV5ecIofU0
	 7tCaB7PYkLcgzt1S5getyL45zgT4KhNnHiBEEQJIh4JKXPjvXdwZNz169zxgBaC7kD
	 NEfTDWl/vTI9sDH+FXOR1WBOrOOp+qCasmky0HeIvT236mMDIibV4zST62D+IiC37U
	 5qcUfMxicEesQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1729612501; bh=kqiLqlaYmpRAZMRA8rP9Sj3elP986kxWD4qSnIz2VzQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=qKGVLwGUC76/5XiNSHXckLnS6OLE4a2NFd88fROqIgpHzXoDFQ002yi3U/X4D0Cx6
	 z+YgH3ydLvUrTyTIPW9qNMwbzRSC4+6uYOhT1CQFin1og7MTZDdr67Nvu7nB0KAq2A
	 7w4U0IUi0Gg8Iy5EwM4FWGGowyrnjGgcFLIKNErBDwZIPKTaFjJcQcDpLQtqptVyw7
	 eXdjL7BLmk7qw5fLwC32xJfodWVSW7z0jljAlkvsB0nJUvp7LdZ8fZ0gb1UvENjphg
	 LKN+fuztD9kk8BADQhdOaSqF4mTNXrv589nfB+12vvZeQVVWo/6ng8YUncdg3fc2Gm
	 hCs5QOZCIl6xg==
From: Sergei Zhmylev <s.zhmylev@yadro.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Sergei Zhmylev <s.zhmylev@yadro.com>
Subject: [PATCH] multipath-tools: set etc_prefix to sysconfdir
Date: Tue, 22 Oct 2024 18:54:35 +0300
Message-ID: <20241022155435.21013-1-s.zhmylev@yadro.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: T-EXCH-09.corp.yadro.com (172.17.11.59) To
 T-EXCH-10.corp.yadro.com (172.17.11.60)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 15:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113090

Makefile of multipath-tools uses $prefix as a destination prefix.
As soon as we added usrmerge feature, multipath default configuration
placed under /usr/etc/ resulting into problems locating them via a
hard-coded path inside the tools.
This change explicitly sets etc_prefix to ${sysconfdir} in order to
recover default behaviour.

Signed-off-by: Sergei Zhmylev <s.zhmylev@yadro.com>
---
 .../recipes-support/multipath-tools/multipath-tools_0.10.0.bb    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.10=
.0.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.10.0.bb
index a09fbb221..18874e909 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.10.0.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.10.0.bb
@@ -72,6 +72,7 @@ ARM_INSTRUCTION_SET:armv5 =3D "arm"
 EXTRA_OEMAKE =3D 'MULTIPATH_VERSION=3D${PV} DESTDIR=3D${D} syslibdir=3D$=
{base_libdir} \
                 OPTFLAGS=3D"${CFLAGS}" \
                 prefix=3D${prefix} \
+                etc_prefix=3D${sysconfdir} \
                 bindir=3D${base_sbindir} \
                 LIB=3D${base_libdir} libdir=3D${base_libdir}/multipath \
                 usrlibdir=3D${libdir} \
--=20
2.45.2


