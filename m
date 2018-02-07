Return-Path: <texier.pj2@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id E92D278430
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Feb 2018 21:35:08 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id x4-v6so24392297wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Feb 2018 13:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=+IjbJitMqrfHFS3USNAUgGqXOca5jB5rE8rBoM61Z0s=;
	b=jhsxI6WfZ7Y7v70yMQ2l5ogQvnXeS0+JwWE8c0BLVXTWOEPLvyGKJXEZZX8oK8hNzG
	HyI4sKD8/7nEbW97jGfwGXm5/ek5BSsiXw64YlInkVCvDCIXgBxW8KrhGetvWnSYKq1t
	hccPpUKQcM+X4rfFj1piXvo77G2INEhxwXi7q/iqKExnimxjTEy93T0HQ/Z97mS6OXgX
	obWp9Pc8DSapmkIZLcaXFhCq24eSDZBp76rbJ6bp62+/eI4LVN+6uRH1R2bqVEHcp5Op
	YyrxqiRiI8K+aBCKPz4S3dWRzRIEbXqOXXG+TRwRUbH8XatT6dKn+Rxu0LcO2gRVlMzq
	tbFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+IjbJitMqrfHFS3USNAUgGqXOca5jB5rE8rBoM61Z0s=;
	b=WAPQI3qrchpshIKRhJUrPcLZ5xKblALnvQqEWyaWYysZUWdbQCC1Vgz7GmVk/uRGYZ
	uRCeJsbsfTQXTAkkRWZpbl2MJfSv4gDUXTCfrF/McTPIEEOxjfxVG8scWcHWA/WbjLjJ
	w2aUt2wmOXvvme960SHVuRYqihS2YD7dvsTWRE8VTuB+i6zVw86dAnq3LRe+uINzAkCi
	cYS3Ko5weF5jgu3GBNEalXNYTsSKVKdxCYWmCiLMvTyBGK+MjpYOPwegG5qE7k8NJwW6
	IO9MP5bKijax5s7qYuDWVanEG9I19Jgs+kDTO0U4r7aCviQk7DqANmQAxNCXxCNbIyOJ
	PdwQ==
X-Gm-Message-State: APf1xPCMHpD9sDPzeaHb8QPzFGCMGRbzDJmi8KDeaU43XwTLmVB59Lrn
	YWx+/j09k0hEUKD5qHdIC3QIHw==
X-Google-Smtp-Source: AH8x226iJKTDK/cYUPfyPUDs7/5eBlPWkCadthTxr1ovV2uGbENlBhic31Sg0CotuOv+pQ9EqPiNbw==
X-Received: by 10.28.147.66 with SMTP id v63mr5508752wmd.118.1518039309524;
	Wed, 07 Feb 2018 13:35:09 -0800 (PST)
Received: from menoah.home ([2a01:cb19:190:c500:4149:344d:1a33:dab5])
	by smtp.gmail.com with ESMTPSA id
	v13sm2729494wrf.71.2018.02.07.13.35.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Feb 2018 13:35:08 -0800 (PST)
From: Pierre-Jean TEXIER <texier.pj2@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Feb 2018 22:35:06 +0100
Message-Id: <1518039306-26660-1-git-send-email-texier.pj2@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-qt5][PATCH] packagegroup-qt5-toolchain-target: Add qtcharts and qtmqtt
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
X-List-Received-Date: Wed, 07 Feb 2018 21:35:09 -0000

Signed-off-by: Pierre-Jean TEXIER <texier.pj2@gmail.com>
---
 recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
index 234cde8..f5446af 100755
--- a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
+++ b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
@@ -47,6 +47,9 @@ RDEPENDS_${PN} += " \
     qttranslations-qtbase \
     qttranslations-qtconfig \
     qttranslations-qthelp \
+    qtcharts-dev \
+    qtcharts-mkspecs \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qtcharts-qmlplugins', '', d)} \
     qtconnectivity-dev \
     qtconnectivity-mkspecs \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qtconnectivity-qmlplugins', '', d)} \
@@ -69,6 +72,8 @@ RDEPENDS_${PN} += " \
     qtlocation-plugins \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qtlocation-qmlplugins', '', d)} \
     qttranslations-qtlocation \
+    qtmqtt-dev \
+    qtmqtt-mkspecs \
     qtmultimedia-dev \
     qtmultimedia-mkspecs \
     qtmultimedia-plugins \
-- 
2.7.4


