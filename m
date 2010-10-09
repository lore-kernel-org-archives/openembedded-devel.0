Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1P4X7X-0000be-EA
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 12:57:47 +0200
Received: by ewy7 with SMTP id 7so999767ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Oct 2010 03:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=lUgxqQlyxmNn17F2a0fsd3BLCOYzO6fc2Mx9+Fd48xc=;
	b=s0XqJqumTSVGy9bE8bHM/51ARvafW4quReDAwxqC11WZgWPm8BQ88Om78hq1aevGqF
	E41lNUemnasoSFhwKbJxzGlDPepASM9lVU/k+4S4ltJHbRmelkK7XN2IzFsIukLL12Yh
	r7l7LLL53fJ8L7PioggjLJrXUxpAUdxyz4Ho0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=TXqxvqdKYmcontL/I/cmtyoqrvdz+GHnpnCkC8S4S/vNrj6dihd91v+yBnflbT08Zq
	AV82AKk5qDwqWB6Wy2OWJjUB5pTe9euanNBSv0anaQRQehka7f+swei61P+m1hCKAssg
	dsNR76F+28Jw8sJ881w5upYpq7alTAvMFlVRk=
Received: by 10.213.112.205 with SMTP id x13mr2210894ebp.16.1286621842203;
	Sat, 09 Oct 2010 03:57:22 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id u3sm3226373eeh.7.2010.10.09.03.57.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 09 Oct 2010 03:57:18 -0700 (PDT)
From: Koen Kooi <koen.kooi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Oct 2010 12:57:05 +0200
Message-Id: <1286621826-9198-1-git-send-email-koen@openembedded.org>
X-Mailer: git-send-email 1.7.0
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: koen.kooi@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>
Subject: [PATCH 1/2] kernel bbclass: split do_compile into do_compile and do_compile_modules
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
X-List-Received-Date: Sat, 09 Oct 2010 10:57:53 -0000

This allows recipes to insert a custom task in between building *Image and modules

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 classes/kernel.bbclass |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index cf6b8cd..5d5e93b 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -89,12 +89,16 @@ kernel_do_compile() {
 		oe_runmake dep CC="${KERNEL_CC}" LD="${KERNEL_LD}"
 	fi
 	oe_runmake ${KERNEL_IMAGETYPE} CC="${KERNEL_CC}" LD="${KERNEL_LD}"
+}
+
+kernel_do_compile_modules() {
 	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
 		oe_runmake modules  CC="${KERNEL_CC}" LD="${KERNEL_LD}"
 	else
 		oenote "no modules to compile"
 	fi
 }
+addtask compile_modules after do_compile before do_install
 
 kernel_do_install() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
-- 
1.6.6.1



