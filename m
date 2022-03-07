Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40ED7C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 17:01:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.369.1646672468324840098
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 09:01:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 749BE153B
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 09:01:07 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1EB643FA45
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 09:01:07 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v3 1/5] python3-blivetgui: use setuptools_legacy
Date: Mon,  7 Mar 2022 17:01:00 +0000
Message-Id: <20220307170104.3671129-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 17:01:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95866

The setup.py installs to arbitrary target paths, so can't use the new
bdist_wheel installation method.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivetgui=
_2.3.0.bb b/meta-python/recipes-extended/python-blivet/python3-blivetgui_=
2.3.0.bb
index 89f1c700f4..c26ae1fe98 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.=
bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.=
bb
@@ -16,7 +16,7 @@ SRC_URI =3D "git://github.com/storaged-project/blivet-g=
ui.git;branch=3Dmaster;protoc
 inherit features_check
 REQUIRED_DISTRO_FEATURES =3D "x11 systemd"
=20
-inherit setuptools3 python3native
+inherit setuptools3_legacy python3native
=20
 PIP_INSTALL_PACKAGE =3D "blivet_gui"
=20
--=20
2.25.1


