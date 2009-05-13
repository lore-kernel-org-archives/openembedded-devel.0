Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M4B2b-0006OE-V0
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 11:46:21 +0200
Received: by mail-ew0-f172.google.com with SMTP id 20so593886ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 02:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=b+UZdh1DM/npwAIenSGNUINuwlGwjkR6yqKCQd3U87U=;
	b=qw+j+H/wfOR51sygb88XZQ7YFUj5ldItoAT5gma6Of8gwRNHGagmxkdPdo5HxP0SNr
	0Red2MJbQkUrwI8VJnR/+4i5q6xi+SIo7ABPH/KMvuW/XjeBfZgG1ybPhtZbc9eoxjO5
	oi9kb85KkjQwizgDxw5u2euLoiZMBn71xKXZU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=L/wBpuDSSJ/YaE9Q4Byu5Dkm2vM41GqxuTivFRgnaYOkQFj07wnOOcjIR9qZMuql45
	31COGBOHlpcneLfwXZAM1tJrEQaZM8eCBOPr9m7/fkz4qRhQWHIAHWbqgCVuciTBlMq1
	1LVE6yBe4frIyjSszMGexPkBPCNlaec9Sd5Q8=
Received: by 10.210.60.3 with SMTP id i3mr8055863eba.87.1242207579303;
	Wed, 13 May 2009 02:39:39 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 7sm2189372eyb.25.2009.05.13.02.39.38
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 May 2009 02:39:38 -0700 (PDT)
From: koen.kooi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 11:38:49 +0200
Message-Id: <1242207556-15601-11-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
In-Reply-To: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
Subject: [STABLE][PATCH 10/37] gpe-confd: Makefile fix - don't strip on install
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
X-List-Received-Date: Wed, 13 May 2009 09:46:22 -0000

From: Andrea Adami <andrea.adami@gmail.com>

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/gpe-confd/files/makefile-fix.patch |   11 +++++++++++
 recipes/gpe-confd/gpe-confd_0.16.bb        |    1 +
 2 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 recipes/gpe-confd/files/makefile-fix.patch

diff --git a/recipes/gpe-confd/files/makefile-fix.patch b/recipes/gpe-confd/files/makefile-fix.patch
new file mode 100644
index 0000000..ac3483e
--- /dev/null
+++ b/recipes/gpe-confd/files/makefile-fix.patch
@@ -0,0 +1,11 @@
+--- /tmp/Makefile.old	2004-08-29 13:59:52.000000000 +0200
++++ gpe-confd-0.16/Makefile	2009-05-01 15:33:00.000000000 +0200
+@@ -32,7 +32,7 @@
+ 
+ install-program: $(PACKAGE)
+ 	install -d $(DESTDIR)$(PREFIX)/bin
+-	install -s $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
++	install $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
+ 	mkdir -p $(DESTDIR)/etc/X11/Xsession.d
+ 	install $(PACKAGE).xs $(DESTDIR)/etc/X11/Xsession.d/70gpe-confd
+ 
diff --git a/recipes/gpe-confd/gpe-confd_0.16.bb b/recipes/gpe-confd/gpe-confd_0.16.bb
index b9c3102..6b50107 100644
--- a/recipes/gpe-confd/gpe-confd_0.16.bb
+++ b/recipes/gpe-confd/gpe-confd_0.16.bb
@@ -6,3 +6,4 @@ DESCRIPTION = "GPE configuration daemon"
 LICENSE = "GPL"
 PR = "r1"
 
+SRC_URI += "file://makefile-fix.patch;patch=1"
-- 
1.6.1



