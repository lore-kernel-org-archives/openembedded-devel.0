Return-Path: <diego.sueiro@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A81DC433EF
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 07:00:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.1926.1652857228343295070
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 May 2022 00:00:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: diego.sueiro@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11F931042;
	Wed, 18 May 2022 00:00:27 -0700 (PDT)
Received: from e120809.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3AE013F73D;
	Wed, 18 May 2022 00:00:26 -0700 (PDT)
From: Diego Sueiro <diego.sueiro@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: wangmy@fujitsu.com,
	raj.khem@gmail.com,
	nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [meta-oe][kirkstone][PATCH] bats: upgrade 1.6.0 -> 1.6.1
Date: Wed, 18 May 2022 08:00:18 +0100
Message-Id: 
 <927b13ca2f4e0abe87031444dba53c7f4d1867d6.1652857090.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 May 2022 07:00:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97153

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Fixed:
------
prevent teardown, teardown_file, and teardown_suite from overriding bats'
exit code by setting $status (e.g. via calling run) (#581, #575)
CRITICAL: this can return exit code 0 despite failed tests, thus preventi=
ng
your CI from reporting test failures! The regression happened in version =
1.6.0.

Documentation:
--------------
corrected invalid documentation of run -N (had =3DN instead) (#579)
CRITICAL: using the incorrect form can lead to silent errors. See issue #=
578
for more details and how to find out if your tests are affected.

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../recipes-test/bats/{bats_1.6.0.bb =3D> bats_1.6.1.bb}   | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-test/bats/{bats_1.6.0.bb =3D> bats_1.6.1.bb} (85%=
)

diff --git a/meta-oe/recipes-test/bats/bats_1.6.0.bb b/meta-oe/recipes-te=
st/bats/bats_1.6.1.bb
similarity index 85%
rename from meta-oe/recipes-test/bats/bats_1.6.0.bb
rename to meta-oe/recipes-test/bats/bats_1.6.1.bb
index 7ea1aa8f3..7d72a5198 100644
--- a/meta-oe/recipes-test/bats/bats_1.6.0.bb
+++ b/meta-oe/recipes-test/bats/bats_1.6.1.bb
@@ -6,9 +6,12 @@ HOMEPAGE =3D "https://github.com/bats-core/bats-core"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D2970203aedf9e829edb96a137a=
4fe81b"
=20
-SRC_URI =3D "git://github.com/bats-core/bats-core.git;branch=3Dmaster;pr=
otocol=3Dhttps"
-# v1.4.1
-SRCREV =3D "210acf3a8ed318ddedad3137c15451739beba7d4"
+SRC_URI =3D "\
+  git://github.com/bats-core/bats-core.git;branch=3Dversion/1.6.x;protoc=
ol=3Dhttps \
+  "
+
+# v1.6.1
+SRCREV =3D "1977254c2a7faa2e0af17355856f91dc471d1daa"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.35.1


