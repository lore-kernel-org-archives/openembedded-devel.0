Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M4B3c-0006OE-Be
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 11:47:24 +0200
Received: by mail-ew0-f172.google.com with SMTP id 20so593886ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 02:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=xvqY+kDcRT1R8qxoLJ8Mf/aN1pzYW24kdyPHgFziXLU=;
	b=UB0ykmzcdXmfWRFnxDS3LUC3eWk6ZxAe5xNb4EVWcmIxMPrnJKXALMc6s43bfQYXMr
	VHFlS/e6/TFtWlV/bOxkXeykorpoMpEhYFYwXDATXOKQlNLdweJQKw0iBzdFKL/yldFG
	87wgrQ8y/4MOz6iuXYSMNQBUOGQA6kqeTL4ro=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=QX6cNLFNjYKBeStpqh/oWOSb0ZElq9bmdKordJh8sbkMXznoymjT5Fq3rlKPiYtg/N
	7OlmHf8OaCbP4I4lHHk38Unh9EUDzAKoyMnqqIHOBpJAJJhZ22FBq1fqGzymMBXG2Ro2
	30H/k75nRBOYW+/iWGQuRjXQVg5Xc4Liykb2A=
Received: by 10.210.35.5 with SMTP id i5mr910172ebi.92.1242207641877;
	Wed, 13 May 2009 02:40:41 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 7sm2194470eyg.7.2009.05.13.02.40.41
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 May 2009 02:40:41 -0700 (PDT)
From: koen.kooi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 11:39:13 +0200
Message-Id: <1242207556-15601-35-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
In-Reply-To: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
Subject: [STABLE][PATCH 34/37] startup-monitor: fix makefile - don't strip on install
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
X-List-Received-Date: Wed, 13 May 2009 10:54:10 -0000

From: Andrea Adami <andrea.adami@gmail.com>

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/startup-monitor/files/makefile-fix.patch  |   11 +++++++++++
 recipes/startup-monitor/startup-monitor_0.18-2.bb |    2 ++
 2 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 recipes/startup-monitor/files/makefile-fix.patch

diff --git a/recipes/startup-monitor/files/makefile-fix.patch b/recipes/startup-monitor/files/makefile-fix.patch
new file mode 100644
index 0000000..6d50c8f
--- /dev/null
+++ b/recipes/startup-monitor/files/makefile-fix.patch
@@ -0,0 +1,11 @@
+--- /tmp/Makefile.old	2006-01-16 13:40:16.000000000 +0100
++++ startup-monitor/Makefile	2009-05-09 23:08:22.000000000 +0200
+@@ -41,7 +41,7 @@
+ 
+ install-program: all
+ 	mkdir -p $(DESTDIR)$(PREFIX)/bin
+-	install -s $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
++	install $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
+ 	mkdir -p $(DESTDIR)/etc/X11/Xsession.d
+ 	install $(PACKAGE).xsession $(DESTDIR)/etc/X11/Xsession.d/70startup-monitor
+ 
diff --git a/recipes/startup-monitor/startup-monitor_0.18-2.bb b/recipes/startup-monitor/startup-monitor_0.18-2.bb
index 34e7656..38ec504 100644
--- a/recipes/startup-monitor/startup-monitor_0.18-2.bb
+++ b/recipes/startup-monitor/startup-monitor_0.18-2.bb
@@ -7,3 +7,5 @@ DEPENDS = "virtual/libx11 startup-notification glib-2.0 libmatchbox"
 inherit gpe pkgconfig
 
 #SRC_URI = "http://www.freedesktop.org/software/startup-notification/releases/${P}.tar.gz"
+
+SRC_URI += "file://makefile-fix.patch;patch=1"
-- 
1.6.1



