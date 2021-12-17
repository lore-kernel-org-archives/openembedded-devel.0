Return-Path: <jk@codeconstruct.com.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14752C433FE
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 02:59:22 +0000 (UTC)
Received: from codeconstruct.com.au (codeconstruct.com.au [203.29.241.158])
 by mx.groups.io with SMTP id smtpd.web09.1790.1639709960764914507
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 18:59:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: codeconstruct.com.au,
 ip: 203.29.241.158, mailfrom: jk@codeconstruct.com.au)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id 7E8C02027B; Fri, 17 Dec 2021 10:59:18 +0800 (AWST)
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] contrib: fix python warnings for oe-stylize
Date: Fri, 17 Dec 2021 10:59:11 +0800
Message-Id: 
 <6b4456a84e51492f0df94a9c0816c984f333ada0.1639709734.git.jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.33.0
In-Reply-To: 
 <23442f7ad508ed66ef43adff0c32a45b07d6fc6f.1639709734.git.jk@codeconstruct.com.au>
References: 
 <23442f7ad508ed66ef43adff0c32a45b07d6fc6f.1639709734.git.jk@codeconstruct.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Dec 2021 02:59:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94422

I get a couple of python SyntaxWarnings when running oe-stylize:

  [jk@pecola meta-openembedded]$ python3 contrib/oe-stylize.py
  contrib/oe-stylize.py:372: SyntaxWarning: "is not" with a literal. Did =
you mean "!=3D"?
    if line is not '':
  contrib/oe-stylize.py:389: SyntaxWarning: "is" with a literal. Did you =
mean "=3D=3D"?
    if line.isspace() or line is '':

The 'is' operator is for object reference comparison, which is not what
we want here. Change to '=3D=3D' / '!=3D' instead.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
 contrib/oe-stylize.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/contrib/oe-stylize.py b/contrib/oe-stylize.py
index 67c06b1bb..30b460e12 100755
--- a/contrib/oe-stylize.py
+++ b/contrib/oe-stylize.py
@@ -369,7 +369,7 @@ if __name__ =3D=3D "__main__":
             line =3D line.expandtabs().rstrip()
             # ignore empty lines (or line filled with spaces or tabs onl=
y)
             # so that rule6 is always respected
-            if line is not '':
+            if line !=3D '':
                 lines.append(line)
=20
     # -- parse the file --
@@ -386,7 +386,7 @@ if __name__ =3D=3D "__main__":
         line =3D follow_rule(6, line)
=20
         # ignore empty lines
-        if line.isspace() or line is '':
+        if line.isspace() or line =3D=3D '':
             # flush comments into the olines
             for c in commentBloc:
                 olines.append(c)
--=20
2.33.0


