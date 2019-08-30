Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9E3B06C3E1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2019 02:30:46 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id go14so2580483plb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 19:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tzgtmFpdcsE4TCrH8XaINLMb/Io4ZA0UF23fLow0zBk=;
	b=UkGcYiWkdA3DycA+QO7+m8JlGntU5CkleJWSU4E8vCbyYSJoq6yd4q/bpeu9zIq1E+
	qzouk5lw9VFz6PtbBudvd63m4WunqRrEAhDBkCfzoMaHQpmqHA9cpKBfIBxLIKgyO94c
	vtM7bRfdKi0rryQeY2abiakrR/7PVcJ5GlJHLq7hxjkG1pOkJetgSPRO8v5tUP7Z3pVb
	GDHDtDEkltVlNy3uKJwxnz6yre6FGNtTuhq0rNULqg0mE5r0p/PhzoKf70YTKqzE1fw4
	vJhcBNGnbDRQan3KnCj36ty8EROyOieuk0B/dXJyzwVdICrTki9/l7K+s2Suc084EYMz
	gQIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tzgtmFpdcsE4TCrH8XaINLMb/Io4ZA0UF23fLow0zBk=;
	b=Eq8DGiS5oBWmXQV/oZPMiUbM5R8QftWQCwZ52yhBoFD2CpjgNnFSbzEP84i0fw9Lji
	hK1PSum4XurcsaPrd2tJp92DdznH0AHv0Z2pcw5Y1X9/HNRRIcMBOpq7LqMQft23Gs5t
	Y+kqzYOPvvZd6WU15pYGvEgrOGL9SBqR9xTDjV5ztNKwQhGE6GFykb4r9vKh2MVBjt54
	4w6GdYHJLfhRNtFgo2Ge2aY47UVapAOg0Rt7s2ZXq28bKVAZp81qrL5Z3JShwxQwghZe
	+RvrjWW8o6nXL0QO85akbxeWCV04JkGy28sZDTc35ul1S4YjpeOuqqiYnq+xzDBra6JL
	PjYA==
X-Gm-Message-State: APjAAAXDo2TQb0Pjq4/gY1ikCkLyppfJB7Sx7fAElP66emfyBmmFUqpx
	XRrcN+xMyczNYazgvRi5JwGxRLev
X-Google-Smtp-Source: APXvYqzrTTdFpSNEAEEdFrlXf1ZiZP7mEdK1EJ5PlSDkgelYGF/z2TN/YGDcN0JIyjanatlNEtEKCQ==
X-Received: by 2002:a17:902:9b90:: with SMTP id
	y16mr13107279plp.17.1567132247210; 
	Thu, 29 Aug 2019 19:30:47 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:90d2:579e:19f:13b1])
	by smtp.gmail.com with ESMTPSA id
	d14sm3731425pjx.17.2019.08.29.19.30.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 Aug 2019 19:30:46 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2019 19:30:39 -0700
Message-Id: <1567132240-27573-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567132240-27573-1-git-send-email-akuster808@gmail.com>
References: <1567132240-27573-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [[meta-webserver][thud] 4/5] apache2: add back patch for set perlbin
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
X-List-Received-Date: Fri, 30 Aug 2019 02:30:46 -0000

From: Changqing Li <changqing.li@windriver.com>

Add back this patch. Without this patch, apxs's shebang will use
perl under hosttools, which can be too long for shebang, and cause
error:
bad interpreter: No such file or directory

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../apache2/apache2/apache-configure_perlbin.patch | 34 ++++++++++++++++++++++
 .../recipes-httpd/apache2/apache2_2.4.39.bb        |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2/apache-configure_perlbin.patch

diff --git a/meta-webserver/recipes-httpd/apache2/apache2/apache-configure_perlbin.patch b/meta-webserver/recipes-httpd/apache2/apache2/apache-configure_perlbin.patch
new file mode 100644
index 0000000..61669e3
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2/apache-configure_perlbin.patch
@@ -0,0 +1,34 @@
+From 5412077c398dec74321388fe6e593a44c4c80de6 Mon Sep 17 00:00:00 2001
+From: echo <fei.geng@windriver.com>
+Date: Tue, 28 Apr 2009 03:11:06 +0000
+Subject: [PATCH] Fix perl install directory to /usr/bin
+
+Upstream-Status: Inappropriate [configuration]
+
+Add back this patch. Without this patch, apxs's shebang will use
+perl under hosttools, which can be too long for shebang, and cause
+error:
+bad interpreter: No such file or directory
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+---
+ configure.in | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index d828512..be7bd25 100644
+--- a/configure.in
++++ b/configure.in
+@@ -855,10 +855,7 @@ AC_DEFINE_UNQUOTED(SERVER_CONFIG_FILE, "${rel_sysconfdir}/${progname}.conf",
+ AC_DEFINE_UNQUOTED(AP_TYPES_CONFIG_FILE, "${rel_sysconfdir}/mime.types",
+ 	[Location of the MIME types config file, relative to the Apache root directory])
+ 
+-perlbin=`$ac_aux_dir/PrintPath perl`
+-if test "x$perlbin" = "x"; then
+-    perlbin="/replace/with/path/to/perl/interpreter"
+-fi
++perlbin='/usr/bin/perl'
+ AC_SUBST(perlbin)
+ 
+ dnl If we are running on BSD/OS, we need to use the BSD .include syntax.
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb
index c6961ef..70dd1ab 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb
@@ -13,6 +13,7 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
            file://0005-replace-lynx-to-curl-in-apachectl-script.patch \
            file://0006-apache2-fix-the-race-issue-of-parallel-installation.patch \
            file://0007-apache2-allow-to-disable-selinux-support.patch \
+           file://apache-configure_perlbin.patch \
           "
 
 SRC_URI_append_class-target = " \
-- 
2.7.4


