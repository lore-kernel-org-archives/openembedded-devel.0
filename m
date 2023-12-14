Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B97EFC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 03:36:04 +0000 (UTC)
Received: from wilbur.contactoffice.com (wilbur.contactoffice.com [212.3.242.68])
 by mx.groups.io with SMTP id smtpd.web11.14275.1702524961414407130
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Dec 2023 19:36:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=robert.joslyn@redrectangle.org header.s=20230812-3u04 header.b=a6e54Vxo;
 spf=pass (domain: redrectangle.org, ip: 212.3.242.68, mailfrom: robert.joslyn@redrectangle.org)
Received: from smtpauth1.co-bxl (smtpauth1.co-bxl [10.2.0.15])
	by wilbur.contactoffice.com (Postfix) with ESMTP id 6333E602;
	Thu, 14 Dec 2023 04:35:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1702524958;
	s=20230812-3u04; d=redrectangle.org;
	i=robert.joslyn@redrectangle.org;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	l=1420; bh=Mt7bxmKz0wAw7saFGHGW+jnNjl3LJArOqnP3NJeO27Q=;
	b=a6e54VxoyAjLKDHZRSImzz+IIIQdhQ1A7qb4A38/S3W9B/MTpKCCtKAMahsgmv2R
	bPkNYk/FxBDeCEA3M/w3IfJW5D7v3Cq93C1wQQkSft5yz0E7ncpS6fhTM33KWmryg1j
	Gzspm0gHLKGCsoK+hXStWfnWjH1ogprJqv+A4YUFxWY7DP6Znr+tNrghTnVxylkb8NB
	SeCEP+jbReKQrgJ0SwsHaIHFkosvpwJyU6Q4g0jsqER7BPeF3370oDHYdFLSFNXv+T1
	OXEFKvBegxv6dZt3tnlaPfuRFIM3wjKVhAyN7TrVWlYzji6+4XfKmChphslwe4u4ver
	FHtz7AzZSw==
Received: by smtp.mailfence.com with ESMTPSA ; Thu, 14 Dec 2023 04:35:55 +0100 (CET)
From: robert.joslyn@redrectangle.org
To: openembedded-devel@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [meta-oe][dunfell][PATCH] postgresql: Update to 12.17
Date: Wed, 13 Dec 2023 19:35:41 -0800
Message-ID: <20231214033541.4077877-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-ContactOffice-Account: com:454140407
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 03:36:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107408

From: Robert Joslyn <robert.joslyn@redrectangle.org>

Minor security and bugfix release. Addresses the following CVEs:

CVE-2023-5868: Memory disclosure in aggregate function calls
CVE-2023-5869: Buffer overrun from integer overflow in array modification
CVE-2023-5870: Role pg_signal_backend can signal certain superuser proces=
ses

Additional information is available in the release notes:
https://www.postgresql.org/docs/release/12.17/

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 .../postgresql/{postgresql_12.16.bb =3D> postgresql_12.17.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_12.16.bb =3D> postgres=
ql_12.17.bb} (73%)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_12.16.bb b/meta-oe=
/recipes-dbs/postgresql/postgresql_12.17.bb
similarity index 73%
rename from meta-oe/recipes-dbs/postgresql/postgresql_12.16.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_12.17.bb
index 134826220..e9f9f50a2 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_12.16.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_12.17.bb
@@ -8,4 +8,4 @@ SRC_URI +=3D "\
    file://0001-Improve-reproducibility.patch \
 "
=20
-SRC_URI[sha256sum] =3D "c5f1fff7a0f93e1ec3746417b0594290ece617b4995ed95b=
8d527af0ba0e38f3"
+SRC_URI[sha256sum] =3D "93e8e1b23981d5f03c6c5763f77b28184c1ce4db7194fa46=
6e2edb65d9c1c5f6"
--=20
2.41.0


