Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0659FCA5FB1
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 11:38:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11313.1790768282364676427
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 04:38:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=A69RWvgm;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58EE5497
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 04:37:58 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 659103F86F
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 04:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790768281; bh=Jf5LYDJWiYjFbTuSCbCo4qk+IQPAuyduxtGBVf4n24s=;
	h=From:To:Subject:Date:From;
	b=A69RWvgmbxgFZnAt+9LOcaBVhLBzz9STwhoz3TtK6Ko7aSg9vgkcn9fTdRweJEHtw
	 P3emQqhGxkzxBIkpo2Svl2SMqN5inoX3KiDSHQANhgvLAShmQ3hyiSycHn4YG5hESt
	 cW9ypV1GZPPONHWjUejMzWaRg3DK7N8oDwLvgRdE=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] postgresql: work around occasional build failures due to a dependency race
Date: Wed, 30 Sep 2026 12:37:57 +0100
Message-ID: <20260930113757.2598658-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 11:38:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130522

There are two routes to building jsonapi.o, and one of them adds CPPFLAGS
that then break the build.  Ensure the correct route is always taken by
explicitly building it first.

This has been reported upstream and more details are in the linked mail.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-dbs/postgresql/postgresql.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/reci=
pes-dbs/postgresql/postgresql.inc
index 5f255be33d..76e90df765 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -181,6 +181,13 @@ do_configure() {
     fi
 }
=20
+# There's a makefile dependency race that causes occasional build
+# failures, so build this object first to avoid the race.
+# https://www.postgresql.org/message-id/CAAnfSTv_Vj9oH2vUs56KwDdbmfrOhuT=
b1o%2B6TXzBW_uUjOJpkg%40mail.gmail.com
+do_compile:prepend() {
+    make -C src/common jsonapi.o
+}
+
 do_compile:append() {
     oe_runmake -C contrib all
=20
--=20
2.43.0


