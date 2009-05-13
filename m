Received: from [74.125.78.145] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M4B3M-0006Q0-5X
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 11:47:08 +0200
Received: by ey-out-1920.google.com with SMTP id 26so226051eyw.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 02:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=tlf2ebZWdcLR/9+INSRX9bawIfFRmTIri3IkPj/9770=;
	b=jA7iq6TFy2qRoQjbqRRP1wRYuoO1rcoawo4/LBQDtx5GuEK7vrsRp5VZpllvVvyrxO
	Pln1yJtMTrQk8B6HE7qQV9G01knD5IySD1NwUdzgEFtss5yno/0HkQ2rFzQ3NWnF6FcD
	FfNzmNoyD06rdduIXgO3Dz33ZH49RhllPSFgc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=p9I4OMHNSRdppiwi7fuN2WwEfH1sK9VZdPVXsRbGW/R7eBvCsrLBmC7+9cLpwvJ0yl
	306aWAX1Pfq9JQT/51F6cYoHUvNVHJIhdz+gGaJJvIs4elFgAsiUrPn2hmbcifomHmMk
	rkrw0Lw7szjxAk0o2Y5vihW8OzR+vCOmUwdag=
Received: by 10.210.18.8 with SMTP id 8mr963097ebr.15.1242207625690;
	Wed, 13 May 2009 02:40:25 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 5sm1546025eyf.48.2009.05.13.02.40.25
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 May 2009 02:40:25 -0700 (PDT)
From: koen.kooi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 11:39:05 +0200
Message-Id: <1242207556-15601-27-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
In-Reply-To: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
Subject: [STABLE][PATCH 26/37] gsoko: don't do "install -s"
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
X-List-Received-Date: Wed, 13 May 2009 09:47:08 -0000

From: Florian Boor <florian.boor@kernelconcepts.de>

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/gsoko/gsoko-0.4.2-gpe6/fix_makefiles.patch |   13 +++++++++++++
 recipes/gsoko/gsoko_0.4.2-gpe6.bb                  |    1 +
 2 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/recipes/gsoko/gsoko-0.4.2-gpe6/fix_makefiles.patch b/recipes/gsoko/gsoko-0.4.2-gpe6/fix_makefiles.patch
index 78506a8..f734be4 100644
--- a/recipes/gsoko/gsoko-0.4.2-gpe6/fix_makefiles.patch
+++ b/recipes/gsoko/gsoko-0.4.2-gpe6/fix_makefiles.patch
@@ -27,3 +27,16 @@ diff -urNd ../gsoko-0.4.2-gpe5-r0/gsoko-0.4.2-gpe5/Makefile gsoko-0.4.2-gpe5/Mak
  
  clean:
  	rm -f *.o
+Index: Makefile
+===================================================================
+--- a/Makefile	(Revision 9905)
++++ b/Makefile	(Arbeitskopie)
+@@ -29,7 +29,7 @@
+ 
+ install-program: gsoko gsoko.desktop
+ 	install -d $(DESTDIR)$(PREFIX)/bin
+-	install -s gsoko $(DESTDIR)$(PREFIX)/bin/gsoko
++	install  gsoko $(DESTDIR)$(PREFIX)/bin/gsoko
+ 	install -d $(DESTDIR)$(PREFIX)/share/gsoko/img
+ 	install -d $(DESTDIR)$(PREFIX)/share/gsoko/levels
+ 	for i in $(LEVELS); do install -m 644 levels/$$i.lev $(DESTDIR)$(PREFIX)/share/gsoko/levels/$$i.lev; done
diff --git a/recipes/gsoko/gsoko_0.4.2-gpe6.bb b/recipes/gsoko/gsoko_0.4.2-gpe6.bb
index 0d12a6f..6a34be2 100644
--- a/recipes/gsoko/gsoko_0.4.2-gpe6.bb
+++ b/recipes/gsoko/gsoko_0.4.2-gpe6.bb
@@ -4,5 +4,6 @@ DEPENDS = "gtk+ libgpewidget"
 SECTION = "gpe"
 DESCRIPTION = "Sokoban game for GTK"
 PRIORITY = "optional"
+PR = "r1"
 
 SRC_URI += "file://fix_makefiles.patch;patch=1"
-- 
1.6.1



