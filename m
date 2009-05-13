Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M4B38-0006OF-Fo
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 11:46:54 +0200
Received: by mail-ew0-f172.google.com with SMTP id 20so593907ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 02:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=VgrecmpVMaBVGXsX/ATpk2KNQjvtm8lt+764n8D/rEc=;
	b=mIFO/NMJHTISSFKr5ayIXWLy4yYCabXy0NrIIzFdmN5LzaA/DIPScvgZM2V36HRmsT
	tslevt8jMpd95NzSfF7VMZsy5WSZXmz+MmyIfgW5J+IiyJIzF+ioIq2ieMAaq8Eh9bF4
	H3jpZlbzs5L7x9e7u28N4gMX2H8EHceUTEGnU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=syQZBSCA5jJilFdJDUUeChm4GSP6wfUWjEAOFQoJsYUuKEtMpD9MnfJdLrXiFE096P
	5UHhhMN+S6nu01JJlvIxgsneEdKWdafSXh9oQBWEIwzRp9KHbTB72Qvg9hq4G/CbxHQE
	Ssww45pj8JP7U+0yn4Cdg1eogvQdqtHnuaJ3M=
Received: by 10.210.63.18 with SMTP id l18mr936112eba.34.1242207612008;
	Wed, 13 May 2009 02:40:12 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 7sm2188363eyb.55.2009.05.13.02.40.10
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 May 2009 02:40:11 -0700 (PDT)
From: koen.kooi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 11:38:58 +0200
Message-Id: <1242207556-15601-20-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
In-Reply-To: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
Subject: [STABLE][PATCH 19/37] gpe-aerial: fix Makefiles - don't strip on install
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
X-List-Received-Date: Wed, 13 May 2009 09:46:54 -0000

From: Andrea Adami <andrea.adami@gmail.com>

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/gpe-aerial/files/fix_makefile.patch |    2 +-
 recipes/gpe-aerial/gpe-aerial_0.2.11.bb     |    3 ++-
 recipes/gpe-aerial/gpe-aerial_0.2.12.bb     |    3 ++-
 recipes/gpe-aerial/gpe-aerial_0.2.13.bb     |    3 ++-
 4 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/recipes/gpe-aerial/files/fix_makefile.patch b/recipes/gpe-aerial/files/fix_makefile.patch
index dec0099..bbb0840 100644
--- a/recipes/gpe-aerial/files/fix_makefile.patch
+++ b/recipes/gpe-aerial/files/fix_makefile.patch
@@ -15,7 +15,7 @@ diff -urNd ../gpe-aerial-0.2.11-r0/gpe-aerial-0.2.11/Makefile gpe-aerial-0.2.11/
  	mkdir -p $(DESTDIR)/$(PREFIX)/bin
 -	$(INSTALL) $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/
 -	$(STRIP) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
-+	$(INSTALL) -s $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/
++	$(INSTALL) $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/
  	mkdir -p $(DESTDIR)$(PREFIX)/share/pixmaps/
  	for i in $(PIXMAPS); do install -m 644 -D pixmaps/$$i $(DESTDIR)$(PREFIX)/share/pixmaps/$$i; done
  	mkdir -p $(DESTDIR)$(PREFIX)/share/applications
diff --git a/recipes/gpe-aerial/gpe-aerial_0.2.11.bb b/recipes/gpe-aerial/gpe-aerial_0.2.11.bb
index 543dc09..b61331f 100644
--- a/recipes/gpe-aerial/gpe-aerial_0.2.11.bb
+++ b/recipes/gpe-aerial/gpe-aerial_0.2.11.bb
@@ -9,4 +9,5 @@ SECTION = "gpe"
 PRIORITY = "optional"
 LICENSE = "GPL"
 
-SRC_URI += "file://fix_makefile.patch;patch=1"
+SRC_URI += "file://iconlist.patch;patch=1;pnum=0 \
+	    file://fix_makefile.patch;patch=1"
diff --git a/recipes/gpe-aerial/gpe-aerial_0.2.12.bb b/recipes/gpe-aerial/gpe-aerial_0.2.12.bb
index 543dc09..b61331f 100644
--- a/recipes/gpe-aerial/gpe-aerial_0.2.12.bb
+++ b/recipes/gpe-aerial/gpe-aerial_0.2.12.bb
@@ -9,4 +9,5 @@ SECTION = "gpe"
 PRIORITY = "optional"
 LICENSE = "GPL"
 
-SRC_URI += "file://fix_makefile.patch;patch=1"
+SRC_URI += "file://iconlist.patch;patch=1;pnum=0 \
+	    file://fix_makefile.patch;patch=1"
diff --git a/recipes/gpe-aerial/gpe-aerial_0.2.13.bb b/recipes/gpe-aerial/gpe-aerial_0.2.13.bb
index 1f79de8..84f7985 100644
--- a/recipes/gpe-aerial/gpe-aerial_0.2.13.bb
+++ b/recipes/gpe-aerial/gpe-aerial_0.2.13.bb
@@ -10,4 +10,5 @@ SECTION = "gpe"
 PRIORITY = "optional"
 LICENSE = "GPL"
 
-SRC_URI += "file://iconlist.patch;patch=1;pnum=0"
\ No newline at end of file
+SRC_URI += "file://iconlist.patch;patch=1;pnum=0 \
+	    file://fix_makefile.patch;patch=1"
-- 
1.6.1



