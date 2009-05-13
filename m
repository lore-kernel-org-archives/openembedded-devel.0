Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M4B2L-0006OE-Tk
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 11:46:05 +0200
Received: by mail-ew0-f172.google.com with SMTP id 20so593886ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 02:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=4ZYYKzs53AqvqMq3uPTQUOzmwbd2LBE0xw1GwQNheuU=;
	b=xTJVMCHFdY+4EeWO1VUM5fkTqoHU0u6s9j6ZDQKAflfK3YxtMLGOyVS86V91J5pqfD
	IH4Ix9QdLylm6Eydltlc/pFWYD3yWJ/BXUhkkq5aETytu1rFOhb/t6BFZj1hpnqXLUmV
	KA+TnEjLOtgz3wm11mJiyP66a+YxVDzf+DJAg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=E/jD124W+t6kfNza6hZWn6SzdPQmWz/pTb5KmUAZGAMQJmkttu8mfI7DTOpF2Jt6c8
	JoyICD6GCj2REabPZE5EPRXx5YtArfXddZn2iRshRQGQch6DcrIiyclF3HrmWQfY2qIA
	2W5wAtXTm6PwUQbJkOjRWnrONyEDJJvob91yk=
Received: by 10.210.89.4 with SMTP id m4mr75816ebb.5.1242207563449;
	Wed, 13 May 2009 02:39:23 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 5sm1014518eyh.40.2009.05.13.02.39.22
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 May 2009 02:39:22 -0700 (PDT)
From: koen.kooi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 11:38:41 +0200
Message-Id: <1242207556-15601-3-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
In-Reply-To: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
Subject: [STABLE][PATCH 02/37] gpe-question: don't strip during install - this breaks now with new install - strip is done in packaging
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
X-List-Received-Date: Wed, 13 May 2009 09:46:06 -0000

From: Andrea Adami <andrea.adami@gmail.com>

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/gpe-question/files/makefile-fix.patch |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/gpe-question/files/makefile-fix.patch b/recipes/gpe-question/files/makefile-fix.patch
index a8d1ead..f501e12 100644
--- a/recipes/gpe-question/files/makefile-fix.patch
+++ b/recipes/gpe-question/files/makefile-fix.patch
@@ -5,7 +5,7 @@
  
  install-program: all
 -	install -Ds $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
-+	install -D -s $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
++	install -D $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
  
  clean:
  	rm -f $(PACKAGE).o $(PACKAGE) $(DEPS)
-- 
1.6.1



