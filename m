Received: from [74.125.92.144] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MSfCS-00038m-Jq
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Jul 2009 00:49:44 +0200
Received: by qw-out-1920.google.com with SMTP id 4so585068qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jul 2009 15:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer;
	bh=SgAUCGgEVx+u6AiOckHOnjSfo6ipM2403VuTtRgFmu8=;
	b=k0ehya3LE3aZqAbzYNB8SjDxqZp9JaA2qlnaZ1mL2ImeTyOPYwoiY6Mc+xh92Jf1Iq
	tEKIRyR6cqN9SXFaMn501YSw7qugKAnSaqokxTt2X/pYtd1vnanaOH095fSyPsaZxQuk
	YW00ELuu659OxvPojPTrNTzoEqyolQFeS/Aeo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=MZAcHQgbNqneJi+yRAgvzKhNrc855Mz+geOR49BRQEZRSUa9PJ7C/VTgd3z86wSiUa
	JTGKr6LFUjYaFiaNSJp7O9+fvkPRcj5ZLDoFY8nm7zkv1+B2DuzWyWAOQxoG0MiFOCMt
	6FtgcAxScfTZ2egsgCT4zJVDFnbumKKgdcg60=
Received: by 10.224.74.8 with SMTP id s8mr2301739qaj.12.1248042952369;
	Sun, 19 Jul 2009 15:35:52 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 7sm6206356qwb.40.2009.07.19.15.35.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 19 Jul 2009 15:35:51 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 2C196610138; Sun, 19 Jul 2009 19:34:00 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Jul 2009 19:33:56 -0300
Message-Id: <1248042838-7496-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.3.385.g60647
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/3] -fPIC for libgpg-error's CFLAGS
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
X-List-Received-Date: Sun, 19 Jul 2009 22:49:44 -0000

From: Mario Domenech Goulart <mario@ossystems.com.br>

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/libgpg-error/libgpg-error.inc |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/libgpg-error/libgpg-error.inc b/recipes/libgpg-error/libgpg-error.inc
index 400c166..6b6249c 100644
--- a/recipes/libgpg-error/libgpg-error.inc
+++ b/recipes/libgpg-error/libgpg-error.inc
@@ -8,7 +8,7 @@ DEPENDS += "virtual/libiconv"
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libgpg-error/libgpg-error-${PV}.tar.gz \
 	   file://pkgconfig.patch;patch=1"
 
-INC_PR = "r6"
+INC_PR = "r7"
 
 # move libgpg-error-config into -dev package
 FILES_${PN} = "${libdir}/lib*.so.*"
@@ -16,6 +16,8 @@ FILES_${PN}-dev += "${bindir}/*"
 
 inherit autotools binconfig pkgconfig gettext
 
+CFLAGS += "-fPIC"
+
 do_stage() {
 	oe_libinstall -a -so -C src libgpg-error ${STAGING_LIBDIR}
 	install -d ${STAGING_BINDIR_CROSS}/
-- 
1.6.3.3.385.g60647



