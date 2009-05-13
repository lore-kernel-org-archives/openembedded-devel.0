Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M4B2r-0006OE-Nq
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 11:46:37 +0200
Received: by mail-ew0-f172.google.com with SMTP id 20so593886ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 02:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=tMuxFdq1I+KC9DcJeS1PvTErAp0mV7wjy9OEZ1cnoew=;
	b=AEjcXHdsJ0VzzBlnomm9Ol1NmkNtk7PyqCn1kEU9KAbqHxdgyRy2OPQuNWEBnZ++Qj
	jWQ/m/2vqiZCT118GCigAQxqTdkZVaPnYGZVYev3T3Fea7rPnoYnmYeFqjwEHNaUNDWO
	+Q06sOohW50Znc3Z8sz0K9XgrVzLhWurOx0ao=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Yx56dzz+QBgt/wZLjseSHmiYe961T10LA3vy7Guc2WTyF8j6JBgDnztiY6gX+Z8Wmd
	86IzgP58UiSnS8umBHcjL+b00MP9TTZw+ekAJFlcERchQDRG/qxPN8jyI518aYyett02
	LJrGOCY1EQdSev19K3dXBnBAEHdSVUlpO9n1c=
Received: by 10.210.18.8 with SMTP id 8mr961606ebr.11.1242207595261;
	Wed, 13 May 2009 02:39:55 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 28sm2199596eyg.14.2009.05.13.02.39.46
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 May 2009 02:39:47 -0700 (PDT)
From: koen.kooi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 11:38:53 +0200
Message-Id: <1242207556-15601-15-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
In-Reply-To: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
Subject: [STABLE][PATCH 14/37] keylaunch: Makefile fix - don't strip on install
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
X-List-Received-Date: Wed, 13 May 2009 09:46:38 -0000

From: Andrea Adami <andrea.adami@gmail.com>

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/keylaunch/files/makefile-fix.patch |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/keylaunch/files/makefile-fix.patch b/recipes/keylaunch/files/makefile-fix.patch
index d9c57e0..0e53e4e 100644
--- a/recipes/keylaunch/files/makefile-fix.patch
+++ b/recipes/keylaunch/files/makefile-fix.patch
@@ -7,7 +7,7 @@
 -	install -sD $(PROG) $(DESTDIR)$(PREFIX)/bin/$(PROG)
 -	install -D -m 644 $(PROG)rc $(DESTDIR)/etc/$(PROG)rc
 +	install -d $(DESTDIR)$(PREFIX)/bin
-+	install -s $(PROG) $(DESTDIR)$(PREFIX)/bin/$(PROG)
++	install $(PROG) $(DESTDIR)$(PREFIX)/bin/$(PROG)
 +	install -d $(DESTDIR)/etc
 +	install -m 644 $(PROG)rc $(DESTDIR)/etc/$(PROG)rc
  	install -d $(DESTDIR)/etc/X11/Xsession.d
-- 
1.6.1



