Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEC97C36002
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 12:08:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6214.1742386128496784585
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 05:08:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32B2913D5
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 05:08:56 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9CB8F3F694
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 05:08:47 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/9] vblade: don't inherit autotools
Date: Wed, 19 Mar 2025 12:08:29 +0000
Message-ID: <20250319120836.982987-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250319120836.982987-1-ross.burton@arm.com>
References: <20250319120836.982987-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 12:08:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116069

This upstream does not in fact use autotools, so remove the inherit.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-networking/recipes-daemons/vblade/vblade_25.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/vblade/vblade_25.bb b/meta-n=
etworking/recipes-daemons/vblade/vblade_25.bb
index 7f20e927c6..54bb798344 100644
--- a/meta-networking/recipes-daemons/vblade/vblade_25.bb
+++ b/meta-networking/recipes-daemons/vblade/vblade_25.bb
@@ -20,7 +20,7 @@ S =3D "${WORKDIR}/git"
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/OpenAoE/vblade/archive/"
=20
-inherit autotools-brokensep update-rc.d systemd
+inherit update-rc.d systemd
=20
 do_install() {
     install -D -m 0755 ${S}/vblade ${D}/${sbindir}/vblade
--=20
2.43.0


