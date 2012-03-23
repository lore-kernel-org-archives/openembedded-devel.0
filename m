Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SB4JD-0002dA-1C
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Mar 2012 14:13:35 +0100
Received: by mail-wg0-f43.google.com with SMTP id dr12so1857378wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Mar 2012 06:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=a+z0ECMgEPswy92jV0yRuxh38nj+UcRpk5z656wIinc=;
	b=lhkxRX3nL/Pfn8BZzWjTr8kN+SDq85EuNLdVGZZOXyJ9JZFnnds2YF2Et2/V8o21xX
	RSVoXb8HDYkc754AkZm5w+WjmF5f+IVRT/FKageXMl/V0AByxafGDlTNN52MuPoEX4Kt
	EM8FlIBFfnzavMiRBiqL8lQoC9duQ5gQ8HTPPRJPXA61UWOFlA/PhBgsXX9iczaDwZ2t
	hJd6QjetfdU5qJ5jc8zR1nikUHFfiAzoEBeyushG3+Vz2pB2vplxoG0q6vvqXEtrY6kA
	oP/CsHRqIgX3PgIAvzg7p2/tgV560PohFcKvS8rkom8/8RpJHcUojevMOs4UzO+eoXeF
	gnmQ==
Received: by 10.180.78.225 with SMTP id e1mr6453551wix.0.1332507881260;
	Fri, 23 Mar 2012 06:04:41 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n8sm22758868wix.10.2012.03.23.06.04.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 06:04:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Mar 2012 14:04:13 +0100
Message-Id: <f8b56e72e3f667ff1c56f048da8541b307ad82b3.1332507730.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <3fca50b933c63bab6cff938db607bcecde86fd3d.1332507730.git.Martin.Jansa@gmail.com>
References: <3fca50b933c63bab6cff938db607bcecde86fd3d.1332507730.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1332507730.git.Martin.Jansa@gmail.com>
References: <cover.1332507730.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/5] kernel.bbclass: use symlinks for modutils files
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
X-List-Received-Date: Fri, 23 Mar 2012 13:13:35 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/classes/kernel.bbclass |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index d87b177..3636ff0 100644
--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -420,16 +420,14 @@ python populate_packages_prepend () {
 		# appropriate modprobe commands to the postinst
 		autoload = d.getVar('module_autoload_%s' % basename, True)
 		if autoload:
-			name = '%s/etc/modutils/%s' % (dvar, basename)
-			f = open(name, 'w')
-			for m in autoload.split():
-				f.write('%s\n' % m)
-			f.close()
 			name = '%s/etc/modules-load.d/%s.conf' % (dvar, basename)
 			f = open(name, 'w')
 			for m in autoload.split():
 				f.write('%s\n' % m)
 			f.close()
+			modutils_name = '%s/etc/modutils/%s' % (dvar, basename)
+			modutils_target = '../modules-load.d/%s.conf' % (basename)
+			os.symlink(modutils_target, modutils_name)
 			postinst = d.getVar('pkg_postinst_%s' % pkg, True)
 			if not postinst:
 				bb.fatal("pkg_postinst_%s not defined" % pkg)
-- 
1.7.8.5



