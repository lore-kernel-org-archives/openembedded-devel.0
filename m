Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U0Aa8-000670-4y
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Jan 2013 13:46:36 +0100
Received: by mail-pb0-f52.google.com with SMTP id uo5so256162pbc.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jan 2013 04:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=wIqT6vK0rVDvHnctZ3pRTJAvKZHL/03eFbY+tCISN14=;
	b=vT7rduk/L9Ha6WmADyDGMOjjNd+ZoNcizcM9d7gX5AXLynKVgXydGiiFGNB97+5Guw
	c3QCtZpBGYWZtPKuba7yi/KONxKvlacN9be4TW8hB98beVw9IqTOyHPECCuKyiPMvLJh
	W+9O5KGmReQmitNzdcJrE8ig/Bg8f4Fk9xGqG1gEgp1mwo2okGgDwIWjrTyWSGXhGA35
	mF4HvftuCRu4BX8ezFvyadroD+Vthz9Nds/bri2s+sRYVYcI0vOEXYGCPF/VBQpnwQYz
	3X/ed2TovG96gCecvuYVF510VzD2cXYVqN679fbfAS00n1A99bkTHsElloBMwoXQx9hl
	hoFA==
X-Received: by 10.68.189.66 with SMTP id gg2mr1896774pbc.111.1359462651814;
	Tue, 29 Jan 2013 04:30:51 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id nt5sm8327218pbb.59.2013.01.29.04.30.49
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 29 Jan 2013 04:30:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Jan 2013 13:29:54 +0100
Message-Id: <050a749951f9f8082b89ab21f4a89f46560f09a6.1359462547.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1359462547.git.Martin.Jansa@gmail.com>
References: <cover.1359462547.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1359462547.git.Martin.Jansa@gmail.com>
References: <cover.1359462547.git.Martin.Jansa@gmail.com>
Subject: [PATCH 5/5] vim: use new u-a syntax
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
X-List-Received-Date: Tue, 29 Jan 2013 12:46:41 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/vim/vim.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/vim/vim.inc b/meta-oe/recipes-support/vim/vim.inc
index ca36bf1..4fa8f7c 100644
--- a/meta-oe/recipes-support/vim/vim.inc
+++ b/meta-oe/recipes-support/vim/vim.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://README.txt;md5=72c4840d07b65659b60b3fa405c7da36"
 PV_MAJOR = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 VIMDIR = "${PN}${@d.getVar('PV',1).split('.')[0]}${@d.getVar('PV',1).split('.')[1]}"
 
-INC_PR = "r12"
+INC_PR = "r13"
 
 SRC_URI = " \
   ftp://ftp.${PN}.org/pub/${PN}/unix/${PN}-${PV_MAJOR}.tar.bz2;name=${VIMDIR} \
@@ -69,9 +69,9 @@ FILES_${PN}-tutor = "${datadir}/${PN}/${VIMDIR}/tutor ${bindir}/${PN}tutor"
 FILES_${PN}-vimrc = "${datadir}/${PN}/vimrc"
 FILES_${PN}-data = "${datadir}/${PN}"
 
-ALTERNATIVE_NAME = "vi"
-ALTERNATIVE_PATH = "${bindir}/${PN}"
-ALTERNATIVE_LINK = "${base_bindir}/vi"
-ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_${PN} = "vi"
+ALTERNATIVE_TARGET[vi] = "${bindir}/${PN}"
+ALTERNATIVE_LINK_NAME[vi] = "${base_bindir}/vi"
+ALTERNATIVE_PRIORITY[vi] = "100"
 
 PARALLEL_MAKE = ""
-- 
1.8.1.2



