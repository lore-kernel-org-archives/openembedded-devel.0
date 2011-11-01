Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RL9oT-0008GO-Q5
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Nov 2011 09:35:17 +0100
Received: by mail-fx0-f47.google.com with SMTP id s16so6983168faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Nov 2011 01:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=TM7hq8vSDBji1yM+NPjvXVdfhbnNbcP19aHhDlAGAoE=;
	b=emiMIVYG1nNWDhvL1YudHwec8rlxG8qd3EW8WiI7jfjkB1NbOc4i3t+ZOXNioPUOG1
	lj2lzljOooTMVuJoBehsHh+wwTZ67qSn5Q16WgBY4V2CLzZE7mNd+2kptrSNP+2csq1A
	XW0TwT09rd3iVMKXVvk9mRrvV6c3cqMDSNQG0=
Received: by 10.223.75.150 with SMTP id y22mr6488193faj.29.1320136153898;
	Tue, 01 Nov 2011 01:29:13 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j5sm43335454faf.14.2011.11.01.01.29.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Nov 2011 01:29:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Nov 2011 09:27:45 +0100
Message-Id: <cdf0212e096691b27aceec9a91c8f8ba5c458d10.1320135926.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <58fda822fdf64f38e5d75e75c5cf4a196a37e47e.1320135926.git.Martin.Jansa@gmail.com>
References: <58fda822fdf64f38e5d75e75c5cf4a196a37e47e.1320135926.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1320135926.git.Martin.Jansa@gmail.com>
References: <cover.1320135926.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][meta-oe 11/15] elsa: add new login manager for Enlightenment
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
X-List-Received-Date: Tue, 01 Nov 2011 08:35:17 -0000

* version 0.0.4+${SRCPV}

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/elsa_svn.bb |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 meta-efl/recipes-efl/efl/elsa_svn.bb

diff --git a/meta-efl/recipes-efl/efl/elsa_svn.bb b/meta-efl/recipes-efl/efl/elsa_svn.bb
new file mode 100644
index 0000000..d0e5e81
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/elsa_svn.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Login manager for Enlightenment"
+DEPENDS = "efreet eina eet ecore elementary"
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+SECTION = "e/apps"
+
+inherit e gettext
+SRC_URI = "${E_SVN}/trunk/PROTO;module=${SRCNAME};proto=http;scmdata=keep"
+S = "${WORKDIR}/${SRCNAME}"
+
+EXTRA_OECONF = "--with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc"
+
+PV = "0.0.4+svnr${SRCPV}"
+SRCREV = "${EFL_SRCREV}"
+
+RDEPENDS_${PN} = "${PN}-themes"
-- 
1.7.7.1



