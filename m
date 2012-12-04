Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi8Y-00040y-MI
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:21:38 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1926936eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=OclUUzLYy1vDiGN4MHWJJaH8C+k8Ak+3qhYmyGMrlGs=;
	b=BPWdq6AURd2SslBYadYtZ81B3Fu2ZHqVT152lN/+hEqrXSp5Ks31TYvnlP4Vj9Uuhm
	+uHx/rkhvlKnJXxTSfEqOH1/tuPIgdwsrGCN5JZKC+UsCqH2VFr1Q466JH848CLNRMz+
	7sjnBM05iPrntRWYguzvypUfV+OEcKU1nA166YOmBcsx3BOd+j27DGLcm1jw7Zi4T3Lo
	5TTmnQO72gOu1tYFSaqjnezEPAnfTpLeIUBvTsBFSpTKNSX5UI5xYcTNVX3dGyT8HRTO
	0AAGy4ht8irPsMf0N4quWlv7GZdZtj/lm4jpNZscBrgyFLlk+sZeMVK8E4gpAZaU/vki
	gFgw==
Received: by 10.14.202.3 with SMTP id c3mr12259225eeo.4.1354586831102;
	Mon, 03 Dec 2012 18:07:11 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z8sm34814548eeo.11.2012.12.03.18.07.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:07:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:59:29 +0100
Message-Id: <2b3c19567190695aa071f7ac671f582454ab2096.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 56/58] util-linux: add meta-systemd bbappend for new version which installs uuidd.service and socket
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
X-List-Received-Date: Tue, 04 Dec 2012 02:30:25 -0000

* fixes:
util-linux-2.22.1: util-linux: Files/directories were installed but not shipped
  /lib/systemd
  /lib/systemd/system
  /lib/systemd/system/uuidd.socket
  /lib/systemd/system/uuidd.service

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../oe-core/recipes-core/util-linux/util-linux_2.22.1.bbappend    | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.22.1.bbappend

diff --git a/meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.22.1.bbappend b/meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.22.1.bbappend
new file mode 100644
index 0000000..809a554
--- /dev/null
+++ b/meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.22.1.bbappend
@@ -0,0 +1,8 @@
+inherit systemd
+
+PRINC := "${@int(PRINC) + 1}"
+
+SYSTEMD_UNITDIR = "${systemd_unitdir}/system"
+EXTRA_OECONF += "--enable-socket-activation --with-systemdsystemunitdir=${SYSTEMD_UNITDIR}"
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "uuidd.socket"
-- 
1.8.0



