Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id AC343774FD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 22:44:43 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id x35so4309949qtc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 14:44:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vBzTTWUMMiaRgtSpGe8fCq7zOok/X7MXfhWK7MHrqcc=;
	b=fH+b0Eh3nVQ0FO2YQ11AQrceFv1YTqzD15nLjEDtUD3nFMjFylZRvHEuCaRxwRD9Ih
	E4S8yMdkypInsVzocUuDlVuCProcPAk+cNhOktZuruuczCCvqoRRMs1zDEMbVIy+CDQX
	JEtfinfCSkH5x7GEeA+65OotrQkFEuJkJlIpFjR2cRO5h72V/mVuNFcS0fTLDZv0k7ez
	rO5zAKvGzp3OAt4Ynh9C2A7rC42FNJ3A5CRJnebQY8GYNy0xfTqgueEBrLyj2VytYLZX
	+IOcXpLnffqhGiPNX5gUQ2pEjvXgpyCiQqaWszrU8DGOyWf7NSHSgVqRUdnTelBhmir+
	knjg==
X-Gm-Message-State: AMke39ko2850ddwUBoxULklWemyLykQVqLnmniD2VGHU2Oj0Q/YSLKo2WhjvpWA7OGBE2A==
X-Received: by 10.200.1.72 with SMTP id f8mr5182395qtg.271.1487976284610;
	Fri, 24 Feb 2017 14:44:44 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	c19sm5676759qtc.29.2017.02.24.14.44.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Feb 2017 14:44:44 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2017 17:44:35 -0500
Message-Id: <1487976275-12355-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] mosh: update inherit to work correctly with RSS
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
X-List-Received-Date: Fri, 24 Feb 2017 22:44:44 -0000

Resolves build issue exposed by RSS
See http://errors.yoctoproject.org/Errors/Details/130653/

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb b/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
index 91b8763..e4d5b69 100644
--- a/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
+++ b/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://mosh.mit.edu/mosh-${PV}.tar.gz"
 SRC_URI[md5sum] = "c2d918f4d91fdc32546e2e089f9281b2"
 SRC_URI[sha256sum] = "e74d0d323226046e402dd469a176075fc2013b69b0e67cea49762c957175df46"
 
-inherit autotools
+inherit autotools pkgconfig
 
 PACKAGE_BEFORE_PN += "${PN}-server"
 FILES_${PN}-server = "${bindir}/mosh-server"
@@ -45,5 +45,3 @@ RDEPENDS_${PN}-server += "openssh-sshd ${NEEDED_PERL_MODULES}"
 #| {standard input}:2103: Error: instruction not supported in Thumb16 mode -- `adcs r7,r7,r7'
 #| {standard input}:2104: Error: selected processor does not support Thumb mode `it cs'
 ARM_INSTRUCTION_SET = "arm"
-
-PNBLACKLIST[mosh] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130653/"
-- 
2.7.4


