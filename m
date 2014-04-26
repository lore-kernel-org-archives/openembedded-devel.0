Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f45.google.com (mail-pb0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id 981E765D15
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 20:32:49 +0000 (UTC)
Received: by mail-pb0-f45.google.com with SMTP id uo5so4403754pbc.18
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 13:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7QeAjFYcNbb9FTYKzHzuj6RRva8ab0hIAZ8/0g5fV+Y=;
	b=Fwh2SkIzJ251DKxgxp+YG4rl43Euwh3ah5KPF4VS47Hxp0W1QCPhCPcfZ3ZFctaujV
	YtNo/u0DUuyXdqooIGZ3wKvaJAZXZrrQjAefmbJHbr4hURTYVnCMOoS5gsj81uBByp+q
	VQgUjuz4mnQ8ILHgCNFDa4w5Sx4wS6p2ICOxaremlf4JDEvy5SahctjRoyBvmnHvzkfK
	7v4qLMWJaTv+ycBTCle+z2+WdpbAKpAohtHV7vN9H5dy21QTxksUFqYZ7hfjNDZQbMO4
	E23wkYZLeYhTy6dyfd41HeJMrhPWA/cWra9efpySwpagg4Mn9iFldT8YtcG57v0xZKRO
	O0BQ==
X-Received: by 10.68.220.137 with SMTP id pw9mr19604798pbc.24.1398544370545;
	Sat, 26 Apr 2014 13:32:50 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	ci4sm24455471pbb.50.2014.04.26.13.32.49 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Apr 2014 13:32:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Apr 2014 13:34:35 -0700
Message-Id: <1398544484-27299-12-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
References: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 12/21] Fix build when S != B
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 26 Apr 2014 20:32:49 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gnome-power-manager/gnome-power-manager_2.32.0.bb              |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
index ddc436e..8ddfd68 100644
--- a/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
@@ -29,10 +29,10 @@ EXTRA_OECONF = " --disable-scrollkeeper \
 do_configure_append() {
     rm config.log
     # Sigh... --enable-compile-warnings=no doesn't actually turn off -Werror
-    for i in $(find ${S} -name "Makefile") ; do
+    for i in $(find ${B} -name "Makefile") ; do
         sed -i -e s:-Werror::g $i
     done
-    sed -e "s/libtool --/${TARGET_SYS}-libtool --/" -i ${S}/src/Makefile
+    sed -e "s/libtool --/${TARGET_SYS}-libtool --/" -i ${B}/src/Makefile
 }
 
 PACKAGES =+ "${PN}-applets"
-- 
1.7.10.4


