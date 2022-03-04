Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F027C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 13:42:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.7010.1646401345563447729
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 05:42:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64CCA1396
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  4 Mar 2022 05:42:24 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F9513F70D
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  4 Mar 2022 05:42:23 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] ufw: port to setuptools, use setuptools_legacy
Date: Fri,  4 Mar 2022 13:42:20 +0000
Message-Id: <20220304134220.2254908-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Mar 2022 13:42:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95783

This package has a traditional setup.py which has a custom install comman=
d,
which isn't supported with the modern wheel/pip installation method.

Until upstream has moved away from distutils, use setuptools_legacy so
the installation is correct.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../ufw/ufw/setuptools.patch                  | 20 +++++++++++++++++++
 .../recipes-connectivity/ufw/ufw_0.36.1.bb    |  3 ++-
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-connectivity/ufw/ufw/setuptoo=
ls.patch

diff --git a/meta-networking/recipes-connectivity/ufw/ufw/setuptools.patc=
h b/meta-networking/recipes-connectivity/ufw/ufw/setuptools.patch
new file mode 100644
index 0000000000..ad5391cb98
--- /dev/null
+++ b/meta-networking/recipes-connectivity/ufw/ufw/setuptools.patch
@@ -0,0 +1,20 @@
+Move to setuptools as distutils is now deprecated.
+
+Upstream-Status: Submitted [https://code.launchpad.net/~tgamblin/ufw/dis=
tutils-to-setuptools]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/setup.py b/setup.py
+index cb67a6a..de648d3 100644
+--- a/setup.py
++++ b/setup.py
+@@ -25,8 +25,8 @@
+ #
+=20
+ from __future__ import print_function
+-from distutils.command.install import install as _install
+-from distutils.core import setup
++from setuptools.command.install import install as _install
++from setuptools import setup
+ import errno
+ import os
+ import re
diff --git a/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb b/met=
a-networking/recipes-connectivity/ufw/ufw_0.36.1.bb
index c427e4ffde..70216a85e3 100644
--- a/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb
+++ b/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb
@@ -12,12 +12,13 @@ SRC_URI =3D "https://launchpad.net/ufw/0.36/0.36.1/+d=
ownload/ufw-0.36.1.tar.gz \
            file://0001-optimize-boot.patch \
            file://0002-add-an-option-to-specify-iptables-location.patch =
\
            file://0003-only-make-one-reference-to-env.patch \
+           file://setuptools.patch \
            "
 SRC_URI[sha256sum] =3D "1c57e78fbf2970f0cc9c56ea87a231e6d83d825e55b9e31e=
2c88b91b0ea03c8c"
=20
 UPSTREAM_CHECK_URI =3D "https://launchpad.net/ufw"
=20
-inherit distutils3 features_check systemd update-rc.d
+inherit setuptools3_legacy features_check systemd update-rc.d
=20
 RDEPENDS:${PN} =3D " \
                   iptables \
--=20
2.25.1


