Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M4B3T-0006OE-IA
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 11:47:15 +0200
Received: by mail-ew0-f172.google.com with SMTP id 20so593886ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 02:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=NNlIyyuA0NrztoXJE3QVu63f6ZCW3bpMZrhXPagt2D0=;
	b=xFSL+TNag05Ut9fnRJAkD3DIKnAR+y0uOow53D1XU/qbXDPQzWRO/m3Kq/Sci237dA
	TXwhYEhWAb781GHfKqbdvv6mQ5NWwuiUk27Iwag3Z2JgYNDmhHllX9j+hBMSeWOBtmNc
	4Izt+MNoRZ08BHMc0icjpTzMrs+MzP8HPl61A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=XP+QLMuoiLyOD7D5VXk0kIeGn6MVzU6u0a/KbC1svSFvEznHNVDwk9PS1s3P5CUs+y
	E4YG4CGhNK24q/xFtnI/rJk6KPzdJfIdX+Y0ZENq7OqYsU3IStR8Dp87PDU3fUjWeuQa
	SSqhXbbTXug7UnaXgGU+7huxUgkYW+IyycoMM=
Received: by 10.210.53.1 with SMTP id b1mr78447eba.19.1242207633093;
	Wed, 13 May 2009 02:40:33 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 5sm2202135eyf.8.2009.05.13.02.40.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 May 2009 02:40:32 -0700 (PDT)
From: koen.kooi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 11:39:09 +0200
Message-Id: <1242207556-15601-31-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
In-Reply-To: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
Subject: [STABLE][PATCH 30/37] gpe-clock: Fix install: Don't do install -s
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
X-List-Received-Date: Wed, 13 May 2009 10:54:09 -0000

From: Steve Sakoman <steve@sakoman.com>

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/gpe-clock/files/fix-install.patch |   13 +++++++++++++
 recipes/gpe-clock/gpe-clock.inc           |    2 ++
 2 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 recipes/gpe-clock/files/fix-install.patch

diff --git a/recipes/gpe-clock/files/fix-install.patch b/recipes/gpe-clock/files/fix-install.patch
new file mode 100644
index 0000000..2d3e303
--- /dev/null
+++ b/recipes/gpe-clock/files/fix-install.patch
@@ -0,0 +1,13 @@
+diff --git gpe-clock-0.25/Makefile-orig gpe-clock-0.25/Makefile
+index 4fa59bf..e716fcb 100644
+--- gpe-clock-0.25/Makefile-orig
++++ gpe-clock-0.25/Makefile
+@@ -36,7 +36,7 @@ $(PACKAGE): $(OBJS)
+ 
+ install-program: all
+ 	install -d $(DESTDIR)$(PREFIX)/bin
+-	install -s $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
++	install $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
+ 	install -d $(DESTDIR)$(PREFIX)/share/pixmaps
+ 	install -m 644 $(PACKAGE).png $(DESTDIR)$(PREFIX)/share/pixmaps/
+ 	install -d $(DESTDIR)$(PREFIX)/share/applications
diff --git a/recipes/gpe-clock/gpe-clock.inc b/recipes/gpe-clock/gpe-clock.inc
index d4ae3da..b36fa7d 100644
--- a/recipes/gpe-clock/gpe-clock.inc
+++ b/recipes/gpe-clock/gpe-clock.inc
@@ -6,3 +6,5 @@ DEPENDS = "gtk+ libschedule libgpewidget gpe-announce atd libgpelaunch"
 RDEPENDS = "gpe-announce"
 
 inherit gpe
+
+SRC_URI += "file://fix-install.patch;patch=1"
-- 
1.6.1



