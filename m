Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P3wRZ-0002MR-8o
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Oct 2010 21:47:58 +0200
Received: by bwz7 with SMTP id 7so178493bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Oct 2010 12:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=uSf9AX7maNVx8oJpSROkCBpHpM37Lf/XrBFlXAjfgGI=;
	b=utOwC3fXXCR2JNwqzBVD/qk0aaWbz/irLt0zgiEBi88O65vrnED/hqnY/9PMSC9bc1
	WTcatXXBOdHUFIxE0q/1zBhcqsIgpLCMW8Muqw2F2FAjlb4wM0kJK5YihbsdFwXPj1e9
	5MF3rFQuwdSvlkCzyk0qc4rQw9Lfc2YU3CFco=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=k6PpVT2TxJrxtXXlsjxv7+gH/PmK0qubDuodmO6CYC1PkiQT20RyLBhSuGATBEy4mN
	iPJxcTIX6zWo9Z4yRn6mjNgAH1bbk9c5Sa3hlyh/DsZnypgh2+Vy0SsiGjp4SSnhqE/o
	xjL2bSFXmq8h30miDIQ0wLaZQ2T/yZcRgiIMo=
Received: by 10.204.82.137 with SMTP id b9mr985344bkl.127.1286480687315;
	Thu, 07 Oct 2010 12:44:47 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id v7sm1927582bkx.16.2010.10.07.12.44.46
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 07 Oct 2010 12:44:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Oct 2010 21:44:57 +0200
Message-Id: <1286480697-28494-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.1
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] eglibc-package.bbclass: fix missing RPROVIDES for virtual-locale-*
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
X-List-Received-Date: Thu, 07 Oct 2010 19:47:58 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/eglibc/eglibc-package.bbclass |    4 +++-
 recipes/eglibc/eglibc.inc             |    2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes/eglibc/eglibc-package.bbclass b/recipes/eglibc/eglibc-package.bbclass
index 5871be0..dbca1ab 100644
--- a/recipes/eglibc/eglibc-package.bbclass
+++ b/recipes/eglibc/eglibc-package.bbclass
@@ -351,7 +351,9 @@ python package_do_split_gconvs () {
 		else:
 		    glibc_name = name
 		bb.data.setVar('RDEPENDS_%s' % pkgname, legitimize_package_name('eglibc-binary-localedata-%s' % glibc_name), d)
-		bb.data.setVar('RPROVIDES_%s' % pkgname, 'glibc-binary-localedata-%s' % glibc_name, d)
+		rprovides = bb.data.getVar("RPROVIDES_%s" % pkgname, d, 1)
+		rprovides += ' glibc-binary-localedata-%s' % glibc_name
+		bb.data.setVar('RPROVIDES_%s' % pkgname, rprovides, d)
 
 	def output_locale_binary(name, pkgname, locale, encoding):
 		# This is a hack till linux-libc-headers gets patched for the missing arm syscalls and all arm device kernels as well
diff --git a/recipes/eglibc/eglibc.inc b/recipes/eglibc/eglibc.inc
index a68f343..754a12b 100644
--- a/recipes/eglibc/eglibc.inc
+++ b/recipes/eglibc/eglibc.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.eglibc.org/home"
 SECTION = "libs"
 PRIORITY = "required"
 LICENSE = "LGPL"
-INC_PR = "r14"
+INC_PR = "r15"
 # nptl needs unwind support in gcc, which can't be built without glibc.
 DEPENDS = "virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers"
 #this leads to circular deps, so lets not add it yet
-- 
1.7.3.1



