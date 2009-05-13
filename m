Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M4B3I-0006OE-Sq
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 11:47:04 +0200
Received: by mail-ew0-f172.google.com with SMTP id 20so593886ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 02:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=ANG6FwJkZqy3tszkXAcZnj8pP55lZX+Sn8yb1ISd7ic=;
	b=xGqDoVgppq2Wfm9ymdPUXivv3pgkgYyw8M0B7sQbEPj3fMAdQWGn51cf1gUM/Xtwzo
	arWOO1/GKrk6zzKN1NSiMyt3c79M8vvNezbW+0l2MsHkIagAuxVHRYP8i+w2yM6Ypdpq
	Ne4/ldMxJVIyWfSD+KIyCPTzecmIiVF6QDdgk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=qfyaky0GCP01i1hOFuHQEnXwaMpLs8eUEE7kj4qw9vk8fdbe85cx9grdm2jDT5LiLE
	IS8z0Y2Z2yfriSruUtWEcqe1ylchclprK8T4x1Cu0NEjHx0bH8Q0Vo6An2wJmy/r3v2H
	CQ3bh5DmZtvIG2zvD3TddCK/kZsiVFHicY8Vg=
Received: by 10.210.33.3 with SMTP id g3mr8129390ebg.33.1242207622322;
	Wed, 13 May 2009 02:40:22 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 23sm2185177eya.59.2009.05.13.02.40.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 May 2009 02:40:21 -0700 (PDT)
From: koen.kooi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 11:39:03 +0200
Message-Id: <1242207556-15601-25-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
In-Reply-To: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
Subject: [STABLE][PATCH 24/37] xdemineur: Don't do "install -s"
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

From: Florian Boor <florian.boor@kernelconcepts.de>

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/xdemineur/xdemineur-2.1.1/Makefile |    2 +-
 recipes/xdemineur/xdemineur_2.1.1.bb       |    1 +
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/xdemineur/xdemineur-2.1.1/Makefile b/recipes/xdemineur/xdemineur-2.1.1/Makefile
index 10d34b2..218df56 100644
--- a/recipes/xdemineur/xdemineur-2.1.1/Makefile
+++ b/recipes/xdemineur/xdemineur-2.1.1/Makefile
@@ -22,7 +22,7 @@ xdemineur: $(OBJS)
 
 install: all
 	install -d $(DESTDIR)$(PREFIX)/bin
-	install -s xdemineur $(DESTDIR)$(PREFIX)/bin/xdemineur
+	install xdemineur $(DESTDIR)$(PREFIX)/bin/xdemineur
 	install -D -m 644 xdemineur.xpm $(DESTDIR)$(PREFIX)/share/pixmaps/xdemineur.xpm
 	install -D -m 644 familiar/xdemineur.png $(DESTDIR)$(PREFIX)/share/pixmaps/xdemineur.png
 	install -d $(DESTDIR)$(PREFIX)/share/applications
diff --git a/recipes/xdemineur/xdemineur_2.1.1.bb b/recipes/xdemineur/xdemineur_2.1.1.bb
index 73e3276..23846df 100644
--- a/recipes/xdemineur/xdemineur_2.1.1.bb
+++ b/recipes/xdemineur/xdemineur_2.1.1.bb
@@ -1,5 +1,6 @@
 inherit gpe
 LICENSE = "BSD-X"
+PR = "r1"
 
 DEPENDS = "virtual/libx11 libxpm"
 SECTION = "gpe/games"
-- 
1.6.1



