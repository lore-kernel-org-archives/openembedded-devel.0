Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PyUVA-0004jA-B0
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 20:29:24 +0100
Received: by gxk3 with SMTP id 3so537810gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Mar 2011 11:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=mmzdx3cPTKTz8HbDnyLj2vvVBN3wSwb1qX2ZKh+wsSs=;
	b=ndeSfhAQKNVcCYeviK222DTcp5UQlxGox+icD759U0oYhmnLC1LOPNq1MtUg+fbCvA
	uIR4YfthneOYgBnAbg7b/DSDqws+kr89jtbKyFXDyMJ/V3oMEKhgmlP5bkmfkZY8T1XZ
	/sWLQTU8ztQpIhLxCtAOcHEk6XpSNjjOhPTFc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=RhnlG6+rk6ptjuCd2OmiKWKCUMcxI543R3j8VHI/1GJgk66/HbOa3MtId6zLrFNGvI
	eP+RwXdvxy2soddLyCH6j0nXpp9AL1EEt6FjHBCal2KDEjtGLnzqGL4FW0ACXxxo2WpM
	gP8KbpowYOpvVXonkDkYZiWbxigxjGod92ZCk=
Received: by 10.90.149.16 with SMTP id w16mr1426335agd.138.1299958061811;
	Sat, 12 Mar 2011 11:27:41 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id c38sm4812832anc.38.2011.03.12.11.27.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 Mar 2011 11:27:40 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Mar 2011 19:27:12 +0000
Message-Id: <1299958038-25216-6-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1299958038-25216-1-git-send-email-otavio@ossystems.com.br>
References: <1299958038-25216-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 05/11] udev (165): move ConsoleKit support to udev-consolekit package
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
X-List-Received-Date: Sat, 12 Mar 2011 19:29:24 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/udev/udev_165.bb |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes/udev/udev_165.bb b/recipes/udev/udev_165.bb
index 63e62f1..9605cb3 100644
--- a/recipes/udev/udev_165.bb
+++ b/recipes/udev/udev_165.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "udev is a daemon which dynamically creates and removes device nod
 the hotplug package and requires a kernel not older than 2.6.12."
 LICENSE = "GPLv2+"
 
-PR = "r3"
+PR = "r4"
 
 # Untested
 DEFAULT_PREFERENCE = "-1"
@@ -71,7 +71,7 @@ EXTRA_OECONF += " --with-udev-prefix= \
 INITSCRIPT_NAME = "udev"
 INITSCRIPT_PARAMS = "start 03 S ."
 
-PACKAGES =+ "libudev libgudev udev-utils"
+PACKAGES =+ "libudev libgudev udev-utils udev-consolekit"
 
 FILES_libudev = "${base_libdir}/libudev.so.*"
 FILES_libgudev = "${base_libdir}/libgudev*.so.*"
@@ -84,7 +84,8 @@ FILES_${PN}-dbg += "${usrbindir}/.debug ${usrsbindir}/.debug"
 
 # udev installs binaries under $(udev_prefix)/lib/udev, even if ${libdir}
 # is ${prefix}/lib64
-FILES_${PN} += "/lib/udev* ${libdir}/ConsoleKit"
+FILES_${PN} += "/lib/udev*"
+FILES_${PN}-consokekit += "${libdir}/ConsoleKit"
 FILES_${PN}-dbg += "/lib/udev/.debug"
 
 RPROVIDES_udev_append = " udev-compat-wrapper"
-- 
1.7.2.3



