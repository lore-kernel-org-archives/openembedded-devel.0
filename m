Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M4B36-0006OE-6G
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 11:46:52 +0200
Received: by mail-ew0-f172.google.com with SMTP id 20so593886ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 02:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=jdZDQatrAc/AxRwQTzd9EvCrw3NRcZXXNCUhkOd4eTA=;
	b=vcBm32P5QE3h10gmzRF9Os88aUQx1+BcnqZRKwjd9oCMRGExYyJuYYeD1YLG55PR7D
	MgLcWGFwG2WQgPC6MLGEZN/jwJSINo+uAsvDXXkVohLqbM1a68iLRnZOwH3tGRVZSMPw
	ZfI0C3AmyD2eLreq8RgMCemHSpkBoLM62O7Xg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=dRSihCUU6zyHkGJNrQnmUSOtFLpWxxCVB2aEEnp5vs0ENDjFsfwTPmJyx+xmiKegbT
	CflGRJtdbptb2zzztEjYYqDMofJPHGwUIAPOfT2eF9f1QWso+SBYD81/3LZZtUlufLf8
	COWoT/esIQ5z9x+MQigzDBYANN36NSdZtSljw=
Received: by 10.211.199.13 with SMTP id b13mr6134202ebq.88.1242207609501;
	Wed, 13 May 2009 02:40:09 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 5sm1015538eyh.40.2009.05.13.02.40.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 May 2009 02:40:08 -0700 (PDT)
From: koen.kooi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 11:38:57 +0200
Message-Id: <1242207556-15601-19-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
In-Reply-To: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
Subject: [STABLE][PATCH 18/37] gpe-soundserver: Makefile fix - don't strip on install
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
X-List-Received-Date: Wed, 13 May 2009 09:46:52 -0000

From: Andrea Adami <andrea.adami@gmail.com>

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/gpe-soundserver/files/makefile-fix.patch |   13 +++++++++++++
 recipes/gpe-soundserver/gpe-soundserver_0.4-1.bb |    3 ++-
 2 files changed, 15 insertions(+), 1 deletions(-)
 create mode 100644 recipes/gpe-soundserver/files/makefile-fix.patch

diff --git a/recipes/gpe-soundserver/files/makefile-fix.patch b/recipes/gpe-soundserver/files/makefile-fix.patch
new file mode 100644
index 0000000..c150886
--- /dev/null
+++ b/recipes/gpe-soundserver/files/makefile-fix.patch
@@ -0,0 +1,13 @@
+--- /tmp/Makefile.old	2004-08-18 16:28:08.000000000 +0200
++++ gpe-soundserver-0.4-1/Makefile	2009-05-01 22:44:27.000000000 +0200
+@@ -37,8 +37,8 @@
+ 
+ install-program: all
+ 	install -d $(DESTDIR)$(PREFIX)/bin
+-	install -s $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
+-	install -s wrapesd $(DESTDIR)$(PREFIX)/bin/wrapesd
++	install $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
++	install wrapesd $(DESTDIR)$(PREFIX)/bin/wrapesd
+ 	install -d $(DESTDIR)/etc/X11/Xsession.d
+ 	install $(PACKAGE).xsession $(DESTDIR)/etc/X11/Xsession.d/50sound-server
+ 
diff --git a/recipes/gpe-soundserver/gpe-soundserver_0.4-1.bb b/recipes/gpe-soundserver/gpe-soundserver_0.4-1.bb
index e239f21..1ec4cf3 100644
--- a/recipes/gpe-soundserver/gpe-soundserver_0.4-1.bb
+++ b/recipes/gpe-soundserver/gpe-soundserver_0.4-1.bb
@@ -4,4 +4,5 @@ inherit gpe
 
 DEPENDS = "virtual/libx11 esound"
 
-SRC_URI += "file://makefile-breakage.patch;patch=1"
+SRC_URI += "file://makefile-breakage.patch;patch=1 \
+	    file://makefile-fix.patch;patch=1"
-- 
1.6.1



