Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0669EC3DA78
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 17:27:37 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.94382.1673630853016281437
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Jan 2023 09:27:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from alsamon-xub.lan (cpe-68-201-55-29.elp.res.rr.com [68.201.55.29])
	by linux.microsoft.com (Postfix) with ESMTPSA id 00ACE20DED6B;
	Fri, 13 Jan 2023 09:27:31 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 00ACE20DED6B
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-devel@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH] imapfilter: update 2.7.6 -> 2.8.1
Date: Fri, 13 Jan 2023 10:27:27 -0700
Message-Id: <20230113172727.2565686-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Jan 2023 17:27:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100568

- Changes in this release [1]

- License checksum changed because dates got updated.

[1] https://github.com/lefcha/imapfilter/compare/v2.7.6...v2.8.1

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 .../imapfilter/{imapfilter_2.7.6.bb =3D> imapfilter_2.8.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/imapfilter/{imapfilter_2.7.6.bb =3D> imap=
filter_2.8.1.bb} (78%)

diff --git a/meta-oe/recipes-support/imapfilter/imapfilter_2.7.6.bb b/met=
a-oe/recipes-support/imapfilter/imapfilter_2.8.1.bb
similarity index 78%
rename from meta-oe/recipes-support/imapfilter/imapfilter_2.7.6.bb
rename to meta-oe/recipes-support/imapfilter/imapfilter_2.8.1.bb
index eb23816e8..3ab87f498 100644
--- a/meta-oe/recipes-support/imapfilter/imapfilter_2.7.6.bb
+++ b/meta-oe/recipes-support/imapfilter/imapfilter_2.8.1.bb
@@ -1,9 +1,9 @@
 SUMMARY =3D "IMAPFilter is a mail filtering utility that processes mailb=
oxes based on IMAP queries"
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc11d4fd926d3ce7aac13b0ed1e9b3=
a63"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df8d2fc4954306888fd0e4b27bef83=
525"
=20
-# v2.7.6
-SRCREV =3D "b39d0430f29d7c953581186955c11b461e6c824f"
+# v2.8.1
+SRCREV =3D "e6372b88e09a4d1c573b57270de6b40846825a8b"
 SRC_URI =3D "git://github.com/lefcha/imapfilter;protocol=3Dhttps;branch=3D=
master \
            file://ldflags.patch \
 "
--=20
2.34.1


