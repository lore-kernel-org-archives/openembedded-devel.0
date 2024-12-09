Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A271CE7717D
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 17:26:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.107809.1733765191743757367
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Dec 2024 09:26:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35A0A1650
	for <openembedded-devel@lists.openembedded.org>; Mon,  9 Dec 2024 09:26:59 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CCA653F720
	for <openembedded-devel@lists.openembedded.org>; Mon,  9 Dec 2024 09:26:30 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/7] etcd: don't set UPSTREAM_CHECK_COMMITS
Date: Mon,  9 Dec 2024 17:26:20 +0000
Message-ID: <20241209172626.4144686-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Dec 2024 17:26:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114249

Upstream is tagging and the release checking works as expected:

$ devtool check-upgrade-status -a etcd
etcd                      3.5.7           3.5.17          None 507c0de87b=
d5034e3de4ab76ebf96b54dae0cd52

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-extended/etcd/etcd_3.5.7.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-extended/etcd/etcd_3.5.7.bb b/meta-oe/recipe=
s-extended/etcd/etcd_3.5.7.bb
index 24e111dea0..49fbf40ab7 100644
--- a/meta-oe/recipes-extended/etcd/etcd_3.5.7.bb
+++ b/meta-oe/recipes-extended/etcd/etcd_3.5.7.bb
@@ -15,7 +15,6 @@ SRC_URI =3D " \
 "
=20
 SRCREV =3D "215b53cf3b48ee761f4c40908b3874b2e5e95e9f"
-UPSTREAM_CHECK_COMMITS =3D "1"
=20
 GO_IMPORT =3D "go.etcd.io/etcd/v3"
 GO_INSTALL =3D "src/${GO_IMPORT}/"
--=20
2.43.0


