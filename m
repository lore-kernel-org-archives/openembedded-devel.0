Received: from mail-fx0-f227.google.com ([209.85.220.227])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NeaxA-00052q-0m
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 22:15:35 +0100
Received: by fxm27 with SMTP id 27so1137714fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Feb 2010 13:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=4tgFjaSCz92s0g2VRc+nyAuuO0QbhJaK7CSBmLPTC0Y=;
	b=xDNq3DNWBjNIyxdKhBYRjqcSTqr9ulqNGMi1l0Fn1bOvquzsqBlo1vlVMtcKNFW6Iu
	qy6eOana4aA8hE5NdkB81RZ++dQFTfTDuGWIUWAW6HXUZ4kb0ACbadnZZt4Ojl4nyyTT
	rrnhce2ykwBxJmFlmHAj4tKMPafpeKPu6oEnw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=QaQ1juhdYhJuF7VCUpHBxY/vC6bACoRNEnSfwuDdCjoZivoe4rXU4K4oaITG9LVIuw
	Z376HuJPtQGoYsVYJdnQmoiKCR93LM/jwuJoum1vWnUMWLfW2LrspAFzGWBjNTh+/1xm
	xaOrHJWK1IJvs6uc00eJqWKO6zmK4JyAQwym4=
Received: by 10.223.145.149 with SMTP id d21mr465342fav.77.1265663580065;
	Mon, 08 Feb 2010 13:13:00 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id f31sm7238343fkf.12.2010.02.08.13.12.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 08 Feb 2010 13:12:56 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NeawH-0004GV-I7; Mon, 08 Feb 2010 22:14:37 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Feb 2010 22:14:31 +0100
Message-Id: <1265663673-16312-11-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.6.5
In-Reply-To: <1265663673-16312-10-git-send-email-rep.dot.nop@gmail.com>
References: <1265663673-16312-1-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-2-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-3-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-4-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-5-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-6-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-7-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-8-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-9-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-10-git-send-email-rep.dot.nop@gmail.com>
X-SA-Exim-Connect-IP: 209.85.220.227
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 10/12] git: remove version specifics from generic inc
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
X-List-Received-Date: Mon, 08 Feb 2010 21:15:35 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/git/git-native_1.6.0.4.bb |    1 +
 recipes/git/git.inc               |    5 ++---
 recipes/git/git_1.6.0.4.bb        |    3 ++-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/recipes/git/git-native_1.6.0.4.bb b/recipes/git/git-native_1.6.0.4.bb
index 71b111b..c17ce6e 100644
--- a/recipes/git/git-native_1.6.0.4.bb
+++ b/recipes/git/git-native_1.6.0.4.bb
@@ -2,3 +2,4 @@ require git.inc
 inherit native
 DEPENDS = "openssl-native curl-native zlib-native expat-native"
 PR = "r4"
+SRC_URI += "file://autotools.patch;patch=1"
diff --git a/recipes/git/git.inc b/recipes/git/git.inc
index fb88fd4..644e159 100644
--- a/recipes/git/git.inc
+++ b/recipes/git/git.inc
@@ -2,9 +2,8 @@ DESCRIPTION = "The git revision control system used by the Linux kernel develope
 SECTION = "console/utils"
 LICENSE = "GPL"
 
-SRC_URI = "http://www.kernel.org/pub/software/scm/git/git-${PV}.tar.bz2 \
-           file://autotools.patch;patch=1 \
-	   "
+SRC_URI = "http://www.kernel.org/pub/software/scm/git/git-${PV}.tar.bz2"
+
 S = "${WORKDIR}/git-${PV}"
 
 inherit autotools
diff --git a/recipes/git/git_1.6.0.4.bb b/recipes/git/git_1.6.0.4.bb
index e839ab9..c37e3d0 100644
--- a/recipes/git/git_1.6.0.4.bb
+++ b/recipes/git/git_1.6.0.4.bb
@@ -1,6 +1,7 @@
 require git.inc
 
-SRC_URI += "file://snprintf-returns-bogus.patch;patch=1"
+SRC_URI += "file://autotools.patch;patch=1 \
+            file://snprintf-returns-bogus.patch;patch=1"
 
 DEPENDS = "openssl curl zlib expat"
 RDEPENDS = "perl perl-module-file-path cpio findutils sed"
-- 
1.6.5



