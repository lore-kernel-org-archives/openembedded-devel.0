Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E133C54EBE
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 12:26:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.84837.1673612794438828902
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Jan 2023 04:26:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F79C13D5;
	Fri, 13 Jan 2023 04:27:16 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9105C3F587;
	Fri, 13 Jan 2023 04:26:33 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/2] khronos-cts: fix build when python3-build-native is present
Date: Fri, 13 Jan 2023 12:26:29 +0000
Message-Id: <20230113122629.1300116-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113122629.1300116-1-ross.burton@arm.com>
References: <20230113122629.1300116-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Jan 2023 12:26:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100563

This recipe has a python script which *appends* a local directory to
sys.path and then tries to include a local module called build.  However
if python3-build-native is present that is included instead.

Fix by prepending the local directory to sys.path instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../vk-gl-cts/files/gen-framework-path.patch  | 20 +++++++++++++++++++
 .../vk-gl-cts/khronos-cts.inc                 |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/gen-framewor=
k-path.patch

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/gen-framework-path.=
patch b/meta-oe/recipes-graphics/vk-gl-cts/files/gen-framework-path.patch
new file mode 100644
index 0000000000..8a8d8d2c32
--- /dev/null
+++ b/meta-oe/recipes-graphics/vk-gl-cts/files/gen-framework-path.patch
@@ -0,0 +1,20 @@
+Prepend instead of append to the module search path, as this script need=
s to use
+the local module build, not the host module build.
+
+Upstream-Status: Submitted
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/external/vulkancts/scripts/gen_framework.py b/external/vulk=
ancts/scripts/gen_framework.py
+index 83c5329ce..10e720910 100755
+--- a/external/vulkancts/scripts/gen_framework.py
++++ b/external/vulkancts/scripts/gen_framework.py
+@@ -33 +33 @@ from collections import OrderedDict
+-sys.path.append(os.path.join(os.path.dirname(__file__), "..", "..", "..=
", "scripts"))
++sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "..", =
"..", "scripts"))
+diff --git a/external/vulkancts/scripts/gen_framework_c.py b/external/vu=
lkancts/scripts/gen_framework_c.py
+index 95587e642..84b878cb2 100644
+--- a/external/vulkancts/scripts/gen_framework_c.py
++++ b/external/vulkancts/scripts/gen_framework_c.py
+@@ -28 +28 @@ import re
+-sys.path.append(os.path.join(os.path.dirname(__file__), "..", "..", "..=
", "scripts"))
++sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "..", =
"..", "scripts"))
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe=
/recipes-graphics/vk-gl-cts/khronos-cts.inc
index f9074556f1..c7535405b0 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
@@ -10,6 +10,7 @@ SRC_URI =3D "\
         git://github.com/open-source-parsers/jsoncpp.git;protocol=3Dhttp=
s;destsuffix=3Dgit/external/jsoncpp/src;name=3Djsoncpp;branch=3Dmaster \
         git://github.com/KhronosGroup/Vulkan-Docs.git;protocol=3Dhttps;d=
estsuffix=3Dgit/external/vulkan-docs/src;name=3Dvulkan-docs;branch=3Dmain=
 \
         https://raw.githubusercontent.com/baldurk/renderdoc/fcdea67879fa=
1991e56cf7734ce0ce27866b665f/renderdoc/api/app/renderdoc_app.h;subdir=3Dg=
it/external/renderdoc/src;name=3Drenderdoc \
+        file://gen-framework-path.patch \
 "
=20
 S =3D "${WORKDIR}/git"
--=20
2.34.1


