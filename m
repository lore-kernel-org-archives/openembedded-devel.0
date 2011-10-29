Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RK6Go-0006fd-FA
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Oct 2011 12:36:10 +0200
Received: by mail-fx0-f47.google.com with SMTP id s16so4799631faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Oct 2011 03:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=AFqJraIunEuXJlGytq2qhTGRIB2Pd1vJ0li5ZqT931g=;
	b=alEnFYi8SyUlIX6bfzKBsKUWtb7/AbfVS7jTyCe2fuBIzUlXl+upXBp0Q8H4wWRlii
	I6JGKn/L8BoeWhRx129DSgPd1G/UPjnzJq9Akrdu2D48Cc3VNvY+AK1t+9x8bbWytlSl
	Loc0WFj3OWXDsl/C2ODEeeysGwHTBt+Aci52U=
Received: by 10.223.85.139 with SMTP id o11mr13094664fal.0.1319884210391;
	Sat, 29 Oct 2011 03:30:10 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d22sm7493067fad.19.2011.10.29.03.30.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 29 Oct 2011 03:30:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 29 Oct 2011 12:29:04 +0200
Message-Id: <10e61d56dfc41e0b0a334ec248b20877a8ead600.1319884094.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
References: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1319884094.git.Martin.Jansa@gmail.com>
References: <cover.1319884094.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][meta-oe 08/12] elsa: add new login manager for Enlightenment
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
X-List-Received-Date: Sat, 29 Oct 2011 10:36:10 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/elsa_svn.bb |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 meta-efl/recipes-efl/efl/elsa_svn.bb

diff --git a/meta-efl/recipes-efl/efl/elsa_svn.bb b/meta-efl/recipes-efl/efl/elsa_svn.bb
new file mode 100644
index 0000000..59127d3
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
+#RDEPENDS_${PN} = "${PN}-themes"
-- 
1.7.7.1



