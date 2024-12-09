Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E0EE77180
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 17:26:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.107812.1733765194357920407
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Dec 2024 09:26:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F17521650
	for <openembedded-devel@lists.openembedded.org>; Mon,  9 Dec 2024 09:27:01 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9D3843F720
	for <openembedded-devel@lists.openembedded.org>; Mon,  9 Dec 2024 09:26:33 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 6/7] vk-gl-cts: control what targets get built
Date: Mon,  9 Dec 2024 17:26:25 +0000
Message-ID: <20241209172626.4144686-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209172626.4144686-1-ross.burton@arm.com>
References: <20241209172626.4144686-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Dec 2024 17:26:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114254

Explicitly build the targets that are normally build. This seems like a
no-op, but had the advantage of not pulling in vulkan-validationlayers
which causes more fetches at configure time, and is only actually used
by the developers of the test suite.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.11.0.bb | 2 ++
 meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.9.2.bb     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.11.0.bb=
 b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.11.0.bb
index 7dd60dffd8..1a745c6cc1 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.11.0.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.11.0.bb
@@ -15,6 +15,8 @@ SRCREV_vulkan-validationlayers =3D "a92629196a4fed15e59=
c74aa965dd47bd5ece3b7"
 SRCREV_video-parser =3D "6821adf11eb4f84a2168264b954c170d03237699"
 SRC_URI[renderdoc.sha256sum] =3D "e7b5f0aa5b1b0eadc63a1c624c0ca7f5af133a=
a857d6a4271b0ef3d0bdb6868e"
=20
+EXTRA_OECMAKE +=3D "-DSELECTED_BUILD_TARGETS=3D"cts-runner deqp-egl deqp=
-gles2 deqp-gles3 deqp-gles31 deqp-gl-shared de-internal-tests glcts""
+
 do_install() {
 	install -d ${D}/${CTSDIR}
 	cp -r ${B}/external/openglcts/modules/* ${D}/${CTSDIR}
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.9.2.bb b/m=
eta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.9.2.bb
index 4ba761b676..bffec29e4d 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.9.2.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.9.2.bb
@@ -24,6 +24,8 @@ inherit features_check
=20
 DEPENDS +=3D " vulkan-loader"
=20
+EXTRA_OECMAKE +=3D "-DSELECTED_BUILD_TARGETS=3D"deqp-vk deqp-vksc""
+
 do_install() {
 	install -d ${D}/${CTSDIR}
 	cp -r ${B}/external/vulkancts/modules/vulkan/* ${D}/${CTSDIR}/
--=20
2.43.0


