Return-Path: <jk@codeconstruct.com.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1320DC433F5
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 02:59:22 +0000 (UTC)
Received: from codeconstruct.com.au (codeconstruct.com.au [203.29.241.158])
 by mx.groups.io with SMTP id smtpd.web12.1740.1639709960762514921
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 18:59:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: codeconstruct.com.au,
 ip: 203.29.241.158, mailfrom: jk@codeconstruct.com.au)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id 394F42022C; Fri, 17 Dec 2021 10:59:18 +0800 (AWST)
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/2] contrib: allow override-style syntax for vars & routines
Date: Fri, 17 Dec 2021 10:59:10 +0800
Message-Id: 
 <23442f7ad508ed66ef43adff0c32a45b07d6fc6f.1639709734.git.jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Dec 2021 02:59:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94421

Currently, the variable and routine regexes don't support the
override-style syntax. This means we may break routine blocks, as we
don't recognise overridden routines with an :append/:prepend/etc.

This change adds the ":" char to the var & routine regexes.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
 contrib/oe-stylize.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/contrib/oe-stylize.py b/contrib/oe-stylize.py
index e1ba1b321..67c06b1bb 100755
--- a/contrib/oe-stylize.py
+++ b/contrib/oe-stylize.py
@@ -210,8 +210,8 @@ OE_vars =3D [
     'others'
 ]
=20
-varRegexp =3D r'^([a-zA-Z_0-9${}-]*)([ \t]*)([+.:]?=3D[+.]?)([ \t]*)([^\=
t]+)'
-routineRegexp =3D r'^([a-zA-Z0-9_ ${}-]+?)\('
+varRegexp =3D r'^([a-zA-Z_0-9${}:-]*)([ \t]*)([+.:]?=3D[+.]?)([ \t]*)([^=
\t]+)'
+routineRegexp =3D r'^([a-zA-Z0-9_ ${}:-]+?)\('
=20
 # Variables seen in the processed .bb
 seen_vars =3D {}
--=20
2.33.0


