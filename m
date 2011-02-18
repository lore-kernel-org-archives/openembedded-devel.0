Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1PqXiQ-00034U-Gw
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 22:18:15 +0100
Received: by fxm17 with SMTP id 17so4004821fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Feb 2011 13:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=/YgJD8B4/9lzarBZawGpme9qWN5cEJvoNp8ZR1BDo3c=;
	b=vJ+bV8IOJvfwQrCvJDkAN3xuGG5FEXJw8QYW6PuG/1Em+Il0vPLKA9nMY1D5eqDKL4
	mTLY7dpNvQZMySgJDCLKxCY3rAotikNDzcAzDWOn/nU5EFHattTgpYsUnEsxCefSlWGN
	1hveGMFGec5b77g7yKwI0dQMF3Q6aBYlYtzvI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=PwmoAJ7Sr7r5STbcqGFylKDLCM0vxUAnHnJQFwXT1R7WR2BN3snT2iJCUWHBsn7OFy
	AG3g/0Gocln+gVBEiDDrWR9LdF3FRgBu+HHf/FA/2LgrWRv2ggM73k5s4o51lZGehLpG
	vVUgOpD/Fg6VoqTyEgFrVQ4D70nFynWSLam68=
Received: by 10.223.119.68 with SMTP id y4mr1611058faq.104.1298063785702;
	Fri, 18 Feb 2011 13:16:25 -0800 (PST)
Received: from localhost.localdomain (ns.tefnet.pl [188.165.206.204])
	by mx.google.com with ESMTPS id f24sm1316470fak.0.2011.02.18.13.16.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Feb 2011 13:16:24 -0800 (PST)
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Feb 2011 22:16:16 +0100
Message-Id: <1298063776-2260-1-git-send-email-filip.zyzniewski@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <4D5E45C1.7010504@opendreambox.org>
References: <4D5E45C1.7010504@opendreambox.org>
Subject: [PATCH] package_deb.bbclass: armel architecture name for eabi systems.
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
X-List-Received-Date: Fri, 18 Feb 2011 21:18:15 -0000

For dpkg EABI system architecture is called armel, not arm.

Signed-off-by: Filip Zyzniewski <filip.zyzniewski@gmail.com>
---
 classes/package_deb.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/classes/package_deb.bbclass b/classes/package_deb.bbclass
index 60e759d..87f31fa 100644
--- a/classes/package_deb.bbclass
+++ b/classes/package_deb.bbclass
@@ -15,6 +15,8 @@ DPKG_ARCH_i486 ?= "i386"
 DPKG_ARCH_i586 ?= "i386"
 DPKG_ARCH_i686 ?= "i386"
 DPKG_ARCH_pentium ?= "i386"
+DPKG_ARCH_linux-gnueabi ?= "armel"
+DPKG_ARCH_linux-uclibceabi ?= "armel"
 
 python package_deb_fn () {
     bb.data.setVar('PKGFN', bb.data.getVar('PKG',d), d)
-- 
1.7.1



