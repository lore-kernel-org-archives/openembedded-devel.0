Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2E6A87F95C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Dec 2019 05:19:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47hkzf1ppPz5b
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Dec 2019 06:19:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1577164766;
	bh=P16U8RVPylvTucap/0C1Z1a9bTmx6cV8QvSQbx0LuwM=;
	h=From:To:Subject:Date:From;
	b=RwKwFzghgt6TSpOFjNs+aC1TSOTETiX+3fsm+mkBpYoqTP+2aARd6BtYICeKkvcly
	uUVr4VOwDayPjPGKOuvVKNQqQf7OB+n5HOIk6kP+FmQ8OKSYbcZHscQwjUUpi1LfXl
	FfyXWnLqt7beglYt3/dZJrQr5WELJalwMKiewOsjO9xQek7TRxwROb+tVrR8ecOSsT
	UJA94N0VOX97VV1CCS27G3ZsDSQ6woSJqZhx76bLUe6pu/Qa3A7OSphUL5F7KCYA4z
	f3ovVhcHaFLoLJryuzJKoedTuFFTqbZKggmDdL0BrXPq9c7x6Bf3RI4W6q2sLl2CNt
	6u/u/k3SBF7VZ0jciTb9eFQC8jRnYeVCEHfDY9d2+WTEGA6R4WITSN6J1ZXkxADWCv
	B/CYH/zo0Yq46wPK1FWDEojqzoFD+4eu0tnJeWbJBnAGM7aiB4ZvNmY7IyKMpYqJ1x
	Zb8mc6y3fQkB6/QtgAVWXFNb1rBWLrnqWZ+pQ8FcA1Nhca+VGq+LOtu3wby+mpXNMU
	DzKkqJXesXFkYdjxGRogwaf/q95e0E5oI5RBOhlW328lHIwykzKOx7GCafTZL+2RJs
	+fdRc/eVQ+jAnHXnkBZ0AJwB9zlSfK4JnmIWVJUzvrFGO3vpImbh9esJgzeWk66zsF
	QyCnfzTRip9MTvXcmurjD70M=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Dec 2019 07:19:25 +0200
Message-Id: <20191224051925.28555-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][zeus][PATCH] libqmi: Upgrade 1.24.0 -> 1.24.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Dec 2019 05:19:28 -0000

This is a bugfix release on the 1.24 stable branch.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libqmi/{libqmi_1.24.0.bb => libqmi_1.24.2.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.24.0.bb => libqmi_1.24.2.bb} (85%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.24.0.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.24.2.bb
similarity index 85%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.24.0.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.24.2.bb
index 9b89e1dd8..35a58d2f1 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.24.0.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.24.2.bb
@@ -14,8 +14,8 @@ inherit autotools pkgconfig bash-completion
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz \
            "
 
-SRC_URI[md5sum] = "4b181c0a8b933226ce3dce09565fe8f8"
-SRC_URI[sha256sum] = "aeb69f90c273467cce246176cba0967c6413f1995a976992770a597c4fe28c79"
+SRC_URI[md5sum] = "e49c419112d708b5301af7ccc2c090ff"
+SRC_URI[sha256sum] = "4ae4e476f960dbc0d04b1c0368776eb78edffd4421f3e4c074bb2bfb6375b282"
 
 PACKAGECONFIG ??= "udev mbim"
 PACKAGECONFIG[udev] = ",--without-udev,libgudev"
-- 
2.17.1


