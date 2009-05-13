Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M4B2d-0006OF-Ot
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 11:46:23 +0200
Received: by mail-ew0-f172.google.com with SMTP id 20so593907ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 02:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=nlYt8TPAQ6zY/Zr25zh5IdxtnW5xJRMYsipaICshPbU=;
	b=rNa8JxObhFCD7XlM7Ek+ztXZBq2FcA3QxIyzy0XsfXKBQxv0XsfED9FJDjAXX8iVQu
	2CAo+xwXkuLOEBQd63vB3lefqHuQC75RZY4XRERwoUJrH3Vc+0C/5BxGj9WlnRA2d7vZ
	x6XzqKkfAx8UQffCQr8OUuPfeXfKugJ+jKQ/s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ZQ0g1kN9h7i9pJOIcKnxeDI9u/I2ifLxJwlRB3G/pGQ9e+CT3o+PktOlA0SAZ1KcpO
	SaoQpYes5hY0HIjPvlTGeQculYxavCZJpTnfzxCZ9QqmjnnQe8l5Hw7w2c1BGBa//rQ/
	xlN9n0B3AUMzau6uQH2ndJdLxiaujHh0dI5wY=
Received: by 10.210.86.10 with SMTP id j10mr8119247ebb.67.1242207581300;
	Wed, 13 May 2009 02:39:41 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 10sm2185205eyd.42.2009.05.13.02.39.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 May 2009 02:39:40 -0700 (PDT)
From: koen.kooi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 11:38:50 +0200
Message-Id: <1242207556-15601-12-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
In-Reply-To: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
Subject: [STABLE][PATCH 11/37] xst: Makefile fix - don't strip on install
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
X-List-Received-Date: Wed, 13 May 2009 09:46:23 -0000

From: Andrea Adami <andrea.adami@gmail.com>

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/xst/files/makefile-fix.patch |   11 +++++++++++
 recipes/xst/xst_0.15.bb              |    2 ++
 2 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 recipes/xst/files/makefile-fix.patch

diff --git a/recipes/xst/files/makefile-fix.patch b/recipes/xst/files/makefile-fix.patch
new file mode 100644
index 0000000..3af2d57
--- /dev/null
+++ b/recipes/xst/files/makefile-fix.patch
@@ -0,0 +1,11 @@
+--- /tmp/Makefile.old	2005-08-27 01:13:47.000000000 +0200
++++ xst-0.15/Makefile	2009-05-01 15:48:15.000000000 +0200
+@@ -32,7 +32,7 @@
+ 
+ install-program: $(PACKAGE)
+ 	mkdir -p $(DESTDIR)$(PREFIX)/bin
+-	install -s $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
++	install $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
+ 
+ clean:
+ 	rm -f $(PACKAGE) $(OBJS) $(DEPS)
diff --git a/recipes/xst/xst_0.15.bb b/recipes/xst/xst_0.15.bb
index 76ab7af..6d6156e 100644
--- a/recipes/xst/xst_0.15.bb
+++ b/recipes/xst/xst_0.15.bb
@@ -5,3 +5,5 @@ SECTION = "gpe"
 DESCRIPTION = "GPE configuration utility"
 LICENSE = "GPL"
 SRC_URI = "${GPE_MIRROR}/${PN}-${PV}.tar.gz"
+
+SRC_URI += "file://makefile-fix.patch;patch=1"
-- 
1.6.1



