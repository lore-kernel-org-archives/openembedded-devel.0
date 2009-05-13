Received: from [74.125.78.146] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M4B2U-0006Ok-VC
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 11:46:14 +0200
Received: by ey-out-1920.google.com with SMTP id 26so225882eyw.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 02:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=BK1JeB7CYVT/Dij+0r1WdHszSezaGt2kb0YLkpitwPI=;
	b=EQCKeXLBKfDGSKnYAPvk6GrfwOx8Zk97R/SxreCOG+qmUyGJq8lukV/Ra1Biwudt+5
	8m91amPI5X71CLTULVE5ep8JATUKR59Xfg0frgZOy8Etnx8qyhFhJKqRB8nIScAUPwWF
	jgQuKBbPZk+m3pmxG4d4/7S780Sf0VkvANrhg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=GnAj1dv/7dIGcklLJhUUycECxNbFLqaoVYMeq5TtyqTZhT6q4aWuTb+YpXvt4oEiZU
	4OLhCi1b+MAbO6NY+ye7mFIi49zqLS4RWgn0cEfyukA1gl29aMhP1fjSDNFIO8gMRkLD
	mOo8XxOAnBkWWJp38lZblhIVTbm8OByVPGLvs=
Received: by 10.210.135.20 with SMTP id i20mr76489ebd.40.1242207571742;
	Wed, 13 May 2009 02:39:31 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 7sm2192514eyg.17.2009.05.13.02.39.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 May 2009 02:39:31 -0700 (PDT)
From: koen.kooi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 11:38:45 +0200
Message-Id: <1242207556-15601-7-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
In-Reply-To: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
Subject: [STABLE][PATCH 06/37] gpe-go: don't strip during install - this breaks now with new install - strip is done in packaging
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
X-List-Received-Date: Wed, 13 May 2009 09:46:15 -0000

From: Andrea Adami <andrea.adami@gmail.com>

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/gpe-go/gpe-go-0.05/fix-make.patch |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/gpe-go/gpe-go-0.05/fix-make.patch b/recipes/gpe-go/gpe-go-0.05/fix-make.patch
index dab1c7f..996c51e 100644
--- a/recipes/gpe-go/gpe-go-0.05/fix-make.patch
+++ b/recipes/gpe-go/gpe-go-0.05/fix-make.patch
@@ -212,7 +212,7 @@ diff -urNd ../gpe-go-0.05-r0/gpe-go-0.05/Makefile gpe-go-0.05/Makefile
  install-program: $(PACKAGE).desktop all 
 -	install -D $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
 -	strip $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
-+	install -s -D $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
++	install -D $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
  	install -d $(DESTDIR)$(PREFIX)/share/pixmaps
  	install -m 644 $(PACKAGE).png $(DESTDIR)$(PREFIX)/share/pixmaps/
  	install -d $(DESTDIR)$(PREFIX)/share/applications
-- 
1.6.1



