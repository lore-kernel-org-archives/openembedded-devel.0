Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M4B2X-0006OE-Sq
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 11:46:17 +0200
Received: by mail-ew0-f172.google.com with SMTP id 20so593886ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 02:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=E3MrNk5JJ2fMYOd0Pdi7pgUXiVce6OKy39qULAYteQ4=;
	b=FqwNvbxvlusBemnNCpvCnkHThgu6pO7rsOUqlHpCuxRwrKqqv0lelTmd7XrL7WqJ1+
	b1yTGKmoqvBV/524BETehkg9dTcHkBlY+c/uU4PlC+yfhoaZPyGk6bXUiRNmI7cKYVsc
	veyeusd2GkJ35duxJbAy9Niv5uPDCVSY+sYtY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=q58Ajmo/593GCY8QapgOwZZk1tJNKKJKAQmjOlal9bQUCNvBpWwK0MjnQDan61RF+a
	dhpx7+Xgu28HyI6rlGwHcs0kTGkzR7jNDGw3ezof36CT1PGTnyChiqSrIfCbkDaBQjS3
	oWANR906sBQ6gpdxgosPdwFx/sIqX7enZHZS4=
Received: by 10.211.168.5 with SMTP id v5mr1785919ebo.18.1242207575377;
	Wed, 13 May 2009 02:39:35 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 7sm1334219eyb.35.2009.05.13.02.39.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 May 2009 02:39:35 -0700 (PDT)
From: koen.kooi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 11:38:47 +0200
Message-Id: <1242207556-15601-9-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
In-Reply-To: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
Subject: [STABLE][PATCH 08/37] gpe-calculator: don't strip during install - this breaks now with new install - strip is done in packaging
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
X-List-Received-Date: Wed, 13 May 2009 09:46:18 -0000

From: Andrea Adami <andrea.adami@gmail.com>

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 .../gpe-calculator-0.2/fix_makefile.patch          |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/gpe-calculator/gpe-calculator-0.2/fix_makefile.patch b/recipes/gpe-calculator/gpe-calculator-0.2/fix_makefile.patch
index b8c6d1a..8b4ebf7 100644
--- a/recipes/gpe-calculator/gpe-calculator-0.2/fix_makefile.patch
+++ b/recipes/gpe-calculator/gpe-calculator-0.2/fix_makefile.patch
@@ -41,7 +41,7 @@ diff -urNd ../gpe-calculator-0.2-r0/gpe-calculator-0.2/Makefile gpe-calculator-0
  	install -m 644 $(PACKAGE).desktop $(DESTDIR)$(PREFIX)/share/applications
 -	strip $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
 +	mkdir -p $(DESTDIR)$(PREFIX)/bin
-+	install -s $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
++	install $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
  
  clean:
  	rm -f $(PACKAGE) $(OBJS) $(DEPS)
-- 
1.6.1



