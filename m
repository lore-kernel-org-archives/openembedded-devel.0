Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 59AA27755C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 22:35:28 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id x35so4290166qtc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 14:35:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SACe06clECTzmdnArBuDOdFsTELIuPfwqwEq7es6H1I=;
	b=ZzmYFy9H3MQmxkDMWf9w3KdYVRqPZOW5DKHI47Ys2NWKt/SevM5Npydy5RBUk218SW
	0xylkOv8mq7xs3vQUWJHGx0nDS24bhPFXRy3d2nvKzT8GAiK/0Pn3xxXjMUX570JkP+v
	IFboxJLxuTasuUJlC55wR10SXgp0SL3g72Np5j3NuXVM4JbmugQl5pSW+RCyFLWmkCpw
	Fa8KNjOG8IP7KqiGZQvAjlrZ1xRxmr3O7mcdkEdYneV0KEhgaC0ulR5vrjagd+VCpX4a
	VvCLIvvYfz66WJ6fnv8nMJG5N5C41k+tvYFDyMnSSsO1P1gAIRyZ52L7spqBUyzG1Edv
	dHIQ==
X-Gm-Message-State: AMke39lAMgCf7rJAS+QIUYE6Hn4CPN/GvqtQyNqf2/XilkuP0I+MMEMlWUWPTa9GKx+YcA==
X-Received: by 10.237.48.226 with SMTP id 89mr5562931qtf.189.1487975729639;
	Fri, 24 Feb 2017 14:35:29 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224])
	by smtp.gmail.com with ESMTPSA id t34sm5670705qtc.3.2017.02.24.14.35.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Feb 2017 14:35:29 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2017 17:35:23 -0500
Message-Id: <1487975723-10180-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] efivar: unblacklist package and those that depend on it
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
X-List-Received-Date: Fri, 24 Feb 2017 22:35:28 -0000

The package appears to build without modification

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb | 4 ----
 meta-oe/recipes-extended/efivar/efivar_0.24.bb         | 3 ---
 2 files changed, 7 deletions(-)

diff --git a/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb b/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
index f2b9454..b25cfca 100644
--- a/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
+++ b/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
@@ -25,7 +25,3 @@ EXTRA_OEMAKE = "'CC=${CC}' 'CFLAGS=${CFLAGS} -I${S}/src/include `pkg-config --cf
 do_install () {
     install -D -p -m0755 src/efibootmgr ${D}/${sbindir}/efibootmgr
 }
-
-
-
-PNBLACKLIST[efibootmgr] ?= "Depends on blacklisted efivar"
diff --git a/meta-oe/recipes-extended/efivar/efivar_0.24.bb b/meta-oe/recipes-extended/efivar/efivar_0.24.bb
index 4c7793f..f641a30 100644
--- a/meta-oe/recipes-extended/efivar/efivar_0.24.bb
+++ b/meta-oe/recipes-extended/efivar/efivar_0.24.bb
@@ -40,6 +40,3 @@ do_install_append_class-native() {
 }
 
 BBCLASSEXTEND = "native"
-
-
-PNBLACKLIST[efivar] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/132821/"
-- 
2.7.4


