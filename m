Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 332D1C982FA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 02:58:58 +0000 (UTC)
Received: from newzmoby.atcorp.com (newzmoby.atcorp.com [50.173.197.71])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2298.1790127071279461540
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Sep 2026 18:31:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@atcorp.com header.s=1376564E-C82E-11ED-954F-3FCE35F171BA header.b=WBf6lZKD;
 spf=pass (domain: atcorp.com, ip: 50.173.197.71, mailfrom: csiltala@atcorp.com)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by newzmoby.atcorp.com (Postfix) with ESMTP id A50B835A1B3E;
	Tue, 22 Sep 2026 20:24:44 -0500 (CDT)
Authentication-Results: newzmoby.atcorp.com (amavis); dkim=pass (2048-bit key)
 header.d=atcorp.com
Received: from newzmoby.atcorp.com ([127.0.0.1])
 by localhost (newzmoby.atcorp.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id wQi6jZLoa2Ug; Tue, 22 Sep 2026 20:24:44 -0500 (CDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by newzmoby.atcorp.com (Postfix) with ESMTP id 9D34E35A1B3F;
	Tue, 22 Sep 2026 20:24:44 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 newzmoby.atcorp.com 9D34E35A1B3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=atcorp.com;
	s=1376564E-C82E-11ED-954F-3FCE35F171BA; t=1790126684;
	bh=O2Pt97qvpvhUh9tz6Ky3DVYLdnbf3mvyB5TOTnU/XME=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=WBf6lZKDobAay8r7cLJySzrmDCS9LOMxHf8U74cSW0qxeZijH5xdvDL3zwO9E++Ea
	 ea+vDcSg+nC0Mdvm2w4OtI1BZt+1w/pndn/P5zUxPrKQd4VBOWPHJJpv3yr8ZpGUrt
	 olzaOaTCsDBUPYvKSAWo8BR0EYnM0nD/R4OcP45Tr3KkiYk/zUOiIemL6fp2zOU6K9
	 aT1/tHfs0tIiKDK9SsZjVMVl5gfOz2DRkkxI1PlEHodrt5uRiBP7WFUg+vwR5RVQTU
	 kpcD2AILpru1Qlxwu2hOkNNl8PJdoDjSW1YJ2lvbudQaRTB/IjN9iE7yuOOSmkuLVz
	 eOpekYyQCZ3kQ==
Received: from newzmoby.atcorp.com ([127.0.0.1])
 by localhost (newzmoby.atcorp.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id O3juDTzYeeeT; Tue, 22 Sep 2026 20:24:44 -0500 (CDT)
Received: from cs-ubuntu.atcorp.priv (unknown [192.168.235.141])
	by newzmoby.atcorp.com (Postfix) with ESMTPSA id 92D7535A1B3E;
	Tue, 22 Sep 2026 20:24:44 -0500 (CDT)
From: Corey Siltala <csiltala@atcorp.com>
To: openembedded-devel@lists.openembedded.org
Cc: Corey Siltala <csiltala@atcorp.com>
Subject: [meta-networking][PATCH] bmon: upgrade 4.0 -> 5.0
Date: Tue, 22 Sep 2026 20:24:42 -0500
Message-Id: <20260923012442.3830864-1-csiltala@atcorp.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 02:58:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130177

Fixes:
- out_curses: use xcalloc instead of a fixed buffer
- Avoid trying to include <values.h> on Android
- Fix typographical errors
- curses: Fix seperator lines
- Fix build in FreeBSD/DragonflyBSD
- fix segfault on element removal
- fix: Fix memory leaks in module_set()
- fix: Convert usage of strdup/free to xstrdup/xfree
- Fix compile issue in OpenBSD
- Fix spelling and grammar in docs and comments

Features:
- Allow numeric colors in bmonrc
- curses: Add CTRL-N/CTRL-P for next/previous element
- feat: Add IPv4/IPv6 addresses to additional info
- feat: Add configure option to disable IPv6 in netlink module
- feat: Add ability to toggle TC elements
- curses: render graphs with Braille cells
- display filters for TC ingress and egress
- Add support for JSON output
- Remove the 'Really quit' dialog and just exit cleanly

Misc:
- Update to autoconf of the common era

See full release notes at https://github.com/Jafaral/bmon/releases/tag/v5=
.0

Signed-off-by: Corey Siltala <csiltala@atcorp.com>
---
 .../recipes-support/bmon/{bmon_4.0.bb =3D> bmon_5.0.bb}        | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/bmon/{bmon_4.0.bb =3D> bmon_5.0.b=
b} (56%)

diff --git a/meta-networking/recipes-support/bmon/bmon_4.0.bb b/meta-netw=
orking/recipes-support/bmon/bmon_5.0.bb
similarity index 56%
rename from meta-networking/recipes-support/bmon/bmon_4.0.bb
rename to meta-networking/recipes-support/bmon/bmon_5.0.bb
index f47069471a..0ceff05984 100644
--- a/meta-networking/recipes-support/bmon/bmon_4.0.bb
+++ b/meta-networking/recipes-support/bmon/bmon_5.0.bb
@@ -1,11 +1,10 @@
 DESCRIPTION =3D "Portable Bandwidth Monitor and rate estimator"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
-# only works with libnl-0.5.0
 DEPENDS =3D "libnl libconfuse ncurses"
=20
-SRCREV =3D "1b3f11bde315e221474f7d066ce4efb4ff4d39e3"
-SRC_URI =3D "git://github.com/tgraf/bmon.git;branch=3Dmaster;protocol=3D=
https"
+SRC_URI =3D "https://github.com/Jafaral/${BPN}/releases/download/v${PV}/=
${BPN}-${PV}.tar.gz"
+SRC_URI[sha256sum] =3D "6016e41fdda9166b86b09a0ac601a0c453c3b35acdf904c9=
7a8a555459ad73c0"
=20
 inherit autotools pkgconfig
=20
--=20
2.34.1


