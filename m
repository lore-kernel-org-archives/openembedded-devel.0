Received: from mail-ea0-f169.google.com ([209.85.215.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UR0o9-0007Yr-3Q
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 15:48:52 +0200
Received: by mail-ea0-f169.google.com with SMTP id n15so1562115ead.14
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 06:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=L+cryEkyuoMoyoqSxrrxVS6QyK+NeD5mt6qTj8KI9KE=;
	b=gNGLajL0VBBOyp4F0xahbIbg611S/nT5u+aZ7IQlyEkdE4Q/TOSWFIjmJoEorqjggZ
	QboOHCZmHMb8Qux5UJDUXGe6q3vRCSfA6xvnumBDrSQCIHFgDrKHD6b0MN0wO3MxVlGq
	5emQrPaEu0uAEmtVZFEBPZZR26wqR28n+0+7sriPyahQNzEnSTqMPKQTDKKWTBBsiP1A
	tWZZEK+FKSztvRHNBAZdUPnBnnE2f02OWkHildhep8WoeN/gK3N4KM5gObRgAmhbamNY
	aelv55ILelEo0AoSgAjoIgbmBKmKFSJQ35rHOMKSToewCPlrnWYFJibx3VJIbpKSk3D6
	Xq5Q==
X-Received: by 10.15.24.71 with SMTP id i47mr28317906eeu.0.1365859831480;
	Sat, 13 Apr 2013 06:30:31 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id s47sm16446891eeg.8.2013.04.13.06.30.30
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 06:30:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 15:29:48 +0200
Message-Id: <1365859790-20947-31-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 31/33] polkit: move systemd support from meta-systemd back to meta-oe
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
X-List-Received-Date: Sat, 13 Apr 2013 13:49:24 -0000

* POLKITAUTH isn't used anymore PACKAGECONFIG should select right version for systemd now

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/polkit/polkit_0.104.bb                    | 3 +--
 meta-systemd/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend | 3 ---
 2 files changed, 1 insertion(+), 5 deletions(-)
 delete mode 100644 meta-systemd/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend

diff --git a/meta-oe/recipes-extended/polkit/polkit_0.104.bb b/meta-oe/recipes-extended/polkit/polkit_0.104.bb
index ab2547b..cc39654 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.104.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_0.104.bb
@@ -15,7 +15,7 @@ PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
 # there is no --enable/--disable option for consolekit and it's not picked by shlibs, so add it to RDEPENDS
 PACKAGECONFIG[consolekit] = ",,,consolekit"
 
-PR = "r9"
+PR = "r12"
 
 PAM_SRC_URI = "file://polkit-1_pam.patch"
 SRC_URI = "http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.gz \
@@ -41,4 +41,3 @@ FILES_${PN} += "${libdir}/${BPN}-1/extensions/*.so \
                 ${datadir}/dbus-1/system-services/*"
 FILES_${PN}-dbg += "${libdir}/${BPN}-1/extensions/.debug/*.so"
 FILES_${PN}-dev += "${libdir}/${BPN}-1/extensions/*.la "
-
diff --git a/meta-systemd/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend b/meta-systemd/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
deleted file mode 100644
index 7e1954f..0000000
--- a/meta-systemd/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-PRINC := "${@int(PRINC) + 2}"
-
-POLKITAUTH = "systemd"
-- 
1.8.1.5



