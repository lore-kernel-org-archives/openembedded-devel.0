Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SCr9M-0004o2-FW
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Mar 2012 13:34:48 +0200
Received: by wgbds1 with SMTP id ds1so4053999wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2012 04:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=+e/2RpM1XsEPR9keD+OHH+usmn/f1/R3zSwrV01DHOo=;
	b=Spjt1D0fiQjbqvALKXeYvOZYHmot/2eoVtVbtWZ9ycORnIqv1apHTI1ouA6g5QLFWL
	rsN3TF2Gv3xZziHUpAZWdqwgiOL3MQr2M0fnraqXtoF+AKBlaZPrEJWNQGIQnsXxwtT8
	env8LFltHCziEP5GxkVI3Uhz1pj4ijM1FlIanktaHnHG672jbGEKrJ0KaFNRIBAysaEd
	B9bJmJhwU26h/NbeHHYKfvnEToVPa7lHxJ7ASjUpPUWMwhV0TTvkt7yszonZta5KlKOT
	yXDz5Lhic71PgBqw9masi/19u98vXvJrA3X3UvoZ+UFOALTNIVuyMoy2Xe5z2hcj857n
	ePyw==
Received: by 10.180.97.4 with SMTP id dw4mr1170939wib.18.1332933946704;
	Wed, 28 Mar 2012 04:25:46 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n15sm57237709wiw.6.2012.03.28.04.25.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 04:25:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Mar 2012 13:25:25 +0200
Message-Id: <55be19aaadb781f4acf8682b31dc2bb824331229.1332933826.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <5a7fc35885c7f07840731881c5e07b5c68299838.1332933826.git.Martin.Jansa@gmail.com>
References: <cover.1332933826.git.Martin.Jansa@gmail.com>
	<5a7fc35885c7f07840731881c5e07b5c68299838.1332933826.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1332933826.git.Martin.Jansa@gmail.com>
References: <cover.1332933826.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/4] kernel.bbclass: touch .scmversion also in ${S}
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Mar 2012 11:34:48 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/classes/kernel.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index 9ce2f44..578a02f 100644
--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -212,7 +212,7 @@ kernel_do_configure() {
 	# $ scripts/setlocalversion . => +
 	# $ make kernelversion => 2.6.37
 	# $ make kernelrelease => 2.6.37+
-	touch ${B}/.scmversion
+	touch ${B}/.scmversion ${S}/.scmversion
 
 	# Copy defconfig to .config if .config does not exist. This allows
 	# recipes to manage the .config themselves in do_configure_prepend().
-- 
1.7.8.5



