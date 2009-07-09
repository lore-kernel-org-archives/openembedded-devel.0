Received: from [209.85.220.207] (helo=mail-fx0-f207.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1MP14P-0006X2-Ln
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Jul 2009 23:22:21 +0200
Received: by fxm3 with SMTP id 3so408380fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jul 2009 14:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=5wLOYzJu+bL88ZsK4adKSrtKQ0K+O2bW2ucWqjJ+Sp8=;
	b=nFX3dUbGeU4rRMOhyZKIhQVRDb8Jt6Tp9mRIUvqrvGmE8WRcOknSFLyTLMGUPJYhaj
	55fI3ioIQBO+a1L9kt1m1tJcYlskc30fnFT5pd2gKYJx532zfCul/heuu01upTGxGXQb
	N52RH3t0F7GFE/K/30vr6j1gkF34ua6rchPog=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=FM6L1Gt0ALFj9W5ljeKrNIS3jnZqDl3jQAjqU5n478cArhq28XqbmgELLrDfCbWoYs
	URWZ86mjtOnjAQms+NDot6jjnADBjBPFXQdaNbp1Hyb7nblleQ9bwAoUSlNdWnbRun3c
	a+hguYApKdBo+3qmWv791JZSxYtZbEDdJkKFk=
Received: by 10.103.175.9 with SMTP id c9mr688964mup.3.1247173771806;
	Thu, 09 Jul 2009 14:09:31 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 25sm1530081mul.20.2009.07.09.14.09.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 09 Jul 2009 14:09:30 -0700 (PDT)
From: Koen Kooi <koen.kooi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Jul 2009 23:09:28 +0200
Message-Id: <1247173768-5707-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] julius: add 4.1.2 of julius speech recognizer
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
X-List-Received-Date: Thu, 09 Jul 2009 21:22:21 -0000

From: Koen Kooi <koen@openembedded.org>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 conf/checksums.ini             |    4 ++
 recipes/julius/julius_4.1.2.bb |   63 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+), 0 deletions(-)
 create mode 100644 recipes/julius/julius_4.1.2.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index bb1224c..152afb1 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -11338,6 +11338,10 @@ sha256=bc4f62cbac4716c2c1a25cf53b73343a03883964576d9dd590a9e4c7a70f465a
 md5=a746183ea41aebc27a0f771036f668e1
 sha256=1b8f50169bc2d827c6efe6bc98bbef2161f615219e4e8921e68227888fd50a9e
 
+[http://iij.dl.sourceforge.jp/julius/37582/julius-4.1.2.tar.gz]
+md5=886a114b391aa1992567019213efc63e
+sha256=542c7f1042679c8484dc2f5f5536ed0c79fa79b2b9dd6cf6881278a6fdb37a84
+
 [http://osdn.dl.sourceforge.jp/julius/37582/julius-4.1.2.tar.gz]
 md5=886a114b391aa1992567019213efc63e
 sha256=542c7f1042679c8484dc2f5f5536ed0c79fa79b2b9dd6cf6881278a6fdb37a84
diff --git a/recipes/julius/julius_4.1.2.bb b/recipes/julius/julius_4.1.2.bb
new file mode 100644
index 0000000..d528357
--- /dev/null
+++ b/recipes/julius/julius_4.1.2.bb
@@ -0,0 +1,63 @@
+DESCRIPTION = "Julius is a high-performance, two-pass large vocabulary continuous speech recognition (LVCSR) decoder software for speech-related researchers and developers."
+LICENSE = "julius"
+DEPENDS = "libsndfile1 flex zlib alsa-lib"
+
+SRC_URI = "http://iij.dl.sourceforge.jp/julius/37582/julius-${PV}.tar.gz"
+
+inherit autotools
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+EXTRA_OECONF = "--with-mictype=alsa --enable-julian"
+
+do_configure() {
+	libtoolize --force
+	gnu-configize
+	oe_runconf
+}
+
+do_install() {
+	export prefix=${D}${prefix}
+	export libdir=${D}${libdir}
+	export bindir=${D}${bindir}
+	export includedir=${D}${includedir}
+	export mandir=${D}${mandir}
+	export exec_prefix=${D}${exec_prefix}
+	export datadir=${D}${datadir}
+
+	for i in libsent libjulius julius mkbingram mkbinhmm adinrec adintool mkgshmm mkss jcontrol generate-ngram jclient-perl man ; do
+		sed -i -e s:\ /usr/bin:\ \$\{bindir\}:g  -e s:\ /usr/share:\ \$\{datadir\}:g ${S}/$i/Makefile	
+		cd ${S}/$i
+		oe_runmake -e install
+	done
+
+	for i in mkdfa/mkfa-1.44-flex mkdfa dfa_minimize generate accept_check nextword yomi2voca gram2sapixml dfa_determinize ; do
+		sed -i -e s:\ /usr/bin:\ \$\{bindir\}:g ${S}/gramtools/$i/Makefile
+		cd ${S}/gramtools/$i
+		oe_runmake -e install
+	done
+
+	for i in ${D}${bindir}/*.pl ; do
+		sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
+		echo sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i >> /tmp/k
+	done
+}
+
+do_stage() {
+    export libdir=${STAGING_LIBDIR}
+    export bindir=${STAGING_BINDIR}
+    export includedir=${STAGING_INCDIR}
+    export datadir=${STAGING_DATADIR}
+
+    for i in libsent libjulius julius mkbingram mkbinhmm adinrec adintool mkgshmm mkss jcontrol generate-ngram jclient-perl man ; do
+        sed -i -e s:\ /usr/bin:\ \$\{bindir\}:g  -e s:\ /usr/share:\ \$\{datadir\}:g ${S}/$i/Makefile
+        cd ${S}/$i
+        oe_runmake -e install
+    done
+
+    for i in mkdfa/mkfa-1.44-flex mkdfa dfa_minimize generate accept_check nextword yomi2voca gram2sapixml dfa_determinize ; do
+        sed -i -e s:\ /usr/bin:\ \$\{bindir\}:g ${S}/gramtools/$i/Makefile
+        cd ${S}/gramtools/$i
+        oe_runmake -e install
+    done
+}
-- 
1.6.1



