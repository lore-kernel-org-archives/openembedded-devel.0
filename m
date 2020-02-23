Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C558D61749
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2020 12:18:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48QPNm5tdNz2J
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2020 13:18:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582460297;
	bh=louwmiXQbnUbPOqUETJu1hYpzCm2561MmyAaFrpZU1g=;
	h=From:To:Subject:Date:From;
	b=ji0IaREXz2fEAJGkJO1PwWV9TrIXQozF3HSOVUtl7WP0Mi54mwswftK81Z4poO6l9
	jfkUcgdbO2k31m5hls7HlWDb8meMOS9VAVGxE9SBHgwdjeoZW09/y9jTMByrhBCFzC
	AJGVrAYrLGswyd4oe8nh/fAfwsIgbLKpzINOgYXjrkAagalcyWuYyH59YVRO+CL9Ao
	kKiR5Ppfj4mnAmQ70ylsgE/l5YnoKwy0+DcoLMlxUXf7K/dQ+CZKeduZ7vg4zILRkv
	NegVHmQCaRNRCN+dx0MTTQ9WZ4+JmMW9EixIhN9kba4AAB6xk2DOPXjJ80lG5Yq7ME
	N2WdNvH/+tLrRJDO2XIjfpDjKqeMv46m+fIUs4V80cbuftPxIudV8bZC1xEbeK8CzH
	4nLUi9CLmjRW8SUsfOxHyz4/KSHAAaKMZxF8IUUKTBtvJrq0r253R9CzaEoIQaIJQo
	hp6QchE6KD0zF+TCRAZbFdMUD88cZ3lVdmECPX5VcsHA/h6pwwZadFh06tKAzgDkG2
	c8o6HS+jWERTuQggglrGvnMLVStjkVfSkooHyKj7svSkvNcn4hMnkm7fnSF/C1W70g
	yRNetey0KVDhNUWMqWDtF1WL1+fQ4w8Sh6i0phym9PzH49aHCvL+Ipt4EGc6rsYLzu
	Pu3zog3dDusYnDkCUxU70asc=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Feb 2020 14:18:13 +0200
Message-Id: <20200223121814.7941-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] libqmi: Upgrade 1.24.2 -> 1.24.4
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
X-List-Received-Date: Sun, 23 Feb 2020 12:18:19 -0000

Upgrade on the 1.24 stable branch.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../libqmi/{libqmi_1.24.2.bb => libqmi_1.24.4.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.24.2.bb => libqmi_1.24.4.bb} (85%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.24.2.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.24.4.bb
similarity index 85%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.24.2.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.24.4.bb
index 35a58d2f1..55128284d 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.24.2.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.24.4.bb
@@ -14,8 +14,8 @@ inherit autotools pkgconfig bash-completion
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz \
            "
 
-SRC_URI[md5sum] = "e49c419112d708b5301af7ccc2c090ff"
-SRC_URI[sha256sum] = "4ae4e476f960dbc0d04b1c0368776eb78edffd4421f3e4c074bb2bfb6375b282"
+SRC_URI[md5sum] = "be6539fde54fec1fc9d852db201c8560"
+SRC_URI[sha256sum] = "0316badec92ff32f51fe6278e6046968d2272a26608995deedd8e4afb563918a"
 
 PACKAGECONFIG ??= "udev mbim"
 PACKAGECONFIG[udev] = ",--without-udev,libgudev"
-- 
2.17.1


