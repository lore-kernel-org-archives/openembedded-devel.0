Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0676577E4A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 16:45:11 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id z78so5373759lff.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 09:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=I0u3xYq7fUJGnPN+LQ4U4GOPquRIi/49ZK0aXssoVGQ=;
	b=c/FQpwu9cf8NBSn4gjFeqSV6dCq6oKnXxH6dQ0chvFAInd+OkyYNND6jy3nrn6jjky
	LkdbHSksqWhHTdakCOe3WmkJAWhwujoXx7TLi6n89nJS8G305MmeRekosCUxgwaOVMrt
	5B1MbUZ1cW7XXDnZifiuqqL46PNcIqYvVFUD8Aq351/4jBLVF+aeMydE1TaNcFvMDlqr
	82DgWg8SeYeJABdd2fmjVLEaXwXsQfbFmY4R3DxOJw0gIPsV/56ZLWxsZAHwI5cDxPha
	8YLal2uyFy+FKuyNoTc2j0WT+wRk3YqGQ+TZjfCABMtd6kXpV5yvWQZ7luhleY/y/LBx
	62rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=I0u3xYq7fUJGnPN+LQ4U4GOPquRIi/49ZK0aXssoVGQ=;
	b=uW1wsd1l+1vfK7oZypBjpaK7Y+5CvObsaHCZXWdNVnAZmHqeSdERBi776XA/HPvYRp
	PBL0c1tXtKqUP9CPEFqbqQMh4KSf/yZi7u8pOFs4ioSqtou/Ye7Z6tzcIe/4/pxeHHcE
	CaGcKwtS8N5X1WMqBAGtFshX8ewDDjnKS8zUEbkZFMmKLRdjaaQnmDl45NVtydzqFbYG
	+7jmhwzSsmhlHC/5oIztT6w/baBbJd784928j33Z+bsJX2yGTHrVHjZ8HxZqlhUiwpUD
	kp6m2YIVwrNfdEjdCAhJg1x2mk53+ZW+m44oaKhuApXvxk0qjb6C203hcvC9uM8XzqGt
	c3xQ==
X-Gm-Message-State: AIVw113PAjuj468fhD7QxgOqBFp4XRlPQUjJsWhtKrUtXVUeM7Lx0KoH
	98xkNTgzJZru2YhgcRg=
X-Received: by 10.80.176.102 with SMTP id i93mr3166561edd.116.1499791512366;
	Tue, 11 Jul 2017 09:45:12 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.203.112]) by smtp.gmail.com with ESMTPSA id
	p19sm1224952eda.15.2017.07.11.09.45.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Jul 2017 09:45:11 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jul 2017 18:44:33 +0200
Message-Id: <1499791478-2407-4-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1499791478-2407-1-git-send-email-liu.ming50@gmail.com>
References: <1499791478-2407-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-oe/meta-perl] [PATCH 3/8] libterm-readkey-perl: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Jul 2017 16:45:12 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Term::ReadKey - A perl module for simple terminal control.

It's being strongly recommended by po4a.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 .../libterm/libterm-readkey-perl_2.37.bb           | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.37.bb

diff --git a/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.37.bb b/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.37.bb
new file mode 100644
index 0000000..6b76682
--- /dev/null
+++ b/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.37.bb
@@ -0,0 +1,36 @@
+SUMMARY = "Term::ReadKey - A perl module for simple terminal control."
+DESCRIPTION = "Term::ReadKey is a compiled perl module dedicated to providing simple \
+control over terminal driver modes (cbreak, raw, cooked, etc.,) support \
+for non-blocking reads, if the architecture allows, and some generalized \
+handy functions for working with terminals. One of the main goals is to \
+have the functions as portable as possible, so you can just plug in "use \
+Term::ReadKey" on any architecture and have a good likelihood of it \
+working."
+HOMEPAGE = "http://search.cpan.org/~jstowe/TermReadKey-${PV}"
+SECTION = "libraries"
+
+LICENSE = "Artistic-1.0 | GPLv1+"
+LIC_FILES_CHKSUM = "file://README;md5=c275db663c8489a5709ebb22b185add5"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/J/JS/JSTOWE/TermReadKey-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "e8ea15c16333ac4f8d146d702e83cc0c"
+SRC_URI[sha256sum] = "4a9383cf2e0e0194668fe2bd546e894ffad41d556b41d2f2f577c8db682db241"
+
+S = "${WORKDIR}/TermReadKey-${PV}"
+
+# It needs depend on native to let dynamic loader use native modules
+# rather than target ones.
+DEPENDS = "libterm-readkey-perl-native"
+
+inherit cpan
+
+do_configure_append () {
+    # Hack the dynamic module loader so that it use native modules since it can't load
+    # the target ones.
+    if [ "${BUILD_SYS}" != "${HOST_SYS}" ]; then
+        sed -i -e "s#-I\$(INST_ARCHLIB)#-I${STAGING_BINDIR_NATIVE}/perl-native/perl/vendor_perl/${@get_perl_version(d)}#g" Makefile
+    fi
+}
+
+BBCLASSEXTEND = "native"
-- 
2.7.4


