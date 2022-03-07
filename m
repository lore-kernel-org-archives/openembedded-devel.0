Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE2CBC433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 12:11:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.25390.1646655076380527552
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 04:11:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 858161042
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 04:11:15 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2E1D43F73D
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 04:11:15 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] python3-blivet: use setuptools_legacy
Date: Mon,  7 Mar 2022 12:11:12 +0000
Message-Id: <20220307121112.1844760-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307121112.1844760-1-ross.burton@arm.com>
References: <20220307121112.1844760-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 12:11:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95848

The setup.py installs to arbitrary target paths, so can't use the new
bdist_wheel installation method.

Reverts daba6521f which was a sympton of the bad usage.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python-blivet/python3-blivet_3.4.3.bb                 | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet_3.=
4.3.bb b/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.3.=
bb
index fcadf130c9..bd57604f26 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.3.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.3.bb
@@ -19,16 +19,10 @@ SRC_URI +=3D "\
 "
 SRC_URI[sha256sum] =3D "1b05b77f3ee35d82c7a577a168c9ba0204d3e9a87eb1975e=
5f9af47700eeff48"
=20
-inherit pypi features_check systemd setuptools3
+inherit pypi features_check systemd setuptools3_legacy
=20
 REQUIRED_DISTRO_FEATURES =3D "systemd"
=20
-do_install:append() {
-    mv ${D}${PYTHON_SITEPACKAGES_DIR}${exec_prefix}/* ${D}${exec_prefix}
-    mv ${D}${PYTHON_SITEPACKAGES_DIR}${sysconfdir} ${D}
-    mv ${D}${PYTHON_SITEPACKAGES_DIR}${base_libdir} ${D}
-}
-
 RDEPENDS:${PN} +=3D "python3-pykickstart python3-pyudev \
                   parted python3-pyparted multipath-tools \
                   lsof cryptsetup libblockdev \
--=20
2.25.1


