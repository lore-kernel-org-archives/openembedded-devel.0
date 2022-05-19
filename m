Return-Path: <diego.sueiro@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7AAEC433EF
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 15:10:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8824.1652973018965630502
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 08:10:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: diego.sueiro@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2857514BF;
	Thu, 19 May 2022 08:10:18 -0700 (PDT)
Received: from e120809.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 71F633F66F;
	Thu, 19 May 2022 08:10:17 -0700 (PDT)
From: Diego Sueiro <diego.sueiro@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: kai.kang@windriver.com,
	raj.khem@gmail.com,
	nd@arm.com
Subject: [meta-networking][kirkstone][PATCH] conntrack-tools: fix postinst
 script
Date: Thu, 19 May 2022 16:10:11 +0100
Message-Id: 
 <8b93096f9a3d3fb1fd7fa440f578ea4ae95d8ced.1652972909.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 May 2022 15:10:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97199

From: Kai Kang <kai.kang@windriver.com>

Fix error caused by postinst script of conntrack-tools:

| /var/tmp/rpm-tmp.or09Iq: line 4: unexpected EOF while looking for match=
ing `"'
| %post(conntrack-tools-1.4.6-r0.core2_64): waitpid(1173) rc 1173 status =
200
| warning: %post(conntrack-tools-1.4.6-r0.core2_64) scriptlet failed, exi=
t status 2

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-filter/conntrack-tools/conntrack-tools_1.4.6.bb   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-filter/conntrack-tools/conntrack-too=
ls_1.4.6.bb b/meta-networking/recipes-filter/conntrack-tools/conntrack-to=
ols_1.4.6.bb
index e76238fe0..50f7ced88 100644
--- a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.=
6.bb
+++ b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.=
6.bb
@@ -35,5 +35,5 @@ do_install:append() {
=20
 # fix error message: Do not forget that you need *root* or CAP_NET_ADMIN=
 capabilities ;-)
 pkg_postinst:${PN} () {
-    setcap cap_net_admin+ep $D/${sbindir}/conntrack"
-}
\ No newline at end of file
+    setcap cap_net_admin+ep "$D/${sbindir}/conntrack"
+}
--=20
2.35.1


