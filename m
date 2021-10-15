Return-Path: <douglas.royds@taitradio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09AC9C433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 00:13:49 +0000 (UTC)
Received: from smtp0.taitradio.net (smtp0.taitradio.net [202.37.96.22])
 by mx.groups.io with SMTP id smtpd.web08.3079.1634256827319463973
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 17:13:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: taitradio.com, ip: 202.37.96.22, mailfrom: douglas.royds@taitradio.com)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id E111FE05C5;
	Fri, 15 Oct 2021 13:13:43 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-devel@lists.openembedded.org
Cc: Douglas Royds <douglas.royds@taitradio.com>
Subject: [meta-java][PATCH] openjdk-build-helper: Use python raw string for
 regex pattern
Date: Fri, 15 Oct 2021 13:13:41 +1300
Message-Id: <20211015001341.588817-2-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211015001341.588817-1-douglas.royds@taitradio.com>
References: <20211015001341.588817-1-douglas.royds@taitradio.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 00:13:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93315

See https://docs.python.org/3/library/re.html

Invalid escape sequences in Python=E2=80=99s usage of the backslash in st=
ring literals
now generate a DeprecationWarning, and in the future this will become a
SyntaxError. The solution is to use Python=E2=80=99s raw string notation =
for regular
expression patterns; backslashes are not handled in any special way in a =
string
literal prefixed with 'r'.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 classes/openjdk-build-helper.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/classes/openjdk-build-helper.bbclass b/classes/openjdk-build=
-helper.bbclass
index a4b77a0..07cbcd3 100644
--- a/classes/openjdk-build-helper.bbclass
+++ b/classes/openjdk-build-helper.bbclass
@@ -45,7 +45,7 @@ def openjdk_build_helper_get_target_cflags(d):
     # doesn't work anyway.
     version =3D d.getVar('GCCVERSION')[0]
     # skip non digit characters at the beginning, e.g. from "linaro-6.2%=
"
-    match =3D re.search("\d", version)
+    match =3D re.search(r"\d", version)
     if match:
         version =3D version[match.start():]
     return openjdk_build_helper_get_cflags_by_cc_version(d, version)
--=20
2.30.2


