Return-Path: <p.patat@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 82DF76DEE2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Dec 2013 15:04:46 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id b13so12404193wgh.30
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Dec 2013 07:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=CHGLq8x00jhjEO8ftKAdSmqgp/TqFqiFsF3ajbT+228=;
	b=oHgCA2N3S6mr6pG42PxWf1hgbnl64Idyiyrg4LbN6ctolLvZVQsWGkMa148+aNRcy+
	zBDmDDRLRkafHFOyR36NRBihrPejz6fWqB1hFpG/JtmbJQL3Qh7G4+d6ed7MFEbqZMaF
	j6C20QZqzI1zLksIPNKpyRTDKiLRc5EcoUHcHjnjAiIhNQWloW7ZzucLd09d4JEAIv9T
	eTmXVmQThWy58//kjmfVypeBR3RFm+DeIkMsUOR7/ZODmalWnTtnGKiQMILjcbPUfWSr
	NAe7DmNJCLN1JgWRpBbGz5sRw4MYU4xdRFbVVXM6RTR0CsChWoMX6n0ejGds67hQRokC
	AQPQ==
X-Received: by 10.180.90.114 with SMTP id bv18mr7733687wib.16.1386169485587;
	Wed, 04 Dec 2013 07:04:45 -0800 (PST)
Received: from ppatat-desktop.mpl.mstarsemi.fr ([94.103.137.126])
	by mx.google.com with ESMTPSA id g16sm7731422wiw.6.2013.12.04.07.04.44
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Dec 2013 07:04:45 -0800 (PST)
Sender: patrick patat <p.patat@gmail.com>
From: Patrick Patat <patrick.patat@innotis.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Dec 2013 16:04:39 +0100
Message-Id: <1386169479-16925-1-git-send-email-patrick.patat@innotis.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-perl][PATCH] add libcrypt-openssl-random-perl
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
X-List-Received-Date: Wed, 04 Dec 2013 15:04:47 -0000

This recipe build cpan module Crypt-OpenSSL-Random

Signed-off-by: Patrick Patat <patrick.patat@innotis.org>
---
 .../libcrypt/libcrypt-openssl-random-perl_0.04.bb         |   13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.04.bb

diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.04.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.04.bb
new file mode 100644
index 0000000..7638426
--- /dev/null
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.04.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Crypt Openssl Random cpan module"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=385c55653886acac3821999a3ccd17b3"
+
+SRC_URI = "http://www.cpan.org/modules/by-module/Crypt/Crypt-OpenSSL-Random-${PV}.tar.gz "
+SRC_URI[md5sum] = "c56ac5dbdd46122eb9b8da59613b7b0a"
+SRC_URI[sha256sum] = "acf7eb81023cd1f40d8c60b893096d041513df2be2aefe145cc7ae1a3dcc78c7"
+
+S = "${WORKDIR}/Crypt-OpenSSL-Random-${PV}"
+
+inherit cpan
-- 
1.7.10.4


