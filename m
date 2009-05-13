Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M4B2N-0006OE-RU
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 11:46:07 +0200
Received: by mail-ew0-f172.google.com with SMTP id 20so593886ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 02:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=G41koPBbM5iMw8NQoLg2vvBr7r6yzRwqrs8d9agIqn0=;
	b=KgCQpUBf/u1AWNwZ/DHc1DcZpaMWfqItbF3cmu45qlMTS5quiu2kr3bOmoDgaHzt9z
	6wiZLa71/nZ6pg3j3IZtiL2Qb1dIO6+ThWqi4O23LQBYTVJ52QJPOKsnQtHLzSpV03I1
	Q9lWfRqygrse/WuG2CteWVzilceBTNysARbkQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=gjma7a1m0JfGk4x68saH4vO3lJwReDfpzNOdsrmyTRqvXK8P4jZ7qvJGCzUwnQcq4M
	dS84cdAXBkINkd2gbKOW6DFNJ6aDeJp56lGtkWbm8jmV5W3r8Br1OLCWNMinN9Vj17rb
	iZ77KIG5gs6O6ByqaIpv2uWDBvMU7jhg30WKY=
Received: by 10.210.134.6 with SMTP id h6mr2672856ebd.0.1242207565382;
	Wed, 13 May 2009 02:39:25 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 28sm2185480eyg.54.2009.05.13.02.39.24
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 May 2009 02:39:24 -0700 (PDT)
From: koen.kooi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 11:38:42 +0200
Message-Id: <1242207556-15601-4-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
In-Reply-To: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
Subject: [STABLE][PATCH 03/37] gpe-othello: don't strip during install - this breaks now with new install - strip is done in packaging
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
X-List-Received-Date: Wed, 13 May 2009 09:46:08 -0000

From: Andrea Adami <andrea.adami@gmail.com>

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 .../gpe-othello-0.2-1/fix-makefiles.patch          |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/gpe-othello/gpe-othello-0.2-1/fix-makefiles.patch b/recipes/gpe-othello/gpe-othello-0.2-1/fix-makefiles.patch
index 1c43724..def1915 100644
--- a/recipes/gpe-othello/gpe-othello-0.2-1/fix-makefiles.patch
+++ b/recipes/gpe-othello/gpe-othello-0.2-1/fix-makefiles.patch
@@ -278,7 +278,7 @@ diff -urNd ../gpe-othello-0.2-1-r0/gpe-othello-0.2-1/Makefile gpe-othello-0.2-1/
  install-program: all 
 -	install -D $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
 -	strip $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
-+	install -s -D $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
++	install -D $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
  	install -d $(DESTDIR)$(PREFIX)/share/pixmaps
  	install -m 644 $(PACKAGE).png $(DESTDIR)$(PREFIX)/share/pixmaps/
  	install -d $(DESTDIR)$(PREFIX)/share/applications
-- 
1.6.1



