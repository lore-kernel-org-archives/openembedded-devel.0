Return-Path: <douglas.royds@taitradio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C87BFC433F5
	for <webhook@archiver.kernel.org>; Wed,  3 Nov 2021 01:52:22 +0000 (UTC)
Received: from smtp0.taitradio.net (smtp0.taitradio.net [202.37.96.22])
 by mx.groups.io with SMTP id smtpd.web12.2042.1635904341492110889
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Nov 2021 18:52:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: taitradio.com, ip: 202.37.96.22, mailfrom: douglas.royds@taitradio.com)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id A440AE04E3;
	Wed,  3 Nov 2021 14:52:20 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-devel@lists.openembedded.org
Cc: Douglas Royds <douglas.royds@taitradio.com>
Subject: [meta-virtualization][PATCH] runtime-spec: master branch renamed as
 main
Date: Wed,  3 Nov 2021 14:52:01 +1300
Message-Id: <20211103015201.572934-2-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211103015201.572934-1-douglas.royds@taitradio.com>
References: <20211103015201.572934-1-douglas.royds@taitradio.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Nov 2021 01:52:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93798

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 recipes-containers/crun/crun_git.bb                         | 2 +-
 recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/crun/crun_git.bb b/recipes-containers/cru=
n/crun_git.bb
index 68f7f43..7155494 100644
--- a/recipes-containers/crun/crun_git.bb
+++ b/recipes-containers/crun/crun_git.bb
@@ -12,7 +12,7 @@ SRCREV_yajl =3D "f344d21280c3e4094919fd318bc5ce75da91fc=
06"
 SRCREV_FORMAT =3D "crun_rspec"
 SRC_URI =3D "git://github.com/containers/crun.git;branch=3Dmain;name=3Dc=
run;protocol=3Dhttps \
            git://github.com/containers/libocispec.git;branch=3Dmain;name=
=3Dlibocispec;destsuffix=3Dgit/libocispec;protocol=3Dhttps \
-           git://github.com/opencontainers/runtime-spec.git;branch=3Dmas=
ter;name=3Drspec;destsuffix=3Dgit/libocispec/runtime-spec;protocol=3Dhttp=
s \
+           git://github.com/opencontainers/runtime-spec.git;branch=3Dmai=
n;name=3Drspec;destsuffix=3Dgit/libocispec/runtime-spec;protocol=3Dhttps =
\
            git://github.com/opencontainers/image-spec.git;branch=3Dmain;=
name=3Dispec;destsuffix=3Dgit/libocispec/image-spec;protocol=3Dhttps \
            git://github.com/containers/yajl.git;branch=3Dmain;name=3Dyaj=
l;destsuffix=3Dgit/libocispec/yajl;protocol=3Dhttps \
           "
diff --git a/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb =
b/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb
index d30868c..5560827 100644
--- a/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb
+++ b/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://src/${PKG_NAME}/LICENSE;md5=3D=
b355a61a394a504dacde901c9
 SRCNAME =3D "runtime-spec"
=20
 PKG_NAME =3D "github.com/opencontainers/${SRCNAME}"
-SRC_URI =3D "git://${PKG_NAME}.git;destsuffix=3Dgit/src/${PKG_NAME};bran=
ch=3Dmaster"
+SRC_URI =3D "git://${PKG_NAME}.git;destsuffix=3Dgit/src/${PKG_NAME};bran=
ch=3Dmain"
=20
 SRCREV =3D "ab23082b188344f6fbb63a441ea00ffc2852d06d"
 PV =3D "v1.0.2+git${SRCPV}"
--=20
2.32.0


