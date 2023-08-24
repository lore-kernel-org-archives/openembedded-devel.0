Return-Path: <p.chernikov@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5778C3DA6F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 13:10:45 +0000 (UTC)
Received: from mta-04.yadro.com (mta-04.yadro.com [89.207.88.248])
 by mx.groups.io with SMTP id smtpd.web10.10457.1692882642868238529
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Aug 2023 06:10:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-04 header.b=EgRqRTRq;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-03 header.b=ihm5BNce;
 spf=pass (domain: yadro.com, ip: 89.207.88.248, mailfrom: p.chernikov@yadro.com)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com 0549AC0002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1692882639; bh=fsw3I+pNF0/Rehb2hBqVRsLtvBx8el0S2udgyvEq7Lc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=EgRqRTRqO6crwKGiwHViDkA3/+15DHWFkrZ1H6qPmSeWAVdPupaWUYdyGrOUPbu+r
	 FMaaImUYyMjH6CdBY6kK+9AN0OwskgOWX/04CZlgH2syuOO52kwZA/riVwCt+uN5dZ
	 uZvmVsXIjZept4RXWYnpd7TyIpQivU7DXb7o6uIUQcRtYHHW2BP3W0G2xnYeJwb+05
	 apOvOWcflhVhlKWTjXXIXyYnjJdvT/ggmnIyTh8WTE1n8OJvXbQYZsxxNBlb5S25Zv
	 Jnieq1VfD/47f4+R3Z2IAGD1Ufg/2XK/+bATgbKAgfxHlSM18GvkTHzW9c9nC+84Qy
	 a6rw5GBaKKVfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1692882639; bh=fsw3I+pNF0/Rehb2hBqVRsLtvBx8el0S2udgyvEq7Lc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=ihm5BNceVxkI4sxhBWJOgTS4m4fr38zOvaFKRvAYjD9rT/8rJFX7vyu6jdXwF3jI6
	 XQVmQkr31KMO87EQamXNzof9YCK9hXy+dY9nQ/FzyUzKyA54vlrJWFxhaJdqyatiyp
	 yhBONnn0Ve/9UsOSUINkwiIGPo3RHxNmtUwFw9s0g2O24UzdeXWY454QDc5z6ehy6j
	 CP8Tc6PFXaRMQreYf/UnvvEkKN31yBJmkUT0EJOCHuWFSlE+4lPToAnZOx3dImyW+U
	 q62AnwOTTvahxmyliNsEz3AEVNqF1YeNJtUTrXnHVy6IkhnSr86Xm2mr+8hhFlPtxX
	 wXciE6JGWocXw==
From: Petr Chernikov <p.chernikov@yadro.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Petr Chernikov <p.chernikov@yadro.com>
Subject: [PATCH] Fix empty 0.0.0-0-g0 jemalloc version by adding --with-version
Date: Thu, 24 Aug 2023 16:08:27 +0300
Message-ID: <20230824130827.3050601-1-p.chernikov@yadro.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: T-Exch-05.corp.yadro.com (172.17.10.109) To
 T-EXCH-08.corp.yadro.com (172.17.11.58)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 13:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104589

Empty "0.0.0-0-g0" jemalloc version may affect build and usage
of some applications. For example, it affects folly build and
usage and leads segmentation fault in some cases.

Signed-off-by: Petr Chernikov <p.chernikov@yadro.com>
---
 meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb b/meta-o=
e/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
index 9ad83261e..2ce23d152 100644
--- a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
+++ b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
@@ -29,6 +29,9 @@ inherit autotools ptest
 EXTRA_AUTORECONF +=3D "--exclude=3Dautoheader"
=20
 EXTRA_OECONF:append:libc-musl =3D " --with-jemalloc-prefix=3Dje_"
+# For some reason VERSION file populated only in tarball distribution.
+# Adding jemalloc version since this recipe is using source code from gi=
t tag
+EXTRA_OECONF:append =3D " --with-version=3D${PV}-0-g${SRCREV}"
=20
 do_install:append() {
 	sed -i -e 's@${STAGING_DIR_HOST}@@g' \
--=20
2.30.2


