Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Srbq3-0000fg-Ml
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jul 2012 23:31:19 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1625270wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2012 14:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=oUee9bzMc69ycFzXzySagYb+IsgibX4t0tq3ulD8D+E=;
	b=MlshlHaHf5MS5kiOAXwRCxa6HRZUFdec5+qj7Rttp1dSsZ6iO3ulmlXVG4ICp/kMyA
	HUwF/VmOtyKwtVLC3S3iLJHqEPDMrv8ZVaZ0i4jQSwKz9WutH1lD75yizwX9yfh2wEqe
	kcSRSvyThuo4wjgbC7NLt8fdwQzbLZVkxRtE6cGueaYXkUQNezADPL90VDwtGksHFyQe
	n7EDYqB7XoWVm/sd77tDvPWO3pkOmsMn+JnFe9GUChXS8UFdvulH7VWunKiAat0V6+Gr
	pXrTyquAWX1jWYWJLiXpmedDwXBmvm8fpYgHXc2M4SK4P5u1q2MpLJHkRySCqfcpjFQR
	9WRA==
Received: by 10.216.136.222 with SMTP id w72mr471333wei.119.1342646400931;
	Wed, 18 Jul 2012 14:20:00 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t7sm364645wix.6.2012.07.18.14.19.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jul 2012 14:20:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Jul 2012 23:19:16 +0200
Message-Id: <50da85d9d36e1fdf1ab638d303d933f5b2d2008f.1342645937.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1342645937.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1342645937.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][RFC 06/14] terminology: add recipe for terminal emulator
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
X-List-Received-Date: Wed, 18 Jul 2012 21:31:19 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/terminology_svn.bb |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 meta-efl/recipes-efl/e17/terminology_svn.bb

diff --git a/meta-efl/recipes-efl/e17/terminology_svn.bb b/meta-efl/recipes-efl/e17/terminology_svn.bb
new file mode 100644
index 0000000..2bb4f7c
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/terminology_svn.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Enlightenment Terminal Emulator"
+LICENSE = "MIT BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=03f6c2cf2bef233fadf7d0769f5bfda7"
+DEPENDS = "evas ecore edje elementary eina eet emotion"
+
+PV = "0.1.0+svnr${SRCPV}"
+SRCREV = "${EFL_SRCREV}"
+
+inherit e gettext
+SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
+S = "${WORKDIR}/${SRCNAME}"
+
+EXTRA_OECONF = "\
+  --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
+"
+
+FILES_${PN} += "\
+        ${datadir}/icons/terminology.png \
+"
-- 
1.7.8.6



