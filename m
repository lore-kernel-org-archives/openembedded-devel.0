Received: from libra.cs.put.poznan.pl ([150.254.30.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <przemyslaw.wesolek@cs.put.poznan.pl>)
	id 1NA9vu-0001MM-0b for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 23:20:29 +0100
Received: from kas30pipe.localhost (unknown [127.0.0.1])
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id 9D4668B;
	Mon, 16 Nov 2009 22:19:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cs.put.poznan.pl
Received: from libra.cs.put.poznan.pl ([127.0.0.1])
	by localhost (libra.cs.put.poznan.pl [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id a1hsOfjQF6hu; Mon, 16 Nov 2009 23:19:01 +0100 (CET)
Received: from localhost.localdomain (107-31.echostar.pl [213.156.107.31])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id 449B689;
	Mon, 16 Nov 2009 23:19:01 +0100 (CET)
From: Przemyslaw Wesolek <przemyslaw.wesolek@cs.put.poznan.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Nov 2009 23:18:55 +0100
Message-Id: <1258409935-6345-1-git-send-email-przemyslaw.wesolek@cs.put.poznan.pl>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <c384c5ea0911100825s66f64234s8d1c27b66221faca@mail.gmail.com>
References: <c384c5ea0911100825s66f64234s8d1c27b66221faca@mail.gmail.com>
MIME-Version: 1.0
X-SpamTest-Envelope-From: przemyslaw.wesolek@cs.put.poznan.pl
X-SpamTest-Group-ID: 00000000
X-SpamTest-Info: Profiles 9691 [Sep 17 2009]
X-SpamTest-Info: {received from trusted sender
	<przemyslaw.wesolek@cs.put.poznan.pl>: common white list}
X-SpamTest-Method: white email list
X-SpamTest-Rate: 0
X-SpamTest-Status: Trusted
X-SpamTest-Status-Extended: trusted
X-SpamTest-Version: SMTP-Filter Version 3.0.0 [0278], KAS30/Release
X-SA-Exim-Connect-IP: 150.254.30.30
X-SA-Exim-Mail-From: przemyslaw.wesolek@cs.put.poznan.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Reorganized kernel class to run 'menuconfig' after 'configure'.
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
X-List-Received-Date: Mon, 16 Nov 2009 22:20:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Previously, 'menuconfig' task was being run just after 'patch' one. In
result, the most common path for unexperienced users:

bitbake virtual/kernel -c menuconfig
bitbake virtual/kernel -c build

didn't work, because the result of 'menuconfig' was later overwritten by
'configure' on the chain of 'build'.

With this patch, 'configure' is requirement for 'menuconfig',
so any manual changes to the kernel config is done just before
actual build and no overwrite occurs.

Signed-off-by: Przemyslaw Wesolek <przemyslaw.wesolek@cs.put.poznan.pl>
---
 classes/kernel.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index fe611ab..637805e 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -215,7 +215,7 @@ do_menuconfig() {
 	fi
 }
 do_menuconfig[nostamp] =3D "1"
-addtask menuconfig after do_patch
+addtask menuconfig after do_configure
=20
 pkg_postinst_kernel () {
 	cd /${KERNEL_IMAGEDEST}; update-alternatives --install /${KERNEL_IMAGED=
EST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL=
_VERSION} ${KERNEL_PRIORITY} || true
--=20
1.6.3.3



