Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2029FEF9018
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 09:23:12 +0000 (UTC)
Received: from smtp1.taitradio.net (smtp1.taitradio.net [202.37.96.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37216.1772685235093332859
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Mar 2026 20:33:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: taitcommunications.com, ip: 202.37.96.23, mailfrom: douglas.royds@taitcommunications.com)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id 441CF4043A;
	Thu,  5 Mar 2026 16:55:00 +1300 (NZDT)
From: "Douglas Royds" <douglas.royds@taitcommunications.com>
To: openembedded-devel@lists.openembedded.org
Cc: Douglas Royds <douglas.royds@taitcommunications.com>
Subject: [meta-java][PATCH] cacao: Update for gcc13
Date: Thu,  5 Mar 2026 16:54:59 +1300
Message-ID: <20260305035459.3561243-2-douglas.royds@taitcommunications.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305035459.3561243-1-douglas.royds@taitcommunications.com>
References: <20260305035459.3561243-1-douglas.royds@taitcommunications.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 09:23:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124865

Modern g++ versions require operator=3D=3D and operator!=3D for the DumpM=
emoryAllocator.

Moved over to github, where this commit has been accepted upstream.

Signed-off-by: Douglas Royds <douglas.royds@taitcommunications.com>
---
 recipes-core/cacao/cacao_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/cacao/cacao_git.bb b/recipes-core/cacao/cacao_g=
it.bb
index fef7f34..12b8db3 100644
--- a/recipes-core/cacao/cacao_git.bb
+++ b/recipes-core/cacao/cacao_git.bb
@@ -10,8 +10,8 @@ PROVIDES:class-native =3D "virtual/java-native"
 DEPENDS =3D "zlib libtool classpath virtual/javac-native bdwgc"
 RPROVIDES:${PN} =3D "java2-runtime"
=20
-SRCREV =3D "6c4694f9bd175386a8c451531e9a5ad97aa23b6f"
-SRC_URI =3D "git://bitbucket.org/cacaovm/cacao.git;protocol=3Dhttps;bran=
ch=3Dmaster \
+SRCREV =3D "b29fd96d2fd1dd8afc897febdb5261371f2c9348"
+SRC_URI =3D "git://github.com/tekknolagi/cacao.git;protocol=3Dhttps;bran=
ch=3Dmaster \
            file://0001-java.in-Do-not-use-hardcode-paths.patch \
            file://0002-cacao-use-system-s-boehm-garbage-collector.patch =
\
 "
--=20
2.43.0


