Return-Path: <diego.sueiro@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 143F0C433F5
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 13:08:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11138.1652274488526469783
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 May 2022 06:08:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: diego.sueiro@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F025ED1;
	Wed, 11 May 2022 06:08:07 -0700 (PDT)
Received: from e120809.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D0E343F66F;
	Wed, 11 May 2022 06:08:06 -0700 (PDT)
From: Diego Sueiro <diego.sueiro@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: boubaker.bassem.1991l@gmail.com,
	nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [meta-oe][PATCH] conntrack-tools: Fix package installation during
 do_rootfs
Date: Wed, 11 May 2022 14:07:58 +0100
Message-Id: 
 <e23403a11573525606c6f2eff1f6429b76889047.1652273541.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 May 2022 13:08:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97035

Fix the following error message:

do_rootfs: Postinstall scriptlets of ['conntrack-tools'] have failed. If =
the intention is to defer them to first boot,
then please place them into pkg_postinst_ontarget:${PN} ().
Deferring to first boot via 'exit 1' is no longer supported.

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../recipes-filter/conntrack-tools/conntrack-tools_1.4.6.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-filter/conntrack-tools/conntrack-too=
ls_1.4.6.bb b/meta-networking/recipes-filter/conntrack-tools/conntrack-to=
ols_1.4.6.bb
index e76238fe0..28dfc0325 100644
--- a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.=
6.bb
+++ b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.=
6.bb
@@ -34,6 +34,6 @@ do_install:append() {
 }
=20
 # fix error message: Do not forget that you need *root* or CAP_NET_ADMIN=
 capabilities ;-)
-pkg_postinst:${PN} () {
-    setcap cap_net_admin+ep $D/${sbindir}/conntrack"
-}
\ No newline at end of file
+pkg_postinst_ontarget:${PN} () {
+    setcap cap_net_admin+ep ${sbindir}/conntrack"
+}
--=20
2.35.1


