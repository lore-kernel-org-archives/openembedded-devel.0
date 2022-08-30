Return-Path: <bernhard.messerklinger@br-automation.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 395CBECAAD4
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 11:19:04 +0000 (UTC)
Received: from inet11.abb.com (inet11.abb.com [138.225.1.77])
 by mx.groups.io with SMTP id smtpd.web10.10112.1661858336689648565
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 04:18:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 spf3.br-automation.com}: parse error for
 token &{10 18 spf.protection.outlook.com}: parse error for token &{10 18
 spfd.protection.outlook.com}: limit exceeded (domain: br-automation.com,
 ip: 138.225.1.77, mailfrom: bernhard.messerklinger@br-automation.com)
Received: from brsmtp01.br-automation.co.at ([10.15.2.36])
	by inet11.abb.com (8.14.7/8.14.7) with ESMTP id 27UBIrhe004410
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 13:18:54 +0200
Received: from extmail.br-automation.com ([192.168.112.26])
          by brsmtp01.br-automation.co.at (IBM Domino Release 10.0.1FP3)
          with ESMTP id 2022083013185265-63141 ;
          Tue, 30 Aug 2022 13:18:52 +0200
Received: from ATEGGE3725.br-automation.co.at ([10.43.64.28])
          by extmail.br-automation.com (IBM Domino Release 10.0.1FP3)
          with ESMTP id 2022083013185286-12474 ;
          Tue, 30 Aug 2022 13:18:52 +0200
From: "Bernhard Messerklinger" <bernhard.messerklinger@br-automation.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Bernhard Messerklinger" <bernhard.messerklinger@br-automation.com>
Subject: [meta-perl][PATCH] libconfig-tiny-perl: add recipe
Date: Tue, 30 Aug 2022 13:18:38 +0200
Message-Id: <20220830111838.4262-1-bernhard.messerklinger@br-automation.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on BRSMTPINTERN2/InternSMTP(Release
 10.0.1FP3|August
 09,
 2019) at 30/08/2022 13:18:52,Serialize by Router on BRSMTPINTERN2/InternSMTP(Release
 10.0.1FP3|August 09, 2019) at
 30/08/2022 13:18:52,Itemize by SMTP Server on
 BRSMTP01/Eggelsberg/AT/B&R(Release 10.0.1FP3|August
 09, 2019) at 08/30/2022 01:18:52 PM
X-TNEFEvaluated: 1
X-Disclaimed: 23515
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Aug 2022 11:19:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98561

libconfig-tiny-perl is a perl module for read/write .ini style files
---
 .../libconfig-tiny-perl=5F2.28.bb               | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-pe=
rl=5F2.28.bb

diff --git a/meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-perl=5F2.=
28.bb b/meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-perl=5F2.28.bb
new file mode 100644
index 000000000..ff28c7663
--- /dev/null
+++ b/meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-perl=5F2.28.bb
@@ -0,0 +1,20 @@
+SUMMARY =3D "Perl module for read/write .ini style files"
+DESCRIPTION =3D "Config::Tiny is a Perl class to read and write .ini \
+configuration files with as little code as possible, reducing load time an=
d \
+memory overhead."
+
+HOMEPAGE =3D "https://search.cpan.org/dist/Config-Tiny"
+SECTION =3D "libraries"
+
+LICENSE =3D "Artistic-1.0 | GPL-1.0-or-later"
+LIC=5FFILES=5FCHKSUM =3D "file://LICENSE;md5=3Dab27c3cedbdb0eb6e656a872247=
6191a"
+
+RDEPENDS:${PN} +=3D "perl"
+
+S =3D "${WORKDIR}/Config-Tiny-${PV}"
+
+SRC=5FURI =3D "http://search.cpan.org/CPAN/authors/id/R/RS/RSAVAGE/Config-=
Tiny-${PV}.tgz"
+
+SRC=5FURI[sha256sum] =3D "12df843a0d29d48f61bcc14c4f18f0858fd27a8dd829a003=
19529d654fe01500"
+
+inherit cpan
--=20
2.37.2



