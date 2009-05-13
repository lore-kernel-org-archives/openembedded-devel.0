Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M4B2R-0006OE-T5
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 11:46:11 +0200
Received: by mail-ew0-f172.google.com with SMTP id 20so593886ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 02:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=sUZuPkCXqoGEpZhF5MMO2CMCvGY+rMV/jqMfoAQk9KI=;
	b=vC/XpjKB5JR1cwucef0HAhntLbcL0b0YcFaeFHkgSLkGh4yw+I2SdSAoG+PbvBu01x
	hL4nzdpCItsPdrgOu33eHHogoxNAppSbZ6jHcoSzUbfi1f/TF+zdutuRLO+D2roaoleQ
	1CzGo9DHA+IIedWXOI1BXRp0a96I4jGvqlwZU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Knd2f1sV4oJom/fA/LkbE+jL4y9i33jpzP0iiTp1q+nfcPm8KYb9jv0nO1EK7M0t7h
	3MgSXKyrOxB/HzBMde2rtX8ruVvfZLCRndAMp9mLTVi9czHYSWnmMhHqiUEVoNKJCE1V
	MOYzAtufPy3hHjbXsXIQmxEVwo2VZNX9nMDXs=
Received: by 10.210.27.20 with SMTP id a20mr951538eba.19.1242207569430;
	Wed, 13 May 2009 02:39:29 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 23sm2183817eya.59.2009.05.13.02.39.28
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 May 2009 02:39:28 -0700 (PDT)
From: koen.kooi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 11:38:44 +0200
Message-Id: <1242207556-15601-6-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
In-Reply-To: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
Subject: [STABLE][PATCH 05/37] gpe-lights: don't strip during install - this breaks now with new install - strip is done in packaging
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
X-List-Received-Date: Wed, 13 May 2009 09:46:12 -0000

From: Andrea Adami <andrea.adami@gmail.com>

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 .../gpe-lights/gpe-lights-0.12/fix-makefiles.patch |    2 +-
 .../gpe-lights/gpe-lights-0.13/fix-makefiles.patch |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/gpe-lights/gpe-lights-0.12/fix-makefiles.patch b/recipes/gpe-lights/gpe-lights-0.12/fix-makefiles.patch
index d2fdd54..4ec5b3a 100644
--- a/recipes/gpe-lights/gpe-lights-0.12/fix-makefiles.patch
+++ b/recipes/gpe-lights/gpe-lights-0.12/fix-makefiles.patch
@@ -278,7 +278,7 @@ diff -urNd ../gpe-lights-0.12-r0/gpe-lights-0.12/Makefile gpe-lights-0.12/Makefi
  install-program: all 
 -	install -D $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
 -	strip $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
-+	install -s -D $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
++	install -D $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
  	install -d $(DESTDIR)$(PREFIX)/share/pixmaps
  	install -d $(DESTDIR)$(PREFIX)/share/applications
  	install -m 644 $(PACKAGE).png $(DESTDIR)$(PREFIX)/share/pixmaps/
diff --git a/recipes/gpe-lights/gpe-lights-0.13/fix-makefiles.patch b/recipes/gpe-lights/gpe-lights-0.13/fix-makefiles.patch
index bb0ec19..3c4581e 100644
--- a/recipes/gpe-lights/gpe-lights-0.13/fix-makefiles.patch
+++ b/recipes/gpe-lights/gpe-lights-0.13/fix-makefiles.patch
@@ -278,7 +278,7 @@ diff -urNd ../gpe-lights-0.12-r0/gpe-lights-0.12/Makefile gpe-lights-0.12/Makefi
  install-program: all 
 -	install -D $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
 -	strip $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
-+	install -s -D $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
++	install -D $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
  	install -d $(DESTDIR)$(PREFIX)/share/pixmaps
  	install -d $(DESTDIR)$(PREFIX)/share/applications
  	install -m 644 $(PACKAGE).png $(DESTDIR)$(PREFIX)/share/pixmaps/
-- 
1.6.1



