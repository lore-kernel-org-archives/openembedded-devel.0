Received: from mail-gx0-f224.google.com ([209.85.217.224])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1NjzrQ-0003yq-TX
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 19:52:01 +0100
Received: by gxk24 with SMTP id 24so2686777gxk.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2010 10:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=hT0xK6/SI+Yl8twN/5rzQ0RowPfz8DQIPJEXfFhEvzw=;
	b=AARaxsmbzScyY8oj2WTbLjRn9Ikj43+GLWtOBginoIgggHpijlsNn3LekfXrzFr6Z3
	qxLidY6YxYwTB+xqMa1pspUXAC8+8Gll38iQ1SO81BMM0XhkV231sEwqwOxXbwb+M7Cw
	5VSHG/2jpoWd9qSAuF9/i1xyNLExiIBmlYdMg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=Bdpmm08C1KnyHrdlsV4nQGGesumRbTDCwMKIDLVGTwRtgYGQVXIcf0jyV9DymYg04U
	Td9ns6XRK0RmAb9UVldbb7FaFIR6x6ADRHm58jdGGMvSu0gPl/C2ZdpTo6d9Fq4lb5l8
	YTUg9qS8hoKfSJtfCpen4KY0QVwBWQAzp6ES0=
Received: by 10.150.37.20 with SMTP id k20mr658042ybk.4.1266950951288;
	Tue, 23 Feb 2010 10:49:11 -0800 (PST)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id 7sm1581798ywc.34.2010.02.23.10.49.09
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 23 Feb 2010 10:49:10 -0800 (PST)
Sender: Chris Larson <kergoth@gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Feb 2010 11:48:59 -0700
Message-Id: <1266950939-3302-1-git-send-email-clarson@kergoth.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 209.85.217.224
X-SA-Exim-Mail-From: kergoth@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH] kernel.bbclass: Stage the raw zImage and modules tarball for inclusion in pstage
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
X-List-Received-Date: Tue, 23 Feb 2010 18:52:01 -0000

From: Tom Rini <tom_rini@mentor.com>

Signed-off-by: Tom Rini <tom_rini@mentor.com>
Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 classes/kernel.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 83530b5..8121339 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -536,10 +536,12 @@ MODULES_IMAGE_BASE_NAME ?= modules-${PV}-${PR}-${MACHINE}
 do_deploy() {
 	install -d ${DEPLOY_DIR_IMAGE}
 	install -m 0644 ${KERNEL_OUTPUT} ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
+	package_stagefile_shell ${S}/${KERNEL_OUTPUT}
 	package_stagefile_shell ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
 
 	if [ -d "${PKGD}/lib" ]; then
 		fakeroot tar -cvzf ${DEPLOY_DIR_IMAGE}/${MODULES_IMAGE_BASE_NAME}.tgz -C ${PKGD} lib
+		package_stagefile_shell ${DEPLOY_DIR_IMAGE}/${MODULES_IMAGE_BASE_NAME}.tgz
 	fi
 
 	cd ${DEPLOY_DIR_IMAGE}
-- 
1.6.3.3



