Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M4B2W-0006OF-3C
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 11:46:16 +0200
Received: by mail-ew0-f172.google.com with SMTP id 20so593907ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 02:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=9r6BR5AssQXYT94fsXxUteYD9PzhWepAmqwOldS4oTs=;
	b=HTvP4PisQcZ069ecRDmIIhHZjWrXzCMBg7S9FOmxwwCD3ZtW8/Uw4xtovl5ALFZP/w
	m3TEOK//+ROf4pehX/zEh3iQTwOXIsr+k3ua9YwAG9QCfueHK9hF2eqvCSpyn6KbZvHv
	lpKM7j27V6CC7Wk6/DTqLMOHTYkgDikOEsRp0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=OmfVGkXbVWRae7hdg2Rro+XhcAjvirJUKzdjYMRfKfqbY5ouIqCszchmABsh+Q3Cs8
	YIaAcx4ZdQ7a3ELj6yI0He826+1WmQqRbMlCpZ4enwlucdCeyABR5jYbueRH8BEDMzmw
	5KpMP8PNDJO1BtQo0N1x2dbWyzIgd+msSi7+o=
Received: by 10.210.12.18 with SMTP id 18mr897120ebl.80.1242207573496;
	Wed, 13 May 2009 02:39:33 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 28sm2200387eye.6.2009.05.13.02.39.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 May 2009 02:39:33 -0700 (PDT)
From: koen.kooi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 11:38:46 +0200
Message-Id: <1242207556-15601-8-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
In-Reply-To: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
Subject: [STABLE][PATCH 07/37] gpe-soundbite: don't strip during install - this breaks now with new install - strip is done in packaging
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
X-List-Received-Date: Wed, 13 May 2009 09:46:16 -0000

From: Andrea Adami <andrea.adami@gmail.com>

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/gpe-soundbite/files/makefile-fix.patch |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/gpe-soundbite/files/makefile-fix.patch b/recipes/gpe-soundbite/files/makefile-fix.patch
index c2f14d1..69a82b3 100644
--- a/recipes/gpe-soundbite/files/makefile-fix.patch
+++ b/recipes/gpe-soundbite/files/makefile-fix.patch
@@ -5,7 +5,7 @@
  
  install-program: all $(PACKAGE)-play.desktop  $(PACKAGE)-record.desktop
 -	install -Ds $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
-+	install -D -s $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
++	install -D $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
  	install -D $(PACKAGE)-play $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)-play
  	install -D $(PACKAGE)-record $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)-record
  	mkdir -p $(DESTDIR)$(PREFIX)/share/applications
-- 
1.6.1



