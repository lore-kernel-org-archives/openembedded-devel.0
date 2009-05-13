Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M4B3S-0006OF-5k
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 11:47:14 +0200
Received: by mail-ew0-f172.google.com with SMTP id 20so593907ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 02:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=csTQ1nEBP3Xbzhkbxb6nnpQaQ5mLlXZ/8thL6ba6hxU=;
	b=huoZD9morcMTml5p3R6XP6JR6AYNWVaeFyp6hSXt1h0gt+VRANe7g9xHEdZt/T8iHY
	3GMrW5rP8s30Lc5Uo7O94BRr0CSYzOLOqMcpkl14wit7r0N8LqA+TImqXJCq9xmb3hbD
	Us8SVPOjQBcEOW1l8qTd8nPTfbLxuq/SbyYHk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=eD5r9a5MHaCyUfeRxh6GR6Wl07mW3nDwRNnB9nWtzlApDOUsBWtAREfLSDYOJ3LLxE
	51WD17du5cGojXUZWC47kQjVb0Hg2kUelR3B/qbBcfbhk/C2g8jADDtFViTfS63nIVKD
	5uHBwWj8g3XLEXxnSl2JErA9p8Bf1iX0HtjD4=
Received: by 10.210.128.10 with SMTP id a10mr956116ebd.16.1242207629260;
	Wed, 13 May 2009 02:40:29 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 23sm2197882eya.9.2009.05.13.02.40.28
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 May 2009 02:40:28 -0700 (PDT)
From: koen.kooi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 11:39:07 +0200
Message-Id: <1242207556-15601-29-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
In-Reply-To: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
Subject: [STABLE][PATCH 28/37] gpe-plucker: Add patch
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
X-List-Received-Date: Wed, 13 May 2009 10:10:34 -0000

From: Steve Sakoman <steve@sakoman.com>

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/gpe-plucker/gpe-plucker/fix-install.patch |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 recipes/gpe-plucker/gpe-plucker/fix-install.patch

diff --git a/recipes/gpe-plucker/gpe-plucker/fix-install.patch b/recipes/gpe-plucker/gpe-plucker/fix-install.patch
new file mode 100644
index 0000000..cfd5bc4
--- /dev/null
+++ b/recipes/gpe-plucker/gpe-plucker/fix-install.patch
@@ -0,0 +1,13 @@
+diff --git gpe-plucker-0.4/Makefile-orig gpe-plucker-0.4/Makefile
+index c68b5ab..abf97bb 100644
+--- gpe-plucker-0.4/Makefile-orig
++++ gpe-plucker-0.4/Makefile
+@@ -43,7 +43,7 @@ $(PACKAGE): $(OBJS) $(LIB)
+ 
+ install-program: all $(PACKAGE).desktop
+ 	mkdir -p $(DESTDIR)$(PREFIX)/bin
+-	install -s $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
++	install $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
+ 	mkdir -p $(DESTDIR)$(PREFIX)/share/pixmaps
+ 	install -m 644 $(PACKAGE).png $(DESTDIR)$(PREFIX)/share/pixmaps/$(PACKAGE).png
+ 	#mkdir -p $(DESTDIR)$(PREFIX)/share/$(PACKAGE)
-- 
1.6.1



