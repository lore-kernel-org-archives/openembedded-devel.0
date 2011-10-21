Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RHFfl-0005C6-1h
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 16:02:09 +0200
Received: by yxj20 with SMTP id 20so1528272yxj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2011 06:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=aL/6VY461K7IbI4YNcC+jM6R9e6k7hmmMz9IoZ03mA8=;
	b=PrAD+eXA647J+K+afwVg2DT+LcNGIoJtbjmw0kVrLFa3ldwMeZirPbC8piWsKtR69H
	UPJh1tHxbl+eZeaLU6+ivniPqxxX4gGIyGmhtrZ3QFYG3yPBNmTrr2dwUpyfO2mwucyO
	HTP/xjjnr5ZvhVrs4rcCjOl2yMcsV9xIqSbkA=
Received: by 10.151.13.10 with SMTP id q10mr13385737ybi.86.1319205372258;
	Fri, 21 Oct 2011 06:56:12 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id r9sm24608561anh.8.2011.10.21.06.56.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Oct 2011 06:56:11 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Oct 2011 13:55:52 +0000
Message-Id: <db76597e3a3c1e747f762e1944363700535512c3.1319205291.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1319205291.git.otavio@ossystems.com.br>
References: <cover.1319205291.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1319205291.git.otavio@ossystems.com.br>
References: <cover.1319205291.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 2/5] systemd: add systemd-initramfs
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
X-List-Received-Date: Fri, 21 Oct 2011 14:02:09 -0000

Includes a /init that points to ${base_sbin}/init that is called so to
avoid having to include post rootfs commands for it.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-core/systemd/systemd_git.bb |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
index 8faedd0..f9e024b 100644
--- a/meta-oe/recipes-core/systemd/systemd_git.bb
+++ b/meta-oe/recipes-core/systemd/systemd_git.bb
@@ -14,7 +14,7 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r0"
+PR = "r1"
 
 inherit pkgconfig autotools vala perlnative
 
@@ -52,9 +52,15 @@ do_install() {
 	autotools_do_install
 	# provided by a seperate recipe
 	rm ${D}${base_libdir}/systemd/system/serial-getty* -f
+
+	# provide support for initramfs
+	ln -s ${base_sbindir}/init ${D}/systemd
 }
 
-PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup"
+PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs"
+
+FILES_${PN}-initramfs = "/init"
+RDEPENDS_${PN}-initramfs = "${PN}"
 
 FILES_${PN}-gui = "${bindir}/systemadm"
 
-- 
1.7.2.5



