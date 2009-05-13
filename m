Received: from [74.125.78.145] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M4B3i-0006Q0-Aq
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 11:47:30 +0200
Received: by ey-out-1920.google.com with SMTP id 26so226051eyw.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 02:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=liIBCvPkdKKcTXKX+OfX6RGU16MpAY932xiNOcjtmtk=;
	b=tyKVD/48wyp/kVK9usKFhzIXfJWC4NQuU6MvZG6vKNyEGOoXzujvg5tvn14zii2K25
	PxGEpZLjkhKlUeCWNuunOVueBLidWed/8GX31s+a9kyPsqsHi6wuyu+GwcN6lJwaqHk2
	dCd5V+hIPHDr3+NOBvR7z+Ehe5iB1SZHmIYFI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=O/F+foFxQA37u5krcs+jaq6ed0oa/eBlp5Jc6UWUEBvhFHjUqUAKLwBWWB8k56a7x0
	SpjNzmF1AXK5J3Z9eRPVJ52SIQN/M99vyC/wJb+bsqYNAikr/XDSbjHXuH4nkrTF20DN
	0sTYTNamV3Up5xd7+Fu/QKkiG3GrPHklLYuc0=
Received: by 10.210.87.14 with SMTP id k14mr8137097ebb.27.1242207647861;
	Wed, 13 May 2009 02:40:47 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 5sm2201256eyh.20.2009.05.13.02.40.46
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 May 2009 02:40:47 -0700 (PDT)
From: koen.kooi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 11:39:16 +0200
Message-Id: <1242207556-15601-38-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
In-Reply-To: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
Subject: [STABLE][PATCH 37/37] monit: add patch to remove -s in install.
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
X-List-Received-Date: Wed, 13 May 2009 09:47:30 -0000

From: Mike Westerhof <mwester@dls.net>

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 .../monit/monit-4.10.1/no-strip-in-makefile.patch  |   11 +++++++++++
 recipes/monit/monit_4.10.1.bb                      |    2 ++
 2 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 recipes/monit/monit-4.10.1/no-strip-in-makefile.patch

diff --git a/recipes/monit/monit-4.10.1/no-strip-in-makefile.patch b/recipes/monit/monit-4.10.1/no-strip-in-makefile.patch
new file mode 100644
index 0000000..26f5108
--- /dev/null
+++ b/recipes/monit/monit-4.10.1/no-strip-in-makefile.patch
@@ -0,0 +1,11 @@
+--- monit-4.10.1/Makefile.in.orig	2009-05-10 21:19:00.000000000 -0500
++++ monit-4.10.1/Makefile.in	2009-05-10 21:19:11.000000000 -0500
+@@ -39,7 +39,7 @@ MODE_CONF       = 600
+ MODE_DIRS       = 755
+ 
+ INSTALL         = @INSTALL@ 
+-INSTALL_PROG    = $(INSTALL) -m $(MODE_PROGS) -s
++INSTALL_PROG    = $(INSTALL) -m $(MODE_PROGS)
+ INSTALL_FILE    = $(INSTALL) -m $(MODE_FILES)
+ INSTALL_DIR     = $(INSTALL) -m $(MODE_DIRS) -d
+ 
diff --git a/recipes/monit/monit_4.10.1.bb b/recipes/monit/monit_4.10.1.bb
index bb18491..06d382f 100644
--- a/recipes/monit/monit_4.10.1.bb
+++ b/recipes/monit/monit_4.10.1.bb
@@ -1,7 +1,9 @@
 LICENSE = "GPL"
 DEPENDS = "openssl"
+PR = "r1"
 
 SRC_URI = "http://www.tildeslash.com/monit/dist/monit-${PV}.tar.gz\
+	file://no-strip-in-makefile.patch;patch=1 \
 	file://init"
 
 INITSCRIPT_NAME = "monit"
-- 
1.6.1



