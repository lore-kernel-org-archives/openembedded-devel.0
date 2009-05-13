Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M4B3R-0006OE-PO
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 11:47:13 +0200
Received: by mail-ew0-f172.google.com with SMTP id 20so593886ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 02:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=7YvSzQemAU931wFxCZdRo8iQ6/JnJl/j5w6mx7brCkA=;
	b=Mxod0hF1P9Jh/LdgGS9mt+k3SAAtb4/DPNkmApOUkxg9ch/x3C1p50g2CGBaCGJm6m
	jGUISrvVn730dqkX/V+lseK4h1Z28CDlBECxsKmvEYXOgyrFvaSNOgQLYlDc1MpAZ4lB
	LAuj08xX9ITNw+on4o10goZdzo2d24C5DJ7Ls=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=E/YmQ/yQCesaBCuNC7z0Zzhnj4PXPQfzS8a9gUd+0371NdJESWF+sPTC/DYRyQO8YC
	dcFEP11Jm4D0CO/4akNTd27QrC/1PfLh0Njf3rSvio8qTiQIHKS2zvoeJxOCTFRQrclz
	mAY5TDnTmsJFT5zAFu8jMw0KxqIsKOz1nAXQw=
Received: by 10.210.18.18 with SMTP id 18mr568715ebr.31.1242207631227;
	Wed, 13 May 2009 02:40:31 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 24sm2186754eyx.33.2009.05.13.02.40.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 May 2009 02:40:30 -0700 (PDT)
From: koen.kooi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 11:39:08 +0200
Message-Id: <1242207556-15601-30-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
In-Reply-To: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
Subject: [STABLE][PATCH 29/37] gpe-announce: Fix install: don't do install -s
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
X-List-Received-Date: Wed, 13 May 2009 10:10:49 -0000

From: Steve Sakoman <steve@sakoman.com>

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/gpe-announce/files/fix-install.diff |   13 +++++++++++++
 recipes/gpe-announce/gpe-announce_0.13.bb   |    5 ++++-
 2 files changed, 17 insertions(+), 1 deletions(-)
 create mode 100644 recipes/gpe-announce/files/fix-install.diff

diff --git a/recipes/gpe-announce/files/fix-install.diff b/recipes/gpe-announce/files/fix-install.diff
new file mode 100644
index 0000000..3827f55
--- /dev/null
+++ b/recipes/gpe-announce/files/fix-install.diff
@@ -0,0 +1,13 @@
+diff --git gpe-announce-0.13/Makefile-orig gpe-announce-0.13/Makefile
+index 56e016a..f8bade4 100644
+--- gpe-announce-0.13/Makefile-orig
++++ gpe-announce-0.13/Makefile
+@@ -47,7 +47,7 @@ $(PACKAGE): $(OBJS)
+ 
+ install-program: all 
+ 	install -d $(DESTDIR)$(PREFIX)/bin
+-	install -s $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
++	install $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
+ 
+ clean:
+ 	rm -f $(PACKAGE) $(OBJS) $(DEPS)
diff --git a/recipes/gpe-announce/gpe-announce_0.13.bb b/recipes/gpe-announce/gpe-announce_0.13.bb
index 6ffe317..21538c4 100644
--- a/recipes/gpe-announce/gpe-announce_0.13.bb
+++ b/recipes/gpe-announce/gpe-announce_0.13.bb
@@ -4,4 +4,7 @@ DEPENDS = "libsoundgen libschedule gtk+ libgpewidget"
 LICENSE = "GPL"
 PR = "r1"
 
-SRC_URI += "file://fix-esound.diff;patch=1"
+SRC_URI += " \
+            file://fix-esound.diff;patch=1 \
+            file://fix-install.diff;patch=1 \
+           "
-- 
1.6.1



